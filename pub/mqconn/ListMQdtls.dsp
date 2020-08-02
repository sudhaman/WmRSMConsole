%comment%----- Lists configured connections -----%endcomment%
<HTML>
    <head>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <meta http-equiv="Expires" CONTENT="-1">
        <title>List Connections</title>
        <link rel="stylesheet" TYPE="text/css" HREF="/WmRoot/webMethods.css"></link>

        <SCRIPT LANGUAGE="JavaScript">
            function confirmDisable (aliasName)
            {            	
                var s1 = "OK to disable the `"+aliasName+"' connection?\n\n";
                var s2 = "Disabling a connection causes all services to be \n";
                var s3 = "unavailable for use.\n";
                return confirm (s1+s2+s3);
            }
           
            function confirmEnable (aliasName)
            {      
                var s1 = "OK to enable the `"+aliasName+"' connection?\n\n";
                return confirm (s1);
            }
            function confirmDelete (aliasName)
            {
                var s1 = "OK to delete the `"+aliasName+"' connection?\n\n";
                return confirm (s1);
            }            
        </SCRIPT>
        <script src="connectionfilter.js.txt"></script>
        <SCRIPT SRC="webMethods.js.txt"></SCRIPT>
    </head>

<style>
/* Center the loader */
#loader {
  position: absolute;
  left: 50%;
  top: 50%;
  z-index: 1;
  width: 150px;
  height: 150px;
  margin: -75px 0 0 -75px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
  text-align: center;
}
</style>




    %invoke wm.art.admin:getAdapterTypeOnlineHelp%
    %onerror%
    %endinvoke%

    %invoke wm.art.admin:retrieveAdapterTypeData%
    %onerror%
    %endinvoke%

    <BODY onLoad="myFunction(),setNavigation('ListResources.dsp','%value encode(javascript) helpsys%', 'foo');showHideFilterCriteria('searchConnectionName');">    

<div id="loader"></div>


<script>
var myVar;

function myFunction() {
  myVar = setTimeout(showPage, 300);
}

