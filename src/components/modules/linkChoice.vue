<!-- 
  连接选择弹出框
  李瑞云 2016.12.01
 -->

<template>
    <modal :modalOptions="linkChoice.options" @close="close">
        <div slot="body" class="linkChoice-body clearfix">
            <div class="nav fl">
                <ul>
                    <li class="nav-item" v-for="tab in linkChoice.tabs" :class="{'cur': linkChoice.curTab == tab.name}" @click="changeLinkChoiceTab(tab.name)">{{tab.text}}</li>
                </ul>
            </div>
            <!-- 我的商品列表 -->
            <div class="content fr" v-show="linkChoice.curTab == 'myGoods'">
                <div class="content-wrap">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>商品名称</th>
                                <th>类型</th>
                                <!-- <th>库存</th> -->
                                <!-- <th>销量</th> -->
                                <th>价格</th>
                                <th>进货时间</th>
                                <!-- <th>排序</th> -->
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="selected-box-wrap" :class="{'selected': selected == linkMosaic[linkChoice.curTab] + item.id}" v-for="item in data.myGoods.data" @click="ok(item)">
                                <td>
                                    <div class="thumbnail-box">
                                        <img :src="item.thumbnail" alt="" class="thumbnail">
                                        <div class="fl goods-title clamp2">{{item.name}}</div>
                                    </div>
                                </td>
                                <td>{{item.tradeType | tradeType-filter}}</td>
                                <!-- <td>{{item.quantity}}</td> -->
                                <!-- <td>{{item.saleNum}}</td> -->
                                <td>{{item.price}}</td>
                                <td>{{item.updatetime | timeFormat}}</td>
                                <!-- <td>{{item.sortNo}}</td> -->
                                <td>
                                    <div class="selected-box">
                                        <span class="iconfont icon-select"></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <pagination v-if="data.myGoods.page"
                :pageNum="data.myGoods.page.pageNum"
                :count="data.myGoods.page.pageCount"
                @goPage="goPage"></pagination>
            </div>
            <!-- 分组列表 -->
            <div class="content fr" v-show="linkChoice.curTab == 'group'">
                <div class="content-wrap">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>分组编号</th>
                                <th>分组名称</th>
                                <th>所属模块</th>
                                <!-- <th>分组商品数</th> -->
                                <th>更新时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="selected-box-wrap" :class="{'selected': selected == linkMosaic[linkChoice.curTab] + item.id}" v-for="item in data.group.groupList" @click="ok(item)">
                                <td>{{item.id}}</td>
                                <td>{{item.name}}</td>
                                <td>{{item.location | location—filter}}</td>
                                <!-- <td></td> -->
                                <td>{{item.updateTime | timeFormat}}</td>
                                <td>
                                    <div class="selected-box">
                                        <span class="iconfont icon-select"></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <pagination v-if="data.group.page"
                :pageNum="data.group.page.pageNum"
                :count="data.group.page.pageCount"
                @goPage="goPage"></pagination>
            </div>
            <!-- 限时特卖列表 -->
            <div class="content fr" v-show="linkChoice.curTab == 'sale'">
                <div class="content-wrap">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>活动编号</th>
                                <th>特卖名称</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="selected-box-wrap" :class="{'selected': selected == linkMosaic[linkChoice.curTab] + item.id}" v-for="item in data.sale.activitiesList" @click="ok(item)">
                                <td>{{item.id}}</td>
                                <td>{{item.name}}</td>
                                <td>{{item.startTime | timeFormat}}</td>
                                <td>{{item.endTime | timeFormat}}</td>
                                <td>{{item.status | saleStatus(item.startTime, item.endTime)}}</td>
                                <td>
                                    <div class="selected-box">
                                        <span class="iconfont icon-select"></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <pagination v-if="data.sale.page"
                :pageNum="data.sale.page.pageNum"
                :count="data.sale.page.pageCount"
                @goPage="goPage"></pagination>
            </div>
            <!-- 装修页面列表 -->
            <div class="content fr" v-show="linkChoice.curTab == 'decoration'">
                <div class="content-wrap">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>页面名称</th>
                                <th>更新时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="selected-box-wrap" :class="{'selected': selected == linkMosaic[linkChoice.curTab] + item.id}" v-for="item in data.decoration.decorationList" @click="ok(item)">
                                <td>{{item.id}}</td>
                                <td>{{item.name}}</td>
                                <td>{{item.updatetime | timeFormat}}</td>
                                <td>
                                    <div class="selected-box">
                                        <span class="iconfont icon-select"></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <pagination v-if="data.decoration.page"
                :pageNum="data.decoration.page.pageNum"
                :count="data.decoration.page.pageCount"
                @goPage="goPage"></pagination>
            </div>
            <!--商品标签列表--> 
            <div class="content fr getTab" v-show="linkChoice.curTab == 'getTab'">
                <div class="content-wrap">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>名称</th>
                                <th>类型</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="selected-box-wrap" v-for="item in data.getTab" @click="ok(item)">
                                <td>{{item.tag_id}}</td>
                                <td>{{item.tag_name}}</td>
                                <td>{{ item.tag_type_str }}</td>
                                <td>
                                    <div class="selected-box">
                                        <span class="iconfont icon-select"></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <pagination 
                :pageNum="page"
                :count="count"
                @goPage="goPage"></pagination>
            </div>
            <!--广告位列表-->
            <div class="content fr" v-show="linkChoice.curTab == 'getDev'">
                <div class="content-wrap">
                    <table class="list-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>名称</th>
                                <th>类型</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="selected-box-wrap" :class="{'selected': selected == linkMosaic[linkChoice.curTab] + item.id}" v-for="item in data.getDev" @click="ok(item)">
                                <td>{{item.acid}}</td>
                                <td>{{item.cname}}</td>
                                <td>{{item.atype | setType}}</td>
                                <td>
                                    <div class="selected-box">
                                        <span class="iconfont icon-select"></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
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
import Vue from "vue"
import $ from 'jquery'
import modal from './modal'
import pagination from './pagination'
import {info, decoration} from '../../config.js'
import service from '../../assets/js/service.js'
import filter from '../../assets/js/filter.js'
Vue.filter('setType',function(value){
    return value == '0' ? '图片' : 'flash'
})

