<script lang="ts">
    import { onMount } from "svelte";
    import { gsap } from "gsap";
    onMount(() => {
        gsap.fromTo(
            ".s16-head",
            { opacity: 0, y: 30 },
            { opacity: 1, y: 0, duration: 1, ease: "power3.out" },
        );
        gsap.fromTo(
            ".s16-book",
            { opacity: 0, x: -40 },
            { opacity: 1, x: 0, duration: 0.8, ease: "power2.out", delay: 0.5 },
        );
        gsap.fromTo(
            ".s16-game",
            { opacity: 0, x: 40 },
            { opacity: 1, x: 0, duration: 0.8, ease: "power2.out", delay: 0.8 },
        );
    });
</script>

<div class="slide">
    <div class="sub-glow"></div>
    <h2 class="s16-head">おすすめの<span class="gold">参考文献</span></h2>

    <div class="references">
        <!-- 参考文献 1 -->
        <div class="ref-card s16-book">
            <img class="ref-img" src="/images/kunsyuron.jpg" alt="君主論" />
            <div class="ref-content">
                <h3 class="ref-title">『君主論』</h3>
                <p class="ref-author dim">ニッコロ・マキャヴェッリ</p>
                <p class="ref-desc">
                    目的のために手段を選ばない冷徹な政治力学や「必要悪」について論じた古典的名著。
                    本作のテーマに深く重なる、リーダーとしてのあり方を考えさせられる一冊。
                </p>
            </div>
        </div>

        <!-- 参考作品 2 -->
        <div class="ref-card s16-game">
            <img
                class="ref-img"
                src="/images/tsushima.jpg"
                alt="Ghost of Tsushima"
            />
            <div class="ref-content">
                <h3 class="ref-title">『Ghost of Tsushima』</h3>
                <p class="ref-author dim">Sucker Punch Productions</p>
                <p class="ref-desc">
                    本卒業論文で題材としたゲームです。武士道と現実の戦いとの葛藤が美しく描かれています。
                    <span class="highlight"
                        >とにかく面白いので、ぜひ実際にプレイしてみてください！</span
                    >
                </p>
            </div>
        </div>
    </div>
</div>

<style>
    .slide {
        width: 100%;
        height: 100%;
        background: linear-gradient(to bottom, #09070a, #110c14);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        position: relative;
        overflow: hidden;
        font-family: "Noto Serif JP", serif;
        color: #f5f0e8;
    }
    .sub-glow {
        position: absolute;
        inset: 0;
        background: radial-gradient(
            circle at 50% 100%,
            rgba(201, 168, 76, 0.05) 0%,
            transparent 60%
        );
        pointer-events: none;
    }
    .s16-head {
        font-size: clamp(2.5rem, 5vw, 4.5rem);
        font-weight: 900;
        margin-bottom: 3.5rem;
        text-align: center;
    }
    .gold {
        color: #c9a84c;
    }
    .dim {
        color: rgba(245, 240, 232, 0.4);
    }

    .references {
        display: flex;
        flex-direction: column;
        gap: 2.5rem;
        width: min(850px, 85vw);
    }

    .ref-card {
        display: flex;
        gap: 2rem;
        align-items: flex-start;
        background: rgba(255, 255, 255, 0.03);
        border: 1px solid rgba(255, 255, 255, 0.08);
        border-radius: 12px;
        padding: 2rem;
        transition:
            transform 0.3s ease,
            background 0.3s ease,
            border-color 0.3s ease;
    }
    .ref-card:hover {
        transform: translateY(-5px);
        background: rgba(201, 168, 76, 0.05);
        border-color: rgba(201, 168, 76, 0.3);
    }

    .ref-img {
        width: clamp(80px, 12vw, 120px);
        height: auto;
        border-radius: 8px;
        flex-shrink: 0;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
    }
    .ref-content {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }
    .ref-title {
        font-size: clamp(1.4rem, 2.8vw, 2rem);
        font-weight: 800;
        color: #f5f0e8;
        margin: 0;
    }
    .ref-author {
        font-size: clamp(0.9rem, 1.5vw, 1.1rem);
        margin: 0;
    }
    .ref-desc {
        font-size: clamp(1rem, 1.8vw, 1.2rem);
        color: rgba(245, 240, 232, 0.75);
        line-height: 1.6;
        margin: 0.5rem 0 0 0;
    }

    .highlight {
        color: #c9a84c;
        font-weight: 700;
        border-bottom: 1px solid rgba(201, 168, 76, 0.5);
        padding-bottom: 2px;
    }

    @media (max-width: 1366px) {
        .s16-head {
            font-size: clamp(2rem, 4.5vw, 3.5rem);
            margin-bottom: 2.5rem;
        }
        .ref-card {
            padding: 1.5rem;
            gap: 1.5rem;
        }
        .references {
            gap: 2rem;
        }
        .ref-title {
            font-size: clamp(1.2rem, 2.3vw, 1.7rem);
        }
        .ref-desc {
            font-size: clamp(0.9rem, 1.5vw, 1.1rem);
        }
    }
    @media (max-width: 1024px) {
        .s16-head {
            font-size: clamp(1.8rem, 4vw, 3rem);
            margin-bottom: 2rem;
        }
        .ref-card {
            padding: 1.2rem;
            gap: 1.2rem;
        }
        .references {
            gap: 1.5rem;
        }
        .ref-img {
            width: clamp(60px, 10vw, 90px);
        }
        .ref-title {
            font-size: clamp(1rem, 2vw, 1.4rem);
        }
        .ref-author {
            font-size: clamp(0.8rem, 1.3vw, 0.95rem);
        }
        .ref-desc {
            font-size: clamp(0.8rem, 1.3vw, 0.95rem);
            line-height: 1.5;
        }
    }
</style>
