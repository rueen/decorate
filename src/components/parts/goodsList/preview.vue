<!-- 
  商品列表——预览
  李瑞云 2017.02.28
 -->

<template>
    <div class="content" :style="{'background-color': data.bgColor, 'background-image': 'url(' + data.bgImage + ')'}">
        <div class="title" :style="{'color': data.titleColor}">{{data.title}}</div>
        <table class="goods-list w100" v-if="groupDto.groupGoodsList">
            <tr v-for="(tr, index) in Math.ceil(groupDto.groupGoodsList.length / 2)">
                <template v-if="groupDto.groupGoodsList[index * 2]">
                <td class="goods-list-td">
                    <div class="goods-item" :class="{'showBorder': data.showBorder}" :style="{'border-color': data.borderColor}">
                        <img :src="groupDto.groupGoodsList[index * 2].original" alt="" class="goods-img">
                        <div class="tit clamp2">{{groupDto.groupGoodsList[index * 2].name}}</div>
                        <div class="price-box">{{data.priceTitle}}￥<span class="price" :style="{'color': data.priceColor}">{{groupDto.groupGoodsList[index * 2].price}}</span></div>
                    </div>
                </td>
                </template>
                <template v-if="groupDto.groupGoodsList[index * 2 + 1]">
                <td class="goods-list-td">
                    <div class="goods-item" :class="{'showBorder': data.showBorder}" :style="{'border-color': data.borderColor}">
                        <img :src="groupDto.groupGoodsList[index * 2 + 1].original" alt="" class="goods-img">
                        <div class="tit clamp2">{{groupDto.groupGoodsList[index * 2 + 1].name}}</div>
                        <div class="price-box">{{data.priceTitle}}￥<span class="price" :style="{'color': data.priceColor}">{{groupDto.groupGoodsList[index * 2 + 1].price}}</span></div>
                    </div>
                </td>
                </template>
            </tr>
        </table>
        <div class="text-center" v-if="!data.id">请选择分组</div>
        <!-- <div class="goods-list w100">
            <template v-for="item in groupDto.groupGoodsList">
                <div class="goods-item" :class="{'showBorder': data.showBorder}" :style="{'border-color': data.borderColor}">
                    <img :src="item.original" alt="" class="goods-img">
                    <div class="tit clamp2">{{item.name}}</div>
                    <div class="price-box">{{data.priceTitle}}￥<span class="price" :style="{'color': data.priceColor}">{{item.price}}</span></div>
                </div>
            </template>
        </div> -->
        <div class="more-box">
            <a href="" class="more">查看更多>></a>
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
            groupDto: {}
        }
    },
    computed: {
        id: function(){
            return this.data.id
        }
    },
    watch: {
        id: function(id){
            this.getData()
        }
    },
    props: ['data', 'element'],
    components: {},
    created: function(){
        this.getData()
    },
    methods: {
        getData: function(){
            var that = this,
                id = this.id;

            if(!!id){
                service.getGroup({
                    groupId: id,
                    shopId: decoration.shopId,
                    pageSize: 4,
                    pageNum: 1,
                    success: function(resp){
                        if(resp.data && resp.data.groupDto){
                            that.groupDto = resp.data.groupDto;
                        } else {
                            that.groupDto = {isError: true};
                        }
                    }
                })
            }
        }
    }
}
</script>

<style scoped>
.content{
    padding: 10px 0 10px 0;
    background-repeat: no-repeat;
    background-size: 100% auto;
}
.title{
    height: 30px;
    line-height: 30px;
    text-align: center;
}
.goods-list{
    border-spacing: 10px;
}
.goods-list-td{
    width: 50%;
    vertical-align: top;
}
/*.goods-list{
    padding: 10px 10px 0;
    overflow: hidden;
}*/
.goods-item{
    background: #fff;
    padding: 10px;
    border-radius: 4px;
    width: 100%; height: 100%;
}
/*.goods-item{
    background: #fff;
    padding: 10px;
    border-radius: 4px;
    width: 145px;
    float: left;
    margin: 0 10px 10px 0;
}*/
.goods-item.showBorder{
    border: 1px solid;
}
/*.goods-item:nth-child(2n){
    margin-right: 0;
}*/
.goods-img{
    width: 100%; height: auto;
    display: block;
    margin: 0 auto;
}
.tit{
    color: #333;
    font-size: 12px;
    line-height: 16px;
    height: 42px;
    padding-top: 10px;
}
.price-box{
    font-size: 12px;
    color: #999;
    padding-top: 5px;
}
.price{
    font-size: 18px;
    font-weight: bold;
}
.more-box{
    height: 20px;
    line-height: 20px;
    text-align: center;
}
.more{
    color: #fff;
    font-size: 12px;
}

</style>