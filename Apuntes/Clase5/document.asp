<!DOCTYPE html>
<html>
<head>
<script type='text/javascript'>var _sf_startpt=(new Date()).getTime()</script>
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<META name="keywords" content="Automotive Designline, Automotive/Transportation, DSP, Gaming, Industrial Control Designline, Internet of Things Designline, MCU Designline, Medical Designline, Politics/Legislation, Power Management Designline, Programmable Logic Designline, Semiconductors, SoC Designline, Wireless and Networking Designline">
<META name="description" content="Part 1 of this 3-part series explains how locality impacts instruction caches, and shows how to increase performance through code partitioning, function inlining, and other techniques.">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="referrer" content="always" />
<meta name="created" content="October 29, 2007"/>
<meta name="author" />
<meta name="google-site-verification" content="aqeQJl1dzvKlHHA8IpYN0UlBUkeV64imdVnsZ5yJS7s" />

<link rel="image_src" href="https://m.eet.com/images/eetimes/eet_fb_icon3.jpg" />

<title>Optimizing for instruction caches, part 1 | EE Times</title>

<link rel="shortcut icon" href="https://m.eet.com/images/eetimes/favicon.ico" type="image/vnd.microsoft.icon">
<link rel="icon" href="https://m.eet.com/images/eetimes/favicon.ico" type="image/vnd.microsoft.icon">

<link rel="meta" type="application/rdf+xml" title="RDF Metadata" href="/rdf_simple.asp?the_docid=1275470&the_url=https%3A%2F%2Fwww%2Eeetimes%2Ecom%2Fdocument%2Easp%3Fdoc%5Fid%3D1275470" />
<link rel="canonical" href="https://www.eetimes.com/document.asp?doc_id=1275470"/><meta property="og:title" content="Optimizing for instruction caches, part 1"/>
<meta property="og:type" content="website"/>
<meta property="og:image" content="https://m.eet.com/images/eetimes/eet_fb_icon3.jpg"/>
<meta property="og:url" content="https://www.eetimes.com/document.asp?doc_id=1275470"/>
<meta property="og:site_name" content="EETimes"/>
<meta property="og:description" content="Part 1 of this 3-part series explains how locality impacts instruction caches, and shows how to increase performance through code partitioning, function inlining, and other techniques."/>
<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="@eetimes">
<meta name="twitter:title" content="Optimizing for instruction caches, part 1">
<meta name="twitter:description" content="Part 1 of this 3-part series explains how locality impacts instruction caches, and shows how to increase performance through code partitioning, function inlining, and other techniques.">
<meta name="twitter:image" content="https://m.eet.com/images/eetimes/eet_fb_icon3.jpg">

<link href="/styles/ubm-global-footer.css?v1" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="/styles/eetimes.css?v1" />

<script language="JavaScript" src="/script/complete.js"></script>
<script type="text/javascript" src="https://m.eet.com/images/commonscript/jquery-1.5.2.min.js"></script>
<script language="JavaScript">
theSiteDomain = 'www.eetimes.com';
theUrlScheme = 'https://';
thePageTitle = 'Optimizing for instruction caches, part 1 | EE Times';
</script>
<script async language="JavaScript" src="/script/eetimes.js?v4"></script>

<script language = "Javascript"> 
function SubmitInPageSurvey(inSurvey, inWidth) { 
	var theForm = GetObject('survey_' + inSurvey); 
	var theFormSubmitURL = 'https://www.eetimes.com/survey_jspage.asp?survey_submit=yes&survey_width='+ inWidth +'&cbust=74&survey_async=yes&survey_async_ip=13%2E84%2E47%2E11%2C+23%2E215%2E15%2E25%2C+23%2E50%2E48%2E150%3A41438&'; 
	for (var felt = 0; felt <  theForm.elements.length; felt++) {
		var thisElt = theForm.elements[felt]; 
		if (thisElt.type == 'checkbox' || thisElt.type == 'radio') { 
			if (thisElt.checked) { 
				theFormSubmitURL = theFormSubmitURL + thisElt.name + '=' + URLEncodeString(thisElt.value) + '&'; 
			} 
		} 
		else { 
			theFormSubmitURL = theFormSubmitURL + thisElt.name + '=' + URLEncodeString(thisElt.value) + '&'; 
		} 
	} 
	//alert(theFormSubmitURL); 
	LoadScript(theFormSubmitURL); 
	return false; 
} 
</script>

<script language="Javascript">
menuMaxOpacity = 95;

$(function(){
	$('.navbuttonbutton').hover(function() {
        var buttonName = $(this).attr("name");
        ToggleNavButton(buttonName,'on');
    }, function() {
        var buttonName = $(this).attr("name");
        ToggleNavButton(buttonName,'off');
    });
	
	$('.navbuttonbuttonhasmenu').hover(function() {
        var buttonName = $(this).attr("name");
        ToggleNavButtonMenu(buttonName, 'on');
    }, function() {
        var buttonName = $(this).attr("name");
        ToggleNavButtonMenu(buttonName, 'off');
    });
	
    $('.popmenu').hover(function() {
        var menuName = $(this).attr("name");
        if (menuName != 'supernav_events_popmenu') {
            var buttonName = menuName.replace('_popmenu','');
            ToggleNavButtonMenu(buttonName, 'on');
        }
    }, function() {
        var menuName = $(this).attr("name");
        if (menuName != 'supernav_events_popmenu') {
            var buttonName = menuName.replace('_popmenu','');
            ToggleNavButtonMenu(buttonName, 'off');
        }
    });
});

/*
$(window).load(function() {
    $('.navbuttonbutton').hover(function() {
        var buttonName = $(this).attr("name");
        ToggleNavButton(buttonName,'on');
    }, function() {
        var buttonName = $(this).attr("name");
        ToggleNavButton(buttonName,'off');
    });

    $('.navbuttonbuttonhasmenu').hover(function() {
        var buttonName = $(this).attr("name");
        ToggleNavButtonMenu(buttonName, 'on');
    }, function() {
        var buttonName = $(this).attr("name");
        ToggleNavButtonMenu(buttonName, 'off');
    });

    $('.popmenu').hover(function() {
        var menuName = $(this).attr("name");
        if (menuName != 'supernav_events_popmenu') {
            var buttonName = menuName.replace('_popmenu','');
            ToggleNavButtonMenu(buttonName, 'on');
        }
    }, function() {
        var menuName = $(this).attr("name");
        if (menuName != 'supernav_events_popmenu') {
            var buttonName = menuName.replace('_popmenu','');
            ToggleNavButtonMenu(buttonName, 'off');
        }
    });
});
*/
</script>

<!-- BEGIN Krux ControlTag for "AspenCore Generic" -->
<script class="kxct" data-id="sbnf4txm4" data-timing="async" data-version="3.0" type="text/javascript">
  window.Krux||((Krux=function(){ Krux.q.push(arguments) }).q=[]);
  (function(){
    var k=document.createElement('script');k.type='text/javascript';k.async=true;
    k.src=(location.protocol==='https:'?'https:':'http:')+'//cdn.krxd.net/controltag/sbnf4txm4.js';
    var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(k,s);
  }());
</script>
<!-- END Krux ControlTag -->

<script class="kxint" data-namespace="aspencore" type="text/javascript">
window.Krux||((Krux=function(){ Krux.q.push(arguments); }).q=[]);
(function(){
  function retrieve(n){
    var k= 'kx'+'aspencore_'+n, ls=(function(){
      try {
        return window.localStorage;
      } catch(e) {
        return null;
      }
    })();
    if (ls) {
        return ls[k] || '';
    } else if (navigator.cookieEnabled) {
        var m = document.cookie.match(k+'=([^;]*)');
        return (m && unescape(m[1])) || '';
    } else {
        return '';
    }
  }
  Krux.user = retrieve('user');
  Krux.segments = retrieve('segs') ? retrieve('segs').split(',') : [];
})();
</script>

<script type="text/javascript">
var _doubleclickRand = 203418678050064;
</script>

<script language="Javascript">
$(document).ready(function() {
StartRotato();
});
</script>

<style type="text/css">
body {
    margin:0; padding:0;
}
.universal-header-for-mobile {
    display:none;
}
.universal-header, .universal-header-for-mobile {
    background: none repeat scroll 0 0 #000000;
    color: white;
    float: left;
    font-size: 14px;
    font-weight: bold;
    width: 100%;
    height:30px;
    font-family: Arial, Helvetica, sans-serif;
    font-size:13px;
}
.universal-header a {
     display: inline-block;
    overflow: hidden;
    text-decoration: none;
    text-indent: -999em;
    width:30px;
    height:30px;
    cursor:pointer;
    margin-left:30px;
}
.universal-header span {
    overflow:hidden;
    background-color:#333231;
    width:2px;
    height:30px;
    display:inline-block;
}
.universal-header a.datasheets {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -6px -6px transparent;
}
.universal-header a.datasheets:hover, .universal-header a.datasheets.selected {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -6px -41px transparent;
}
.universal-header a.ebn {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -41px -6px transparent;
}
.universal-header a.ebn:hover, .universal-header a.ebn.selected {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -41px -41px transparent;
}
.universal-header a.edn {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -76px -6px transparent;
}
.universal-header a.edn:hover, .universal-header a.edn.selected {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -76px -41px transparent;
}
.universal-header a.eet {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -111px -6px transparent;
}
.universal-header a.eet:hover, .universal-header a.eet.selected {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -111px -41px transparent;
}
.universal-header a.emb {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -146px -6px transparent;
}
.universal-header a.emb:hover, .universal-header a.emb.selected {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -146px -41px transparent;
}
.universal-header a.pa {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -181px -6px transparent;
}
.universal-header a.pa:hover, .universal-header a.pa.selected {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -181px -41px transparent;
}
.universal-header a.tol {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -216px -6px transparent;
}
.universal-header a.tol:hover, .universal-header a.tol.selected {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -216px -41px transparent;
}
.universal-header a.tmw {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -251px -6px transparent;
    margin-right:30px;
}
.universal-header a.tmw:hover, .universal-header a.tmw.selected {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -251px -41px transparent;
}
.universal-header .events a {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -286px -6px transparent;
    width:60px;
}
.universal-header .events:hover > a {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -286px -41px transparent;
}
.universal-header a.ubmt {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -351px -4px transparent;
    float:right;
    margin-right:30px;
    width:80px;
}
.universal-header a.ubmt:hover {
    background: url("https://m.eet.com/images/images/Electronics_UniversalHeader_Sprite.png") no-repeat scroll -351px -39px transparent;
}
.universal-header .events {
    display: inline-block;
    padding: 0;
    position: relative;
}
.universal-header ul {
    display: none;
    position: absolute;
    top: 29px;
    left: 29px;
    background: #000;
    z-index: 10000;
    width: 120px;
    list-style: none outside none;
    margin:0; padding:0;
}
.universal-header ul a {
      display: block;
      padding: 5px 0 5px 10px;
      border-right: none;
      float: none;
      color:white;
      text-indent:inherit;
      margin:0;
      width:110px !important;
      height:auto;
      background-image:none !important;
}
.universal-header ul a:hover, .universal-header-for-mobile ul a:hover, .universal-header-for-mobile:hover > a {
    color:#dadada;
    text-shadow: 0 0 5px #fff;
}
/* mobile css */
.universal-header-for-mobile a {
    line-height:30px;
    padding-left:15px;
    color:white;
}
.universal-header-for-mobile ul {
    display: none;
    position: absolute;
    background: #000;
    z-index: 10000;
    list-style: none outside none;
    top: 29px;
    width: 100%;
    margin:0; padding:0;
}
.universal-header-for-mobile ul a {
    display: block;
    padding: 5px 0 5px 15px;
    float: none;
    color:white;
    text-indent:inherit;
    margin:0;
    height:auto;
    text-decoration:none;
}
/* tablet settings */
@media screen and (max-width: 780px)
{
.universal-header .events {
    display:none;
    }
}
/* mobile settings */
@media screen and (max-width: 320px)
{
.universal-header {
    display:none;
    }
.universal-header-for-mobile {
    display:block;
    cursor:pointer;
    }
}

.CSBJs_Form_Group .csbjs-group-label {
    display:block;
}

.CSBJs_Form_Element .CSBJs_Form_Element-errors {
    width: 80%;
}

</style>

