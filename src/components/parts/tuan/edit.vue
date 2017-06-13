<!-- 
  团购——编辑
  李瑞云 2016.12.01
 -->

 <template>
    <div>
        <h2 class="title">团购</h2>
        <div class="table w100 pl10">
            <div class="table-row" v-for="(item, index) in data">
                <div class="table-cell valign-m cell-left">{{tuan[index]}}:</div>
                <div class="table-cell valign-m">
                    <input type="text" class="form-control" v-model="data[index]">
                </div>
                <div class="table-cell valign-m">
                    <button class="btn btn-default" @click="openLinkChoice(index)">选择团购ID</button>
                </div>
            </div>
        </div>
        <link-choice v-if="linkChoice.showModal" :modalOptions="linkChoice" @close="closeLinkChoicePop" @ok="linkChoiceSuccess"></link-choice>
    </div>
</template>

<script>
import Vue from 'vue'
import linkChoice from '../../modules/linkChoice'

export default {
    data () {
        return {
            tuan: {
                'gp1': '10点团',
                'gp2': '14点团',
                'gp3': '20点团'
            },
            curIndex: '',//当前索引
            linkChoice: {
                showModal: false,
                curTab: 'sale',
                tabs: [{
                    name: 'sale',
                    text: '限时特卖列表'
                }]
            }
        }
    },
    props: ['data', 'element'],
    created: function(){

    },
    components: { linkChoice },
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
            this.linkChoice.showModal = false;

            this.data[this.curIndex] = opts.id.toString();
        }
    }
}
</script>

<style scoped>
.cell-left{
    width: 60px;
}
</style>