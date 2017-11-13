// 接口
// 李瑞云 2016.12.01

import $ from 'jquery'
import common from './common.js'
import {info} from '../../config.js'

export default {
	//保存
	save: function(opts){
		var opt = $.extend({
			url: info.baseUrl + '/goods/appSaveDecoration',
		}, opts);

		// common.post(opt)
		common.post(opt)
	},
	//连接选择
	linkChoice: {
		myGoods: function(opts){
			var opt = $.extend({
				url: info.baseUrl + '/goods/appGoodsList?shopId=' + opts.shopId + '&pageSize=' + opts.pageSize + '&pageNum=' + opts.pageNum,
				type: 'GET'
			}, opts);

			common.ajax(opt)
		},
		group: function(opts){
			var opt = $.extend({
				url: info.baseUrl + '/decorate/getGroupList?shopId=' + opts.shopId + '&pageSize=' + opts.pageSize + '&pageNum=' + opts.pageNum,
				type: 'GET'
			}, opts);

			common.ajax(opt)
		},
		sale: function(opts){
			var opt = $.extend({
				url: info.baseUrl + '/decorate/getActivityList?shopId=' + opts.shopId + '&pageSize=' + opts.pageSize + '&pageNum=' + opts.pageNum,
				type: 'GET'
			}, opts);

			common.ajax(opt)
		},
		decoration: function(opts){
			var opt = $.extend({
				url: info.baseUrl + '/decorate/getDecorationList?shopId=' + opts.shopId + '&pageSize=' + opts.pageSize + '&pageNum=' + opts.pageNum,
				type: 'GET'
			}, opts);

			common.ajax(opt)
		},
    //获取商品分组商品详情
    getGoodsGroupDetail:function (opts) {
      var opt = $.extend({
        url: info.baseUrl +'shop/admin/decoration!searchinggoods.do?&appkey=30664875' +'&groupId='+ opts.groupId,
        type: 'GET',
        cache:false
      }, opts);
      common.ajax(opt)
    },
    //获取商品详情
    getGoodsDetail:function (opts) {
      var opt = $.extend({
        url: info.baseUrl +'shop/admin/decoration!searchinggoods.do?&appkey=30664875' +'&activityId='+ opts.activityId,
        type: 'GET',
        cache:false
      }, opts);
      common.ajax(opt)
    },
    //获取焦点图列表
    singlePic:function (opts) {
      var opt = $.extend({
        url: info.baseUrl + 'shop/admin/decoration!listJson.do?rows='+opts.rows+'&page='+opts.page+'&activityName=' + opts.activityName,
        type: 'GET',
        cache:false
      }, opts);
      common.ajax(opt)
    },
    //获取商品分组标签列表
    goodsGroup:function (opts) {
      var opt = $.extend({
        url: info.baseUrl + '/shop/admin/goodsgroup!listJson.do?rows='+opts.rows+'&page='+opts.page+'&tagName=' + opts.activityName,
        type: 'GET',
        cache:false
      }, opts);

      common.ajax(opt)
    },
    //获取满减送标签列表
    fullSubtract:function (opts) {
      var opt = $.extend({
        url: info.baseUrl + '/shop/admin/operation_activity!listJson.do?activityType=6'+'&rows='+opts.rows+'&page='+opts.page+'&state='+opts.state+ '&activityName=' + opts.activityName,
        type: 'get',
        cache:false
      }, opts);
      console.log(opt);
      common.ajax(opt)
    },
    //获取限时特卖标签列表
    timeLimit:function (opts) {
      var opt = $.extend({
        url: info.baseUrl + '/shop/admin/operation_activity!listJson.do?activityType=5' + '&rows='+opts.rows+'&page='+opts.page+'&state='+opts.state+ '&activityName=' + opts.activityName,
        type: 'GET',
        cache:false
      }, opts);

      common.ajax(opt)
    },
		//获取标签列表
		getTab: function(opts){
			var opt = $.extend({
				url: info.baseUrl + '/shop/admin/tag!listJson.do?page='+opts.pageNum+'&rows='+opts.pageSize,
				type: 'GET',
				cache:false
			}, opts);

			common.ajax(opt)
		},
		//获取标签详细接口
		getTabDetails: function(opts){
			var opt = $.extend({
				url: info.baseUrl + '/shop/admin/goodsShow!listJson.do?tagid='+opts.goodId+'&ajax=yes',
				type: 'GET',
				cache:false
			}, opts);

			common.ajax(opt)
		},
		//获取广告位列表
		getDev:function(opts){
			var opt = $.extend({
				url: info.baseUrl + '/core/admin/adColumn!listJson.do?page='+opts.pageNum+'&rows=10',
				type: 'POST',
			}, opts);

			common.ajax(opt)
		},
	},
  //获取图片列表
  getImgList:function (opts) {
    var opt = $.extend({
      url: info.baseUrl + '/shop/admin/decoration!showPic.do?page='+opts.page+'&rows='+opts.rows,
      type: 'GET',
      cache:false
    }, opts);

    common.ajax(opt)
  },
	//图片上传
	upload: function(opts){
		var opt = $.extend({
			   url: info.baseUrl + '/shop/admin/decoration!upload.do',
			type: 'POST',
		}, opts);

		common.ajax(opt)
	},
	//获取限时特卖数据
	getSale: function(opts){
		var pageSize = opts.pageSize ? ('&pageSize=' + opts.pageSize) : '',
			pageNum = opts.pageNum ? ('&pageNum=' + opts.pageNum) : '',
			opt = $.extend({
				url: info.baseUrl + '/activities/getActivityGoodDtoByActivityId?activityId=' + opts.activityId + '&shopId=' + opts.shopId + pageSize + pageNum,
				type: 'GET'
			}, opts);

		common.ajax(opt)
	},
	//获取分组列表信息
	getGroup: function(opts){
		var pageSize = opts.pageSize ? ('&pageSize=' + opts.pageSize) : '',
			pageNum = opts.pageNum ? ('&pageNum=' + opts.pageNum) : '',
			opt = $.extend({
				url: info.baseUrl + '/goods/getGroupGoodDtoById?groupId=' + opts.groupId + '&shopId=' + opts.shopId + pageSize + pageNum,
				type: 'GET'
			}, opts);

		common.ajax(opt)
	},
	//提交模板数据
	saveDecoration:function(opts){
	  // console.log(opts);
		var opt = $.extend({
				url: info.baseUrl + '/shop/admin/decoration!saveDecoration.do',
				contentType:'application/x-www-form-urlencoded'
			}, opts);

			common.post(opt)
	}
}
















