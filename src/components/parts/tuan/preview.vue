<!-- 
  团购——预览
  李瑞云 2016.12.01
 -->

<template>
<div class="preview-tuan">
    <div class="tab">
        <div class="table">
            <div class="table-cell" :class="{'cur': index == 'gp1'}" v-for="(item, index) in data">
                <p v-if="index == 'gp1'">10:00</p>
                <p v-if="index == 'gp2'">14:00</p>
                <p v-if="index == 'gp3'">20:00</p>
                <p class="tip" v-if="index == 'gp1'">抢购中</p>
                <p class="tip" v-if="index == 'gp2' || index == 'gp3'">即将开始</p>
            </div>
            <!-- <div class="table-cell">
                <p>14:00</p>
                <p>即将开始</p>
            </div>
            <div class="table-cell">
                <p>20:00</p>
                <p>即将开始</p>
            </div> -->
        </div>
    </div>
    <div class="content">
        <div v-if="activityGoodsListDto.activityGoodsList && !activityGoodsListDto.isError">
            <div class="countDown text-center">
                距离{{countDownType == 0 ? '开始' : '结束'}}时间还剩
                <countDown :date="countDownTime"></countDown>
            </div>
            <div class="goods-list">
                <div class="goods-item" v-for="goods in activityGoodsListDto.activityGoodsList">
                    <div class="goods-thumbnail-box">
                        <img :src="goods.activityPhoto" alt="" class="goods-img">
                        <img class="goods-thumbnail-tag" src="../../../assets/images/qg_red.png" alt="抢购中">
                    </div>
                    <div class="goods-title clamp1">{{goods.name}}</div>
                    <div class="goods-price-box"><span class="tag">疯抢价</span><span class="goods-price">￥{{goods.price}}</span></div>
                </div>
            </div>
        </div>
        <div v-if="activityGoodsListDto.isError">
            <div class="text-center">暂无商品</div>
        </div>
    </div>
</div>
</template>

<script>
import {bus} from '../../../assets/js/bus.js'
import {info, decoration} from '../../../config.js'
import service from '../../../assets/js/service.js'
import countDown from '../../modules/countDown'

export default {
    data () {
        return {
            activityGoodsListDto: {},
            countDownTime: new Date()
        }
    },
    computed: {
        gp1: function(){
            return this.data.gp1;
        }
    },
    watch: {
        gp1: function(){
            this.getData()
        }
    },
    props: ['data', 'element'],
    components: { countDown },
    created: function(){
        this.getData()
    },
    methods: {
        getData: function(){
            var that = this,
                gp1 = this.gp1;

            if(!!gp1){
                service.getSale({
                    activityId: gp1,
                    shopId: decoration.shopId,
                    // pageSize: 2,
                    pageNum: 1,
                    success: function(resp){
                        if(resp.data && resp.data.activityGoodsListDto){
                            var activityGoodsListDto = resp.data.activityGoodsListDto;

                            that.activityGoodsListDto = activityGoodsListDto;

                            if(activityGoodsListDto.startTime > activityGoodsListDto.endTime){
                                //如果开始时间大于（晚于）结束时间，则活动未开始
                                //倒计时结束时间为开始时间
                                that.countDownTime = activityGoodsListDto.startTime
                                that.countDownType = 0
                            } else {
                                //否则倒计时结束时间为活动结束时间
                                that.countDownTime = activityGoodsListDto.endTime
                                that.countDownType = 1
                            }
                        } else {
                            that.activityGoodsListDto = {isError: true};
                        }
                    }
                })
            }
        }
    }
}
</script>

<style scoped>
.tab{
    padding-bottom: 5px;
}
.table{
    width: 100%; height: 46px;
    background: #222;
    color: #fff;
}
.table-cell{
    vertical-align: middle;
    text-align: center;
    width: 33.3%;
}
.cur{
    background: #fa225b;
    position: relative;
    width: 33.4%;
}
.cur:after{
    position: absolute;
    bottom: -5px;
    left: 50%;
    width: 0;
    height: 0;
    margin-left: -5px;
    content: '';
    border-top: 5px solid #fa225b;
    border-right: 5px solid transparent;
    border-bottom: none;
    border-left: 5px solid transparent;
}
.countDown{
    font-size: 12px;
    padding: 5px 0;
}
.goods-item{
    padding: 10px;
}
.goods-thumbnail-box{
    position: relative;
    height: 120px;
    background: #f7f7f7;
}
.goods-thumbnail-tag{
    position: absolute;
    right: 5px;
    bottom: -12px;
    width: 40px; height: 40px;
}
.goods-img{
    display: block;
    width: 100%; height: auto;
    margin: 0 auto;
}
.goods-item .tag{
    background: #fa225b;
    color: #fff;
    padding: 0 5px;
    height: 18px;
    line-height: 18px;
    font-size: 12px;
    display: inline-block;
}
.goods-title{
    padding: 15px 0 5px;
    color: #333;
}
.goods-price{
    color: #fa225b;
    font-size: 14px;
    padding: 0 0 0 5px;
}
</style>