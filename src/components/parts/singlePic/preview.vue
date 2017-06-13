<!-- 
  焦点图——预览
  李瑞云 2016.12.01
 -->

<template>
    <div>
        <img :src="data.imgsrc" class="img">
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
.img {
    width: 100%;
    height: auto;
}

</style>