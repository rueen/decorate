<template>
	<div class="pagination">
		<span class="prev page-item" :class="{'disabled': pageNum <= 1}" @click="prev">上一页</span>
		<span class="cur page-item">{{pageNum}}</span>
		<span>/</span>
		<span class="count page-item" @click="goPage(count)">{{count}}</span>
		<span class="next page-item" @click="next" :class="{'disabled': pageNum >= count}">下一页</span>
	</div>
</template>

<script>
import Vue from 'vue'

export default {
    data() {
	    return {
	    	
	    };
	},
    props: ['pageNum', 'count'],
    created: function(){

    },
	computed: {
		
	},
	methods: {
	    prev: function(){
	    	var that = this,
	    		pageNum = this.pageNum;

	    	if(pageNum > 1){
	    		pageNum -= 1;

	    		this.$emit('goPage', {pageNum: pageNum})
	    	}
	    },
	    next: function(){
	    	var that = this,
	    		pageNum = this.pageNum;

	    	if(pageNum < that.count){
	    		pageNum += 1;

	    		this.$emit('goPage', {pageNum: pageNum})
	    	}
	    },
	    goPage: function(page){
	    	if(this.pageNum != page){
	    		this.$emit('goPage', {pageNum: page})
	    	}
		}
	}
}
</script>

<style scoped>
.pagination{
    height: 40px;
    line-height: 40px;
    text-align: center;
}
.page-item{
	cursor: pointer;
}
.cur{
	color: #f18c16;
}
.disabled{
	color: #999;
	cursor: default;
}
</style>











