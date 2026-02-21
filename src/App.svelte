<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";

  import Slide1 from "./slides/Slide1.svelte";
  import Slide2 from "./slides/Slide2.svelte";
  import Slide3 from "./slides/Slide3.svelte";
  import Slide4 from "./slides/Slide4.svelte";
  import Slide5 from "./slides/Slide5.svelte";
  import Slide6 from "./slides/Slide6.svelte";
  import Slide7 from "./slides/Slide7.svelte";
  import Slide8 from "./slides/Slide8.svelte";
  import Slide9 from "./slides/Slide9.svelte";
  import Slide11 from "./slides/Slide11.svelte";
  import Slide12 from "./slides/Slide12.svelte";
  import Slide15 from "./slides/Slide15.svelte";
  import Slide16 from "./slides/Slide16.svelte";
  import SlideIntro from "./slides/SlideIntro.svelte";

  const TOTAL = 14;
  let current = $state(0);
  let transitioning = $state(false);
  let globalBgUrl = $state("/images/tsushima_landscape.jpg");

  // Slide index to background image mapping
  const bgMap: Record<number, string> = {
    0: "/images/title.jpg",
    1: "/images/bg_slide2.jpg",
    2: "/images/bg_slide3.jpg",
    3: "/images/bg_slide4.jpg",
    4: "/images/bg_slide6.jpg", // Bentham
    5: "/images/bg_slide5.jpg", // Kant
    6: "/images/bg_slide7.jpg",
    7: "/images/bg_slide8.jpg",
    8: "/images/bg_slide9.jpg",
    // 9 was Slide 10 (Trolley)
    9: "/images/bg_slide11.jpg",
    10: "/images/bg_slide12.jpg",
    // 12 was Slide 13 (Arendt)
    11: "/images/bg_slide15.jpg",
    12: "/images/bg_slide16.jpg",
  };

  const slides = [
    Slide1,
    Slide2,
    SlideIntro,
    Slide3,
    Slide4,
    Slide6,
    Slide5,
    Slide7,
    Slide8,
    Slide9,
    Slide11,
    Slide12,
    Slide15,
    Slide16,
  ];

  function goTo(next: number) {
    if (transitioning || next < 0 || next >= TOTAL) return;
    transitioning = true;

    const outEl = document.querySelector(".slide-active") as HTMLElement;

    // Determine new background
    const newBg = bgMap[next] || "/images/tsushima_landscape.jpg";
    if (newBg !== globalBgUrl) {
      // Crossfade background using a temporary element or just GSAP
      const bgEl = document.querySelector(".global-bg") as HTMLElement;
      if (bgEl) {
        gsap.to(bgEl, {
          opacity: 0,
          duration: 0.3,
          onComplete: () => {
            globalBgUrl = newBg;
            gsap.to(bgEl, { opacity: 0.12, duration: 0.8 }); // fade back in
            // Restart background scale animation
            gsap.killTweensOf(bgEl, "scale");
            gsap.fromTo(
              bgEl,
              { scale: 1 },
              {
                scale: 1.05,
                duration: 30,
                ease: "none",
                repeat: -1,
                yoyo: true,
              },
            );
          },
        });
      } else {
        globalBgUrl = newBg;
      }
    }

    if (outEl) {
      gsap.to(outEl, {
        opacity: 0,
        duration: 0.35,
        ease: "power2.in",
        onComplete: () => {
          current = next;
          transitioning = false;
        },
      });
    } else {
      current = next;
      transitioning = false;
    }
  }

  function toggleFullscreen() {
    if (!document.fullscreenElement) {
      document.documentElement.requestFullscreen().catch(() => {});
    } else {
      document.exitFullscreen().catch(() => {});
    }
  }

  function next() {
    goTo(current + 1);
  }
  function prev() {
    goTo(current - 1);
  }

  function handleKey(e: KeyboardEvent) {
    if (e.key === "ArrowRight" || e.key === "ArrowDown" || e.key === " ") {
      e.preventDefault();
      next();
    }
    if (e.key === "ArrowLeft" || e.key === "ArrowUp") {
      e.preventDefault();
      prev();
    }
    if (e.key === "f" || e.key === "F") {
      e.preventDefault();
      toggleFullscreen();
    }
  }

  onMount(() => {
    window.addEventListener("keydown", handleKey);

    // Initial bg animation
    const bgEl = document.querySelector(".global-bg") as HTMLElement;
    if (bgEl) {
      gsap.fromTo(
        bgEl,
        { scale: 1 },
        { scale: 1.05, duration: 30, ease: "none", repeat: -1, yoyo: true },
      );
    }

    return () => window.removeEventListener("keydown", handleKey);
  });
