<!-- 
	幻灯片
	2016.12.26
	李瑞云
 -->
<template>
    <div class="slider">
        <ul :style="{'width': items.length * 100 + '%', 'left': (-100 * (current >= items.length ? (current - 1) : current)) + '%', transitionDuration: speed + 's'}">
            <li v-for="item in items" class="slider-item" :style="{'width': (100 / items.length) + '%'}">
                <img :src="item.src" :alt="item.alt">
            </li>
        </ul>
        <div class="slider-dots-wrap" v-if="dots">
            <span class="slider-dot" v-for="i in items.length" :key="'dot' + (i - 1)" :class="{ 'slider-dot-selected': current === (i - 1) }" @click="handleClick(i)"></span>
        </div>
        <div class="slider-arrows-wrap" v-if="arrows">
            <span class="slider-arrow slider-arrow-left iconfont icon-arrow-left" @click="turn(-1)"></span>
            <span class="slider-arrow slider-arrow-right iconfont icon-arrow-right" @click="turn(1)"></span>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            current: 0,
            autoPlayFlag: null
        }
    },
    props: {
        items: {
            type: Array,
            required: true
        },
        dots: {
            type: Boolean,
            required: false,
            default: true
        },
        arrows: {
            type: Boolean,
            required: false,
            default: true
        },
        autoplay: {
            type: Boolean,
            required: false,
            default: true
        },
        delay: {
            type: Number,
            required: false,
            default: 3
        },
        speed: {
            type: Number,
            required: false,
            default: 1.5
        },
        pause: {
            type: Boolean,
            required: false,
            default: true
        }
    },
    methods: {
        turn(i) {
            let _i = this.current + i,
                count = this.items.length;

            if (_i < 0) {
                (_i = _i + count)
            }
            if (_i >= count) {
                _i = _i - count
            }
            this.current = _i
        },
        goPlay() {
            if (this.autoplay) {
                this.autoPlayFlag = setInterval(() => {
                    this.turn(1)
                }, this.delay * 1000)
            }
        },
        pausePlay() {
            clearInterval(this.autoPlayFlag)
        },
        handleClick(i) {
            let option = (i - 1) - this.current
            this.turn(option)
        }
    },
    ready() {
        this.goPlay()
    }
}
</script>

<style scoped>
.slider {
    overflow: hidden;
    width: 100%;
    position: relative;
}

.slider > ul {
    height: auto;
    overflow: hidden;
    position: relative;
    left: 0;
    transition: left 1s;
}

.slider-item {
    display: inline-block;
    height: auto;
}

.slider-item > img {
    display: inline-block;
    height: auto;
    width: 100%;
}

.slider .slider-arrow {
    display: inline-block;
    color: #fff;
    font-size: 30px;
    position: absolute;
    top: 50%;
    width: 40px; height: 40px;
    text-align: center;
    line-height: 40px;
    margin-top: -20px;
    z-index: 3;
    cursor: pointer;
}

.slider .slider-arrow:hover {
    background: rgba(0, 0, 0, 0.2);
}

.slider-arrow-right {
    right: 0;
}

.slider-arrow-left {
    left: 0;
}

.slider .slider-dots-wrap {
    z-index: 2;
    text-align: center;
    width: 100%;
    position: absolute;
    bottom: 0;
}

.slider-dot {
    display: inline-block;
    width: 6px;
    height: 6px;
    cursor: pointer;
    border-radius: 20px;
    background: #ccc;
    margin: 3px;
}

.slider-dot.slider-dot-selected {
    background: #666;
}
</style>
