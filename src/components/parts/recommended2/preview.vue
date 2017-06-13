<!-- 
  大师推荐——预览
  李瑞云 2016.12.01
 -->

<template>
    <div>
        <h2 class="tit">大师推荐</h2>
        <div class="recommended-box" v-for="(item, index) in masterrcdList">
            <div v-if="!item.isError">
                <div class="banner">
                    <img :src="item.banner" alt="" class="banner-img">
                </div>
                <div class="goods-list clearfix">
                    <div class="goods-item" v-for="goods in item.groupGoodsList">
                        <img :src="goods.thumbnail" alt="" class="goods-img">
                        <div class="goods-title clamp2">{{goods.name}}</div>
                        <div class="goods-price-box"><span class="dollar">￥</span><span class="goods-price">{{goods.price}}</span></div>
                    </div>
                </div>
            </div>
            <div v-if="item.isError">
                <div class="data-none">暂无商品</div>
            </div>
        </div>
    </div>
</template>

<script>
import $ from 'jquery'
import {bus, info} from '../../../assets/js/bus.js'
import service from '../../../assets/js/service.js'

export default {
    data () {
        return {
            masterrcdList: []
        }
    },
    computed: {
        masterrcd: function(){
            return this.data.masterrcd.split(',');
        }
    },
    watch: {
        masterrcd: function(masterrcd){
            this.getData();
        }
    },
    props: ['data', 'element'],
    components: {},
    created: function(){
        this.getData();
    },
    methods: {
        getData: function(){
            var that = this,
                masterrcd = this.masterrcd;

            $.each(masterrcd, function(index, val){
                if(!that.masterrcdList[index] && !!val){
                    service.getGroup({
                        groupId: val,
                        shopId: info.shopId,
                        pageSize: 2,
                        pageNum: 1,
                        success: function(resp){
                            if(resp.data && resp.data.groupDto){
                                that.masterrcdList.splice(index, 1, resp.data.groupDto);
                            } else {
                                that.masterrcdList.splice(index, 1, {isError: true});
                            }
                        }
                    })
                }
            })
        }
    }
}
</script>

<style scoped>
.tit{
    color: #000;
    font-size: 20px;
    text-align: center;
    padding: 20px 0 8px;
}
.banner-img{
    width: 100%; height: auto;
}
.goods-item{
    width: 50%;
    float: left;
    padding: 10px;
}
.goods-img{
    width: 80px; height: 120px;
    display: block;
    margin: 0 auto;
}
.goods-title{
    padding: 5px 0;
    font-size: 12px;
}
.goods-price-box{
    font-size: 12px;
}
.goods-price{
    font-weight: bold;
    font-size: 16px;
}
.data-none{
    text-align: center;
    padding: 5px 0;
}
</style>