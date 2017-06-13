// 存放公共js
// 李瑞云 2016.12.01

import $ from 'jquery'
import Vue from 'vue'
import {bus} from './bus.js'

export default {
    loading: '<div class="js-loader loader">'
        +'<div class="loader-inner ball-spin-fade-loader">'
            +'<div></div>'
            +'<div></div>'
            +'<div></div>'
            +'<div></div>'
            +'<div></div>'
            +'<div></div>'
            +'<div></div>'
            +'<div></div>'
        +'</div>'
    +'</div>',

	ajax: function(opts){
        //显示loading
        bus.$emit('setLoading', {isShow: true});

		$.ajax({
            url: opts.url,
            type: opts.type || 'POST',
            cache: opts.cache,
            dataType: opts.dataType || 'JSON',
            data: opts.data,
            timeout: opts.timeout || 60000,
            processData: opts.processData || false,
            contentType: opts.contentType || false,
            beforeSend: function(){

            },
            complete: function(resp){
                // console.log(resp)
            },
            success: function(resp){
                var _resp = (typeof resp == 'string') ? $.parseJSON(resp) : resp;

                //隐藏loading
                bus.$emit('setLoading', {isShow: false});

                opts.success && opts.success(_resp);
            },
            error: function(resp){
                //隐藏loading
                bus.$emit('setLoading', {isShow: false});
                console.log(resp)
            }
        })
	}
}