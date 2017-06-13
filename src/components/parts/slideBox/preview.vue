<!-- 
  多图轮播——预览
  李瑞云 2016.12.01
 -->

<template>
    <div>
        <slider :items="items"></slider>
    </div>
</template>

<script>
import $ from 'jquery'
import {bus} from '../../../assets/js/bus.js'
import slider from '../../modules/slider'

export default {
    data () {
        return {
            
        }
    },
    computed: {
        items: function(){
            var data = this.data,
                items = [];

            $.each(data, function(index, json){
                items[index] = {};
                items[index].src = json.imgsrc;
            })

            return items;
        }
    },
    props: ['data', 'element'],
    components: { slider },
    created: function(){
        
    },
    methods: {
        
    }
}
</script>

<style scoped>

</style>