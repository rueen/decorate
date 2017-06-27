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
            <!-- <div class="content fr" v-show="imageChoice.curTab == 'library'">
                <div class="wrap">
                    <div class="list clearfix">
                        <div class="item" @click="ok('http://store.test.seatent.com/img/decorate/hd-depot/000.jpg')">
                            <img src="http://store.test.seatent.com/img/decorate/hd-depot/000.jpg" alt="" class="thumbnail">
                        </div>
                        <div class="item" @click="ok('http://store.test.seatent.com/img/decorate/hd-depot/001.jpg')">
                            <img src="http://store.test.seatent.com/img/decorate/hd-depot/001.jpg" alt="" class="thumbnail">
                        </div>
                        <div class="item" @click="ok('http://store.test.seatent.com/img/decorate/hd-depot/002.jpg')">
                            <img src="http://store.test.seatent.com/img/decorate/hd-depot/002.jpg" alt="" class="thumbnail">
                        </div>
                        <div class="item" @click="ok('http://store.test.seatent.com/img/decorate/hd-depot/003.jpg')">
                            <img src="http://store.test.seatent.com/img/decorate/hd-depot/003.jpg" alt="" class="thumbnail">
                        </div>
                    </div>
                </div>
            </div> -->
            <div class="content fr popUp-upload-content" v-show="imageChoice.curTab == 'upload'">
                <div class="content-wrap">
                    <div class="add" v-if="userImages.all.length == 0">
                        <span class="iconfont icon-upload"></span>
                        <input type="file" class="upload-btn" name="crop-up-img" accept="image/jpg,image/jpeg,image/png,image/gif" pictype="30010003" @change="upload">
                    </div>
                    <div class="wrap" v-if="userImages.all.length > 0">
                        <div class="list clearfix">
                            <div class="img-item selected-box-wrap" :class="{'selected': selected == item}" v-for="item in userImages.cur" @click="ok(item)">
                                <img :src="item" alt="" class="thumbnail">
                                <div class="selected-box">
                                    <span class="iconfont icon-select"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <pagination 
                :pageNum="userImages.pageNum"
                :count="userImages.count"
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

var images = !!localStorage.get('userImages') ? localStorage.get('userImages').split(',') : [],
    pageNum = 1,
    pageSize = 6,
    cur = images.length >= pageSize ? images.slice(0, pageSize) : images,
    count = Math.ceil(images.length / pageSize);

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
            userImages: {
                all: images,//本地缓存‘我的图片’
                pageNum: pageNum,
                cur: cur,
                count: count
            },
	    };
	},
    props: ['modalOptions'],
    computed: {

    },
    watch: {
        'userImages.all': {
            handler: function(val){
                var images = val,
                    cur = images.length >= pageSize ? images.slice(0, pageSize) : images,
                    count = Math.ceil(images.length / pageSize);

                this.userImages.cur = cur;//重置当前页数据列表
                this.userImages.count = count;//重置页码
            },
            deep:true
        }
    },
    created: function(){
        console.log(this.userImages)
    },
	components: {
        modal, pagination
    },
	methods: {
        //模拟分页
        goPage: function(opt){
            var images = this.userImages.all,
                _pageNum = opt.pageNum,
                cur = images.length > (pageSize * _pageNum) ? images.slice(pageSize * (_pageNum - 1), pageSize * _pageNum) : images.slice(pageSize * (_pageNum - 1));

            this.userImages.pageNum = opt.pageNum;//重置当前页码
            this.userImages.cur = cur//重置当前页数据列表
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
                    // that.userImages.all = []
                    if(!!resp.data){
                        $.each(resp.data, function(index, url){
                            if(url.indexOf('http') > -1){
                                that.userImages.all.unshift(url);
                            }
                            
                        })
                        //更新本地缓存
                        localStorage.set('userImages', that.userImages.all)
                    }
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











