<#assign contextPath = request.contextPath>
<#if (appSettings.assetsPath)?has_content>
<#assign contextPath = appSettings.assetsPath>
</#if>

<!DOCTYPE html>
<html>

<head>
    <meta charset=utf-8>
    <title>decoration</title>
    <script>
        var configs = configs || {};
        var isDev = false;
        configs.shopId = ${(shop.id)!0};
        configs.baseUrl = '${appSettings.shopDomainPost!}';
        configs.data = ${(decoration.content)!};
        configs.contextPath = '${request.contextPath}';
        configs.decorationId = ${decoration.id};
    </script>
    <link href=/shop/views/decorate/dist/static/css/app.0ee9100398eaf8cd21d665a2993ee420.css rel=stylesheet>
</head>

<body>
    <div id=app></div>
    <script type=text/javascript src=/shop/views/decorate/dist/static/js/manifest.5f5e700a14b2b02e704f.js></script>
    <script type=text/javascript src=/shop/views/decorate/dist/static/js/vendor.503af41fa5ea1ebcff1f.js></script>
    <script type=text/javascript src=/shop/views/decorate/dist/static/js/app.ca2673963fdcfcf3ebed.js></script>
</body>

</html>
