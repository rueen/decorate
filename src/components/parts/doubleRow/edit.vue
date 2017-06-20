<!-- 
  商品列表——编辑
  李瑞云 2016.12.01
 -->

 <template>
    <div>
        <h2 class="title">双列</h2>
        <table class="table w100 pl10">
            <tr>
                <td class="valign-m cell-left">类型:</td>
                <td colspan="3" class="valign-m ">
                    <div class="radioCont">
                        <input type="radio"  value="0" v-model="data.type" id="tab"><label for="tab">标签</label>
                        <input type="radio"  value="1" v-model="data.type" id="advertising"><label for="advertising">广告位</label>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="valign-m cell-left">ID:</td>
                <td colspan="2" class="valign-m">
                    <input type="text" class="form-control" v-model="data.goodId">
                </td>
                <td class="valign-m">
                    <button class="btn btn-default" >获取数据</button>
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
                <td class="valign-m cell-left">标题:</td>
                <td>
                    <div class="color title-color" :style="{'background': data.titleColor}">
                        <div class="color-mask" @click="changeColor('titleColor')"></div>
                        <div class="closeColorPicker" @click="closeColorPicker('titleColor')" v-show="showtitleColorPicker">确定</div>
                        <color-picker class="color-picker" v-model="titleColorPicker" @input="colorPickeronChange('titleColor', $event)" v-show="showtitleColorPicker"></color-picker>
                    </div>
                </td>
                <td class="valign-m">
                    <input type="text" class="form-control" v-model="data.title">
                </td>
                <td class="valign-m">
                    <button class="btn btn-default" @click="popup('titleBj')">标题图片</button>
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
                
                <td class="valign-m">
                    <input type="text" class="form-control" v-model="data.borderImg">
                </td>
                <td class="valign-m">
                    <button class="btn btn-default" @click="popup('borderImg')">边框图片</button>
                </td>
            </tr>
            <tr>
                <td class="valign-m cell-left">价格颜色:</td>
                <td colspan="2" class="valign-m">
                    <div class="color price-color" :style="{'background': data.priceColor}">
                        <div class="color-mask" @click="changeColor('priceColor')"></div>
                        <div class="closeColorPicker" @click="closeColorPicker('priceColor')" v-show="showpriceColorPicker">确定</div>
                        <color-picker class="color-picker" v-model="priceColorPicker" @input="colorPickeronChange('priceColor', $event)" v-show="showpriceColorPicker"></color-picker>
                    </div>
                </td>
            </tr>
        </table>
        <image-choice v-if="imageChoice.showModal" :modalOptions="imageChoice" @close="closeImageChoicePop" @ok="imageChoiceSuccess"></image-choice> 
        <link-choice v-if="linkChoice.showModal" :modalOptions="linkChoice" @close="closeLinkChoicePop" @ok="linkChoiceSuccess"></link-choice>
    </div>
</template>

<script>
import Vue from 'vue'
import imageChoice from '../../modules/imageChoice'
import linkChoice from '../../modules/linkChoice'
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
                curTab: 'group',
                tabs: [{
                    name: 'group',
                    text: '分组列表'
                }],
                selected: '#/groups/show/' + that.data.id,//当前选择项
            },
            showbgColorPicker: false,
            bgColorPicker: {
                hex: that.data.bgColor
            },
            showtitleColorPicker: false,
            titleColorPicker: {
                hex: that.data.titleColor
            },
            showpriceColorPicker: false,
            priceColorPicker: {
                hex: that.data.priceColor
            },
            showborderColorPicker: false,
            borderColorPicker: {
                hex: that.data.borderColor
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
        },
        'data.type':{
            handler: function(val){
                this.data.type = val;
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
            console.log(this.name)
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
            this.linkChoice.showModal = false;
            this.data.id = opts.id;
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

        getList: function(){
            
        }
    }
}
</script>

<style scoped>
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
    position: relative;
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
    z-index: 2;
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
    z-index: 1;
}
.tips{
    color: #999;
    font-size: 12px;
}
</style>