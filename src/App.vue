<template>
    <div class="layout table" id="app">
        <div class="table-row">
            <div class="table-cell lauout-header">
                <header-component></header-component>
            </div>
        </div>
        <div class="table-row">
            <div class="table-cell lauout-content">
                <left></left>
                <right></right>
                <phone></phone>
                <loading v-if="loading.isShow"></loading>
            </div>
        </div>
    </div>
</template>

<script>
import {bus} from './assets/js/bus.js'
import header from './components/header'
import left from './components/left'
import right from './components/right'
import phone from './components/phone'
import loading from './components/modules/loading'
import './assets/font/iconfont.css'

export default {
    name: 'app',
    data () {
        return {
            loading: bus.loading
        }
    },
    components: {
        'header-component': header, left, right, phone, loading
    }
}

</script>

<style>

body,
div,
p,
ul,
li,
a,
img,
h1,
h2,
h3,
h4,
h5,
h6,
ul,
li,
input,
button,
span{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}

h1,
h2,
h3,
h4,
h5,
h6 {
    font-size: 14px;
    font-weight: normal;
}

button {
    outline: none;
}

body,
html {
    display: block;
    height: 100%;
}

body {
    color: #444;
    -webkit-font-smoothing: antialiased;
    font: 14px/1.5 Microsoft YaHei,tahoma,arial,Hiragino Sans GB,\\5b8b\4f53,sans-serif;
}
ul, li{
    list-style: none;
}
img{
    vertical-align: middle;
}
a{
    color: #333;
    text-decoration: none;
}
.clearfix:before,
.clearfix:after{
    content: " ";
    display:block;
    height: 0;
    line-height: 0;
    clear: both;
}

.fl {
    float: left
}

.fr {
    float: right
}
.w100{
    width: 100%;
}
.h100{
    height: 100%;
}
.pl10{
    padding-left: 10px;
}
.mr10{
    margin-right: 10px;
}
.valign-m{
    vertical-align: middle;
}
.text-center{
    text-align: center;
}
.layout {
    width: 100%;
    height: 100%;
    min-height: 570px;
    overflow-y: auto;
    position: relative;
    background: url(http://store.seatent.com/assets/img/decorate/bg.png);
    z-index: 1;
}
.lauout-header{
    height: 48px;
}
.lauout-content{
    position: relative;
}
h2.title{
    font-size: 18px;
    padding: 0 0 10px 10px;
    color: #333;
}
.table{
    display: table;
}
.table-row{
    display: table-row;
}
.table-cell{
    display: table-cell;
}
.form-control{
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ddd;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    outline: 0;
}
.form-control:focus{
    border-color:#66afe9;
    -webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #66afe9;
    box-shadow:inset 0 1px 1px rgba(0,0,0,.075),0 0 6px #66afe9
}
.btn{
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 3px;
}
.btn-small{
    padding: 5px 10px;
}
.btn-default {
    color: #333;
    background-color: #fff;
    border: 1px solid #ddd;
}
.btn-red{
    background: #EF3F3F;
    color: #fff;
}
.btn-red:hover{
    background: #e73535;
}
.btn-blue {
    color: #fff;
    background-color: #428BCB;
    border: 1px solid #428BCB;
}
.btn-blue:hover{
    background: #3882c2;
}
.btn-orange{
    background: #ef3f3f;
}
.btn-orange:hover{
    background: #e73737;
}
.clamp1{
    display: block;
    overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
}
.clamp2{
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    word-break: break-all;
}
.right-wrap .table-cell{
    padding: 5px;
}
.right-wrap .cell-left{
    width: 70px;
    padding-left: 0;
    padding-right: 0;
}
.right-wrap .tit-h3{
    padding: 0 0 5px 0;
}
.right-wrap .item{
    border: 1px dashed transparent;
    padding: 10px;
    position: relative;
}
.right-wrap .item:hover{
    border: 1px dashed #ccc;
}
.right-wrap .delete-btn{
    width: 34px;
    height: 22px;
    line-height: 22px;
    text-align: center;
    border-left: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    background: #fff;
    position: absolute;
    right: 0;
    top: 0;
    font-size: 12px;
    display: none;
    cursor: pointer;
}
.right-wrap .item:hover .delete-btn{
    display: block;
}
.right-wrap .btn-add{
    width: 150px;
    height: 40px;
    line-height: 40px;
    text-align: center;
    margin: 10px auto;
    cursor: pointer;
}
.selected-box{
    width: 22px; height: 22px;
    border-radius: 50%;
    border: 1px solid #00cc84;
    color: rgba(255,255,255,0);
    margin: 0 auto;
    cursor: pointer;
    background: #fff;
}
.selected-box .iconfont{
    font-size: 12px;
}
.selected-box-wrap.selected .selected-box,
.selected-box-wrap:hover .selected-box{
    color: #fff;
    background: #00cc84;
}
</style>