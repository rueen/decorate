
<template>
  <div class="doubleTab" :style="{'background-color': data.bgColor, 'background-image':'url('+data.bgImage+')'}" >
    <div class="myTitle">
      <span :style="{'color':data.fontColor}">{{data.titleName}}</span>
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
        groupDto: {},
      }
    },
    computed: {
      id: function(){
        return this.data.id
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
    },
    mounted(){

    },
    methods: {
      getData(){
        var type = "",
          self  = this,
          id  = this.id;
        if(!id) return;
        type  = this.data.type == 0 ? "getTab" : "getDev";
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
    padding:0 5px;
    box-sizing: border-box;
    background-repeat:no-repeat;
    height: 35px;
    line-height: 35px;
    background-size:100% 100%;
    background-position:center center;
  }
 .myTitle{
   height: 100%;
   text-align: center;
   box-sizing: border-box;
   /*padding: 10px 0;*/
   font-size: 18px;
 }
</style>
