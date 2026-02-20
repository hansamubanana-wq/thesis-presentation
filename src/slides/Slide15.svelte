<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    const tl = gsap.timeline();
    tl.fromTo(".s15-label", { opacity: 0 }, { opacity: 1, duration: 0.6 })
      .fromTo(
        ".s15-head",
        { opacity: 0, y: -20, letterSpacing: "0.5em" },
        {
          opacity: 1,
          y: 0,
          letterSpacing: "0.08em",
          duration: 1.2,
          ease: "power3.out",
        },
        "-=0.2",
      )
      .fromTo(
        ".s15-contrast",
        { opacity: 0, y: 20 },
        { opacity: 1, y: 0, duration: 0.9, ease: "power2.out" },
        "-=0.3",
      )
      .fromTo(
        ".s15-final",
        { opacity: 0, scale: 0.88, filter: "blur(8px)" },
        {
          opacity: 1,
          scale: 1,
          filter: "blur(0px)",
          duration: 1.3,
          ease: "power3.out",
        },
        "-=0.2",
      );
    gsap.to(".s15-final", {
      textShadow: "0 0 40px rgba(201,168,76,0.5)",
      repeat: -1,
      yoyo: true,
      duration: 3,
      ease: "sine.inOut",
      delay: 2.5,
    });
    gsap.to(".end-particle", {
      y: () => -(Math.random() * 300 + 100),
      opacity: 0,
      duration: () => Math.random() * 4 + 2,
      stagger: 0.2,
      repeat: -1,
      ease: "power1.out",
      delay: 1.5,
    });
  });
</script>

<div class="slide">
  <div class="final-bg"></div>
  <div class="particles" aria-hidden="true">
    {#each Array(16) as _, i}
      <span
        class="end-particle"
        style="left:{5 + i * 5.8}%; top:85%; opacity:0.3"
      ></span>
    {/each}
  </div>

  <p class="s15-label">結論：「必要悪」は存在するのか</p>
  <h2 class="s15-head">正当化から<span class="gold">実存的覚悟</span>へ</h2>

  <div class="s15-contrast">
    <div class="concept-old">
      <div class="concept-label dim">一般的な「必要悪」</div>
      <div class="concept-val">大義を名目に<br />悪を正当化する免罪符</div>
    </div>
    <div class="arrow">→</div>
    <div class="concept-new">
      <div class="concept-label gold">仁が引き受けた「悪」</div>
      <div class="concept-val">
        自らが永遠の罪人となり<br />民を救う絶対的犠牲
      </div>
    </div>
  </div>

  <blockquote class="s15-final">
    「必要悪」という言葉では決して救われない<br />
    しかし、罪を背負ってでも大切なものを守り抜く<br />
    <strong>「覚悟」</strong>に我々は心を穿たれる
  </blockquote>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    background: radial-gradient(ellipse at 50% 60%, #120e06, #09070a 65%);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
    font-family: "Noto Serif JP", serif;
    color: #f5f0e8;
    gap: 0;
  }
  .final-bg {
    position: absolute;
    inset: 0;
    background: radial-gradient(
      ellipse at 50% 100%,
      rgba(201, 168, 76, 0.07) 0%,
      transparent 55%
    );
    pointer-events: none;
  }
  .particles {
    position: absolute;
    inset: 0;
    pointer-events: none;
  }
  .end-particle {
    position: absolute;
    width: 2px;
    height: 2px;
    border-radius: 50%;
    background: #c9a84c;
    box-shadow: 0 0 5px #c9a84c;
  }
  .s15-label {
    font-size: clamp(0.9rem, 1.6vw, 1.2rem);
    letter-spacing: 0.25em;
    color: rgba(245, 240, 232, 0.4);
    margin-bottom: 1.2rem;
  }
  .s15-head {
    font-size: clamp(2.5rem, 5.5vw, 5rem);
    font-weight: 900;
    text-align: center;
    letter-spacing: 0.08em;
    margin-bottom: 2rem;
  }
  .gold {
    color: #c9a84c;
  }
  .dim {
    color: rgba(245, 240, 232, 0.35);
  }
  .s15-contrast {
    display: flex;
    align-items: center;
    gap: 2rem;
    margin-bottom: 2.5rem;
    width: min(760px, 85vw);
  }
  .concept-old,
  .concept-new {
    flex: 1;
    text-align: center;
    padding: 1.5rem 1.5rem;
    border-radius: 8px;
  }
  .concept-old {
    background: rgba(255, 255, 255, 0.03);
    border: 1px solid rgba(255, 255, 255, 0.06);
  }
  .concept-new {
    background: rgba(201, 168, 76, 0.07);
    border: 1px solid rgba(201, 168, 76, 0.25);
  }
  .concept-label {
    font-size: clamp(0.8rem, 1.4vw, 1rem);
    font-weight: 700;
    letter-spacing: 0.08em;
    margin-bottom: 0.5rem;
  }
  .concept-val {
    font-size: clamp(1.1rem, 2vw, 1.6rem);
    color: rgba(245, 240, 232, 0.8);
    line-height: 1.5;
  }
  .arrow {
    font-size: clamp(2rem, 4vw, 3rem);
    color: rgba(201, 168, 76, 0.4);
    flex-shrink: 0;
  }
  .s15-final {
    font-size: clamp(1.3rem, 2.5vw, 2.1rem);
    color: #c9a84c;
    text-align: center;
    line-height: 1.8;
    max-width: 760px;
    font-style: normal;
    margin-bottom: 2rem;
  }
  .s15-final strong {
    color: #f5f0e8;
  }
</style>
