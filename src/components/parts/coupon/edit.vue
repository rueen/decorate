
<template>
  <div>
    <h2 class="title">满减送</h2>
    <table class="table w100 pl10">
      <tr class="table-row">
        <td class="table-cell valign-m cell-left">商品分布:</td>
        <td colspan="3" class="table-cell valign-m">
          <select v-model="data.line" @change="changeLine">
            <option disabled value="">请选择</option>
            <option value="1">1列</option>
            <option value="2">2列</option>
            <option value="3">3列</option>
          </select>
        </td>
      </tr>
    </table>
    <table class="table w100 pl10" v-for="item,index in data.list">
      <tr>
        <td class="valign-m cell-left">优惠券:</td>
        <td colspan="2" class="valign-m">
          <input type="text" class="form-control" v-model="item.id">
        </td>
        <td class="valign-m">
          <button class="btn btn-default" @click="openLinkChoice(index,item)">选择优惠券</button>
        </td>
      </tr>
      <tr>
        <td class="valign-m cell-left">背景:</td>
        <td>
          <div class="color bg-color" :style="{'background': item.bgColor}">
            <div class="color-mask" @click="changeColor('bgColor',index)"></div>
            <div class="closeColorPicker" @click="closeColorPicker('bgColor',index)" v-show="showbgColorPicker">确定</div>
            <color-picker class="color-picker" v-model="bgColorPicker" @input="colorPickeronChange('bgColor', $event,index)" v-show="showbgColorPicker&&num==index"></color-picker>
          </div>
        </td>
        <td class="valign-m">
          <input type="text" class="form-control" v-model="item.bgImage">
        </td>
        <td class="valign-m">
          <button class="btn btn-default" @click="popup(index,'bgImage')">背景图片</button>
        </td>
      </tr>
      <tr>
        <td class="valign-m cell-left">边框:</td>
        <td>
          <div class="color border-color" :style="{'background': item.borderColor}">
            <div class="color-mask" @click="changeColor('borderColor',index)"></div>
            <div class="closeColorPicker" @click="closeColorPicker('borderColor',index)" v-show="showborderColorPicker">确定</div>
            <color-picker class="color-picker" v-model="borderColorPicker" @input="colorPickeronChange('borderColor', $event,index)" v-show="showborderColorPicker&&num==index"></color-picker>
          </div>
        </td>
      </tr>
      <tr>
        <td class="valign-m cell-left">优惠金额:</td>
        <td>
          <div class="color border-color" :style="{'background': item.printColor}">
            <div class="color-mask" @click="changeColor('printColor',index)"></div>
            <div class="closeColorPicker" @click="closeColorPicker('printColor',index)" v-show="showprintColorPicker">确定</div>
            <color-picker class="color-picker" v-model="printColorPicker" @input="colorPickeronChange('printColor', $event,index)" v-show="showprintColorPicker&&num==index"></color-picker>
          </div>
        </td>
      </tr>
      <tr>
        <td class="valign-m cell-left">活动信息:</td>
        <td>
          <div class="color border-color" :style="{'background': item.textColor}">
            <div class="color-mask" @click="changeColor('textColor',index)"></div>
            <div class="closeColorPicker" @click="closeColorPicker('textColor',index)" v-show="showtextColorPicker">确定</div>
            <color-picker class="color-picker" v-model="textColorPicker" @input="colorPickeronChange('textColor', $event,index)" v-show="showtextColorPicker&&num==index"></color-picker>
          </div>
        </td>
      </tr>
    </table>
    <div class="showBtns">
      <div class="btns">
        <input type="checkbox"  v-model="data.isShowGet">
        <label>显示立即领取</label>
      </div>
    </div>
    <image-choice v-if="imageChoice.showModal" :modalOptions="imageChoice" @close="closeImageChoicePop" @ok="imageChoiceSuccess"></image-choice>
    <link-choice v-if="linkChoice.showModal" :modalOptions="linkChoice" @close="closeLinkChoicePop" @ok="linkChoiceSuccess"></link-choice>
  </div>
</template>

