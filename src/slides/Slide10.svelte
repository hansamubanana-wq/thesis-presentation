<script lang="ts">
  import { onMount, tick } from "svelte";
  import { gsap } from "gsap";
  import { CustomEase } from "gsap/dist/CustomEase"; // Or just use rough keyframes if plugin not available

  // Custom rough shake using keyframes instead of needing an extra plugin
  const shakeKeyframes = [
    { x: -10, y: 5 },
    { x: 8, y: -8 },
    { x: -6, y: 3 },
    { x: 4, y: -4 },
    { x: -2, y: 2 },
    { x: 0, y: 0 },
  ];

  let okBox: HTMLElement;
  let ngBox: HTMLElement;
  let animationTriggered = false;

  onMount(() => {
    const tl = gsap.timeline();
    // Fade in intro
    tl.fromTo(
      ".s10-head",
      { opacity: 0, y: 30 },
      { opacity: 1, y: 0, duration: 1, ease: "power3.out" },
    )
      .fromTo(
        ".s10-a",
        { opacity: 0, x: -40 },
        { opacity: 1, x: 0, duration: 0.8, ease: "power2.out" },
        "-=0.2",
      )
      .fromTo(
        ".s10-b",
        { opacity: 0, x: 40 },
        { opacity: 1, x: 0, duration: 0.8, ease: "power2.out" },
        "-=0.4",
      )
      .fromTo(
        ".s10-note",
        { opacity: 0 },
        { opacity: 1, duration: 0.9 },
        "+=0.2",
      );

    // Head trolley idle animation
    gsap.to(".head-trolley", {
      x: 20,
      repeat: -1,
      yoyo: true,
      duration: 1.5,
      ease: "sine.inOut",
      delay: 2,
    });

    // Scenario Animations setup
    gsap.set(".trolley-a", { x: -50, y: 0 }); // Trolley A start position
    gsap.set(".trolley-b", { x: -50 }); // Trolley B start position
    gsap.set(".lever-handle", {
      transformOrigin: "bottom center",
      rotation: -30,
    });
    gsap.set(".fatman", { y: -30, opacity: 0 }); // Fatman start on bridge

    // Hover interactions to trigger animations (or play them sequentially after intro)
    // We'll play them sequentially for dramatic effect during the presentation.

    setTimeout(() => {
      if (animationTriggered) return;
      animationTriggered = true;
      playAnimations();
    }, 3500); // Trigger a bit after the note appears
  });

  function playAnimations() {
    // --- Trolley Problem Animation (Lever) ---
    const tlA = gsap.timeline();
    // Train comes in
    tlA
      .to(".trolley-a", { x: 50, duration: 1.5, ease: "power1.in" })
      // Lever pulled
      .to(
        ".lever-handle",
        { rotation: 30, duration: 0.3, ease: "power2.inOut" },
        "-=0.8",
      )
      // Train diverts (moves down to the lower track)
      .to(".trolley-a", { x: 120, y: 30, duration: 1, ease: "power1.out" })
      // IMPACT
      .to(
        ".slide",
        { keyframes: shakeKeyframes, duration: 0.4, ease: "power1.inOut" },
        "-=0.2",
      ) // Shake slide
      .to(
        ".red-flash",
        { opacity: 1, duration: 0.05, yoyo: true, repeat: 1 },
        "-=0.4",
      ) // Flash red
      // 1 Person hit effect
      .to(
        ".person-1",
        {
          opacity: 0.2,
          scale: 0.5,
          transformOrigin: "center center",
          duration: 0.2,
          ease: "power2.in",
        },
        "-=0.4",
      )
      .to(".blood-a", { opacity: 1, scale: 1.5, duration: 0.3 }, "-=0.2");

    // --- Footbridge Dilemma Animation ---
    const tlB = gsap.timeline({ delay: 1.5 }); // Start slightly after A
    // Train comes in
    tlB
      .to(".trolley-b", { x: 60, duration: 1.2, ease: "power1.in" })
      // Fatman pushed/falls
      .to(
        ".fatman",
        { y: 20, opacity: 1, duration: 0.5, ease: "power2.in" },
        "-=0.6",
      )
      // IMPACT
      .to(
        ".slide",
        { keyframes: shakeKeyframes, duration: 0.5, ease: "power1.inOut" },
        "-=0.1",
      ) // Shake slide harder
      .to(
        ".red-flash",
        { opacity: 1, duration: 0.05, yoyo: true, repeat: 1 },
        "-=0.5",
      ) // Flash red
      // Train hits fatman and stops
      .to(".trolley-b", { x: 80, duration: 0.2, ease: "power2.out" }, "-=0.5")
      .to(
        ".fatman",
        {
          rotation: 90,
          x: 10,
          transformOrigin: "bottom center",
          duration: 0.2,
        },
        "-=0.4",
      )
      .to(".blood-b", { opacity: 1, scale: 1.5, duration: 0.3 }, "-=0.3")
      // Train completely stopped
      .to(".trolley-b", { x: 80, duration: 1 });
  }

  // Allow manual re-triggering by clicking the boxes
  function replayA() {
    playAnimationsA();
  }
  function replayB() {
    playAnimationsB();
  }

  function playAnimationsA() {
    gsap.set(".trolley-a", { x: -50, y: 0 });
    gsap.set(".lever-handle", { rotation: -30 });
    gsap.set(".person-1", { opacity: 1, scale: 1 });
    gsap.set(".blood-a", { opacity: 0, scale: 0.5 });
    const tlA = gsap.timeline();
    tlA
      .to(".trolley-a", { x: 50, duration: 1.5, ease: "power1.in" })
      .to(
        ".lever-handle",
        { rotation: 30, duration: 0.3, ease: "power2.inOut" },
        "-=0.8",
      )
      .to(".trolley-a", { x: 120, y: 30, duration: 1, ease: "power1.out" })
      .to(
        ".slide",
        { keyframes: shakeKeyframes, duration: 0.4, ease: "power1.inOut" },
        "-=0.2",
      )
      .to(
        ".red-flash",
        { opacity: 1, duration: 0.05, yoyo: true, repeat: 1 },
        "-=0.4",
      )
      .to(
        ".person-1",
        {
          opacity: 0.2,
          scale: 0.5,
          transformOrigin: "center center",
          duration: 0.2,
          ease: "power2.in",
        },
        "-=0.4",
      )
      .to(".blood-a", { opacity: 1, scale: 1.5, duration: 0.3 }, "-=0.2");
  }

  function playAnimationsB() {
    gsap.set(".trolley-b", { x: -50 });
    gsap.set(".fatman", { y: -30, opacity: 0, rotation: 0, x: 0 });
    gsap.set(".blood-b", { opacity: 0, scale: 0.5 });
    const tlB = gsap.timeline();
    tlB
      .to(".trolley-b", { x: 60, duration: 1.2, ease: "power1.in" })
      .to(
        ".fatman",
        { y: 20, opacity: 1, duration: 0.5, ease: "power2.in" },
        "-=0.6",
      )
      .to(
        ".slide",
        { keyframes: shakeKeyframes, duration: 0.5, ease: "power1.inOut" },
        "-=0.1",
      )
      .to(
        ".red-flash",
        { opacity: 1, duration: 0.05, yoyo: true, repeat: 1 },
        "-=0.5",
      )
      .to(".trolley-b", { x: 80, duration: 0.2, ease: "power2.out" }, "-=0.5")
      .to(
        ".fatman",
        {
          rotation: 90,
          x: 10,
          transformOrigin: "bottom center",
          duration: 0.2,
        },
        "-=0.4",
      )
      .to(".blood-b", { opacity: 1, scale: 1.5, duration: 0.3 }, "-=0.3");
  }
