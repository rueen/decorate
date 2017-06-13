<!-- 
  顶部分类——预览
  李瑞云 2016.12.01
 -->

<template>
    <div class="categoriesBar-preview">
        <ul class="categoriesBar-list clearfix">
            <li v-for="item in data" class="categoriesBar-item">{{item.title}}</li>
        </ul>
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
.categoriesBar-preview{
    background: rgba(255,255,255, .6);
}
.categoriesBar-item{
    height: 40px;
    line-height: 40px;
    padding: 0 10px;
    float: left;
}
</style>