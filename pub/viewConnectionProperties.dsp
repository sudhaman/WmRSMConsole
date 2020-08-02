%comment%----- Edit connection node -----%endcomment%

%ifvar parameters%
<script>setNavigation('ListResources.dsp', '%value TemplateURL%', 'foo');</script>

<SCRIPT language="JavaScript" src="mqconnjs.txt"></SCRIPT>


%ifvar readOnly equals('true')%

%invoke wm.mqseries.admin:cacheConnectionFactoryProperties%
%onerror%       
  <FONT color="red"><B>
  Unable to cache the ConnectionFactory properties:<BR>
  %ifvar localizedMessage%%value localizedMessage%%endif% - 
  %ifvar errorMessage%%value errorMessage%%endif%<BR></B></FONT>
%endinvoke%

%invoke wm.mqseries.admin:reloadConnectionFactoryProperties%
%onerror%       
  <FONT color="red"><B>
  Unable to reload ConnectionFactory properties:<BR>
  %ifvar localizedMessage%%value localizedMessage%%endif% - 
  %ifvar errorMessage%%value errorMessage%%endif%<BR></B></FONT>
%endinvoke%

%invoke wm.art.admin:htmlEncodeConnProps%
%loop parameters%          
<tr name="Standard" >
%comment%---------------------------------------------------------------------------------------------------------------- 

SSL Support 

If the watt.WmMQAdapter.SSL.Support property is set to 'true', these 3 properties will be displayed. 

Since this DSP cannot evaluate the watt.WmMQAdapter.SSL.Support property, it must use some other indicator. Unfortunately,
the groupName property, set by the wmMQConnection class, is also not available. So, assuming that these properties are 
required when creating the connection object, these properties will be displayed only if they are not null. 
--------------------------------------------------------------------------------------------------------------%endcomment%
%ifvar systemName equals(sslOptions)%
		%ifvar value -notNull)%
		%invoke wm.mqseries.admin:getSSLProperty% 
		%endinvoke%
		%invoke wm.mqseries.admin:sslAliasSupported% 
		%endinvoke%
		%ifvar sslAliasSupported equals(false)%
			<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
			%else%
				%ifvar sslEnabled equals(false)%
					<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
				  %else%
					<script>writeTDspan('row');</script>
					%value displayName%</td>              
						<script>writeTDspan('rowdata-l');swapRows();</script>
						%ifvar value equals('keystore alias')%
						  %value value%
						%else%  
						  %ifvar value equals('new')%
						    keystore alias
						  %else%
						    keystore file
						  %endif%
						%endif%  
						 </td></tr>
				%endif%
				  %else%
					<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
				%endif%
		%endif%
      %else%
	  %ifvar systemName equals(sslKeyStoreAlias)%
		%ifvar value -notNull)%
		%invoke wm.mqseries.admin:getSSLProperty% 
		%endinvoke%
		%invoke wm.mqseries.admin:sslAliasSupported% 
		%endinvoke%
		%ifvar sslAliasSupported equals(false)%
			<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
		%else%
			%ifvar sslEnabled equals(false)%
				<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
			  %else%
				<script>writeTDspan('row');</script>
				%value displayName%</td>              
					<script>writeTDspan('rowdata-l');swapRows();</script>
					%value value%</td></tr>
			%endif%
			  %else%
				<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
			%endif%
		%endif%
      %else%
	  %ifvar systemName equals(sslTrustStoreAlias)%
		%ifvar value -notNull)%
		%invoke wm.mqseries.admin:getSSLProperty% 
		%endinvoke%
		%invoke wm.mqseries.admin:sslAliasSupported% 
		%endinvoke%
		%ifvar sslAliasSupported equals(false)%
			<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
		%else%
			%ifvar sslEnabled equals(false)%
				<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
			  %else%
				<script>writeTDspan('row');</script>
				%value displayName%</td>              
					<script>writeTDspan('rowdata-l');swapRows();</script>
					%value value%</td></tr>
			%endif%
			  %else%
				<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
			%endif%
		%endif%
      %else%
  	%ifvar systemName equals(sslKeyStore)%
		%ifvar value -notNull)%
		%invoke wm.mqseries.admin:getSSLProperty% 
		%endinvoke%
		%ifvar sslEnabled equals(false)%
			<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
	      %else%
		    <script>writeTDspan('row');</script>
		    %value displayName%</td>              
         	    <script>writeTDspan('rowdata-l');swapRows();</script>
         	    %value value%</td></tr>
	  	%endif%
	      %else%
			<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
	  	%endif%
      %else%
  	  %ifvar systemName equals(sslKeyStorePassword)%
		%ifvar value -notNull)%
		%invoke wm.mqseries.admin:getSSLProperty% 
		%endinvoke%
		%ifvar sslEnabled equals(false)%
			<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
	      %else%
    	          		<script>writeTD('row');</script>
	          		%value displayName%</td>                     
                  	<script>writeTD('rowdata-l');swapRows();</script></td></tr>
	  	  %endif%
	      %else%
			<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
	  	  %endif%
      %else%
  	    %ifvar systemName equals(sslCipherSpec)%
		%invoke wm.mqseries.admin:getSSLProperty% 
		%endinvoke%
		%ifvar sslEnabled equals(false)%
			<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
	      %else%
		%ifvar value -notNull)%
		    <script>writeTDspan('row');</script>
		    %value displayName%</td>              
         	    <script>writeTDspan('rowdata-l');swapRows();</script>
         	    %value value%</td></tr>
	  	  %endif%
	      %else%
			<input type = "hidden"   name=".CPROP.%value -urlencode systemName%"    value = " ">
   	      %endif%
	%else%
