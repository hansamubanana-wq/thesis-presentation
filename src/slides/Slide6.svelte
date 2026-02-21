<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(".s6-label", { opacity: 0 }, { opacity: 1, duration: 0.6 });
    gsap.fromTo(
      ".s6-who",
      { opacity: 0, y: 30 },
      { opacity: 1, y: 0, duration: 1, ease: "power3.out", delay: 0.3 },
    );
    gsap.fromTo(
      ".s6-key",
      { opacity: 0, x: 40 },
      {
        opacity: 1,
        x: 0,
        duration: 0.7,
        stagger: 0.2,
        ease: "power2.out",
        delay: 1,
      },
    );
    gsap.fromTo(
      ".verdict",
      { opacity: 0, y: 20 },
      { opacity: 1, y: 0, duration: 0.8, ease: "power2.out", delay: 1.8 },
    );
    gsap.fromTo(
      ".bentham-img",
      { opacity: 0, x: -60 },
      { opacity: 1, x: 0, duration: 1, ease: "power2.out", delay: 0.5 },
    );
  });
</script>

<div class="slide">
  <div class="content">
    <!-- left: bentham.jpg 1110×1600 縦長ポートレート (Mirror of kant) -->
    <div class="left-img">
      <img
        src="/images/bentham.jpg"
        alt="ベンサム"
        class="bentham-img"
        onerror={(e) => ((e.target as HTMLElement).style.display = "none")}
      />
      <p class="img-cap">Jeremy Bentham<br />1748–1832</p>
    </div>

    <!-- right: text -->
    <div class="right-text">
      <p class="s6-label">仁の正義</p>
      <h2 class="s6-who">
        ベンサム<span class="dim">／</span><span class="blue">功利主義</span>
      </h2>
      <ul>
        <li class="s6-key">正義は<strong>「結果」</strong>のみで決まる</li>
        <li class="s6-key">
          <strong>より多くの命を救うこと</strong> ＝ 民の生存
        </li>
        <li class="s6-key">手段がどれほど「悪」でも、結果が善なら善</li>
      </ul>
      <div class="verdict">「民が死んでしまっては、誉れも何もない」</div>
    </div>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    background: radial-gradient(ellipse at 50% 30%, #10060a, #09070a 70%);
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
    font-family: "Noto Serif JP", serif;
    color: #f5f0e8;
  }
  .content {
    display: flex;
    align-items: center;
    gap: 4rem;
    width: 90%;
    height: 90%;
  }

  /* left image: bentham.jpg 1110×1600 → tall portrait */
  .left-img {
    flex-shrink: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.8rem;
  }
  .bentham-img {
    /* preserve 1110:1600 ratio. Show at ~300px wide → ~433px tall */
    width: clamp(200px, 28vw, 320px);
    aspect-ratio: 1110 / 1600;
    object-fit: cover;
    object-position: center top;
    border-radius: 4px;
    border: 2px solid rgba(108, 122, 156, 0.4);
    filter: grayscale(20%) sepia(10%);
    box-shadow: 0 0 40px rgba(0, 0, 0, 0.6);
  }
  .img-cap {
    font-size: 0.75rem;
    color: rgba(245, 240, 232, 0.3);
    text-align: center;
    line-height: 1.5;
  }

  /* right text area */
  .right-text {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 0;
  }
  .s6-label {
    font-size: clamp(0.9rem, 1.6vw, 1.2rem);
    letter-spacing: 0.25em;
    color: rgba(245, 240, 232, 0.45);
    margin-bottom: 1rem;
  }
  .s6-who {
    font-size: clamp(2.5rem, 5.5vw, 4.5rem);
    font-weight: 900;
    margin-bottom: 2rem;
  }
  .blue {
    color: #6c7a9c;
  }
  .dim {
    color: rgba(245, 240, 232, 0.25);
    margin: 0 0.3rem;
  }
  ul {
    list-style: none;
    padding: 0;
    display: flex;
    flex-direction: column;
    gap: 1.2rem;
    margin-bottom: 2rem;
  }
  li {
    font-size: clamp(1.1rem, 2.2vw, 1.8rem);
    color: rgba(245, 240, 232, 0.78);
    display: flex;
    align-items: center;
    gap: 1rem;
  }
  li::before {
    content: "—";
    color: #6c7a9c; /* Ghost Blue */
    flex-shrink: 0;
  }
  strong {
    color: #f5f0e8;
  }
  .verdict {
    font-size: clamp(1rem, 2vw, 1.6rem);
    font-style: italic;
    color: #c9a84c;
    border-left: 4px solid #8b1a1a;
    padding: 0.5rem 1.5rem;
    align-self: flex-start; /* Keep it aligned to the left of the text block */
  }

  @media (max-width: 1366px) {
    .content {
      gap: 2.5rem;
    }
    .s6-who {
      font-size: clamp(2rem, 4.5vw, 3.5rem);
      margin-bottom: 1.5rem;
    }
    li {
      font-size: clamp(0.95rem, 1.8vw, 1.4rem);
      gap: 0.7rem;
    }
    ul {
      gap: 0.9rem;
      margin-bottom: 1.5rem;
    }
    .bentham-img {
      width: clamp(160px, 20vw, 240px);
    }
    .verdict {
      font-size: clamp(0.9rem, 1.8vw, 1.4rem);
    }
  }
  @media (max-width: 1024px) {
    .content {
      gap: 1.5rem;
    }
    .s6-label {
      font-size: clamp(0.75rem, 1.3vw, 1rem);
      margin-bottom: 0.6rem;
    }
    .s6-who {
      font-size: clamp(1.6rem, 4vw, 2.8rem);
      margin-bottom: 1rem;
    }
    li {
      font-size: clamp(0.85rem, 1.6vw, 1.2rem);
      gap: 0.5rem;
    }
    ul {
      gap: 0.7rem;
      margin-bottom: 1.2rem;
    }
    .bentham-img {
      width: clamp(120px, 16vw, 180px);
    }
    .verdict {
      font-size: clamp(0.85rem, 1.5vw, 1.2rem);
      padding: 0.4rem 1.2rem;
    }
  }
</style>
