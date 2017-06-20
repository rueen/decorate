<#assign contextPath = request.contextPath>
<#if (appSettings.assetsPath)?has_content>
<#assign contextPath = appSettings.assetsPath>
</#if>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="TswordYao">
<meta name="Keywords" content="${partner.aliasName!''}微店官网,${partner.aliasName!''}微信,全球购微商城,海淘微分销">
<meta name="Description" content="${partner.aliasName!''}微店官网(shop.seatent.com)电话：${partner.telephone!}微商城全球购,中国最大海外商品B2B微分销平台,提供最全最专业的微商城海外正品、微商城代购特卖、微商城全球扫货,足不出户,一站采购全球购货源。">
<title>${partner.aliasName!''}微店官网_${partner.aliasName!''}微信平台|海淘全球购微商城分销</title>
<script>function getContextPath() {return '${contextPath}';}</script>
<script src="${contextPath}/assets/lib/js/jquery.min.js"></script>
<link href="http://img.seatent.com/statics/attachment/spec/201505212138143751.png" rel="shortcut icon">
<link rel="stylesheet"  href="${contextPath}/assets/css/decorate.css?v=1.0"/>
</head>
<body ng-app="dsale" ng-controller="dsaleCtrl">
    <input type="hidden" id="decoration_id"  <#if decoration?has_content> value ="${decoration.id}"</#if>/>
    <input type="hidden" id="decoration_name"  <#if decoration?has_content> value ="${decoration.name!''}"</#if>/>
    
 
    <!-- nav bar-->
    <nav class="navbar navbar-inverse navbar-abstract-top decorate-navbar" role="navigation"><!---navbar-fixed-top就是固定上方,注意下面元素留出上边距-->
      <div class="navbar-header">
         <@hd.a class="navbar-brand" text="&lt;&lt;&nbsp;返回" href="decorate/back" />
         <!-- <a class="navbar-brand"   id="btn-templates"    data-toggle="modal" data-target="#mols-modal"   href="javascript:void(0);">选择模版</a> -->
         <#if decoration??>
         <#if decoration.isIndex?? && decoration.isIndex == 1>
         <a class="navbar-brand"   id="goto-shop"     href="http://${shop.domain!}.${appSettings.shopDomainPost!}/#/pages/show/${decoration.id}" >查看页面<div class="imgWrap"><img src="${request.contextPath}/shop/qrcode" id= "preview_page"><h5>微信扫一扫,在手机中查看</h5></div></a>
         <#else>
         <a class="navbar-brand"   id="goto-shop"     href="http://${shop.domain!}.${appSettings.shopDomainPost!}/#/pages/show/${decoration.id}" >查看页面<div class="imgWrap"><img src="${request.contextPath}/shop/decorateQrcode?id=${decoration.id}" id= "preview_page"><h5>微信扫一扫,在手机中查看</h5></div></a>
         </#if>
         </#if>
         <a class="navbar-brand"  id="btn-help"    target="_blank"     href="javascript:void(0);">?&nbsp;教程</a>

         <h2 class="tilte"><#if decoration??><#if decoration.isIndex?? && decoration.isIndex == 1>首页<#elseif decoration.isIndex?? && decoration.isIndex == 2>商品页 <#else>${decoration.name!''}</#if></#if>页面装修</h2>

         <!--<a class="navbar-brand  btn-save fr"  href="javascript:void(0);">发布</a>
         <a class="navbar-brand temp-save fr"  href="javascript:void(0);">暂存</a> -->
         <a class="navbar-brand  btn-save fr"  href="javascript:void(0);">保存</a>
         <a class="navbar-brand btn-cls fr"  tempid="" href="javascript:void(0);#">清空</a>
      </div>

    </nav>

    <div id="helps">
        <p id="help-one"> <b class="arrow"></b><big>①</big>  点住想要添加的模块，<br>拖放到中间手机中; </p>
        <p id="help-two"> <b class="arrow"></b><big> ②</big>   单击手机中的某模块，<br>在右侧编辑其内容;           <br><br>        (编辑后,右侧下方确定↘)</p>
        <p id="help-three"> <b class="arrow"></b><big> ③</big>   最后，点击发布，<br>就完成了首页更新。
            <br><input type="checkbox" name="" id="never-again"/><small>(下次不再提醒 )</small>    <button class="btn btn-sm btn-primary">知道了&times;</button> </p>
    </div>


    <div id="main" class="container">
        <div class="rows">
            <div id="model-list" class="col-lg-4 panel-group-nonono">
                <div class="panel panel-default">
                    <a class="accordion-toggle panel-heading" data-toggle="collapse" data-parent="#model-list-nonono" href="#pics-words">图文类</a>
                    <dl id="pics-words" class="accordion-body panel-body-nonono in">
                        <dd class="mol-tag" draggable="true" id="tag-slideBox">多图轮播</dd>
                        <dd class="mol-tag" draggable="true" id="tag-singlePic">焦点图</dd>
                        <!--<dd class="mol-tag" draggable="true" id="tag-singlePicDesc">焦点图2</dd>-->
                        <!-- <dd class="mol-tag" draggable="true" id="tag-bannerPic">横幅图</dd> -->
                        <!-- <dd class="mol-tag" draggable="true" id="tag-wordPic">左文右图</dd> -->
                        <!--<dd class="mol-tag" draggable="true" id="tag-wordOnly">黑板报</dd>-->
                        <!--<dd class="mol-tag" draggable="true" id="tag-tmpWelcome">欢迎光临</dd>-->
                    </dl>
                </div>

                <div class="panel panel-default">
                    <a class="accordion-toggle panel-heading" data-toggle="collapse" data-parent="#model-list-nonono" href="#dist-areas">区域类</a>
                    <dl id="dist-areas" class="accordion-body in">
                    <dd class="mol-tag" draggable="true" id="tag-categories">新分类</dd>
                    <dd class="mol-tag" draggable="true" id="tag-categoriesBar">顶部分类</dd>
                    <!--<dd class="mol-tag" draggable="true" id="tag-hd-category">类别列表1</dd>-->
                    <!--<dd class="mol-tag" draggable="true" id="tag-tb-category">类别列表2</dd>-->
                    <!--<dd class="mol-tag" draggable="true" id="tag-tmpCategory">类别列表3</dd>-->
                    <!--<dd class="mol-tag" draggable="true" id="tag-bb-category">固定类别</dd>-->
                    <!--<dd class="mol-tag" draggable="true" id="tag-hd-brands">品牌陈列1</dd>-->
                    <!--<dd class="mol-tag" draggable="true" id="tag-tmpBrands">品牌陈列2</dd>-->
                    <!--<dd class="mol-tag" draggable="true" id="tag-titleOnly">区块标题1</dd>-->
                    <!--<dd class="mol-tag" draggable="true" id="tag-tmpTitleOnly">区块标题2</dd>-->
                    <!--<dd class="mol-tag" draggable="true" id="tag-title2Only">区块标题3</dd>-->
                    <!--<dd class="mol-tag" draggable="true" id="tag-line">分割线</dd>-->
                    </dl>
                </div>
<!--
                <div class="panel panel-default">
                    <a class="accordion-toggle panel-heading" data-toggle="collapse" data-parent="#model-list-nonono" href="#good-models">宝贝类</a>
                    <dl id="good-models" class="accordion-body in">
                        <!--<dd class="mol-tag" draggable="true" id="tag-singleGoodList">宝贝列表1</dd>
                        <!--<dd class="mol-tag" draggable="true" id="tag-doubleGoodList">宝贝列表2</dd>
                        <!-- <dd class="mol-tag" draggable="true" id="tag-singleGood">单宝贝推荐</dd>
                    </dl>
                </div>
