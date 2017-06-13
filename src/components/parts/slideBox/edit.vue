<!-- 
  多图轮播——编辑
  李瑞云 2016.12.01
 -->

 <template>
    <div>
        <h2 class="title">多图轮播(自定义)</h2>
        <div class="item" v-for="(item, index) in data">
            <h3 class="tit-h3">轮播图{{index + 1}}</h3>
            <div class="delete-btn" @click="delItem(index)" v-if="data.length > 1">删除</div>
            <div class="table w100" >
                <div class="table-row">
                    <div class="table-cell valign-m cell-left">图片链接:</div>
                    <div class="table-cell valign-m">
                        <input type="text" class="form-control" v-model="item.imgsrc">
                    </div>
                    <div class="table-cell valign-m">
                        <button class="btn btn-default" @click="openImageChoice(index)">选择图片</button>
                    </div>
                </div>
                <div class="table-row">
                    <div class="table-cell valign-m cell-left">跳转链接:</div>
                    <div class="table-cell valign-m">
                        <input type="text" class="form-control" v-model="item.href">
                    </div>
                    <div class="table-cell valign-m">
                        <button class="btn btn-default" @click="openLinkChoice(index)">选择链接</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="btn-add btn-blue" @click="addItem" v-if="data.length < 6">添加轮播图({{data.length}}/6)</div>
        <image-choice v-if="imageChoice.showModal" :modalOptions="imageChoice" @close="closeImageChoicePop" @ok="imageChoiceSuccess"></image-choice> 
        <link-choice v-if="linkChoice.showModal" :modalOptions="linkChoice" @close="closeLinkChoicePop" @ok="linkChoiceSuccess"></link-choice>
        <modal v-if="del.index !== ''" :modalOptions="del.modalOptions" @close="closeDelModal" @ok="okDelModal"></modal>
    </div>
</template>

<script>
import Vue from 'vue'
import modal from '../../modules/modal'
import imageChoice from '../../modules/imageChoice'
import linkChoice from '../../modules/linkChoice'

export default {
    name: 'singlePic',
    data () {
        return {
            imageChoice: {
                showModal: false,
                curTab: 'upload', //当前选项卡
            },
            linkChoice: {
                showModal: false,
                curTab: 'myGoods'
            },
            curIndex: '',//当前索引
            del: {
                index: '',
                modalOptions: {
                    size: 'mini',
                    content: '确定删除吗？'
                }
            }
        }
    },
    props: ['data', 'element'],
    created: function(){

    },
    components: { imageChoice, linkChoice, modal },
    methods: {
        //打开图片选择弹窗
        openImageChoice: function(index){
            this.imageChoice.showModal = true;
            this.curIndex = index;//给当前索引赋值
        },
        //关闭图片选择弹窗
        closeImageChoicePop: function(){
            this.imageChoice.showModal = false;
        },
        //选择图片成功回调
        imageChoiceSuccess: function(opts){
            this.imageChoice.showModal = false;

            this.data[this.curIndex].imgsrc = opts.selected;
        },
        //打开连接选择弹窗
        openLinkChoice: function(index){
            this.linkChoice.showModal = true;
            this.curIndex = index;//给当前索引赋值
        },
        //关闭连接选择弹窗
        closeLinkChoicePop: function(){
            this.linkChoice.showModal = false;
        },
        //选择连接成功回调
        linkChoiceSuccess: function(opts){
            this.linkChoice.showModal = false;

            this.data[this.curIndex].href = opts.link;
        },
        //添加分类
        addItem: function(){
            var newItem = { 
                'imgsrc': 'http://store.test.seatent.com/img/decorate/hd-depot/000.jpg',
                'href': '' 
            }

            this.data.push(newItem)
        },
        //删除分类
        delItem: function(index){
            this.del.index = index;
        },
        //关闭移除弹窗
        closeDelModal: function(){
            this.del.index = '';
        },
        //确定删除
        okDelModal: function(){
            var index = this.del.index;

            this.data.splice(index, 1);
            this.del.index = '';
        }
    }
}
</script>

<style scoped>

</style>