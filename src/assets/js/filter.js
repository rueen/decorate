//过滤器
import Vue from 'vue'

//时间格式化
Vue.filter('timeFormat', function (value) {
	var _value = new Date(value);

	return _value.toLocaleDateString().replace(/\//g, "-") + " " + _value.toTimeString().substr(0, 8);
})

//商品分组所属模块
Vue.filter('location—filter', function (value) {
	var _value;

	if(value == 1){
		_value = '大师礼包'
	} else if(value == 2){
		_value = '超值热卖'
	} else if(value == 3){
		_value = '大师推荐'
	} else if(value == 4){
		_value = '今日上新'
	}

	return _value;
})

//限时特卖状态
Vue.filter('saleStatus', function (value, startTime, endTime) {
	var nowTime = new Date().getTime(),
		_value;

	if(nowTime < startTime){
		_value = '未开始'
	} else if(nowTime >= startTime && nowTime < endTime){
		_value = '已开始'
	}

	return _value;
})

//我的商品列表类型
Vue.filter('tradeType-filter', function (value) {
	var _value;

	if(value == 1){
		_value = '保税'
	} else if(value == 2){
		_value = '一般贸易'
	} else if(value == 3){
		_value = '直邮'
	} else if(value == 4){
		_value = '海外直邮'
	} else if(value == 5){
		_value = '特卖'
	}

	return _value;
})