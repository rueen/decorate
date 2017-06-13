/*
 * 公共实例，用于组件间通信
 * 李瑞云 2016.12.01
*/
import $ from 'jquery'
import Vue from 'vue'
//焦点图
import singlePicPreview from '../../components/parts/singlePic/preview'
import singlePicEdit from '../../components/parts/singlePic/edit'
//轮播图
import slideBoxPreview from '../../components/parts/slideBox/preview'
import slideBoxEdit from '../../components/parts/slideBox/edit'
//新分类
import categoriesPreview from '../../components/parts/categories/preview'
import categoriesEdit from '../../components/parts/categories/edit'
//顶部分类
import categoriesBarPreview from '../../components/parts/categoriesBar/preview'
import categoriesBarEdit from '../../components/parts/categoriesBar/edit'
//团购
import tuanPreview from '../../components/parts/tuan/preview'
import tuanEdit from '../../components/parts/tuan/edit'
//今日上新
import todayPreview from '../../components/parts/today/preview'
import todayEdit from '../../components/parts/today/edit'
//大师推荐
import recommended2Preview from '../../components/parts/recommended2/preview'
import recommended2Edit from '../../components/parts/recommended2/edit'
// 在此处添加组件
import localStorage from './localStorage.js'

var config = !!configs ? configs : {
    shopId: '',
    baseUrl: '',
    data: '[]'
};

//左侧组件标签
var tags = [{
    category: '图文类',
    list: [{
        name: '焦点图',
        type: 'singlePic',
        max: null,
        tips: '一般选择一张宣传热图，或者可以一张装饰性图片，如果是纯装饰性的，可以不要文字和连接'
    },
    {
        name: '多图轮播',
        type: 'slideBox',
        max: 1,
        tips: '也称幻灯片，可以选择多张图片（直接输入链接或上传），将在首页自动切换轮播'
    }]
},
{
    category: '区域类',
    list: [{
        name: '新分类',
        type: 'categories',
        max: null,
        tips: ''
    },
    {
        name: '顶部分类',
        type: 'categoriesBar',
        max: 1,
        tips: '列出宝贝的几大类，供顾客挑选'
    }]
},
{
    category: '营销类',
    list: [{
        name: '团购',
        type: 'tuan',
        max: 1,
        tips: ''
    },
    {
        name: '今日上新',
        type: 'today',
        max: 1,
        tips: ''
    },
    {
        name: '大师推荐',
        type: 'recommended2',
        max: 1,
        tips: ''
    }]
}];

//默认数据
var defaultElement = {
    //焦点图
    singlePic: {
        name: 'singlePic',
        data: {
            imgsrc: 'http://store.test.seatent.com/img/decorate/hd-depot/000.jpg',
            href: ''
        }
    },
    //多图轮播
    slideBox: {
        name: 'slideBox',
        data: [{ 
            'imgsrc': 'http://store.test.seatent.com/img/decorate/hd-depot/000.jpg',
            'href': '' 
        }]
    },
    //新分类
    categories: {
        name: 'categories',
        data: {
            'name': 'test',
            'pics': [{
                'imgsrc': 'http://store.test.seatent.com/img/decorate/hd-depot/000.jpg',
                'href': ''
            }]
        }
    },
    //顶部分类
    categoriesBar: {
        name: 'categoriesBar',
        data: [{ 
            'title': '111',
            'href': ''
        }]
    },
    //团购
    tuan: {
        name: 'tuan',
        data: {
            'gp1': '',
            'gp2': '',
            'gp3': ''
        }
    },
    //今日上新
    today: {
        name: 'today',
        data: {
            'todays': ''
        }
    },
    //大师推荐
    recommended2: {
        name: 'recommended2',
        data: {
            'masterrcd': '',
            'subcheck': false
        }
    }
}

var componentsPreview = {
    singlePic: singlePicPreview,
    slideBox: slideBoxPreview,
    categoriesBar: categoriesBarPreview,
    categories: categoriesPreview,
    tuan: tuanPreview,
    today: todayPreview,
    recommended2: recommended2Preview
};

var componentsEdit = {
    singlePic: singlePicEdit,
    slideBox: slideBoxEdit,
    categoriesBar: categoriesBarEdit,
    categories: categoriesEdit,
    tuan: tuanEdit,
    today: todayEdit,
    recommended2: recommended2Edit
};

var bus = new Vue({
    data: {
        list: typeof config.data == 'string' ? ($.parseJSON(config.data) || []) : (config.data || []),
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
    },
    // 在组件销毁前清除事件监听
    beforeDestroy: function () {
        this.$off('clearList', this.clearList)
        this.$off('setLoading', this.setLoading)
    },
    methods: {
        clearList: function() {
            var len = this.list.length;

            this.list.splice(0, len);
        },
        //设置loading
        setLoading: function(data){
            this.loading.isShow = data.isShow
        }
    }
})

var info = config

export {tags, defaultElement, componentsPreview, componentsEdit, bus, info}