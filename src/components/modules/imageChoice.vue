<!--
  图片选择弹出框
  李瑞云 2016.12.01
 -->

<template>
    <modal :modalOptions="imageChoice.options" @close="close">
        <div slot="body" class="imageChoice-body clearfix">
            <div class="nav fl">
                <ul>
                    <!-- <li class="nav-item" :class="{'cur': imageChoice.curTab == 'library'}" @click="changeImageChoiceTab('library')">海带图库</li> -->
                    <li class="nav-item" :class="{'cur': imageChoice.curTab == 'upload'}" @click="changeImageChoiceTab('upload')">我的图片</li>
                </ul>
                <div class="upload-btn-box">
                    <span class="iconfont icon-upload"></span>
                    上传
                    <input type="file" class="upload-btn" name="crop-up-img" accept="image/jpg,image/jpeg,image/png,image/gif" pictype="30010003" @change="upload">
                </div>
            </div>
            <div class="content fr popUp-upload-content" v-show="imageChoice.curTab == 'upload'">
                <div class="content-wrap">
                    <div class="add" v-if="imgList.length == 0">
                        <span class="iconfont icon-upload"></span>
                        <input type="file" class="upload-btn" name="crop-up-img" accept="image/jpg,image/jpeg,image/png,image/gif" pictype="30010003" @change="upload">
                    </div>
                    <div class="wrap" v-if="imgList.length > 0">
                        <div class="list clearfix">
                            <div class="img-item selected-box-wrap" :class="{'selected': selected == item}" v-for="item in imgList" @click="ok(item.url)">
                                <img :src="item.url" alt="" class="thumbnail">
                                <div class="selected-box">
                                    <span class="iconfont icon-select"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <pagination
                :pageNum="page"
                :count="count"
                @goPage="goPage"></pagination>
            </div>
        </div>
    </modal>
</template>

<script>
import $ from 'jquery'
import modal from './modal'
import localStorage from '../../assets/js/localStorage.js'
import {info} from '../../config.js'
import service from '../../assets/js/service.js'
import pagination from './pagination'


export default {
    data() {
        var opts = this.modalOptions;
	    return {
            selected: opts.selected,
	        imageChoice: {
                options: {
                    title: '选择图片',
                    showCancelButton: false,
                    showConfirmButton: false
                },
                curTab: opts.curTab || 'library', //当前选项卡
            },
          page:1,
          rows:6,
          count:'',
          imgList:[]
	    };
	},
    props: ['modalOptions'],
    computed: {

    },

    created: function(){

    },
	components: {
        modal, pagination
    },
  mounted:function (  ) {
    this.getImgList();
  },
	methods: {
      //获取图片列表
       getImgList:function () {
         var that = this;
         service.getImgList({
           page: this.page,
           rows: this.rows,
           success: function(resp){
             that.count = Math.ceil(resp.total/6);
             that.imgList = resp.rows;
           },
         })
       },
        //模拟分页
        goPage: function(opt){
         this.page = opt.pageNum;
         this.getImgList();
        },
		//切换图片选择弹窗选项卡
        changeImageChoiceTab: function(type){
            var that = this;
            this.imageChoice.curTab = type;
        },
        //上传图片
        upload: function(e){
            var that = this,
                files = e.target.files,
                formData = new FormData(),
                event = e,
                i = files.length;
            while (i--) {
                if (files[i].size > ( 1024 * 1024  * 1)) {
                    alert('单张图片大小不能超过1024k(1M),请压缩后重新上传');
                    return false;
                }else{
                    formData.append('file', files[0]);
                    formData.append('filedataFileName', event.target.value);
                }
            }
            service.upload({
                cache: false,
                data: formData,
                dataType: 'JSON',
                processData: false,
                contentType: false,
                success: function(resp){
                  that.getImgList()
                },
                fail:function(resp){
                    alert(resp.message)
                }
            })
        },
        close: function() {
            this.$emit('close')
        },
        ok: function(src){
            this.$emit('ok', {src: src})
        }
	},
}
</script>

<style scoped>
/* 图片选择弹窗 S */
.imageChoice-body{
    width: 100%; height: 100%;
}
.imageChoice-body .nav{
    width: 150px;
    height: 100%;
    background: #f5f5f5;
    position: relative;
}
.imageChoice-body .nav-item{
    border-bottom: 1px solid #ddd;
    width: 100%;
    padding: 15px;
    cursor: pointer;
}
.imageChoice-body .nav-item.cur{
    background: #fff;
}
.imageChoice-body .nav .upload-btn-box{
    width: 100%; height: 50px;
    line-height: 50px;
    position: absolute;
    bottom: 0; left: 0;
    background: #00cd85;
    text-align: center;
    color: #fff;
    cursor: pointer;
}
.icon-upload{
    font-size: 20px;
}
.imageChoice-body .content{
    padding: 20px;
    width: 650px;
}
.popUp-upload-content {
    position: relative;
    height: 100%;
}
.popUp-upload-content .add{
    display: inline-block;
    width: 100px; height: 100px;
    position: absolute;
    left: 50%; top: 50%;
    margin: -50px 0 0 -50px;
    border: 1px solid #eee;
    text-align: center;
    line-height: 100px;
    cursor: pointer;
    border-radius: 5px;
}
.popUp-upload-content .add:hover{
    border-color: #ddd;
}
.popUp-upload-content .icon-upload{
    color: #eee;
    font-size: 40px;
}
.popUp-upload-content .add:hover .icon-upload{
    color: #ddd;
}
.upload-btn{
    width: 100%; height: 100%;
    position: absolute;
    left: 0; top: 0;
    cursor: pointer;
    opacity: 0;
}
.wrap{
    width: 610px;
}
.list{
    width: 620px;
    margin-right: -10px;
}
.img-item{
    width: 300px; height: 120px;
    float: left;
    margin: 0 10px 10px 0;
    overflow: hidden;
    border: 1px solid #f5f5f5;
    box-shadow: 1px 1px 0 #f5f5f5;
    cursor: pointer;
    padding: 5px;
}
.thumbnail{
    width: 100%; height: 100%;
}
.content-wrap{
    height: 420px;
    overflow-y: auto;
}
.selected-box-wrap{
    position: relative;
}
.selected-box{
    position: absolute;
    right: 5px; top: 5px;
    text-align: center;
}
/* 图片选择弹窗 E */
</style>











