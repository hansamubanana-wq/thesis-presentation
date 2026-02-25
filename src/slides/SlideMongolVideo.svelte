<script lang="ts">
    import { onMount, onDestroy } from "svelte";
    import { gsap } from "gsap";

    let videoElement: HTMLVideoElement;

    onMount(() => {
        // Only fade in the title initially
        gsap.fromTo(
            ".title-wrapper",
            { opacity: 0, y: -30 },
            { opacity: 1, y: 0, duration: 1, ease: "power2.out" },
        );

        // Initially hide the image container before video ends
        gsap.set(".image-glass-container", {
            opacity: 0,
            scale: 0.95,
            display: "none",
        });

        if (videoElement) {
            videoElement.muted = true;
            // Play video after a short delay so animation finishes
            setTimeout(() => {
                videoElement
                    .play()
                    .catch((e) => console.log("Autoplay prevented:", e));
            }, 500);
        }
    });

    const handleVideoEnded = () => {
        // Fade in the image container once the video finishes
        gsap.fromTo(
            ".image-glass-container",
            { opacity: 0, scale: 0.95, display: "flex" },
            { opacity: 1, scale: 1, duration: 1, ease: "power2.out" },
        );
    };

    onDestroy(() => {
        if (videoElement) {
            videoElement.pause();
        }
    });
</script>

<div class="slide-container">
    <video
        bind:this={videoElement}
        class="bg-video"
        src="/videos/mongol_invasion.mp4"
        muted
        playsinline
        autoplay
        onended={handleVideoEnded}
    ></video>

    <div class="content">
        <div class="title-wrapper">
            <h2 class="slide-title">1274年（文永11年）文永の役</h2>
        </div>

        <div class="image-glass-container">
            <img
                src="/images/invasion.jpg"
                alt="文永の役"
                class="invasion-img"
                onerror={(e) => ((e.target as HTMLElement).style.opacity = "0")}
            />
        </div>
    </div>
</div>

<style>
    .slide-container {
        position: relative;
        width: 100%;
        height: 100%;
        overflow: hidden;
        background: #09070a;
        font-family: "Noto Serif JP", serif;
        color: #f5f0e8;
    }

    .bg-video {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
        z-index: 1;
    }

    .content {
        position: relative;
        z-index: 10;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        height: 100%;
        padding: 1.5rem 3rem; /* Reduced vertical padding to allow more image space */
        box-sizing: border-box;
    }

    .title-wrapper {
        margin-bottom: 0.5rem; /* Reduced space below title */
        text-align: center;
        margin-top: 0; /* Removed top margin */
    }

    .slide-title {
        font-size: clamp(2rem, 4vw, 3.5rem);
        font-weight: 900;
        letter-spacing: 0.15em;
        /* Glowing fire effect for historical dramatic feel */
        text-shadow:
            0 4px 15px rgba(0, 0, 0, 0.9),
            0 0 15px rgba(226, 88, 34, 0.5);
        color: #e25822; /* Mongol fire theme color */
        border-bottom: 2px solid rgba(226, 88, 34, 0.4);
        padding-bottom: 0.6rem;
        margin: 0;
    }

    .image-glass-container {
        width: 100%;
        max-width: 1600px; /* Increased max width */
        flex-grow: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        /* Sleek glassmorphism effect */
        background: rgba(15, 15, 18, 0.4);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.08);
        border-radius: 16px;
        padding: 0.8rem; /* Reduced inner padding */
        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.6);
        min-height: 0; /* Important for flex child to shrink properly */
    }

    .invasion-img {
        width: 100%;
        height: 100%;
        object-fit: contain; /* Ensures the entire image is visible without cropping */
        border-radius: 8px;
        filter: drop-shadow(
            0 10px 30px rgba(0, 0, 0, 0.7)
        ); /* Drop shadow instead of box shadow for transparent edge handling */
        transition: opacity 0.3s ease;
        /* Removed dark background so 'contain' empty areas don't look like black borders */
    }

    @media (max-width: 1024px) {
        .content {
            padding: 2rem;
        }
        .slide-title {
            font-size: clamp(1.5rem, 3.5vw, 2.5rem);
        }
        .image-glass-container {
            padding: 1rem;
            border-radius: 12px;
        }
    }
</style>
