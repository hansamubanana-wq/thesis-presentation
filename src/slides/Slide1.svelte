<script lang="ts">
  import { onMount } from 'svelte';
  import { gsap } from 'gsap';
  onMount(() => {
    gsap.fromTo('.s1-tag',   { opacity:0 }, { opacity:1, duration:0.8 })
    gsap.fromTo('.s1-title', { opacity:0, y:40, filter:'blur(16px)' }, { opacity:1, y:0, filter:'blur(0px)', duration:1.6, ease:'power3.out', delay:0.5 })
    gsap.fromTo('.s1-quote', { opacity:0, x:-30 }, { opacity:1, x:0, duration:1.2, ease:'power2.out', delay:1.8 })
    gsap.fromTo('.s1-name',  { opacity:0 }, { opacity:1, duration:0.8, delay:2.8 })
    gsap.to('.s1-title', { textShadow:'0 0 80px rgba(139,26,26,0.8)', repeat:-1, yoyo:true, duration:2.5, ease:'sine.inOut', delay:3 })
    gsap.to('.particle', { y:()=>-(Math.random()*200+80), opacity:0, duration:()=>Math.random()*3+2, stagger:0.12, repeat:-1, ease:'power1.out' })
  });
</script>

<div class="slide">
  <!-- 3840×2160 full-bleed background -->
  <img src="/images/title.jpg" alt="" class="bg-photo" onerror={(e) => ((e.target as HTMLElement).style.display='none')} />
  <div class="overlay"></div>
  <div class="particles">{#each Array(18) as _,i}<span class="particle" style="left:{4+i*5.5}%;top:90%"></span>{/each}</div>

  <p class="s1-tag">卒業論文</p>
  <h1 class="s1-title">
    『ゴースト・オブ・ツシマ』<br>と<span class="red">必要悪</span>の倫理学
  </h1>
  <blockquote class="s1-quote">「誉れは浜で死にました」</blockquote>
  <p class="s1-name">土蔵 創一</p>
</div>

<style>
  .slide {
    width:100%; height:100%;
    background:#09070a;
    display:flex; flex-direction:column; align-items:center; justify-content:center;
    position:relative; overflow:hidden; gap:0;
    font-family:'Noto Serif JP',serif; color:#f5f0e8;
  }
  /* 3840×2160 → full-bleed, aspect matches slide */
  .bg-photo {
    position:absolute; inset:0;
    width:100%; height:100%; object-fit:cover;
    opacity:0.35;
    pointer-events:none;
  }
  /* gradient overlay so text stays readable */
  .overlay {
    position:absolute; inset:0;
    background:radial-gradient(ellipse at 50% 50%, rgba(9,7,10,0.45) 0%, rgba(9,7,10,0.75) 100%);
    pointer-events:none;
  }
  .particles { position:absolute; inset:0; pointer-events:none; }
  .particle { position:absolute; width:3px; height:3px; border-radius:50%; background:#8b1a1a; box-shadow:0 0 6px #8b1a1a; opacity:0.4; }

  .s1-tag { position:relative; font-size:clamp(0.9rem,1.5vw,1.1rem); letter-spacing:0.3em; color:rgba(201,168,76,0.75); margin-bottom:2.5rem; }
  h1 { position:relative; font-size:clamp(2.8rem,6vw,5.5rem); font-weight:900; line-height:1.45; text-align:center; color:#f5f0e8; margin-bottom:3rem; }
  .red { color:#c0504d; }
  blockquote { position:relative; font-size:clamp(1.5rem,3vw,2.6rem); font-style:italic; color:#c9a84c; border-left:4px solid #8b1a1a; padding:0.4rem 1.8rem; margin-bottom:2.5rem; }
  .s1-name { position:relative; font-size:clamp(1rem,1.8vw,1.4rem); color:rgba(201,168,76,0.6); letter-spacing:0.25em; }
</style>
