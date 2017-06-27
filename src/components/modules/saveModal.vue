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
        </div>
        <p v-if="saveState">编辑后将覆盖原数据，是否发布？</p>
        <p v-else>发布后将覆盖原数据，是否发布？</p>
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
    props: [ 'saveOptions', 'saveState' ],
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
            this.$emit('ok', this.saveOptions )
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











