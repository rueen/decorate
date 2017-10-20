// 存放公共js
// 李瑞云 2016.12.01

import $ from 'jquery'
import Vue from 'vue'
import {bus} from './bus.js'

export default {

	ajax: function(opts){
        //显示loading
        bus.$emit('setLoading', {isShow: true});

		$.ajax({
            url: opts.url,
            type: opts.type || 'POST',
            cache: opts.cache, //缓存
            dataType: opts.dataType || 'JSON',
            data: opts.data,
            timeout: opts.timeout || 60000,
            processData: opts.processData || false,
            contentType: opts.contentType || false,
            xhrFields: {withCredentials: true},


            complete: function(resp){
                // console.log(resp)
            },
            success: function(resp){
                var _resp = (typeof resp == 'string') ? $.parseJSON(resp) : resp;

                if(typeof _resp.result != 'undefined' && _resp.result != 1){
                    //失败回调
                    opts.fail && opts.fail(_resp);
                } else {
                    opts.success && opts.success(_resp);
                }
                //隐藏loading
                bus.$emit('setLoading', {isShow: false});
            },
            error: function(resp){
                //隐藏loading
                bus.$emit('setLoading', {isShow: false});
                //失败回调
                opts.fail && opts.fail(_resp);
                console.log(resp)
            }
        })
	},
    post: function(opts){
        //显示loading
        bus.$emit('setLoading', {isShow: true});

        $.post(opts.url, opts.data).always(function (resp) {
            opts.success && opts.success(resp);
            //隐藏loading
            bus.$emit('setLoading', {isShow: false});
        }, 'json')
    },
    //过滤特殊字符
    filter: function(data){
        //去空格
        return data.replace(/(\s+)/g, '')
    }
}
