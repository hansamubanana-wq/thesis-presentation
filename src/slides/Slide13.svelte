<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(".s13-label", { opacity: 0 }, { opacity: 1, duration: 0.6 });
    gsap.fromTo(
      ".arendt-img",
      { opacity: 0, x: -60 },
      { opacity: 1, x: 0, duration: 1, ease: "power2.out", delay: 0.4 },
    );
    gsap.fromTo(
      ".s13-head",
      { opacity: 0, y: 30 },
      { opacity: 1, y: 0, duration: 1, ease: "power3.out", delay: 0.6 },
    );
    gsap.fromTo(
      ".s13-concept",
      { opacity: 0, scale: 0.85 },
      {
        opacity: 1,
        scale: 1,
        duration: 0.9,
        ease: "back.out(1.5)",
        delay: 1.2,
      },
    );
    gsap.fromTo(
      ".s13-flip",
      { opacity: 0, y: 15 },
      { opacity: 1, y: 0, duration: 0.8, delay: 1.9 },
    );
    gsap.to(".banality", {
      color: "#c0504d",
      repeat: -1,
      yoyo: true,
      duration: 2,
      ease: "sine.inOut",
      delay: 2.5,
    });
  });
</script>

<div class="slide">
  <div class="purple-glow"></div>
  <div class="inner">
    <!-- left: arendt.jpg 725×673 ほぼ正方形 -->
    <div class="left-img">
      <img
        src="/images/arendt.jpg"
        alt="ハンナ・アーレント"
        class="arendt-img"
        onerror={(e) => ((e.target as HTMLElement).style.display = "none")}
      />
      <p class="img-cap">Hannah Arendt<br />1906–1975</p>
    </div>

    <!-- right: content -->
    <div class="right">
      <p class="s13-label">考察①：正義の相対化</p>
      <h2 class="s13-head">「<span class="red">思考停止</span>」という悪</h2>
      <div class="s13-concept">
        <div class="banality">誰もが陥る「悪」</div>
        <div class="sub-en">Banality of Evil</div>
      </div>
      <div class="s13-flip">
        命令に盲従するだけで<strong>巨悪が生まれる</strong>
      </div>
    </div>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    background: radial-gradient(ellipse at 50% 30%, #0c0812, #09070a 60%);
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
    font-family: "Noto Serif JP", serif;
    color: #f5f0e8;
  }
  .purple-glow {
    position: absolute;
    inset: 0;
    background: radial-gradient(
      ellipse at 30% 50%,
      rgba(120, 60, 180, 0.08) 0%,
      transparent 60%
    );
    pointer-events: none;
  }
  .inner {
    display: flex;
    align-items: center;
    gap: 4rem;
    width: 90%;
    height: 90%;
  }

  /* arendt.jpg 725×673 ほぼ正方形 */
  .left-img {
    flex-shrink: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.8rem;
  }
  .arendt-img {
    width: clamp(180px, 26vw, 300px);
    aspect-ratio: 725 / 673;
    object-fit: cover;
    object-position: center top;
    border-radius: 6px;
    border: 2px solid rgba(120, 60, 180, 0.3);
    filter: grayscale(20%);
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
  .s13-label {
    font-size: clamp(0.9rem, 1.6vw, 1.2rem);
    letter-spacing: 0.2em;
    color: rgba(245, 240, 232, 0.4);
    margin-bottom: 1rem;
  }
  .s13-head {
    font-size: clamp(2rem, 4.5vw, 3.8rem);
    font-weight: 900;
    margin-bottom: 2rem;
  }
  .red {
    color: #c0504d;
  }
  .s13-concept {
    margin-bottom: 2rem;
  }
  .banality {
    font-size: clamp(2.5rem, 5.5vw, 5rem);
    font-weight: 900;
    color: rgba(245, 240, 232, 0.9);
    line-height: 1;
    margin-bottom: 0.5rem;
  }
  .sub-en {
    font-size: clamp(1rem, 2vw, 1.5rem);
    color: rgba(245, 240, 232, 0.4);
    font-style: italic;
  }
  .s13-flip {
    font-size: clamp(1.1rem, 2.2vw, 1.8rem);
    color: rgba(245, 240, 232, 0.75);
  }
  .s13-flip strong {
    color: #f5f0e8;
  }

  @media (max-width: 1366px) {
    .inner {
      gap: 2.5rem;
    }
    .arendt-img {
      width: clamp(140px, 20vw, 230px);
    }
    .s13-head {
      font-size: clamp(1.8rem, 3.8vw, 3rem);
      margin-bottom: 1.5rem;
    }
    .banality {
      font-size: clamp(2rem, 4.5vw, 4rem);
    }
    .s13-concept {
      margin-bottom: 1.5rem;
    }
  }
  @media (max-width: 1024px) {
    .inner {
      gap: 1.5rem;
    }
    .arendt-img {
      width: clamp(110px, 15vw, 170px);
    }
    .s13-label {
      font-size: clamp(0.75rem, 1.3vw, 1rem);
      margin-bottom: 0.6rem;
    }
    .s13-head {
      font-size: clamp(1.5rem, 3.5vw, 2.5rem);
      margin-bottom: 1rem;
    }
    .banality {
      font-size: clamp(1.8rem, 4vw, 3rem);
    }
    .sub-en {
      font-size: clamp(0.85rem, 1.5vw, 1.2rem);
    }
    .s13-flip {
      font-size: clamp(0.95rem, 1.8vw, 1.4rem);
    }
    .s13-concept {
      margin-bottom: 1rem;
    }
  }
</style>
