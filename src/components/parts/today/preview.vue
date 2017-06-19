<!-- 
  今日上新——预览
  李瑞云 2016.12.01
 -->

<template>
    <div class="content">
        <h2 class="tit">今日上新</h2>
        <p class="tips">10点上新</p>
        <div class="goods-list clearfix">
            <div class="table w100 h100" v-if="!groupDto.isError">
                <div class="table-row">
                    <div class="table-cell valign-m" v-for="goods in groupDto.groupGoodsList">
                        <div class="goods-item">
                            <img :src="goods.thumbnail" alt="" class="goods-img">
                            <div class="goods-title clamp2">{{goods.name}}</div>
                            <div class="goods-price-box">尝鲜价：<span class="dollar">￥</span><span class="goods-price">{{goods.price}}</span></div>
                        </div>
                    </div>
                </div>
                <div class="table-row" v-if="groupDto.isError">
                    <div class="table-cell valign-m text-center">
                        <div class="data-none">暂无商品</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="more-box">
            <div class="more">更多 +</div>
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
        todays: function(){
            return this.data.todays
        }
    },
    watch: {
        todays: function(todays){
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
                todays = this.todays;

            if(!!todays){
                service.getGroup({
                    groupId: todays,
                    shopId: decoration.shopId,
                    pageSize: 2,
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
    background: #222;
    padding: 15px 10px;
}
.tit{
    text-align: center;
    font-size: 16px;
    color: #fff;
    padding-bottom: 5px;
}
.tips{
    text-align: center;
    font-size: 12px;
    color: #fff;
}
.goods-list{
    height: 250px;
    width: 100%;
}
.goods-item{
    width: 147px; height: 200px;
    background: #fff;
    padding: 5px;
}
.goods-item:first-child{
    margin-right: 6px;
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
    color: #000;
}
.goods-price{
    font-weight: bold;
    font-size: 16px;
    color: #fd173a;
}
.more-box{
    text-align: center;
}
.more{
    display: inline-block;
    color: #ddd;
    border: 1px solid #ddd;
    height: 22px;
    line-height: 20px;
    padding: 0 20px;
    font-size: 12px;
}
.data-none{
    text-align: center;
    color: #fff;
}
</style>