</script>

<div class="slide">
  <div class="red-flash"></div>
  <h2 class="s10-head">トロッコ問題 <span class="head-trolley">🚃</span></h2>
  <div class="cases">
    <!-- Case A: Lever -->
    <button
      class="case s10-a ok-box"
      bind:this={okBox}
      onclick={replayA}
      aria-label="Replay Lever Animation"
    >
      <div class="mark ok">○</div>
      <div class="case-text">
        <div class="case-title">レバーを引く</div>
        <div class="case-sub">1人の犠牲 → 5人を救う</div>
      </div>
      <div class="anim-container">
        <svg viewBox="0 0 200 100" class="scenario-svg">
          <!-- Tracks -->
          <path
            d="M 0 50 L 100 50 L 200 50"
            stroke="#555"
            stroke-width="4"
            fill="none"
          />
          <path
            d="M 100 50 L 200 80"
            stroke="#555"
            stroke-width="4"
            fill="none"
            stroke-dasharray="4"
          />

          <!-- 5 People (Top Track) -->
          <g fill="#ccc">
            <circle cx="150" cy="40" r="4" />
            <rect x="148" y="44" width="4" height="10" />
            <circle cx="160" cy="40" r="4" />
            <rect x="158" y="44" width="4" height="10" />
            <circle cx="170" cy="40" r="4" />
            <rect x="168" y="44" width="4" height="10" />
            <circle cx="180" cy="40" r="4" />
            <rect x="178" y="44" width="4" height="10" />
            <circle cx="190" cy="40" r="4" />
            <rect x="188" y="44" width="4" height="10" />
          </g>

          <!-- 1 Person (Bottom Track) -->
          <g class="person-1" fill="#ccc">
            <circle cx="150" cy="70" r="4" />
            <rect x="148" y="74" width="4" height="10" />
          </g>

          <!-- Blood Splatter A -->
          <circle
            cx="150"
            cy="80"
            r="10"
            fill="#c0504d"
            opacity="0"
            class="blood-a"
            filter="blur(2px)"
          />

          <!-- Lever -->
          <g transform="translate(80, 50)">
            <rect x="-10" y="10" width="20" height="5" fill="#444" />
            <line
              x1="0"
              y1="10"
              x2="0"
              y2="-15"
              stroke="#aaa"
              stroke-width="3"
              class="lever-handle"
            />
            <circle cx="0" cy="-15" r="3" fill="#c0504d" class="lever-handle" />
          </g>

          <!-- Trolley -->
          <g class="trolley-a">
            <rect x="0" y="35" width="30" height="20" rx="3" fill="#888" />
            <rect x="5" y="38" width="8" height="8" fill="#55aa50" />
            <rect x="17" y="38" width="8" height="8" fill="#55aa50" />
            <circle cx="8" cy="58" r="4" fill="#222" />
            <circle cx="22" cy="58" r="4" fill="#222" />
          </g>
        </svg>
      </div>
    </button>

    <!-- Case B: Fatman -->
    <button
      class="case s10-b ng-box"
      bind:this={ngBox}
      onclick={replayB}
      aria-label="Replay Footbridge Animation"
    >
      <div class="mark ng">✕</div>
      <div class="case-text">
        <div class="case-title">太った男を突き落とす</div>
        <div class="case-sub">計算は同じでもできない</div>
      </div>
      <div class="anim-container">
        <svg viewBox="0 0 200 100" class="scenario-svg">
          <!-- Tracks -->
          <path
            d="M 0 80 L 200 80"
            stroke="#555"
            stroke-width="4"
            fill="none"
          />

          <!-- Bridge -->
          <rect x="70" y="20" width="60" height="10" fill="#666" rx="2" />
          <rect x="75" y="30" width="5" height="50" fill="#555" />
          <rect x="120" y="30" width="5" height="50" fill="#555" />

          <!-- 5 People (Track) -->
          <g fill="#ccc">
            <circle cx="150" cy="70" r="4" />
            <rect x="148" y="74" width="4" height="10" />
            <circle cx="160" cy="70" r="4" />
            <rect x="158" y="74" width="4" height="10" />
            <circle cx="170" cy="70" r="4" />
            <rect x="168" y="74" width="4" height="10" />
            <circle cx="180" cy="70" r="4" />
            <rect x="178" y="74" width="4" height="10" />
            <circle cx="190" cy="70" r="4" />
            <rect x="188" y="74" width="4" height="10" />
          </g>

          <!-- Fatman (Bridge) -->
          <g class="fatman" fill="#dd9977">
            <circle cx="100" cy="10" r="6" />
            <rect x="92" y="16" width="16" height="15" rx="5" />
          </g>

          <!-- Blood Splatter B -->
          <circle
            cx="110"
            cy="80"
            r="15"
            fill="#c0504d"
            opacity="0"
            class="blood-b"
            filter="blur(3px)"
          />

          <!-- Trolley -->
          <g class="trolley-b">
            <rect x="0" y="55" width="40" height="25" rx="4" fill="#888" />
            <rect x="5" y="58" width="12" height="10" fill="#8b1a1a" />
            <rect x="23" y="58" width="12" height="10" fill="#8b1a1a" />
            <circle cx="10" cy="82" r="5" fill="#222" />
            <circle cx="30" cy="82" r="5" fill="#222" />
          </g>
        </svg>
      </div>
    </button>
  </div>
  <div class="s10-note">
    「直接手を下す」ことへの<strong>道徳的な一線</strong>がある
  </div>