<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-15759428-3']);
    _gaq.push(['_setDomainName', '.eetimes.com']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();
</script>

<script>
dmpDataLayer = [
{ "title": "Optimizing for instruction caches, part 1", "section": ["Automotive"], "pageType": "Design How-To", "keywords": ["Automotive","Automotive/Transportation","DSP","Gaming","Industrial Control","Internet of Things","MCU","Medical","Politics/Legislation","Power Management","Programmable Logic","Semiconductors","SoC","Wireless and Networking"] }
];
</script>


<script>
  dataLayer = [{
    'Author': '',
	'Section': 'Automotive Designline',
	'PageType': 'Design How-To',
	'PubDate':'20071029'
  }];
</script>
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-T2S76TP');</script>
<!-- End Google Tag Manager -->



<!-- Start: GPT Sync -->

<script type='text/javascript'>
 var gptadslots=[];
 (function(){
  var useSSL = 'https:' == document.location.protocol;
  var src = (useSSL ? 'https:' : 'http:') + '//www.googletagservices.com/tag/js/gpt.js';
  document.write('<scr' + 'ipt src="' + src + '"></scr' + 'ipt>');
 })();
</script>

<script type="text/javascript">

  
//Adslot 1 declaration
gptadslots[1]= googletag.defineSlot('/74317539/eetimes/auto', [[2,2]],'div-gpt-ad-629123393593213932-1').setTargeting('pos',['welcome']).addService(googletag.pubads());


  //Adslot 3 declaration
  gptadslots[3]= googletag.defineSlot('/74317539/eetimes/auto', [[970,250]],'div-gpt-ad-629123393593213932-3').setTargeting('pos',['top']).addService(googletag.pubads());  
  
  //Adslot 14 declaration
  gptadslots[14]= googletag.defineSlot('/74317539/eetimes/auto', [[728,90]],'div-gpt-ad-629123393593213932-14').setTargeting('pos',['bottom']).addService(googletag.pubads());

  //Adslot 5 declaration
  gptadslots[5]= googletag.defineSlot('/74317539/eetimes/auto', [[300,250]],'div-gpt-ad-938723337618775961-5').setTargeting('pos',['rec1']).addService(googletag.pubads());

  //Adslot 6 declaration
  gptadslots[6]= googletag.defineSlot('/74317539/eetimes/auto', [[300,600]],'div-gpt-ad-938723337618775961-6').setTargeting('pos',['rec2']).addService(googletag.pubads());

  
//Adslot 7 declaration
gptadslots[7]= googletag.defineSlot('/74317539/eetimes/auto', [[125,125]],'div-gpt-ad-938723337618775961-7').setTargeting('pos',['tile1']).addService(googletag.pubads());

//Adslot 9 declaration
gptadslots[9]= googletag.defineSlot('/74317539/eetimes/auto', [[120,600]],'div-gpt-ad-938723337618775961-9').setTargeting('pos',['sky']).addService(googletag.pubads());

  //Adslot 10 declaration 
gptadslots[10]= googletag.defineSlot('/74317539/eetimes/auto', [[4,4]],'div-gpt-ad-938723337618775961-10').setTargeting('pos',['video']).addService(googletag.pubads());

 //Adslot 13 declaration 
gptadslots[13]= googletag.defineSlot('/74317539/eetimes/auto', ['fluid'], 'div-gpt-ad-native').addService(googletag.pubads());

  
  

  googletag.pubads().enableSingleRequest();
  
  googletag.pubads().setTargeting('kw',['Automotive_Designline','Automotive/Transportation','DSP','Gaming','Industrial_Control_Designline','Internet_of_Things_Designline','MCU_Designline','Medical_Designline','Politics/Legislation','Power_Management_Designline','Programmable_Logic_Designline']).setTargeting('aid',['1275470']);
  googletag.pubads().setTargeting("ksg", Krux.segments);
  googletag.pubads().setTargeting("kuid", Krux.user);
  googletag.pubads().enableSyncRendering();
  googletag.enableServices();

</script>
<script type="text/javascript" src="/janrain/script/janrain-init.min.js?v1.12"></script>
<script type="text/javascript" src="/janrain/script/janrain-utils_1480500276.js"></script>

<!-- End: GPT -->


<script type="text/javascript">
$(document).ready(function(){
    $("#button").click(function(){
        $("#load").css("visibility", "visible");
    });
});
</script>
<script type="text/javascript">
(function() {
window._pa = window._pa || {};
var pa = document.createElement('script'); pa.type = 'text/javascript'; pa.async = true;
pa.src = ('https:' == document.location.protocol ? 'https:' : 'http:') + "//tag.marinsm.com/serve/55649c11dabbd5919e00015f.js";
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(pa, s);
window._pq = window._pq || [];
_pq.push(['track', 'website_eetimes']);
})();
</script>

</head>
<body class="sitedefault" bgcolor="#ffffff" border="0"  >
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-T2S76TP"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=133355186775047";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<!-- Beginning Sync AdSlot  -->
<div id='div-gpt-ad-629123393593213932-1'>
 <script type='text/javascript'>
  googletag.display('div-gpt-ad-629123393593213932-1');
 </script>
</div>
<!-- End AdSlot -->



<div align="center" style="margin:0 auto;width:990px;">
<div style="width: 990px; background-color: #ffffff; height: 10px;">

<div style="width: 974px;">


</div>
<div class="divsplitter" style="height: 1px;"></div>
<script language="javascript" type="application/javascript">
$(".universal-header .eet").addClass("selected");
if ($('div.universal-header div.events').length > 0) {
        //events listing in universal header
        $("div.universal-header div.events").mouseenter(function () {
            $("div.universal-header div.events").children('ul').slideDown(200);
        }).mouseleave(function () {
            $("div.universal-header div.events").children('ul').fadeOut(100);
        });
    }
if ($('div.universal-header-for-mobile').length > 0) {
        //events listing in universal header
        $("div.universal-header-for-mobile").mouseenter(function () {
            $("div.universal-header-for-mobile").children('ul').slideDown(200);
        }).mouseleave(function () {
            $("div.universal-header-for-mobile").children('ul').fadeOut(100);
        });
    }
</script>
</div>
<table width="990" cellpadding="0" cellspacing="0" border="0" style="background-color: #ffffff;" >
<tr>
<td width="8"><img src="https://m.eet.com/images/images/spacer.gif" width="8" height="1" border="0"></td>
<td width="2" style="background-color: #d1d1d1;"></td>
<td width="970" align="left" valign="top">
<div style="width: 970px; background: url(https://m.eet.com/images/eetimes/top_gradient_short.gif) no-repeat top left #ffffff;">
<table width="970" cellpadding="0" cellspacing="0" border="0">

    <tr>
        <td></td>
        <td colspan="5" align="left" valign="top">



</td>
        <td></td>
    </tr>
    <tr>
        <td colspan="7" align="left" valign="top">

<div align="center" style="width: 970px; min-height: 250px;">
<!-- Beginning Sync AdSlot  -->
<div id='div-gpt-ad-629123393593213932-3'>
 <script type='text/javascript'>
  googletag.display('div-gpt-ad-629123393593213932-3');
 </script>
</div>
<!-- End AdSlot -->

</div>
</td>
</tr>
<tr>
<td></td>
<td colspan="5" align="left" valign="top">
<div style="float: right;">Advertisement</div>
    <div style="width: 942px; height: 82px; overflow: hidden;">
        <div style="float: left; width: 438px;">
            <a href="../"><img id="site_template_logo" name="site_template_logo" src="https://m.eet.com/images/eetimes/ee-times.gif" width="383" height="82" border="0" alt="EE Times"></a>
        </div>
        <div style="float: left; width: 306px; height: 25px; margin-top: 53px; overflow: hidden;">
            <form name="template_search" id="template_search" action="/search.asp" method="get" style="margin: 0; padding: 0;">
                <div style="float: left; width: 306px; height: 25px; overflow: hidden; background: url(https://m.eet.com/images/eetimes/search_box.jpg) no-repeat;">
                    <input id="q" name="q" type="text" maxlength="250" style="float: left; margin-left: 7px; margin-top: 1px; width: 261px; height: 18px; font-size: 12px; font-family: arial, helvetica; color: #000000; text-decoration: none; font-weight: normal; border: 0; margin-top: 2px; background: url(https://m.eet.com/images/images/spacer.gif) repeat;" value="">
                    <div style="float: left; width: 18px; height: 24px; margin-left: 8px;">
                        <a href="javascript:GetObject('template_search').submit();" ><img name="search_button" id="search_button" src="https://m.eet.com/images/images/spacer.gif" border="0" width="18" height="24"></a>
                    </div>
                </div>
            </form>
        </div>
        <div style="float: left; width: 6px; height: 24px; margin-top: 45px; margin-left: 0px;">
            <img src="https://m.eet.com/images/images/spacer.gif" border="0" width="6" height="24">
        </div>
        <div style="float: left; margin-top: 58px;">
            <!-- <span class="gray"><a href="/search.asp">Advanced</a></span> -->
        </div>
        <div style="float: right; margin-top: 56px;">
            <span class="black bigsmall">
			<!-- Janrain Implementation starts -->

<!-- Janrain login starts -->

    <a href="javascript:void(0)" id="captureSignInLink" onclick="janrain.capture.ui.renderScreen('signIn')"> REGISTER | LOGIN </a>
    <a href="profile.asp?screenToRender=editProfile" id="captureProfileLink" style="display:none">PROFILE | </a> <a href="javascript:void(0)" id="captureSignOutLink" style="display:none" onclick="janrain.capture.ui.endCaptureSession()">LOGOUT</a>

    <style>
/*#janrainModal{height:80% !important;overflow-y: scroll !important;}*/
#traditionalRegistration .checkboxes .capture_form_item{
	margin-bottom: 0;
}
#traditionalRegistration .checkboxes  .capture_checkbox{
	padding: 0;
	background-color: #fff;
}
.janrain-capture-ui#traditionalRegistration .capture_form_item label{
	height: auto;
	overflow: visible;
	text-indent: 0;
	text-indent: inherit;
	display: block;
	vertical-align: middle;
	margin: 0 10px 0 5px;
	width: 30%;
	float: left;
}
#traditionalRegistration  .capture_form_item{
	min-height: 24px !important;
}
#traditionalRegistration .capture_text_input, #traditionalRegistration .capture_text_input, #traditionalRegistration .capture_textarea, #traditionalRegistration .capture_select_arrow{
	float: left;
	width:66% !important;
}
#traditionalRegistration .checkboxes label{
	width:94% !important;
}
#traditionalRegistration #traditionalRegistrationSave, #traditionalRegistration .capture_tip, #traditionalRegistration .capture_tip_validating, #traditionalRegistration .capture_tip_error{
	margin-left: 33%;
}
#traditionalRegistration .checkboxes .capture_tip_error{
	margin-left:6% !important;
}

