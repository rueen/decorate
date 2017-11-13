<!--
  焦点图——预览
  李瑞云 2016.12.01
 -->

<template>
    <div>
      <div v-show="data.column==1" v-for="item in data.list" class="oneItem">
        <img :src="item.imgsrc" class="oneImg">
      </div>
      <div v-show="data.column==2" class="detail">
        <div v-for="item,index in data.list" class="itemImg" :class="{'active':index%2==0}">
          <img :src="item.imgsrc" alt="">
        </div>
      </div>
      <div v-show="data.column==3" class="detail">
        <div v-for="item,index in data.list" class="itemImg threeImg" :class="{'activeThree':index%2!==0}">
          <img :src="item.imgsrc" alt="">
        </div>
      </div>

    </div>
</template>

<script>
export default {
    data () {
        return {

        }
    },
    props: ['data', 'element'],
    created: function(){

    },
    methods: {

    }
}
</script>

<style scoped>
  .oneItem{
    width: 100%;
    height: 130px;
  }
.oneImg {
    width: 100%;
  height: 130px;
}
.detail{
  width: 100%;
  display: flex;
}
  .itemImg{
   width: 50%;
  height: 120px;
  }
  .itemImg img{
    width: 100%;
    height: 120px;
  }
  .active{
    margin-right: 5px;
  }
  .activeThree{
    padding: 0 3px;
  }
  .threeImg{
    height: 85px;
  }
  .threeImg img{
    height: 85px;
  }
</style>
