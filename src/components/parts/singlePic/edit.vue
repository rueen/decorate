
 <template>
    <div>
        <h2 class="title">焦点图(自定义)</h2>
        <div class="table w100 pl10">
            <div class="table-row">
              <div class="table-cell valign-m cell-left">图片分布:</div>
              <div class="table-cell valign-m">
                <select v-model="data.column" @change="changeLine">
                  <option disabled value="">请选择</option>
                  <option value="1">1列</option>
                  <option value="2">2列</option>
                  <option value="3">3列</option>
                </select>
              </div>
            </div>
         </div>
    <div v-for="item,index in data.list">
      <div class="list ">
        <div class="table-cell valign-m cell-left">
          图片链接
        </div>
        <div class="table-cell valign-m">
          <input type="text" v-model="item.imgsrc" class="form-control">
        </div>
        <div>
          <button class="btn btn-default" @click="openImageChoice(index,item)">选择图片</button>
        </div>
      </div>
      <div class="list ">
        <div class="table-cell valign-m cell-left">
          跳转链接
        </div>
        <div class="table-cell valign-m">
          <input type="text" v-model="item.href" class="form-control">
        </div>
        <div>
          <button class="btn btn-default" @click="openLinkChoice(index, item)">选择链接</button>
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
                selected: ''
            },
          curIndex:'',
            linkChoice: {
                showModal: false,
               curTab: 'singlePic',
              tabs: [
                {
                  name: 'singlePic',
                  text: '焦点图'
                }
              ],
                selected: ''
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
      //改变列数
      changeLine:function ( ) {
       if(this.data.column==1){
         this.data.list = [
           {
             'imgsrc': 'http://img.seatent.com/statics/action/ac20170531/ac201530_tor_banner3.jpg',
             'href': 'http://www.baidu.com'
           }
         ]
       }else if(this.data.column==2){
         this.data.list = [
           {
             'imgsrc': 'http://img.seatent.com/statics/action/ac20170531/ac201530_tor_banner3.jpg',
             'href': 'http://www.baidu.com'
           }, {
             'imgsrc': 'http://img.seatent.com/statics/action/ac20170531/ac201530_tor_banner3.jpg',
             'href': 'http://www.baidu.com'
           },
         ]
       }else if(this.data.column==3){
         this.data.list = [
           {
             'imgsrc': 'http://img.seatent.com/statics/action/ac20170531/ac201530_tor_banner3.jpg',
             'href': 'http://www.baidu.com'
           }, {
             'imgsrc': 'http://img.seatent.com/statics/action/ac20170531/ac201530_tor_banner3.jpg',
             'href': 'http://www.baidu.com'
           }, {
             'imgsrc': 'http://img.seatent.com/statics/action/ac20170531/ac201530_tor_banner3.jpg',
             'href': 'http://www.baidu.com'
           }
         ]
       }
      },
      //打开链接弹窗
      openLinkChoice: function(index, item){
        this.linkChoice.showModal = true;
        this.linkChoice.selected = item.href;//设置当前选择项
        this.curIndex = index;//给当前索引赋值
      },
      //打开图片选择弹窗
      openImageChoice: function(index, item){
        this.imageChoice.showModal = true;
        this.imageChoice.selected = item.imgsrc;//设置当前选择项
        this.curIndex = index;//给当前索引赋值
      },
        //关闭图片选择弹窗
        closeImageChoicePop: function(){
            this.imageChoice.showModal = false;
        },
        //选择图片成功回调
        imageChoiceSuccess: function(opts){
            this.imageChoice.showModal = false;
            this.data.list[this.curIndex].imgsrc = opts.src;
            this.imageChoice.selected = opts.src;
        },
        //关闭链接选择弹窗
        closeLinkChoicePop: function(){
            this.linkChoice.showModal = false;
        },
        //选择链接成功回调
        linkChoiceSuccess: function(opts){
            this.linkChoice.showModal = false;
            this.data.list[this.curIndex].href = opts.url;
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
  .list{
    display: flex;
    align-items: center;
    width: 100%;
    box-sizing: border-box;
    padding-left: 12px;
  }
</style>
