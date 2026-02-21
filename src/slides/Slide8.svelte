<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(".s8-label", { opacity: 0 }, { opacity: 1, duration: 0.6 });
    gsap.fromTo(
      ".s8-head",
      { opacity: 0, y: 30 },
      { opacity: 1, y: 0, duration: 1, ease: "power3.out", delay: 0.3 },
    );
    gsap.fromTo(
      ".mach-img",
      { opacity: 0, x: -60 },
      { opacity: 1, x: 0, duration: 1, ease: "power2.out", delay: 0.6 },
    );

    // Animate base traits coming from the sides
    gsap.fromTo(
      ".s8-lion",
      { opacity: 0, x: -50, y: -20 },
      {
        opacity: 1,
        x: 0,
        y: 0,
        duration: 0.8,
        ease: "back.out(1.2)",
        delay: 1,
      },
    );
    gsap.fromTo(
      ".s8-fox",
      { opacity: 0, x: 50, y: -20 },
      {
        opacity: 1,
        x: 0,
        y: 0,
        duration: 0.8,
        ease: "back.out(1.2)",
        delay: 1.3,
      },
    );

    // Animate the connection arrows
    gsap.fromTo(
      ".merge-arrows path",
      { strokeDasharray: "0 100" },
      {
        strokeDasharray: "100 0",
        duration: 1,
        ease: "power2.inOut",
        delay: 1.8,
      },
    );
    gsap.fromTo(
      ".merge-arrows",
      { opacity: 0 },
      { opacity: 1, duration: 0.5, delay: 1.8 },
    );

    // Animate the final result (Ghost)
    gsap.fromTo(
      ".s8-ghost",
      { opacity: 0, scale: 0.8, y: 30 },
      {
        opacity: 1,
        scale: 1,
        y: 0,
        duration: 1,
        ease: "back.out(1.5)",
        delay: 2.2,
      },
    );

    gsap.to(".s8-ghost", {
      boxShadow: "0 0 50px rgba(108, 122, 156, 0.4)",
      borderColor: "rgba(108, 122, 156, 0.8)",
      repeat: -1,
      yoyo: true,
      duration: 2,
      ease: "sine.inOut",
      delay: 3.5,
    });
  });
</script>

