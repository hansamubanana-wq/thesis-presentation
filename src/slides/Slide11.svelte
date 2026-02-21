<script lang="ts">
  import { onMount } from 'svelte';
  import { gsap } from 'gsap';
  onMount(() => {
    gsap.fromTo('.s11-head',  { opacity:0, y:30 }, { opacity:1, y:0, duration:1, ease:'power3.out' })
    gsap.fromTo('.s11-law',   { opacity:0, x:-50 }, { opacity:1, x:0, duration:0.8, ease:'power2.out', delay:0.8 })
    gsap.fromTo('.s11-dirty', { opacity:0, x:50 },  { opacity:1, x:0, duration:0.8, ease:'power2.out', delay:0.8 })
    gsap.fromTo('.s11-note',  { opacity:0 }, { opacity:1, duration:0.9, delay:1.5 })
  });
</script>

<div class="slide">
  <h2 class="s11-head">法と哲学の答え</h2>
  <div class="two-col">
    <div class="col s11-law">
      <div class="tag">刑法第37条</div>
      <div class="title gold">緊急避難</div>
      <div class="body">害が害を超えなければ<strong>罰しない</strong></div>
    </div>
    <div class="col s11-dirty">
      <div class="tag">M.ウォルツァー</div>
      <div class="title red">ダーティ・ハンズ</div>
      <div class="body"><strong>不作為もまた責任</strong>である</div>
    </div>
  </div>
  <div class="s11-note">
    対馬 ＝ 沈没しかけた「カルネアデスの板」
  </div>
</div>

<style>
  .slide {
    width:100%; height:100%;
    background:#09070a;
    display:flex; flex-direction:column; align-items:center; justify-content:center;
    position:relative; overflow:hidden;
    font-family:'Noto Serif JP',serif; color:#f5f0e8; gap:0;
  }
  .s11-head { font-size:clamp(3rem,7vw,6rem); font-weight:900; text-align:center; margin-bottom:3rem; }
  .two-col { display:grid; grid-template-columns:1fr 1fr; gap:2rem; width:min(760px,85vw); margin-bottom:2.5rem; }
  .col { padding:2.5rem 2rem; border-radius:8px; text-align:center; display:flex; flex-direction:column; gap:1rem; }
  .s11-law   { background:rgba(85,136,204,0.07); border:1px solid rgba(85,136,204,0.25); }
  .s11-dirty { background:rgba(139,26,26,0.08); border:1px solid rgba(139,26,26,0.28); }
  .tag   { font-size:clamp(0.8rem,1.4vw,1rem); letter-spacing:0.1em; color:rgba(245,240,232,0.4); }
  .title { font-size:clamp(1.8rem,3.5vw,2.8rem); font-weight:900; }
  .body  { font-size:clamp(1.1rem,2vw,1.6rem); color:rgba(245,240,232,0.75); line-height:1.6; }
  .body strong { color:#f5f0e8; }
  .s11-note { font-size:clamp(1.2rem,2.3vw,1.8rem); color:rgba(245,240,232,0.6); text-align:center; }
  .gold { color:#c9a84c; } .red { color:#c0504d; }

  @media (max-width: 1366px) {
    .s11-head { font-size:clamp(2.5rem,5.5vw,5rem); margin-bottom:2rem; }
    .col { padding:2rem 1.5rem; }
    .title { font-size:clamp(1.5rem,3vw,2.2rem); }
    .body { font-size:clamp(0.95rem,1.7vw,1.3rem); }
  }
  @media (max-width: 1024px) {
    .s11-head { font-size:clamp(2rem,5vw,4rem); margin-bottom:1.5rem; }
    .two-col { gap:1.2rem; }
    .col { padding:1.5rem 1.2rem; gap:0.7rem; }
    .tag { font-size:clamp(0.7rem,1.2vw,0.85rem); }
    .title { font-size:clamp(1.3rem,2.5vw,1.8rem); }
    .body { font-size:clamp(0.85rem,1.5vw,1.1rem); }
    .s11-note { font-size:clamp(1rem,2vw,1.4rem); }
  }
</style>
