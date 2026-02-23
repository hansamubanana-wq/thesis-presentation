<script lang="ts">
    import { onMount, onDestroy } from "svelte";
    import { gsap } from "gsap";

    let videoElement: HTMLVideoElement;

    onMount(() => {
        // Fade in the video overlay gently
        gsap.fromTo(
            ".video-overlay",
            { opacity: 1 },
            { opacity: 0, duration: 1.5, delay: 0.5, ease: "power2.inOut" },
        );

        if (videoElement) {
            videoElement.muted = true;
            videoElement
                .play()
                .catch((e) => console.log("Autoplay prevented:", e));
        }
    });

    onDestroy(() => {
        if (videoElement) {
            videoElement.pause();
        }
    });
</script>

<div class="slide">
    <div class="video-container">
        <video
            bind:this={videoElement}
            class="bg-video"
            src="/videos/mongol_invasion.mp4"
            loop
            muted
            playsinline
            autoplay
        ></video>

        <div class="video-overlay"></div>
    </div>
</div>

<style>
    .slide {
        width: 100%;
        height: 100%;
        position: relative;
        overflow: hidden;
        background: #000;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-end;
    }

    .video-container {
        position: absolute;
        inset: 0;
        width: 90%;
        height: 90%;
        margin: auto;
        z-index: 1;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .bg-video {
        width: 100%;
        height: 100%;
        object-fit: contain;
        opacity: 0.8;
        border-radius: 8px;
    }

    .video-overlay {
        position: absolute;
        inset: 0;
        background: radial-gradient(
            circle at center,
            transparent 40%,
            rgba(0, 0, 0, 0.8) 100%
        );
        pointer-events: none;
        z-index: 2;
    }
</style>
