  <div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='channels.all'}</h1>
		 </div>
		 <ul>
		 <!-- Category List -->
		 {section name=i loop=$answers}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="categories/`$answers[i].CHID`" url="channel_detail.php?chid=`$answers[i].CHID`" clean=$answers[i].name}" title="{$answers[i].descrip}"><img src="{$baseurl}/chimg/{$answers[i].CHID}.jpg" alt="{$answers[i].name} category" /></a>
			 </div>
			 <div class="catTitle">
			 <a href="{seourl rewrite="categories/`$answers[i].CHID`" url="channel_detail.php?chid=`$answers[i].CHID`" clean=$answers[i].name}">{$answers[i].name|truncate:40|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			 {insert name=channel_count assign=infoch cid=$answers[i].CHID}
			  <div class="videoViews"><span class="textGlow">{$infoch[0]}</span> {translate item='global.today'}</div>
				<div class="videoViews"><span class="textGlow">{$infoch[1]}</span> {translate item='global.total'}</div>
			 </div>
			</li>
			{/section}
			<!-- End Category List -->
		 </ul>
		</div>
		<!-- End Main Box -->
 </div>
	 <!-- End Main Content Boxes -->
	 {include file="sidebar.tpl"}
