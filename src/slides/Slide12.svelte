<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(
      ".s12-head",
      { opacity: 0, y: 25 },
      { opacity: 1, y: 0, duration: 1, ease: "power3.out" },
    );
    gsap.fromTo(
      ".cond",
      { opacity: 0, x: -40 },
      {
        opacity: 1,
        x: 0,
        duration: 0.65,
        stagger: 0.25,
        ease: "power2.out",
        delay: 0.7,
      },
    );
    gsap.fromTo(
      ".s12-verdict",
      { opacity: 0, scale: 0.9 },
      {
        opacity: 1,
        scale: 1,
        duration: 0.9,
        ease: "back.out(1.5)",
        delay: 1.8,
      },
    );
    gsap.to(".s12-verdict", {
      boxShadow: "0 0 40px rgba(201,168,76,0.25)",
      repeat: -1,
      yoyo: true,
      duration: 2.5,
      ease: "sine.inOut",
      delay: 3,
    });
  });
</script>

<div class="slide">
  <div class="glow-bg"></div>

  <div class="content">
    <h2 class="s12-head">
      必要悪が正義になる<br /><span class="gold">3つの条件</span>
    </h2>
    <div class="conditions">
      <div class="cond">
        <div class="num">I</div>
        <div class="cond-body">
          <div class="cond-title">緊急性</div>
          <div class="cond-sub">差し迫った生命の危機</div>
        </div>
      </div>
      <div class="cond">
        <div class="num">II</div>
        <div class="cond-body">
          <div class="cond-title">補充性</div>
          <div class="cond-sub">他に手段がない</div>
        </div>
      </div>
      <div class="cond">
        <div class="num">III</div>
        <div class="cond-body">
          <div class="cond-title">公益性</div>
          <div class="cond-sub">他者の救済が目的</div>
        </div>
      </div>
    </div>
    <div class="s12-verdict">
      境井仁の選択は、対馬の存亡という非常時において<br />この3条件を<strong
        >すべて満たしていた</strong
      >
    </div>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    overflow: hidden;
    font-family: "Noto Serif JP", serif;
    color: #f5f0e8;
  }

  .glow-bg {
    position: absolute;
    inset: 0;
    background: radial-gradient(
      ellipse at 50% 60%,
      rgba(201, 168, 76, 0.06) 0%,
      transparent 60%
    );
    pointer-events: none;
    z-index: 2;
  }

  .content {
    position: relative;
    z-index: 3;
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 0;
  }

  .s12-head {
    font-size: clamp(2.5rem, 5.5vw, 5rem);
    font-weight: 900;
    text-align: center;
    line-height: 1.3;
    margin-bottom: 3rem;
  }
  .gold {
    color: #c9a84c;
  }
  .conditions {
    display: flex;
    flex-direction: column;
    gap: 1.2rem;
    width: min(640px, 85vw);
    margin-bottom: 2.5rem;
  }
  .cond {
    display: flex;
    align-items: center;
    gap: 2rem;
    padding: 1.5rem 2rem;
    background: rgba(20, 15, 5, 0.7);
    backdrop-filter: blur(4px);
    border: 1px solid rgba(201, 168, 76, 0.25);
    border-radius: 8px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
  }
  .num {
    width: 3rem;
    height: 3rem;
    border-radius: 50%;
    border: 2px solid rgba(201, 168, 76, 0.5);
    color: #c9a84c;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.3rem;
    font-weight: 700;
    flex-shrink: 0;
  }
  .cond-title {
    font-size: clamp(1.5rem, 3vw, 2.3rem);
    font-weight: 900;
    margin-bottom: 0.2rem;
  }
  .cond-sub {
    font-size: clamp(1rem, 2vw, 1.5rem);
    color: rgba(245, 240, 232, 0.7);
  }
  .s12-verdict {
    font-size: clamp(1.3rem, 2.5vw, 2rem);
    color: rgba(245, 240, 232, 1);
    text-align: center;
    padding: 1.2rem 3rem;
    border: 1px solid rgba(201, 168, 76, 0.4);
    border-radius: 8px;
    background: rgba(15, 12, 5, 0.8);
    backdrop-filter: blur(4px);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
  }
  .s12-verdict strong {
    color: #c9a84c;
  }

  @media (max-width: 1366px) {
    .s12-head {
      font-size: clamp(2rem, 4.5vw, 4rem);
      margin-bottom: 2rem;
    }
    .cond {
      padding: 1.2rem 1.5rem;
      gap: 1.5rem;
    }
    .cond-title {
      font-size: clamp(1.2rem, 2.5vw, 1.8rem);
    }
    .cond-sub {
      font-size: clamp(0.9rem, 1.7vw, 1.2rem);
    }
    .conditions {
      gap: 1rem;
      margin-bottom: 2rem;
    }
    .s12-verdict {
      font-size: clamp(1.1rem, 2.2vw, 1.6rem);
      padding: 1rem 2rem;
    }
  }
  @media (max-width: 1024px) {
    .s12-head {
      font-size: clamp(1.8rem, 4vw, 3rem);
      margin-bottom: 1.5rem;
    }
    .cond {
      padding: 1rem 1.2rem;
      gap: 1.2rem;
    }
    .cond-title {
      font-size: clamp(1rem, 2.2vw, 1.5rem);
    }
    .cond-sub {
      font-size: clamp(0.8rem, 1.5vw, 1rem);
    }
    .conditions {
      gap: 0.8rem;
      margin-bottom: 1.5rem;
    }
    .num {
      width: 2.5rem;
      height: 2.5rem;
      font-size: 1.1rem;
    }
    .s12-verdict {
      font-size: clamp(0.95rem, 1.8vw, 1.3rem);
      padding: 0.8rem 1.5rem;
    }
  }
</style>
