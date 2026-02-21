<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(".s3-year", { opacity: 0 }, { opacity: 1, duration: 0.6 });
    gsap.fromTo(
      ".s3-head",
      { opacity: 0, y: 30 },
      { opacity: 1, y: 0, duration: 1, ease: "power3.out", delay: 0.3 },
    );
    gsap.fromTo(
      ".s3-left",
      { opacity: 0, x: -80 },
      { opacity: 1, x: 0, duration: 0.9, ease: "power2.out", delay: 0.8 },
    );
    gsap.fromTo(
      ".s3-right",
      { opacity: 0, x: 80 },
      { opacity: 1, x: 0, duration: 0.9, ease: "power2.out", delay: 0.8 },
    );
    gsap.fromTo(
      ".s3-vs",
      { opacity: 0, scale: 0.3 },
      { opacity: 1, scale: 1, duration: 0.7, ease: "back.out(2)", delay: 1.4 },
    );
    gsap.fromTo(
      ".s3-scroll",
      { opacity: 0, y: 30 },
      { opacity: 1, y: 0, duration: 1, ease: "power2.out", delay: 1.8 },
    );
    gsap.to(".s3-vs", {
      textShadow: "0 0 40px rgba(192,80,77,1)",
      repeat: -1,
      yoyo: true,
      duration: 1.5,
      ease: "sine.inOut",
      delay: 2.5,
    });
  });
</script>

<div class="slide">
  <p class="s3-year">1274年（文永11年）― 小茂田浜</p>
  <h2 class="s3-head">相容れない二つの道</h2>

  <div class="clash">
    <div class="box s3-left gold-box">
      <div class="icon">⚔</div>
      <div class="box-title">武士道</div>
      <div class="box-sub">一騎打ち・名乗り・誉れ</div>
    </div>
    <div class="s3-vs">VS</div>
    <div class="box s3-right red-box">
      <div class="icon">🔥</div>
      <div class="box-title" style="font-size: clamp(1rem,2vw,1.6rem);">
        手段を選ばない戦い方
      </div>
      <div class="box-sub">毒矢・集団戦・火薬兵器</div>
    </div>
  </div>

  <!-- invasion.jpg: 710×291 超横長パノラマ → full-width strip -->
  <div class="s3-scroll">
    <img
      src="/images/invasion.jpg"
      alt="蒙古襲来絵詞"
      onerror={(e) => ((e.target as HTMLElement).style.display = "none")}
    />
    <p class="scroll-cap">蒙古襲来絵詞（部分）</p>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    background: linear-gradient(to bottom, #04080f, #09070a);
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
  .s3-year {
    font-size: clamp(0.9rem, 1.6vw, 1.2rem);
    letter-spacing: 0.2em;
    color: rgba(201, 168, 76, 0.6);
    margin-bottom: 1.2rem;
  }
  .s3-head {
    font-size: clamp(2.4rem, 5.5vw, 5rem);
    font-weight: 900;
    margin-bottom: 2rem;
    text-align: center;
  }
  .clash {
    display: flex;
    align-items: center;
    gap: 2.5rem;
    margin-bottom: 2rem;
  }
  .box {
    padding: 2rem 2.5rem;
    border-radius: 8px;
    text-align: center;
    min-width: 220px;
  }
  .gold-box {
    background: rgba(201, 168, 76, 0.08);
    border: 1px solid rgba(201, 168, 76, 0.3);
  }
  .red-box {
    background: rgba(139, 26, 26, 0.12);
    border: 1px solid rgba(139, 26, 26, 0.4);
  }
  .icon {
    font-size: 2.5rem;
    margin-bottom: 0.8rem;
  }
  .box-title {
    font-size: clamp(1.5rem, 3vw, 2.5rem);
    font-weight: 900;
    margin-bottom: 0.5rem;
  }
  .gold-box .box-title {
    color: #c9a84c;
  }
  .red-box .box-title {
    color: #c0504d;
  }
  .box-sub {
    font-size: clamp(0.9rem, 1.6vw, 1.1rem);
    color: rgba(245, 240, 232, 0.65);
  }
  .s3-vs {
    font-size: clamp(2.5rem, 6vw, 5rem);
    font-weight: 900;
    color: #c0504d;
    flex-shrink: 0;
  }

  /* 710×291 panoramic — nicely displayed entirely */
  .s3-scroll {
    width: 100%;
    text-align: center;
  }
  .s3-scroll img {
    width: 65%;
    max-width: 600px;
    margin: 0 auto;
    height: auto;
    object-fit: contain;
    opacity: 0.85;
    border: 1px solid rgba(201, 168, 76, 0.2);
    border-radius: 6px;
    display: block;
  }
  .scroll-cap {
    font-size: 0.7rem;
    color: rgba(245, 240, 232, 0.3);
    letter-spacing: 0.1em;
    margin-top: 0.4rem;
  }

  @media (max-width: 1366px) {
    .s3-head {
      font-size: clamp(2rem, 4.5vw, 3.8rem);
      margin-bottom: 1.5rem;
    }
    .clash {
      gap: 1.5rem;
      margin-bottom: 1.5rem;
    }
    .box {
      padding: 1.5rem 1.8rem;
      min-width: 180px;
    }
    .box-title {
      font-size: clamp(1.2rem, 2.5vw, 2rem);
    }
    .s3-vs {
      font-size: clamp(2rem, 4.5vw, 3.5rem);
    }
    .icon {
      font-size: 2rem;
      margin-bottom: 0.5rem;
    }
  }
  @media (max-width: 1024px) {
    .s3-head {
      font-size: clamp(1.8rem, 4vw, 3rem);
      margin-bottom: 1rem;
    }
    .s3-year {
      font-size: clamp(0.75rem, 1.3vw, 0.95rem);
      margin-bottom: 0.8rem;
    }
    .clash {
      gap: 1rem;
      margin-bottom: 1rem;
    }
    .box {
      padding: 1rem 1.2rem;
      min-width: 140px;
    }
    .box-title {
      font-size: clamp(1rem, 2.2vw, 1.6rem);
    }
    .box-sub {
      font-size: clamp(0.75rem, 1.3vw, 0.9rem);
    }
    .s3-vs {
      font-size: clamp(1.8rem, 4vw, 3rem);
    }
    .icon {
      font-size: 1.6rem;
      margin-bottom: 0.3rem;
    }
    .s3-scroll img {
      width: 55%;
      max-width: 400px;
    }
  }
</style>
