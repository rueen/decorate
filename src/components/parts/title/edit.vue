
<template>
  <div>
    <h2 class="title">标题</h2>
    <table class="table w100 pl10">
      <tr>
        <td class="valign-m cell-left">标题:</td>
        <td colspan="2" class="valign-m">
          <input type="text" class="form-control" v-model="data.titleName">
        </td>
      </tr>

      <!--<tr class="table-row">-->
        <!--<td class="table-cell valign-m cell-left">样式:</td>-->
        <!--<td colspan="3" class="table-cell valign-m">-->
          <!--<select v-model="data.style" @change="changeSele(selected)">-->
            <!--<option disabled value="">请选择</option>-->
            <!--<option value="1">样式一</option>-->
            <!--<option value="2">样式二</option>-->
            <!--<option value="3">样式三</option>-->
          <!--</select>-->
        <!--</td>-->
      <!--</tr>-->

      <!--<tr v-show="data.style=='1'">-->
        <!--<button class="btn btn-default">好看的</button>-->
      <!--</tr>-->
      <!--<tr v-show="data.style=='2'">-->
        <!--<button class="btn btn-default">漂亮的</button>-->
      <!--</tr>-->
      <tr>

        <td class="valign-m cell-left">背景:</td>
        <td>
          <div class="color bg-color" :style="{'background': data.bgColor}">
            <div class="color-mask" @click="changeColor('bgColor')"></div>
            <div class="closeColorPicker" @click="closeColorPicker('bgColor')" v-show="showbgColorPicker">确定</div>
            <color-picker class="color-picker" v-model="bgColorPicker" @input="colorPickeronChange('bgColor', $event)" v-show="showbgColorPicker"></color-picker>
          </div>
        </td>
      </tr>
      <tr>
        <td class="valign-m cell-left">字体:</td>
        <td>
          <div class="color border-color" :style="{'background': data.fontColor}">
            <div class="color-mask" @click="changeColor('fontColor')"></div>
            <div class="closeColorPicker" @click="closeColorPicker('fontColor')" v-show="showfontColorPicker">确定</div>
            <color-picker class="color-picker" v-model="fontColorPicker" @input="colorPickeronChange('fontColor', $event)" v-show="showfontColorPicker"></color-picker>
          </div>
        </td>
      </tr>
      <tr>
        <td class="valign-m cell-left">背景图片:</td>

        <td class="valign-m">
          <input type="text" class="form-control" v-model="data.bgImage">
        </td>
        <td class="valign-m">
          <button class="btn btn-default" @click="popup('bgImage')">背景图片</button>
        </td>

      </tr>
    </table>
    <image-choice v-if="imageChoice.showModal" :modalOptions="imageChoice" @close="closeImageChoicePop" @ok="imageChoiceSuccess"></image-choice>
    <!--<link-choice v-if="linkChoice.showModal" :modalOptions="linkChoice" @close="closeLinkChoicePop" @ok="linkChoiceSuccess"></link-choice>-->
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
        imageChoice: {
          showModal: false,
          curTab: 'upload', //当前选项卡
          selected: that.data.bgImage
        },

        showbgColorPicker: false,
        bgColorPicker: {
          hex: that.data.bgColor
        },
        showfontColorPicker: false,
        fontColorPicker: {
          hex: that.data.fontColor
        }
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
    methods: {
      //换取弹窗
      popup(name){
        this.name = name
        this.imageChoice.showModal = true
      },
      //关闭图片选择弹窗
      closeImageChoicePop: function(){
        this.imageChoice.showModal = false;
      },
      //选择图片成功回调
      imageChoiceSuccess: function(opts){
        this.imageChoice.showModal = false;
        this.data[this.name] = opts.src
        this.imageChoice.selected = opts.src;
      },

      changeColor: function(type){
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
      colorPickeronChange: function(type, val){
        console.log(type, val);
        this.data[type] = val.hex
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