<script>
  import Vue from 'vue'
  import imageChoice from '../../modules/imageChoice'
  import linkChoice from '../../modules/linkChoice'
  import service from '../../../assets/js/service.js'
  import { Chrome } from 'vue-color'

  export default {
    data () {
      var that = this;
      return {
        name:"",
        num:'',
        curIndex:0,
        imageChoice: {
          showModal: false,
          curTab: 'upload', //当前选项卡
          selected: that.data.bgImage
        },
        linkChoice: {
          showModal: false,
          curTab: 'coupon',
          tabs: [
            {
              name: 'coupon',
              text: '优惠券'
            }
          ],
          selected: '#/groups/show/' + that.data.id,//当前选择项
        },
        showbgColorPicker: false,
        bgColorPicker: {
          hex: that.data.list[0].bgColor
        },
        showprintColorPicker: false,
        printColorPicker: {
          hex: that.data.list[0].printColor
        },
        showborderColorPicker: false,
        borderColorPicker: {
          hex: that.data.list[0].borderColor
        },
        showtextColorPicker: false,
        textColorPicker: {
          hex: that.data.list[0].textColor
        },
      }
    },
    props: ['data', 'element'],
    created: function(){

    },
    components: {
      imageChoice,
      linkChoice,
      'color-picker': Chrome
    },
    watch: {
      'data.id': {
        handler: function(val){
          this.linkChoice.selected = '#/groups/show/' + val;
        },
        deep: true
      },
      'data.bgImage': {
        handler: function(val){
          this.imageChoice.selected = val;
        },
        deep: true
      }
    },
    mounted:function (  ) {

    },
    methods: {
      //改变列数
      changeLine:function ( ) {
        console.log(this.data.column);
        if(this.data.line==1){
          this.data.list = [
            {
              id:'测试id',
              bgColor:'#ffffff',
              bgImage:'',
              borderColor:'#dddddd',
              printColor:'red',
              textColor:"#9f9f9f"
            }
          ]
        }else if(this.data.line==2){
          this.data.list = [
            {
              id:'测试id',
              bgColor:'#ffffff',
              bgImage:'',
              borderColor:'#dddddd',
              printColor:'red',
              textColor:"#9f9f9f"
            },   {
              id:'测试id',
              bgColor:'#ffffff',
              bgImage:'',
              borderColor:'#dddddd',
              printColor:'red',
              textColor:"#9f9f9f"
            }
          ]
        }else if(this.data.line==3){
          this.data.list = [
            {
              id:'测试id',
              bgColor:'#ffffff',
              bgImage:'',
              borderColor:'#dddddd',
              printColor:'red',
              textColor:"#9f9f9f"
            },   {
              id:'测试id',
              bgColor:'#ffffff',
              bgImage:'',
              borderColor:'#dddddd',
              printColor:'red',
              textColor:"#9f9f9f"
            },  {
              id:'测试id',
              bgColor:'#ffffff',
              bgImage:'',
              borderColor:'#dddddd',
              printColor:'red',
              textColor:"#9f9f9f"
            }
          ]
        }
      },
      //换取弹窗
      popup(index,name){
        this.name = name;
        this.imageChoice.showModal = true;
        this.curIndex = index;
      },
      //关闭图片选择弹窗
      closeImageChoicePop: function(){
        this.imageChoice.showModal = false;
      },
      //选择图片成功回调
      imageChoiceSuccess: function(opts){
        this.imageChoice.showModal = false;
        console.log(opts.src,this.curIndex);
        this.data.list[this.curIndex].bgImage = opts.src
        this.imageChoice.selected = opts.src;
      },
      //打开链接选择弹窗
      openLinkChoice: function(index){
        this.linkChoice.showModal = true;
        this.curIndex = index;//给当前索引赋值
      },
      //关闭链接选择弹窗
      closeLinkChoicePop: function(){
        this.linkChoice.showModal = false;
      },
      //选择链接成功回调
      linkChoiceSuccess: function(opts){
        var self = this;
        console.log(opts,6666)
        this.linkChoice.showModal = false;

        this.data.id = opts.goods_id;
        this.element.linkName = opts.name;
        this.linkChoice.selected = opts.link;//设置当前选择项
      },
      changeColor: function(type,index){
        this.num = index;
        console.log(this.num);
        var isShow = this['show' + type + 'Picker'];
        console.log(type);
        console.log(this['show' + type + 'Picker']);
        isShow ? (this['show' + type + 'Picker'] = false) : (this['show' + type + 'Picker'] = true)
      },
      //关闭调色板
      closeColorPicker: function(type){
        this['show' + type + 'Picker'] = false
      },
      //选择颜色
      colorPickeronChange: function(type, val,index){
        console.log(type, val);
        console.log(this.curIndex);
        this.curIndex = index
        this.data.list[this.curIndex][type] = val.hex
      }
    }
  }
</script>

<style scoped>
  .showBtns{
    padding-left: 10px;
    box-sizing: border-box;
  }
  .btns{
    box-sizing: border-box;
    padding: 5px 0;
  }
  .radioCont {
    line-height:100%;
    display:flex;
  }
  .radioCont input {
    margin-right:6px;
  }
  .radioCont label {
    margin-right:20px
  }
  td{
    padding: 5px;
  }
  .cell-left{
    width: 60px;
  }
  .color{
    width: 28px; height: 28px;
    border-radius: 2px;
    position:relative;
  }
  .color-mask{
    width: 100%; height: 100%;
    position: absolute;
    z-index: 1;
  }
  .closeColorPicker{
    width: 40px; height: 30px;
    background: #fb3c40;
    color: #fff;
    text-align: center;
    border-radius: 2px;
    font-size: 12px;
    line-height: 30px;
    position: absolute;
    bottom: -230px; right: -195px;
    z-index: 95;
    cursor: pointer;
  }
  .closeColorPicker:hover{
    background: #f33136;
  }
  .bg-color{
    z-index: 3;
  }
  .title-color{
    z-index: 2;
  }
  .price-color{
    z-index: 1;
  }
  .border-color{
    z-index: 0;
  }
  .color-picker{
    position: absolute;
    top: 30px; left: 0;
    z-index:90;
  }
  .tips{
    color: #999;
    font-size: 12px;
  }
</style>
