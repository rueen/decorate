<!-- 
  左边组件标签栏
  李瑞云 2016.12.01
 -->

<template>
    <div class="left-wrap">
        <div class="content">
            <div class="category" v-for="element in tags">
                <h3 class="category-tit">{{element.category}}</h3>
                <div class="tags-list clearfix">
                    <div class="tag-box" :class="{'fl': (index % 2 == 0), 'fr': (index % 2 == 1)}" v-for="(item, index) in element.list" :type="item.type" :max="item.max" @click="click(item.type, item.max)">
                        <draggable :options="dragOptions" class="dragArea" @end="dragEnd">
                            <span class="btn-blue tag js-tag" :type="item.type" :max="item.max">{{item.name}}</span>
                        </draggable>
                        <div class="tipsPop" v-if="!!item.tips">
                            <span class="iconfont icon-arrow"></span>
                            {{item.tips}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <tips :tipsOptions="tipsOptions" v-if="showTips" @timeout="showTips = false"></tips>
    </div>
</template>

<script>
import $ from 'jquery'
import Vue from 'vue'
import draggable from 'vuedraggable'
import {tags, defaultElement, bus} from '../assets/js/bus.js'
import tips from './modules/tips'

module.exports = {
    data () {
        return {
            tags: tags,
            list: bus.list,
            showTips: false,
            tipsOptions: {
                text: '该组件使用次数已达上限'
            },
            dragOptions: {
                sort: false,
                group: {
                    name: 'element',
                    pull: 'clone',
                    put: false
                },
                animation: 150,
                forceFallback: true,
                ghostClass: 'left-placeholder',
                forceFallback: true,
                fallbackClass: 'sortable-fallback',
                fallbackTolerance: 5
            }
        }
    },
    created: function(){

    },
    components: { tips, draggable },
    computed: {
        
    },
    methods: {
        //拖拽创建元素
        dragEnd: function(evt){
            var $item = $(evt.item),
                type = $item.attr('type'),
                max = $item.attr('max'),
                index = evt.newIndex;

            if($('.phone-wrap').find('.js-tag')[0]){
                this.creatElement(type, max, index);
                $('.phone-wrap').find('.js-tag').remove();
            }
        },
        //点击创建元素
        click: function(type, max){
            this.creatElement(type, max)
        },
        //创建元素
        creatElement: function(type, max, index){
            var that = this,
                newData = $.extend(true, {}, defaultElement[type]),
                curIndex = this.list.length,
                _length = 0;

            Vue.set(bus.current, 'edit', newData)
            Vue.set(bus.current, 'index', curIndex)

            $.each(this.list, function(index, json){
                if(json.name == type){
                    _length += 1;
                }
            })

            if(!!max && _length >= max){
                that.showTips = true
            } else {
                if(!!index || index == 0){
                    //拖拽插入默认数据
                    that.list.splice(index, 0, newData)
                } else {
                    //新建默认数据
                    that.list.push(newData)
                }
            }
        }
    }
}
</script>

<style scoped>
.left-wrap {
    float: left;
    left: 0;
    top: 0;
    width: 240px;
    height: 100%;
    background: #e9e9e9;
}

.content{
    padding: 15px 5px;
}
.category{
    margin-bottom: 10px;
    border-radius: 3px;
    box-shadow: 0 0 5px 0 #ddd;
}
.category-tit{
    background: #f5f5f5;
    border-bottom: 1px solid #ddd;
    height: 40px;
    line-height: 40px;
    padding: 0 15px;
}
.tags-list{
    padding: 5px 15px;
    background: #fff;
}
.tag-box{
    display: inline-block;
    padding: 5px 0;
    position: relative;
}
.tag {
    display: block;
    width: 93px;
    height: 36px;
    line-height: 36px;
    text-align: center;
    cursor: pointer;
    border-radius: 3px;
    border: none;
}
.tipsPop{
    position: absolute;
    top: -50px; right: -220px;
    width: 200px;
    border-radius: 3px;
    box-shadow: 1px 1px 1px rgba(134,99,8,.4);
    background: rgba(255,235,169,.8);
    padding: 15px;
    opacity: 0;
    transition: all .3s;
    z-index: 2;
    color: #866308;
}
.dragArea:hover + .tipsPop{
    opacity: 1;
    top: 0;
}
.fl .tipsPop{
    right: -327px;
}
.tipsPop .icon-arrow{
    position: absolute;
    left: -12px; top: 10px;
    color: #ffeba9;
    font-size: 20px;
}

.phone-wrap .left-placeholder{
    width: 320px;
    height: 50px;
    position: relative;
}
.phone-wrap .left-placeholder:after{
    content: '放到这里';
    position: absolute;
    width: 100%; height: 100%;
    background: #ffe5ce;
    color: #f76943;
    top: 0; left: 0;
    text-align: center;
    line-height: 48px;
    border: 1px dashed #f76843;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
</style>