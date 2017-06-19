<!-- 
  顶部分类——编辑
  李瑞云 2016.12.01
 -->

 <template>
    <div>
        <h2 class="title">顶部分类</h2>
        <div>
            <div class="item" v-for="(item, index) in data">
                <div class="delete-btn" @click="delItem(index)" v-if="data.length > 1">删除</div>
                <div class="table w100">
                    <div class="table-row">
                        <div class="table-cell valign-m cell-left">名称{{index + 1}}:</div>
                        <div class="table-cell valign-m">
                            <input type="text" class="form-control" v-model="item.title">
                        </div>
                        <div class="table-cell valign-m"></div>
                    </div>
                    <div class="table-row">
                        <div class="table-cell valign-m cell-left">链接{{index + 1}}:</div>
                        <div class="table-cell valign-m">
                            <input type="text" class="form-control" v-model="item.href">
                        </div>
                        <div class="table-cell valign-m">
                            <button class="btn btn-default" @click="openLinkChoice(index, item)">选择链接</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="btn-add btn-blue" @click="addItem" v-if="data.length < 10">添加分类({{data.length}}/10)</div>
        <link-choice v-if="linkChoice.showModal" :modalOptions="linkChoice" @close="closeLinkChoicePop" @ok="linkChoiceSuccess"></link-choice>
        <modal v-if="del.index !== ''" :modalOptions="del.modalOptions" @close="closeDelModal" @ok="okDelModal"></modal>
    </div>
</template>

<script>
import Vue from 'vue'
import modal from '../../modules/modal'
import linkChoice from '../../modules/linkChoice'

export default {
    name: 'categoriesBar',
    data () {
        return {
            linkChoice: {
                showModal: false,
                curTab: 'myGoods',
                selected: '',//当前选择项
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
    components: { modal, linkChoice },
    methods: {
        //打开链接选择弹窗
        openLinkChoice: function(index, item){
            this.linkChoice.showModal = true;
            this.linkChoice.selected = item.href;//设置当前选择项
            this.curIndex = index;//给当前索引赋值
        },
        //关闭链接选择弹窗
        closeLinkChoicePop: function(){
            this.linkChoice.showModal = false;
        },
        //选择链接成功回调
        linkChoiceSuccess: function(opts){
            this.linkChoice.showModal = false;
            this.data[this.curIndex].href = opts.link;
            this.linkChoice.selected = opts.link;//设置当前选择项
        },
        //添加分类
        addItem: function(){
            var newItem = {
                title: '',
                href: ''
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
            var data = this.data,
                index = this.del.index;

            data.splice(index, 1);
            this.del.index = '';
        }
    }
}
</script>

<style scoped>
.cell-left{
    width: 50px;
}
</style>