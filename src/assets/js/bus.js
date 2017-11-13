/*
 * 公共实例，用于组件间通信
 * 李瑞云 2016.12.01
*/
import $ from 'jquery'
import Vue from 'vue'

import {tags, defaultElement, componentsPreview, componentsEdit, info, decoration} from '../../config.js'

var shareData = {
    title: '',
    desc: '',
    icon: ''
};
var bus = new Vue({
    data: {
        list: typeof decoration.content == 'string' ? ($.parseJSON(decoration.content) || []) : (decoration.content || []),
        shareData: typeof decoration.shareData == 'string' ? ($.parseJSON(decoration.shareData) || shareData) : (decoration.shareData || shareData),
        current: {
            edit: null, //当前编辑元素编辑区模板数据
            index: null //当前编辑元素索引
        },//当前编辑元素
        loading: {
            isShow: false,//是否显示loading
        }
    },
    created: function () {
        this.$on('clearList', this.clearList)
        this.$on('setLoading', this.setLoading)
        this.$on('setCurrentIndex', this.setCurrentIndex)
    },
    // 在组件销毁前清除事件监听
    beforeDestroy: function () {
        this.$off('clearList', this.clearList)
        this.$off('setLoading', this.setLoading)
        this.$off('setCurrentIndex', this.setCurrentIndex)
    },
    watch: {
        'current.index': {
            handler: function(val){
                this.current.edit = this.list[val];
            },
            deep: true
        }
    },
    methods: {
        clearList: function() {
            var len = this.list.length;
            this.list.splice(0, len);
        },
        //设置loading
        setLoading: function(data){
            this.loading.isShow = data.isShow
        },
        //设置当前组件索引
        setCurrentIndex: function(data){
            this.current.index = data.index;
        }
    }
})

export {bus}
