
<template>
  <div class="doubleTab" >
    <div v-show="data.column=='1'" class="oneLine" :style="{'background-color': data.bgColor, 'background-image':'url('+data.bgImage+')'}">
      <div class="contain" v-for="item in goodsList" :style="{'border-color':data.borderColor}">
        <div class="itemImg">
          <img class="oneImg" :src="item.small" alt="">
        </div>
        <div class="ContainDetail">
          <p class="f3 pMargin">{{item.name}}</p>
          <p class="limit f0 pMargin" v-show="data.isShowlife">
            有效期 ：<span class="calendar">{{item.life}}</span> 以后
          </p>
          <p class="pMargin">
            <span  class="f0" :style="{'color':data.printColor}">{{data.printLabel}}</span>
            <span class="f0 printCol">￥</span>
            <span class="onePrint f8">{{item. price}}</span>
            <span class="oneOld" v-show="data.isShowOriginalPrice"> <del>￥{{item.originalPrice}}</del> </span>
          </p>
          <p class="pMargin" v-show="data.isShowBtn">
            <span v-show="data.picked=='one'" class="oneBtn btnColor" :style="{'background-color': data.btnBgColor,'color':data.btnTextColor}">立即抢购</span>
            <span class="cart" v-show="data.picked=='two'" :style="{'background-color':data.btnBgColor}">
              <label :style="{'color':data.btnTextColor}">&#xe60b;</label>
            </span>
          </p>
        </div>
      </div>
    </div>
    <div v-show="data.column=='2'" class="twoLine">
      <div class="leftContain" :style="{'border-color':data.borderColor,'background-color': data.bgColor, 'background-image':'url('+data.bgImage+')'}" :class="{showMargin:index%2=='0'}" v-for="item,index in goodsList">
        <div class="columnSmallImg">
          <img class="twoImg" :src="item.small" alt="">
        </div>
        <p class="pMargin f3">
          {{item.name}}
        </p>
        <p class="limit pMargin f0" v-show="data.isShowlife">
          有效期：
          <span class="col timeColor">{{item.life}}</span>
          以后
        </p>
        <div class="twoBottom pMargin">
          <div class="twoPrint">
            <p class="col f0">
              ￥ <span class="f7"> {{item. price}}</span>
              <span class="smallFont f0" v-show="data.isShowOriginalPrice">
                <del>￥{{item.originalPrice}}</del>
              </span>
              <span class="cart myCart" v-show="data.picked=='two'" :style="{'background-color':data.btnBgColor}">
                <label :style="{'color':data.btnTextColor}">&#xe60b;</label>
              </span>
            </p>
          </div>
        </div>
        <div v-show="data.isShowBtn" class="pMargin">
          <span v-show="data.picked=='one'"  class="oneBtn" :style="{'background-color': data.btnBgColor,'color':data.btnTextColor}">立即抢购</span>

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
            small:'http://store.test.seatent.com/img/decorate/hd-depot/000.jpg'
          }, {
            name:'测试奶粉测试奶粉测试奶粉测试奶粉',
            life:'2017-9-25',
             price:'9.9',
            originalPrice:'15.6',
            buyNum:'100',
            enableStore:'200',
            small:'http://store.test.seatent.com/img/decorate/hd-depot/000.jpg'
          },
        ],
      }
    },
    computed: {
      groupId: function(){
        return this.data.groupId
      }
    },
    watch:{
      groupId:function(groupId){
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
          groupId  = this.data.groupId;
        if(!groupId) {
          this.goodsList = this.goodsDetail;
          return;
        }
        service.linkChoice['getGoodsGroupDetail']({
          "groupId" : this.groupId,
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
  .myCart{
    margin-left: 15px;
  }
  .doubleTab {
    padding:0 1px;
    box-sizing: border-box;
    background-repeat:no-repeat;
    background-size:100% 100%;
    background-position:center center;
  }
  .oneLine{
    box-sizing: border-box;
    padding: 1px 0;
  }
  .myTitle{
    text-align: center;
    color: red;
    box-sizing: border-box;
    padding: 5px 3px;
  }
  .pMargin{
    margin: 4px 0px;
  }
  .myActive{
    display: inline-block;
    border: 1px solid red;
    padding: 0 3px;
  }
  .calendar{
    color: red;
  }
  .oneImg{
    display: inline-block;
    width: 90px;
    height: 120px;
  }
  .limit{
    font-size: 12px;
    color: gray;
  }
  .contain{
    display: flex;
    align-items: center;
    box-sizing: border-box;
    padding-top: 5px;
    margin-bottom: 1px;
    border: 1px solid;
    padding-bottom: 20px;
  }
  .itemImg{
    flex: 4;
    flex-shrink:0;
    text-align: center;
  }

  .columnSmallImg{
    text-align: center;
    box-sizing: border-box;
    padding-top: 5px;
  }
  .twoImg{
    display: inline-block;
    width: 90px;
    height: 120px;
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

  .oneBtn{
    display: inline-block;
    /*color: white;*/
    /*background: red;*/
    box-sizing: border-box;
    padding: 2px 10px;
    border-radius: 3px;
  }

  .twoLine{
    display: flex;
    margin: 3px 0;
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
    /*margin-right: 5px;*/
  }

  .twoBottom{
    display: flex;
    align-items: center;
    justify-content: space-between;
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
  .cart{
    display: inline-block;
    height: 26px;
    width: 26px;
    line-height: 26px;
    text-align: center;
    border-radius: 13px;
    /*float: right;*/
    /*margin-right: 10px;*/
  }
  .cart img{
    display: inline-block;
  }
  .showMargin{
    margin-right: 5px;
  }
</style>
