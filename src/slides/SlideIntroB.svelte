<script lang="ts">
    import { onMount } from "svelte";
    import { gsap } from "gsap";

    onMount(() => {
        const tl = gsap.timeline();

        tl.fromTo(
            ".intro-head",
            { opacity: 0, y: -20 },
            { opacity: 1, y: 0, duration: 0.8, ease: "power2.out" },
        )
            .fromTo(
                ".char-jn",
                { opacity: 0, x: -50, filter: "blur(10px)" },
                {
                    opacity: 1,
                    x: 0,
                    filter: "blur(0px)",
                    duration: 1,
                    ease: "power3.out",
                },
                "-=0.4",
            )
            .fromTo(
                ".char-sm",
                { opacity: 0, x: 50, filter: "blur(10px)" },
                {
                    opacity: 1,
                    x: 0,
                    filter: "blur(0px)",
                    duration: 1,
                    ease: "power3.out",
                },
                "-=0.6",
            )
            .fromTo(
                ".vs-badge",
                { scale: 0, rotation: -180 },
                { scale: 1, rotation: 0, duration: 0.6, ease: "back.out(1.5)" },
                "-=0.4",
            );

        // Subtle continuous floating
        gsap.to(".char-jn", {
            y: -5,
            repeat: -1,
            yoyo: true,
            duration: 3,
            ease: "sine.inOut",
        });
        gsap.to(".char-sm", {
            y: 5,
            repeat: -1,
            yoyo: true,
            duration: 3.5,
            ease: "sine.inOut",
        });
    });
</script>

<div class="slide">
    <h2 class="intro-head">物語の核心：相容れない二つの道</h2>

    <div class="split-container">
        <!-- Jin Sakai -->
        <div class="char-box char-jn">
            <div class="char-bg jn-bg"></div>
            <div class="char-content">
                <h4 class="char-name jin-text">主人公：境井 仁</h4>
                <blockquote class="intro-quote jin-quote">
                    『私が毒で殺します』
                </blockquote>
                <blockquote class="intro-quote jin-quote">
                    主義：結果こそすべて
                </blockquote>
            </div>
        </div>

        <div class="vs-badge">VS</div>

        <!-- Lord Shimura -->
        <div class="char-box char-sm">
            <div class="char-bg sm-bg"></div>
            <div class="char-content">
                <h4 class="char-name shimura-text">
                    仁の育ての叔父：志村
                </h4>
            </div>
        </div>
    </div>
</div>

<style>
    .slide {
        width: 100%;
        height: 100%;
        background: radial-gradient(circle at center, #0e0c12, #050406);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        font-family: "Noto Serif JP", serif;
        color: #f5f0e8;
        overflow: hidden;
        padding: 2rem;
    }

    .intro-head {
        font-size: clamp(2.2rem, 4vw, 3.5rem);
        font-weight: 900;
        margin-bottom: 3.5rem;
        letter-spacing: 0.1em;
        text-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
        z-index: 10;
    }

    .split-container {
        display: flex;
        width: min(1000px, 90vw);
        height: 55vh;
        gap: 3rem;
        position: relative;
        align-items: stretch;
    }

    .char-box {
        flex: 1;
        position: relative;
        border-radius: 12px;
        overflow: hidden;
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        border: 1px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4);
    }

    /* Faux cinematic backgrounds using gradients since we don't have character portraits yet */
    .char-bg {
        position: absolute;
        inset: 0;
        z-index: 1;
        opacity: 0.85; /* Increased opacity makes image much brighter */
        transition:
            opacity 0.5s ease,
            transform 0.5s ease;
        background-size: cover;
        background-position: center top;
        background-repeat: no-repeat;
    }

    /* Jin: Stealth, Dark Blue/Ghostly Colors */
    .jn-bg {
        background-color: #1a1e29;
        background-image: url("/images/jin_portrait.jpg");
        box-shadow: inset 0 0 60px rgba(0, 0, 0, 0.8); /* Less aggressive shadow */
    }

    /* Shimura: Honor, Crimson/Gold */
    .sm-bg {
        background-color: #1a0808;
        background-image: url("/images/shimura_portrait.jpg");
        box-shadow: inset 0 0 60px rgba(0, 0, 0, 0.8); /* Less aggressive shadow */
    }

    .char-box:hover .char-bg {
        opacity: 1;
        transform: scale(1.05);
    }

    .char-content {
        position: relative;
        z-index: 2;
        padding: 2.5rem 2rem;
        background: linear-gradient(
            to top,
            rgba(5, 4, 6, 0.95) 0%,
            rgba(5, 4, 6, 0.5) 40%,
            transparent 80%
        );
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
    }

    .char-name {
        font-size: clamp(1.4rem, 2.3vw, 2.2rem);
        font-weight: 900;
        margin: 0 0 1rem 0;
        display: flex;
        align-items: baseline;
        gap: 1rem;
        text-shadow: 0 2px 10px rgba(0, 0, 0, 0.8);
    }

    .intro-quote {
        font-size: clamp(1.1rem, 1.8vw, 1.6rem);
        font-style: italic;
        margin: 0 0 0.8rem 0;
        padding-left: 1rem;
        border-left: 4px solid;
    }

    .jin-quote {
        color: #e6e6e6;
        border-color: #5b9bd5;
    }

    .char-name.jin-text {
        color: #5b9bd5; /* 境井仁（青） */
    }

    .char-name.shimura-text {
        color: #c0504d; /* 志村（赤） */
    }

    .vs-badge {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 60px;
        height: 60px;
        background: #09070a;
        border: 2px solid #8b1a1a;
        color: #c9a84c;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        font-weight: 900;
        font-style: italic;
        z-index: 10;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
    }

    @media (max-width: 1024px) {
        .split-container {
            flex-direction: column;
            height: auto;
            gap: 1.5rem;
            align-items: center;
        }
        .char-box {
            width: 100%;
            height: 30vh;
            min-height: 250px;
        }
        .char-content {
            padding: 1.5rem;
            background: linear-gradient(
                to right,
                rgba(5, 4, 6, 0.95) 0%,
                rgba(5, 4, 6, 0.5) 40%,
                transparent 80%
            );
            justify-content: center;
        }
        .vs-badge {
            display: none; /* Hide VS badge on mobile for cleaner stack */
        }
    }
</style>
