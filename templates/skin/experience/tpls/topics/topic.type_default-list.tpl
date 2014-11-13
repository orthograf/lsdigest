<div style="border: 1px solid #EFEFEF;padding: 0px 15px 15px;">
	{if count($aTopics)>0}
	
	<table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
	  <tbody>
		<tr style="height: 15px;">
		  <td></td>
		</tr>

		<tr align="right">
		  <td style="font-size: 14px;">                      
			  <a href="{router page='blogs'}" style="color: #6c6b6b; text-decoration:none; margin-right: 35px;">Блоги</a>
			  <a href="{router page='people'}" style="color: #6c6b6b; text-decoration:none; margin-right: 35px;">Люди</a>
			  <a href="{router page='stream'}" style="color: #6c6b6b; text-decoration:none; margin-right: 35px;">Активность</a>
			  <a href="{router page='page'}regulations" style="color: #6c6b6b; text-decoration:none;margin-right: 35px;">Правила</a>
		  </td>
		</tr>
		
		<tr style="height: 15px;">
		  <td></td>
		</tr>
		
		<tr align="center" style="background: #f0f7fa; height: 100px;">
			<td>
				<table border="0" cellspacing="0" cellpadding="0" style="">
					<tr>
						<td style="color: #646262; font-family: 'Raleway', arial; font-size: 23px; text-align:center; font-weight:200;" align="center">
						  <span style="font-weight: 500;">{Config::Get('view.name')}</span>
						  <br><span style="color:#8B8B8B;font-size: 14px">{Config::Get('view.description')}</span>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	  </tbody>
	</table>

	<ul style="list-style:none; margin-right: 40px;">
		{foreach from=$aTopics item=oTopic}
			{$oBlog=$oTopic->getBlog()}
			{$oUser=$oTopic->getUser()}
			{$oContentType=$oTopic->getContentType()}
			<li>
				<table border="0" cellspacing="0" cellpadding="0" style="border: 1px solid #F0F0F0;padding: 15px 20px 10px; width: 100%;">		
					<tr style="height: 50%;">
						<td rowspan="2" style="vertical-align: top; width: 260px;">
							<img src="{if $oTopic->getPreviewImageUrl()}{$oTopic->getPreviewImageUrl('254x160crop')}{else}{Config::Get('path.root.url')}common/plugins/lsdigest/templates/skin/experience/assets/images/no-photo.jpg{/if}" alt="topic_preview" style="padding: 15px 30px 15px 16px;"/>
						</td>
						
						<td style="vertical-align: top; font-size: 14px; text-transform:uppercase;">
							<h3 class="topic-title accent">
								<a style="color: #676767; text-decoration: none;" class="link link-lead link-clear link-dark" href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a>
				
								{if $oTopic->getPublish() == 0}
									&nbsp;<span class="fa fa-file-text-o" title="{$aLang.topic_unpublish}"></span>
								{/if}
				
								{if $oTopic->getType() == 'link'}
									&nbsp;<span class="fa fa-globe" title="{$aLang.topic_link}"></span>
								{/if}
							</h3>
							
							<span class="topic-blog">
								<a style="color: #9b9b9b; font-size: 12px;" class="link link-lead link-blue" href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a>
							</span>
						</td>
					</tr>	
					
					<tr>
						<td style="vertical-align: top; color: #8b8b8b; font-weight: 400; font-size: 14px; letter-spacing:.5px; line-height:26px; padding: 0px 60px 0px 0px;">
							{block name="topic_content"}
								<div class="topic-text" style="text-align: justify;">
									{$oTopic->getTextShort()|escape:'html'|truncate:100}
									{if $oTopic->getTextShort()!=$oTopic->getText()}
										<br/>
									{/if}
								</div>
							{/block}	
						</td>
					</tr>
				</table>
			</li>
			<br />
		{/foreach}	
	</ul>

	<table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
	    <tr>
			<td align="center">         
				<table border="0" cellspacing="0" cellpadding="0" align="center" style="background: #EC877B; text-align:center;">
				  <tr>
					<td align="center" style="padding: 5px 15px 5px;">
					  <a href="{router page='settings'}tuning/" style="text-decoration:none; text-transform:uppercase; color: #fff;font-size: 10pt;">Настройка E-Mail уведомлений</a>
					</td>
				  </tr>
				</table>
			</td> 
		</tr>

		<tr>
			<td style="height:30px;"></td>
	    </tr>
		<tr style="background:#38404b;">
			<td style="text-align:center; font-size: 14px; padding-top: 25px;">
			  <a href="{router page='blogs'}" style="color: #bcc9dd; text-decoration:none; margin-right: 35px;">Блоги</a>
			  <a href="{router page='people'}" style="color: #bcc9dd; text-decoration:none; margin-right: 35px;">Люди</a>
			  <a href="{router page='stream'}" style="color: #bcc9dd; text-decoration:none; margin-right: 35px;">Активность</a>
			  <a href="{router page='page'}regulations" style="color: #bcc9dd; text-decoration:none;margin-right: 35px;">Правила</a>
		  	</td>
	    </tr>
	    <tr style="background:#38404b;">
			<td style="color: #bcc9dd; height:70px; text-align:center;  font-weight: 400; font-size: 12px;">
			  &copy; 2014 <a href="{router page='index'}" target="_blank" style="text-decoration:none; color:#e9edf4;">{Config::Get('view.name')}</a>. Все права защищены
			</td>
	    </tr>
	</table>
	{/if}
</div>
