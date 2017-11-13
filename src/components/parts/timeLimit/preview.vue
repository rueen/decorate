
<template>
  <div class="doubleTab"  >
    <div  v-show="data.isShowTime" class="title f2">
      <p class="f5">距离美妆大促结束仅剩</p>
      <p>
        <span class="blockTime">1</span>
        <span class="blockTime">8</span> 时
        <span class="blockTime">3</span>
        <span class="blockTime">0</span> 分
        <span class="blockTime">3</span>
        <span class="blockTime">0</span> 秒
      </p>
    </div>
    <div v-show="data.column=='1'" class="oneLine" :style="{'background-color': data.bgColor, 'background-image':'url('+data.bgImage+')'}">
      <div class="contain" :style="{'border-color':data.borderColor}" v-for="item in goodsList">
        <div class="itemImg">
          <img v-show="data.isShowLabel" class="smallImg" :src="item.tagLogo" alt="">
          <img :src="item.small" class="bigImg" alt="">
        </div>
        <div class="ContainDetail">
          <p class="f13">{{item.name}}</p>
          <p class="limit" v-show="data.isShowlife">
            有效期 ：<span class="calendar f10 time">{{item.life}}</span> 以后
          </p>
          <p>
            <span  class="f0 gray" :style="{'color':data.printColor}">{{data.printLabel}}：</span>
            <span class="onePrint f8">￥{{item. price}}</span>
            <span class="oneOld" v-show="data.isShowOriginalPrice"> <del>￥{{item.originalPrice}}</del> </span>
          </p>
          <p class="lastText">
            <span class="f0" v-show="data.isShowBuyNum">已售{{item.buyNum}} | </span> &nbsp;
            <span  v-show="data.isShowEnableStore" class="surplus f0"> 剩余{{item.enableStore}}</span>
            <span v-show="data.isShowBtn">
              <!--<span class="oneBtn" :style="{'color':data.btnTextColor,'background-color':data.btnBgColor}" v-show="data.picked=='one'">立即抢购</span>-->
              <span class="myCart" :style="{'background-color':data.btnBgColor}" v-show="data.picked=='two'">
                <label :style="{'color':data.btnTextColor}">&#xe60b;</label>
              </span>
            </span>
          </p>
          <p>
             <span v-show="data.isShowBtn">
              <span class="oneBtn" :style="{'color':data.btnTextColor,'background-color':data.btnBgColor}" v-show="data.picked=='one'">立即抢购</span>
              <!--<span class="myCart" :style="{'background-color':data.btnBgColor}" v-show="data.picked=='two'">-->
                <!--<label :style="{'color':data.btnTextColor}">&#xe60b;</label>-->
              <!--</span>-->
            </span>
          </p>
        </div>
      </div>
      <div class="containBottom">

      </div>
    </div>
    <div v-show="data.column=='2'" class="twoLine">
      <div class="leftContain" :style="{'border-color':data.borderColor,'background-color': data.bgColor, 'background-image':'url('+data.bgImage+')'}" :class="{showMargin:index%2=='0'}" v-for="item,index in goodsList">
        <div class="columnSmallImg">
          <img v-show="data.isShowLabel" class="twoLineImg" :src="item.tagLogo" alt="">
          <img :src="item.small" class="bigImg" alt="">
        </div>
        <p class="f3 pPadding">
          {{item.name}}
        </p>
        <p class="limit f0 pPadding" v-show="data.isShowlife">
          有效期：
          <span class="col timeColor">{{item.life}}</span>
          以后
        </p>
        <p class="f0 pPadding">
          <span v-show="data.isShowBuyNum">已售{{item.buyNum}}件|</span>
          <span class="col timeColor" v-show="data.isShowEnableStore">剩余{{item.enableStore}}件</span>
        </p>
        <div class="twoBottom pPadding">
          <div class="twoPrint">
            <p class="col">
              <span class="f0">
               ￥ <span class="f6">{{item. price}}</span>
              </span>
            </p>
            <p class="smallFont f0" v-show="data.isShowOriginalPrice"> <del>{{item.originalPrice}}</del> </p>
          </div>
          <div class="twoBtn" v-show="data.isShowBtn">
            <span :style="{'color':data.btnTextColor,'background-color':data.btnBgColor}"  class="twoLineBtn" v-show="data.picked=='one'">立即抢购</span>
            <span class="myCart" v-show="data.picked=='two'" :style="{'background-color':data.btnBgColor}">
                <label :style="{'color':data.btnTextColor}">&#xe60b;</label>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import {bus} from '../../../assets/js/bus.js'
  import {info, decoration} from '../../../config.js'
  import service from '../../../assets/js/service.js'
  export default {
    data () {
      return {
        goodsList: [],
        goodsDetail:[
          {
            name:'测试奶粉测试奶粉测试奶粉测试奶粉',
            life:'2017-9-25',
             price:'9.9',
            originalPrice:'15.6',
            buyNum:'100',
            enableStore:'200',
            small:'http://store.test.seatent.com/img/decorate/hd-depot/000.jpg',
            tagLogo:'http://store.test.seatent.com/img/decorate/hd-depot/000.jpg'
          }, {
            name:'测试奶粉测试奶粉测试奶粉测试奶粉',
            life:'2017-9-25',
             price:'9.9',
            originalPrice:'15.6',
            buyNum:'100',
            enableStore:'200',
            small:'http://store.test.seatent.com/img/decorate/hd-depot/000.jpg',
            tagLogo:'http://store.test.seatent.com/img/decorate/hd-depot/000.jpg'
          },
        ],

      }
    },
    computed: {
      activityId: function(){
        return this.data.activityId
      }
    },
    watch:{
      activityId:function(activityId){
        this.getData()
      }
    },
    props: ['data', 'element'],
    created(){
      this.getData()
    },
    mounted(){

    },
    methods: {
      getData(){
        var type = "",
          self  = this,
          activityId  = this.data.activityId;
        if(!activityId) {
          this.goodsList = this.goodsDetail;
          return;
        };
        service.linkChoice['getGoodsDetail']({
          "activityId" : this.activityId,
          success : function(resp){
            if(resp.result==1){
              self.goodsList = resp.data.result
            }else {
              alert(resp.mesaage)
            }

          }
        })
      }
    }
  }
