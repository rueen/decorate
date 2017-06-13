<!-- 店铺装修管理	-->
<!-- BEGIN THEME STYLES -->
<link href="${request.contextPath}/assets/lib/css/bootstrap-editable.css" rel="stylesheet" type="text/css"/>

<!-- END THEME STYLES -->
<!-- BEGIN PAGE CONTENT-->

<div class="row">
	<div class="col-md-12">
		<div class="hd-ui-wrap">
			<div style= "background:#E7E7EB;margin-bottom : 29px;">
                 <label style= "font-size:21px;padding:0 120px 0 30px;;line-height: 63px;">商城首页</label>   
                 
                 
                  <#if "${(sign_status!)}"=="1">
                 <a href="javascript:;" id = "copyUrl">复制链接</a>
                 &nbsp;&nbsp;&nbsp;
                 <#else>
                 <a href="javascript:;"  class="disRowPromotion" >复制链接</a>
                   &nbsp;&nbsp;&nbsp;
				 </#if>
				 
				   <#if "${(sign_status!)}"=="1">
                 <a href="javascript:;" data-toggle="popover"  class="promotion">
									二维码</a>
						 <#else>
						 	<a href="javascript:;"  class="disRowPromotion" >二维码</a>		
						 </#if>			
									
			                    </div>
			                    	
			                    
			                    
			<div class="hd-table-wrap">
			<form class="form-inline" id="decorateListForm" method="post">
				<input type="hidden" name="pricemarkup" />
				<table class="table">
					<thead>
						<tr>
						    <th  class="cell-7 text-center">
								   ID
							</th>
							<th  class="cell-20 text-center">
									页面名称
							</th>
							<th class="cell-20 text-center">更新时间</th>
							<th class="cell-20 text-center">页面地址</th>
							<th class="cell-30 text-center">操作</th>
						</tr>
					</thead>
					<tbody>
					<!--LIST START-->
					<#list decorationList! as d>
						<tr>
						    <td class=" text-center">
								<p><span>${d.id!''}</span></p>
							</td>
							<td class="name text-center">
								<p><span>${d.name!''}</span></p>
							</td>
							<td class="time text-center">
								<span>${(d.updatetime?datetime)!}</span>
							</td>
							
							<td class="option text-center">
								<p>
									 <#if "${(sign_status!)}"=="1">
									<a href="javascript:;" data-toggle="popover" data-id="${d.id}" class="rowPromotion">
									前往</a>
									 <#else>
						 <a href="javascript:;"  class="disRowPromotion" >
									前往</a>
									</#if>
								</p>
							</td>
							
							<td class="option text-center">
								<p>
									<a href="${request.contextPath}/decorate/index?id=${d.id}" target="_blank" >
									编辑</a>
									<span>-</span>
									<#if "${(d.isIndex!)}"=="1">
								      <span>商城首页</span>
									<#elseif "${(d.isIndex!)}"=="2">
									  <span>商品页</span>
									<#else>
									<a href="${request.contextPath}/decorate/remove?id=${d.id}" data-confirm="是否要删除该页面？？"
										data-remote="true" data-type="json" data-method="post" data-success="removeCallback">
									删除</a>
									<span>-</span>
									<a href="${request.contextPath}/decorate/setIndex?id=${d.id}" data-confirm="是否要设置该页面为首页？？"
										data-remote="true" data-type="json" data-method="post" data-success="removeCallback">
									设为首页</a>
									<span>-</span>
									<a href="${request.contextPath}/decorate/setGoodsPage?id=${d.id}" data-confirm="是否要设置该页面为商品页？？"
										data-remote="true" data-type="json" data-method="post" data-success="removeCallback">
									设为商品页</a>
									</#if>
									
									
								</p>
							</td>
						</tr>
					</#list>
					<!--LIST END-->	
					</tbody>
					<tfoot>
						<td colspan="10">
							<a href="${request.contextPath}/decorate/index" target="_blank" class="btn btn-primary" id="createPage"><i class="fa fa-plus"></i>&nbsp;新建页面</a>
 
						</td>
					</tfoot>
				</table>
			</form>	
			</div>
			<div class="clearfix">
          	<@hd.pagination ajaxTarget="mainPage" />
        	</div>
		</div>
	</div>
</div>
                             <div class="modal metro " id="popDiv" tabindex="-1" data-width="400" style="display:none">
									    <div class="modal-dialog modal-md">
									    <div class="modal-content">
                                         
                                             <div align="center">
                                                                                                                                                                 对不起，该功能暂时不对未签约用户开放
                                                  </div>
                                         </div>
                                         </div>
                                     </div>
									