</script>

<!-- Global Background -->
<div class="global-bg-container">
  <img src={globalBgUrl} alt="Background" class="global-bg" />
</div>

<!-- Progress bar -->
<div class="progress-bar">
  <div
    class="progress-fill"
    style="width: {((current + 1) / TOTAL) * 100}%"
  ></div>
</div>

<!-- Progress dots -->
<nav class="progress-dots">
  {#each slides as _, i}
    <button
      class="dot"
      class:active={i === current}
      onclick={() => goTo(i)}
      aria-label={`スライド ${i + 1}`}
    ></button>
  {/each}
</nav>

<!-- Slide area -->
<main class="stage" onclick={next}>
  {#key current}
    {@const SlideComp = slides[current]}
    <div class="slide-active">
      <SlideComp />
    </div>
  {/key}
</main>

<!-- Arrow controls -->
<button
  class="arrow arrow-left"
  onclick={(e) => {
    e.stopPropagation();
    prev();
  }}
  disabled={current === 0}>&#8592;</button
>
<button
  class="arrow arrow-right"
  onclick={(e) => {
    e.stopPropagation();
    next();
  }}
  disabled={current === TOTAL - 1}>&#8594;</button
>

<!-- Slide counter -->
<div class="counter">{current + 1} / {TOTAL}</div>

<style>
  :global(.slide) {
    background: transparent !important;
  }

  .global-bg-container {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    z-index: -1;
    background: #09070a; /* Fallback base color */
    overflow: hidden;
  }

  .global-bg {
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0.12;
    filter: grayscale(40%) sepia(20%);
    transform-origin: center;
  }

  .stage {
    width: 100%;
    height: 100%;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }

  .slide-active {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
  }

  /* Top progress bar */
  .progress-bar {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: rgba(201, 168, 76, 0.15);
    z-index: 200;
  }

  .progress-fill {
    height: 100%;
    background: linear-gradient(to right, #8b1a1a, #c9a84c);
    transition: width 0.4s ease;
  }

  /* Bottom dots */
  .progress-dots {
    position: fixed;
    bottom: 1.5rem;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 0.45rem;
    z-index: 100;
    flex-wrap: wrap;
    justify-content: center;
    max-width: 90vw;
  }

  .dot {
    width: 6px;
    height: 6px;
    border-radius: 50%;
    background: rgba(201, 168, 76, 0.25);
    border: 1px solid rgba(201, 168, 76, 0.5);
    cursor: pointer;
    transition: all 0.3s ease;
    padding: 0;
  }

  .dot.active {
    background: #c9a84c;
    box-shadow: 0 0 6px #c9a84c;
    transform: scale(1.4);
  }

  /* Arrows */
  .arrow {
    position: fixed;
    top: 50%;
    transform: translateY(-50%);
    background: transparent;
    border: 1px solid rgba(201, 168, 76, 0.2);
    color: rgba(201, 168, 76, 0.5);
    font-size: 1.2rem;
    padding: 0.7rem 0.9rem;
    cursor: pointer;
    z-index: 100;
    transition: all 0.25s ease;
  }

  .arrow:hover:not(:disabled) {
    border-color: #c9a84c;
    color: #c9a84c;
    background: rgba(201, 168, 76, 0.08);
  }

  .arrow:disabled {
    opacity: 0.1;
    cursor: default;
  }
  .arrow-left {
    left: 0.8rem;
  }
  .arrow-right {
    right: 0.8rem;
  }

  .counter {
    position: fixed;
    top: 0.8rem;
    right: 1.2rem;
    font-size: 0.72rem;
    color: rgba(201, 168, 76, 0.45);
    font-family: "Noto Sans JP", sans-serif;
    letter-spacing: 0.1em;
    z-index: 200;
  }

  /* iPad / tablet touch-friendly adjustments */
  @media (max-width: 1366px) {
    .dot {
      width: 8px;
      height: 8px;
    }
    .arrow {
      font-size: 1rem;
      padding: 0.6rem 0.8rem;
    }
    .progress-dots {
      gap: 0.5rem;
      bottom: 1.2rem;
    }
  }
  @media (max-width: 1024px) {
    .dot {
      width: 10px;
      height: 10px;
    }
    .dot.active {
      transform: scale(1.3);
    }
    .arrow {
      font-size: 0.9rem;
      padding: 0.5rem 0.7rem;
    }
    .arrow-left {
      left: 0.5rem;
    }
    .arrow-right {
      right: 0.5rem;
    }
    .progress-dots {
      gap: 0.4rem;
      bottom: 1rem;
    }
  }
</style>