</script>

<style scoped>
  @import "../../../assets/font/public.css";
  @font-face {
    font-family: 'iconfont';  /* project id 210654 */
    src: url('//at.alicdn.com/t/font_210654_86thxxbcbwva38fr.eot');
    src: url('//at.alicdn.com/t/font_210654_86thxxbcbwva38fr.eot?#iefix') format('embedded-opentype'),
    url('//at.alicdn.com/t/font_210654_86thxxbcbwva38fr.woff') format('woff'),
    url('//at.alicdn.com/t/font_210654_86thxxbcbwva38fr.ttf') format('truetype'),
    url('//at.alicdn.com/t/font_210654_86thxxbcbwva38fr.svg#iconfont') format('svg');
  }
label{
  font-family: 'iconfont';
  font-size: 22px;
  /*color: white;*/
}
  .lastText{
    height: 26px;
    line-height: 26px;
  }
.myCart{
  display: inline-block;
  width: 26px;
  line-height: 26px;
  height: 26px;
  border-radius: 13px;
  /*background: red;*/
  margin-left: 10px;
  text-align: center;
}
  .doubleTab {
    box-sizing: border-box;
    background-repeat:no-repeat;
    background-size:100% 100%;
    background-position:center center;
  }
  .oneLine{
    box-sizing: border-box;
    padding: 0px 0px 0px 0px;
    margin: 3px 1px;
    /*height: 165px;*/
    background-repeat:no-repeat;
    background-size:100% 100%;
    background-position:center center;
  }
  .bigImg{
    height: 120px;
    width: 90px;
  }
.title{
  text-align: center;
  padding: 15px 0;
  box-sizing: border-box;
  background: white;
}
.pPadding{
  margin: 4px 0px;
}
.twoLineBtn{
  /*color: white;*/
  padding: 1px 10px;
  border-radius: 4px;
}
  .blockTime{
    background: #FF0033;
    box-sizing: border-box;
    padding: 0 5px;
    color: white;
    border-radius: 2px;
  }
  .calendar{
    color: red;
  }
  .limit{
    font-size: 12px;
    color: gray;
  }
.contain{
  display: flex;
  align-items: center;
  box-sizing: border-box;
  padding-top: 25px;
  margin-bottom: 1px;
  border: 1px solid;
  padding-bottom: 20px;
}
  .itemImg{
    flex: 4;
    flex-shrink:0;
    text-align: center;
    padding-left: 15px;
    box-sizing: border-box;
    position: relative;
  }
  .smallImg{
    position: absolute;
    left: 0;
    top: -20px;
    width: 25px;
    height: 25px;
  }
  .columnSmallImg{
    text-align: center;
    position: relative;
    box-sizing: border-box;
    padding-top: 15px;
    padding-left: 10px;
  }
  .twoLineImg{
    position: absolute;
    left: 0;
    top:1px;
    width: 30px;
    height: 30px;

  }
  .ContainDetail{
    flex: 6;
    flex-shrink:0
  }
  .oneLabel{
    font-size: 16px;
    font-weight: 600;
  }
  .onePrint{
    color: red;
    font-weight: 600;
  }
  .oneOld{
    font-size: 12px;
    color: gainsboro;
  }
  .containBottom{
    display: flex;
    justify-content: flex-end;
    font-size: 12px;
  }
  .oneBtn{
    display: inline-block;
    /*color: white;*/
    /*background: #FF0033;*/
    box-sizing: border-box;
    padding: 2px 8px;
    margin-top: 3px;
    border-radius: 3px;
    /*margin-left: 5px;*/
  }
  .surplus{
    color: red;
  }
  .twoLine{
    display: flex;
    margin: 3px 2px;
    flex-wrap:wrap;
  }
  .leftContain{
   width: 49%;
    flex-shrink: 0;
    border: 1px solid ;
    margin-bottom: 5px;
    box-sizing: border-box;
    padding: 3px;
  }
  .twoLine:nth-child(2n){
    margin-right: 5px;
  }
  .showMargin{
    margin-right: 5px;
  }
  .twoBottom{
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-right: 15px;
  }
  .col{
    color: red;
  }
  .smallFont{
    font-size: 12px;
    color: gainsboro;
  }
  .twoPrint{

  }
  .twoBtn{
    box-sizing: border-box;
    padding-left: 7px;

    flex-shrink: 0;
  }
</style>