<div class="slide">
  <div class="inner">
    <!-- left: machiavelli.jpg 981×1260 縦長ポートレート -->
    <div class="left-img">
      <img
        src="/images/machiavelli.jpg"
        alt="マキャヴェッリ"
        class="mach-img"
        onerror={(e) => ((e.target as HTMLElement).style.display = "none")}
      />
      <p class="img-cap">N.マキャヴェッリ<br />1469–1527</p>
    </div>

    <!-- right: content -->
    <div class="right">
      <p class="s8-label">マキャベリズム ― 君主論</p>
      <h2 class="s8-head">理想の君主とは何か</h2>

      <div class="fusion-layout">
        <div class="base-traits">
          <div class="elem s8-lion">
            <div class="emo">🦁</div>
            <div class="name gold">ライオン</div>
            <div class="sub">力・恐怖</div>
          </div>

          <div class="elem s8-fox">
            <div class="emo">🦊</div>
            <div class="name" style="color:#c9884c">狐</div>
            <div class="sub">知恵・欺瞞</div>
          </div>
        </div>

        <svg
          class="merge-arrows"
          viewBox="0 0 200 60"
          preserveAspectRatio="none"
        >
          <!-- Left arrow -->
          <path
            d="M 50,0 Q 50,40 95,55"
            fill="none"
            stroke="rgba(245, 240, 232, 0.3)"
            stroke-width="3"
            stroke-linecap="round"
          />
          <polygon points="95,55 85,50 88,60" fill="rgba(245, 240, 232, 0.3)" />

          <!-- Right arrow -->
          <path
            d="M 150,0 Q 150,40 105,55"
            fill="none"
            stroke="rgba(245, 240, 232, 0.3)"
            stroke-width="3"
            stroke-linecap="round"
          />
          <polygon
            points="105,55 115,50 112,60"
            fill="rgba(245, 240, 232, 0.3)"
          />
        </svg>

        <div class="elem s8-ghost">
          <div class="ghost-header">
            <div class="ghost-char">冥</div>
            <div class="name blue">
              <ruby>冥人<rt>くろうど</rt></ruby>（境井仁）
            </div>
          </div>
          <div class="ghost-desc">
            「誉れ」を捨て、対馬を救うための<br />
            最強にして非情なる存在
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
    font-family: "Noto Serif JP", serif;
    color: #f5f0e8;
  }
  .inner {
    display: flex;
    align-items: center;
    gap: 4rem;
    width: 90%;
    height: 90%;
    position: relative;
    z-index: 1;
  }

  /* machiavelli.jpg 981×1260 → tall portrait on left */
  .left-img {
    flex-shrink: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.8rem;
  }
  .mach-img {
    width: clamp(160px, 22vw, 280px);
    aspect-ratio: 981 / 1260;
    object-fit: cover;
    object-position: center top;
    border-radius: 4px;
    border: 2px solid rgba(192, 80, 77, 0.3);
    filter: grayscale(15%) sepia(15%);
    box-shadow: 0 0 40px rgba(0, 0, 0, 0.6);
  }
  .img-cap {
    font-size: 0.72rem;
    color: rgba(245, 240, 232, 0.3);
    text-align: center;
    line-height: 1.5;
  }

  /* right content */
  .right {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 0;
  }
  .s8-label {
    font-size: clamp(0.9rem, 1.6vw, 1.2rem);
    letter-spacing: 0.2em;
    color: rgba(245, 240, 232, 0.4);
    margin-bottom: 1rem;
  }
  .s8-head {
    font-size: clamp(2rem, 4.5vw, 3.8rem);
    font-weight: 900;
    margin-bottom: 3rem;
  }

  /* New Fusion Layout */
  .fusion-layout {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    max-width: 700px;
    margin: 0 auto;
  }
  .base-traits {
    display: flex;
    justify-content: space-between;
    width: 100%;
    gap: 2rem;
  }
  .merge-arrows {
    opacity: 0;
    width: 15vw;
    height: 50px;
    margin: 0.5rem 0;
    overflow: visible;
  }

  .elem {
    text-align: center;
    border-radius: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }

  /* Top boxes */
  .s8-lion,
  .s8-fox {
    flex: 1;
    padding: 1.5rem 1rem;
    opacity: 0;
  }
  .s8-lion {
    background: rgba(201, 168, 76, 0.08);
    border: 1px solid rgba(201, 168, 76, 0.3);
  }
  .s8-fox {
    background: rgba(176, 112, 48, 0.1);
    border: 1px solid rgba(176, 112, 48, 0.3);
  }

  /* Bottom big box (Ghost) */
  .s8-ghost {
    opacity: 0;
    background: rgba(108, 122, 156, 0.12);
    border: 2px solid rgba(108, 122, 156, 0.4);
    padding: 2rem;
    width: 90%;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
  }
  .ghost-header {
    display: flex;
    align-items: center;
    gap: 1.5rem;
    margin-bottom: 1rem;
  }

  .emo {
    font-size: clamp(2.5rem, 5vw, 4rem);
    margin-bottom: 0.5rem;
  }
  .ghost-char {
    font-size: clamp(3.5rem, 6vw, 5rem);
    font-weight: 900;
    color: #6c7a9c; /* Ghost Blue */
    line-height: 1;
    text-shadow: 0 0 20px rgba(108, 122, 156, 0.3);
  }
  .name {
    font-size: clamp(1.3rem, 2.5vw, 2rem);
    font-weight: 900;
    margin-bottom: 0.3rem;
  }
  .s8-ghost .name {
    font-size: clamp(1.8rem, 3.5vw, 2.8rem);
    margin: 0;
    letter-spacing: 0.1em;
  }
  .sub {
    font-size: clamp(0.95rem, 1.8vw, 1.3rem);
    color: rgba(245, 240, 232, 0.6);
  }
  .ghost-desc {
    font-size: clamp(1rem, 2vw, 1.4rem);
    color: rgba(245, 240, 232, 0.8);
    line-height: 1.6;
    border-top: 1px solid rgba(108, 122, 156, 0.3);
    padding-top: 1rem;
    width: 100%;
  }

  .gold {
    color: #c9a84c;
  }
  .blue {
    color: #6c7a9c;
  }

  @media (max-width: 1366px) {
    .inner {
      gap: 2.5rem;
    }
    .mach-img {
      width: clamp(130px, 18vw, 220px);
    }
    .s8-head {
      font-size: clamp(1.8rem, 3.8vw, 3rem);
      margin-bottom: 2rem;
    }
    .s8-ghost {
      padding: 1.5rem;
    }
    .merge-arrows {
      height: 40px;
    }
  }
  @media (max-width: 1024px) {
    .inner {
      gap: 1.5rem;
    }
    .mach-img {
      width: clamp(100px, 14vw, 160px);
    }
    .s8-label {
      font-size: clamp(0.75rem, 1.3vw, 1rem);
      margin-bottom: 0.6rem;
    }
    .s8-head {
      font-size: clamp(1.5rem, 3.5vw, 2.5rem);
      margin-bottom: 1.5rem;
    }
    .elem {
      padding: 1rem;
    }
    .s8-lion,
    .s8-fox {
      padding: 1rem 0.5rem;
    }
    .ghost-header {
      gap: 1rem;
    }
    .ghost-desc {
      font-size: clamp(0.85rem, 1.5vw, 1.1rem);
    }
    .merge-arrows {
      height: 30px;
    }
  }
</style>