export default {
    data() {
        var opts = this.modalOptions;

	    return {
            selected: opts.selected,
            pageNum:10,
            page:1,
            count:"",
	        linkChoice: {
                showModal: false,
                options: {
                    title: '选择链接',
                    showCancelButton: false,
                    showConfirmButton: false
                },
                tabs: opts.tabs || [{
                    name: 'myGoods',
                    text: '我的商品列表'
                },
                {
                    name: 'group',
                    text: '分组列表'
                },
                {
                    name: 'sale',
                    text: '限时特卖列表'
                },
                {
                    name: 'decoration',
                    text: '装修页面列表'
                },
                {
                    name: 'getTab',
                    text: '商品标签列表'
                },
                {
                    name: 'getDev',
                    text: '广告推荐列表'
                }],
                curTab: opts.curTab || 'myGoods'
            },
            data: {//存放列表数据
                myGoods: {},
                group: {},
                sale: {},
                decoration: {},
                tabList:{},
                getTab:[],
                getDev:[]
            },
            pageSize: {
                myGoods: 6
            },
            linkMosaic: { //连接拼接
                myGoods: '#/goods/',
                group: '#/groups/show/',
                sale: '#/activities/show/',
                decoration: '#/pages/show/'
            }
	    };
	},
    props: ['modalOptions'],
    computed: {

    },
    created: function(){
        this.renderList();
    },
	components: {
        modal, pagination
    },
	methods: {
        //渲染列表
        renderList: function(opts){
            var opts = opts || {};
            var that = this,
                type = that.linkChoice.curTab,
                opt = $.extend({}, {
                    type: type,
                    pageNum: 1,
                    shopId: info.shopId,
                    pageSize: that.pageSize[type] || 10
                }, opts)
            
            service.linkChoice[opt.type]({
                pageNum: opt.pageNum,
                pageSize: opt.pageSize,
                // shopId: opt.shopId,
                success: function(resp){
                    // var _data = resp.page ? resp : resp.rows;
                    that.data[opt.type] = resp.rows
                    that.count = Math.ceil(resp.total/10)
                    // that.data[opt.type] = _data;
                },
            })
        },
        //分页点击
        goPage: function(opt){
            console.log(opt)
            this.page = opt.pageNum
            this.renderList({
                pageNum: opt.pageNum
            })
        },
        //切换连接选择弹窗选项卡
        changeLinkChoiceTab: function(type){
            var that = this,
                opt = {
                    type: type
                }

            this.linkChoice.curTab = type;

            this.renderList(opt);
        },
        close: function() {
            this.$emit('close')
        },
        ok: function(item){
            // var id = item.id,
            //     name = item.name,
            //     link = this.linkMosaic[this.linkChoice.curTab] + id + '/';
            item.type = this.linkChoice.curTab
                
            this.$emit('ok', item)
        }
	},
}
</script>

<style scoped>
/* 连接选择弹窗 S */
.content-wrap{
    height: 420px;
    overflow-y: auto;
}
.linkChoice-body{
    width: 100%; height: 100%;
}
.linkChoice-body .nav{
    width: 150px;
    height: 100%;
    background: #f5f5f5;
    position: relative;
}
.linkChoice-body .nav-item{
    border-bottom: 1px solid #ddd;
    width: 100%;
    padding: 15px;
    cursor: pointer;
}
.linkChoice-body .nav-item.cur{
    background: #fff;
}
.linkChoice-body .nav .upload-btn-box{
    width: 100%; height: 50px;
    line-height: 50px;
    position: absolute;
    bottom: 0; left: 0;
    background: #337ab7;
    text-align: center;
    color: #fff;
    cursor: pointer;
}
.linkChoice-body .content{
    padding: 20px;
    width: 650px;
}

.thumbnail{
    width: 40px; height: 40px;
    float: left;
    margin-left: -50px;
}
.thumbnail-box{
    width: 200px;
    padding-left: 50px;
}
.list-table{
    width: 100%;
    border-spacing: 0;
    border-collapse: collapse;
}
.list-table th,
.list-table td{
    padding: 10px;
    text-align: center;
    font-weight: normal;
    font-size: 12px;
}
.list-table th{
    background: #f9f9f9;
    color: #000;
}
.list-table td{
    cursor: pointer;
}
.selected-box-wrap:hover td{
    background: #fbfbfb;
}
.goods-title{
    width: 150px;
    text-align: left;
}
</style>











