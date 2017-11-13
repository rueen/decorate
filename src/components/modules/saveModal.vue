<!--
	提示层
	2016.12.26
	李瑞云
 -->
<template>
  <div>


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
              <input type="text" class="form-control" placeholder="请填写分享标题" v-model="saveOptions.share_title">
            </div>
          </div>
          <div class="table-row">
            <div class="table-cell cell-left">分享描述</div>
            <div class="table-cell">
              <input type="text" class="form-control" placeholder="请填写分享描述" v-model="saveOptions.share_description">
            </div>
          </div>
          <div class="table-row">
            <div class="table-cell cell-left">分享图标</div>
            <div class="table-cell">
              <input type="text" class="form-control" placeholder="http://" v-model="saveOptions.share_img">
            </div>
            <div class="table-cell cell-right">
              <button class="btn btn-default" @click="popup('bgImage')">选择图片</button>
            </div>
          </div>
          <div class="itemImg" v-show="saveOptions.share_img">
            <img :src="saveOptions.share_img" alt="">
          </div>
        </div>
        <p>发布后将覆盖原数据，是否发布？</p>
      </div>
    </modal>
    <image-choice v-if="imageChoice.showModal" :modalOptions="imageChoice" @close="closeImageChoicePop" @ok="imageChoiceSuccess"></image-choice>


</div>
</template>

<script>
  import modal from './modal'
  import imageChoice from './imageChoice'
  export default {
    data() {
      return {
        modalOptions: {
          size: 'mini',
          className: 'saveModal'
        },
        src:"",
        imageChoice: {
          showModal: false,
          curTab: 'upload', //当前选项卡
//          selected: this.data.bgImage
        },
      }
    },
    props: [ 'saveOptions' ],
    components: { modal,imageChoice },
    created: function(){

    },
    computed: {

    },
    methods: {
      close: function() {
        this.$emit('close')
      },
      //换取弹窗
      popup(name){
        this.name = name
        this.imageChoice.showModal = true
      },
      //关闭图片选择弹窗
      closeImageChoicePop: function(){
        this.imageChoice.showModal = false;
      },
      //选择图片成功回调
      imageChoiceSuccess: function(opts){
        this.imageChoice.showModal = false;
        this.src = opts.src;
        this.saveOptions.share_img=opts.src;
        console.log(this.src)
//        this.imageChoice.selected = opts.src;
      },
      //点击确定按钮
      ok: function(){
//        console.log(this.saveOptions.shareData,6666)
        this.$emit('ok', {
          pageName: this.saveOptions.pageName,
          share_title: this.saveOptions.share_title,
          share_description: this.saveOptions.share_description,
          share_img: this.saveOptions.share_img,
        })
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
  .itemImg{
    width: 100px;
    height: 80px;
    margin-bottom: 6px;
  }
  .itemImg img{
    display: inline-block;
    width: 100px;
    height: 80px;
  }
</style>











