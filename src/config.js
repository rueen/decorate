/*
 * 配置文件
 * 李瑞云 2016.12.01
*/
//焦点图
import $ from 'jquery'
import singlePicPreview from './components/parts/singlePic/preview'
import singlePicEdit from './components/parts/singlePic/edit'
//限时抢购
import timeLimitPreview from './components/parts/timeLimit/preview.vue'
import timeLimitEdit from './components/parts/timeLimit/edit.vue'
//满减送
import fullSubtractPreview from './components/parts/fullSubtract/preview.vue'
import fullSubtractEdit from './components/parts/fullSubtract/edit.vue'
//商品分组
import goodsGroupPreview from './components/parts/goodsGroup/preview.vue'
import goodsGroupEdit from './components/parts/goodsGroup/edit.vue'
//标题
import titleTextPreview from './components/parts/title/preview.vue'
import titleTextEdit from './components/parts/title/edit.vue'
//优惠券
import couponPreview from './components/parts/coupon/preview.vue'
import couponEdit from './components/parts/coupon/edit.vue'
//轮播图
import slideBoxPreview from './components/parts/slideBox/preview'
import slideBoxEdit from './components/parts/slideBox/edit'
//新分类
import categoriesPreview from './components/parts/categories/preview'
import categoriesEdit from './components/parts/categories/edit'
//顶部分类
import categoriesBarPreview from './components/parts/categoriesBar/preview'
import categoriesBarEdit from './components/parts/categoriesBar/edit'
//团购
import tuanPreview from './components/parts/tuan/preview'
import tuanEdit from './components/parts/tuan/edit'
//今日上新
import todayPreview from './components/parts/today/preview'
import todayEdit from './components/parts/today/edit'
//大师推荐
import recommended2Preview from './components/parts/recommended2/preview'
import recommended2Edit from './components/parts/recommended2/edit'
//商品列表
import goodsListPreview from './components/parts/goodsList/preview'
import goodsListEdit from './components/parts/goodsList/edit'
//标签单排
import singleRowPreview from './components/parts/singleRow/preview'
import singleRowEdit from './components/parts/singleRow/edit'
//标签双排
import doubleRowPreview from './components/parts/doubleRow/preview'
import doubleRowEdit from './components/parts/doubleRow/edit'


// 在此处添加组件
import localStorage from './assets/js/localStorage.js'

var config = !!configs ? configs : {
    baseUrl: '',
};

var decoration = decorations ? decorations : {};

//左侧组件标签
var tags = [
    {
        category: '图文类',
        list: [
        // {
        //     name: '多图轮播',
        //     type: 'slideBox',
        //     max: 1,
        //     tips: '也称幻灯片，可以选择多张图片（直接输入链接或上传），将在首页自动切换轮播'
        // },
        {
            name: '焦点图',
            type: 'singlePic',
            max: null,
            tips: '一般选择一张宣传热图，或者可以一张装饰性图片，如果是纯装饰性的，可以不要文字和连接'
        },{
            name: '标题',
            type: 'titleText',
            max: null,
            tips: '标题有默认样式和自定义样式'
          }
        ]
    },
    // {
    //     category: '标签列表',
    //     list: [{
    //         name: '双列',
    //         type: 'doubleRow',
    //         max: null,
    //         tips: '标签的双排列方式'
    //     }]
    // },
  {
        category: '营销类',
        list: [{
            name: '限时抢购',
            type: 'timeLimit',
            max: null,
            tips: '抢购类'
        },
          {
            name: '满减送',
            type: 'fullSubtract',
            max: null,
            tips: '抢购类'
          }, {
            name: '商品分组',
            type: 'goodsGroup',
            max: null,
            tips: '抢购类'
          },
          // {
          //   name: '优惠券',
          //   type: 'coupon',
          //   max: null,
          //   tips: '优惠活动，钱钱钱！！！'
          // }
        ]
    },
];

