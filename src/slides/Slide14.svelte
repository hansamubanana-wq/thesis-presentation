<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(
      ".s14-head",
      { opacity: 0, y: 25 },
      { opacity: 1, y: 0, duration: 1, ease: "power3.out", delay: 0.2 },
    );
    gsap.fromTo(
      ".s14-mask",
      { opacity: 0, rotation: -20, scale: 0.7 },
      {
        opacity: 1,
        rotation: 0,
        scale: 1,
        duration: 1.2,
        ease: "elastic.out(1,0.7)",
        delay: 0.8,
      },
    );
    gsap.fromTo(
      ".s14-item",
      { opacity: 0, x: 40 },
      {
        opacity: 1,
        x: 0,
        duration: 0.6,
        stagger: 0.2,
        ease: "power2.out",
        delay: 1.3,
      },
    );
    gsap.to(".s14-mask", {
      filter: "drop-shadow(0 0 30px rgba(139,26,26,0.9))",
      repeat: -1,
      yoyo: true,
      duration: 2,
      ease: "sine.inOut",
      delay: 2.5,
    });
  });
</script>

<div class="slide">
  <div class="dark-glow"></div>

  <!-- Left Side Background Image -->
  <div class="bg-image-container">
    <img
      src="/images/ghost.jpg"
      alt="冥人・境井仁"
      class="bg-portrait"
      onerror={(e) => ((e.target as HTMLElement).style.display = "none")}
    />
    <div class="bg-gradient-fade"></div>
  </div>

  <div class="content-wrapper">
    <p class="s14-label">考察②：必要悪の代償</p>
    <h2 class="s14-head">
      たとえ<span class="gold">必要悪</span>でも<br />
      <span class="red">悪は悪である</span>
    </h2>
    <div class="main">
      <div class="left-icon">
        <div class="s14-mask">冥</div>
      </div>
      <div class="cost-list">
        <div class="s14-item">
          <span class="x">✗</span><span>武士の身分を剥奪</span>
        </div>
        <div class="s14-item">
          <span class="x">✗</span><span>家を失う</span>
        </div>
        <div class="s14-item">
          <span class="x">✗</span><span>志村との決別</span>
        </div>
        <div class="s14-item">
          <span class="x">✗</span><span>永遠の孤独</span>
        </div>
      </div>
    </div>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    background: #09070a;
    display: flex;
    align-items: center;
    justify-content: flex-end; /* Align content to the right */
    position: relative;
    overflow: hidden;
    font-family: "Noto Serif JP", serif;
    color: #f5f0e8;
  }

  /* Background Image Styling */
  .bg-image-container {
    position: absolute;
    top: 0;
    left: 0;
    width: 55%; /* Covers left half + a bit */
    height: 100%;
    z-index: 1;
  }
  .bg-portrait {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center 20%;
    filter: grayscale(40%) contrast(1.1) brightness(0.8);
    opacity: 0.85;
  }
  .bg-gradient-fade {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    /* Fades from transparent on the left to solid dark background color on the right */
    background: linear-gradient(
      to right,
      transparent 0%,
      transparent 40%,
      #09070a 95%,
      #09070a 100%
    );
  }

  .dark-glow {
    position: absolute;
    inset: 0;
    background: radial-gradient(
      ellipse at 70% 50%,
      /* Moved glow to the right side where text is */ rgba(139, 26, 26, 0.07)
        0%,
      transparent 60%
    );
    pointer-events: none;
    z-index: 2;
  }

  .content-wrapper {
    position: relative;
    z-index: 3;
    width: 55%; /* Prevents text from stretching across the entire screen */
    padding-right: 5%;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
  }

  .s14-label {
    font-size: clamp(0.9rem, 1.6vw, 1.2rem);
    letter-spacing: 0.2em;
    color: rgba(245, 240, 232, 0.4);
    margin-bottom: 1rem;
    align-self: center;
  }
  .s14-head {
    font-size: clamp(2.5rem, 5vw, 4.5rem);
    font-weight: 900;
    text-align: left;
    line-height: 1.3;
    margin-bottom: 2.5rem;
    align-self: center;
    text-align: center;
  }
  .gold {
    color: #c9a84c;
  }
  .red {
    color: #c0504d;
  }
  .main {
    display: flex;
    align-items: center;
    gap: 3rem;
    align-self: center;
  }
  .left-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
  }
  .s14-mask {
    font-size: clamp(4.5rem, 8vw, 7rem);
    font-weight: 900;
    color: #c0504d;
    line-height: 1;
    filter: drop-shadow(0 0 12px rgba(139, 26, 26, 0.5));
  }
  .cost-list {
    display: flex;
    flex-direction: column;
    gap: 1.2rem;
  }
  .s14-item {
    display: flex;
    align-items: center;
    gap: 1.2rem;
    font-size: clamp(1.3rem, 2.5vw, 2rem);
    font-weight: 700;
  }
  .x {
    color: #c0504d;
    font-weight: 900;
    font-size: 1.2em;
  }

  @media (max-width: 1366px) {
    .bg-image-container {
      width: 50%;
    }
    .content-wrapper {
      width: 60%;
    }
    .s14-head {
      font-size: clamp(2.2rem, 4vw, 3.5rem);
      margin-bottom: 2rem;
    }
    .main {
      gap: 2.5rem;
    }
    .s14-mask {
      font-size: clamp(3.5rem, 6.5vw, 5.5rem);
    }
    .s14-item {
      font-size: clamp(1.1rem, 2.2vw, 1.6rem);
      gap: 1rem;
    }
    .cost-list {
      gap: 1rem;
    }
  }
  @media (max-width: 1024px) {
    .bg-image-container {
      width: 100%;
      height: 40%; /* Top area on mobile */
    }
    .bg-gradient-fade {
      /* Fade vertically on smaller screens */
      background: linear-gradient(
        to bottom,
        transparent 0%,
        transparent 40%,
        #09070a 95%,
        #09070a 100%
      );
    }
    .slide {
      flex-direction: column;
      justify-content: flex-end;
    }
    .content-wrapper {
      width: 100%;
      height: 60%;
      padding: 0 5%;
      justify-content: center;
    }
    .s14-label {
      margin-bottom: 0.6rem;
    }
    .s14-head {
      font-size: clamp(1.8rem, 4vw, 2.8rem);
      margin-bottom: 1.5rem;
    }
    .main {
      gap: 1.5rem;
      flex-direction: column;
    }
    .s14-mask {
      font-size: clamp(2.5rem, 5vw, 4rem);
      display: none; /* Hide icon on small screen to save space */
    }
    .s14-item {
      font-size: clamp(1rem, 2vw, 1.3rem);
      gap: 0.8rem;
    }
    .cost-list {
      gap: 0.8rem;
    }
  }
</style>
