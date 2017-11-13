
<template>
  <div>
    <h2 class="title">满减送</h2>
    <table class="table w100 pl10">
      <tr class="table-row">
        <td class="table-cell valign-m cell-left">商品分布:</td>
        <td colspan="3" class="table-cell valign-m">
          <select v-model="data.column" @change="changeSele(data.column)">
            <option disabled value="">请选择</option>
            <option value="1">1列</option>
            <option value="2">2列</option>
          </select>
        </td>
      </tr>
      <tr>
        <td class="valign-m cell-left">活动:</td>
        <td colspan="2" class="valign-m">
          <input type="text" class="form-control" v-model="data.id">
        </td>
        <td class="valign-m">
          <button class="btn btn-default" @click="openLinkChoice">选择活动</button>
        </td>
      </tr>
      <tr>
        <td class="valign-m cell-left">背景:</td>
        <td>
          <div class="color bg-color" :style="{'background': data.bgColor}">
            <div class="color-mask" @click="changeColor('bgColor')"></div>
            <div class="closeColorPicker" @click="closeColorPicker('bgColor')" v-show="showbgColorPicker">确定</div>
            <color-picker class="color-picker" v-model="bgColorPicker" @input="colorPickeronChange('bgColor', $event)" v-show="showbgColorPicker"></color-picker>
          </div>
        </td>
        <td class="valign-m">
          <input type="text" class="form-control" v-model="data.bgImage">
        </td>
        <td class="valign-m">
          <button class="btn btn-default" @click="popup('bgImage')">背景图片</button>
        </td>

      </tr>
      <tr>
        <td class="valign-m cell-left">价格标签:</td>
        <td>
          <div class="color title-color" :style="{'background': data.printColor}">
            <div class="color-mask" @click="changeColor('printColor')"></div>
            <div class="closeColorPicker" @click="closeColorPicker('printColor')" v-show="showprintColorPicker">确定</div>
            <color-picker class="color-picker" v-model="printColorPicker" @input="colorPickeronChange('printColor', $event)" v-show="showprintColorPicker"></color-picker>
          </div>
        </td>
        <td class="valign-m">
          <input type="text" class="form-control" v-model="data.printLabel">
        </td>
        <td class="valign-m">
          1~4字，可为空
        </td>
      </tr>

      <tr>
        <td class="valign-m cell-left">边框:</td>
        <td>
          <div class="color border-color" :style="{'background': data.borderColor}">
            <div class="color-mask" @click="changeColor('borderColor')"></div>
            <div class="closeColorPicker" @click="closeColorPicker('borderColor')" v-show="showborderColorPicker">确定</div>
            <color-picker class="color-picker" v-model="borderColorPicker" @input="colorPickeronChange('borderColor', $event)" v-show="showborderColorPicker"></color-picker>
          </div>
        </td>
      </tr>
    </table>
    <div class="showBtns">
      <div class="btns">
        <input type="checkbox"  v-model="data.isShowBtn">
        <label>显示按钮</label>
      </div>
      <div class="btns" v-show="data.isShowBtn">
        <input type="radio" id="one" value="one" v-model="data.picked">
        <label for="one">购买按钮</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" id="two" value="two" v-model="data.picked">
        <label for="two">购物车</label>
        <div>
          <table>
          <tr>
            <td class="valign-m cell-left">背景:</td>
            <td>
              <div class="color border-color" :style="{'background': data.btnBgColor}">
                <div class="color-mask" @click="changeColor('btnBgColor')"></div>
                <div class="closeColorPicker" @click="closeColorPicker('btnBgColor')" v-show="showbtnBgColorPicker">确定</div>
                <color-picker class="color-picker" v-model="btnBgColorPicker" @input="colorPickeronChange('btnBgColor', $event)" v-show="showbtnBgColorPicker"></color-picker>
              </div>
            </td>
          </tr>
            <tr>
            <td class="valign-m cell-left">颜色:</td>
            <td>
              <div class="color border-color" :style="{'background': data.btnTextColor}">
                <div class="color-mask" @click="changeColor('btnTextColor')"></div>
                <div class="closeColorPicker" @click="closeColorPicker('btnTextColor')" v-show="showbtnTextColorPicker">确定</div>
                <color-picker class="color-picker" v-model="btnTextColorPicker" @input="colorPickeronChange('btnTextColor', $event)" v-show="showbtnTextColorPicker"></color-picker>
              </div>
            </td>
          </tr>
          </table>
        </div>
      </div>
      <div class="btns">
        <input type="checkbox"  v-model="data.isShowOriginalPrice">
        <label>显示原价</label>
      </div>
      <div class="btns">
        <input type="checkbox"  v-model="data.isShowlife">
        <label>显示有效期</label>
      </div>

      <div class="btns">
        <input type="checkbox"  v-model="data.isShowActive">
        <label>显示满减送活动信息</label>
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

        imageChoice: {
          showModal: false,
          curTab: 'upload', //当前选项卡
          selected: that.data.bgImage
        },
        linkChoice: {
          showModal: false,
          curTab: 'fullSubtract',
          tabs: [
            {
              name: 'fullSubtract',
              text: '满减送'
            }
          ],
          selected: '#/groups/show/' + that.data.id,//当前选择项
        },
        showbgColorPicker: false,
        bgColorPicker: {
          hex: that.data.bgColor
        },
        showprintColorPicker: false,
        printColorPicker: {
          hex: that.data.printColor
        },
        showborderColorPicker: false,
        borderColorPicker: {
          hex: that.data.borderColor
        },
        showbtnBgColorPicker: false,
        btnBgColorPicker: {
          hex: that.data.btnBgColor
        },
        showbtnTextColorPicker: false,
        btnTextColorPicker: {
          hex: that.data.btnTextColor
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
      'data.activityId': {
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
    methods: {
      //换取弹窗
      popup(name){
        this.name = name;
        this.imageChoice.showModal = true
      },
      //关闭图片选择弹窗
      closeImageChoicePop: function(){
        this.imageChoice.showModal = false;
      },
      //选择图片成功回调
      imageChoiceSuccess: function(opts){
        this.imageChoice.showModal = false;
        this.data[this.name] = opts.src;
        this.imageChoice.selected = opts.src;
      },
      //打开链接选择弹窗
      openLinkChoice: function(){
        this.linkChoice.showModal = true;
      },
      //关闭链接选择弹窗
      closeLinkChoicePop: function(){
        this.linkChoice.showModal = false;
      },
      //选择链接成功回调
      linkChoiceSuccess: function(opts){
        var self = this;
        this.linkChoice.showModal = false;
        this.data.activityId = opts.tag_id;
        this.element.linkName = opts.name;
        this.linkChoice.selected = opts.link;//设置当前选择项
      },
      changeColor: function(type){
        var isShow = this['show' + type + 'Picker'];
        isShow ? (this['show' + type + 'Picker'] = false) : (this['show' + type + 'Picker'] = true)
      },
      //关闭调色板
      closeColorPicker: function(type){
        this['show' + type + 'Picker'] = false
      },
      //选择颜色
      colorPickeronChange: function(type, val){
        this.data[type] = val.hex
      },
      changeSele:function (  ) {

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
    column-height:100%;
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
    column-height: 30px;
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
