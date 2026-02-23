<script lang="ts">
    import { onMount, onDestroy } from "svelte";

    let videoElement: HTMLVideoElement;
    let audioCtx: AudioContext | null = null;

    onMount(() => {
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
        <!-- controls added to ensure manual playback works if autoplay is blocked -->
        <video
            bind:this={videoElement}
            class="bg-video"
            src="/videos/conflict_scene.mp4"
            loop
            playsinline
            autoplay
            controls
        ></video>
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
        justify-content: center;
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
        border-radius: 8px;
    }
</style>
