
<template>
  <div class="content">
     <div v-show="data.line==1" v-for="item in data.list" class="oneLine" :class="{'noBtn':data.isShowGet}" :style="{'background-color': item.bgColor,'border-color':item.borderColor,'background-image': 'url(' + item.bgImage + ')'}">
       <div class="onePrint printCol f2">
         ￥<span :style="{'color':item.printColor}" class="f8">50</span>
       </div>
       <div class="oneText" :style="{'color':item.textColor}">
         <P>消费满￥500元可用</P>
         <P>8-7~8-15</P>
         <P>8月美妆专场</P>
       </div>
       <div class="oneImg" v-show="data.isShowGet">
         <p>立即</p>
         <p>领取</p>
       </div>
     </div>
    <div class="twoLine" v-show="data.line==2">
      <div class="twoLineContain" v-for="item,index in data.list" :class="{'active':index%2==0}" :style="{'background-color': item.bgColor, 'background-image': 'url(' + item.bgImage + ')'}">
        <div class="twoPrint f2 printCol">
          ￥<span :style="{'color':item.printColor}" class="f8">50</span>
        </div>
        <div :style="{'color':item.textColor}" class="oneText f2">
          <P>消费满￥500元可用</P>
          <!--<P>8-7~8-15</P>-->
          <!--<P>8月美妆专场</P>-->
        </div>
        <div v-show="data.isShowGet" class="twoBtn">
          <span class="getTwoBtn">立即领取</span>
        </div>
      </div>
    </div>
    <div class="threeLine" v-show="data.line==3">
      <div class="threeLineContain" v-for="item,index in data.list" :style="{'background-color': item.bgColor, 'background-image': 'url(' + item.bgImage + ')'}">
        <p class="printCol f1">
          ￥ <span :style="{'color':item.printColor}" class="threePrint f8">10</span>
        </p>
        <p>
          <span class="f2" :style="{'color':item.textColor}">无门槛优惠券</span>
        </p>
        <p v-show="data.isShowGet">
          <span class="getBtn f3">
            立即领取
          </span>
        </p>
      </div>
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
    mounted:function ( ) {
      console.log(this.data)
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
  @import "../../../assets/font/public.css";
  .content{
    /*padding: 10px 0 10px 0;*/
    background-repeat: no-repeat;
    background-size: 100% auto;
    padding: 1px 0;
  }
.oneLine{
  display: flex;
  align-items: center;
  box-sizing: border-box;
  justify-content: space-around;
  border: 1px solid;
  margin: 2px;
  border-radius: 4px;
  background-repeat: no-repeat;
  background-size: 100% auto;
}
  .noBtn{
    justify-content: space-between;
  }
.active{
  margin-right: 3px;
}
.oneImg{
  background: #ff0033;
  padding: 10px;
  color: white;
  border-radius: 2px;
}
.twoLine{
  display: flex;
}
.twoLineContain{
  /*display: flex;*/
  flex: 1;
  /*align-items: center;*/
  /*font-size: 12px;*/
  text-align: center;
  border:1px solid gainsboro;
  background-repeat: no-repeat;
  background-size: 100% auto;
}
.twoBtn{

}
.getTwoBtn{
  display: inline-block;
  color: red;
  border: 1px solid red;
  padding: 1px 15px;
  margin: 3px 0;
  font-size: 13px;
  border-radius: 2px;
}
  .onePrint{
    box-sizing: border-box;
    padding-left: 15px;
    /*font-size: 18px;*/
  }
  .twoPrint{
    box-sizing: border-box;
    padding: 0 5px;
    font-size: 16px;
  }
.threeLine{
  display: flex;
  /*justify-content: space-around;*/
}
  .threeLineContain{
    flex: 1;
    text-align: center;
    border: 1px solid gainsboro;
    box-sizing: border-box;
    margin: 0 2px;
    padding: 8px;
    border-radius: 5px;
    background-repeat: no-repeat;
    background-size: 100% 100%;
  }
  .threePrint{
    /*font-size: 18px;*/
  }
  .getBtn{
    display: inline-block;
    color: red;
    border: 1px solid red;
    margin-top: 3px;
    padding: 0 5px;
    border-radius: 2px;
  }
</style>
