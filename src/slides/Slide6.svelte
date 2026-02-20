<script lang="ts">
  import { onMount } from 'svelte';
  import { gsap } from 'gsap';
  onMount(() => {
    gsap.fromTo('.s6-label', { opacity:0 }, { opacity:1, duration:0.6 })
    gsap.fromTo('.s6-who',   { opacity:0, y:30 }, { opacity:1, y:0, duration:1, ease:'power3.out', delay:0.3 })
    gsap.fromTo('.s6-key',   { opacity:0, x:40 }, { opacity:1, x:0, duration:0.7, stagger:0.2, ease:'power2.out', delay:1 })
  });
</script>

<div class="slide">
  <p class="s6-label">仁の正義</p>
  <h2 class="s6-who">
    ベンサム<span class="dim">／</span><span class="red">功利主義</span>
  </h2>
  <ul>
    <li class="s6-key">正義は<strong>「結果」</strong>のみで決まる</li>
    <li class="s6-key"><strong>最大多数の最大幸福</strong> ＝ 民の生存</li>
    <li class="s6-key">手段がどれほど「悪」でも、結果が善なら善</li>
  </ul>
  <div class="verdict">
    「民が死んでしまっては、誉れも何もない」
  </div>
</div>

<style>
  .slide {
    width:100%; height:100%;
    background:radial-gradient(ellipse at 50% 30%,#10060a,#09070a 70%);
    display:flex; flex-direction:column; align-items:center; justify-content:center;
    position:relative; overflow:hidden; gap:0;
    font-family:'Noto Serif JP',serif; color:#f5f0e8;
  }
  .s6-label { font-size:clamp(0.9rem,1.6vw,1.2rem); letter-spacing:0.25em; color:rgba(245,240,232,0.45); margin-bottom:1.2rem; }
  .s6-who { font-size:clamp(3rem,7vw,6.5rem); font-weight:900; margin-bottom:2.5rem; text-align:center; }
  .red { color:#c0504d; }
  .dim { color:rgba(245,240,232,0.25); margin:0 0.3rem; }
  ul { list-style:none; padding:0; display:flex; flex-direction:column; gap:1.2rem; margin-bottom:2.5rem; }
  li { font-size:clamp(1.2rem,2.5vw,2rem); color:rgba(245,240,232,0.78); display:flex; align-items:center; gap:1rem; }
  li::before { content:'—'; color:#c0504d; flex-shrink:0; }
  strong { color:#f5f0e8; }
  .verdict { font-size:clamp(1.1rem,2.2vw,1.8rem); font-style:italic; color:#c9a84c; border-left:4px solid #8b1a1a; padding:0.5rem 1.5rem; }
</style>
