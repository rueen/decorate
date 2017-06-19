<template>
    <div class="countDown">
        <span class="text">{{hour}}时</span>
        <span>:</span>
        <span class="text">{{minute}}分</span>
        <span>:</span>
        <span class="text">{{second}}秒</span>
    </div>
</template>
<script>
export default {
    props: {
        date: {
            default: new Date()
        }
    },
    data() {
        return {
            hour: '00',
            minute: '00',
            second: '00',
            count: this.date - new Date().getTime(),
            interval: null
        }
    },
    mounted() {
        this.start()
    },
    methods: {
        start() {
            this.interval = setInterval(() => {
                this.count = this.count - 1000
                if (this.count <= 0) {
                    this.second = '00'
                    clearInterval(this.interval)
                    this.timeDown()
                    return
                }
                this.hour = parseInt(this.count / (60 * 60 * 1000)) + ''
                if (this.hour < 10) {
                    this.hour = '0' + this.hour
                }
                let n = this.count % (60 * 60 * 1000)
                this.minute = parseInt(n / (60 * 1000)) + ''
                if (this.minute < 10) {
                    this.minute = '0' + this.minute
                }
                let n2 = n % (60 * 1000)
                this.second = parseInt(n2 / 1000) + ''
                if (this.second < 10) {
                    this.second = '0' + this.second
                }
            }, 1000)
        },
        timeDown() {
            this.$emit('timeDown')
        }
    },
    computed: {}
}
</script>
<style scoped>
.countDown{
    color: #000;
    display: inline-block;
}
.text {
    border: 1px solid #000;
    padding: 0 5px;
    display: inline-block;
    height: 20px;
    line-height: 18px;
}
</style>
