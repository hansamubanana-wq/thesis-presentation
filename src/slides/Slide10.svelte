<script lang="ts">
  import { onMount } from 'svelte';
  import { gsap } from 'gsap';
  onMount(() => {
    gsap.fromTo('.s10-head',  { opacity:0, y:30 }, { opacity:1, y:0, duration:1, ease:'power3.out' })
    gsap.fromTo('.s10-a',     { opacity:0, x:-40 }, { opacity:1, x:0, duration:0.8, ease:'power2.out', delay:0.8 })
    gsap.fromTo('.s10-b',     { opacity:0, x:40 },  { opacity:1, x:0, duration:0.8, ease:'power2.out', delay:1.2 })
    gsap.fromTo('.s10-note',  { opacity:0 }, { opacity:1, duration:0.9, delay:1.8 })
    gsap.to('.trolley', { x:20, repeat:-1, yoyo:true, duration:1.5, ease:'sine.inOut', delay:2 })
  });
</script>

<div class="slide">
  <h2 class="s10-head">トロッコ問題 <span class="trolley">🚃</span></h2>
  <div class="cases">
    <div class="case s10-a ok-box">
      <div class="mark ok">○</div>
      <div class="case-text">
        <div class="case-title">レバーを引く</div>
        <div class="case-sub">1人の犠牲 → 5人を救う</div>
      </div>
    </div>
    <div class="case s10-b ng-box">
      <div class="mark ng">✕</div>
      <div class="case-text">
        <div class="case-title">太った男を突き落とす</div>
        <div class="case-sub">計算は同じ ― でも「できない」</div>
      </div>
    </div>
  </div>
  <div class="s10-note">
    「直接手を下す」ことへの<strong>道徳的な一線</strong>がある
  </div>
</div>

<style>
  .slide {
    width:100%; height:100%;
    background:linear-gradient(to bottom,#070810,#09070a);
    display:flex; flex-direction:column; align-items:center; justify-content:center;
    position:relative; overflow:hidden;
    font-family:'Noto Serif JP',serif; color:#f5f0e8; gap:0;
  }
  .s10-head { font-size:clamp(3rem,7vw,6rem); font-weight:900; text-align:center; margin-bottom:3rem; display:flex; align-items:center; gap:1rem; }
  .trolley { display:inline-block; font-size:0.7em; }
  .cases { display:flex; flex-direction:column; gap:1.2rem; width:min(640px,85vw); margin-bottom:2.5rem; }
  .case { display:flex; align-items:center; gap:2rem; padding:1.8rem 2.5rem; border-radius:8px; }
  .ok-box { background:rgba(85,170,80,0.07); border:1px solid rgba(85,170,80,0.25); }
  .ng-box { background:rgba(139,26,26,0.1); border:1px solid rgba(139,26,26,0.3); }
  .mark { font-size:clamp(2rem,4vw,3rem); font-weight:900; flex-shrink:0; }
  .ok { color:#7fc97f; } .ng { color:#c0504d; }
  .case-title { font-size:clamp(1.5rem,3vw,2.2rem); font-weight:700; margin-bottom:0.3rem; }
  .case-sub   { font-size:clamp(1rem,2vw,1.5rem); color:rgba(245,240,232,0.55); }
  .s10-note { font-size:clamp(1.3rem,2.5vw,2rem); color:rgba(245,240,232,0.75); text-align:center; }
  .s10-note strong { color:#c9a84c; }
</style>