<iframe id="downloadFrame" frameborder="0" border="0" name="downloadFrame" scrolling="no" class="hide"></iframe>
<script src="${request.contextPath}/assets/lib/js/jquery.zclip.min.js" type="text/javascript"></script>
<script src="${request.contextPath}/assets/lib/js/bootstrap-editable.min.js" type="text/javascript"></script>
<script src="${request.contextPath}/assets/lib/js/jquery.form.js" type="text/javascript"></script>
<div id="date-demo" class="hide">
	<div class="right-slider">
		<div class="text-center">
            <a href="" target="_blank" id="goodsUrl">
			   <img class="loading" src=""
			     width="190" height="190" id="shopQRCodeImg">
		    </a>	
			<p>
				扫码后直接访问页面
			</p>
			<div class="clearfix links">
				<a class="pull-left" href="javascript:;" id="downloadQRCode" data-id="">下载二维码</a>
				<a class="pull-right" href="javascript:;" id="copyURL" >复制链接</a>
			</div>

<script>			
$('#downloadQRCode').click(function() {
	
	if($(this).attr('data-id') != ""){
	   $('#downloadFrame').attr('src', getContextPath() + '/shop/downloadDecorateQRCode?id='+$(this).attr('data-id'));
	}else{
	   $('#downloadFrame').attr('src', getContextPath() + '/shop/downloadQRCode')
	}
	
});
//$('#copyURL').click(function() {	});
 $('#copyURL').zclip({ 
	path: "${request.contextPath}/assets/lib/js/ZeroClipboard.swf", 
	copy: function(){
	    return "http://${shop.domain!}.${appSettings.shopDomainPost!}/#/pages/show/"+$(this).attr('data-id'); 
	}	 
 });

 

</script>
		</div>
	</div>
</div>

<script>
$(function(){
Metronic.init(); // init metronic core components
		Layout.init(); // init current layout
		Demo.init(); // init demo features
    

})

function removeCallback(reply){
	$.fxc.drawMessages(reply);
	$('#pageJumpBtn_mainPage').click();//分页[确定]按钮  
}



$("#copyUrl").zclip({ 
	path: "${request.contextPath}/assets/lib/js/ZeroClipboard.swf", 
	copy: function(){
	    return "http://${shop.domain!}.${appSettings.shopDomainPost!}"; 
	}	 
 });
 

var HasTooltip = $('[data-toggle="popover"]');
		HasTooltip.click(function(e) {
			e.preventDefault();
			var isShowing = $(this).data('isShowing');
			HasTooltip.removeData('isShowing');
			if (isShowing !== 'true')
			{
				HasTooltip.not(this).popover('hide');
				$(this).data('isShowing', "true");
				$(this).popover('show');
			}
			else
			{
				$(this).popover('hide');
			}
		}).popover({
			trigger: 'manual',
			placement: "left",
			title: "页面地址",
			html: true,
			content: $("#date-demo").html()
		});
		$(document).click(function (e) {
			var	isPopover = $(e.target).is('[data-toggle=popover]');
			if (!isPopover) $('[data-toggle="popover"]').popover('hide');
			HasTooltip.removeData('isShowing');
			e.stopPropagation();
		});
$('.promotion').click(function() {
	var id =$(this).attr('data-id');
	$('.row #goodsUrl').attr('href',"http://${shop.domain!}.${appSettings.shopDomainPost!}");
	$('.row #shopQRCodeImg').attr('src',getContextPath()+'/shop/qrcode');
	$('.row #downloadQRCode').attr('data-id',id);
    $(".row #copyURL").hide();
});	

$('.rowPromotion').click(function() {
	var id =$(this).attr('data-id');
    $('.row #goodsUrl').attr('href',"http://${shop.domain!}.${appSettings.shopDomainPost!}/#/pages/show/"+$(this).attr('data-id'));
	$('.row #shopQRCodeImg').attr('src',getContextPath()+'/shop/downloadDecorateQRCode?id='+$(this).attr('data-id'));
	$('.row #downloadQRCode').attr('data-id',id);
	
	$('.row #copyURL').attr('data-id',id);

});





$('.disRowPromotion').click(function() {
	 document.getElementById( 'popDiv' ).style.display = 'block';
        setTimeout( closeWin, 2000 ); /* 2秒后关闭,这里你可以设置，单位毫秒 */
    });
 
    function closeWin(){
        document.getElementById('popDiv').style.display = 'none';
    }



</script>
<!-- END JAVASCRIPTS -->