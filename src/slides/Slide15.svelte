<script lang="ts">
  import { onMount } from "svelte";
  import { gsap } from "gsap";
  onMount(() => {
    const tl = gsap.timeline();
    tl.fromTo(".s15-label", { opacity: 0 }, { opacity: 1, duration: 0.6 })
      .fromTo(
        ".s15-head",
        { opacity: 0, y: -20, letterSpacing: "0.5em" },
        {
          opacity: 1,
          y: 0,
          letterSpacing: "0.08em",
          duration: 1.2,
          ease: "power3.out",
        },
        "-=0.2",
      )
      .fromTo(
        ".logic-norm",
        { opacity: 0, x: -30 },
        { opacity: 1, x: 0, duration: 0.8, ease: "power2.out" },
        "-=0.3",
      )
      .fromTo(
        ".arrow",
        { opacity: 0, scale: 0, rotation: -90 },
        {
          opacity: 1,
          scale: 1,
          rotation: 0,
          duration: 0.6,
          ease: "back.out(2)",
        },
        "-=0.2",
      )
      .fromTo(
        ".logic-surv",
        { opacity: 0, x: 30 },
        { opacity: 1, x: 0, duration: 0.8, ease: "power2.out" },
        "-=0.2",
      )
      .fromTo(
        ".s15-final",
        { opacity: 0, scale: 0.88, filter: "blur(8px)" },
        {
          opacity: 1,
          scale: 1,
          filter: "blur(0px)",
          duration: 1.3,
          ease: "power3.out",
        },
        "+=0.2",
      );

    // Continuous animations
    gsap.to(".s15-final", {
      textShadow: "0 0 40px rgba(201,168,76,0.5)",
      repeat: -1,
      yoyo: true,
      duration: 3,
      ease: "sine.inOut",
      delay: 2.5,
    });

    gsap.to(".bg-finale", {
      scale: 1.05,
      yoyo: true,
      repeat: -1,
      duration: 30, // Very slow zoom for cinematic effect
      ease: "sine.inOut",
    });

    gsap.to(".arrow", {
      scale: 1.1,
      textShadow: "0 0 20px rgba(200,60,10,0.8)",
      color: "#c0504d",
      repeat: -1,
      yoyo: true,
      duration: 0.8,
      ease: "power1.inOut",
      delay: 2,
    });

    gsap.to(".logic-surv", {
      boxShadow: "0 0 15px rgba(139,26,26,0.4)",
      borderColor: "rgba(139,26,26,0.6)",
      repeat: -1,
      yoyo: true,
      duration: 1.5,
      ease: "sine.inOut",
      delay: 2.5,
    });

    gsap.to(".end-particle", {
      y: () => -(Math.random() * 300 + 100),
      opacity: 0,
      duration: () => Math.random() * 4 + 2,
      stagger: 0.2,
      repeat: -1,
      ease: "power1.out",
      delay: 1.5,
    });
  });
</script>