//默认数据
var defaultElement = {
    //焦点图
    singlePic: {
        name: 'singlePic',
        data:{
          column:'1',
          list:[
            {
              'imgsrc': 'http://img.seatent.com/statics/action/ac20170531/ac201530_tor_banner3.jpg',
              'href': 'http://www.baidu.com'
            }
          ]
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
            'title': '首页',
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
    },
    //商品列表
    goodsList: {
        name: 'goodsList',
        data: {
            id: '',
            bgColor: '#fff',
            bgImage: '',
            priceTitle: '女生价:',
            priceColor: '#ff79c3',
            showBorder: true,
            borderColor: '#eee',
            title: '',
            titleColor: '#333'
        }
    },
    //双排标签
    doubleRow:{
        name:"doubleRow",
        data:{
            title:"主会场, 四大通奶粉",
            bgImage: '', //背景图片
            borderImg:"", //边框图片
            titleBj:"", //标题图片
            bgColor: '#f8bf00',
            titleColor: '#fff',
            priceColor:'red',
            borderColor: '#eee',
            goodId:"123",
            type:"0",
            list:[]
        }
    },
  //限时抢购
  timeLimit:{
      name:"timeLimit",
      data:{
        column:'1',
        activityId:"",
        bgColor:'white',
        bgImage:'',
        borderColor:'gainsboro',
        printColor:"999999",
        btnBgColor:'red',
        btnTextColor:'#ffffff',
        printLabel:'价格',
        picked:'one',
        isShowBtn:true,
        isShowOriginalPrice:true,
        isShowlife:true,
        isShowBuyNum:true,
        isShowEnableStore:true,
        isShowTime:true,
        isShowLabel:false
    }
  },
  //满减送
  fullSubtract:{
    name:"fullSubtract",
    data:{
      column:'1',
      activityId:"",
      bgColor:'white',
      btnBgColor:'red',
      btnTextColor:'#ffffff',
      bgImage:'',
      borderColor:'gainsboro',
      picked:'one',
      printColor:"#000",
      printLabel:'价格',
      isShowBtn:true,
      isShowOriginalPrice:true,
      isShowlife:true,
      isShowActive:true
    }
  },
  //商品分组
  goodsGroup:{
    name:"goodsGroup",
    data:{
      column:'1',
      groupId:"",
      bgColor:'white',
      bgImage:'',
      borderColor:'gainsboro',
      btnBgColor:'red',
      btnTextColor:'#ffffff',
      picked:'one',
      printColor:"#000",
      printLabel:'价格',
      isShowBtn:true,
      isShowOriginalPrice:true,
      isShowlife:true
    }
  },
  //标题
  titleText:{
      name:"titleText",
      data:{
          titleName:'美妆销量王',
          bgColor:'#4A3A3A',
          fontColor:'#FFFFFF',
          bgImage:''
      }
  },
  //优惠券
  coupon:{
      name:'coupon',
      data:{
        line:"1",
        isShowGet:'true',
        list:[
          {
            id:'测试id',
            bgColor:'#ffffff',
            bgImage:'',
            borderColor:'#dddddd',
            printColor:'red',
            textColor:"#9f9f9f"
          }
        ]
      }
  }
};

var componentsPreview = {
    singlePic: singlePicPreview,
    slideBox: slideBoxPreview,
    categoriesBar: categoriesBarPreview,
    categories: categoriesPreview,
    tuan: tuanPreview,
    today: todayPreview,
    recommended2: recommended2Preview,
    goodsList: goodsListPreview,
    singleRow:singleRowPreview,
    doubleRow:doubleRowPreview,
    timeLimit:timeLimitPreview,
    fullSubtract:fullSubtractPreview,
    goodsGroup:goodsGroupPreview,
    titleText:titleTextPreview,
    coupon:couponPreview
};

var componentsEdit = {
    singlePic: singlePicEdit,
    slideBox: slideBoxEdit,
    categoriesBar: categoriesBarEdit,
    categories: categoriesEdit,
    tuan: tuanEdit,
    today: todayEdit,
    recommended2: recommended2Edit,
    goodsList: goodsListEdit,
    singleRow:singleRowEdit,
    doubleRow:doubleRowEdit,
    timeLimit:timeLimitEdit,
    fullSubtract:fullSubtractEdit,
    goodsGroup:goodsGroupEdit,
    titleText:titleTextEdit,
    coupon:couponEdit
};

var info = config;

export {tags, defaultElement, componentsPreview, componentsEdit, info, decoration}