%comment%------- End of SSL Support --------------------------------------------------------------------------%endcomment%
			
%comment%-- start trax# 1-122V6J --%endcomment%
%ifvar isHidden%
	%comment%-- set a hidden value --%endcomment%
	<input type=hidden name=".CPROP.%value -urlencode systemName%" value="%value value%"> </input>
%else%
%comment%-- end trax# 1-122V6J --%endcomment%
 <tr name="Standard" >
            <td class="oddcol-l">Val1</td>
            <td class="oddcol-l">Val2</td>
            <td class="oddcol-l">Val3</td>
            <td class="oddcol-l">Current Threads</td>
                        <td class="oddcol">Select&nbsp;&nbsp;</td>
            <td class="oddcol">Enabled&nbsp;&nbsp;</td>
                  </tr>

	<tr>
		<script>writeTDspan('row');</script>%value displayName%</td>              
		<script>writeTDspan('rowdata-l');</script>
			%ifvar isPassword%
			%else%
				%comment%----- TRAX 1-KPWS1 -----%endcomment%
				%value value%
			%endif%
		</td>
		<script>swapRows();</script>
	</tr>
    %endif%
    %endif%
    %endif%
    %endif%
	 %endif%
	  %endif%
	   %endif%
%endloop%
%onerror%
	<script> alert("Error invoking htmlEncode");</script>
%endinvoke%
%else%
%comment%-- edit mode --%endcomment%
%comment%--------------------
*************************<br>
%loop -struct%
  %value $key% = %value% <br>
%endloop%
*************************<br>
-----------------%endcomment%

%invoke wm.mqseries.admin:cacheConnectionFactoryProperties%
%onerror%       
  <FONT color="red"><B>
  Unable to cache the ConnectionFactory properties:<BR>
  %ifvar localizedMessage%%value localizedMessage%%endif% - 
  %ifvar errorMessage%%value errorMessage%%endif%<BR></B></FONT>
%endinvoke%

%loop parameters% 
%comment%-- start trax# 1-122V6J --%endcomment%
%ifvar isHidden%
        %comment%-- set a hidden value --%endcomment%
        <input type=hidden name=".CPROP.%value -urlencode systemName%" value="%value value%"> </input>
%else%
%comment%-- end trax# 1-122V6J --%endcomment%

                  <script>writeTD("row");</script>%value displayName encode(html)%</td>
                  <script>writeTD("row-l");</script>%value value encode(html)%</td>

   %endif%
   %endif%
   %endif%
   %endif%
   %endif%
   %endif%
    %endif%
%endloop%
%endif%  
%else%
    <TR><TD class="message" colspan=4>Connection properties not found</TD></TR>
%endif%
 
