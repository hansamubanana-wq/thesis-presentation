<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(
      ".s14-head",
      { opacity: 0, y: 25 },
      { opacity: 1, y: 0, duration: 1, ease: "power3.out" },
    );
    gsap.fromTo(
      ".s14-mask",
      { opacity: 0, rotation: -20, scale: 0.7 },
      {
        opacity: 1,
        rotation: 0,
        scale: 1,
        duration: 1.2,
        ease: "elastic.out(1,0.7)",
        delay: 0.8,
      },
    );
    gsap.fromTo(
      ".s14-item",
      { opacity: 0, x: 40 },
      {
        opacity: 1,
        x: 0,
        duration: 0.6,
        stagger: 0.2,
        ease: "power2.out",
        delay: 1.3,
      },
    );
    gsap.to(".s14-mask", {
      filter: "drop-shadow(0 0 30px rgba(139,26,26,0.9))",
      repeat: -1,
      yoyo: true,
      duration: 2,
      ease: "sine.inOut",
      delay: 2.5,
    });
  });
</script>

<div class="slide">
  <div class="dark-glow"></div>
  <p class="s14-label">考察②：必要悪の代償</p>
  <h2 class="s14-head">
    たとえ<span class="gold">必要悪</span>でも<br />
    <span class="red">悪は悪である</span>
  </h2>
  <div class="main">
    <div class="left">
      <img
        src="/images/ghost.jpg"
        alt="冥人・境井仁"
        class="portrait"
        onerror={(e) => ((e.target as HTMLElement).style.display = "none")}
      />
      <div class="s14-mask">冥</div>
    </div>
    <div class="cost-list">
      <div class="s14-item">
        <span class="x">✗</span><span>武士の身分を剥奪</span>
      </div>
      <div class="s14-item"><span class="x">✗</span><span>家を失う</span></div>
      <div class="s14-item">
        <span class="x">✗</span><span>志村との決別</span>
      </div>
      <div class="s14-item">
        <span class="x">✗</span><span>永遠の孤独</span>
      </div>
    </div>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    background: radial-gradient(ellipse at 30% 50%, #100408, #09070a 60%);
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
  .dark-glow {
    position: absolute;
    inset: 0;
    background: radial-gradient(
      ellipse at 20% 50%,
      rgba(139, 26, 26, 0.07) 0%,
      transparent 60%
    );
    pointer-events: none;
  }
  .s14-label {
    font-size: clamp(0.9rem, 1.6vw, 1.2rem);
    letter-spacing: 0.2em;
    color: rgba(245, 240, 232, 0.4);
    margin-bottom: 1rem;
    text-align: center;
  }
  .s14-head {
    font-size: clamp(2.5rem, 5.5vw, 5rem);
    font-weight: 900;
    text-align: center;
    line-height: 1.3;
    margin-bottom: 3rem;
  }
  .gold {
    color: #c9a84c;
  }
  .red {
    color: #c0504d;
  }
  .main {
    display: flex;
    align-items: center;
    gap: 4rem;
  }
  .left {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.8rem;
    flex-shrink: 0;
  }
  .portrait {
    width: 110px;
    height: 140px;
    object-fit: cover;
    border-radius: 4px;
    border: 1px solid rgba(139, 26, 26, 0.4);
    filter: grayscale(20%) contrast(1.1);
    opacity: 0.88;
  }
  .s14-mask {
    font-size: clamp(3.5rem, 7vw, 6rem);
    font-weight: 900;
    color: #c0504d;
    line-height: 1;
    filter: drop-shadow(0 0 12px rgba(139, 26, 26, 0.5));
  }
  .cost-list {
    display: flex;
    flex-direction: column;
    gap: 1.2rem;
  }
  .s14-item {
    display: flex;
    align-items: center;
    gap: 1.2rem;
    font-size: clamp(1.5rem, 3vw, 2.2rem);
  }
  .x {
    color: #c0504d;
    font-weight: 900;
    font-size: 1.2em;
  }

  @media (max-width: 1366px) {
    .s14-head { font-size:clamp(2rem,4.5vw,4rem); margin-bottom:2rem; }
    .main { gap:2.5rem; }
    .s14-mask { font-size:clamp(3rem,6vw,5rem); }
    .s14-item { font-size:clamp(1.2rem,2.5vw,1.8rem); gap:1rem; }
    .cost-list { gap:1rem; }
  }
  @media (max-width: 1024px) {
    .s14-label { font-size:clamp(0.75rem,1.3vw,1rem); margin-bottom:0.6rem; }
    .s14-head { font-size:clamp(1.8rem,4vw,3rem); margin-bottom:1.5rem; }
    .main { gap:2rem; }
    .portrait { width:90px; height:115px; }
    .s14-mask { font-size:clamp(2.5rem,5vw,4rem); }
    .s14-item { font-size:clamp(1rem,2.2vw,1.5rem); gap:0.8rem; }
    .cost-list { gap:0.8rem; }
  }
</style>
