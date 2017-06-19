<!-- 
  焦点图——编辑
  李瑞云 2016.12.01
 -->
 <template>
    <div>
        <h2 class="title">焦点图(自定义)</h2>
        <div class="table w100 pl10">
            <div class="table-row">
                <div class="table-cell valign-m cell-left">图片链接:</div>
                <div class="table-cell valign-m">
                    <input type="text" v-model="data.imgsrc" class="form-control">
                </div>
                <div class="table-cell valign-m">
                    <button class="btn btn-default" @click="imageChoice.showModal = true">选择图片</button>
                </div>
            </div>
            <div class="table-row">
                <div class="table-cell valign-m cell-left">跳转链接:</div>
                <div class="table-cell valign-m">
                    <input type="text" v-model="data.href" class="form-control">
                </div>
                <div class="table-cell valign-m">
                    <button class="btn btn-default" @click="linkChoice.showModal = true">选择链接</button>
                </div>
            </div>
        </div>
        <image-choice v-if="imageChoice.showModal" :modalOptions="imageChoice" @close="closeImageChoicePop" @ok="imageChoiceSuccess"></image-choice> 
        <link-choice v-if="linkChoice.showModal" :modalOptions="linkChoice" @close="closeLinkChoicePop" @ok="linkChoiceSuccess"></link-choice>
    </div>
</template>

<script>
import $ from 'jquery'
import imageChoice from '../../modules/imageChoice'
import linkChoice from '../../modules/linkChoice'

export default {
    name: 'singlePic',
    data () {
        var that = this;

        return {
            imageChoice: {
                showModal: false,
                curTab: 'upload', //当前选项卡
                selected: that.data.imgsrc
            },
            linkChoice: {
                showModal: false,
                curTab: 'myGoods',
                selected: that.data.href
            }
        }
    },
    watch: {
        
    },
    props: ['data', 'element'],
    created: function(){

    },
    components: { imageChoice, linkChoice },
    methods: {
        //关闭图片选择弹窗
        closeImageChoicePop: function(){
            this.imageChoice.showModal = false;
        },
        //选择图片成功回调
        imageChoiceSuccess: function(opts){
            this.imageChoice.showModal = false;
            this.data.imgsrc = opts.src;
            this.imageChoice.selected = opts.src;
        },
        //关闭链接选择弹窗
        closeLinkChoicePop: function(){
            this.linkChoice.showModal = false;
        },
        //选择链接成功回调
        linkChoiceSuccess: function(opts){
            this.linkChoice.showModal = false;
            this.data.href = opts.link;
            this.linkChoice.selected = opts.link;
        },
    }
}
</script>

<style scoped>
.img {
    width: 100%;
    height: auto;
}
</style>