function showPage() {
  document.getElementById("loader").style.display = "none";
  document.getElementById("myid").style.display = "block";
}
</script>



    <form name="form" action="ListResources.dsp" method="POST" style="display:none;" id="myid" >
        <table width="100%" >
        <tr>
           <td class="menusection-Adapters" colspan=8>MQadapters of %value remote_server% </td>
        </tr>
	
        %ifvar action%
            %switch action%

                %case 'saveConnection'%
                    %invoke wm.art.admin.connection:createResource%
                    %onerror%
                        %ifvar localizedMessage%
                            <tr><td class="message" colspan=8>Error encountered <pre>%value localizedMessage%</pre></td></tr>
                        %else%
                            %ifvar error%
                                <tr><td class="message" colspan=8>Error encountered <pre>%value errorMessage%</pre></td></tr>
                            %endif%
                        %endif%
                    %endinvoke%

                %case 'deleteConnection'%
                    %invoke wm.art.admin.connection:deleteResource%
                    %onerror%
                        %ifvar localizedMessage%
                            <tr><td class="message" colspan=8>Error encountered <pre>%value localizedMessage%</pre></td></tr>
                        %else%
                            %ifvar error%
                                <tr><td class="message" colspan=8>Error encountered <pre>%value errorMessage%</pre></td></tr>
                            %endif%
                        %endif%
                    %endinvoke%

                %case 'editConnection'%
                    %invoke wm.art.admin.connection:updateResource%
                    %onerror%
                        %ifvar localizedMessage%
                            <tr><td class="message" colspan=8>Error encountered <pre>%value localizedMessage%</pre></td></tr>
                        %else%
                            %ifvar error%
                                <tr><td class="message" colspan=8>Error encountered <pre>%value errorMessage%</pre></td></tr>
                            %endif%
                        %endif%
                    %endinvoke%

                %case 'enableConnection'%
                    %invoke wm.art.admin.connection:setResourceState%
                    %onerror%
                        %ifvar localizedMessage%
                          <tr><td class="message" colspan=8>Error encountered <pre>%value localizedMessage%</pre></td></tr>
                        %else%
                          %ifvar error%
                            <tr><td class="message" colspan=8>Error encountered <pre>%value errorMessage%</pre></td></tr>
                           %endif%
                        %endif%
                    %endinvoke%

            %endswitch%
        %endif%

        <tr>
            <td colspan=2>
                <ul>
                <li><a href="ListAdapterConnTypes.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode ../searchConnectionName%&dspName=.LISTCONNECTIONTYPES">Configure New Connection</a>
                <li id="showfew" name="showfew"><a href="javascript:showFilterPanel(true)">Filter Connections</a></li>
                <!-- <li style="display:none" id="showall" name="showall"><a href="javascript:showFilterPanel()">Show All Connections</a></li>-->
                <li style="display:none" id="showall" name="showall"><a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&dspName=.LISTRESOURCES">Show All Connections</a></li>
                
                <DIV id="filterContainer" name="filterContainer" style="display:none;padding-top=2mm;">
                 <br>
                  <table>
				  <tr valign="top">
					<td>
                    	<span>Filter criteria</span><br>                    	
                    	<input id="searchConnectionName" name="searchConnectionName" value="%value -urldecode searchConnectionName%" onkeydown="return processKey(event)" />
					</td>
					<td>					
                     <br>
                        <input id="submitButton" name="Submit" type="submit" value="Submit" width="15" height="15" onClick="validateSearchCriteria('searchConnectionName');return false;"/>                                                             
                     </br>
                    </td> 
                  </tr>
                  </table>
                 </br>  
                </DIV>
                </ul>
            </td>
        </tr>
         %invoke support.MQConnections:rem_MQconnection_list%
        <tr>
        <td colspan=8 align="right">
        	<label style="color:#666666;font-weight:bold;text-align:inherit;">%value pageLabel%</label>
        </td>
        </tr>
        <tr>
            <td class="heading" colspan=8>Connections</td>
        </tr>
        <tr> 
            <td class="oddcol-l">Connection Name<a id="ascCN" href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&sort=CA&dspName=.LISTRESOURCES"><img border="0" style="float: middle" src="images/arrow_up.gif" width="15" height="15"></a>
            <a id="desCN" href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&sort=CA&DES=true&dspName=.LISTRESOURCES"><img border="0" src="images/arrow_down.gif" style="float: middle" width="15" height="16"></a></td>
            <td class="oddcol-l">MQmanager Name<a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&sort=PN&dspName=.LISTRESOURCES"><img border="0" src="images/arrow_up.gif" align="baseline" width="15" height="15"></a>
            <a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&sort=PN&DES=true&dspName=.LISTRESOURCES"><img border="0" src="images/arrow_down.gif" align="baseline" width="15" height="15"></a></td>
            <td class="oddcol-l">Port<a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&sort=CT&dspName=.LISTRESOURCES"><img border="0" src="images/arrow_up.gif" align="baseline" width="15" height="15"></a>
            <a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&sort=CT&DES=true&dspName=.LISTRESOURCES"><img border="0" src="images/arrow_down.gif" align="baseline" width="15" height="15"></a></td>
            <td class="oddcol-l">Hostname<a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&sort=EN&dspName=.LISTRESOURCES"><img border="0" src="images/arrow_up.gif" align="baseline" width="15" height="15"></a>
            <a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&sort=EN&DES=true&dspName=.LISTRESOURCES"><img border="0" src="images/arrow_down.gif" align="baseline" width="15" height="15"></a></td>
            <td class="oddcol">Queue Name</td>
            <td class="oddcol">Connection State</td>
        </tr>
                    
        %ifvar MQ_list -notempty%
            %loop MQ_list%
            
                <tr>
                    <script>writeTD('rowdata-l');</script>%value connectionAlias%</td>
                    <script>writeTD('rowdata-l');</script>%value QMgrName%</td>
                    <script>writeTD('rowdata-l');</script>%value port%</td>
                    <script>writeTD('rowdata-l');</script>%value hostName%</td>
                    <script>writeTD('rowdata-l');</script>%value QName%</td>
                    <script>writeTD('rowdata-l');</script>%value connectionState%</td> 
               </tr>
            %endloop%

        %else%
            <tr><td class="message" colspan=8>No connections found</td></tr>
        %endif%		
		
        %onerror%
            %ifvar localizedMessage%
                <tr><td class="message">Error encountered <pre>%value localizedMessage%</pre></td></tr>
            %else%
                %ifvar error%
                    <tr><td class="message">Error encountered <pre>%value errorMessage%</pre></td></tr>
                %endif%
            %endif%
        %endinvoke%
        </table>	
        	
		<div class="oddrowdata" id="goContainer" name="goContainer" style="display:none;padding-top=2mm;">
        	%ifvar pStart equals('1')%
				<label style="color:#666666;font-weight:bold;text-align:inherit;">
				Page (1-<script>writeTD('rowdata-l');</script>%value pageSize% )</td></label>
		
			%else%		
        		<a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&prev=true&dspName=.LISTRESOURCES">&laquo; Previous</a>&nbsp;<label style="color:#666666;font-weight:bold;text-align:inherit;">Page (1-
				<script>writeTD('rowdata-l');</script>%value pageSize% )</label></td>
			%endif%	
			<input type="text" name="pageNumber" value="%value pStart%" size="1" onkeypress="return isNumberKey(this.form,event);">&nbsp;<input type="submit" name="Go" value="Go" onClick="jumpToPage(this);return false;">				
			%ifvar pStart vequals(pageSize)%			
				<!-- Next -->
			%else%
				<a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&prev=false&dspName=.LISTRESOURCES">Next &raquo;</a>
			%endif%		
		</div>
        
		<div class="oddrowdata" id="paginationContainer" name="paginationContainer" style="display:;padding-top=2mm;">
        %ifvar pStart equals('1')%
			%else%
        		<a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&prev=true&dspName=.LISTRESOURCES">&laquo; Previous</a>              
			%endif%
	        %loop totalNosOfPages%
		        %ifvar totalNosOfPages -notempty%           		
	         		<a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&pageNumber=%value -urlencode totalNosOfPages%&dspName=.LISTRESOURCES">
	         		%ifvar totalNosOfPages vequals(/pStart)% 
	         			<a><label style="color:#666666;font-weight:bold;">%value totalNosOfPages%</label>
		%else%		
	         			%ifvar totalNosOfPages equals('...')%
	         				</a><a href="javascript:showHidePageCriteria()">%value totalNosOfPages%</a>
	         			%else%
	         				%value totalNosOfPages%<a>
	         			%endif%
	         		%endif%	
	         	%else%
	         		%value pStart%
		%endif%	
						
            %endloop%		
		%ifvar pStart vequals(pageSize)%			
				<!-- Next -->
		%else%
				<a href="/WmRSMConsole/mqconn/ListResources.dsp?adapterTypeName=%value -urlencode adapterTypeName%&searchConnectionName=%value -urlencode searchConnectionName%&prev=false&dspName=.LISTRESOURCES">Next &raquo;</a>
		%endif%		
		</div>
    	<input type="hidden" name="adapterTypeName" value="%value adapterTypeName%">
    	<input type="hidden" name="searchConnectionName" value="%value searchConnectionName%">     	
    	<input type="hidden" name="pStart" value="%value pStart%">    	 
    	<input type="hidden" name="totalNosOfPages" value="%value totalNosOfPages%">
    	<input type="hidden" name="pageNumber" value="%value pageNumber%">
        <input type="hidden" name="pageSize" value="%value pageSize%">
    	<input type="hidden" value="" name="sortCriteria">
    	<input type="hidden" value="%value pageLabel%" name="pageLabel">
        </form>        
    </body>
</HTML>
