<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(
      ".s4-title-vert",
      { opacity: 0, x: -30, filter: "blur(10px)" },
      {
        opacity: 1,
        x: 0,
        filter: "blur(0px)",
        duration: 2.5,
        ease: "power3.out",
      },
    );
    gsap.fromTo(
      ".s4-jp",
      { opacity: 0, y: 15 },
      { opacity: 1, y: 0, duration: 1.2, delay: 0.8 },
    );
    gsap.fromTo(
      ".s4-eq",
      { opacity: 0, x: 30 },
      { opacity: 1, x: 0, duration: 1.5, ease: "power2.out", delay: 1.8 },
    );

    // Subtle background drift
    gsap.to(".slide", {
      backgroundPosition: "100% 50%",
      duration: 30,
      ease: "none",
      repeat: -1,
      yoyo: true,
    });
  });
</script>

<div class="slide">
  <div class="split-layout">
    <div class="left-pane">
      <p class="s4-jp">解けない難問</p>
      <h2 class="s4-title-vert">究極のジレンマ</h2>
    </div>

    <div class="divider"></div>

    <div class="right-pane">
      <div class="s4-eq">
        <div class="eq-item eq-a">「誉れある戦いに固執する」</div>
        <div class="eq-sym">＝</div>
        <div class="eq-item eq-b">「民を見殺しにする」</div>
      </div>
    </div>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    /* Dark subtle gradient that we will animate slowly */
    background: radial-gradient(
      circle at 30% 50%,
      #15090b 0%,
      #09070a 60%,
      #050406 100%
    );
    background-size: 150% 150%;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    font-family: "Noto Serif JP", serif;
    color: #f5f0e8;
  }

  .split-layout {
    display: flex;
    width: 85%;
    height: 70%;
    max-width: 1200px;
    align-items: center;
    justify-content: center;
    gap: 4rem;
  }

  /* Left pane: Vertical Title */
  .left-pane {
    display: flex;
    align-items: flex-start;
    gap: 1.5rem;
    height: 100%;
    padding-top: 2rem;
  }

  .s4-jp {
    writing-mode: vertical-rl;
    font-size: clamp(1rem, 1.8vw, 1.3rem);
    letter-spacing: 0.3em;
    color: rgba(245, 240, 232, 0.4);
    margin: 0;
    padding-top: 1rem;
  }

  .s4-title-vert {
    writing-mode: vertical-rl;
    font-size: clamp(4rem, 9vw, 8rem);
    font-weight: 900;
    color: #f5f0e8;
    margin: 0;
    letter-spacing: 0.15em;
    text-shadow: 0 4px 30px rgba(139, 26, 26, 0.6);
    line-height: 1;
  }

  /* Center line divider */
  .divider {
    width: 1px;
    height: 80%;
    background: linear-gradient(
      to bottom,
      transparent,
      rgba(139, 26, 26, 0.6),
      transparent
    );
    box-shadow: 0 0 15px rgba(139, 26, 26, 0.4);
  }

  /* Right pane: Equation */
  .right-pane {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  .s4-eq {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 1.5rem;
  }

  .eq-item {
    font-size: clamp(1.8rem, 3.5vw, 3rem);
    font-weight: 700;
    color: rgba(245, 240, 232, 0.9);
    padding: 1.5rem 2.5rem;
    border-left: 4px solid #c9a84c;
    background: linear-gradient(
      to right,
      rgba(201, 168, 76, 0.1) 0%,
      transparent 100%
    );
    width: 100%;
  }

  .eq-item.eq-b {
    border-left-color: #c0504d;
    background: linear-gradient(
      to right,
      rgba(139, 26, 26, 0.1) 0%,
      transparent 100%
    );
  }

  .eq-sym {
    font-size: clamp(2.5rem, 4vw, 3.5rem);
    color: #c0504d;
    font-weight: 900;
    align-self: flex-start;
    padding-left: 3.5rem;
  }

  @media (max-width: 1366px) {
    .split-layout {
      gap: 3rem;
    }
    .s4-title-vert {
      font-size: clamp(3.5rem, 7vw, 6rem);
    }
    .eq-item {
      font-size: clamp(1.4rem, 2.5vw, 2.2rem);
      padding: 1.2rem 2rem;
    }
    .eq-sym {
      padding-left: 2.5rem;
    }
  }
  @media (max-width: 1024px) {
    .split-layout {
      flex-direction: column;
      gap: 2rem;
      height: 85%;
    }
    .left-pane {
      height: auto;
      flex-direction: column;
      align-items: center;
      padding-top: 0;
      gap: 0.5rem;
    }
    .s4-jp {
      writing-mode: horizontal-tb;
      padding: 0;
    }
    .s4-title-vert {
      writing-mode: horizontal-tb;
      font-size: clamp(3rem, 6vw, 4.5rem);
    }
    .divider {
      width: 80%;
      height: 1px;
      background: linear-gradient(
        to right,
        transparent,
        rgba(139, 26, 26, 0.6),
        transparent
      );
    }
    .right-pane {
      width: 100%;
      align-items: center;
    }
    .s4-eq {
      align-items: center;
      width: 100%;
      max-width: 600px;
    }
    .eq-sym {
      align-self: center;
      padding-left: 0;
    }
    .eq-item {
      text-align: center;
    }
  }
</style>
