<!--
  连接选择弹出框
  李瑞云 2016.12.01
 -->

<template>
    <modal :modalOptions="linkChoice.options" @close="close">

        <div slot="body" class="linkChoice-body clearfix">
          <div class="mySearch">
            <div class="statue" v-show="linkChoice.curTab == 'timeLimit'||linkChoice.curTab == 'fullSubtract'">
              <span>状态：</span>
              <select v-model="state" @change="changeSele(state)">
                <option disabled value="">请选择</option>
                <option value="">全部</option>
                <!--<option value="1">已结束</option>-->
                <!--<option value="2">已暂停</option>-->
                <option value="3">进行中</option>
                <option value="4">未开始</option>
              </select>
            </div>
            <div class="search">
              <input type="text" v-model="tagName">
              <button @click="search">搜索</button>
            </div>
          </div>
          <div class="detail">
            <div class="nav">
              <ul>
                <li class="nav-item" v-for="tab in linkChoice.tabs" :class="{'cur': linkChoice.curTab == tab.name}" @click="changeLinkChoiceTab(tab.name)">{{tab.text}}</li>
              </ul>
            </div>
            <!-- 限时抢购 -->
            <div class="content " v-show="linkChoice.curTab == 'timeLimit'">
              <div class="content-wrap">
                <table class="list-table">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>活动名称</th>
                    <th>创建时间</th>
                    <th>有效时间</th>
                     <th>状态</th>
                    <th>操作</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr class="selected-box-wrap" v-for="item in data.timeLimit"   @click="ok(item)">
                    <td>
                     {{item.tag_id}}
                    </td>
                    <td> {{item.tag_name.substring(0,4)}}</td>
                    <td>{{item.create_time}}</td>
                    <td>{{item.rule_type_value}}</td>
                     <td v-show="item.state==1||item.state==2">{{item.state==1?'已结束':'已暂停'}}</td>
                     <td v-show="item.state==3||item.state==4">{{item.state==3?'进行中':'未开始'}}</td>
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
            <!-- 满减送 -->
            <div class="content " v-show="linkChoice.curTab == 'fullSubtract'">
              <div class="content-wrap">
                <table class="list-table">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>活动名称</th>
                    <th>创建时间</th>
                    <th>有效时间</th>
                     <th>状态</th>
                    <th>操作</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr class="selected-box-wrap" v-for="item in data.fullSubtract"   @click="ok(item)">
                    <td>
                     {{item.tag_id}}
                    </td>
                    <td> {{item.short_name.substring(0,4)}}</td>
                    <td>{{item.create_time}}</td>
                    <td>{{item.rule_type_value}}</td>
                    <td v-show="item.state==1||item.state==2">{{item.state==1?'已结束':'已暂停'}}</td>
                    <td v-show="item.state==3||item.state==4">{{item.state==3?'进行中':'未开始'}}</td>
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
            <!-- 商品分组 -->
            <div class="content " v-show="linkChoice.curTab == 'goodsGroup'">
              <div class="content-wrap">
                <table class="list-table">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>标签名称</th>
                    <th>创建时间</th>
                    <th>操作</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr class="selected-box-wrap" v-for="item in data.goodsGroup"   @click="ok(item)">
                    <td>
                     {{item.id}}
                    </td>
                    <td> {{item.name.substring(0,4)}}</td>
                    <td>{{item.create_time.time | timeFormat}}</td>
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
            <!--焦点图-->
            <div class="content " v-show="linkChoice.curTab == 'singlePic'">
              <div class="content-wrap">
                <table class="list-table">
                  <thead>
                  <tr>
                    <th>ID</th>
                    <th>页面名称</th>
                    <th>创建时间</th>
                    <th>更新时间</th>
                    <th>操作</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr class="selected-box-wrap"  v-for="item in data.singlePic"   @click="ok(item)">
                    <td>
                      {{item.id}}
                    </td>
                    <td> {{item.share_title.substring(0,4)}}</td>
                    <td>{{item.add_time | timeFormat}}</td>
                    <td>{{item.lastmodified | timeFormat}}</td>
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
            <!-- 分组列表 -->
            <div class="content " v-show="linkChoice.curTab == 'group'">
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
            <div class="content" v-show="linkChoice.curTab == 'sale'">
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
            <div class="content" v-show="linkChoice.curTab == 'decoration'">
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
            <div class="content getTab" v-show="linkChoice.curTab == 'getTab'">
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
import test from '../../assets/js/test.js'


Vue.filter('setType',function(value){
    return value == '0' ? '图片' : 'flash'
})

export default {
    data() {
        var opts = this.modalOptions;

	    return {
            state:"",
            tagName:"",
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
                    name: 'fullSubtract',
                    text: '满减送'
                },
                {
                    name: 'goodsGroup',
                    text: '商品分组'
                },
                {
                    name: 'timeLimit',
                    text: '限时特卖'
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
                timeLimit:[],
               singlePic:[],
              goodsGroup:[],
              fullSubtract:[]
            },
            pageSize: {
                myGoods: 6
            },
            linkMosaic: { //连接拼接
                myGoods: '#/goods/',
                group: '#/groups/show/',
                sale: '#/activities/show/',
                decoration: '#/pages/show/'
            },
            list:[]
	    };
	},
    props: ['modalOptions'],
    computed: {

    },
    created: function(){
        this.renderList();

    },
  mounted:function (  ) {
    console.log(test);
    this.list = test.data.result

  },
	components: {
        modal, pagination
    },
	methods: {
        //状态筛选
        changeSele:function ( ) {
          this.renderList();
        },
        //搜索
       search:function (  ) {
         this.renderList();
       },
        //渲染列表
        renderList: function(opts){
            var opts = opts || {};
            var that = this,
                type = that.linkChoice.curTab,
                opt = $.extend({}, {
                    type: type,
                    pageNum: 1,
                    shopId: info.shopId,
                    pageSize: that.pageSize[type] || 10,
                    state:that.state,
                    tagName:that.tagName
                }, opts);
            service.linkChoice[opt.type]({
                page: opt.pageNum,
                rows: opt.pageSize,
                state:opt.state,
                activityName:opt.tagName,
                success: function(resp){
                     var _data = resp.page ? resp : resp.rows;
                    that.data[opt.type] = resp.rows;
                    that.count = Math.ceil(resp.total/10);
//                     that.data[opt.type] = _data;
                },
            })
        },
        //分页点击
        goPage: function(opt){
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
             var id = item.goods_id,
                 name = item.name,
                 link = this.linkMosaic[this.linkChoice.curTab] + id + '/';
            item.type = this.linkChoice.curTab;
            this.$emit('ok', item)
        }
	},
}
</script>

<style scoped>
/* 连接选择弹窗 S */
.mySearch{
  display: flex;
  justify-content: flex-end;
  align-items: center;
  box-sizing: border-box;
  padding: 10px 20px 0 ;
}
.statue{
  margin-right: 25px;
  margin-bottom: -4px;
}
.detail{
  height: 100%;
  width: 100%;
  display: flex;
}
.content-wrap{
    height: 420px;
    overflow-y: auto;
  box-sizing: border-box;
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
    /*border-bottom: 1px solid #ddd;*/
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
    padding: 15px;
    width: 100%;
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











