<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(
      ".s4-en",
      { opacity: 0, filter: "blur(10px)" },
      {
        opacity: 1,
        filter: "blur(0px)",
        duration: 2,
        ease: "power2.out",
      },
    );
    gsap.fromTo(
      ".s4-jp",
      { opacity: 0 },
      { opacity: 1, duration: 0.8, delay: 0.8 },
    );
    gsap.fromTo(
      ".s4-eq",
      { opacity: 0, y: 30 },
      { opacity: 1, y: 0, duration: 1, ease: "power2.out", delay: 1.4 },
    );
    // Elegant static fade-in for English text without scale-up or looping.
  });
</script>

<div class="slide">
  <p class="s4-jp">解けない難問</p>
  <h2 class="s4-en">APORIA</h2>
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
    background: #09070a;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
    font-family: "Noto Serif JP", serif;
    color: #f5f0e8;
  }
  .s4-jp {
    font-size: clamp(1rem, 2vw, 1.5rem);
    letter-spacing: 0.15em;
    color: rgba(245, 240, 232, 0.45);
    margin-bottom: 1.2rem;
  }
  .s4-en {
    font-size: clamp(4.5rem, 12vw, 10rem);
    font-weight: 900;
    color: #f5f0e8;
    margin: 0 0 2.5rem;
    letter-spacing: 0.2em;
    text-shadow: 0 4px 30px rgba(139, 26, 26, 0.5);
  }
  .s4-eq {
    display: flex;
    align-items: center;
    gap: 1.5rem;
    flex-wrap: wrap;
    justify-content: center;
    padding: 1.5rem 2.5rem;
    border: 1px solid rgba(139, 26, 26, 0.4);
    border-radius: 8px;
    background: rgba(139, 26, 26, 0.08);
  }
  .eq-a,
  .eq-b {
    font-size: clamp(1.3rem, 2.8vw, 2.2rem);
    font-weight: 700;
    color: rgba(245, 240, 232, 0.88);
  }
  .eq-sym {
    font-size: clamp(2rem, 4vw, 3.5rem);
    color: #c0504d;
    font-weight: 900;
  }

  @media (max-width: 1366px) {
    .s4-en {
      font-size: clamp(3.5rem, 9vw, 8rem);
      margin: 0 0 2rem;
    }
    .eq-a,
    .eq-b {
      font-size: clamp(1.1rem, 2.2vw, 1.8rem);
    }
    .eq-sym {
      font-size: clamp(1.5rem, 3vw, 2.5rem);
    }
    .s4-eq {
      gap: 1rem;
      padding: 1.2rem 2rem;
    }
  }
  @media (max-width: 1024px) {
    .s4-en {
      font-size: clamp(2.5rem, 7vw, 6rem);
      margin: 0 0 1.5rem;
    }
    .eq-a,
    .eq-b {
      font-size: clamp(0.95rem, 2vw, 1.4rem);
    }
    .eq-sym {
      font-size: clamp(1.2rem, 2.5vw, 2rem);
    }
    .s4-eq {
      gap: 0.8rem;
      padding: 1rem 1.5rem;
    }
  }
</style>
