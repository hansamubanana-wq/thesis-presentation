<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(".s9-label", { opacity: 0 }, { opacity: 1, duration: 0.6 });
    gsap.fromTo(
      ".s9-head",
      { opacity: 0, y: 30 },
      { opacity: 1, y: 0, duration: 1, ease: "power3.out", delay: 0.4 },
    );
    gsap.fromTo(
      ".nobu-img",
      { opacity: 0, x: 60 },
      { opacity: 1, x: 0, duration: 1, ease: "power2.out", delay: 0.7 },
    );
    gsap.fromTo(
      ".s9-means",
      { opacity: 0, y: 20 },
      { opacity: 1, y: 0, duration: 0.8, ease: "power2.out", delay: 1 },
    );
    gsap.fromTo(
      ".s9-arrow",
      { opacity: 0, scaleY: 0 },
      { opacity: 1, scaleY: 1, duration: 0.4, delay: 1.6 },
    );
    gsap.fromTo(
      ".s9-result",
      { opacity: 0, y: 20 },
      { opacity: 1, y: 0, duration: 0.8, ease: "back.out(1.5)", delay: 1.9 },
    );
    gsap.to(".s9-arrow", {
      opacity: 0.4,
      repeat: -1,
      yoyo: true,
      duration: 0.5,
      ease: "power1.inOut",
      delay: 2.5,
    });
  });
</script>

<div class="slide">
  <div class="fire-bg"></div>
  <div class="inner">
    <!-- left: content -->
    <div class="left">
      <p class="s9-label">歴史的必要悪</p>
      <h2 class="s9-head">織田信長<br />比叡山焼き討ち（1571）</h2>
      <div class="flow">
        <div class="s9-means box-bad">
          <div class="tag blue">手段（悪）</div>
          <div class="body">数千人を虐殺</div>
        </div>
        <div class="s9-arrow fire-arr">↓</div>
        <div class="s9-result box-good">
          <div class="tag gold">結果（善）</div>
          <div class="body">戦国乱世を終結へ</div>
        </div>
      </div>
    </div>

    <!-- right: nobunaga.jpg 600×600 正方形 -->
    <div class="right-img">
      <img
        src="/images/nobunaga.jpg"
        alt="比叡山焼き討ち"
        class="nobu-img"
        onerror={(e) => ((e.target as HTMLElement).style.display = "none")}
      />
      <p class="img-cap">元亀2年（1571年）<br />比叡山焼き討ち</p>
    </div>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, #100608, #09070a 60%);
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
    font-family: "Noto Serif JP", serif;
    color: #f5f0e8;
  }
  .fire-bg {
    position: absolute;
    inset: 0;
    background: radial-gradient(
      ellipse at 50% 80%,
      rgba(200, 60, 10, 0.1) 0%,
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

  /* left text */
  .left {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 0;
  }
  .s9-label {
    font-size: clamp(0.9rem, 1.6vw, 1.2rem);
    letter-spacing: 0.2em;
    color: rgba(245, 240, 232, 0.4);
    margin-bottom: 1rem;
  }
  .s9-head {
    font-size: clamp(2rem, 4.5vw, 3.8rem);
    font-weight: 900;
    line-height: 1.3;
    margin-bottom: 2.5rem;
  }
  .flow {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 0.5rem;
  }
  .box-bad,
  .box-good {
    width: 100%;
    padding: 1.5rem 2rem;
    border-radius: 8px;
  }
  .box-bad {
    background: rgba(108, 122, 156, 0.1);
    border: 1px solid rgba(108, 122, 156, 0.35);
  }
  .box-good {
    background: rgba(201, 168, 76, 0.07);
    border: 1px solid rgba(201, 168, 76, 0.25);
  }
  .tag {
    font-size: clamp(0.8rem, 1.4vw, 1rem);
    font-weight: 700;
    letter-spacing: 0.1em;
    margin-bottom: 0.4rem;
  }
  .body {
    font-size: clamp(1.5rem, 3vw, 2.5rem);
    font-weight: 900;
  }
  .fire-arr {
    font-size: 2.5rem;
    color: rgba(200, 60, 10, 0.7);
    padding-left: 1rem;
  }
  .gold {
    color: #c9a84c;
  }
  .blue {
    color: #6c7a9c;
  }

  /* nobunaga.jpg 600×600 正方形 */
  .right-img {
    flex-shrink: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.8rem;
  }
  .nobu-img {
    width: clamp(200px, 28vw, 320px);
    aspect-ratio: 1 / 1;
    object-fit: cover;
    border-radius: 4px;
    border: 1px solid rgba(200, 60, 10, 0.35);
    filter: grayscale(20%) sepia(20%);
    box-shadow: 0 0 40px rgba(0, 0, 0, 0.6);
  }
  .img-cap {
    font-size: 0.72rem;
    color: rgba(245, 240, 232, 0.3);
    text-align: center;
    line-height: 1.6;
  }

  @media (max-width: 1366px) {
    .inner {
      gap: 2.5rem;
    }
    .s9-head {
      font-size: clamp(1.8rem, 3.8vw, 3rem);
      margin-bottom: 2rem;
    }
    .nobu-img {
      width: clamp(160px, 20vw, 250px);
    }
    .body {
      font-size: clamp(1.2rem, 2.5vw, 2rem);
    }
    .box-bad,
    .box-good {
      padding: 1.2rem 1.5rem;
    }
  }
  @media (max-width: 1024px) {
    .inner {
      gap: 1.5rem;
    }
    .s9-label {
      font-size: clamp(0.75rem, 1.3vw, 1rem);
      margin-bottom: 0.6rem;
    }
    .s9-head {
      font-size: clamp(1.5rem, 3.5vw, 2.5rem);
      margin-bottom: 1.5rem;
    }
    .nobu-img {
      width: clamp(120px, 16vw, 180px);
    }
    .body {
      font-size: clamp(1rem, 2.2vw, 1.6rem);
    }
    .tag {
      font-size: clamp(0.7rem, 1.2vw, 0.85rem);
    }
    .box-bad,
    .box-good {
      padding: 1rem 1.2rem;
    }
    .fire-arr {
      font-size: 2rem;
    }
  }
</style>
