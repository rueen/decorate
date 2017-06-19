<!-- 
  今日上新——编辑
  李瑞云 2016.12.01
 -->

 <template>
    <div>
        <h2 class="title">今日上新</h2>
        <div class="table w100 pl10">
            <div class="table-row">
                <div class="table-cell valign-m cell-left">分组名称:</div>
                <div class="table-cell valign-m">
                    {{element.linkName}}
                </div>
            </div>
            <div class="table-row">
                <div class="table-cell valign-m cell-left">上新ID:</div>
                <div class="table-cell valign-m">
                    <input type="text" class="form-control" v-model="data.todays">
                </div>
                <div class="table-cell valign-m">
                    <button class="btn btn-default" @click="openLinkChoice">选择上新分组</button>
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
        var that = this;

        return {
            linkChoice: {
                showModal: false,
                curTab: 'group',
                tabs: [{
                    name: 'group',
                    text: '分组列表'
                }],
                selected: '#/groups/show/' + that.data.todays,//当前选择项
            }
        }
    },
    props: ['data', 'element'],
    created: function(){

    },
    components: { linkChoice },
    methods: {
        //打开链接选择弹窗
        openLinkChoice: function(){
            this.linkChoice.showModal = true;
        },
        //关闭链接选择弹窗
        closeLinkChoicePop: function(){
            this.linkChoice.showModal = false;
        },
        //选择链接成功回调
        linkChoiceSuccess: function(opts){
            this.linkChoice.showModal = false;
            this.data.todays = opts.id;
            this.element.linkName = opts.name;
            this.linkChoice.selected = opts.link;//设置当前选择项
        }
    }
}
</script>

<style scoped>
.cell-left{
    width: 70px;
}
</style>