<script lang="ts">
  import { onMount } from 'svelte';
  import { gsap } from 'gsap';
  onMount(() => {
    gsap.fromTo('.s8-label', { opacity:0 }, { opacity:1, duration:0.6 })
    gsap.fromTo('.s8-head',  { opacity:0, y:30 }, { opacity:1, y:0, duration:1, ease:'power3.out', delay:0.3 })
    gsap.fromTo('.mach-img', { opacity:0, x:-60 }, { opacity:1, x:0, duration:1, ease:'power2.out', delay:0.6 })
    gsap.fromTo('.s8-lion',  { opacity:0, x:60, scale:0.8 }, { opacity:1, x:0, scale:1, duration:0.8, ease:'back.out(1.5)', delay:1 })
    gsap.fromTo('.s8-plus',  { opacity:0 }, { opacity:1, duration:0.4, delay:1.5 })
    gsap.fromTo('.s8-fox',   { opacity:0, scale:0.8 }, { opacity:1, scale:1, duration:0.8, ease:'back.out(1.5)', delay:1.6 })
    gsap.fromTo('.s8-eq',    { opacity:0 }, { opacity:1, duration:0.4, delay:2 })
    gsap.fromTo('.s8-ghost', { opacity:0, scale:1.3 }, { opacity:1, scale:1, duration:0.9, ease:'power2.out', delay:2.1 })
    gsap.to('.s8-ghost', { textShadow:'0 0 40px rgba(192,80,77,1)', repeat:-1, yoyo:true, duration:1.8, ease:'sine.inOut', delay:3 })
  });
</script>

<div class="slide">
  <div class="inner">
    <!-- left: machiavelli.jpg 981×1260 縦長ポートレート -->
    <div class="left-img">
      <img src="/images/machiavelli.jpg" alt="マキャヴェッリ" class="mach-img"
        onerror={(e) => ((e.target as HTMLElement).style.display='none')} />
      <p class="img-cap">N.マキャヴェッリ<br>1469–1527</p>
    </div>

    <!-- right: content -->
    <div class="right">
      <p class="s8-label">マキャベリズム ― 君主論</p>
      <h2 class="s8-head">理想の君主とは何か</h2>
      <div class="formula">
        <div class="elem s8-lion">
          <div class="emo">🦁</div>
          <div class="name gold">ライオン</div>
          <div class="sub">力・恐怖</div>
        </div>
        <div class="s8-plus op">＋</div>
        <div class="elem s8-fox">
          <div class="emo">🦊</div>
          <div class="name" style="color:#c9884c">狐</div>
          <div class="sub">知恵・欺瞞</div>
        </div>
        <div class="s8-eq op">＝</div>
        <div class="elem s8-ghost">
          <div class="ghost-char">冥</div>
          <div class="name red">冥人</div>
          <div class="sub">境井仁</div>
        </div>
      </div>
    </div>
  </div>
</div>

<style>
  .slide {
    width:100%; height:100%;
    background:linear-gradient(to bottom,#0b0610,#09070a);
    display:flex; align-items:center; justify-content:center;
    position:relative; overflow:hidden;
    font-family:'Noto Serif JP',serif; color:#f5f0e8;
  }
  .inner { display:flex; align-items:center; gap:4rem; width:90%; height:90%; }

  /* machiavelli.jpg 981×1260 → tall portrait on left */
  .left-img { flex-shrink:0; display:flex; flex-direction:column; align-items:center; gap:0.8rem; }
  .mach-img {
    width: clamp(160px, 22vw, 280px);
    aspect-ratio: 981 / 1260;
    object-fit:cover;
    object-position:center top;
    border-radius:4px;
    border:2px solid rgba(192,80,77,0.3);
    filter:grayscale(15%) sepia(15%);
    box-shadow:0 0 40px rgba(0,0,0,0.6);
  }
  .img-cap { font-size:0.72rem; color:rgba(245,240,232,0.3); text-align:center; line-height:1.5; }

  /* right content */
  .right { flex:1; display:flex; flex-direction:column; gap:0; }
  .s8-label { font-size:clamp(0.9rem,1.6vw,1.2rem); letter-spacing:0.2em; color:rgba(245,240,232,0.4); margin-bottom:1rem; }
  .s8-head { font-size:clamp(2rem,4.5vw,3.8rem); font-weight:900; margin-bottom:2.5rem; }

  .formula { display:flex; align-items:center; gap:1.5rem; flex-wrap:wrap; }
  .elem { text-align:center; padding:1.5rem 2rem; border-radius:8px; }
  .s8-lion  { background:rgba(201,168,76,0.08); border:1px solid rgba(201,168,76,0.3); }
  .s8-fox   { background:rgba(176,112,48,0.1); border:1px solid rgba(176,112,48,0.3); }
  .s8-ghost { background:rgba(139,26,26,0.12); border:1px solid rgba(139,26,26,0.4); }
  .emo { font-size:clamp(2rem,4vw,3.5rem); margin-bottom:0.5rem; }
  .ghost-char { font-size:clamp(2rem,4vw,3.5rem); font-weight:900; color:#c0504d; line-height:1; margin-bottom:0.5rem; display:block; }
  .name { font-size:clamp(1.1rem,2vw,1.6rem); font-weight:900; margin-bottom:0.3rem; }
  .sub  { font-size:clamp(0.85rem,1.5vw,1.1rem); color:rgba(245,240,232,0.55); }
  .op   { font-size:clamp(1.8rem,3.5vw,2.8rem); font-weight:300; color:rgba(245,240,232,0.3); flex-shrink:0; }
  .gold { color:#c9a84c; } .red { color:#c0504d; }
</style>
