<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    // Cinematic background pan
    gsap.fromTo(
      ".bg-photo",
      { scale: 1.05, x: 0, opacity: 0 },
      { scale: 1.15, x: -30, opacity: 0.35, duration: 15, ease: "power1.out" },
    );

    gsap.fromTo(
      ".s1-tag",
      { opacity: 0 },
      { opacity: 1, duration: 0.8, delay: 0.5 },
    );

    // Dramatic text reveal (slower, staggered blur)
    gsap.fromTo(
      ".s1-title",
      { opacity: 0, y: 40, filter: "blur(20px)" },
      {
        opacity: 1,
        y: 0,
        filter: "blur(0px)",
        duration: 2,
        ease: "power3.out",
        delay: 1,
      },
    );
    gsap.fromTo(
      ".s1-quote",
      { opacity: 0, x: -30 },
      { opacity: 1, x: 0, duration: 1.2, ease: "power2.out", delay: 2.5 },
    );
    gsap.fromTo(
      ".s1-name",
      { opacity: 0 },
      { opacity: 1, duration: 1, delay: 3.5 },
    );
    gsap.to(".s1-title", {
      textShadow: "0 0 80px rgba(139,26,26,0.8)",
      repeat: -1,
      yoyo: true,
      duration: 3,
      ease: "sine.inOut",
      delay: 4,
    });

    // Enhanced Ember Particles
    gsap.to(".particle", {
      y: () => -(Math.random() * 400 + 200), // Drift higher
      x: () => Math.random() * 200 - 50, // Drift diagonally (wind effect)
      opacity: 0,
      scale: () => Math.random() * 1.5 + 0.5,
      duration: () => Math.random() * 5 + 3,
      stagger: {
        each: 0.15,
        repeat: -1,
      },
      ease: "power1.out",
    });
  });
</script>

<div class="slide">
  <!-- 3840×2160 full-bleed background -->
  <div class="bg-wrapper">
    <img
      src="/images/title.jpg"
      alt=""
      class="bg-photo"
      onerror={(e) => ((e.target as HTMLElement).style.display = "none")}
    />
  </div>
  <div class="overlay"></div>
  <div class="particles">
    {#each Array(18) as _, i}<span
        class="particle"
        style="left:{4 + i * 5.5}%;top:90%"
      ></span>{/each}
  </div>

  <p class="s1-tag">卒業論文</p>
  <h1 class="s1-title">
    <span class="s1-sub">PlayStationゲーム</span>
    『ゴースト・オブ・ツシマ』<br />
    と<span class="red">必要悪</span>の倫理学
  </h1>
  <blockquote class="s1-quote">「必要悪」は存在するのか</blockquote>
  <p class="s1-name">土蔵 創一</p>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    background: #09070a;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
    gap: 0;
    font-family: "Noto Serif JP", serif;
    color: #f5f0e8;
  }

  .bg-wrapper {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    overflow: hidden; /* Contains the zoom/pan */
    pointer-events: none;
  }

  /* 3840×2160 → full-bleed, aspect matches slide */
  .bg-photo {
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0; /* Base opacity controlled by GSAP */
  }

  /* gradient overlay so text stays readable */
  .overlay {
    position: absolute;
    inset: 0;
    background: radial-gradient(
      ellipse at 50% 50%,
      rgba(9, 7, 10, 0.45) 0%,
      rgba(9, 7, 10, 0.75) 100%
    );
    pointer-events: none;
  }
  .particles {
    position: absolute;
    inset: 0;
    pointer-events: none;
  }
  .particle {
    position: absolute;
    width: 4px;
    height: 4px;
    border-radius: 50%;
    background: #e25822; /* Ember orange */
    box-shadow:
      0 0 8px #c0392b,
      0 0 4px #e74c3c;
    opacity: 0; /* Base controlled by GSAP */
  }

  .s1-tag {
    position: relative;
    font-size: clamp(0.9rem, 1.5vw, 1.1rem);
    letter-spacing: 0.3em;
    color: rgba(201, 168, 76, 0.75);
    margin-bottom: 2.5rem;
  }
  h1 {
    position: relative;
    font-size: clamp(2.8rem, 6vw, 5.5rem);
    font-weight: 900;
    line-height: 1.45;
    text-align: center;
    color: #f5f0e8;
    margin-bottom: 3rem;
  }
  .s1-sub {
    font-size: clamp(2.2rem, 4.5vw, 4.2rem);
    color: rgba(245, 240, 232, 0.85);
    font-weight: 700;
    letter-spacing: 0.1em;
    display: block;
    margin-bottom: -0.2em; /* Adjusted margin slightly to look good with larger font */
  }
  .red {
    color: #c0504d;
  }
  blockquote {
    position: relative;
    font-size: clamp(1.5rem, 3vw, 2.6rem);
    font-style: italic;
    color: #c9a84c;
    border-left: 4px solid #8b1a1a;
    padding: 0.4rem 1.8rem;
    margin-bottom: 2.5rem;
  }
  .s1-name {
    position: relative;
    font-size: clamp(1rem, 1.8vw, 1.4rem);
    color: rgba(201, 168, 76, 0.6);
    letter-spacing: 0.25em;
  }

  /* iPad landscape / tablet */
  @media (max-width: 1366px) {
    h1 {
      font-size: clamp(2rem, 5vw, 3.8rem);
      margin-bottom: 2rem;
    }
    blockquote {
      font-size: clamp(1.2rem, 2.5vw, 2rem);
      margin-bottom: 1.8rem;
    }
    .s1-tag {
      margin-bottom: 1.5rem;
    }
  }
  @media (max-width: 1024px) {
    h1 {
      font-size: clamp(1.8rem, 4.5vw, 3.2rem);
      margin-bottom: 1.5rem;
    }
    blockquote {
      font-size: clamp(1rem, 2.2vw, 1.6rem);
      margin-bottom: 1.5rem;
    }
    .s1-tag {
      font-size: clamp(0.75rem, 1.3vw, 0.95rem);
      margin-bottom: 1rem;
    }
    .s1-name {
      font-size: clamp(0.85rem, 1.5vw, 1.1rem);
    }
  }
</style>
