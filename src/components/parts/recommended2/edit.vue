<!-- 
  大师推荐——编辑
  李瑞云 2016.12.01
 -->

 <template>
    <div>
        <h2 class="title">大师推荐</h2>
        <div class="isShowGoods">
            <input type="checkbox" v-model="data.subcheck" class="ui-checkbox"/>显示商品
        </div>
        <div class="item" v-for="(item, index) in masterrcd">
            <div class="delete-btn" @click="delItem(index)" v-if="masterrcd.length > 1">删除</div>
            <div class="table w100">
                <div class="table-row">
                    <div class="table-cell valign-m cell-left">推荐ID:</div>
                    <div class="table-cell valign-m">
                        <input type="text" class="form-control" v-model="masterrcd[index]">
                    </div>
                    <div class="table-cell valign-m">
                        <button class="btn btn-default" @click="openLinkChoice(index)">选择推荐ID</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="btn-add btn-blue" @click="addItem" v-if="masterrcd.length < 5">添加子类目({{masterrcd.length}}/5)</div>
        <link-choice v-if="linkChoice.showModal" :modalOptions="linkChoice" @close="closeLinkChoicePop" @ok="linkChoiceSuccess"></link-choice>
        <modal v-if="del.index !== ''" :modalOptions="del.modalOptions" @close="closeDelModal" @ok="okDelModal"></modal>
    </div>
</template>

<script>
import Vue from 'vue'
import modal from '../../modules/modal'
import linkChoice from '../../modules/linkChoice'
import {info} from '../../../assets/js/bus.js'

export default {
    data () {
        var data = this.data;

        return {
            linkChoice: {
                showModal: false,
                curTab: 'group',
                tabs: [{
                    name: 'group',
                    text: '分组列表'
                }]
            },
            masterrcd: data.masterrcd.split(','),
            curIndex: '',//当前索引
            del: {
                index: '',
                modalOptions: {
                    size: 'mini',
                    content: '确定删除吗？'
                }
            },
        }
    },
    props: ['data', 'element'],
    created: function(){

    },
    watch: {
        masterrcd: function(val){
            this.data.masterrcd = val.join(',')
        }
    },
    components: { modal, linkChoice },
    methods: {
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
            var that = this;

            this.linkChoice.showModal = false;

            this.masterrcd.splice(this.curIndex, 1, opts.id);
        },
        //添加分类
        addItem: function(){
            this.masterrcd.push('')
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

            this.masterrcd.splice(index, 1);
            this.del.index = '';
        }
    }
}
</script>

<style scoped>
.isShowGoods{
    padding-bottom: 10px;
    border-bottom: 1px solid #ccc;
    margin-bottom: 10px;
    margin-left: 10px;
}
.ui-checkbox{
    margin: 5px 5px 0 0;
    float: left;
}
.cell-left{
    width: 60px;
}
</style>