</div>

<style>
  .slide {
    width: 100%;
    height: 100%;
    background: linear-gradient(to bottom, #070810, #09070a);
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
  .red-flash {
    position: absolute;
    inset: 0;
    background: rgba(139, 26, 26, 0.25);
    box-shadow: inset 0 0 100px rgba(139, 26, 26, 0.8);
    opacity: 0;
    pointer-events: none;
    z-index: 50; /* Ensure it covers everything */
  }
  .s10-head {
    font-size: clamp(3rem, 7vw, 6rem);
    font-weight: 900;
    text-align: center;
    margin-bottom: 3rem;
    display: flex;
    align-items: center;
    gap: 1rem;
  }
  .head-trolley {
    display: inline-block;
    font-size: 0.7em;
  }
  .cases {
    display: flex;
    flex-direction: column;
    gap: 1.2rem;
    width: min(800px, 95vw);
    margin-bottom: 2.5rem;
  }

  /* Make cases interactive */
  .case {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 1.5rem;
    padding: 1.5rem 2rem;
    border-radius: 8px;
    cursor: pointer;
    transition:
      transform 0.2s ease,
      box-shadow 0.2s ease;
    text-align: left;
    background: transparent;
    color: inherit;
  }
  .case:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
  }
  .case:active {
    transform: translateY(0);
  }

  .ok-box {
    background: rgba(85, 170, 80, 0.07);
    border: 1px solid rgba(85, 170, 80, 0.25);
  }
  .ok-box:hover {
    background: rgba(85, 170, 80, 0.12);
  }

  .ng-box {
    background: rgba(139, 26, 26, 0.1);
    border: 1px solid rgba(139, 26, 26, 0.3);
  }
  .ng-box:hover {
    background: rgba(139, 26, 26, 0.15);
  }

  .case-text {
    flex: 1;
    min-width: 200px;
  }
  .mark {
    font-size: clamp(2rem, 4vw, 3rem);
    font-weight: 900;
    flex-shrink: 0;
  }
  .ok {
    color: #7fc97f;
  }
  .ng {
    color: #c0504d;
  }
  .case-title {
    font-size: clamp(1.5rem, 3vw, 2.2rem);
    font-weight: 700;
    margin-bottom: 0.3rem;
    margin-top: 0;
  }
  .case-sub {
    font-size: clamp(1rem, 2vw, 1.5rem);
    color: rgba(245, 240, 232, 0.55);
  }

  .anim-container {
    width: 200px;
    height: 100px;
    background: rgba(0, 0, 0, 0.2);
    border-radius: 8px;
    border: 1px solid rgba(255, 255, 255, 0.05);
    flex-shrink: 0;
  }
  .scenario-svg {
    width: 100%;
    height: 100%;
    display: block;
  }

  .s10-note {
    font-size: clamp(1.3rem, 2.5vw, 2rem);
    color: rgba(245, 240, 232, 0.75);
    text-align: center;
  }
  .s10-note strong {
    color: #c9a84c;
  }

  @media (max-width: 1366px) {
    .s10-head {
      font-size: clamp(2.5rem, 5.5vw, 5rem);
      margin-bottom: 2rem;
    }
    .case {
      padding: 1.2rem 1.5rem;
      gap: 1rem;
    }
    .case-title {
      font-size: clamp(1.2rem, 2.5vw, 1.8rem);
    }
    .case-sub {
      font-size: clamp(0.9rem, 1.7vw, 1.2rem);
    }
    .anim-container {
      width: 160px;
      height: 80px;
    }
  }
  @media (max-width: 1024px) {
    .s10-head {
      font-size: clamp(2rem, 5vw, 4rem);
      margin-bottom: 1.5rem;
    }
    .case {
      padding: 1rem 1.2rem;
      gap: 1rem;
      flex-direction: column;
      align-items: flex-start;
    }
    .case-text {
      min-width: auto;
    }
    .anim-container {
      width: 100%;
      height: 120px;
      align-self: center;
    }
    .case-title {
      font-size: clamp(1rem, 2.2vw, 1.5rem);
    }
    .case-sub {
      font-size: clamp(0.8rem, 1.5vw, 1rem);
    }
    .cases {
      gap: 0.9rem;
      margin-bottom: 1.8rem;
      height: 70vh;
      overflow-y: auto;
      align-items: center;
    }
    .s10-note {
      font-size: clamp(1rem, 2vw, 1.5rem);
    }
    .mark {
      display: none;
    } /* Hide mark on small screens to save space */
  }
</style>