<div class="slide">
  <!-- New Cinematic Background -->
  <div class="bg-wrapper">
    <img
      src="/images/ghost_finale.jpg"
      alt=""
      class="bg-finale"
      onerror={(e) => ((e.target as HTMLElement).style.display = "none")}
    />
  </div>

  <div class="final-bg"></div>
  <div class="particles" aria-hidden="true">
    {#each Array(16) as _, i}
      <span
        class="end-particle"
        style="left:{5 + i * 5.8}%; top:85%; opacity:0.3"
      ></span>
    {/each}
  </div>

  <div class="content">
    <p class="s15-label">結論：「必要悪」は存在するのか</p>
    <h2 class="s15-head">規範と生存の<span class="gold">ジレンマ</span></h2>

    <div class="s15-contrast">
      <div class="logic-norm">
        <div class="logic-label dim">「平時」の論理（規範）</div>
        <div class="logic-val">
          社会の秩序を維持するため<br />ルールの遵守は絶対
        </div>
      </div>
      <div class="arrow">VS</div>
      <div class="logic-surv">
        <div class="logic-label highlight">「非常時」の論理（生存）</div>
        <div class="logic-val">
          危機における規範の固守は<br />却って大量の死を招く
        </div>
      </div>
    </div>

    <blockquote class="s15-final">
      極限状態において、より多くの命を救うという「結果」のために<br />
      一時的に規範を破る行為（手段としての悪）は<strong>一定の正当性</strong
      >を持つ。<br />
      <span class="s15-final-bottom"
        >ゆえに、境井仁の選択は単なる堕落ではなく、<br
        />状況に応じた合理的な判断であった。</span
      >
    </blockquote>
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    background: #09070a;
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

  .bg-wrapper {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    z-index: 1;
    pointer-events: none;
    overflow: hidden; /* For the slow zoom */
  }

  .bg-finale {
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0.25; /* Keep dark to not disrupt text */
    filter: grayscale(40%) brightness(0.6) contrast(1.2);
  }

  .final-bg {
    position: absolute;
    inset: 0;
    /* Create a vignette effect so edges are dark */
    background: radial-gradient(
      ellipse at 50% 100%,
      rgba(201, 168, 76, 0.08) 0%,
      #09070a 80%
    );
    pointer-events: none;
    z-index: 2;
  }
  .particles {
    position: absolute;
    inset: 0;
    pointer-events: none;
    z-index: 3;
  }
  .end-particle {
    position: absolute;
    width: 2px;
    height: 2px;
    border-radius: 50%;
    background: #c9a84c;
    box-shadow: 0 0 5px #c9a84c;
  }

  .content {
    position: relative;
    z-index: 4;
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
  }

  .s15-label {
    font-size: clamp(0.9rem, 1.6vw, 1.2rem);
    letter-spacing: 0.25em;
    color: rgba(245, 240, 232, 0.4);
    margin-bottom: 1.2rem;
  }
  .s15-head {
    font-size: clamp(2.5rem, 5.5vw, 5rem);
    font-weight: 900;
    text-align: center;
    letter-spacing: 0.08em;
    margin-bottom: 2rem;
  }
  .gold {
    color: #c9a84c;
  }
  .dim {
    color: rgba(245, 240, 232, 0.35);
  }
  .s15-contrast {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 2rem;
    margin-bottom: 2.5rem;
    width: min(760px, 85vw);
  }
  .logic-norm,
  .logic-surv {
    flex: 1;
    text-align: center;
    padding: 1.5rem 1.5rem;
    border-radius: 8px;
    transition: transform 0.3s ease;
  }
  .logic-norm {
    background: rgba(20, 20, 20, 0.5);
    backdrop-filter: blur(4px);
    border: 1px solid rgba(255, 255, 255, 0.08);
  }
  .logic-surv {
    background: rgba(60, 10, 10, 0.6);
    backdrop-filter: blur(4px);
    border: 1px solid rgba(139, 26, 26, 0.4);
    position: relative;
    overflow: hidden;
  }
  .logic-surv::before {
    content: "";
    position: absolute;
    top: 0;
    left: -100%;
    width: 50%;
    height: 100%;
    background: linear-gradient(
      90deg,
      transparent,
      rgba(200, 60, 10, 0.1),
      transparent
    );
    animation: shine 3s infinite linear 2s;
  }
  @keyframes shine {
    to {
      left: 200%;
    }
  }

  .logic-label {
    font-size: clamp(0.9rem, 1.5vw, 1.1rem);
    font-weight: 700;
    letter-spacing: 0.1em;
    margin-bottom: 0.8rem;
  }
  .highlight {
    color: #c0504d;
  }
  .logic-val {
    font-size: clamp(1.1rem, 2vw, 1.6rem);
    color: rgba(245, 240, 232, 0.9);
    line-height: 1.5;
  }
  .arrow {
    font-size: clamp(2.5rem, 5vw, 3.5rem);
    color: rgba(201, 168, 76, 0.4);
    flex-shrink: 0;
    font-weight: 900;
    font-style: italic;
    transform-origin: center center;
  }
  .s15-final {
    font-size: clamp(1.15rem, 2.2vw, 1.55rem);
    color: rgba(245, 240, 232, 0.85);
    text-align: center;
    line-height: 1.8;
    max-width: 850px;
    font-style: normal;
    margin-bottom: 2rem;
    background: rgba(10, 8, 5, 0.7);
    padding: 1.5rem 2rem;
    border-radius: 8px;
    border: 1px solid rgba(201, 168, 76, 0.2);
    backdrop-filter: blur(2px);
  }
  .s15-final strong {
    color: #f5f0e8;
    font-weight: 900;
  }
  .s15-final-bottom {
    display: inline-block;
    margin-top: 1.5rem;
    font-size: 1.1em;
    font-weight: 700;
    color: #c9a84c;
  }

  @media (max-width: 1366px) {
    .s15-head {
      font-size: clamp(2rem, 4.5vw, 4rem);
      margin-bottom: 1.5rem;
    }
    .s15-contrast {
      gap: 1.5rem;
      margin-bottom: 2rem;
    }
    .logic-norm,
    .logic-surv {
      padding: 1.2rem;
    }
    .logic-val {
      font-size: clamp(0.95rem, 1.7vw, 1.3rem);
    }
    .arrow {
      font-size: clamp(2rem, 4vw, 3rem);
    }
    .s15-final {
      font-size: clamp(1rem, 1.9vw, 1.35rem);
      max-width: 720px;
      margin-bottom: 1.5rem;
      line-height: 1.7;
      padding: 1.2rem;
    }
    .s15-final-bottom {
      margin-top: 1rem;
      font-size: 1em;
    }
  }
  @media (max-width: 1024px) {
    .s15-label {
      font-size: clamp(0.75rem, 1.3vw, 1rem);
      margin-bottom: 0.8rem;
    }
    .s15-head {
      font-size: clamp(1.8rem, 4vw, 3rem);
      margin-bottom: 1.2rem;
    }
    .s15-contrast {
      gap: 1rem;
      margin-bottom: 1.5rem;
      flex-direction: column;
      align-items: stretch;
    }
    .logic-norm,
    .logic-surv {
      padding: 1rem;
    }
    .logic-label {
      font-size: clamp(0.75rem, 1.3vw, 0.9rem);
      margin-bottom: 0.5rem;
    }
    .logic-val {
      font-size: clamp(0.85rem, 1.5vw, 1.1rem);
      line-height: 1.4;
    }
    .arrow {
      font-size: clamp(1.5rem, 3vw, 2.5rem);
      margin: 0.5rem 0;
    }
    .s15-final {
      font-size: clamp(0.85rem, 1.6vw, 1.15rem);
      max-width: 600px;
      margin-bottom: 1rem;
      line-height: 1.6;
      padding: 1rem;
    }
    .s15-final-bottom {
      margin-top: 0.8rem;
      font-size: 0.95em;
    }
  }
</style>
