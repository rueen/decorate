<#assign contextPath = request.contextPath>
<#if (appSettings.assetsPath)?has_content>
<#assign contextPath = appSettings.assetsPath>
</#if>

<!DOCTYPE html>
<html>

<head>
    <meta charset=utf-8>
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="TswordYao">
    <meta name="Keywords" content="${partner.aliasName!''}微店官网,${partner.aliasName!''}微信,全球购微商城,海淘微分销">
    <meta name="Description" content="${partner.aliasName!''}微店官网(shop.seatent.com)电话：${partner.telephone!}微商城全球购,中国最大海外商品B2B微分销平台,提供最全最专业的微商城海外正品、微商城代购特卖、微商城全球扫货,足不出户,一站采购全球购货源。">
    <title>${partner.aliasName!''}微店官网_${partner.aliasName!''}微信平台|海淘全球购微商城分销</title>
    <script>
        var configs = configs || {};
        var isDev = false;
        configs.shopId = ${(shop.id)!0};
        configs.baseUrl = '${appSettings.shopDomainPost!}'.indexOf('http://') >= 0 ? '${appSettings.shopDomainPost!}' : 'http://${appSettings.shopDomainPost!}';
        configs.contextPath = '${request.contextPath}';
        configs.sign_status = 1

        var decorations = decorations || {};
        <#if decoration??>
        <#if decoration?has_content>
        decorations.id = ${decoration.id};
        </#if>
        <#if decoration.isIndex??>
        decorations.isIndex = ${decoration.isIndex};
        </#if>
        <#if decoration.name??>
        decorations.name = '${decoration.name}';
        </#if>
        <#if decoration.shopId??>
        decorations.shopId = ${decoration.shopId};
        </#if>
        <#if decoration.content??>
        decorations.content = ${(decoration.content)!};
        </#if>
        <#if decoration.shareData??>
        decorations.shareData = ${(decoration.shareData)!};
        </#if>
        </#if>
    </script>
    <link href=${contextPath}/assets/decorate/css/app.css?v=2017030711 rel=stylesheet>
    <#if partner.isHaidai == 'true' >
		<link href="http://img.seatent.com/statics/attachment/spec/201505212138143751.png" rel="shortcut icon">
	<#else>
		<link href="/assets/img/favicon.png" rel="shortcut icon">
	</#if>
</head>

<body>
    <div id=app></div>
    <script type=text/javascript src=${contextPath}/assets/decorate/js/manifest.js?v=2017030711></script>
    <script type=text/javascript src=${contextPath}/assets/decorate/js/vendor.js?v=2017030711></script>
    <script type=text/javascript src=${contextPath}/assets/decorate/js/app.js?v=2017030711></script>
</body>

</html>
