<!--
  中间手机框
  李瑞云 2016.12.01
 -->

<template>
    <div class="phone-wrap">
    <!-- {{list}} -->
        <div class="phone-content">
            <draggable :list="list" :options="dragOptions" class="dragArea" @end="dragEnd">
                <div v-for="(element, index) in list" class="preview" @click="edit($event, index, element)">
                    <!--操作区-->
                    <div class="preview-hover" v-show="curIndex === index">
                        <div class="preview-remove" @click="remove(index)">
                            <span class="iconfont icon-cuowu"></span>
                        </div>
                        <template v-if="element.name !== 'categoriesBar'">
                        <div class="preview-move">
                            <span class="iconfont icon-move"></span>
                        </div>
                        <div class="preview-down js-move" v-if="index < list.length - 1" @click="moveDown(index, element)">
                            <span class="iconfont icon-xiafan"></span>
                        </div>
                        <div class="preview-up js-move" v-if="index > 0" @click="moveUp(index, element)">
                            <span class="iconfont icon-shangfan"></span>
                        </div>
                        </template>
                    </div>

                    <component :is="element.name" :data="element.data" :element="element"></component>
                </div>
            </draggable>
        </div>
        <modal v-if="del.index !== ''" :modalOptions="del.modalOptions" @close="closeDelModal" @ok="okDelModal"></modal>
    </div>
</template>

<script>
import $ from 'jquery'
import Vue from 'vue'
import draggable from 'vuedraggable'
import {bus} from '../assets/js/bus.js'
import {componentsPreview} from '../config.js'
import modal from './modules/modal'

var components = Object.assign({},{
    draggable,
    modal
}, componentsPreview);


export default {
    data () {
        return {
            list: bus.list,
            curIndex: null,
            dragOptions: {
                group: {
                    name: 'element',
                    pull: false,
                    put: true
                },
                animation: 300,
                handle: '.preview-move',
                ghostClass: 'placeholder'
            },
            del: {
                index: '',
                modalOptions: {
                    size: 'mini',
                    content: '确定删除吗？'
                }
            }
        }
    },
    watch: {
        list: function(){
            this.curIndex = bus.current.index
        }
    },
    components: components,
    created: function() {
    },
    methods: {
        dragEnd: function(evt){
            var newIndex = evt.newIndex;
            bus.$emit('setCurrentIndex', {index: newIndex});
            this.curIndex = newIndex;

        },
        //点击元素调出右侧编辑框
        edit: function(e, index, element){
            var $tag = $(e.target);
            if(!$tag.hasClass('js-move') && !$tag.parents().hasClass('js-move')){
                this.curIndex = index;
                bus.$emit('setCurrentIndex', {index: index});
            }
        },
        //下移
        moveDown: function(index, element){
            var list = this.list;

            list.splice(index, 1);
            list.splice(index + 1, 0, element);

            this.curIndex = index + 1;
            bus.$emit('setCurrentIndex', {index: index + 1});
        },
        //上移
        moveUp: function(index, element){
            var list = this.list;

            list.splice(index, 1);
            list.splice(index - 1, 0, element);

            this.curIndex = index - 1;
            bus.$emit('setCurrentIndex', {index: index - 1});
        },
        //删除
        remove: function(index){
            this.del.index = index;
        },
        //关闭移除弹窗
        closeDelModal: function(){
            this.del.index = '';
        },
        //确定删除
        okDelModal: function(){
            var list = this.list,
                index = this.del.index;

            list.splice(index, 1);
            this.del.index = '';
            //清空右侧编辑区
            bus.$emit('setCurrentIndex', {index: null});
        }
    }
}

</script>

<style scoped>
.phone-wrap {
    width: 326px;
    height:500px;
    padding-top: 57px;
    position: absolute;
    z-index: 0;
    left: 50%;
    top: 50%;
    margin: -250px 0 0 -270px;
    background: url(../assets/images/phone.svg) no-repeat 0 0;
}
.phone-content{
    width: 320px;
    height: 500px;
    margin: 0 auto;
    background: #f2f2f2;
    overflow-y: auto;
}
.dragArea{
    width: 100%; height: 100%;
}
.preview{
    position: relative;
}
.preview-hover{
    border: 1px solid #60a5e1;
    width: 100%; height: 100%;
    position: absolute;
    top: 0; left: 0;
    z-index: 2;
}
.preview-up,
.preview-down,
.preview-remove{
    border-left: 1px solid #60a5e1;
    border-right: 1px solid #60a5e1;
    border-bottom: 1px solid #60a5e1;
    float: right;
    width: 40px; height: 20px;
    line-height: 18px;
    text-align: center;
    background: #fff;
    margin: 0 -1px 0 5px;
    cursor: pointer;
}
.preview-move{
    border-left: 1px solid #60a5e1;
    border-right: 1px solid #60a5e1;
    border-bottom: 1px solid #60a5e1;
    width: 40px; height: 20px;
    line-height: 18px;
    text-align: center;
    background: #fff;
    cursor: move;
    position: absolute;
    top: 0;
    left: 50%; margin-left: -20px;
}
</style>















