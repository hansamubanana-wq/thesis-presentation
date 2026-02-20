<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(
      ".s4-en",
      { opacity: 0, scale: 1.4 },
      { opacity: 1, scale: 1, duration: 1.2, ease: "power3.out" },
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
    gsap.to(".s4-en", {
      color: "#c0504d",
      repeat: -1,
      yoyo: true,
      duration: 3,
      ease: "sine.inOut",
      delay: 2.5,
    });
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
    font-size: clamp(5rem, 14vw, 12rem);
    font-weight: 900;
    color: #f5f0e8;
    margin: 0 0 2.5rem;
    letter-spacing: 0.05em;
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
</style>
