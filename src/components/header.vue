<!--
  头部操作区
  李瑞云 2016.12.01
 -->

<template>
    <div class="header-wrap clearfix">
        <!--<a href="back" class="fl btn-red btn-back"><span class="iconfont icon-arrow-left"></span>返回</a>
        <div class="fl btn-preview" @click="showQrcode" v-if="qrcode.src">
            查看页面
        </div>
        <div class="fl btn-course" @click="showCourse">
            <span class="iconfont icon-doubt"></span>
            教程
        </div>
                -->
        <button class="fr btn-save btn-red" @click="saveClick">
            <span class="iconfont icon-save"></span>
            发布
        </button>

        <div class="fr btn-clear" @click="clearData">
            <span class="iconfont icon-clear"></span>
            清空
        </div>
        <tips :tipsOptions="tipsOptions" v-if="showTips" @timeout="tipsTimeout"></tips>
        <modal v-if="qrcode.show" :modalOptions="qrcode.options" @close="closeQrcodeModal">
            <div slot="header"></div>
            <div slot="body">
                <img :src="qrcode.src" alt="" class="qrcode">
                <p class="qrcode-text">微信扫一扫，在手机中查看</p>
            </div>
        </modal>
        <!-- 清空数据确认框 -->
        <modal v-if="clear.showModal" :modalOptions="clear.modalOptions" @close="closeClearModal" @ok="okClearModal"></modal>
        <!-- 保存数据确认框 -->
        <save-modal v-if="save.showModal" :saveOptions="save.saveOptions" @close="closeSaveModal" @ok="okSaveModal" :saveState="save.state"></save-modal>
        <!-- <modal v-if="save.showModal" :modalOptions="save.modalOptions" @close="closeSaveModal" @ok="okSaveModal">
            <div slot="body">
                <p>页面名称</p>
                <div class="page-name">
                    <input type="text" class="form-control" placeholder="请填写页面名称" v-model="pageName">
                </div>
                <p>发布后将覆盖原数据，是否发布？</p>
            </div>
        </modal> -->
        <!-- 签约认证弹框 -->
        <modal v-if="sign.showModal" :modalOptions="sign.modalOptions" @close="closeSignModal">
            <div slot="body">
                <p>你的商城未进行签约认证，仅可体验商城后台功能,无法配置微信商城，是否联系客户经理进行签约？</p>
            </div>
            <div slot="button">
                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=2885683019&amp;site=qq&amp;menu=yes" class="btn btn-small fr btn-blue">联系在线客服</a>
                <a href="javascript:void(0)" class="btn btn-small fr btn-default btn-cancel mr10" @click="closeSignModal">暂时不需要</a>
            </div>
        </modal>
        <!-- 教程 S -->
        <course v-if="isShowCourse" @close="closeCourse"></course>
        <!-- 教程 E -->
    </div>
</template>

<script>
import $ from 'jquery'
import common from '../assets/js/common.js'
import {bus} from '../assets/js/bus.js'
import {info, decoration} from '../config.js'
import tips from './modules/tips'
import service from '../assets/js/service.js'
import localStorage from '../assets/js/localStorage.js'
import modal from './modules/modal'
import course from './modules/course'
import saveModal from './modules/saveModal'

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
                src: !!decoration.id ? (info.contextPath + '/shop/decorateQrcode?id=' + decoration.id) : false,
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
            //保存
            save: {
                showModal: false,
                state: location.search.indexOf('decorationId') > 0,
                saveOptions: {
                    pageName: decoration.name,
                    share_title:"",
                    share_description:"",
                    share_img:""
                  //  shareData: bus.shareData
                }
            },
            //签约认证
            sign: {
                showModal: false,
                modalOptions: {
                    size: 'mini',
                    width: '500px'
                }
            },
            isShowCourse: false//是否显示教程
        }
    },
    components: { tips, modal, course, 'save-modal': saveModal },
    methods: {
        closeSaveModal: function(){
            this.save.showModal = false;
        },
        saveClick: function(){
            this.save.showModal = true;
        },
        okSaveModal: function(data){
            var that = this,
              _data = {};
//                _data = $.extend({
//                    id: '',
//                    isIndex: 0,
//                    name: '',
//                    shopId: '',
//                    shopName: '',
//                    content: '',
//                    goodsIds: '',
//                    shareData: '',
//                });

            _data.content = common.filter(JSON.stringify(bus.list));
            _data.page_title = data.pageName;
//            _data.shareData = common.filter(JSON.stringify(data.shareData));
//            _data.url = data.url;
            _data.share_title = data.share_title;
            _data.share_description = data.share_description;
            _data.share_img = data.share_img;
            this.save.showModal = false;
            isDev = false;
//            console.log(_data,'123456789');
            if(isDev){
                //本地调试
                localStorage.set('pageData', common.filter(JSON.stringify(bus.list)));
                localStorage.set('shareData', common.filter(JSON.stringify(data.shareData)));
                that.showTips = true;
            } else {
                //正式环境
                service.saveDecoration({
                    data:_data ,
                    success: function(resp){
                        that.showTips = true;
                    },
                    fail: function(){
                        that.tipsOptions.type = 'error';
                        that.tipsOptions.text = '保存失败';
                        that.showTips = true;
                    }
                })
            }
        },
        //
        tipsTimeout: function(){
            this.showTips = false;
        },
        //打开二维码弹窗
        showQrcode: function(){
            if(info.sign_status){
                //已签约
                this.qrcode.show = true;
            } else {
                //未签约
                this.sign.showModal = true;
            }
        },
        //关闭二维码弹窗
        closeQrcodeModal: function(){
            this.qrcode.show = false;
        },
        //清空数据
        clearData: function(){
            this.clear.showModal = true;
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
            //清空右侧编辑区
            bus.$emit('setCurrentIndex', {index: null});
        },
        //显示教程
        showCourse: function(){
            this.isShowCourse = true;
        },
        //关闭教程
        closeCourse: function(){
            this.isShowCourse = false;
        },
        //关闭签约认证
        closeSignModal: function(){
            this.sign.showModal = false;
        }
    }
}
</script>

<style scoped>
.header-wrap{
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
.page-name{
    padding: 5px 0 10px;
}
</style>
