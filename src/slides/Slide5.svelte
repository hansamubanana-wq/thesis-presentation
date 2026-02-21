<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    gsap.fromTo(".s5-label", { opacity: 0 }, { opacity: 1, duration: 0.6 });
    gsap.fromTo(
      ".s5-who",
      { opacity: 0, y: 30 },
      { opacity: 1, y: 0, duration: 1, ease: "power3.out", delay: 0.3 },
    );
    gsap.fromTo(
      ".s5-key",
      { opacity: 0, x: -40 },
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
      ".kant-img",
      { opacity: 0, x: 60 },
      { opacity: 1, x: 0, duration: 1, ease: "power2.out", delay: 0.5 },
    );
  });
</script>

<div class="slide">
  <div class="content">
    <!-- left: text -->
    <div class="left">
      <p class="s5-label">志村の正義</p>
      <h2 class="s5-who">
        カント<span class="dim">／</span><span class="red">義務論</span>
      </h2>
      <ul>
        <li class="s5-key">正義は<strong>「動機・過程」</strong>で決まる</li>
        <li class="s5-key">結果に関わらず<strong>ルールは絶対</strong></li>
        <li class="s5-key">定言命法 ― 普遍的に通じる行為のみ善</li>
      </ul>
    </div>
    <!-- right: kant.jpg 1110×1600 縦長ポートレート -->
    <div class="right">
      <img
        src="/images/kant.jpg"
        alt="カント"
        class="kant-img"
        onerror={(e) => ((e.target as HTMLElement).style.display = "none")}
      />
      <p class="img-cap">Immanuel Kant<br />1724–1804</p>
    </div>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    background: radial-gradient(ellipse at 50% 30%, #100d08, #09070a 70%);
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

  /* left text area */
  .left {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 0;
  }
  .s5-label {
    font-size: clamp(0.9rem, 1.6vw, 1.2rem);
    letter-spacing: 0.25em;
    color: rgba(245, 240, 232, 0.45);
    margin-bottom: 1rem;
  }
  .s5-who {
    font-size: clamp(2.5rem, 5.5vw, 4.5rem);
    font-weight: 900;
    margin-bottom: 2rem;
  }
  .red {
    color: #c0504d;
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
    color: #c0504d; /* Shimura Red */
    flex-shrink: 0;
  }
  strong {
    color: #f5f0e8;
  }

  /* right image: kant.jpg 1110×1600 → tall portrait */
  .right {
    flex-shrink: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.8rem;
  }
  .kant-img {
    /* preserve 1110:1600 ratio. Show at ~300px wide → ~433px tall */
    width: clamp(200px, 28vw, 320px);
    aspect-ratio: 1110 / 1600;
    object-fit: cover;
    object-position: center top;
    border-radius: 4px;
    border: 2px solid rgba(192, 80, 77, 0.3);
    filter: grayscale(20%) sepia(10%);
    box-shadow: 0 0 40px rgba(0, 0, 0, 0.6);
  }
  .img-cap {
    font-size: 0.75rem;
    color: rgba(245, 240, 232, 0.3);
    text-align: center;
    line-height: 1.5;
  }

  @media (max-width: 1366px) {
    .content {
      gap: 2.5rem;
    }
    .s5-who {
      font-size: clamp(2rem, 4.5vw, 3.5rem);
      margin-bottom: 1.5rem;
    }
    li {
      font-size: clamp(0.95rem, 1.8vw, 1.4rem);
      gap: 0.7rem;
    }
    ul {
      gap: 0.9rem;
    }
    .kant-img {
      width: clamp(160px, 20vw, 240px);
    }
  }
  @media (max-width: 1024px) {
    .content {
      gap: 1.5rem;
    }
    .s5-label {
      font-size: clamp(0.75rem, 1.3vw, 1rem);
      margin-bottom: 0.6rem;
    }
    .s5-who {
      font-size: clamp(1.6rem, 4vw, 2.8rem);
      margin-bottom: 1rem;
    }
    li {
      font-size: clamp(0.85rem, 1.6vw, 1.2rem);
      gap: 0.5rem;
    }
    ul {
      gap: 0.7rem;
    }
    .kant-img {
      width: clamp(120px, 16vw, 180px);
    }
  }
</style>
