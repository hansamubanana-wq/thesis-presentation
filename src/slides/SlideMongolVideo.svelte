<script lang="ts">
    import { onMount, onDestroy } from "svelte";
    import { gsap } from "gsap";

    let videoElement: HTMLVideoElement;

    onMount(() => {
        const tl = gsap.timeline();

        // 1. Title fades in and slides down
        tl.fromTo(
            ".s3-title",
            { opacity: 0, y: -20 },
            { opacity: 1, y: 0, duration: 0.8, ease: "power2.out" },
        )
            // 2. Top-left image placeholders fades in
            .fromTo(
                ".panel-tl",
                { opacity: 0, x: -30 },
                { opacity: 1, x: 0, duration: 0.8, ease: "power2.out" },
                "-=0.4",
            )
            // 3. Top-right video fades in
            .fromTo(
                ".panel-tr",
                { opacity: 0, x: 30 },
                { opacity: 1, x: 0, duration: 0.8, ease: "power2.out" },
                "-=0.6",
            )
            // 4. Bottom wide image placeholder fades in
            .fromTo(
                ".panel-b",
                { opacity: 0, y: 30 },
                { opacity: 1, y: 0, duration: 0.8, ease: "power2.out" },
                "-=0.4",
            );

        if (videoElement) {
            videoElement.muted = true;
            // Play video after a short delay so animation finishes
            setTimeout(() => {
                videoElement
                    .play()
                    .catch((e) => console.log("Autoplay prevented:", e));
            }, 1000);
        }
    });

    onDestroy(() => {
        if (videoElement) {
            videoElement.pause();
        }
    });
</script>

<div class="slide">
    <h2 class="s3-title">1274年（文永11年）文永の役</h2>

    <div class="grid-container">
        <!-- Top Left: Image Placeholder -->
        <div class="panel panel-tl">
            <div class="placeholder-content">
                <span class="icon">🖼️</span>
                <span class="text">Kublai.jpg<br />(Image Placeholder)</span>
            </div>
            <img
                src="/images/Kublai.jpg"
                alt="フビライ・ハーン"
                class="panel-img"
                onerror={(e) => ((e.target as HTMLElement).style.opacity = "0")}
            />
        </div>

        <!-- Top Right: Video (No loop) -->
        <div class="panel panel-tr">
            <video
                bind:this={videoElement}
                class="panel-video"
                src="/videos/mongol_invasion.mp4"
                muted
                playsinline
                autoplay
            ></video>
        </div>

        <!-- Bottom: Wide Image Placeholder -->
        <div class="panel panel-b">
            <div class="placeholder-content">
                <span class="icon">🖼️</span>
                <span class="text">invasion.jpg<br />(Image Placeholder)</span>
            </div>
            <img
                src="/images/invasion.jpg"
                alt="文永の役"
                class="panel-img"
                onerror={(e) => ((e.target as HTMLElement).style.opacity = "0")}
            />
        </div>
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
        justify-content: flex-start;
        padding: 3rem;
        font-family: "Noto Serif JP", serif;
        color: #f5f0e8;
        box-sizing: border-box;
    }

    .s3-title {
        font-size: clamp(2rem, 4vw, 3.5rem);
        font-weight: 900;
        margin-bottom: 2.5rem;
        letter-spacing: 0.1em;
        text-shadow: 0 2px 10px rgba(0, 0, 0, 0.8);
        color: #e25822; /* Mongol fire theme color */
        border-bottom: 2px solid rgba(226, 88, 34, 0.3);
        padding-bottom: 0.5rem;
    }

    .grid-container {
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        gap: 2rem;
        width: 100%;
        max-width: 1400px;
        height: calc(100% - 100px); /* Leave room for title */
    }

    .panel {
        background: rgba(255, 255, 255, 0.03);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 12px;
        position: relative;
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
    }

    .panel-tl {
        grid-column: 1 / 2;
        grid-row: 1 / 2;
    }

    .panel-tr {
        grid-column: 2 / 3;
        grid-row: 1 / 2;
        background: #000; /* Better for video */
    }

    .panel-b {
        grid-column: 1 / 3;
        grid-row: 2 / 3;
    }

    /* Placeholders */
    .placeholder-content {
        position: absolute;
        z-index: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 0.5rem;
        color: rgba(245, 240, 232, 0.4);
        text-align: center;
    }

    .placeholder-content .icon {
        font-size: 3rem;
        opacity: 0.5;
    }

    .placeholder-content .text {
        font-family: monospace;
        font-size: 1.2rem;
        letter-spacing: 0.05em;
    }

    /* Media content */
    .panel-img {
        position: relative;
        z-index: 2;
        width: 100%;
        height: 100%;
        object-fit: cover;
        opacity: 1; /* Will disappear if image fails to load via onerror */
        transition: opacity 0.3s ease;
    }

    .panel-video {
        position: relative;
        z-index: 2;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    @media (max-width: 1024px) {
        .slide {
            padding: 2rem;
        }
        .s3-title {
            font-size: clamp(1.5rem, 3.5vw, 2.5rem);
            margin-bottom: 1.5rem;
        }
        .grid-container {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            height: auto;
            flex: 1;
            overflow-y: auto; /* Just in case */
        }
        .panel {
            min-height: 250px;
        }
        .panel-b {
            min-height: 200px;
        }
    }
</style>
