<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(
      ".s4-main",
      { opacity: 0, filter: "blur(10px)" },
      {
        opacity: 1,
        filter: "blur(0px)",
        duration: 2.5,
        ease: "power2.out",
      },
    );
    gsap.fromTo(
      ".s4-sub",
      { opacity: 0 },
      { opacity: 1, duration: 0.8, delay: 0.9 },
    );
    gsap.fromTo(
      [".clash-left", ".clash-vs", ".clash-right"],
      { opacity: 0, scale: 0.9 },
      {
        opacity: 1,
        scale: 1,
        duration: 0.8,
        stagger: 0.2,
        ease: "back.out(1.2)",
        delay: 1.2,
      },
    );
    gsap.fromTo(
      ".s4-eq",
      { opacity: 0, y: 30 },
      { opacity: 1, y: 0, duration: 1, ease: "power2.out", delay: 2.2 },
    );
  });
</script>

<div class="slide">
  <p class="s4-sub">解けない難問</p>
  <h2 class="s4-main">究極の決断</h2>

  <div class="clash-container">
    <div class="clash-side clash-left">
      <h3 class="clash-name blue">蒙古軍</h3>
      <p class="clash-desc">手段を選ばない非道な戦術</p>
    </div>

    <div class="clash-vs">VS</div>

    <div class="clash-side clash-right">
      <h3 class="clash-name red">武士道</h3>
      <p class="clash-desc">誉れを重んじる正々堂々たる戦い</p>
    </div>
  </div>

  <div class="s4-eq">
    <span class="eq-a">「誉れある戦いに固執する」</span>
    <span class="eq-sym">＝</span>
    <span class="eq-b">「民を見殺しにする」</span>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
    font-family: "Noto Serif JP", serif;
    color: #f5f0e8;
  }
  .s4-sub {
    font-size: clamp(1rem, 2vw, 1.5rem);
    letter-spacing: 0.15em;
    color: rgba(245, 240, 232, 0.45);
    margin-bottom: 1rem;
  }
  .s4-main {
    font-size: clamp(3rem, 7vw, 6rem);
    font-weight: 900;
    color: #f5f0e8;
    margin: 0 0 2rem;
    letter-spacing: 0.25em;
    padding-left: 0.25em; /* optical balance for letter-spacing */
    text-shadow: 0 4px 30px rgba(245, 240, 232, 0.2);
  }

  .clash-container {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 3rem;
    margin-bottom: 2.5rem;
    width: 90%;
    max-width: 1000px;
  }
  .clash-side {
    flex: 1;
    text-align: center;
    padding: 1.5rem 1rem;
    border-radius: 8px;
    background: rgba(0, 0, 0, 0.3);
  }
  .clash-left {
    border: 1px solid rgba(108, 122, 156, 0.4);
    box-shadow: inset 0 0 30px rgba(108, 122, 156, 0.1);
  }
  .clash-right {
    border: 1px solid rgba(192, 80, 77, 0.4);
    box-shadow: inset 0 0 30px rgba(192, 80, 77, 0.1);
  }
  .clash-name {
    font-size: clamp(2rem, 4vw, 3.5rem);
    font-weight: 900;
    margin: 0 0 0.5rem 0;
  }
  .clash-desc {
    font-size: clamp(0.9rem, 1.8vw, 1.3rem);
    color: rgba(245, 240, 232, 0.7);
    margin: 0;
  }
  .clash-vs {
    font-size: clamp(1.8rem, 3vw, 2.5rem);
    font-weight: 900;
    color: #c9a84c;
    font-style: italic;
    flex-shrink: 0;
  }

  .blue {
    color: #6c7a9c;
  }
  .red {
    color: #c0504d;
  }

  .s4-eq {
    display: flex;
    align-items: center;
    gap: 1.5rem;
    flex-wrap: wrap;
    justify-content: center;
    padding: 1.2rem 2.5rem;
    border: 1px solid rgba(245, 240, 232, 0.2);
    border-radius: 8px;
    background: rgba(245, 240, 232, 0.05);
  }
  .eq-a,
  .eq-b {
    font-size: clamp(1.2rem, 2.5vw, 2rem);
    font-weight: 700;
    color: rgba(245, 240, 232, 0.88);
  }
  .eq-sym {
    font-size: clamp(1.8rem, 4vw, 3rem);
    color: #c9a84c;
    font-weight: 900;
  }

  @media (max-width: 1366px) {
    .s4-main {
      font-size: clamp(2.5rem, 6vw, 5rem);
      margin: 0 0 1.5rem;
    }
    .clash-container {
      gap: 2rem;
      margin-bottom: 2rem;
    }
    .clash-side {
      padding: 1.2rem 1rem;
    }
  }
  @media (max-width: 1024px) {
    .clash-container {
      gap: 1rem;
      margin-bottom: 1.5rem;
    }
    .clash-name {
      font-size: clamp(1.5rem, 3vw, 2.5rem);
    }
    .clash-desc {
      font-size: clamp(0.8rem, 1.5vw, 1rem);
    }
    .s4-eq {
      gap: 1rem;
      padding: 1rem 1.5rem;
    }
    .eq-a,
    .eq-b {
      font-size: clamp(0.95rem, 2vw, 1.4rem);
    }
  }
</style>
