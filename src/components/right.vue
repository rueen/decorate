<!-- 
  右侧编辑栏
  李瑞云 2016.12.01
 -->

<template>
    <div class="right-wrap">
    <!-- {{current}} -->
        <div class="content">
            <component v-if="current.edit" :is="current.edit.name" :data="current.edit.data" :element="current.edit"></component>
        </div>
    </div>
</template>

<script>
import {bus} from '../assets/js/bus.js'
import {componentsEdit} from '../config.js'

var components = Object.assign({},{}, componentsEdit);

export default {
    data () {
        return {
            current: bus.current
        }
    },
    components: components,
    created: function() {
    },
    methods: {}
}
</script>

<style scoped>
.right-wrap {
    float: right;
    right: 0;
    top: 0;
    width: 460px;
    height: 100%;
    overflow-y: auto;
    background: #e9e9e9;
}
.content{
    padding: 20px 10px;
}
</style>