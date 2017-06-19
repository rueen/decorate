<!-- 
	提示层
	2016.12.26
	李瑞云
 -->
<template>
<modal :modalOptions="modalOptions" @close="close" @ok="ok">
    <div slot="body">
        <div class="table">
            <div class="table-row">
                <div class="table-cell cell-left">页面名称</div>
                <div class="table-cell">
                    <input type="text" class="form-control" placeholder="请填写页面名称" v-model="saveOptions.pageName">
                </div>
            </div>
            <div class="table-row">
                <div class="table-cell cell-left">分享标题</div>
                <div class="table-cell">
                    <input type="text" class="form-control" placeholder="请填写分享标题" v-model="saveOptions.shareData.title">
                </div>
            </div>
            <div class="table-row">
                <div class="table-cell cell-left">分享描述</div>
                <div class="table-cell">
                    <input type="text" class="form-control" placeholder="请填写分享描述" v-model="saveOptions.shareData.desc">
                </div>
            </div>
            <div class="table-row">
                <div class="table-cell cell-left">分享图标</div>
                <div class="table-cell">
                    <input type="text" class="form-control" placeholder="http://" v-model="saveOptions.shareData.icon">
                </div>
            </div>
        </div>
        <p>发布后将覆盖原数据，是否发布？</p>
    </div>
</modal>
</template>

<script>
import modal from './modal'

export default {
    data() {
        return {
            modalOptions: {
                size: 'mini',
                className: 'saveModal'
            },
        }
	},
    props: [ 'saveOptions' ],
    components: { modal },
    created: function(){
    	
    },
	computed: {
		
	},
	methods: {
	    close: function() {
            this.$emit('close')
        },
        //点击确定按钮
        ok: function(){
            this.$emit('ok', {pageName: this.saveOptions.pageName, shareData: this.saveOptions.shareData})
        }
	},
}
</script>

<style scoped>
.table{
    width: 100%;
}
.table-cell{
    padding: 10px 10px 10px 0;
}
.cell-left{
    width: 80px
}
</style>











