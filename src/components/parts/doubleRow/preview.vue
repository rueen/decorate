<!-- 
  商品列表——预览
  李瑞云 2017.02.28
 -->

<template>
    <div class="doubleTab" :style="{'background-color': data.bgColor, 'background-image':'url('+data.bgImage+')'}" >
        <div class="list">
            <h2 :style="{'color':data.titleColor, 'background-image': 'url(' + data.titleBj + ')'}">{{data.title}}</h2>
            <ul>
                <li v-for="items of groupDto" :style="{'border-color':data.borderColor}" v-if="data.type == 0">
                    <div class="tip-img">
                        <img :src="items.small" alt="">
                    </div>
                    <p>{{ items.name }} </p>
                    <div class="money-btn">
                        <div class="money" :style="{'color':data.priceColor}">￥<span >{{ items.price}}</span><i>￥{{items.originPrice}}</i></div>
                    </div>
                </li>
                <li v-for="items of groupDto" :style="{'border-color':data.borderColor}" v-else>
                    <div class="tip-img">
                        <img :src="items.atturl" alt="">
                    </div>
                    <p>{{ items.aname }} </p>
                    <div class="money-btn">
                        <div class="money" :style="{'color':data.priceColor}">￥<span >{{ items.contact}}</span><i>￥{{items.linkman}}</i></div>
                    </div>
                </li>
            </ul>
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
            return this.data.goodId
        }
    },
    watch:{
        id:function(id){
            this.getData()
        }
    },
    props: ['data', 'element'],
    created(){
        this.getData()
        console.log(this.data.goodId)
    },
    methods: {
        getData(){
            
            var type = "",
                self  = this,
                id  = this.id;
            if(!id) return 

            type  = this.data.type == 0 ? "getTab" : "getDev"

            service.linkChoice[type+"Details"]({
                "goodId" : id,
                success : function(resp){
                    console.log(resp)
                    self.groupDto = resp.rows

                }
            })
        }
    }
}
</script>

<style scoped>
.doubleTab {
    background-color:rgba(248,191,0,1);
    padding:0 13px;
    background-repeat:no-repeat;
    background-size:100% auto;
    background-position:center top;
}

.doubleTab .list {
    padding-bottom:12px;
}

.doubleTab .list h2 {
    font-size:14px;
    height:40px;
    display: flex;
    justify-content: center;
    align-items: center;
    color:#fff;
    position:relative;
    z-index: 1;
    padding-top:10px;
    position: relative;
}   


.doubleTab .list ul{
    padding-top:0.15rem;
    flex-direction: row;
    flex-wrap: wrap;
    display: flex;
    justify-content: space-between;
}

.doubleTab .list ul li {
    background-color: #fff;
    width: 48%;
    margin-top:8px;
    padding: 0 2%;
    border-radius: 4px;
    position:relative;
    border-width:1px;
    border-style: solid;
}

.doubleTab .list ul li .sell_out {
    width:50%;
    height: 100%;
    position: absolute;
    top:0;
    left:50%;
    margin-left:-25%;
    display: flex;
    align-items: center;
}
.doubleTab .list ul li .sell_out img {
    width:100%;
    height:auto;
}
.doubleTab li .tip-img {
    position:relative;
}

.doubleTab li .tip-img img {
    max-width:100%;
    max-height: 100%;
}

.doubleTab li .tip-img .tip{
    width:0.7rem;
    height:0.7rem;
    display:inline-flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    background-color: #70ba46;
    color:#fff;
    position:absolute;
    top:0.2rem;
    left:0.13rem;
    font-size:0.18rem;
}
.doubleTab li p{
    font-size:0.24rem;
    line-height: 1.4;
    color:#666;
    padding:0 0.1rem;
}

.doubleTab li .money-btn {
    display: flex;
    align-items: center;
    padding:.22rem 0;
}

.doubleTab li .money-btn .money {
    font-size:0.24rem;
    color:#e20000;
    flex:1;
}

.doubleTab li .money-btn .money span {
    font-size:0.42rem;
}
.doubleTab li .money-btn .money i {
    font-size:0.12rem;
    color:#999;
    font-style: normal;
    text-decoration: line-through;
}

.doubleTab li .money-btn .btn {
    width:1.4rem;
    height: 0.4rem;
    display: inline-flex;
    background-color:#ff6059;
    color:#fff;
    font-size:0.24rem;
    justify-content: center;
    align-items: center;
    border-radius:10px;
    flex:1;
}
</style>