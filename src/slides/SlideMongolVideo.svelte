<script lang="ts">
    import { onMount, onDestroy } from "svelte";
    import { gsap } from "gsap";

    let videoElement: HTMLVideoElement;
    let audioCtx: AudioContext | null = null;

    onMount(() => {
        // Fade in the video overlay gently
        gsap.fromTo(
            ".video-overlay",
            { opacity: 1 },
            { opacity: 0, duration: 1.5, delay: 0.5, ease: "power2.inOut" },
        );

        if (videoElement) {
            // Ensure muted is false and volume is max
            videoElement.muted = false;
            videoElement.volume = 1.0;

            // Setup audio amplification on first play to ensure user interacted
            videoElement.onplay = () => {
                if (!audioCtx) {
                    const AudioContextFunc =
                        window.AudioContext ||
                        (window as any).webkitAudioContext;
                    audioCtx = new AudioContextFunc();

                    const sourceNode =
                        audioCtx.createMediaElementSource(videoElement);
                    const gainNode = audioCtx.createGain();

                    // Boost volume 3.5x
                    gainNode.gain.value = 3.5;

                    sourceNode.connect(gainNode);
                    gainNode.connect(audioCtx.destination);
                }

                if (audioCtx && audioCtx.state === "suspended") {
                    audioCtx.resume();
                }
            };

            videoElement
                .play()
                .catch((e) =>
                    console.log(
                        "Autoplay prevented (requires interaction):",
                        e,
                    ),
                );
        }
    });

    onDestroy(() => {
        if (videoElement) {
            videoElement.pause();
        }
        if (audioCtx) {
            audioCtx.close();
        }
    });
</script>

<div class="slide">
    <div class="video-container">
        <!-- Added controls so user can unmute/play if autoplay fails -->
        <video
            bind:this={videoElement}
            class="bg-video"
            src="/videos/mongol_invasion.mp4"
            loop
            playsinline
            autoplay
            controls
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
