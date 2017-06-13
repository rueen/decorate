<!-- 
  头部操作区
  李瑞云 2016.12.01
 -->

<template>
    <div class="wrap clearfix">
        <a href="decorate/back" class="fl btn-red btn-back"><span class="iconfont icon-arrow-left"></span>返回</a>
        <div class="fl btn-preview" @click="showQrcode">
            查看页面
        </div>
        <div class="fl btn-course" @click="showCourse">
            <span class="iconfont icon-doubt"></span>
            教程
        </div>
        <button class="fr btn-save btn-red" @click="save">
            <span class="iconfont icon-save"></span>
            保存
        </button>
        <div class="fr btn-clear" @click="clearData">
            <span class="iconfont icon-clear"></span>
            清空
        </div>
        <tips :tipsOptions="tipsOptions" v-if="showTips" @timeout="showTips = false"></tips>
        <modal v-if="qrcode.show" :modalOptions="qrcode.options" @close="closeQrcodeModal">
            <div slot="header"></div>
            <div slot="body">
                <img :src="qrcode.src" alt="" class="qrcode">
                <p class="qrcode-text">微信扫一扫，在手机中查看</p>
            </div>
        </modal>
        <modal v-if="clear.showModal" :modalOptions="clear.modalOptions" @close="closeClearModal" @ok="okClearModal"></modal>
        <!-- 教程 S -->
        <course v-if="isShowCourse" @close="closeCourse"></course>
        <!-- 教程 E -->
    </div>
</template>

<script>
import {bus, info} from '../assets/js/bus.js'
import tips from './modules/tips'
import service from '../assets/js/service.js'
import localStorage from '../assets/js/localStorage.js'
import modal from './modules/modal'
import course from './modules/course'

export default {
    data () {
        return {
            showTips: false,
            tipsOptions: {
                type: 'success',
                text: '保存成功'
            },
            //二维码
            qrcode:{
                show: false,
                src: info.contextPath + '/shop/decorateQrcode?id=' + info.decorationId,
                options: {
                    className: 'qrcodeModal',
                    width: '240px',
                    size: 'mini',
                    showConfirmButton: false,
                    showCancelButton: false
                }
            },
            //清空
            clear: {
                showModal: false,
                modalOptions: {
                    size: 'mini',
                    content: '清空后将无法返回，确定清空吗？'
                }
            },
            isShowCourse: false//是否显示教程
        }
    },
    components: { tips, modal, course },
    methods: {
        save: function(){
            var that = this;

            if(isDev){
                localStorage.set('pageData', JSON.stringify(bus.list));
                that.showTips = true;
            } else {
                service.save({
                    data: {
                        shopId: info.shopId,
                        content: JSON.stringify(bus.list)
                    },
                    success: function(resp){
                        that.showTips = true;
                    }
                })
            }
        },
        //打开二维码弹窗
        showQrcode: function(){
            this.qrcode.show = true;
        },
        //关闭二维码弹窗
        closeQrcodeModal: function(){
            this.qrcode.show = false;
        },
        //清空数据
        clearData: function(){
            this.clear.showModal = true
        },
        //关闭清空弹窗
        closeClearModal: function(){
            this.clear.showModal = false;
        },
        //确定清空
        okClearModal: function(){
            //清空数据
            bus.$emit('clearList');

            this.clear.showModal = false;
        },
        //显示教程
        showCourse: function(){
            this.isShowCourse = true;
        },
        //关闭教程
        closeCourse: function(){
            this.isShowCourse = false;
        }
    }
}
</script>

<style scoped>
.wrap{
    width: 100%; height: 48px;
    background: #fff;
    border-bottom: 1px solid #ddd;
}
.btn-save,
.btn-back,
.btn-course,
.btn-preview,
.btn-clear{
    height: 100%;
    padding: 0 20px;
    border: 0;
    cursor: pointer;
    line-height: 46px;
    font-size: 14px;
}
.btn-course,
.btn-preview{
    border-right: 1px solid #ddd;
}
.btn-course:hover,
.btn-preview:hover,
.btn-clear:hover{
    background: #f5f5f5;
}
.btn-back .iconfont{
    padding-right: 5px;
}
.qrcode{
    display: block;
    width: 200px; height: 200px;
    margin: 0 auto;
}
.qrcode-text{
    text-align: center;
    padding-top: 10px;
}
</style>