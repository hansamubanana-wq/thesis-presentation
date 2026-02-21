<script lang="ts">
  import { onMount } from 'svelte';
  import { gsap } from 'gsap';
  onMount(() => {
    gsap.fromTo('.s2-sub',  { opacity:0 }, { opacity:1, duration:0.8 })
    gsap.fromTo('.s2-q1',   { opacity:0, y:50 }, { opacity:1, y:0, duration:1.1, ease:'power3.out', delay:0.4 })
    gsap.fromTo('.s2-q2',   { opacity:0, y:50 }, { opacity:1, y:0, duration:1.1, ease:'power3.out', delay:0.8 })
    gsap.fromTo('.s2-line', { scaleX:0 }, { scaleX:1, duration:1, ease:'power2.out', delay:1.4 })
  });
</script>

<div class="slide">
  <p class="s2-sub">研究の背景</p>
  <h2 class="s2-q1">「平時の正義」は</h2>
  <h2 class="s2-q2"><span class="red">非常時</span>にも通用するか？</h2>
  <div class="s2-line"></div>
</div>

<style>
  .slide {
    width:100%; height:100%;
    background:#09070a;
    display:flex; flex-direction:column; align-items:center; justify-content:center;
    position:relative; overflow:hidden;
    font-family:'Noto Serif JP',serif; color:#f5f0e8;
  }
  .s2-sub { font-size:clamp(1rem,1.8vw,1.4rem); letter-spacing:0.25em; color:rgba(201,168,76,0.6); margin-bottom:3rem; }
  h2 { font-size:clamp(3rem,7vw,6.5rem); font-weight:900; line-height:1.3; text-align:center; margin:0; }
  .s2-q1 { margin-bottom:0.4rem; }
  .s2-q2 { margin-bottom:3.5rem; }
  .red { color:#c0504d; }
  .s2-line { width:min(500px,70%); height:3px; background:linear-gradient(to right,transparent,#8b1a1a,transparent); transform-origin:left; box-shadow:0 0 12px rgba(139,26,26,0.5); }

  @media (max-width: 1366px) {
    h2 { font-size:clamp(2.5rem,5.5vw,5rem); }
    .s2-q2 { margin-bottom:2.5rem; }
  }
  @media (max-width: 1024px) {
    h2 { font-size:clamp(2rem,5vw,4rem); }
    .s2-sub { font-size:clamp(0.85rem,1.5vw,1.1rem); margin-bottom:2rem; }
    .s2-q2 { margin-bottom:2rem; }
  }
</style>