#traditionalRegistration #traditionalRegistrationSave
</style>
<div style="display:none;" id="signIn">
        <div class="capture_header signin">
            <div class="login-header-text">Sign Up / Sign In</div>
        </div>
        <div class="capture_backgroundColor signin">
            <div class="capture_signin">
                {* #signInForm *}
                    {* signInEmailAddress *}
                    {* currentPassword *}
                    <div class="capture_form_item">
                        <a href="#" data-capturescreen="forgotPassword">Forgot your password?</a>
                    </div>
                    <div class="capture_rightText">
                        <button class="capture_secondary capture_btn capture_primary" type="submit"><span class="janrain-icon-16 janrain-icon-key"></span> Sign In</button>
                        <a href="#" id="capture_signIn_createAccountButton" data-capturescreen="traditionalRegistration" class="capture_secondary capture_createAccountButton capture_btn capture_primary">Create Account</a>                        
                    </div>
                {* /signInForm *}
            </div>
        </div>
    </div>

    <!-- returnSocial:
    This is the screen the user sees in place of the signIn screen if they've
    already signed in with a social account on this site. Rendering of this
    screen is defined in the Flow only when the 'janrainLastAuthMethod' cookie
    is set to'socialSignin'.
    -->
    <div style="display:none;" id="returnSocial">
        <div class="capture_header">
            <div class="login-header-text">Sign In</div>
        </div>
        <div class="capture_signin">
            <div class="login-header-text-h2">Welcome back, {* welcomeName *}!</div>
            {* loginWidget *}
            <div class="capture_centerText switchLink"><a href="#" data-cancelcapturereturnexperience="true">Use another account</a></div>
        </div>
    </div>

    <!-- returnTraditional:
    This is the screen the user sees in place of the signIn screen if they've
    already signed in with a traditional account on this site. Rendering of this
    screen is defined in the Flow only when the 'janrainLastAuthMethod' cookie
    is set to'traditionalSignin'.
    -->
    <div style="display:none;" id="returnTraditional">
        <div class="capture_header">
            <div class="login-header-text">Sign In</div>
        </div>
        <div class="capture_centerText"><span id="traditionalWelcomeName">Welcome Back</span></div>
        <div class="capture_backgroundColor">
            {* #signInForm *}
                {* signInEmailAddress *}
                {* currentPassword *}
                <div class="capture_form_item capture_rightText">
                    <button class="capture_secondary capture_btn capture_primary" type="submit"><span class="janrain-icon-16 janrain-icon-key"></span> Sign In</button>
                </div>
            {* /signInForm *}
            <div class="capture_centerText switchLink"><a href="#" data-cancelcapturereturnexperience="true">Use another account</a></div>
        </div>
    </div>

    <div style="display:none;" id="traditionalRegistration">
        <div class="capture_header">
            <div class="login-header-text">Registration</div>
        </div>		
        <p>Please confirm the information below before signing in. Already have an account? <a id="capture_traditionalRegistration_navSignIn" href="#" data-capturescreen="signIn">Sign In.</a></p>
        {* #registrationForm *}
			{* emailAddress *}
			{* newPassword *}
			{* newPasswordConfirm *}
			{* displayName *}
			{* firstName *}
			{* lastName *}
			{* addressCountry *}
			{* companyName *}
			{* eetimesJobfunction *}
			{* jobFunctionOther *}
			{* eetimesIndustry *}
			{* industryOther *}
			<div class="checkboxes">
			{* optInRegistration *}
			{* optAgree  *}
			{* optShare *}
			</div>			
			{* siteName *}
			<div class="errorBox"></div>
            <div class="capture_footer">
                <div class="capture_left">
                    {* backButton *}
                </div>
                <div class="capture_right">
                    <input value="Create Account" id="signupBtn" type="submit" class="capture_btn capture_primary">
                </div>
            </div>			
        {* /registrationForm *}
    </div>

    <!-- emailVerificationNotification:
        This screen is rendered after a user has registered. In the case of
        traditional registration, this screen is always rendered after the user
        completes registration on the traditionalRegistration screen. In the
        case of social registration, this screen is only rendered if the data
        returned from the IDP does not contain a verified email address.
        Twitter is an example of an IDP that does not return a verified email.
    -->
    <div style="display:none;" id="emailVerificationNotification">
        <div class="capture_header">
            <div class="login-header-text">Thank You for Registering</div>
        </div>
        <p>Please wait you will be redirected shortly.</p>
        <div class="capture_footer">
            <!-- a href="#" onclick="janrain.capture.ui.modal.close()" class="capture_btn capture_primary">Close</a -->
        </div>
    </div>

    <!--
    ============================================================================
        FORGOT PASSWORD SCREENS:
        The following screens are part of the forgot password user workflow. For
        a complete out-of-the-box registration experience, these screens must be
        included on the page where you are implementing forgot password
        functionality.
    ============================================================================
    -->

    <!-- forgotPassword:
        Entry point into the forgot password user workflow. This screen is
        rendered when the user clicks on the 'Forgot your password?' link on the
        signIn screen.
    -->
    <div style="display:none;" id="forgotPassword">
        <div class="capture_header">
            <div class="login-header-text">Create New Password</div>
        </div>
        <div class="login-header-text-h2">We'll send you a link to create a new password.</div>
        {* #forgotPasswordForm *}
            {* signInEmailAddress *}
            <div class="capture_footer">
                <div class="capture_left">
                    {* backButton *}
                </div>
                <div class="capture_right">
                    <input value="Send" type="submit" class="capture_btn capture_primary">
                </div>
            </div>
        {* /forgotPasswordForm *}
    </div>

    <!-- forgotPasswordSuccess:
        When the user submits an email address on the forgotPassword screen,
        this screen is rendered.
    -->
    <div style="display:none;" id="forgotPasswordSuccess">
        <div class="capture_header">
            <div class="login-header-text">Create New Password</div>
        </div>
            <p>We've sent an email with instructions to create a new password. Your existing password has not been changed.</p>
        <div class="capture_footer">
            <a href="#" onclick="janrain.capture.ui.modal.close()" class="capture_btn capture_primary">Close</a>
        </div>
    </div>

    <div style="display:none;" id="verifyEmail">
        <div class="capture_header">
            <div class="login-header-text">Resend Verification Email</div>
        </div>
        <p>Sorry, we could not verify that email address. Enter your email below, and we'll send you another email.</p>
        {* #resendVerificationForm *}
            {* signInEmailAddress *}
            <div class="capture_footer">
                <input value="Submit" type="submit" class="capture_btn capture_primary">
            </div>
         {* /resendVerificationForm *}
    </div>

    <!-- resendVerificationSuccess:
        This screen is rendered when a user enters an email address from the
        verifyEmail screen.
    -->
    <div style="display:none;" id="resendVerificationSuccess">
        <div class="capture_header">
            <div class="login-header-text">Verification Email Sent</div>
        </div>
        <div class="hr"></div>
        <p>Check your email for a link to verify your email address.</p>
        <div class="capture_footer">
            <a href="/login.asp" class="capture_btn capture_primary">Sign in</a>
        </div>
    </div>

    <!-- verifyEmailSuccess:
        This screen is rendered if the verification code provided in the link
        sent to the user in the verification email is accepted and the user's
        email address has been verified.
    -->
    <div style="display:none;" id="verifyEmailSuccess">
        <div class="capture_header">
            <div class="login-header-text">Email Verified</div>
        </div>
        <p>Thank you for verifiying your email address.
        <div class="capture_footer">
            <a href="/login.asp" class="capture_btn capture_primary">Sign in</a>
        </div>
    </div>

    <!--
    ============================================================================
        RESET PASSWORD SCREENS:
        The following screens are part of the password reset user workflow.
        For a complete out-of-the-box password reset experience, these screens
        must be included on the page where you are implementing password reset
        functionality.

        NOTE: The order in which these screens are rendered is as follows:
        resetPasswordRequestCode
        resetPasswordRequestCodeSuccess
        resetPassword
        resetPasswordSuccess
    ============================================================================
    -->

    <!-- resetPassword:
        This screen is rendered when the user clicks the link in provided in the
        password reset email and the code in the link is valid.
    -->
    <div style="display:none;" id="resetPassword">
        <div class="capture_header">
            <div class="login-header-text">Change Password</div>
        </div>
        {* #changePasswordFormNoAuth *}
            {* newPassword *}
            {* newPasswordConfirm *}
            <div class="capture_footer">
                <input value="Submit" type="submit" class="capture_btn capture_primary">
            </div>
        {* /changePasswordFormNoAuth *}
    </div>
    <!-- resetPasswordSuccess:
        This screen is rendered when the user successfully changes their
        password from the resetPassword screen.
    -->
    <div style="display:none;" id="resetPasswordSuccess">
        <div class="capture_header">
            <div class="login-header-text">Password Changed</div>
        </div>
        <p>Your password has been successfully updated.</p>
        <div class="capture_footer">
            <a href="/login.asp" class="capture_btn capture_primary">Sign in</a>
        </div>
    </div>
    <!-- resetPasswordRequestCode:
        This is the landing screen for the password reset workflow. When the
        user clicks the link provided in the reset password email, a code is
        supplied and is passed to Capture for verification. If the code is valid
        the resetPassword screen is rendered immediately and the content of
        this screen is not presented. If the code is not accepted for any reason
        this screen is then presented, allowing the user to re-enter their
        email address.
    -->
    <div style="display:none;" id="resetPasswordRequestCode">
        <div class="capture_header">
            <div class="login-header-text">Create New Password</div>
        </div>
        <p>We didn't recognize that password reset code. Enter your email below, and we'll send you another email.</p>
        {* #resetPasswordForm *}
            {* signInEmailAddress *}
            <div class="capture_footer">
                <input value="Send" type="submit" class="capture_btn capture_primary">
            </div>
        {* /resetPasswordForm *}
    </div>

    <!-- resetPasswordRequestCodeSuccess:
        This screen is rendered if the user submitted an email address on the
        resetPasswordRequestCode screen.
    -->
    <div style="display:none;" id="resetPasswordRequestCodeSuccess">
        <div class="capture_header">
            <div class="login-header-text">Create New Password</div>
        </div>
            <p>We've sent you an email with instructions to create a new password. Your existing password has not been changed.</p>
        <div class="capture_footer">
            <a href="#" onclick="janrain.capture.ui.modal.close()" class="capture_btn capture_primary">Close</a>
        </div>
    </div>

<!-- Janrain login ends --> 

<!-- Janrain Implementation ends -->
			</span>
        </div>
    </div>
</td>
<td></td>
</tr>
<tr>
<td></td>
<td colspan="5" align="left" valign="top">
<nav>
<div style="height: 11px;"><img src="https://m.eet.com/images/images/spacer.gif" width="1" height="8" border="0"></div>
<div style="">
<div style="float: right; text-align: right;">
    <div class="divsplitter" style="height: 2px;"></div>
    <span class="bigsmall black"><a href="/document.asp?doc_id=1119278">About Us</a> | <a href="http://go.aspencore.com/EETSubscribe" target="_blank">Subscribe</a></span>
</div>
<div style="width:950px">
<div name="nav_home" id="nav_home" class="navbuttonouteroff red bigsmall navbuttonbutton"><a href="../">Home</a></div>
<div name="nav_news" id="nav_news" class="navbuttonouteroff red bigsmall navbuttonbutton navbuttonbuttonhasmenu"><a href="/archives.asp?section_type=News+Analysis">News</a></div>
<div name="nav_blogs" id="nav_blogs" class="navbuttonouteroff red bigsmall navbuttonbutton"><a href="/archives.asp?blogs=yes">Opinion</a></div>
<div name="nav_messages" id="nav_messages" class="navbuttonouteroff red bigsmall navbuttonbutton"><a href="/archives.asp?threads=yes">Messages</a></div>
<div name="nav_bloggers" id="nav_bloggers" class="navbuttonouteroff red bigsmall navbuttonbutton navbuttonbuttonhasmenu"><a href="/bloggers.asp">Authors</a></div>
<div name="nav_video" id="nav_video" class="navbuttonouteroff red bigsmall navbuttonbutton"><a href="/videos.asp">Video</a></div>
<div name="nav_slideshows" id="nav_slideshows" class="navbuttonouteroff red bigsmall navbuttonbutton"><a href="/archives.asp?section_id=121">Slideshows</a></div>
<div name="nav_teardown" id="nav_teardown" class="navbuttonouteroff red bigsmall navbuttonbutton"><a href="/archives.asp?section_id=120">Teardown</a></div>
<!-- <div name="nav_products" id="nav_products" class="navbuttonouteroff red bigsmall navbuttonbutton navbuttonbuttonhasmenu">Products</div> -->
<div name="nav_techonline" id="nav_techonline" class="navbuttonouteroff red bigsmall navbuttonbutton navbuttonbuttonhasmenu"><a href="https://www.techonline.com" target="new">Education</a></div>
<!-- <div name="nav_university" id="nav_university" class="navbuttonouteroff red bigsmall navbuttonbutton"><a href="/lecture-calendar.asp">EET University</a></div> -->
<!--<div name="nav_jobs" id="nav_jobs" class="navbuttonouteroff red bigsmall navbuttonbutton"><a href="http://engineeringcareers.eetimes.com/" target="new">Jobs</a></div>-->
<div name="nav_eelife" id="nav_eelife" class="navbuttonouteroff red bigsmall navbuttonbutton navbuttonouterlast"><a href="/eelife.asp">EELife</a></div>
<!-- <div name="nav_events" id="nav_events" class="navbuttonouteroff red bigsmall navbuttonbutton navbuttonbuttonhasmenu">Events</div> -->
<!-- <div name="nav_aboutus" id="nav_aboutus" class="navbuttonouteroff red bigsmall navbuttonbutton navbuttonouterlast"><a href="/document.asp?doc_id=1119278">About Us</a></div> -->
</div>
</div>

<div class="divsplitter" style="height: 9px;"><img src="https://m.eet.com/images/images/spacer.gif" width="1" height="9" border="0"></div>

<div style="width: 942px; height: 26px; background: url(https://m.eet.com/images/eetimes/eetimes_designlines_bg.gif) top left no-repeat;">

<!-- left nav -->
<div style="float: left; width: 100px; height: 26px;"><img src="https://m.eet.com/images/images/spacer.gif" border="0" width="100" height="26"></div>
<div style="float: left; width: 7px; height: 26px;"><a href="Javascript: designlinesSliderHandler.LRSliderSlideLeft(1);" onmouseout="MM_swapImage('designlines_leftarrowbutton','',designlinesLeftArrowButtonMouseoutImgSrc,1)" onmouseover="MM_swapImage('designlines_leftarrowbutton','','https://m.eet.com/images/eetimes/eetimes_designlines_arrow_dark_left.gif',1)"><img name="designlines_leftarrowbutton" id="designlines_leftarrowbutton" src="https://m.eet.com/images/eetimes/eetimes_designlines_arrow_dark_left.gif" border="0" width="7" height="26"></a></div>
<div style="float: left; width: 6px; height: 26px;"><img src="https://m.eet.com/images/images/spacer.gif" border="0" width="6" height="26"></div>
<div style="float: left; width: 2px; height: 22px; background-color: #d1d1d1;"><img src="https://m.eet.com/images/images/spacer.gif" border="0" width="2" height="22"></div>
<!-- end left nav -->

<!-- nav content -->
<div id="LRSlider_Content_designlines" name="LRSlider_Content_designlines" style="width: 798px; display: block; float: left;">
<div style="">
<div style="height: 22px;">
<div id="designlines_scrollyparent" name="designlines_scrollyparent" style="position: absolute;">
<div id="designlines_border" name="designlines_border" style="position: relative; top: 0px; left: 0px; width: 798px; height: 22px; overflow: hidden;">
<div id="designlines_window" name="designlines_window" style="position: relative; top: 0px; left: 0px; clip: rect(0px 768px 22px 0px); overflow: hidden;">
<div id="designlines_outside" data="ceitest" name="designlines_outside" style="position: relative; top: 0px; left: 1px; width: 1800px; height: 22px; z-index: 2;">
	<div class="designlinesnavouter designlinesnavouterrightborder" style="padding-left: 4px; padding-right: 4px;"><div class="designlinesnavinner white strong"><a href="/bigdata-designline.asp">Big Data</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 2px; padding-right: 2px;"><div class="designlinesnavinnerstatetwofirst white strong"><a href="https://www.planetanalog.com" target="_blank">Analog</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 4px; padding-right: 4px;"><div class="designlinesnavinnerstateone white strong"><a href="/automotive-designline.asp">Automotive</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 4px; padding-right: 4px;"><div class="designlinesnavinnerstateone white strong"><a href="https://www.embedded.com/" target="_blank">Embedded</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 4px; padding-right: 4px;"><div class="designlinesnavinnerstateone white strong"><a href="/industrial-control-designline.asp">Industrial Control &amp; Automation</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 4px; padding-right: 4px;"><div class="designlinesnavinnerstateone white strong"><a href="/internet-of-things-designline.asp">IoT</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 4px; padding-right: 4px;"><div class="designlinesnavinnerstateone white strong"><a href="/mcu-designline.asp">MCU</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 4px; padding-right: 4px;"><div class="designlinesnavinnerstateone white strong"><a href="/medical-designline.asp">Medical</a></div></div>
	<div class="designlinesnavouter designlinesnavouterleftborder" style="padding-left: 4px; padding-right: 4px;  margin-right: 18px;"><div class="designlinesnavinnerstateone white strong"><a href="/memory-designline.asp">Memory</a></div></div>
	<div class="designlinesnavouter designlinesnavouterrightborder" style="padding-left: 0px; padding-right: 5px; margin-left: 40px;"><div class="designlinesnavinnerstateonelast white strong"><a href="pcb-designline.asp">PCB</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 5px; padding-right: 5px;"><div class="designlinesnavinner white strong"><a href="/power-management-designline.asp">Power Management</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 5px; padding-right: 5px;"><div class="designlinesnavinner white strong"><a href="/programmable-logic-designline.asp">Programmable Logic</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 5px; padding-right: 5px;"><div class="designlinesnavinner white strong"><a href="/prototyping-designline.asp">Prototyping</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 5px; padding-right: 5px;"><div class="designlinesnavinner white strong"><a href="/soc-designline.asp">SoC</a></div></div>
	<div class="designlinesnavouter designlinesnavouterbothborders" style="padding-left: 5px; padding-right: 5px;"><div class="designlinesnavinner white strong"><a href="/test-and-measurement-designline.asp">Test &amp; Measurement</a></div></div>
	<div class="designlinesnavouter designlinesnavouterleftborder" style="padding-right: 5px;"><div class="designlinesnavinner white strong"><a href="/wireless-and-networking-designline.asp">Wireless &amp; Networking</a></div></div>
	<div class="divsplitter" style="height: 1px;"></div>
</div>
</div></div></div></div>
<div class="divsplitter" style="height: 1px;"></div>
</div>
</div>
<!-- end nav content -->

<!-- right nav -->
<div style="float: left; width: 2px; height: 22px; background-color: #d1d1d1;"><img src="https://m.eet.com/images/images/spacer.gif" border="0" width="2" height="22"></div>
<div style="float: left; width: 6px; height: 26px;"><img src="https://m.eet.com/images/images/spacer.gif" border="0" width="6" height="26"></div>
<div style="float: left; width: 7px; height: 26px;"><a href="Javascript: designlinesSliderHandler.LRSliderSlideRight(1);" onmouseout="MM_swapImage('designlines_rightarrowbutton','',designlinesRightArrowButtonMouseoutImgSrc,1)" onmouseover="MM_swapImage('designlines_rightarrowbutton','','https://m.eet.com/images/eetimes/eetimes_designlines_arrow_dark_right.gif',1)"><img name="designlines_rightarrowbutton" id="designlines_rightarrowbutton" src="https://m.eet.com/images/eetimes/eetimes_designlines_arrow_light_right.gif" border="0" width="7" height="26"></a></div>
<div style="float: left; width: 14px; height: 26px;"><img src="https://m.eet.com/images/images/spacer.gif" border="0" width="14" height="26"></div>
<!-- end right nav -->

<div class="divsplitter" style="height: 0px;"></div>
</div>

<script language="Javascript">
var dir = "right";
designlinesSliderHandler.LRSliderSlide(1);
function autoScrollDesignLines() {
    if (dir === "right") {
        designlinesSliderHandler.LRSliderSlideRight(1);
        dir="left";
    } else {
        designlinesSliderHandler.LRSliderSlideLeft(1);
        dir="right";
    }
}
$(document).ready(function() {
    setInterval(function() {
        autoScrollDesignLines();
    }, 30000);
});
</script>

<div class="divsplitter" style="height: 0px;"></div>
</nav>
</td>
        <td></td>
    </tr>
    <tr style="height: 11px; ">
        <td width="14" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="14" height="11" border="0"></td>
        <td width="577" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="573" height="1" border="0"></td>
        <td width="14" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="14" height="1" border="0"></td>
        <td width="1" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="1" height="1" border="0"></td>
        <td width="14" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="14" height="1" border="0"></td>
        <td width="336" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="336" height="1" border="0"></td>
        <td width="14" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="14" height="1" border="0"></td>
    </tr>
</table>
</div>
</td>
<td width="2" style="background-color: #d1d1d1;"><img src="https://m.eet.com/images/images/spacer.gif" width="2" height="1" border="0"></td>
<td width="8"><img src="https://m.eet.com/images/images/spacer.gif" width="8" height="1" border="0"></td>
</tr>


<tr class="line-height-fix">
<td width="8" valign="top"><img src="https://m.eet.com/images/eetimes/arrow2_ribbon.png" width="8" border="0" /></td>
<td width="2"  valign="top" style="background: url(https://m.eet.com/images/eetimes/red_line.gif) repeat-x top left #d1d1d1;"><img src="https://m.eet.com/images/images/spacer.gif" width="2" height="1" border="0"></td>
<td width="970" valign="top">

<div style="width: 970px; height: 26px; background-color: #e8e8e8;">
<div style="float: left; width: 126px; height: 26px; background: url(https://m.eet.com/images/eetimes/arrow2_main.png) no-repeat top left; margin-right: 16px;">
    <div class="divsplitter" style="height: 4px;"></div>
    <span class="bigsmallest white strong allcaps">Breaking News</span>
</div>

<!-- Start Temp Breaking News //-->



<style type="text/css">
.breakingNewswindow_item {
    width: 563px;
    height: 26px;
    overflow: hidden;
}
.line-height-fix td{
    line-height: 0;
}
</style>

<script language="Javascript">
function StartRotato() {
    // set interval to check every 8 seconds and if not in use, advance to next pane
    var rotatoInterval = setInterval(RotatoAutoAdvance, 8000);

}

function RotatoAutoAdvance() {
    if (!rotatoInUse) {
        if (eetimesBreakingNewsSliderHandler.currentSliderElement < eetimesBreakingNewsSliderHandler.sliderElementCount) {
            eetimesBreakingNewsSliderHandler.LRSliderSlide(1 + eetimesBreakingNewsSliderHandler.currentSliderElement);
        } else {
            eetimesBreakingNewsSliderHandler.LRSliderSlide(1);
        }
    }
}
</script>

<div name="breakingnewswindow" id="breakingnewswindow" style="float: left; width: 563px; height: 26px; overflow: hidden;">
<div name="breakingnewswindow_scrollcontainer" id="breakingnewswindow_scrollcontainer" style="width: 563px; height: 150px; overflow: hidden; position: relative; top: 0px; left: 0px;">

<div class="breakingnewswindow_item">
    <span class="black bigsmall strong">

<script language="Javascript">

var eetimesBreakingNewsSliderHandler = new LRSliderHandler();

eetimesBreakingNewsSliderHandler.thisSliderElementName = 'eetimesBreakingNewsSliderHandler';
eetimesBreakingNewsSliderHandler.sliderElementCount = 6;
eetimesBreakingNewsSliderHandler.sliderElementSize = 563;
eetimesBreakingNewsSliderHandler.sliderObjectViewsize = 1;
eetimesBreakingNewsSliderHandler.sliderRightLimit = eetimesBreakingNewsSliderHandler.sliderElementSize * ((eetimesBreakingNewsSliderHandler.sliderElementCount - eetimesBreakingNewsSliderHandler.sliderObjectViewsize) * -1) + 1;
eetimesBreakingNewsSliderHandler.currentSliderElement = 1;
eetimesBreakingNewsSliderHandler.sliderObjectId = 'eetimesBreakingNews_outside';
eetimesBreakingNewsSliderHandler.sliderDoSlide = false;

var eetimesBreakingNewsLeftArrowButtonMouseoutImgSrc = 'https://m.eet.com/images/eetimes/breaking_nav1.gif';
var eetimesBreakingNewsRightArrowButtonMouseoutImgSrc = 'https://m.eet.com/images/eetimes/breaking_nav4.gif';

eetimesBreakingNewsSliderHandler.LRSliderNavGraphicsHandlerSlideLeft = function() {
	// now deal with the images
 
	var currentImage = GetObject('eetimesBreakingNews_rightarrowbutton');
	// if we're at currentSliderElement < sliderElementCount make sure the right button is active
	if (this.currentSliderElement < this.sliderElementCount) { 
		currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav4a.gif';
	} else {
		currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav4.gif';
	}
	eetimesBreakingNewsRightArrowButtonMouseoutImgSrc = currentImage.src;

	// if sliding left, change when currentSliderElement gets to 1
	currentImage = GetObject('eetimesBreakingNews_leftarrowbutton');
	if (this.currentSliderElement == 1) { 
		currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav1.gif';
	} else {
		currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav1a.gif';
	}
	eetimesBreakingNewsLeftArrowButtonMouseoutImgSrc = currentImage.src;
 
	for (var dot = 1; dot <=  this.sliderElementCount; dot++) {
		// check to see if has blue dot
		currentImage = GetObject('eetimesBreakingNews_navdot_' + dot);
		if (currentImage.src == 'https://m.eet.com/images/eetimes/breaking_nav3.gif') {
		currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav2.gif';
		}
	}
	currentImage = GetObject('eetimesBreakingNews_navdot_' + this.currentSliderElement);
	currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav3.gif';
}

eetimesBreakingNewsSliderHandler.LRSliderNavGraphicsHandlerSlideRight = function() {
	// now deal with the images
 
	var currentImage = GetObject('eetimesBreakingNews_leftarrowbutton');
	// if we're at currentSliderElement > 1 make sure the left button is active
	if (this.currentSliderElement > 1) { 
		currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav1a.gif';
	} else {
		currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav1.gif';
	}
	eetimesBreakingNewsLeftArrowButtonMouseoutImgSrc = currentImage.src;
 
	currentImage = GetObject('eetimesBreakingNews_rightarrowbutton');
	// sliding right, change when currentSliderElement gets to this.sliderElementCount
	if (this.currentSliderElement == this.sliderElementCount) {
		currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav4.gif';
	} else {
		currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav4a.gif';
	}
	eetimesBreakingNewsRightArrowButtonMouseoutImgSrc = currentImage.src;
 
	for (var dot = 1; dot <=  this.sliderElementCount; dot++) {
		// check to see if has blue dot
		currentImage = GetObject('eetimesBreakingNews_navdot_' + dot);
		if (currentImage.src == 'https://m.eet.com/images/eetimes/breaking_nav3.gif') {
		currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav2.gif';
		}
	}
	currentImage = GetObject('eetimesBreakingNews_navdot_' + this.currentSliderElement);
	currentImage.src = 'https://m.eet.com/images/eetimes/breaking_nav3.gif';
}

</script>

<div id="LRSlider_Content_eetimesBreakingNews" name="LRSlider_Content_eetimesBreakingNews" style="display: block;">
<div style="">
<div style="height: 30px;">
<div id="eetimesBreakingNews_scrollyparent" name="eetimesBreakingNews_scrollyparent" style="position: absolute;">
<div id="eetimesBreakingNews_border" name="eetimesBreakingNews_border" style="position: relative; top: 0px; left: 0px; width: 564px; height: 30px; overflow: hidden;">
<div id="eetimesBreakingNews_window" name="eetimesBreakingNews_window" style="position: relative; top: 0px; left: 0px; clip: rect(0px 562px 28px 0px); overflow: hidden;">
<div id="eetimesBreakingNews_outside" name="eetimesBreakingNews_outside" style="position: relative; top: 1px; left: 1px; width: 3378px; height: 26px; z-index: 2;" onmouseover="rotatoInUse=true;" onclick="rotatoInUse=true;" onmouseout="rotatoInUse=false;">
<div id="eetimesBreakingNews_rotato_1333117" name="eetimesBreakingNews_rotato_1333117" style="float: left;">
<div style="display: block; width: 563px; height: 26px; overflow: hidden;">
<div style="width: 563px; height: 23px; overflow: hidden; margin-top: 3px;">
<span class="bigsmall strong"><a href="/document.asp?doc_id=1333117">NEWS & ANALYSIS: Sponsored: We're Passive Aggressive </a> </span>
</div>
</div>
</div>
<div id="eetimesBreakingNews_rotato_1333155" name="eetimesBreakingNews_rotato_1333155" style="float: left;">
<div style="display: block; width: 563px; height: 26px; overflow: hidden;">
<div style="width: 563px; height: 23px; overflow: hidden; margin-top: 3px;">
<span class="bigsmall strong"><a href="/document.asp?doc_id=1333155">NEWS & ANALYSIS: Chipmakers Expand R&D Amid France's New AI Push</a> </span>
</div>
</div>
</div>
<div id="eetimesBreakingNews_rotato_1333154" name="eetimesBreakingNews_rotato_1333154" style="float: left;">
<div style="display: block; width: 563px; height: 26px; overflow: hidden;">
<div style="width: 563px; height: 23px; overflow: hidden; margin-top: 3px;">
<span class="bigsmall strong"><a href="/document.asp?doc_id=1333154">NEWS & ANALYSIS: Former Spreadtrum CEO to Lead Imagination</a> </span>
</div>
</div>
</div>
<div id="eetimesBreakingNews_rotato_1333152" name="eetimesBreakingNews_rotato_1333152" style="float: left;">
<div style="display: block; width: 563px; height: 26px; overflow: hidden;">
<div style="width: 563px; height: 23px; overflow: hidden; margin-top: 3px;">
<span class="bigsmall strong"><a href="/document.asp?doc_id=1333152">NEWS & ANALYSIS: AI Connects Imagination, Leo Li, China</a> </span>
</div>
</div>
</div>
<div id="eetimesBreakingNews_rotato_1333153" name="eetimesBreakingNews_rotato_1333153" style="float: left;">
<div style="display: block; width: 563px; height: 26px; overflow: hidden;">
<div style="width: 563px; height: 23px; overflow: hidden; margin-top: 3px;">
<span class="bigsmall strong"><a href="/document.asp?doc_id=1333153">NEWS & ANALYSIS: Trump's Tariff List to Impact Supply Chain</a> </span>
</div>
</div>
</div>
<div id="eetimesBreakingNews_rotato_1333151" name="eetimesBreakingNews_rotato_1333151" style="float: left;">
<div style="display: block; width: 563px; height: 26px; overflow: hidden;">
<div style="width: 563px; height: 23px; overflow: hidden; margin-top: 3px;">
<span class="bigsmall strong"><a href="/author.asp?section_id=36&doc_id=1333151">BLOG: Three Concepts for Managing AI</a> </span>
</div>
</div>
</div>


<div class="divsplitter" style="height: 1px;"></div>
</div></div></div></div></div>
<div class="divsplitter" style="height: 1px;"></div>
</div>
</div>

<script language="Javascript">
eetimesBreakingNewsSliderHandler.LRSliderSlide(1);
</script>

</span>
</div>



</div>
</div>

<div style="float: left; height: 26px; width: 125px;">
<div style="float: right; width: 14px;"><img src="https://m.eet.com/images/images/spacer.gif" width="14" height="18" border="0"></div>

<script language="Javascript">
var rotatoInUse = false;
</script>

<div style="float: right; width: 17px; height: 26px; text-align: right;"><a href="Javascript: eetimesBreakingNewsSliderHandler.LRSliderSlideRight(1);" onclick="rotatoInUse = true;" onmouseout="MM_swapImage('eetimesBreakingNews_rightarrowbutton','',eetimesBreakingNewsRightArrowButtonMouseoutImgSrc,1)" onmouseover="MM_swapImage('eetimesBreakingNews_rightarrowbutton','','https://m.eet.com/images/eetimes/breaking_nav4a.gif',1)"><img name="eetimesBreakingNews_rightarrowbutton" id="eetimesBreakingNews_rightarrowbutton" src="https://m.eet.com/images/eetimes/breaking_nav4.gif" border="0" width="7" height="26"></a></div>
			<div style="float: right; height: 9px; text-align: right;">
			
<div style="float: left; width: 12px; height: 26px;"><a href="Javascript: eetimesBreakingNewsSliderHandler.LRSliderSlide(1);" onclick="rotatoInUse = true;" onmouseout="if (1 != eetimesBreakingNewsSliderHandler.currentSliderElement) { MM_swapImgRestore() }" onmouseover="MM_swapImage('eetimesBreakingNews_navdot_1','','https://m.eet.com/images/eetimes/breaking_nav3.gif',1)"><img name="eetimesBreakingNews_navdot_1" id="eetimesBreakingNews_navdot_1" src="https://m.eet.com/images/eetimes/breaking_nav3.gif" border="0" width="9" height="26"></a></div>
<div style="float: left; width: 12px; height: 26px;"><a href="Javascript: eetimesBreakingNewsSliderHandler.LRSliderSlide(2);" onclick="rotatoInUse = true;" onmouseout="if (2 != eetimesBreakingNewsSliderHandler.currentSliderElement) { MM_swapImgRestore() }" onmouseover="MM_swapImage('eetimesBreakingNews_navdot_2','','https://m.eet.com/images/eetimes/breaking_nav3.gif',1)"><img name="eetimesBreakingNews_navdot_2" id="eetimesBreakingNews_navdot_2" src="https://m.eet.com/images/eetimes/breaking_nav2.gif" border="0" width="9" height="26"></a></div>
<div style="float: left; width: 12px; height: 26px;"><a href="Javascript: eetimesBreakingNewsSliderHandler.LRSliderSlide(3);" onclick="rotatoInUse = true;" onmouseout="if (3 != eetimesBreakingNewsSliderHandler.currentSliderElement) { MM_swapImgRestore() }" onmouseover="MM_swapImage('eetimesBreakingNews_navdot_3','','https://m.eet.com/images/eetimes/breaking_nav3.gif',1)"><img name="eetimesBreakingNews_navdot_3" id="eetimesBreakingNews_navdot_3" src="https://m.eet.com/images/eetimes/breaking_nav2.gif" border="0" width="9" height="26"></a></div>
<div style="float: left; width: 12px; height: 26px;"><a href="Javascript: eetimesBreakingNewsSliderHandler.LRSliderSlide(4);" onclick="rotatoInUse = true;" onmouseout="if (4 != eetimesBreakingNewsSliderHandler.currentSliderElement) { MM_swapImgRestore() }" onmouseover="MM_swapImage('eetimesBreakingNews_navdot_4','','https://m.eet.com/images/eetimes/breaking_nav3.gif',1)"><img name="eetimesBreakingNews_navdot_4" id="eetimesBreakingNews_navdot_4" src="https://m.eet.com/images/eetimes/breaking_nav2.gif" border="0" width="9" height="26"></a></div>
<div style="float: left; width: 12px; height: 26px;"><a href="Javascript: eetimesBreakingNewsSliderHandler.LRSliderSlide(5);" onclick="rotatoInUse = true;" onmouseout="if (5 != eetimesBreakingNewsSliderHandler.currentSliderElement) { MM_swapImgRestore() }" onmouseover="MM_swapImage('eetimesBreakingNews_navdot_5','','https://m.eet.com/images/eetimes/breaking_nav3.gif',1)"><img name="eetimesBreakingNews_navdot_5" id="eetimesBreakingNews_navdot_5" src="https://m.eet.com/images/eetimes/breaking_nav2.gif" border="0" width="9" height="26"></a></div>
<div style="float: left; width: 12px; height: 26px;"><a href="Javascript: eetimesBreakingNewsSliderHandler.LRSliderSlide(6);" onclick="rotatoInUse = true;" onmouseout="if (6 != eetimesBreakingNewsSliderHandler.currentSliderElement) { MM_swapImgRestore() }" onmouseover="MM_swapImage('eetimesBreakingNews_navdot_6','','https://m.eet.com/images/eetimes/breaking_nav3.gif',1)"><img name="eetimesBreakingNews_navdot_6" id="eetimesBreakingNews_navdot_6" src="https://m.eet.com/images/eetimes/breaking_nav2.gif" border="0" width="9" height="26"></a></div>
			</div>
			<div style="float: right; width: 14px; height: 26px;"><a href="Javascript: eetimesBreakingNewsSliderHandler.LRSliderSlideLeft(1);" onclick="rotatoInUse = true;" onmouseout="MM_swapImage('eetimesBreakingNews_leftarrowbutton','',eetimesBreakingNewsLeftArrowButtonMouseoutImgSrc,1)" onmouseover="MM_swapImage('eetimesBreakingNews_leftarrowbutton','','https://m.eet.com/images/eetimes/breaking_nav1a.gif',1)"><img name="eetimesBreakingNews_leftarrowbutton" id="eetimesBreakingNews_leftarrowbutton" src="https://m.eet.com/images/eetimes/breaking_nav1.gif" border="0" width="7" height="26"></a></div>


</div>
<div>

<div style="float: right; width: 116px; height: 26px; margin-right: 14px; border-left: 2px solid #ffffff;">
<div style="float: left; width: 14px; margin-left: 14px; margin-right: 7px;"><a href="https://www.facebook.com/EETimes" target="new"><img src="https://m.eet.com/images/eetimes/breaking_nav_fb.gif" width="14" height="26" border="0" /></a></div>
<div style="float: left; width: 14px; margin-right: 7px;"><a href="http://twitter.com/eetimes" target="new"><img src="https://m.eet.com/images/eetimes/breaking_nav_tw.gif" width="14" height="26" border="0" /></a></div>
<div style="float: left; width: 14px; margin-right: 7px;"><a href="http://www.linkedin.com/groups/EE-Times-Group-2839729?mostPopular=&gid=2839729" target="new"><img src="https://m.eet.com/images/eetimes/breaking_nav_in.gif" width="14" height="26" border="0" /></a></div>
<div style="float: left; width: 14px; margin-right: 7px;"><a href="https://plus.google.com/b/114387943173180993174/114387943173180993174/posts" target="new"><img src="https://m.eet.com/images/eetimes/breaking_nav_plus.gif" width="14" height="26" border="0" /></a></div>
<div style="float: left; width: 14px;"><a href="/rss_simple.asp" target="new"><img src="https://m.eet.com/images/eetimes/breaking_nav_rss.gif" width="14" height="26" border="0" /></a></div>
</div>

</div>
<div class="divsplitter" style="height: 15px; background-color: #FFF;"></div>
</div>
<div class="divsplitter" style="height: 0px;"></div>


</td>
<td width="2" style="background-color: #d1d1d1;"><img src="https://m.eet.com/images/images/spacer.gif" width="2" height="1" border="0"></td>
<td width="8"><img src="https://m.eet.com/images/images/spacer.gif" width="8" height="1" border="0"></td>
</tr>

<tr>
<td width="8"><img src="https://m.eet.com/images/images/spacer.gif" width="4" height="1" border="0"></td>
<td width="2" style="background-color: #d1d1d1;"></td>
<td width="970" align="left" valign="top">
<div style="width: 970px;">

<table width="970" cellpadding="0" cellspacing="0" border="0">

    <tr style="height: 4px;" class="line-height-fix">
        <td width="14" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="14" height="4" border="0"></td>
        <td width="577" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="573" height="1" border="0"></td>
        <td width="14" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="14" height="1" border="0"></td>
        <td width="1" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="1" height="1" border="0"></td>
        <td width="14" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="14" height="1" border="0"></td>
        <td width="336" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="336" height="1" border="0"></td>
        <td width="14" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="14" height="1" border="0"></td>
    </tr>



    <tr>
        <td></td>
        <td align="left" valign="top" style="background: url(https://m.eet.com/images/eetimes/eetimes_secondary_bg.gif) repeat-y top left;" >
<div id="sitecontentcol" name="sitecontentcol">

<div id="sitecontentcol_top" name="sitecontentcol_top"></div>
<div style="width: 120px; float: left; margin-right: 28px;">
<!-- Beginning Sync AdSlot  -->
<div id='div-gpt-ad-938723337618775961-7'>
 <script type='text/javascript'>
  googletag.display('div-gpt-ad-938723337618775961-7');
 </script>
</div>
<!-- End AdSlot -->

<div class="divsplitter" style="height: 12px;"></div>
<!-- Beginning Sync AdSlot  -->
<div id='div-gpt-ad-938723337618775961-9'>
 <script type='text/javascript'>
  googletag.display('div-gpt-ad-938723337618775961-9');
 </script>
</div>
<!-- End AdSlot -->

</div>

<div class="thincontentwrapper">
<!-- 
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
<rdf:Description rdf:about="https://www.eetimes.com/document.asp?doc_id=1275470" dc:identifier="https://www.eetimes.com/document.asp?doc_id=1275470" dc:title="Optimizing for instruction caches, part 1" 
trackback:ping="https://www.eetimes.com/trackback/trackback.asp?doc_id=1275470" />
</rdf:RDF>
 -->
<link rel="pingback" href="https://www.eetimes.com/xmlrpc.asp" />

<div class="thincontentwrapper"><article>
<div id="thedoctop" name="thedoctop" class=""><img src="https://m.eet.com/images/eetimes/automotive-designline-secondary.gif" border="0" />
</div>
<div class="divsplitter" style="height: 10px;"></div><div><span class="red bigmid strong">Design How-To</span></div>
<div class="divsplitter" style="height: 4px;"></div><div><h1 class="blue header biggest">Optimizing for instruction caches, part 1</h1></div>
<div class="divsplitter" style="height: 6px;"></div><div style="float: left; margin-bottom: 14px;">
<div style="float: left; width: 285px; margin-right: 7px;"><div><span class="bigsmall gray"><a href="/document.asp?doc_id=1275470"><b>Amir Kleen, Livadariu Mircea, Itay Peled, Erez Steinberg, Moshe Anschel, Freescale</b></a></span></div><div class="divsplitter" style="height: 3px;"></div><div><span class="gray">10/29/2007 07:00 AM EDT </span><span class="blue"><br /><a href="#msgs">Post a comment</a></span></div><div class="divsplitter" style="height: 5px;"></div><div class="divsplitter" style="height: 1px;"></div>
</div>
<div style="float: right; width: 128px;"><div class="rating_wrapper"><div class="grayborderratingwrapper"><div class="grayborderratingwrapperinner"><div name="the_ratebox_1926870" id="the_ratebox_1926870"  class="docrate" ><div class="ratebox"><div class="divsplitter" style="height: 0px;"></div><div  align="left" ><div style="display: block; width: 100%;"><div align="left" style="display: block; width: 100px;"><div align="left"><span class="black smallest">NO RATINGS</span></div></div></div><div class="divsplitter"></div><div class="divsplitter" style="height: 0px;"></div><div  align="left" ><div class="loginbutton"><ul class="loginbuttons"><li class="loginbutton"><span class="gray smallest"><a href="javascript:void(0)" onClick="janrain.capture.ui.renderScreen('signIn'); return false;">Login to Rate</a></span></li></ul></div></div></div></div></div><div class="divsplitter" style="height: 1px;"><img src="https://m.eet.com/images/images/spacer.gif" width="116" height="1" border="0" /></div></div></div></div></div>
<div class="divsplitter" style="height: 5px;"></div>
<div style=""><div>
<div style="float: left; margin-right: 5px;"><div class="fb-like" data-href="https://www.eetimes.com/document.asp?doc_id=1275470" data-width="87" data-layout="button_count" data-show-faces="false" data-send="false"></div></div>
<div style="float: left;"><a href="http://twitter.com/share" class="twitter-share-button"  data-via="eetimes"  data-url="https://www.eetimes.com/document.asp?doc_id=1275470" data-count="horizontal" data-counturl="https://www.eetimes.com/document.asp?doc_id=1275470">Tweet</a><script type="text/javascript" src="//platform.twitter.com/widgets.js"></script></div>
<div style="float: left; margin-right: 5px;"><script type="text/javascript" src="//platform.linkedin.com/in.js"></script><script type="in/share" data-url="https://www.eetimes.com/document.asp?doc_id=1275470" data-counter="right"></script></div>
<div style="float: left; margin-right: 5px; width: 90px; overflow: hidden;"><g:plusone size="medium"></g:plusone>
<script type="text/javascript">
//<!--
(function() {
var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
po.src = 'https://apis.google.com/js/plusone.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
//-->
</script></div>
</div></div>
</div>
<div class="divsplitter" style="height: 0px;"></div>
<div class="grayshowlinks bigsmall" style="margin-bottom: 14px; "><p style="margin-top: 0;"><i><a href="http://www.dspdesignline.com/showArticle.jhtml;jsessionid=F2YKQINORQSJIQSNDLRCKH0CJUNN2JVN?articleID=202802303">Part 2</a> looks at the tradeoffs between program and data cache optimizations, and shows how to choose the best compromise.  It will be published Monday, November 5.  For more on this topic see <a href="http://www.dspdesignline.com/showArticle.jhtml?articleID=190300015">Optimizing for cache performance</a>.</i>
<p>
Have you ever profiled your application and asked yourself why a single-line C code function takes hundreds of cycles to execute? If so, you may be asking the wrong question. A better question to ask may be, "Why do I have a single-line function to begin with?"
<p>
With today's cache-based memories and long processor pipelines, the partitioning and structuring of code strongly affects its performance. Seemingly arbitrary software architecture decisions can have great impact on performance. In particular, code locality is a determining factor in application performance. This article will address code locality and other software architecture issues with the intent of maximizing instruction cache performance.
<p>
<b>Locality</b><br>
Cache memories work under the assumption that the processor core accesses the memory system in a local manner. When defining locality we distinguish between two types of locality:
<p>
<i>Temporal locality</i><i> </i>&ndash; <i>the idea that</i> <i>if a memory address is accessed it will be accessed again in the near future.</i> For example, loops fetch the same instructions over and over. As another example, calling and returning from functions causes stack memory to be accessed repeatedly.
<p>
<i>Spatial locality &ndash; the idea that if a memory address is accessed, nearby addresses will be accessed in the near future.</i> In the absence of a change of flow (COF), such as a conditional branch, a program typically accesses memory in a sequential fashion. When processing an array of data, an access to array member i will very likely be followed by an access to member i+1, with both members located sequentially in memory.
<p>
Figure 1 shows the memory access pattern of an example application. The X axis corresponds to time (in cycles) and the Y axis corresponds to memory locations. The highlighted sections show examples of temporal and spatial locality.
<p>
<center><a href="https://m.eet.com/media/1067326/cachefigure1_big.gif">
<img src="https://m.eet.com/media/1067324/cachefigure1.gif" border="0"><br>
<i>(Click to enlarge)</i></a><br>
Figure 1. Program access pattern example &ndash; good locality.</center>
<p>
Figure 2 shows an access pattern with poor locality. We can see that the core accesses a relatively large memory footprint without a specific order, giving the pattern poor spatial locality. We also see little temporal re-use, which also makes this code cache unfriendly.
<p>
<center><a href="https://m.eet.com/media/1067327/cachefigure2_big.gif">
<img src="https://m.eet.com/media/1067325/cachefigure2.gif" border="0"><br>
<i>(Click to enlarge)</i></a><br>
Figure 2. Program access pattern example &ndash; bad locality.</center>
<p>
The name of the game in attaining high cache utilization is reuse. The more an application reuses a section of memory, the better the utilization. For that reason, our objective is to reduce the dynamic memory footprint, that is, the size of the memory brought into the cache at runtime.
<p>
Another way to increase utilization is to leverage advanced cache features such as prefetch. These features hide memory latencies and squeeze even more performance out of the hardware. They work best when code is accessed by the core as linearly as possible.
<p>
<b>Fragmentation</b><br>
In order to reach these goals we need to look carefully how our code is fragmented in the memory. We will define two types of fragmentation.
<p>
<b>Function-based fragmentation</b><br>
When a father function calls a descendent function there may be a penalty for two reasons:
<p>
<ol>
<li>If instructions of the descendent function are not in cache, a cache miss will occur, resulting in processor stalls.
<li>When a change of flow (COF) occurs, the pipeline may need to be flushed, resulting in significant cycle penalties.
</li></li></ol>
<p>
We will look at this topic in more detail in part 3 of this series.
<p>
<b>Code-based fragmentation</b><br>
Functions often contain a significant amount of code that deals with corner cases, that is, cases which are rarely executed. This means that a large number of instructions read into cache are rarely executed, resulting in reduced cache utilization. In addition, corner cases often contain additional change of flow, increasing the number of possible cache misses.
<p>
Function-based and code-based fragmentation combined can cause very poor locality, and as a result, very poor cache utilization. Next we'll look at strategies for avoiding these problems and obtaining optimal performance.
<p>
<b>General guidelines</b><br>
Runtime vs. initialization/corner-case code &ndash; First and foremost, clearly divide your code between runtime code (i.e., frequently-called code) and initialization/corner case code. Runtime code should contain only critical code that is likely to be executed whenever your algorithm runs. Eliminating corner cases from your runtime code will minimize your dynamic memory footprint.
<p>
Linker optimization/code positioning &ndash; Functions should not be linked in an arbitrary order. The developer should think about the ordering of functions in memory, at the least for the runtime code. This should take into account the typical realtime function call tree flow of the algorithm.
</div>
</div>
<div class="divsplitter" style="height: 1px;"></div>
<div class="blue small allcaps" style="float: left; width: 243px;"><div style="float: left; margin-right: 10px;"><a rel='nofollow' href="email.asp" onclick="window.open('/email.asp?url='+encodeURIComponent(thispage_sharelink)+'&title='+encodeURIComponent(document.title),'',''); return false;">Email This</a></div><div style="float: left; margin-right: 10px;"><a rel='nofollow' href="/document.asp?doc_id=1275470&print=yes">Print</a></div><div style="float: left; margin-right: 10px;"><a href="#msgs">Comment</a></div></div>
<div style="float: right; width: 180px;" align="right"><span class="blue allcaps strong">Page 1 / 2 <a href="/document.asp?doc_id=1275470&amp;page_number=2">Next ></a> </span><div class="divsplitter" style="height: 1px;"></div></div><div id='div-gpt-ad-native'><script type='text/javascript'>googletag.cmd.push(function(){ googletag.display('div-gpt-ad-native'); });</script></div>
<div class="divsplitter" style="height: 20px;"></div>
<div><span class="red bigmid strong">More Related Links</span></div>
<div class="divsplitter" style="height: 4px;"></div><div class="" style="">
<div class="divsplitter" style="height: 8px;"></div>
<div>
<span class="blue texttallline"><a href="/author.asp?section_id=36&doc_id=1333143&">How to Make Self-Driving Car Road Testing Safe</a></span>
</div>
</div><div class="" style="">
<div class="divsplitter" style="height: 8px;"></div>
<div>
<span class="blue texttallline"><a href="/author.asp?section_id=36&doc_id=1333138&">Wireless Power Charging for EVs</a></span>
</div>
</div><div class="" style="">
<div class="divsplitter" style="height: 8px;"></div>
<div>
<span class="blue texttallline"><a href="/document.asp?doc_id=1333135&">Alibaba IoT Platform Partners with NXP for Automotive</a></span>
</div>
</div><div class="" style="">
<div class="divsplitter" style="height: 8px;"></div>
<div>
<span class="blue texttallline"><a href="/document.asp?doc_id=1333121&">Ambarella Gives Robocars Double Vision </a></span>
</div>
</div><div class="" style="">
<div class="divsplitter" style="height: 8px;"></div>
<div>
<span class="blue texttallline"><a href="/author.asp?section_id=36&doc_id=1333128&">Robocars: Time to Discuss Safety Validation</a></span>
</div>
</div>
</article>

<div class="divsplitter" style="height: 20px;"></div>

<div style="">

<div style="">

<div style="display: block; width: 423px;">
<div style="">
<div>
<span class="red bigmid strong"><a name="msgs">Comments</a></span>
</div>
<div class="divsplitter" style="height: 8px;"></div>

<div>
<span class="black allcaps">View Comments: </span>
<span class="blue allcaps">
<b>Newest First</b> | <a href="/document.asp?doc_id=1275470&amp;piddl_msgorder=asc#msgs">Oldest First</a> | <a href="/document.asp?doc_id=1275470&amp;piddl_msgorder=thrd#msgs">Threaded View</a></span></div>
<div class="divsplitter" style="height: 14px;"></div>
</div>
<!--<div style="display: block; width: 423px; height: 8px;"></div>--></div><div class="comments_wrapper">

<!-- start of msgqueue -->
<div>
<div name="msgchatparticipantslistlink" id="msgchatparticipantslistlink" align="right"></div>
<div class="divsplitter" style="height: 1px;"></div>
</div>
<div name="msgchatparticipantslistholder" id="msgchatparticipantslistholder" class="menudropdown" style="width: 150px; padding: 0;">
<div name="msgchatparticipantslist" id="msgchatparticipantslist" style="height: 200px; margin: 5px; overflow-x: hidden; overflow-y: auto;"></div>
<div style="margin-bottom: 5px;" align="right"><span class="smallest"><a href="Javascript:ShowMenu('msgchatparticipantslistholder',-500,38);">[close this box]</a></span></div>
</div>

<div id="msgqueue" name="msgqueue">
<div id="msgqueue_topdiv" name="msgqueue_topdiv"></div>


</div>
<!-- end of msgqueue -->

<div id="hidden_msgqueue" name="hidden_msgqueue" style="position: absolute; top: 500px; left: -1000px;">
<div id="hidden_msgqueue_topdiv" name="hidden_msgqueue_topdiv"></div>

</div>


<div id="nomsgheader" name="nomsgheader" style="display: block; width: 423px;"><div style=""><span class="big loginLinks"><a href="javascript:void(0)" onClick="janrain.capture.ui.renderScreen('signIn')">Be the first to <u>post a comment</u> regarding this story.</a> </span></div><div class="divsplitter" style="height: 16px;"></div>
<div class="divsplitter" style="width: 423px; height: 18px;"></div></div>

</div></div>

</div>

<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery.ajax({
			url : "/getComments.asp?authorpage=0&isAjax=true&doc_id=1275470",
			method : "GET",
			cache : false
		})
		.done(function(data){
			jQuery( ".comments_wrapper" ).html( data );
		})
		
		jQuery.ajax({
			url : "/getRatebox.asp?authorpage=0&isAjax=true&doc_id=1275470",
			method : "GET",
			cache : false
		})
		.done(function(data){
			jQuery( ".rating_wrapper" ).html( data );
		})
	});
</script>


</div>
<!-- <div ><span class="gray small"><br /><br /><i>The blogs and comments posted on EE Times do not reflect the views of EE Times, UBM Electronics, or its sponsors. EE Times, UBM Electronics, and its sponsors do not assume responsibility for any comments, claims, or opinions made by authors and bloggers. They are no substitute for your own research and should not be relied upon for trading or any other purpose.</i><br /><br /></span></div> --></div></td>
        <td width="14" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="14" height="1" border="0"></td>
        <td bgcolor="d1d1d1" width="1" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="1" height="1" border="0"></td>
        <td width="14" align="left" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="14" height="1" border="0"></td>
        <td width="336" align="left" valign="top">

<div id="sitertcol" name="sitertcol">
<div id="sitertcol_top" name="sitertcol_top"></div>

<!--<div class="divsplitter" style="height: 8px;"></div>-->

<!--<div class="divsplitter" style="height: 16px;"></div></div>-->
<div align="center"><!-- Beginning Sync AdSlot  -->
<div id='div-gpt-ad-938723337618775961-5'>
 <script type='text/javascript'>
  googletag.display('div-gpt-ad-938723337618775961-5');
 </script>
</div>
<!-- End AdSlot -->
<div class="divsplitter" style="height: 24px;"></div></div>

<div>
<div class="divsplitter" style="height: 4px; background-color: #757575;"></div>
<div style="height: 38px; background-color: #e8e8e8;">
<div class="divsplitter" style="height: 8px;"></div>
<div style="margin-left: 8px;"><span class="red bigsmall strong">Most Recent Comments</span></div>
</div>
<div class="divsplitter" style="height: 10px;"></div>
<div name="home_top_msg_thumbs_container" id="home_top_msg_thumbs_container">

<div class="home_top_msg_thumb_container" style="float: left; width: 32px; height: 32px; background: #fff; text-align: center;"><img class="home_top_msg_thumb" name="home_top_msg_img_377519" id="home_top_msg_img_377519" src="https://m.eet.com/images/eetimes/eet_default_graphic3.gif" width="28" height="28" style="border: 0; margin-top: 2px; background: #fff;" alt="emesdoublee" /></div>

<div style="float: left; width: 6px;">&nbsp;</div>
<div class="home_top_msg_thumb_container" style="float: left; width: 32px; height: 32px; background: #fff; text-align: center;"><img class="home_top_msg_thumb" name="home_top_msg_img_377518" id="home_top_msg_img_377518" src="https://m.eet.com/images/user/23202533/224213/eetimes_cropped_635301529364669705.jpg" width="28" height="28" style="border: 0; margin-top: 2px; background: #fff;" alt="Bert22306" /></div>

<div style="float: left; width: 6px;">&nbsp;</div>
<div class="home_top_msg_thumb_container" style="float: left; width: 32px; height: 32px; background: #fff; text-align: center;"><img class="home_top_msg_thumb" name="home_top_msg_img_377517" id="home_top_msg_img_377517" src="https://m.eet.com/images/eetimes/eet_default_graphic3.gif" width="28" height="28" style="border: 0; margin-top: 2px; background: #fff;" alt="Evariste" /></div>

<div style="float: left; width: 6px;">&nbsp;</div>
<div class="home_top_msg_thumb_container" style="float: left; width: 32px; height: 32px; background: #fff; text-align: center;"><img class="home_top_msg_thumb" name="home_top_msg_img_377516" id="home_top_msg_img_377516" src="https://d1lqe9temigv1p.cloudfront.net/img/7d0856ad0f353d883a70de8afeae62ff9ab1bc5f.jpg" width="28" height="28" style="border: 0; margin-top: 2px; background: #fff;" alt="photoelectron" /></div>

<div style="float: left; width: 6px;">&nbsp;</div>
<div class="home_top_msg_thumb_container" style="float: left; width: 32px; height: 32px; background: #fff; text-align: center;"><img class="home_top_msg_thumb" name="home_top_msg_img_377515" id="home_top_msg_img_377515" src="https://m.eet.com/images/user/2773713/411633/rmerrit_125x125.jpg" width="28" height="28" style="border: 0; margin-top: 2px; background: #fff;" alt="rick merritt" /></div>

<div style="float: left; width: 6px;">&nbsp;</div>
<div class="home_top_msg_thumb_container" style="float: left; width: 32px; height: 32px; background: #fff; text-align: center;"><img class="home_top_msg_thumb" name="home_top_msg_img_377514" id="home_top_msg_img_377514" src="https://m.eet.com/images/eetimes/eet_default_graphic3.gif" width="28" height="28" style="border: 0; margin-top: 2px; background: #fff;" alt="realjjj" /></div>

<div style="float: left; width: 6px;">&nbsp;</div>
<div class="home_top_msg_thumb_container" style="float: left; width: 32px; height: 32px; background: #fff; text-align: center;"><img class="home_top_msg_thumb" name="home_top_msg_img_377513" id="home_top_msg_img_377513" src="https://m.eet.com/images/eetimes/eet_default_graphic3.gif" width="28" height="28" style="border: 0; margin-top: 2px; background: #fff;" alt="realjjj" /></div>

<div style="float: left; width: 6px;">&nbsp;</div>
<div class="home_top_msg_thumb_container" style="float: left; width: 32px; height: 32px; background: #fff; text-align: center;"><img class="home_top_msg_thumb" name="home_top_msg_img_377512" id="home_top_msg_img_377512" src="https://m.eet.com/images/eetimes/eet_default_graphic3.gif" width="28" height="28" style="border: 0; margin-top: 2px; background: #fff;" alt="DeeJee0" /></div>

<div style="float: left; width: 6px;">&nbsp;</div>
<div class="home_top_msg_thumb_container" style="float: left; width: 32px; height: 32px; background: #fff; text-align: center;"><img class="home_top_msg_thumb" name="home_top_msg_img_377511" id="home_top_msg_img_377511" src="https://m.eet.com/images/eetimes/eet_default_graphic3.gif" width="28" height="28" style="border: 0; margin-top: 2px; background: #fff;" alt="peterprism" /></div>

<div name="home_top_msg_container" id="home_top_msg_container"><div class="divsplitter" style="height: 12px;"></div>
<div style="float: left; width: 81px;">
<img src="https://m.eet.com/images/eetimes/quote.gif" alt="Most Recent Messages" style="border: 0; width: 72px; height: 69px;" />
<div class="divsplitter" style="height: 14px;"></div>
<span class="small gray">4/8/2018<br/>1:01:34 PM</span>
</div>
<div style="float: left; width: 255px; padding-top: 1px; overflow: hidden;">
<div><span class="gray bigmid"><a href="/messages.asp?piddl_msgthreadid=51361&piddl_msgid=377519&piddl_msgtocontent=yes#msg_377519"><b>emesdoublee</b> Headline: Februrary chip sales down from jan.
First sentence: January chip sales down from feb.
&nbsp;
fyi</a></span></div>
</div>
</div>

</div>
<div class="divsplitter" style="height: 19px;"></div>
</div>
<script language="Javascript">
$(document).ready(function() {
HomeTopMsgsInitialize(); 
});
</script>
<div name="home_top_msg_content_377519" id="home_top_msg_content_377519" style="display: none;">
<div class="divsplitter" style="height: 12px;"></div>
<div style="float: left; width: 81px;">
<img src="https://m.eet.com/images/eetimes/quote.gif" alt="Most Recent Messages" style="border: 0; width: 72px; height: 69px;" />
<div class="divsplitter" style="height: 14px;"></div>
<span class="small gray">4/8/2018<br/>1:01:34 PM</span>
</div>
<div style="float: left; width: 255px; padding-top: 1px; overflow: hidden;">
<div><span class="gray bigmid"><a href="/messages.asp?piddl_msgthreadid=51361&piddl_msgid=377519&piddl_msgtocontent=yes#msg_377519"><b>emesdoublee</b> Headline: Februrary chip sales down from jan.
First sentence: January chip sales down from feb.
&nbsp;
fyi</a></span></div>
</div>
</div>
<div name="home_top_msg_content_377518" id="home_top_msg_content_377518" style="display: none;">
<div class="divsplitter" style="height: 12px;"></div>
<div style="float: left; width: 81px;">
<img src="https://m.eet.com/images/eetimes/quote.gif" alt="Most Recent Messages" style="border: 0; width: 72px; height: 69px;" />
<div class="divsplitter" style="height: 14px;"></div>
<span class="small gray">4/7/2018<br/>7:09:03 PM</span>
</div>
<div style="float: left; width: 255px; padding-top: 1px; overflow: hidden;">
<div><span class="gray bigmid"><a href="/messages.asp?piddl_msgthreadid=51349&piddl_msgid=377518&piddl_msgtocontent=yes#msg_377518"><b>Bert22306</b> I wouldn't go overboard on this. I mean sure, if you willingly submit to social media sites, you know your info isn't going to remain private. As I suggested previously, in the...</a></span></div>
</div>
</div>
<div name="home_top_msg_content_377517" id="home_top_msg_content_377517" style="display: none;">
<div class="divsplitter" style="height: 12px;"></div>
<div style="float: left; width: 81px;">
<img src="https://m.eet.com/images/eetimes/quote.gif" alt="Most Recent Messages" style="border: 0; width: 72px; height: 69px;" />
<div class="divsplitter" style="height: 14px;"></div>
<span class="small gray">4/7/2018<br/>6:33:34 PM</span>
</div>
<div style="float: left; width: 255px; padding-top: 1px; overflow: hidden;">
<div><span class="gray bigmid"><a href="/messages.asp?piddl_msgthreadid=51359&piddl_msgid=377517&piddl_msgtocontent=yes#msg_377517"><b>Evariste</b> I thought it wasn't serious but it was difficult to tell at first. &nbsp;(I should've paid greater attention to the title.) I wonder if 3D printers might "democratize" weapons...</a></span></div>
</div>
</div>
<div name="home_top_msg_content_377516" id="home_top_msg_content_377516" style="display: none;">
<div class="divsplitter" style="height: 12px;"></div>
<div style="float: left; width: 81px;">
<img src="https://m.eet.com/images/eetimes/quote.gif" alt="Most Recent Messages" style="border: 0; width: 72px; height: 69px;" />
<div class="divsplitter" style="height: 14px;"></div>
<span class="small gray">4/6/2018<br/>4:25:39 PM</span>
</div>
<div style="float: left; width: 255px; padding-top: 1px; overflow: hidden;">
<div><span class="gray bigmid"><a href="/messages.asp?piddl_msgthreadid=51357&piddl_msgid=377516&piddl_msgtocontent=yes#msg_377516"><b>photoelectron</b> Spoken like someone from the US financial industry. The world has always been polarized and competitive. And so have you as I assume you have made a good living. You state:...</a></span></div>
</div>
</div>
<div name="home_top_msg_content_377515" id="home_top_msg_content_377515" style="display: none;">
<div class="divsplitter" style="height: 12px;"></div>
<div style="float: left; width: 81px;">
<img src="https://m.eet.com/images/eetimes/quote.gif" alt="Most Recent Messages" style="border: 0; width: 72px; height: 69px;" />
<div class="divsplitter" style="height: 14px;"></div>
<span class="small gray">4/6/2018<br/>2:02:51 PM</span>
</div>
<div style="float: left; width: 255px; padding-top: 1px; overflow: hidden;">
<div><span class="gray bigmid"><a href="/messages.asp?piddl_msgthreadid=51359&piddl_msgid=377515&piddl_msgtocontent=yes#msg_377515"><b>rick merritt</b> See https://en.wikipedia.org/wiki/A_Modest_Proposal
&nbsp;</a></span></div>
</div>
</div>
<div name="home_top_msg_content_377514" id="home_top_msg_content_377514" style="display: none;">
<div class="divsplitter" style="height: 12px;"></div>
<div style="float: left; width: 81px;">
<img src="https://m.eet.com/images/eetimes/quote.gif" alt="Most Recent Messages" style="border: 0; width: 72px; height: 69px;" />
<div class="divsplitter" style="height: 14px;"></div>
<span class="small gray">4/6/2018<br/>12:10:48 PM</span>
</div>
<div style="float: left; width: 255px; padding-top: 1px; overflow: hidden;">
<div><span class="gray bigmid"><a href="/messages.asp?piddl_msgthreadid=51360&piddl_msgid=377514&piddl_msgtocontent=yes#msg_377514"><b>realjjj</b> Memory prices are harming smartphone sales in mid and low, future drivers are ... foldable displays, anything else is very little compared to that. Tablet and PC take a major...</a></span></div>
</div>
</div>
<div name="home_top_msg_content_377513" id="home_top_msg_content_377513" style="display: none;">
<div class="divsplitter" style="height: 12px;"></div>
<div style="float: left; width: 81px;">
<img src="https://m.eet.com/images/eetimes/quote.gif" alt="Most Recent Messages" style="border: 0; width: 72px; height: 69px;" />
<div class="divsplitter" style="height: 14px;"></div>
<span class="small gray">4/6/2018<br/>11:59:02 AM</span>
</div>
<div style="float: left; width: 255px; padding-top: 1px; overflow: hidden;">
<div><span class="gray bigmid"><a href="/messages.asp?piddl_msgthreadid=51359&piddl_msgid=377513&piddl_msgtocontent=yes#msg_377513"><b>realjjj</b> Your proposal is a more efficient way of killing people, it's the very opposite of what one wants. Guns kill 30-35k Americans every year, very very few are mass shootings, lots...</a></span></div>
</div>
</div>
<div name="home_top_msg_content_377512" id="home_top_msg_content_377512" style="display: none;">
<div class="divsplitter" style="height: 12px;"></div>
<div style="float: left; width: 81px;">
<img src="https://m.eet.com/images/eetimes/quote.gif" alt="Most Recent Messages" style="border: 0; width: 72px; height: 69px;" />
<div class="divsplitter" style="height: 14px;"></div>
<span class="small gray">4/6/2018<br/>10:39:28 AM</span>
</div>
<div style="float: left; width: 255px; padding-top: 1px; overflow: hidden;">
<div><span class="gray bigmid"><a href="/messages.asp?piddl_msgthreadid=51349&piddl_msgid=377512&piddl_msgtocontent=yes#msg_377512"><b>DeeJee0</b> As Yunko Yoshida and Rick Merritt already mentioned, there is no personal choice or personal control left once pandora's box is opened. That is an illusion. Let us take Brexit,...</a></span></div>
</div>
</div>
<div name="home_top_msg_content_377511" id="home_top_msg_content_377511" style="display: none;">
<div class="divsplitter" style="height: 12px;"></div>
<div style="float: left; width: 81px;">
<img src="https://m.eet.com/images/eetimes/quote.gif" alt="Most Recent Messages" style="border: 0; width: 72px; height: 69px;" />
<div class="divsplitter" style="height: 14px;"></div>
<span class="small gray">4/6/2018<br/>5:46:11 AM</span>
</div>
<div style="float: left; width: 255px; padding-top: 1px; overflow: hidden;">
<div><span class="gray bigmid"><a href="/messages.asp?piddl_msgthreadid=51358&piddl_msgid=377511&piddl_msgtocontent=yes#msg_377511"><b>peterprism</b> It is a very good step from IBM that they are into Quantum network can Quickbooks Support be added with Q network</a></span></div>
</div>
</div>
<script language="Javascript">
function HomeTopMsgsInitialize() {
// attach mouseover functions
$('.home_top_msg_thumb_container').first().css('background','#c4161c');
$('.home_top_msg_thumb').mouseover(function() {
$('.home_top_msg_thumb_container').css('background','#fff');
$(this).parent('.home_top_msg_thumb_container').css('background','#c4161c');
var thisTopMsgThumbObjName = $(this).attr('id');
var thisTopMsgThumbObjNumberAsString = thisTopMsgThumbObjName.replace('home_top_msg_img_','');
var thisTopMsgThumbObjNumber = parseInt(thisTopMsgThumbObjNumberAsString);
HomeTopMsgPop(thisTopMsgThumbObjNumber);
});
// align to first
AlignArrowWithMsgThumbnail(377519);
}

function AlignArrowWithMsgThumbnail(inMsgID) {
// var theAlignObj = $('#home_top_msg_img_' + inMsgID);
// if (theAlignObj.length != 0) {
// $('#home_top_msg_arrow').css('display','block');
// var theAlignObjOffset = theAlignObj.offset();
// $('#home_top_msg_arrow').css('top',''+ (theAlignObjOffset.top + 38 - 1) +'px');
// $('#home_top_msg_arrow').css('left',''+ (theAlignObjOffset.left + 4) +'px');
// }
}

function HomeTopMsgPop(inMsgID){
var thePopInHTML = $('#home_top_msg_content_' + inMsgID).html();
$('#home_top_msg_container').html(thePopInHTML);
AlignArrowWithMsgThumbnail(inMsgID);
}
</script>
<div align="center"><!-- Beginning Sync AdSlot  -->
<div id='div-gpt-ad-938723337618775961-6'>
 <script type='text/javascript'>
  googletag.display('div-gpt-ad-938723337618775961-6');
 </script>
</div>
<!-- End AdSlot -->
<div class="divsplitter" style="height: 24px;"></div></div>

<div>
<div class="divsplitter" style="height: 4px; background-color: #757575;"></div>
<div style="height: 38px; background-color: #e8e8e8;">
<div class="divsplitter" style="height: 8px;"></div>
<div style="margin-left: 8px;"><span class="gray bigsmall strong">Navigate to Related Links </span></div>
</div>
<div class="divsplitter" style="height: 12px;"></div><div class=" docrightcolblock " style="">
<div>
<span class="blue texttallline"><a href="/author.asp?section_id=36&doc_id=1333143&">How to Make Self-Driving Car Road Testing Safe</a></span>
</div>
<div class="divsplitter" style="height: 0px;"></div>
</div>
<div class="divsplitter" style="height: 8px;"></div><div class=" docrightcolblock " style="">
<div>
<span class="blue texttallline"><a href="/author.asp?section_id=36&doc_id=1333138&">Wireless Power Charging for EVs</a></span>
</div>
<div class="divsplitter" style="height: 0px;"></div>
</div>
<div class="divsplitter" style="height: 8px;"></div><div class=" docrightcolblock " style="">
<div>
<span class="blue texttallline"><a href="/document.asp?doc_id=1333135&">Alibaba IoT Platform Partners with NXP for Automotive</a></span>
</div>
<div class="divsplitter" style="height: 0px;"></div>
</div>
<div class="divsplitter" style="height: 8px;"></div><div class=" docrightcolblock " style="">
<div>
<span class="blue texttallline"><a href="/document.asp?doc_id=1333121&">Ambarella Gives Robocars Double Vision </a></span>
</div>
<div class="divsplitter" style="height: 0px;"></div>
</div>
<div class="divsplitter" style="height: 8px;"></div><div class=" docrightcolblock " style="">
<div>
<span class="blue texttallline"><a href="/author.asp?section_id=36&doc_id=1333128&">Robocars: Time to Discuss Safety Validation</a></span>
</div>
<div class="divsplitter" style="height: 0px;"></div>
</div>
<div class="divsplitter" style="height: 8px;"></div><div class="divsplitter" style="height: 16px;"></div>
</div>
        
<div id="se_widget_hook"></div>

<div class="docrightcolblock">
<div class="divsplitter" style="height: 4px; background-color: #757575;"></div>
<div style="height: 38px; background-color: #e8e8e8;">
<div id="rightcol_cartoon_button" name="rightcol_cartoon_button" style="float: left; width: 67px; margin-top: 8px; margin-left: 8px;" class="red bigsmall strong"><a href="Javascript:ToggleCartoonContest('technicalpapers');">Cartoon</a> </div>

<div style="float: left; width: 2px; height: 38px; background-color: #ffffff;"></div>
<div id="rightcol_contest_button" name="rightcol_contest_button" style="float: left; margin-top: 8px; margin-left: 8px;" class="gray bigsmall strong"><a href="Javascript:ToggleCartoonContest('webinars');">Contest</a> </div>

</div>
<div style="background-color: #e8e8e8; border-bottom: 6px solid #e8e8e8;">


<div id="rightcol_cartoon" name="rightcol_cartoon" style="display: block;">
<div style="width: 300px; margin: 0 auto; background: #fff; padding: 0 12px;">
<div class="divsplitter" style="height: 12px;"></div>
<div style="margin: 0 auto; background: #fff;">
<span class="blue bigmid strong"><a href="/document.asp?doc_id=1332862">February 2018 Cartoon Caption Contest: &ldquo;I&rsquo;ve Got the Power&rdquo;</a></span>
<div class="divsplitter" style="height: 11px;"></div>
<a href="/document.asp?doc_id=1332862"><img border="0" src="https://m.eet.com/media/1302183/EETCartoonFeb18.jpg" width="100%" alt="February 2018 Cartoon Caption Contest: &ldquo;I&rsquo;ve Got the Power&rdquo;"/></a>
<div class="divsplitter" style="height: 6px;"></div>
<span class="black">When Edgar ordered his new scope, he thought “3000A” was the model number, not the current draw.</span>
<div class="divsplitter" style="height: 9px;"></div>
<span class="blue"><a href="/document.asp?doc_id=1332862#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" border="0" style="margin-right: 3px;" />86 comments</a></span>

</div>
<div class="divsplitter" style="height: 12px;"></div>
<div><span class="blue small allcaps"><a href="/archives.asp?section_id=195">All Cartoons</a></span></div>
<div class="divsplitter" style="height: 12px;"></div>
</div>
</div>

<div id="rightcol_contest" name="rightcol_contest" style="display: none;">
<div style="width: 308px; margin: 0 auto; background: #fff; padding: 0 10px;">
<div class="divsplitter" style="height: 12px;"></div>
<div style="margin: 0 auto; background: #fff;">
<span class="blue bigmid strong"><a href="/document.asp?doc_id=1332789">January 2018 Cartoon Caption Contest: "Let it Snow"</a></span>
<div class="divsplitter" style="height: 11px;"></div>
<a href="/document.asp?doc_id=1332789"><img border="0" src="https://m.eet.com/media/1301770/EETCartoon_January18.jpg" width="100%" alt="January 2018 Cartoon Caption Contest: "Let it Snow""/></a>
<div class="divsplitter" style="height: 6px;"></div>
<span class="black">It was clear to Andy that the procurement department had misunderstood his request for a new insulation test lab.</span>
<div class="divsplitter" style="height: 9px;"></div>
<span class="blue"><a href="/document.asp?doc_id=1332789#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" border="0" style="margin-right: 3px;" />70 comments</a></span>

</div>
<div class="divsplitter" style="height: 12px;"></div>
<div><span class="blue small allcaps"><a href="/archives.asp?section_id=195">All Cartoons</a></span></div>
<div class="divsplitter" style="height: 12px;"></div>
</div>
</div>

</div>
</div>
<div class="divsplitter" style="height: 24px;"></div>
    
<script language="Javascript">
function ToggleCartoonContest(theTab) {
    if (theTab == 'technicalpapers') {
        $('#rightcol_contest').hide();
        $('#rightcol_cartoon').show();
        $('#rightcol_cartoon_button').removeClass('gray').addClass('red');
        $('#rightcol_contest_button').removeClass('red').addClass('gray');
    } else {
        $('#rightcol_contest').show();
        $('#rightcol_cartoon').hide();
        $('#rightcol_contest_button').removeClass('gray').addClass('red');
        $('#rightcol_cartoon_button').removeClass('red').addClass('gray');
    }
}
</script>

<div class="docrightcolblock">
<div class="divsplitter" style="height: 4px; background-color: #757575;"></div>
<div style="height: 38px; background-color: #e8e8e8;">
<div id="rightcol_mostcommented_button" name="rightcol_mostcommented_button" style="float: left; width: 132px; margin-top: 8px; margin-left: 8px;" class="red bigsmall strong"><a href="Javascript:ToggleMostCommentedMostPop();">Most Commented</a> </div>
<div style="float: left; width: 2px; height: 38px; background-color: #ffffff;"></div>
<div id="rightcol_mostpopular_button" name="rightcol_mostpopular_button" style="float: left; margin-top: 8px; margin-left: 8px;" class="gray bigsmall strong"><a href="Javascript:ToggleMostCommentedMostPop();">Most Popular</a> </div>
</div>
<div class="divsplitter" style="height: 10px;"></div>

<div id="rightcol_mostcommented" name="rightcol_mostcommented" style="display: block;">
<div style="">
<span class="blue" style=""><a href="/document.asp?doc_id=1333092#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;35 </a> &nbsp;</span>
<span class="blue"><a href="/document.asp?doc_id=1333092">Is Robocar Death the Price of Progress?</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/document.asp?doc_id=1333113#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;30 </a> &nbsp;</span>
<span class="blue"><a href="/document.asp?doc_id=1333113">Robo-Uber: What Went Wrong</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/document.asp?doc_id=1332972#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;23 </a> &nbsp;</span>
<span class="blue"><a href="/document.asp?doc_id=1332972">An Engineer’s Guide to Sexism</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/author.asp?section_id=36&doc_id=1333043#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;20 </a> &nbsp;</span>
<span class="blue"><a href="/author.asp?section_id=36&doc_id=1333043">Intel Needs New Strategies, ASAP</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/author.asp?section_id=36&doc_id=1333020#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;18 </a> &nbsp;</span>
<span class="blue"><a href="/author.asp?section_id=36&doc_id=1333020">Empowering Diversity in STEM</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/author.asp?section_id=36&doc_id=1332957#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;17 </a> &nbsp;</span>
<span class="blue"><a href="/author.asp?section_id=36&doc_id=1332957">What #metoo Means to High Tech</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/author.asp?section_id=36&doc_id=1333128#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;16 </a> &nbsp;</span>
<span class="blue"><a href="/author.asp?section_id=36&doc_id=1333128">Robocars: Time to Discuss Safety Validation</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/author.asp?section_id=36&doc_id=1333138#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;16 </a> &nbsp;</span>
<span class="blue"><a href="/author.asp?section_id=36&doc_id=1333138">Wireless Power Charging for EVs</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/document.asp?doc_id=1333037#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;15 </a> &nbsp;</span>
<span class="blue"><a href="/document.asp?doc_id=1333037">Broadcom Bid Gets U.S. Scrutiny</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/author.asp?section_id=36&doc_id=1333060#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;14 </a> &nbsp;</span>
<span class="blue"><a href="/author.asp?section_id=36&doc_id=1333060">5 Thoughts on GF and Sanjay Jha</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>

</div>

<div id="rightcol_mostpopular" name="rightcol_mostpopular" style="display: none;">
<div style="">
<span class="blue" style=""><a href="/author.asp?section_id=36&doc_id=1333144#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;6 </a> &nbsp;</span>
<span class="blue"><a href="/author.asp?section_id=36&doc_id=1333144">Are We Master or Machine?</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/document.asp?doc_id=1333153#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;5 </a> &nbsp;</span>
<span class="blue"><a href="/document.asp?doc_id=1333153">Trump's Tariff List to Impact Supply Chain</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/author.asp?section_id=36&doc_id=1333143#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;3 </a> &nbsp;</span>
<span class="blue"><a href="/author.asp?section_id=36&doc_id=1333143">How to Make Self-Driving Car Road Testing Safe</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/author.asp?section_id=36&doc_id=1333157#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;3 </a> &nbsp;</span>
<span class="blue"><a href="/author.asp?section_id=36&doc_id=1333157">A Modest Proposal for Smart Weapons</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/document.asp?doc_id=1333150#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;3 </a> &nbsp;</span>
<span class="blue"><a href="/document.asp?doc_id=1333150">Intel Could Lose Apple Business on Two Fronts </a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/document.asp?doc_id=1333148#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;2 </a> &nbsp;</span>
<span class="blue"><a href="/document.asp?doc_id=1333148">FCC Votes to Exempt Small Cells from Reviews</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/document.asp?doc_id=1333146#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;2 </a> &nbsp;</span>
<span class="blue"><a href="/document.asp?doc_id=1333146">Excluded from M&A, China Focuses on Expansion</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/document.asp?doc_id=1333152#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;2 </a> &nbsp;</span>
<span class="blue"><a href="/document.asp?doc_id=1333152">AI Connects Imagination, Leo Li, China</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/document.asp?doc_id=1333154#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;1 </a> &nbsp;</span>
<span class="blue"><a href="/document.asp?doc_id=1333154">Former Spreadtrum CEO to Lead Imagination</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>
<div style="">
<span class="blue" style=""><a href="/document.asp?doc_id=1333155#msgs"><img src="https://m.eet.com/images/eetimes/ballon_w_white_bg.gif" width="14" height="10" border="0" style="position: inline;" />&nbsp;1 </a> &nbsp;</span>
<span class="blue"><a href="/document.asp?doc_id=1333155">Chipmakers Expand R&D Amid France's New AI ...</a> </span>
</div>
<div class="divsplitter" style="height: 2px;"></div>

</div>

</div>
<div class="divsplitter" style="height: 24px;"></div>

<script language="Javascript">
var currentMostCommentedMostPop = 'most_commented';

function ToggleMostCommentedMostPop() {
    if (currentMostCommentedMostPop == 'most_commented') {
        $('#rightcol_mostcommented').hide();
        $('#rightcol_mostpopular').show();
        $('#rightcol_mostcommented_button').removeClass('red');
        $('#rightcol_mostpopular_button').removeClass('gray');
        $('#rightcol_mostcommented_button').addClass('gray');
        $('#rightcol_mostpopular_button').addClass('red');
        currentMostCommentedMostPop = 'most_popular';
    } else {
        $('#rightcol_mostcommented').show();
        $('#rightcol_mostpopular').hide();
        $('#rightcol_mostcommented_button').removeClass('gray');
        $('#rightcol_mostpopular_button').removeClass('red');
        $('#rightcol_mostcommented_button').addClass('red');
        $('#rightcol_mostpopular_button').addClass('gray');
        currentMostCommentedMostPop = 'most_commented';
    }
}
</script>

<div class="docrightcolblock">
    <div style="float: left; width: 152px; height: 30px;">
        <a href="http://www.datasheets.com/search/index.jsp" target="_blank"><img src="https://m.eet.com/images/eetimes/launch_box_datasheets.gif" width="152" style="border: none;" /></a>
    </div>
    <div style="float: left; width: 15px; height: 30px;"><img src="https://m.eet.com/images/images/spacer.gif" width="15" style="border: none;" /></div>
    <div style="float: left; width: 152px; height: 30px;">
        <a href="/archives.asp?videoblogs=yes&tag_id=222" target="_blank"><img src="https://m.eet.com/content/images/eetimes/Linear-Technologies-Interim-CMYK-FullColor1_1498805338.jpg" style="border: none;" /></a>
    </div>
    <div class="divsplitter" style="height: 12px;"></div>
    <!--<div style="float: left; width: 152px; height: 30px;">
        <a href="http://www.iotworld.com" target="_blank"><img src="https://m.eet.com/images/eetimes/IoT_button_ad.gif" width="152" style="border: none;" /></a>
    </div>
    <div style="float: left; width: 32px; height: 30px;"><img src="https://m.eet.com/images/images/spacer.gif" width="32" style="border: none;" /></div>-->
    
</div>
<div class="divsplitter" style="height: 26px;"></div>

<div class="docrightcolblock">
<div class="divsplitter" style="height: 4px; background-color: #757575;"></div>
<div style="height: 38px; background-color: #e8e8e8;">
<div class="divsplitter" style="height: 8px;"></div>
<div style="margin-left: 8px;"><span class="red bigsmall strong">Like Us on Facebook </span></div>
</div>
<div class="divsplitter" style="height: 4px;"></div>
<div style="background-color: #E8E8E8;"><div class="fb-like-box" data-href="https://www.facebook.com/EETimes" data-width="336" data-show-faces="true" data-stream="false" data-header="false"></div></div>
<div class="divsplitter" style="height: 26px;"></div>
</div>

<div class="docrightcolblock">
<div class="divsplitter" style="height: 4px; background-color: #757575;"></div><div style="height: 38px; background-color: #e8e8e8;">
<div style="float: left; margin-top: 8px; margin-left: 8px;"><span class="red bigsmall strong">EE Times on Twitter </span></div>
<div style="float: right;"><img src="https://m.eet.com/images/eetimes/twitter_bird.gif" border="0" alt="EE Times Twitter Feed" /></div>
<div style="float: right; margin-top: 8px;"><span class="bigsmall"><a href="http://twitter.com/eetimes" target="_blank" style="color: #33ccff;">follow us</a></span></div>
</div>
<a class="twitter-timeline" href="https://twitter.com/search?q=from%3Aeetimes" data-widget-id="349958852311134208" width="336" height="400" data-chrome="noheader nofooter">Tweets about "from:eetimes"</a>
<script>!function(d,s,id){ var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){ js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs); } }(document,"script","twitter-wjs");</script>

<div class="divsplitter" style="height: 24px;"></div>
</div>
<div align="center"><!-- Beginning Sync AdSlot  -->
<div id='div-gpt-ad-938723337618775961-10'>
 <script type='text/javascript'>
  googletag.display('div-gpt-ad-938723337618775961-10');
 </script>
</div>
<!-- End AdSlot -->
</div>

</div></td>
        <td></td>
    </tr>
    <tr>
        <td colspan="7" align="center" valign="top"><img src="https://m.eet.com/images/images/spacer.gif" width="1" height="24" border="0"></td>
    </tr>
    <tr>
        <td colspan="7" align="center" valign="top">
			<div align="center" style="width: 970px; min-height: 90px;">
				<!-- Beginning Sync AdSlot  -->
<div id='div-gpt-ad-629123393593213932-14'>
 <script type='text/javascript'>
  googletag.display('div-gpt-ad-629123393593213932-14');
 </script>
</div>
<!-- End AdSlot -->

			</div>
		</td>
    </tr>
    <tr>
        <td colspan="7" align="center" valign="top">
<footer>

<!-- BEGIN BLACK FOOTER -->
  <div id="footergrey">
	  <div>
		<ul class="ubm-global-network hide-for-small">
			<ul>
                <li class="first"><strong>ASPENCORE NETWORK</strong> </li>
            </ul>
			<li><a href="https://www.ebnonline.com/" target="_blank">EBN</a></li>   |   
			<li><a href="https://www.edn.com/" target="_blank">EDN</a></li>   |   
			<li><a href="https://www.eetimes.com/" target="_blank">EE&nbsp;Times</a></li>   |   
			<li><a href="https://www.eeweb.com/" target="_blank">EEWeb</a></li>   |   
			<li><a href="http://www.electronicproducts.com/" target="_blank">Electronic&nbsp;Products</a></li>   |   
			<li><a href="http://www.electronics-tutorials.ws/" target="_blank">Electronics-Tutorials</a></li>   |   
			<li><a href="https://www.embedded.com/" target="_blank">Embedded</a></li>   |   
			<li><a href="https://www.planetanalog.com/" target="_blank">Planet&nbsp;Analog</a></li>   |   
			<li><a href="http://www.electroschematics.com/" target="_blank">ElectroSchematics</a></li>   |   
			<li><a href="http://www.powerelectronicsnews.com/" target="_blank">Power&nbsp;Electronics&nbsp;News</a></li>   |   
			<li><a href="https://www.techonline.com/" target="_blank">TechOnline</a></li>   |   
			<li><a href="http://www.datasheets.com/" target="_blank">Datasheets.com</a></li>   |   
			<li><a href="http://www.embedded-control-europe.com/" target="_blank">Embedded&nbsp;Control&nbsp;Europe</a></li>   |   
			<li><a href="http://www.embedded-know-how.com/ " target="_blank">Embedded&nbsp;Know&nbsp;How</a></li>   |   
			<li><a href="http://embedded-news.tv/" target="_blank">Embedded&nbsp;News</a></li>   |   
			<li><a href="http://iot-design-zone.com/" target="_blank">IOT&nbsp;Design&nbsp;Zone</a></li>   |   
			<li><a href="http://motor-control-design.com/" target="_blank">Motor&nbsp;Control&nbsp;Design</a></li>   |   
			<li><a href="http://electronics-know-how.com/" target="_blank">Electronics&nbsp;Know&nbsp;How</a></li>   |   
			<li><a href="https://iot.eetimes.com/" target="_blank">IoT&nbsp;Times</a></li>   |   
		</ul>
		<ul class="ubm-global-network hide-for-small">
				<ul>
					<li class="first"><strong>GLOBAL NETWORK</strong> </li>
				</ul>
				<li><a target="_blank" href="http://www.eetasia.com/">EE&nbsp;Times&nbsp;Asia</a></li>   |   
				<li><a target="_blank" href="http://www.eet-china.com/">EE&nbsp;Times&nbsp;China</a></li>   |      
				<li><a target="_blank" href="http://www.eetindia.co.in/">EE&nbsp;Times&nbsp;India</a></li>   |   
				<li><a target="_blank" href="http://eetimes.jp/">EE&nbsp;Times&nbsp;Japan</a></li>   |   
				<li><a target="_blank" href="http://www.eettaiwan.com/">EE&nbsp;Times&nbsp;Taiwan</a></li>   |   
				<li><a target="_blank" href="http://www.ednasia.com/">EDN&nbsp;Asia</a></li>   |   
				<li><a target="_blank" href="http://www.ednchina.com/">EDN&nbsp;China</a></li>   |   
				<li><a target="_blank" href="http://www.edntaiwan.com/">EDN&nbsp;Taiwan</a></li>   |   
				<li><a target="_blank" href="http://ednjapan.com/">EDN&nbsp;Japan</a></li>   |   
				<li><a target="_blank" href="http://www.esmchina.com/">ESM&nbsp;China</a></li>   |   
		</ul>
		</div>
    <div style="clear:both;"></div><!-- // to clear the right and left evenly // -->
    <!-- BLACK FOOTER LEFT SIDE --
    <div id="left">
    <a href="http://ubmcanon.com/" target="_blank"><img src="https://m.eet.com/images/images/spacer.gif" width="88" height="111" border="0" alt="UBM Tech" id="UBM_global_footer_img"></a>
    </div><!-- /BLACK FOOTER LEFT SIDE --
    <!--BLACK FOOTER rightlinks SIDE -->
    <div id="rightlinks">
      <ul class="normal">
        <li><strong>Working With Us:</strong></li>
		<li><a href="http://www.aspencore.com/" target="_blank" class="normal">About</a></li>  |
        <li><a href="http://mac.aspencore.com/AspenCore_Contact-Us.html" target="_blank" class="normal">Contact Us</a></li>  |
        <li><a href="http://mac.aspencore.com/AspenCore_Media-Guide.html" target="_blank" class="normal">Media Kits</a></li>   
      </ul>
      <ul class="blue">
        <li><a href="http://www.aspencore.com/terms-of-use" target="_blank" class="blue">Terms of Service</a></li>  |
        <li><a href="http://www.aspencore.com/privacy-policy" target="_blank" class="blue">Privacy Statement</a></li>  |
        <li>Copyright &#169; 2018 AspenCore All Rights Reserved</li>
      </ul>
    </div><!-- / BLACK FOOTER rightlinks -->
    <div style="clear:both;"></div><!-- // to clear the right and left evenly // -->
  </div><!-- END footerblack -->
<!-- / END BLACK FOOTER -->
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
</footer>
</td>
    </tr>
</table>

</div></td>
<td width="2" style="background-color: #d1d1d1;"><img src="https://m.eet.com/images/images/spacer.gif" width="2" height="1" border="0"></td>
<td width="8"><img src="https://m.eet.com/images/images/spacer.gif" width="8" height="1" border="0"></td>
</tr>
</table>
</div>
</div>



<img src="/client_pathlog.asp?p=%2Feetimes%2Fsection%2F89&f=%2Feetimes%2Fsection%2F89%2F1275470&rndserial=73519" border="0" width="1" height="1">



<script type="text/javascript">
    _bizo_data_partner_id = "1322";
</script>
<script type="text/javascript">
    (function () { (function () { var b, a; a = document.createElement("script"); a.type = "text/javascript"; a.async = true; a.src = "" + (window.location.protocol === "https:" ? "https://sjs." : "http://js.") + "bizographics.com/insight.min.js"; b = document.getElementsByTagName("script")[0]; return b.parentNode.insertBefore(a, b) })(); })();
</script>

<script type="text/javascript">
adroll_adv_id = "GWVPIA5KRVBEJHYCODO6ZW";
adroll_pix_id = "NKTHNRRVXBGWZOI4JB5YNL";
(function () {
    var oldonload = window.onload;
    window.onload = function () {
    __adroll_loaded = true;
    var scr = document.createElement("script");
    var host = (("https:" == document.location.protocol) ? "https://s.adroll.com" : "http://a.adroll.com");
    scr.setAttribute('async', 'true');
    scr.type = "text/javascript";
    scr.src = host + "/j/roundtrip.js";
    ((document.getElementsByTagName('head') || [null])[0] ||
        document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
    if (oldonload) { oldonload() }
    };
} ());
</script>

<script type="text/javascript">
adroll_segments = "AutomotiveDesignline";
</script>



<div name="menu_box_rate" id="menu_box_rate" class="menudropdown">
<ul>
<form name="rate_menu" id="rate_menu" action="" method="post">
<input type="hidden" name="piddl_pageobj" value="">
<input type="hidden" name="piddl_contentid" value="">
<input type="hidden" name="piddl_rate" value="">
<input type="hidden" name="piddl_rating" value="">
<input type="hidden" name="piddl_icons" value="">
<li><div class="notalink" style="text-align: left; padding-left: 3px; margin-left: 10px;">To rate this item, click on a rating below.</div></li>
<li><a style="text-align: left;" href="javascript:RateThis('5');"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px; margin-left: 10px;"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px;"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px;"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px;"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px;"></a></li>
<li><a style="text-align: left;" href="javascript:RateThis('4');"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px; margin-left: 10px;"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px;"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px;"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px;"></a></li>
<li><a style="text-align: left;" href="javascript:RateThis('3');"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px; margin-left: 10px;"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px;"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px;"></a></li>
<li><a style="text-align: left;" href="javascript:RateThis('2');"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px; margin-left: 10px;"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px;"></a></li>
<li><a style="text-align: left;" href="javascript:RateThis('1');"><img src="https://m.eet.com/images/eetimes/eetimes_rating_dot_10x7.gif" width="10" height="7" border="0" style="margin-top: 5px; margin-left: 10px;"></a></li>
<li><a style="font-size: 10px; text-align: right; padding-right: 8px;" href="Javascript:HideRateMenu();">[close this box]</a></li>
</form>
</ul>
</div>

<div name="menu_box_save" id="menu_box_save" class="menudropdown" style="width: 200px;">
<ul>
<li><div class="notalink" style="text-align: left;">&nbsp;</div></li>
<li><div class="notalink" style="text-align: left;">To save this item to your list of favorite EE Times content so you can find it later in your Profile page, click the "Save It" button next to the item.</div></li>
<li><div class="notalink" style="text-align: left;">&nbsp;</div></li>
</ul>
</div>

<script language="JavaScript">
<!--
var thispage_sharelink = document.location.href
if(document.location.href.indexOf("https://") > -1){thispage_sharelink = thispage_sharelink.replace("http://","https://");}		
//-->
</script>
<div id="menu_box_share" class="menudropdown">
<ul>
<li><div class="notalink" style="text-align: left;">If you found this interesting or useful, please use the links to the services below to share it with other readers.  You will need a free account with each service to share an item via that service.</div></li>
<li><a style="text-align: left;" href="http://twitter.com/share/?text=&url=%3Fitc%3Dthissite%5Ftweetlink" target="_blank"><img src="https://m.eet.com/images/common/icons/twitter_intevol_18x18.gif" width="18" height="18" border="0" style="border: 1px solid #000000;;"> Tweet This</a>

<li><a style="font-size: 10px; text-align: right; padding-right: 8px;" href="Javascript:ShowMenu('menu_box_share','-500','38');">[close this box]</a></li>

</ul>
</div>
<div name="nav_news_popmenu" id="nav_news_popmenu" class="popmenu" style="position: absolute; z-index: 8; left: -500px; top: 38px;">
<div style="margin-top: 10px; margin-bottom: 10px;">

<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?section_type=News+Analysis">Latest News</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?section_type=News+Analysis&tag_id=35">Semiconductor News</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?section_type=News+Analysis&tag_id=266">News from Europe</a></div></div>

<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?section_id=91">Digital Editions</a></div></div> -->
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="" target="new">EETimes: Confidential</a></div></div> -->
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem">Hot Topics <img src="https://m.eet.com/images/eetimes/eetimes_dropdown_arrow_13x14.gif" width="13" height="14" border="0" /></div></div> -->
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/ces.asp"><img src="https://m.eet.com/images/eetimes/eetimes_dropdown_bullet_5x13.gif" width="5" height="13" border="0" /> Consumer Electronics</a></div></div> -->
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/mwc.asp"><img src="https://m.eet.com/images/eetimes/eetimes_dropdown_bullet_5x13.gif" width="5" height="13" border="0" /> Mobile World Congress</a></div></div> -->
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/design-west.asp"><img src="https://m.eet.com/images/eetimes/eetimes_dropdown_bullet_5x13.gif" width="5" height="13" border="0" /> Design West</a></div></div> -->

</div>
</div>

<div name="nav_eelife_popmenu" id="nav_eelife_popmenu" class="popmenu" style="position: absolute; z-index: 8; left: -500px; top: 38px;">
<div style="margin-top: 10px; margin-bottom: 10px;">

<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/bloggers.asp">Blogs</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?threads=yes">Message Boards</a></div></div>
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://engineeringcareers.eetimes.com/" target="new">Engineering Careers</a></div></div> -->

</div>
</div>

<div name="nav_products_popmenu" id="nav_products_popmenu" class="popmenu" style="position: absolute; z-index: 8; left: -500px; top: 38px;">
<div style="margin-top: 10px; margin-bottom: 10px;">

<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=28">Advanced Technology</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=104">Analog</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=29">Boards/Buses</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=67">Electromechanical</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=200">Embedded Tools</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=154">FPGAs/PLDs</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=32">IP/EDA</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=156">Logic & Interfaces</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=157">Memory</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=115">Operating Systems</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=68">Optoelectronics</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=69">Passives</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=70">Power</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=159">Processors</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=71">RF/Microwave</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=72">Sensors & Transducers</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="/archives.asp?tag_id=38">Test & Measurement</a></div></div>


</div>
</div>

<div name="nav_events_popmenu" id="nav_events_popmenu" class="popmenu" style="position: absolute; z-index: 8; left: -500px; top: 38px;">
<div style="margin-top: 10px; margin-bottom: 10px;">
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://www.armtechcon.com" target="new">ARM Techcon</a></div></div> -->
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://www.designcon.com/" target="new">DesignCon</a></div></div> -->
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://designersofthings.com">Designers of Things</a></div></div> -->
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://www.embeddedconf.com/" target="new">ESC</a></div></div> -->

<!--<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://www.eeliveshow.com/sanjose/" target="new">EE Live!</a></div></div>-->
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://esc-boston.techinsightsevents.com/" target="new">ESC Boston</a></div></div> -->
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://esc-chicago.techinsightsevents.com/" target="new">ESC Chicago</a></div></div> -->
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://embedded-live.com/" target="new">Embedded Live</a></div></div> -->

</div>
</div>

<div name="nav_techonline_popmenu" id="nav_techonline_popmenu" class="popmenu" style="position: absolute; z-index: 8; left: -500px; top: 38px;">
<div style="margin-top: 10px; margin-bottom: 10px;">

<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="https://www.techonline.com/directory/ee-times-2" target="new">EETimes University</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="https://www.techonline.com/search/type:tol/format%5B%5D:tech-paper/sort:recent/page:1" target="new">Tech Papers</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="https://www.techonline.com/search/type:tol/format%5B%5D:course/sort:recent/page:1" target="new">Courses</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="https://www.techonline.com/search/terms:fundamentals/format[]:course/sort:recent/page:1" target="new">&nbsp;&nbsp;&nbsp;Fundamentals</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="https://www.techonline.com/search/type:tol/format%5B%5D:webinar/sort:recent/page:1" target="new">Webinars</a></div></div>

</div>
</div>

<div name="supernav_events_popmenu" id="supernav_events_popmenu" class="popmenu" style="position: absolute; z-index: 8; left: -500px; top: 38px;">
<div style="margin-top: 10px; margin-bottom: 10px;">

<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://www.ubmdesign.com/" target="new">Design West</a></div></div>
<!-- <div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://esc.eetimes.com/boston/" target="new">Design East</a></div></div> -->
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://www.designcon.com/" target="new">DesignCon</a></div></div>
<div class="popmenusubitemwrapper"><div class="popmenusubitem"><a href="http://e.ubmelectronics.com/armtechcon" target="new">ARM Techcon</a></div></div>

</div>
</div>


<div style="display: none;">
<img src="https://m.eet.com/images/images/spacer.gif">
</div>

<script type='text/javascript'>
    var _sf_async_config={};
    /** CONFIGURATION START **/
    _sf_async_config.uid = 55361;
    _sf_async_config.domain = 'eetimes.com';
    _sf_async_config.useCanonical = true;
    _sf_async_config.sections = 'Report, Automotive Designline';
    _sf_async_config.authors = '';
    /** CONFIGURATION END **/
    (function(){
      function loadChartbeat() {
        window._sf_endpt=(new Date()).getTime();
        var e = document.createElement('script');
        e.setAttribute('language', 'javascript');
        e.setAttribute('type', 'text/javascript');
        e.setAttribute('src', '//static.chartbeat.com/js/chartbeat.js');
        document.body.appendChild(e);
      }
      var oldonload = window.onload;
      window.onload = (typeof window.onload != 'function') ?
         loadChartbeat : function() { oldonload(); loadChartbeat(); };
    })();
</script>
<script type="text/javascript">
piAId = '115242';
piCId = '67987';

(function() {
	function async_load(){
		var s = document.createElement('script'); s.type = 'text/javascript';
		s.src = ('https:' == document.location.protocol ? 'https://pi' : 'http://cdn') + '.pardot.com/pd.js';
		var c = document.getElementsByTagName('script')[0]; c.parentNode.insertBefore(s, c);
	}
	if(window.attachEvent) { window.attachEvent('onload', async_load); }
	else { window.addEventListener('load', async_load, false); }
})();
</script>
<script type="text/javascript">
(function() {
    var cid="eetimes", arp = document.createElement('script');
    arp.type = 'text/javascript'; arp.async = true;
    arp.src = "//reach-cdn.siliconexpert.com/tag/"+cid+".js";
    var s0 = document.getElementsByTagName('script')[0];
    s0.parentNode.insertBefore(arp, s0);
})();
</script>
</body>
</html>
