<!-- 
  新分类——预览
  李瑞云 2016.12.01
 -->

<template>
    <div class="categories-preview">
        <h2 class="tit">{{data.name}}</h2>
        <div class="item" v-for="item in data.pics">
            <img :src="item.imgsrc" alt="" class="img">
        </div>
    </div>
</template>

<script>
export default {
    data () {
        return {
            
        }
    },
    computed: {

    },
    props: ['data', 'element'],
    components: {},
    created: function(){

    },
    methods: {
        
    }
}
</script>

<style scoped>
.categories-preview{
    background: rgba(255,255,255, .6);
}
.categories-item{
    height: 40px;
    line-height: 40px;
    padding: 0 10px;
    float: left;
}
.tit{
    height: 40px;
    line-height: 40px;
    padding: 0 15px;
    background: #f5f5f5;
}
.img{
    width: 100%; height: auto;
}
</style>