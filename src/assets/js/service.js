// 接口
// 李瑞云 2016.12.01

import $ from 'jquery'
import common from './common.js'
import {info} from './bus.js'

export default {
	//保存
	save: function(opts){
		var opt = $.extend({
			url: info.baseUrl + '/goods/appSaveDecoration',
			type: 'POST'
		}, opts);

		common.ajax(opt)
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
		}
	},
	//图片上传
	upload: function(opts){
		var opt = $.extend({
			url: info.baseUrl + '/goods/appUploadShopPic',
			type: 'POST',
		}, opts);

		common.ajax(opt)
	},
	//获取限时特卖数据
	getSale: function(opts){
		var opt = $.extend({
			url: info.baseUrl + '/activities/getActivityGoodDtoByActivityId?activityId=' + opts.activityId + '&shopId=' + opts.shopId + '&pageSize=' + opts.pageSize + '&pageNum=' + opts.pageNum,
			type: 'GET'
		}, opts);

		common.ajax(opt)
	},
	//获取分组列表信息
	getGroup: function(opts){
		var opt = $.extend({
			url: info.baseUrl + '/goods/getGroupGoodDtoById?groupId=' + opts.groupId + '&shopId=' + opts.shopId + '&pageSize=' + opts.pageSize + '&pageNum=' + opts.pageNum,
			type: 'GET'
		}, opts);

		common.ajax(opt)
	}
}
