-->
                <div class="panel panel-default">
                    <a class="accordion-toggle panel-heading" data-toggle="collapse" data-parent="#model-list-nonono" href="#sale-models">营销类</a>
                    <dl id="sale-models" class="accordion-body in">
                    	<dd class="mol-tag" draggable="true" id="tag-tuan">团购</dd>
                    	<dd class="mol-tag" draggable="true" id="tag-today">今日上新</dd>
                    	<dd class="mol-tag" draggable="true" id="tag-recommended">大师推荐</dd>
                    	<dd class="mol-tag" draggable="true" id="tag-recommended2">大师推荐2</dd>
                      <!--<dd class="mol-tag" draggable="true" id="tag-tb-features">优势展现1</dd>-->
                      <!--<dd class="mol-tag" draggable="true" id="tag-hd-features">优势宣传2</dd>-->
                      <!--<dd class="mol-tag" draggable="true" id="tag-bb-features">优势宣传3</dd>-->
                      <!--<dd class="mol-tag" draggable="true" id="tag-contract">联系方式</dd>-->
                    </dl>
                </div>
            </div>

            <div class="mol-tip"><div class="arrow"></div></div>

            <div id="mobile-wrap">
                <div id="show-mobile-border"></div>
                <div class="iphone-head"><i></i><div class="store-name">${(currentUser.shopName)!}</div></div><!--莉莉chou的小店.*^_^*.-->
                <div id="show-mobile"  class="col-lg-4-" data-mcs-theme="dark">
                    <!--div-- id="store-head"
                    <img src="store-logo.jpg" alt="" id="store-log"/>
                    <div id="store-info">
                        <h3 id="store-name">小于梦的店</h3>
                        <i>粉丝116</i>
                    </div>
                    <ul id="store-barge">
                        <li><p>12</p><h5>全部宝贝</h5></li>
                        <li><p>3</p><h5>上新</h5></li>
                        <li><p>5</p><h5>优惠</h5></li>
                        <li><p>0</p><h5>微店广播</h5></li>
                    </ul>
                </div-->

                </div>
                <div class="iphone-foot"><i></i></div>
            </div>

            <div id="ctrl-area"  class="col-lg-4-">
                <div id="ctrl-wrap"></div>
                <div class="submit-reset-wrap">
                    <input type="reset" class="reset btn btn-default" value="清空">
                    <input type="submit"  class="submit btn btn-primary" value="确定">
                </div>
            </div>

            <div class="clear"></div>
        </div>
    </div>

    <!--<div id="goodlist-forcheck " class="modal fade  my-modal modle-content"></div>-->


    <!-- 宝贝列表模态框（Modal） -->
    <div class="modal fade" id="goods-modal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                   <h4 class="modal-title" class="myModalLabel">宝贝选择</h4>
               </div>
               <div class="modal-body" id="goodslist-forcheck2" >
                   <div class="toolbar">
                       <input type="text" id="keyword-for-search" placeholder=" 输入宝贝关键字"/>
                       <button href="" class="btn btn-search" id="goods-search-btn">搜索</button>
                   </div>
                   <!--<ul class="good-type">-->
                       <!--<li class="good-type" id=""></li>-->
                       <!--<li class="good-type" id=""></li>-->
                       <!--<li class="good-type" id=""></li>-->
                       <!--<li class="good-type" id=""></li>-->
                       <!--<li class="good-type" id=""></li>-->
                       <!--<li class="good-type" id=""></li>-->
                   <!--</ul>-->
                   <div id="goods-list"></div>
                   <div class="goods-list-pager">
                       <a href="javascript:void(0)" class="go-first">|«</a>
                       <a href="javascript:void(0)" class="go-prev">«</a>
                       <!--<a href="" class="page-clicker">1</a>-->
                       <!--<a href="" class="page-clicker">2</a>-->
                       <!--<a href="" class="page-clicker">3</a>-->
                       <!--<input type="text" id="go-pagenum"/>-->
                       <!--<button id="go-the-page">到</button>-->
                       <a href="javascript:void(0)" class="go-next">»</a>
                       <a href="javascript:void(0)" class="go-last">»|</a>
                       &nbsp;第<i id="now-pagenum">1</i>页/共<i id="total-pagenum">1</i>&nbsp;页
                   </div>
                   <div id="goods-checked-list"></div>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-default" data-dismiss="modal" id="goods-list-cls">取消</button>
                   <button type="button" class="btn btn-success" data-dismiss="modal" id="goods-checked-done">提交</button>
               </div>
           </div><!-- /.modal-content -->
       </div><!-- /.modal -->
    </div>

    <!-- 模版列表模态框（Modal） -->
    <div class="modal fade" id="mols-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content1">
                <div class="modal-body" id="molslist-forcheck2" >
                    <div class="molbox" tempid="hdstyle"><b>${partner.aliasName!''}风</b></div>
                    <div class="molbox" tempid="bbstyle"><b>缤纷风</b></div>
                    <div class="molbox" tempid="tbstyle"><b>温馨风</b></div>
                	<div class="molbox" tempid="tmpstyle"><b>喜庆风</b></div>
                    <!--<div class="molbox" tempid="lmstyle"><b>辣妈风</b></div>-->
                    <!--<div class="molbox" tempid="qzstyle"><b>亲子风</b></div>-->
                </div>
                <!--<div class="modal-footer">-->
                    <!--<button type="button" class="btn btn-default" data-dismiss="modal" onclick="mols_list_cls()">取消</button>-->
                    <!--<button type="button" class="btn btn-success" data-dismiss="modal" onclick="checked_done2(this)" id="checked_done2">确定</button>-->
                <!--</div>-->
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 链接选取模态框（Modal） -->
    <div class="modal fade" id="links-modal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">

            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title" class="myModalLabel">链接小工具</h2>
                </div>

                <div class="modal-body" id="links-body" >

                    <ul id="links-tab" class="nav nav-tabs">
                        <li class="active"><a href="#links-category" data-toggle="tab" id="category-check-tab">分类链接</a></li>
                        <li class=""> <a href="#links-goods"    data-toggle="tab" id="goods-check-tab">宝贝链接</a>    </li>
                        <!--<li class="">       <a href="#links-favor" data-toggle="tab">自定义链接</a>  </li>-->
                        <!--
                        <li class="dropdown">
                            <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">Java<b class="caret"></b></a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                                <li><a href="#jmeter" tabindex="-1" data-toggle="tab">jmeter</a></li>
                                <li><a href="#ejb" tabindex="-1" data-toggle="tab">ejb</a></li>
                            </ul>
                        </li>
                        -->
                    </ul>

                    <div id="linksTabContent" class="tab-content">



                        <div class="tab-pane fade in active" id="links-category">
                            <div id="category1">
                                <h5>一级类目</h5>
                                <div id="category1-list">
                                    <!--这里放一级类目列表-->
                                </div>

                                <div id="category1-ctrl-wrap">
                                    <button class="btn btn-sm btn-success" id="link-check1-btn">选此分类</button>
                                    <button class="btn btn-sm btn-default" id="go-category2-btn">在其下级分类挑选</button>
                                </div>

                            </div>
                            <div id="category2">
                                <h5>二级类目</h5>
                                <div id="category2-list">
                                    <!--这里放二级类目列表-->
                                </div>
                                <div id="category2-ctrl-wrap">
                                    <button class="btn btn-sm btn-success" id="link-check2-btn">选此分类</button>
                                </div>
                                <button class="btn btn-sm btn-danger" id="go-category1-btn">返回上级分类</button>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="links-goods">
                            <div class="toolbar">
                                <input type="search" id="links-keyword-for-search" placeholder="输入宝贝关键字" class="form-control"/>
                                <button href="" class="btn btn-success" id="links-goods-search-btn">搜索宝贝</button>
                            </div>

                            <div id="links-goods-list"></div>
                            <div class="links-list-pager">
                                <a href="javascript:void(0)" class="links-go-first">|«</a>
                                <a href="javascript:void(0)" class="links-go-prev">«</a>
                                <a href="javascript:void(0)" class="links-go-next">»</a>
                                <a href="javascript:void(0)" class="links-go-last">»|</a>
                                &nbsp;第<i id="links-now-pagenum">1</i>页/共<i id="links-total-pagenum">1</i>&nbsp;页
                            </div>
                        </div>

                        <!--
                        <div class="tab-pane fade" id="links-favor">
                            <p></p>
                        </div>
                        <div class="tab-pane fade" id="jmeter">
                            <p></p>
                        </div>
                        <div class="tab-pane fade" id="ejb">
                            <p></p>
                        </div>
                        -->
                    </div>


                </div>

                <div class="modal-footer">
                    这个小工具帮你获取无线页面链接&nbsp;(^_^)
                </div>

            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->


    <!-- 图片选取模态框（Modal） -->
    <div class="modal fade" id="imgs-modal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h2 class="modal-title" class="myModalLabel">图片小工具</h2>
                </div>
                <div class="modal-body" id="imgs-body" >

                    <ul id="imgs-tab" class="nav nav-tabs">
                        <li class="active"> <a href="#imgs-haidai" data-toggle="tab" id="hdimgs-check-tab">${partner.aliasName!''}图库</a>    </li>
                        <li class="">       <a href="#imgs-upload" data-toggle="tab" id="upload-check-tab">个人上传</a>    </li>

                        <!--<li class="">       <a href="#imgs-favor" data-toggle="tab">自定义链接</a>  </li>-->
                    </ul>

                    <div id="imgsTabContent" class="tab-content">

                        <div class="tab-pane fade in active" id="imgs-haidai">
                            <!--div class="toolbar">
                                <input type="search" id="imgs-keyword-for-search" placeholder=" 输入图片关键字" class=""/>
                                <button href="" class="btn btn-search " id="imgs-goods-search-btn">搜索</button>
                            </div-->
                            <div id="imgs-haidai-list">
                                <a href="javascript:void(0)" class="img-wrap">
                                    <img src="../../img/decorate/hd-depot/000.jpg" alt=""/>
                                </a>
                                <a href="javascript:void(0)" class="img-wrap">
                                    <img src="../../img/decorate/hd-depot/001.jpg" alt=""/>
                                </a>
                                <a href="javascript:void(0)" class="img-wrap">
                                    <img src="../../img/decorate/baby-house.jpg" alt=""/>
                                </a>

                                <a href="javascript:void(0)" class="img-wrap">
                                    <img src="../../img/decorate/hd-depot/002.jpg" alt=""/>
                                </a>
                                <a href="javascript:void(0)" class="img-wrap">
                                    <img src="../../img/decorate/hd-depot/003.jpg" alt=""/>
                                </a>
                                <a href="javascript:void(0)" class="img-wrap">
                                    <img src="../../img/decorate/hot.jpg" alt=""/>
                                </a>

                                <a href="javascript:void(0)" class="img-wrap">
                                    <img src="../../img/decorate/hd-depot/004.png" alt=""/>
                                </a>
                                <a href="javascript:void(0)" class="img-wrap">
                                    <img src="../../img/decorate/hd-depot/005.png" alt=""/>
                                </a>
                                <a href="javascript:void(0)" class="img-wrap">
                                    <img src="../../img/decorate/hd-depot/006.png" alt=""/>
                                </a>

                            </div>
                            <!--div class="imgs-list-pager">
                                <a href="javascript:void(0)" class="imgs-go-first">|«</a>
                                <a href="javascript:void(0)" class="imgs-go-prev">«</a>
                                <a href="javascript:void(0)" class="imgs-go-next">»</a>
                                <a href="javascript:void(0)" class="imgs-go-last">»|</a>
                                &nbsp;第<i id="imgs-now-pagenum">1</i>页/共<i id="imgs-total-pagenum">1</i>&nbsp;页
                            </div-->
                        </div>

                        <div class="tab-pane fade" id="imgs-upload">

                            <!-- cropbox -->
                            <div id="crop-box" >

                                <!--<div class="imageBox">-->
                                <!--<div class="thumbBox"></div>-->
                                <!--<div class="spinner" style="display: none">Loading...</div>-->
                                <!--</div>-->

                                <div id="img-up-result">
                                    <img src="../../img/decorate/bg.png" alt=""/>
                                    <div class="input-group"id="up-imgsrc-wrap">
                                        <input type="text"    mapid="title"    class="form-control"  placeholder="输入标题文字">
                                        <a class="input-group-addon btn " id="copy-uped-imgsrc">复制地址</a>
                                        <a class="input-group-addon btn " id="check-uped-img">选择此图</a>
                                        <!--<button class="btn btn-primary btn-group-sm" id="check-uped-img">选择此图</button>-->
                                    </div>
                                </div>


                                <button class="upload-beauty btn btn-primary">上传照片
                                    <input  type="file" class="upload-override" id="crop-up-img" name="crop-up-img" accept="image/jpg,image/jpeg,image/png,image/gif" pictype='30010003' data-role="none"/>
                                </button>

                                <!--<div class="action">-->
                                <!--<a id="btnZoomIn"  class="button button-energized" >+</a>-->
                                <!--<a id="btnZoomOut" class="button button-positive"  >-</a>-->
                                <!--<a id="btnCrop"    class="button button-balanced"  >X</a>-->
                                <!--<a id="testPop"   class="button button-royal"  >o</a>-->
                                <!--</div>-->

                                <!--<div class="cropped">-->
                                <!--<img src="" id="cropedImg" />-->
                                <!--</div>-->
                            </div>

                        </div>

                        <!--<div class="tab-pane fade" id="imgs-favor"></div>-->
                    </div>


                    <div id="imgs-tip"></div>
                </div>
                <div class="modal-footer">
                    这个小工具帮你获取图片链接&nbsp;(^_^)
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 提示组件-->
    <div class="alert alert-assertive"></div>
    <div class="confirm confirm-assertive" id="confirm-main">
        <p id="confirm-content"></p>
        <button type="button" class="btn btn-sm btn-default"  id="confirm-cancel">取消</button>
        <button type="button" class="btn btn-sm btn-success"  id="confirm-ok">确定</button>
    </div>

    <!-- 模板 -->
    <div>
      <script type="text/template" id="temp-recommended2">
        <div class="mol-wrap features-wrap" molid="recommended2">
          大师推荐·简<br/>
          {masterrcd}
        </div>
      </script>
        <script type="text/template" id="temp-tuan">
            <div class="mol-wrap features-wrap" molid="tuan">
            	10点团/14点团/20点团模块<br/>
              {gp1}&{gp2}&{gp3}
            </div>
        </script>

      <script type="text/template" id="temp-today">
        <div class="mol-wrap features-wrap" molid="today">
          今日上新<br/>
          {todays}
        </div>
      </script>

        <script type="text/template" id="temp-recommended">
          <div class="master master-say mol-wrap" molid="recommended">
            <div class="mas-hd">
              <h4>大师推荐</h4>
            </div>
            <div class="mas-bd">
              <div class="mas-banner">
                <a href="javascript:;">
                  <div>
                    <img src="{imgsrc}">
                  </div>
                  <div class="summary">
                    <h4>{name}</h4>
                    <p>{sub}</p>
                  </div>
                </a>
              </div>

              <div class="mas-banner">
                <a href="javascript:;">
                  <div>
                    <img src="{imgsrc}">
                  </div>
                  <div class="summary">
                    <h4>{name}</h4>
                    <p>{sub}</p>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </script>

        <script type="text/template" id="temp-categories">
          <div class="cate-wrapper mol-wrap" molid="categories">
            <div class="list-groups">
              <div class="g-category">
                <div class="gc-item diver ng-binding">{name}</div>
              </div>
              <a class="picture" href="javascript:;">
                <img src="{imgsrc}" />
              </a>
            </div>
          </div>
        </script>
        
        <script type="text/template" id="temp-tb-features">
            <div class="mol-wrap features-wrap" molid="tb-features">
                <img src="../../img/decorate/feature/feature01.jpg"  alt=""/>
                <img src="../../img/decorate/feature/feature02.jpg"  alt=""/>
                <img src="../../img/decorate/feature/feature03.jpg"  alt=""/>
                <img src="../../img/decorate/feature/feature04.jpg"  alt=""/>
            </div>
        </script>

        <script type="text/template" id="temp-hd-features">
            <div class="mol-wrap features-wrap hd" molid="hd-features">
                <img src="../../img/decorate/feature/hd-feature01.png"  alt=""/>
                <img src="../../img/decorate/feature/hd-feature02.png"  alt=""/>
                <img src="../../img/decorate/feature/hd-feature03.png"  alt=""/>
                <img src="../../img/decorate/feature/hd-feature04.png"  alt=""/>
                <p class="feature-text"><b>全球货源</b><b>品质保障</b><b>超值价格</b><b>闪电发货</b></p>
            </div>
        </script>

        <script type="text/template" id="temp-hd-brands">
            <div class="mol-wrap hd-brands" molid="hd-brands">
                <img src="../../img/decorate/brand/g1.jpg" alt=""/>
                <img src="../../img/decorate/brand/g2.jpg" alt=""/>
                <img src="../../img/decorate/brand/g3.jpg" alt=""/>
                <img src="../../img/decorate/brand/g4.jpg" alt=""/>
                <img src="../../img/decorate/brand/g5.jpg" alt=""/>
                <img src="../../img/decorate/brand/g6.jpg" alt=""/>
                <img src="../../img/decorate/brand/g7.jpg" alt=""/>
                <img src="../../img/decorate/brand/g8.jpg" alt=""/>
                <img src="../../img/decorate/brand/g9.jpg" alt=""/>
                <img src="../../img/decorate/brand/g10.jpg" alt=""/>
                <img src="../../img/decorate/brand/g11.jpg" alt=""/>
                <img src="../../img/decorate/brand/g12.jpg" alt=""/>
                <img src="../../img/decorate/brand/g13.jpg" alt=""/>
                <img src="../../img/decorate/brand/g14.jpg" alt=""/>
                <img src="../../img/decorate/brand/g15.jpg" alt=""/>
                <img src="../../img/decorate/brand/g16.jpg" alt=""/>
            </div>
        </script>
        
        <script type="text/template" id="temp-tmpBrands">
            <div class="mol-wrap tmpBrands" molid="tmpBrands">
              <ul class="brand-list clearfix">
                <li class="jiabao">
                  <a href="#">
                    <img src="../../img/decorate/brand/devondale.jpg">
                  </a>
                </li>
                <li class="atm">
                  <a href="#">
                    <img src="../../img/decorate/brand/swisse.jpg">
                  </a>
                </li>
                <li class="krk">
                  <a href="#">
                    <img src="../../img/decorate/brand/niutrion.jpg">
                  </a>
                </li>
                <li class="xibao">
                  <a href="#">
                    <img src="../../img/decorate/brand/aptmail.jpg">
                  </a>
                </li>
                <li class="mym">
                  <a href="#">
                    <img src="../../img/decorate/brand/dgongji.jpg">
                  </a>
                </li>
                <li class="lltk">
                  <a href="#">
                    <img src="../../img/decorate/brand/dfangbs.jpg">
                  </a>
                </li>
                <li class="glian">
                  <a href="#">
                    <img src="../../img/decorate/brand/life.jpg">
                  </a>
                </li>
                <li class="salus">
                  <a href="#">
                    <img src="../../img/decorate/brand/kaohw.jpg">
                  </a>
                </li>
                <li class="banana nbd">
                  <a href="#">
                    <img src="../../img/decorate/brand/goon.jpg">
                  </a>
                </li>
                <li class="xiuxiu nbd">
                  <a href="#/brands/115">
                    <img src="../../img/decorate/brand/moony.jpg">
                  </a>
                </li>
                <li class="bbcns nbd">
                  <a href="#/brands/126">
                    <img src="../../img/decorate/brand/gerber.jpg">
                  </a>
                </li>
                <li class="medela nbd">
                  <a href="#/brands/182">
                    <img src="../../img/decorate/brand/brita.jpg">
                  </a>
                </li>
              </ul>
            </div>
        </script>

        <script type="text/template" id="temp-hd-category">
            <div class="mol-wrap hd-category" molid="hd-category">
                <div class="hd-category-one">
                    <img src="{imgsrc}" alt=""/>
                    <div class="wrap-r">
                        <h3>{name}</h3><P>{desc}</P>
                    </div>
                </div>
                <div class="hd-category-one">
                    <img src="{imgsrc2}" alt=""/>
                    <div class="wrap-r">
                        <h3>{name2}</h3><P>{desc2}</P>
                    </div>
                </div>
                <div class="hd-category-one">
                    <img src="{imgsrc3}" alt=""/>
                    <div class="wrap-r">
                        <h3>{name3}</h3><P>{desc3}</P>
                    </div>
                </div>
                <div class="hd-category-one">
                    <img src="{imgsrc4}" alt=""/>
                    <div class="wrap-r">
                        <h3>{name4}</h3><P>{desc4}</P>
                    </div>
                </div>
            </div>
        </script>
        <script type="text/template" id="temp-categoriesBar">
            <div class="mol-wrap hd-bar-categories" molid="categoriesBar">
                <div>顶部导航模块</div>
            </div>
        </script>

        <script type="text/template" id="temp-tmpCategory">
            <div class="mol-wrap tmpCategory" molid="tmpCategory">
                <div class="view-vt">
                  <dl class="cate-view clearfix">
                    <dt>
                    <div class="spt-orange">orange</div>
                    </dt>
                    <dd>
                      <div class="spt-rd">
                        rd
                      </div>
                      <a ng-href="{href1}">
                        <div class="cate-nf"></div>
                        <h4>{name1}</h4>
                      </a>
                    </dd>

                    <dt>
                    <div class="spt-orange">orange</div>
                    </dt>
                    <dd>
                      <div class="spt-rd">
                        rd
                      </div>
                      <a ng-href="{href2}">
                        <div class="cate-nk"></div>
                        <h4>{name2}</h4>
                      </a>
                    </dd>

                    <dt>
                      <div class="spt-orange">orange</div>
                    </dt>
                    <dd>
                      <div class="spt-rd">
                        rd
                      </div>
                      <a ng-href="{href3}">
                        <div class="cate-fs"></div>
                        <h4>{name3}</h4>
                      </a>
                    </dd>

                    <dt>
                    <div class="spt-orange">orange</div>
                    </dt>
                    <dd>
                      <div class="spt-rd">
                        rd
                      </div>
                      <a ng-href="{href4}">
                        <div class="cate-wy"></div>
                        <h4>{name4}</h4>
                      </a>
                    </dd>

                    <dt>
                    <div class="spt-orange">orange</div>
                    </dt>
                    <dd>
                      <div class="spt-rd">
                        rd
                      </div>
                      <a ng-href="{href5}">
                        <div class="cate-hl"></div>
                        <h4>{name5}</h4>
                      </a>
                    </dd>

                    <dt>
                    <div class="spt-orange">orange</div>
                    </dt>
                  </dl>
                </div>

                <div class="view-vt">
                  <dl class="cate-view-d">
                    <dd>
                      <a ng-href="{href6}">
                        <div class="cate-wj"></div>
                        <h4>{name6}</h4>
                      </a>
                    </dd>

                    <dd>
                      <a ng-href="{href7}">
                        <div class="cate-bjp"></div>
                        <h4>{name7}</h4>
                      </a>
                    </dd>

                    <dd>
                      <a ng-href="{href8}">
                        <div class="cate-sp"></div>
                        <h4>{name8}</h4>
                      </a>
                    </dd>

                    <dd>
                      <a ng-href="{href9}">
                        <div class="cate-rh"></div>
                        <h4>{name9}</h4>
                      </a>
                    </dd>

                    <dd>
                      <a ng-href="{href10}">
                        <div class="cate-qt"></div>
                        <h4>{name10}</h4>
                      </a>
                    </dd>
                  </dl>
                </div>
            </div>
        </script>
        
        <script type="text/template" id="temp-singleGood">
        <a class="mol-wrap" molid="singleGood" ng-href="{href}">
          <img src="{picPath}"  alt="">
          <!-- <p><u>{name}</u></p> -->
        </a>
        </script>

        <script type="text/template" id="temp-doubleGood">
        <div class="mol-wrap" molid="doubleGood">
            <a class="doubleGood-wrap-one"  ng-href="{href}">
              <img src="{picPath}"  alt="">
              <p><u>{goodname}</u></p>
              <i>￥{price}</i>
           </a>
            <a class="doubleGood-wrap-one"  ng-href="{href2}">
              <img src="{picPath2}"  alt="">
              <p><u>{goodname2}</u></p>
           </a>
        </div>
        </script>

        <script type="text/template" id="temp-slideBox">
            <a class="mol-wrap" molid="slideBox" ng-href="{href}">
                <img src="{imgsrc}" >
            </a>
        </script>
        
        <script type="text/template" id="temp-slideBoxShadow">
            <a class="mol-wrap" molid="slideBoxShadow" ng-href="{href}">
                <img src="{imgsrc}" >
            </a>
        </script>

        <script type="text/template" id="temp-singlePic">
        <a class="mol-wrap" molid="singlePic" ng-href="{href}">
          <img src="{imgsrc}" alt="">
          <!-- <p>{desc}</p> -->
        </a>
        </script>
        
        <script type="text/template" id="temp-singlePicDesc">
        <a class="mol-wrap" molid="singlePicDesc" ng-href="{href}">
          <img src="{imgsrc}" alt="">
          <p>{title}</p>
          <p>{desc}</p>
        </a>
        </script>

        <script type="text/template" id="temp-bannerPic">
            <a class="mol-wrap" molid="bannerPic" ng-href="{href}">
                <img src="{imgsrc}" alt="">
            </a>
        </script>

        <script type="text/template" id="temp-bb-category">
            <a class="mol-wrap" molid="bb-category">
                <img src="../../img/decorate/masonry.png" alt="">
            </a>
        </script>

        <script type="text/template" id="temp-line">
            <a class="mol-wrap" molid="line">
                  <div class="tpl-banner"><div class="sline">正常为1px</div></div>
            </a>
        </script>

        <script type="text/template" id="temp-doublePic">
        <div class="mol-wrap" molid="doublePic">
          <div class="doublePic-wrap-one">
            <img src="{imgsrc}" alt="">
            <p>{desc}</p>
          </div>
          <div class="doublePic-wrap-one">
            <img src="{imgsrc2}" alt="">
            <p>{desc2}</p>
          </div>
        </div>
        </script>

        <script type="text/template" id="temp-tb-category">
            <div class="mol-wrap" molid="tb-category">
                <div class="tb-category-wrap-one">
                    <img src="{imgsrc}" alt="">
                    <p>{desc}</p>
                </div>
                <div class="tb-category-wrap-one">
                    <img src="{imgsrc2}" alt="">
                    <p>{desc2}</p>
                </div>
                <div class="tb-category-wrap-one">
                    <img src="{imgsrc3}" alt="">
                    <p>{desc3}</p>
                </div>
                <div class="tb-category-wrap-one">
                    <img src="{imgsrc4}" alt="">
                    <p>{desc4}</p>
                </div>
            </div>
        </script>

        <script type="text/template" id="temp-wordPic">
        <div class="mol-wrap" molid="wordPic">
          <p style="color:{color}">{desc}</p>
          <img src="{imgsrc}" alt="">
        </div>
        </script>

        <script type="text/template" id="temp-titleOnly">
           <div class="mol-wrap" molid="titleOnly" ng-href="{href}">
               <div class="brand-title"><div style="background:{color}"></div><h3>{title}</h3></div>
           </div>
        </script>
        
        <script type="text/template" id="temp-title2Only">
           <div class="mol-wrap" molid="title2Only" ng-href="{href}">
             <div class="g-category"><div class="gc-item diver">{title}</div></div>
           </div>
        </script>
        
        <script type="text/template" id="temp-tmpTitleOnly">
           <div class="mol-wrap tmpTitleOnly" molid="tmpTitleOnly" ng-href="{href}">
           	<div class="floor" data="tmpTitleOnlyInfo3">
           	<span class="floor-tit tit-left">*</span>
           	<h4 class="floor-t">{title} <span>{sub_title}</span></h4>
           	<span class="floor-tit tit-right">*</span>
           </div>
           </div>
        </script>

        <script type="text/template" id="temp-wordOnly">
           <a class="mol-wrap" molid="wordOnly" ng-href="{href}">
               <p class="wordOnly">{desc}</p>
           </a>
        </script>

      <script type="text/template" id="temp-tmpWelcome">
        <div class="mol-wrap tmpWelcome" molid="tmpWelcome">
          <div class="tem-who-wrap box-ct">
            <dl>
              <dt>
                <img src="{pic}"
                     style="height:1.3rem;width:1.3rem;">
              </dt>
              <dd>
                <h4 ng-bind="data.name" class="ng-binding" >{name}</h4>
              </dd>
            </dl>
          </div>
        </div>
      </script>

        <script type="text/template" id="temp-contract">
           <a class="mol-wrap" molid="contract" ng-href="{href}">
               <img src="../../img/decorate/tel.png"  alt=""/><b>{tel}</b>
               <img src="../../img/decorate/wechat.png"  alt=""/><b>{wechat}</b>
           </a>
        </script>

        <script type="text/template" id="temp-singleGoodList">
           <div class="mol-wrap" molid="singleGoodList">
                {content}
                <!--<h4>宝贝列表</h4>-->
                <!--<p>每行一个,依次排列,请点击为其选择宝贝.</p>-->
           </div>
        </script>

        <script type="text/template" id="temp-doubleGoodList">
           <div class="mol-wrap" molid="doubleGoodList">
               {content}
               <!--<h4>宝贝列表</h4>-->
               <!--<p>每行两个,依次排列,请点击为其选择宝贝.</p>-->
           </div>
        </script>

        <script type="text/template" id="temp-good-cell">
            <a class="good-cell" href="javascript:void(0);"  title="{name}">
                <img src="{picPath}" alt="" class=""/>
                <p class="good-name">{name}</p>
                <p class="good-price">￥{price}</p>
                <p class="soldoff">已失效</p>
            </a>
        </script>

        <script type="text/template" id="temp-link-good-cell">
            <a class="link-goods-one" title="{name}">
                <img src="{imgsrc}" alt="{name}"/>
                <p>{name}</p>
                <b>￥{price}</b>
                <button class="btn btn-sm btn-default link-check-goods">选此链接</button>
            </a>
        </script>

        <script type="text/template" id="temp-link-item-cell">
            <a class="category-cell">
                <img src="{picPath}"/>
                <p>{name}</p>
            </a>
        </script>


    </div>

    <!-- 设置模板的模板 -->
    <div>
        <script type="text/template" id="temp-ctrl-tuan">
            <div class="mol-ctrl-wrap" ctrlid="tuan">
              <h2>10点团/14点团/20点团</h2>

              <hr><label>10点团活动ID：</label>
              <select class="form-control input-sm" mapid="gp1" >
							<option value="2016">请选择</option>
							<#list activitiesList! as act>
							<option value="${act.id}">${act.name}</option>
							</#list>
			  </select>
              <br><label>14点团活动ID：</label>
              <select class="form-control input-sm" mapid="gp2" >
							<option value="2099" >请选择</option>
							<#list activitiesList! as act>
							<option value="${act.id}">${act.name}</option>
							</#list>
			  </select>
			  <br><label>20点团活动ID：</label>
              <select class="form-control input-sm" mapid="gp3" >
							<option value="2091" >请选择</option>
							<#list activitiesList! as act>
							<option value="${act.id}">${act.name}</option>
							</#list>
			  </select>
            </div>
        </script>
      <script type="text/template" id="temp-ctrl-recommended2">
            <div class="mol-ctrl-wrap" ctrlid="recommended2">
              <h2>大师推荐·简</h2>
              <br/>
              <div>
                <label>
                  <input type="checkbox" mapid="subcheck" /> 显示商品
                </label>
              </div>


              <hr><label>推荐ID：</label>
              <div class="masterRcdComp">
              <select class="form-control input-sm" mapid="masterrcd" style="width:94%;" >
							<option value="2018" >请选择</option>
							<#list groupList! as g>
							<option value="${g.id}">${g.name}</option>
							</#list>
			  </select><i class = "deleteMasterRcd" style="
    position: relative;
    top: -26px;
    right: -10px;
    display: block;
    margin-left:93%;
    width: 25px;
    line-height: 20px;
    background: #fff;
    border: 2px solid gray;
    border-radius: 50%;
    text-align: center;
    cursor: pointer;">x</i></div>

			  
			  <button class="btn" id="createMasterRcd">新增</button>
            </div>
        </script>
        <script type="text/template" id="temp-ctrl-today">
            <div class="mol-ctrl-wrap" ctrlid="today">
              <h2>今日上新</h2>

              <hr><label>上新ID：</label>
              <select class="form-control input-sm" mapid="todays" >
							<option value="2018" >请选择</option>
							<#list groupList! as g>
							<option value="${g.id}">${g.name}</option>
							</#list>
			  </select>
            </div>
        </script>
        
        <script type="text/template" id="temp-ctrl-tb-features">
            <div class="mol-ctrl-wrap" ctrlid="tb-features">
                <h2>优势宣传</h2>
                <hr><b>此模块不可编辑</b>
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-bb-features">
            <div class="mol-ctrl-wrap" ctrlid="bb-features">
                <h2>优势宣传</h2>
                <hr><b>此模块不可编辑</b>
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-hd-features">
            <div class="mol-ctrl-wrap" ctrlid="hd-features">
                <h2>优势宣传</h2>
                <hr><b>此模块不可编辑</b>
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-hd-brands">
            <div class="mol-ctrl-wrap" ctrlid="hd-brands">
                <h2>热门品牌</h2>
                <hr><b>此模块不可编辑</b>
            </div>
        </script>
        
        <script type="text/template" id="temp-ctrl-tmpBrands">
            <div class="mol-ctrl-wrap" ctrlid="tmpBrands">
                <h2>热门品牌</h2>
                <hr><b>此模块不可编辑</b>
            </div>
        </script>
        
        <script type="text/template" id="temp-ctrl-tmpWelcome">
            <div class="mol-ctrl-wrap" ctrlid="tmpWelcome">
                <h2>欢迎光临</h2>
                <hr><b>此模块不可编辑</b>
            </div>
        </script>
        
        <script type="text/template" id="temp-ctrl-tmpCategory">
            <div class="mol-ctrl-wrap" ctrlid="tmpCategory">
                <h2>热门分类</h2>
                <hr><b>此模块不可编辑</b>
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-hd-category">
            <div class="mol-ctrl-wrap" ctrlid="hd-category">
                <h2>热门分类</h2>
                <div>
                    <label class="hide">分类图片1：</label><input type="text"   mapid="imgsrc"     placeholder="自定义分类2图片网址" class="hide category-img">
                    <label class="hide">分类类别1：</label><input type="text"   mapid="href"       placeholder="自定义分类类别" class="hide">
                    <hr><label>分类标题1：</label><input type="text"   mapid="name"      placeholder="自定义分类标题">
                    <br><label>分类描述1：</label><input type="text"   mapid="desc"      placeholder="自定义分类描述" maxlength="9"  >
                    <button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal" only-item>选择分类</button>
                </div>

                <div>
                    <label class="hide">分类图片2：</label><input type="text"   mapid="imgsrc2"     placeholder="自定义分类2图片网址" class="hide category-img">
                    <label class="hide">分类类别2：</label><input type="text"   mapid="href2"       placeholder="自定义分类2类别" class="hide">
                    <hr><label>分类标题2：</label><input type="text"   mapid="name2"      placeholder="自定义分类2标题">
                    <br><label>分类描述2：</label><input type="text"   mapid="desc2"      placeholder="自定义分类2描述" maxlength="9" >
                    <button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal" only-item>选择分类</button>
                </div>

                <div>
                    <label class="hide">分类图片3：</label><input type="text"   mapid="imgsrc3"     placeholder="自定义分类3图片网址" class="hide category-img">
                    <label class="hide">分类类别3：</label><input type="text"   mapid="href3"       placeholder="自定义分类3类别" class="hide">
                    <hr><label>分类标题3：</label><input type="text"   mapid="name3"      placeholder="自定义分类3标题">
                    <br><label>分类描述3：</label><input type="text"   mapid="desc3"      placeholder="自定义分类3描述" maxlength="9" >
                    <button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal" only-item>选择分类</button>
                </div>

                <div>
                    <label class="hide">分类图片4：</label><input type="text"   mapid="imgsrc4"     placeholder="自定义分类4图片网址" class="hide category-img">
                    <label class="hide">分类类别4：</label><input type="text"   mapid="href4"       placeholder="自定义分类4类别" class="hide">
                    <hr><label>分类标题4：</label><input type="text"   mapid="name4"      placeholder="自定义分类4标题">
                    <br><label>分类描述4：</label><input type="text"   mapid="desc4"      placeholder="自定义分类4描述" maxlength="9">
                    <button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal" only-item>选择分类</button>
                </div>
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-categoriesBar">
            <div class="mol-ctrl-wrap" ctrlid="categoriesBar">
              <h2>顶部分类</h2>
              <div>
                  <label>名称：</label><input type="text" mapid="title" placeholder="自定义导航名称">
                  <br><label>链接：</label><input type="text" mapid="href" placeholder="自定义链接">
              </div>
              <div>
                <label>名称：</label><input type="text" mapid="title" placeholder="自定义导航名称">
                <br><label>链接：</label><input type="text" mapid="href" placeholder="自定义链接">
              </div>
              <div>
                <label>名称：</label><input type="text" mapid="title" placeholder="自定义导航名称">
                <br><label>链接：</label><input type="text" mapid="href" placeholder="自定义链接">
              </div>
              <div>
                <label>名称：</label><input type="text" mapid="title" placeholder="自定义导航名称">
                <br><label>链接：</label><input type="text" mapid="href" placeholder="自定义链接">
              </div>
              <div>
                <label>名称：</label><input type="text" mapid="title" placeholder="自定义导航名称">
                <br><label>链接：</label><input type="text" mapid="href" placeholder="自定义链接">
              </div>
              <div>
                <label>名称：</label><input type="text" mapid="title" placeholder="自定义导航名称">
                <br><label>链接：</label><input type="text" mapid="href" placeholder="自定义链接">
              </div>
              <div>
                <label>名称：</label><input type="text" mapid="title" placeholder="自定义导航名称">
                <br><label>链接：</label><input type="text" mapid="href" placeholder="自定义链接">
              </div>
              <div>
                <label>名称：</label><input type="text" mapid="title" placeholder="自定义导航名称">
                <br><label>链接：</label><input type="text" mapid="href" placeholder="自定义链接">
              </div>
              <div>
                <label>名称：</label><input type="text" mapid="title" placeholder="自定义导航名称">
                <br><label>链接：</label><input type="text" mapid="href" placeholder="自定义链接">
              </div>
              <div>
                <label>名称：</label><input type="text" mapid="title" placeholder="自定义导航名称">
                <br><label>链接：</label><input type="text" mapid="href" placeholder="自定义链接">
              </div>
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-tb-category">
            <div class="mol-ctrl-wrap" ctrlid="tb-category">
                <h2>宝贝类别</h2>
                <!--<hr><b>此模块不可编辑</b>-->
                <div>
                    <hr><label>跳转链接1：</label><input type="text"   mapid="href"      placeholder="自定义链接转向地址" readonly>
                    <br><label>类别图片1：</label><input type="text"   mapid="imgsrc"    placeholder="自定义图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                    <br><label>类别文字1：</label><input type="text"   mapid="desc"      placeholder="自定义图片文字描述"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选择类别</button>
                </div>
                <div>
                    <hr><label>跳转链接2：</label><input type="text"   mapid="href2"      placeholder="自定义链接转向地址" readonly>
                    <br><label>类别图片2：</label><input type="text"   mapid="imgsrc2"    placeholder="自定义图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                    <br><label>类别文字2：</label><input type="text"   mapid="desc2"      placeholder="自定义图片文字描述"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选择类别</button>
                </div>
                <div>
                    <hr><label>跳转链接3：</label><input type="text"   mapid="href3"      placeholder="自定义链接转向地址" readonly>
                    <br><label>类别图片3：</label><input type="text"   mapid="imgsrc3"    placeholder="自定义图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                    <br><label>类别文字4：</label><input type="text"   mapid="desc3"      placeholder="自定义图片文字描述"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选择类别</button>
                </div>
                <div>
                    <hr><label>跳转链接4：</label><input type="text"   mapid="href4"      placeholder="自定义链接转向地址" readonly>
                    <br><label>类别图片4：</label><input type="text"   mapid="imgsrc4"    placeholder="自定义图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                    <br><label>类别文字4：</label><input type="text"   mapid="desc4"      placeholder="自定义图片文字描述"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选择类别</button>
                </div>
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-bb-category">
            <div class="mol-ctrl-wrap" ctrlid="bb-category">
                <h2>栏目分类</h2>
                <hr><b>此模块不可编辑</b>
            </div>
        </script>
        
        <script type="text/template" id="temp-ctrl-line">
            <div class="mol-ctrl-wrap" ctrlid="line">
                <h2>分割线</h2>
                <hr><b>此模块不可编辑</b>
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-singleGood">
            <div class="mol-ctrl-wrap" ctrlid="singleGood" role="form">
                <h2>单个宝贝(自定义)</h2>
                <hr><label>图片地址：</label><input type="text"  mapid="picPath" placeholder="输入宝贝图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                <br><label>宝贝链接：</label><input type="text"  mapid="href"    placeholder="输入宝贝链接地址"><!--<button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选取链接</button>-->
                <!-- <br><label>宝贝名称：</label><input type="text"   mapid="name"   placeholder="输入宝贝名称"> -->
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-doubleGood">
            <div class="mol-ctrl-wrap" ctrlid="doubleGood">
                <h2>一行双宝贝(自定义)</h2>
                <hr><label>图片地址1：</label><input type="text"   mapid="picPath"     placeholder="输入宝贝1图片地址">
                <br><label>宝贝链接1：</label><input type="text"   mapid="href"       placeholder="输入宝贝1链接地址">
                <br><label>宝贝名称1：</label><input type="text"   mapid="goodname"   placeholder="输入宝贝1名称">
                <br><label>宝贝价格1：</label><input type="number" mapid="price"      placeholder="输入宝贝1价格(纯数字,可精确到2位小数)">
                <br><hr>
                <br><label>图片地址2：</label><input type="text"   mapid="picPath2"    placeholder="输入宝贝2图片地址">
                <br><label>宝贝链接2：</label><input type="text"   mapid="href2"      placeholder="输入宝贝2链接地址">
                <br><label>宝贝名称2：</label><input type="text"   mapid="goodname2"  placeholder="输入宝贝2名称">
                <br><label>宝贝价格2：</label><input type="number" mapid="price2"     placeholder="输入宝贝2价格(纯数字,可精确到2位小数)">
                
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-wordPic">
           <div class="mol-ctrl-wrap" ctrlid="wordPic">
               <h2>左文右图(自定义)</h2>

               <hr><label>文字描述：</label><textarea   mapid="desc"    placeholder="输入文字描述"></textarea>
               <br><label>文字颜色：</label><input type="color"   mapid="color">
               <br><label>图片链接：</label><input type="text"   mapid="imgsrc"     placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
               <!--<form class="img-up-form">-->
                   <!--<label>图片上传：</label>-->
                   <!--<input type="file"   mapid="img-up"   name='files' class="img-up-file"   accept="image/*" maxLength="1"/>-->
                   <!--<input type="submit" value=" 开始上传 ">-->
                   <!--<p>选择图片不超过200k,左侧色调尽量统一,作为文字背景</p>-->
               <!--</form>-->
           </div>
        </script>

        <script type="text/template" id="temp-ctrl-slideBox">
            <div class="mol-ctrl-wrap" ctrlid="slideBox">
                <h2>轮播图(自定义)</h2>
                <div>
                    <hr><label>图片链接1：</label><input type="text"   mapid="imgsrc"     placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                    <br><label>跳转链接1：</label><input type="text"   mapid="href"       placeholder="输入链接转向地址"><!--<button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选取链接</button>-->
                </div>
                <div>
                    <hr><label>图片链接2：</label><input type="text"   mapid="imgsrc2"     placeholder="输入图片2地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                    <br><label>跳转链接2：</label><input type="text"   mapid="href2"       placeholder="输入链接2转向地址"><!--<button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选取链接</button>-->
                </div>
                <div>
                    <hr><label>图片链接3：</label><input type="text"   mapid="imgsrc3"     placeholder="输入图片3地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                    <br><label>跳转链接3：</label><input type="text"   mapid="href3"       placeholder="输入链接3转向地址"><!--<button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选取链接</button>-->
                </div>

                <!--hr>
                <form class="img-up-form" enctype="multipart/form-data">
                    <label>上传本地图片:</label>
                    <input type="file"   mapid="img-up"   name='upload' class="img-up-file" multiple="true"  accept="image/*" />
                    <input type="submit" value=" 开始上传 ">
                    <p>最多可以选择3张图片(比例一致),单张不超过200k。</p>
                </form-->
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-singlePic" >
            <div class="mol-ctrl-wrap" ctrlid="singlePic">
                <h2>焦点图(自定义)</h2>
                <br><label>图片链接：</label><input type="text"   mapid="imgsrc"     placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                <br><label>跳转链接：</label><input type="text"   mapid="href"       placeholder="输入链接转向地址"><!--<button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选取链接</button>-->
                <!--form class="img-up-form" enctype="multipart/form-data">
                    <label>图片上传：</label>
                    <input type="file"   mapid="img-up"   name='files' class="img-up-file"  accept="image/*" maxLength="1"/>
                    <input type="submit" value=" 开始上传 ">
                    <p>图片大小不超过200k</p>
                </form-->
                <!--form action="/goods/appUploadShopPic" enctype="multipart/form-data" method="post" target="upiframe">
                    <input type="file"     name="upload">
                    <input type="submit"   value="确认上传" />
                </form>
                <iframe id="upiframe" name="upiframe"></iframe-->
            </div>
        </script>
        
        <script type="text/template" id="temp-ctrl-singlePicDesc" >
            <div class="mol-ctrl-wrap" ctrlid="singlePicDesc">
                <h2>焦点图(自定义)</h2>
                <hr><label>图片标题：</label><input type="text"   mapid="title"       placeholder="输入图片标题">
                <br><label>文字描述：</label><input type="text"   mapid="desc"       placeholder="输入图片文字描述">
                <br><label>图片链接：</label><input type="text"   mapid="imgsrc"     placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                <br><label>跳转链接：</label><input type="text"   mapid="href"       placeholder="输入链接转向地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选取链接</button>
                <!--form class="img-up-form" enctype="multipart/form-data">
                    <label>图片上传：</label>
                    <input type="file"   mapid="img-up"   name='files' class="img-up-file"  accept="image/*" maxLength="1"/>
                    <input type="submit" value=" 开始上传 ">
                    <p>图片大小不超过200k</p>
                </form-->
                <!--form action="/goods/appUploadShopPic" enctype="multipart/form-data" method="post" target="upiframe">
                    <input type="file"     name="upload">
                    <input type="submit"   value="确认上传" />
                </form>
                <iframe id="upiframe" name="upiframe"></iframe-->
            </div>
        </script>

        <script type="text/template" id="temp-ctrl-bannerPic">
            <div class="mol-ctrl-wrap" ctrlid="bannerPic">
                <h2>banner图(自定义)</h2>
                <hr><label>图片链接：</label><input type="text"   mapid="imgsrc" placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                <br><label>跳转链接：</label><input type="text"   mapid="href"   placeholder="输入链接转向地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选取链接</button>

                <!--form class="img-up-form" enctype="multipart/form-data">
                    <label>图片上传：</label>
                    <input type="file"   mapid="img-up"   name='files' class="img-up-file"  accept="image/*" maxLength="1"/>
                    <input type="submit" value=" 开始上传 ">
                    <p>图片大小不超过200k</p>
                </form-->
            </div>
        </script>

        <!--script type="text/template" id="temp-ctrl-doublePic">
           <div class="mol-ctrl-wrap" ctrlid="doublePic">
               <h2>一行双图(自定义)</h2>
               <hr><label>图片地址：</label><input type="text"   mapid="imgsrc"     placeholder="输入图片地址">
               <br><label>跳转链接：</label><input type="text"   mapid="href"       placeholder="输入链接转向地址">
               <br><label>文字描述：</label><input type="text"   mapid="desc"       placeholder="输入图片文字描述">
               <br><hr>
               <br><label>图片地址2：</label><input type="text"   mapid="imgsrc2"    placeholder="输入图片地址">
               <br><label>跳转链接2：</label><input type="text"   mapid="href2"      placeholder="输入链接转向地址">
               <br><label>文字描述2：</label><input type="text"   mapid="desc2"      placeholder="输入图片文字描述">
               <form class="img-up-form">
                   <label>图片上传：</label>
                   <input type="file"   mapid="img-up"   name='files' class="img-up-file" multiple="true"  accept="image/*" maxLength="1"/>
                   <input type="submit" value=" 开始上传 ">
                   <p>可以一次选择多张图片,单张不超过200k,比例一致</p>
               </form>
           </div>
        </script-->


        <script type="text/template" id="temp-ctrl-wordOnly">
           <div class="mol-ctrl-wrap" ctrlid="wordOnly">
               <h2>纯宣传文字(自定义)</h2>
               <hr><label>文字描述：</label>
               <textarea   mapid="desc"    placeholder="输入文字描述"></textarea>
           </div>
        </script>

        <script type="text/template" id="temp-ctrl-titleOnly">
           <div class="mol-ctrl-wrap" ctrlid="titleOnly">
               <h2>标题模块(自定义)</h2>
               <hr>
               <label>标题文字：</label>
               <input type="text"    mapid="title"    class="form-control "  placeholder="输入标题文字">
				<!--	
               <br>
               <label>色块颜色：</label>
               <input type="color"   mapid="color" value="#ed3577">
               -->

               <!--<div class="input-group">-->
                   <!--<label class="input-group-addon">标题文字：</label>-->
                   <!--<input type="text" class="form-control" placeholder="twitterhandle">-->
                   <!--<a class="btn  btn-empty-blue input-group-btn">选择链接</a>-->
               <!--</div>-->
           </div>

        </script>
        
                <script type="text/template" id="temp-ctrl-title2Only">
           <div class="mol-ctrl-wrap" ctrlid="title2Only">
               <h2>标题模块(自定义)</h2>
               <hr>
               <label>标题文字：</label>
               <input type="text"    mapid="title"    class="form-control "  placeholder="输入标题文字">
           </div>

        </script>

        <script type="text/template" id="temp-ctrl-tmpTitleOnly">
           <div class="mol-ctrl-wrap" ctrlid="tmpTitleOnly">
               <h2>标题模块(自定义)</h2>
               <hr>
               <label>标题文字：</label>
               <input type="text"    mapid="title"    class="form-control "  placeholder="输入标题文字">

               <br>
				<label>子标题文字：</label>
               <input type="text"    mapid="sub_title"    class="form-control "  placeholder="输入子标题文字">
           </div>

        </script>

        <script type="text/template" id="temp-ctrl-contract">
           <div class="mol-ctrl-wrap" ctrlid="contract">
               <h2>联系模块</h2>
               <hr><label>输入微信账号：</label><input type="text"   mapid="wechat"   placeholder="输入微信账号">
               <hr><label>输入电话号码：</label><input type="text"   mapid="tel"       placeholder="输入电话账号">
           </div>
        </script>

        <script type="text/template" id="temp-ctrl-singleGoodList">
           <div class="mol-ctrl-wrap" ctrlid="singleGoodList">
               <h2>宝贝列表(每行一个)</h2><hr>
               <div class="show-checked-good"></div>
               <br><button class="btn btn-danger show-goods-list" data-toggle="modal" data-target="#goods-modal" >选择宝贝</button><hr>
               <div class="ctrlArea-goodsChecked-wrap"></div>
               <!--<button class="btn btn-success to-check-good">确定</button>-->
           </div>
        </script>

        <script type="text/template" id="temp-ctrl-doubleGoodList">
           <div class="mol-ctrl-wrap" ctrlid="doubleGoodList">
               <h2>宝贝列表(每行两个)</h2><hr>
               <div class="show-checked-good"></div>
               <br><button class="btn btn-danger show-goods-list" data-toggle="modal" data-target="#goods-modal" >选择宝贝</button><hr>
               <div class="ctrlArea-goodsChecked-wrap"></div>
               <!--<button class="btn btn-success to-check-good2">确定</button>-->
               
               <br><label>更多组id：</label><input type="text"   mapid="group_id">
           </div>
        </script>

      <script type="text/template" id="temp-ctrl-recommended">
           <div class="mol-ctrl-wrap" ctrlid="recommended">
             <h2>大师推荐</h2>
             <div>
               <hr><label>主标题1：</label><input type="text"   mapid="name"   placeholder="主标题">
               <br><label>副标题1：</label><input type="text"   mapid="sub"   placeholder="副标题">
               <br><label>图片链接1：</label><input type="text"   mapid="imgsrc"     placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
               <br><label>跳转链接1：</label><input type="text"   mapid="href"       placeholder="输入链接转向地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选取链接</button>
             </div>
             <div>
               <hr><label>主标题2：</label><input type="text"   mapid="name"   placeholder="主标题">
               <br><label>副标题2：</label><input type="text"   mapid="sub"   placeholder="副标题">
               <br><label>图片链接2：</label><input type="text"   mapid="imgsrc"     placeholder="输入图片2地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
               <br><label>跳转链接2：</label><input type="text"   mapid="href"       placeholder="输入链接2转向地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#links-modal">选取链接</button>
             </div>
           </div>
        </script>

        <script type="text/template" id="temp-ctrl-categories">
             <div class="mol-ctrl-wrap" ctrlid="categories">
               <h2>分类</h2>
               <hr>
               <label>类目标题：</label><input type="text"   mapid="name"   placeholder="类目标题">
               <div class="groups">
                 <div class="group-num">子类目 <b>1</b></div>
                 <label>类目图片：</label><input type="text" mapid="imgsrc" placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                 <br><label>类目链接：</label><input type="text" mapid="href" placeholder="输入链接转向地址">
               </div>
               <div class="groups">
                 <div class="group-num">子类目 <b>2</b></div>
                 <label>类目图片：</label><input type="text" mapid="imgsrc" placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                 <br><label>类目链接：</label><input type="text" mapid="href" placeholder="输入链接转向地址">
               </div>
               <div class="groups">
                 <div class="group-num">子类目 <b>3</b></div>
                 <label>类目图片：</label><input type="text" mapid="imgsrc" placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                 <br><label>类目链接：</label><input type="text" mapid="href" placeholder="输入链接转向地址">
               </div>
               <div class="groups">
                 <div class="group-num">子类目 <b>4</b></div>
                 <label>类目图片：</label><input type="text" mapid="imgsrc" placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                 <br><label>类目链接：</label><input type="text" mapid="href" placeholder="输入链接转向地址">
               </div>
               <div class="groups">
                 <div class="group-num">子类目 <b>5</b></div>
                 <label>类目图片：</label><input type="text" mapid="imgsrc" placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                 <br><label>类目链接：</label><input type="text" mapid="href" placeholder="输入链接转向地址">
               </div>
               <div class="groups">
                 <div class="group-num">子类目 <b>6</b></div>
                 <label>类目图片：</label><input type="text" mapid="imgsrc" placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                 <br><label>类目链接：</label><input type="text" mapid="href" placeholder="输入链接转向地址">
               </div>
               <div class="groups">
                 <div class="group-num">子类目 <b>7</b></div>
                 <label>类目图片：</label><input type="text" mapid="imgsrc" placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                 <br><label>类目链接：</label><input type="text" mapid="href" placeholder="输入链接转向地址">
               </div>
               <div class="groups">
                 <div class="group-num">子类目 <b>8</b></div>
                 <label>类目图片：</label><input type="text" mapid="imgsrc" placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                 <br><label>类目链接：</label><input type="text" mapid="href" placeholder="输入链接转向地址">
               </div>
               <div class="groups">
                 <div class="group-num">子类目 <b>9</b></div>
                 <label>类目图片：</label><input type="text" mapid="imgsrc" placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                 <br><label>类目链接：</label><input type="text" mapid="href" placeholder="输入链接转向地址">
               </div>
               <div class="groups">
                 <div class="group-num">子类目 <b>10</b></div>
                 <label>类目图片：</label><input type="text" mapid="imgsrc" placeholder="输入图片地址"><button class="btn btn-sm btn-empty-blue" data-toggle="modal" data-target="#imgs-modal">选取图片</button>
                 <br><label>类目链接：</label><input type="text" mapid="href" placeholder="输入链接转向地址">
               </div>
             </div>
          </script>

    </div>
    <div class="mask-main"></div>
    <div id="loading"></div>

    <script>
        window.wechatAccount = '${(seller.wechat)!}';
        window.telphoneAccount = '${(seller.mobile)!}';
        window.shopName = '${(currentUser.shopName)!}';
		window.avatar = '${(currentUser.avatar)!}';
        <#if checkedGoods?has_content>
        window.indexCheckedGoods = ${checkedGoods};
        <#else>
        window.indexCheckedGoods = '';
        </#if>
    </script>
    <link rel="stylesheet" href="${contextPath}/assets/lib/css/bootstrap.min.css">
    <script src="${contextPath}/assets/lib/js/bootstrap.min.js"></script>
    <script src="${contextPath}/assets/js/decorate.js?v=1.0"></script>
    <script>
      $(document).ready(function() {
        init_current=window.init_current||function(){return;};
        bootAlert=window.bootAlert||function(){return;};
        <#if decoration??>
        <#if (decoration.content)??>
        var data = ${(decoration.content)!};
        <#else>
        var data = [];
        </#if>
        //console.info(data);
        init_current(data);
        </#if>
      })
    </script>
</body>
</html>
