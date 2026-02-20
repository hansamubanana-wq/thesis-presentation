<script lang="ts">
  import { onMount } from 'svelte';
  import { gsap } from 'gsap';
  onMount(() => {
    gsap.fromTo('.s7-title', { opacity:0, y:25 }, { opacity:1, y:0, duration:1, ease:'power3.out' })
    gsap.fromTo('.s7-beam',  { opacity:0, scaleX:0 }, { opacity:1, scaleX:1, duration:0.8, ease:'power2.out', delay:0.6 })
    gsap.fromTo(['.s7-left','.s7-right'], { opacity:0, y:20 }, { opacity:1, y:0, duration:0.7, stagger:0.15, ease:'power2.out', delay:1 })

    const sw = gsap.timeline({ repeat:-1, delay:1.8 });
    sw.to('.s7-beam',  { rotation:-12, duration:2, ease:'sine.inOut' })
      .to('.s7-left',  { y:24, duration:2, ease:'sine.inOut' }, '<')
      .to('.s7-right', { y:-24, duration:2, ease:'sine.inOut' }, '<')
      .to('.s7-beam',  { rotation:12, duration:2, ease:'sine.inOut' })
      .to('.s7-left',  { y:-24, duration:2, ease:'sine.inOut' }, '<')
      .to('.s7-right', { y:24, duration:2, ease:'sine.inOut' }, '<')
      .to('.s7-beam',  { rotation:0, duration:1.2, ease:'sine.inOut' })
      .to(['.s7-left','.s7-right'], { y:0, duration:1.2, ease:'sine.inOut' }, '<')
  });
</script>

<div class="slide">
  <h2 class="s7-title">二つの正義は<br>決して交わらない</h2>

  <div class="scale-wrap">
    <div class="pivot">▼</div>
    <div class="s7-beam"></div>
    <div class="pans">
      <div class="pan s7-left">
        <div class="pan-name gold">義務論</div>
        <div class="pan-sub">志村の正義<br>「過程・動機」</div>
      </div>
      <div class="pan s7-right">
        <div class="pan-name red">功利主義</div>
        <div class="pan-sub">仁の正義<br>「結果」</div>
      </div>
    </div>
  </div>
</div>

<style>
  .slide {
    width:100%; height:100%;
    background:#09070a;
    display:flex; flex-direction:column; align-items:center; justify-content:center;
    position:relative; overflow:hidden;
    font-family:'Noto Serif JP',serif; color:#f5f0e8;
  }
  .s7-title { font-size:clamp(2.5rem,5.5vw,5rem); font-weight:900; text-align:center; line-height:1.35; margin-bottom:3rem; }
  .scale-wrap { display:flex; flex-direction:column; align-items:center; }
  .pivot { font-size:2rem; color:#c9a84c; line-height:1; }
  .s7-beam { width:min(560px,80%); height:5px; background:linear-gradient(to right,rgba(201,168,76,0.2),#c9a84c,rgba(201,168,76,0.2)); border-radius:3px; box-shadow:0 0 15px rgba(201,168,76,0.4); transform-origin:center; }
  .pans { width:min(560px,80%); display:flex; justify-content:space-between; margin-top:1.2rem; }
  .pan { width:44%; text-align:center; padding:1.5rem 1rem; border-radius:8px; position:relative; }
  .pan::before { content:''; position:absolute; top:-1.2rem; left:50%; transform:translateX(-50%); width:1px; height:1.2rem; background:rgba(201,168,76,0.4); }
  .s7-left  { background:rgba(201,168,76,0.07); border:1px solid rgba(201,168,76,0.25); }
  .s7-right { background:rgba(139,26,26,0.1);  border:1px solid rgba(139,26,26,0.3); }
  .pan-name { font-size:clamp(1.5rem,3vw,2.5rem); font-weight:900; margin-bottom:0.5rem; }
  .gold { color:#c9a84c; } .red { color:#c0504d; }
  .pan-sub { font-size:clamp(0.9rem,1.7vw,1.3rem); color:rgba(245,240,232,0.65); line-height:1.5; }
</style>
