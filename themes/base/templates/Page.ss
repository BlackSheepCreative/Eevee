<!DOCTYPE html>
<html lang="en-nz" dir="ltr">
<head>
    <%-- Set character encoding for the document --%>
    <meta charset="utf-8">
    <%-- Instruct Internet Explorer to use its latest rendering engine --%>
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <%-- Viewport for responsive web design --%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- Upgrade insecure requests to preserve https --%>
    <%--<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">--%>

    <%-- Generates base element that makes all links relative to it --%>
    <% base_tag %>

    <title><% if ClassName == "HomePage" %>$SiteConfig.Title<% else %>$Title – $SiteConfig.Title<% end_if %></title>
    
    <%-- Generates meta data, setting false stops it generating a title tag --%>
    $MetaTags(false)

    <% require themedCSS('dist/app') %>
    
    <%-- Fav icons, etc --%>
    <% include MetaIcons %>

    <%-- Facebook Open Graph --%>
    <%-- https://developers.facebook.com/docs/sharing/webmasters/ --%>
    <%-- https://developers.facebook.com/tools/debug/ --%>
    <% if $OGType %>
        <meta property="og:type" content="$OGType">
    <% else %>
        <meta property="og:type" content="website">
    <% end_if %>
    <meta property="og:url" content="{$BaseHref}">
    <meta property="og:title" content="$Title">
    <% if $OGPhoto %>
        <meta property="og:image" content="$OGPhoto.URL">
    <% else_if $SiteConfig.OGPhoto %>
        <meta property="og:image" content="$SiteConfig.OGPhoto.URL">
    <% end_if %>
    <% if $MetaDescription %>
        <meta property="og:description" content="$MetaDescription">
    <% end_if %>
    <meta property="og:site_name" content="$SiteConfig.Title">
    <meta property="og:locale" content="en_US">

    <%-- Facebook Open Graph --%>
    <%-- https://developer.twitter.com/en/docs/tweets/optimize-with-cards/guides/getting-started --%>
    <%-- https://cards-dev.twitter.com/validator --%>
    <meta name="twitter:card" content="summary">
    <% if $SiteConfig.TwitterUsername %>
    <meta name="twitter:site" content="@$SiteConfig.TwitterUsername">
    <meta name="twitter:creator" content="@$SiteConfig.TwitterUsername">
    <% end_if %>
    <meta name="twitter:url" content="{$BaseHref}">
    <meta name="twitter:title" content="$Title">
    <% if $MetaDescription %>
        <meta name="twitter:description" content="$MetaDescription">
    <% end_if %>
    <% if $OGPhoto %>
        <meta name="twitter:image" content="$OGPhoto.URL">
    <% else_if $SiteConfig.OGPhoto %>
        <meta name="twitter:image" content="$SiteConfig.OGPhoto.URL">
    <% end_if %>

</head>

<body class="$ClassName">
    
   <% if SiteConfig.GACode %>
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', '$SiteConfig.GACode']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        </script>
    <% end_if %>

    <% include Header %>

    <main role="main">
        $Layout
    </main>

    <% include Footer %>

    <% include Page_Scripts %>
</body>
</html>