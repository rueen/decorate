<!-- 
	提示层
	2016.12.26
	李瑞云
 -->
<template>
<transition name="tips">
	<div class="tips-mask">
		<div class="tips-wrapper">
			<div class="modal-container" :class="type">{{text}}</div>
	    </div>
    </div>
</transition>
</template>

<script>
export default {
    data() {
    	var opts = this.tipsOptions;

	    return {
	        type: opts.type || 'warning',//error:报错提示,success:成功提示,warning:警告提示
	        text: opts.text || '提示',
	        timeout: opts.timeout || 3000
	    };
	},
    props: [ 'tipsOptions' ],
    created: function(){
    	var that = this,
    		time = this.timeout;

    	//倒计时隐藏提示框
    	setTimeout(function(){
    		that.$emit('timeout')
    	}, time)
    },
	computed: {
		
	},
	methods: {
	    
	},
}
</script>

<style scoped>
.tips-mask {
	position: fixed;
	z-index: 9998;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: table;
	transition: opacity .3s ease;
}
.tips-wrapper {
  display: table-cell;
  padding-top: 30px;
}
.modal-container {
	width: 320px;
	margin: 0px auto;
	overflow: hidden;
	box-shadow: 0 2px 8px rgba(0, 0, 0, .1);
	transition: all .3s ease;
	padding: 10px;
	line-height: 20px;
	text-align: center;
	font-size: 12px;
}
.modal-container.error{
	background: #ff0006;
	color: #fff;
}
.modal-container.success{
	background: #81f092;
	color: #006506;
}
.modal-container.warning{
	background: #ffeba9;
	color: #866308;
}
.tips-enter {
  opacity: 0;
}

.tips-leave-active {
  opacity: 0;
}

.tips-enter .tips-dialog,
.tips-leave-active .tips-dialog {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
</style>











