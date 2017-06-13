<template>
<transition name="fade">
	<div class="course-mask">
        <div class="course-wrap">
            <div class="course-step course-step1">
                <span class="arrow iconfont icon-arrow"></span>
                <span class="num">1</span>点击或拖拽组件到手机框
            </div>
            <div class="course-step course-step2">
                <span class="arrow iconfont icon-arrow-bottom"></span>
                <span class="num">2</span>点击选中组件，在右侧编辑其内容
            </div>
            <div class="course-step course-step3">
                <span class="arrow iconfont icon-arrow-top"></span>
                <span class="num">3</span>点击保存，完成首页更新
                <div class="clearfix">
                    <div class="fr btn btn-orange btn-course-close" @click="close">
                        我知道了
                        <span class="iconfont icon-cuowu"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</transition>
</template>

<script>
export default {
    data() {
    	return {

    	}
	},
    created: function(){

    },
	computed: {
		
	},
	methods: {
	    close: function() {
	    	this.$emit('close')
	    }
	},
}
</script>

<style scoped>
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s
}
.fade-enter, .fade-leave-active {
  opacity: 0
}
.course-mask {
    position: fixed;
    z-index: 3;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, .3);
    display: table;
    transition: opacity .3s ease;
}
.course-step{
    background: #000;
    width: 210px;
    border-radius: 3px;
    padding: 15px;
    position: absolute;
    color: #fff;
}
.course-step1{
    left: 200px; top: 60px;
}
.course-step2{
    left: 50%; top: 100px;
    margin-left: -100px;
}
.course-step3{
    right: 20px; top: 60px;
}
.course-step .num{
    border: 1px solid #ef3f3f;
    color: #ef3f3f;
    border-radius: 50%;
    display: inline-block;
    width: 24px; height: 24px;
    line-height: 22px;
    text-align: center;
    margin-right: 5px;
}
.course-step .arrow{
    position: absolute;
    font-size: 25px;
    color: #000;
}
.course-step1 .arrow{
    left: -15px;
    top: 0;
}
.course-step2 .arrow{
    left: 0;
    bottom: -21px;
}
.course-step3 .arrow{
    right: 10px;
    top: -20px;
}
.btn-course-close{
    margin-top: 10px;
    color: #fff;
}
.btn-course-close .iconfont{
    font-size: 12px;
}
</style>











