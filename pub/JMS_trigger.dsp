<html>
<TITLE>%value $host encode(html)% - Remote Server Management</TITLE>  
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" type="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
  
  <script language ="javascript">

  var hideStandard = "true";
  var hideSOAP = "true";

  /**
   *
   */     
  function changeTriggerState() {
    return confirm("Would you like to make this change across the entire cluster?");  
  }
  
  /**
   *
   */     
  function popUp(URL) {
    day = new Date();
    id = day.getTime();
	if(is_csrf_guard_enabled && needToInsertToken) {
		if(URL.indexOf("?") != -1){
			URL = URL+"&"+ _csrfTokenNm_ + "=" + _csrfTokenVal_;
		} else {
			URL = URL+"?"+ _csrfTokenNm_ + "=" + _csrfTokenVal_;
		}
	} 
	eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=200,height=200,left = 540,top = 412');");
  }
  
  /**
   *
   */ 
  function toggle(parent, id, imgID) {
    
    var set = 'none';
    var imgElem = document.getElementById(imgID);
    var name = parent.getAttribute('name');
    
    if(name == 'StandardHeader') {
      if (hideStandard == "true") {
        set = 'table-row';
        hideStandard = "false";
        imgElem.src = 'images/expanded.gif'
      }else {
        hideStandard = "true";
        imgElem.src = 'images/collapsed.gif'
      }
    }else {
     if (hideSOAP == "true") {
        set = 'table-row';
        hideSOAP = "false";
        imgElem.src = 'images/expanded.gif'
      }else {
        hideSOAP = "true";
        imgElem.src = 'images/collapsed.gif'
      }
    }
		
		var elements = getElements("TR", id);
		for ( var i = 0; i < elements.length; i++) {
      var element = elements[i];
      element.style.cssText = "display:"+set;
    }
  }
  
  /**
   *
   */ 
  function open(id, imgID) {
      
    var imgElem = document.getElementById(imgID);
    set = 'table-row';
    imgElem.src = 'images/expanded.gif'
		var elements = getElements("TR", id);
		for ( var i = 0; i < elements.length; i++) {
      var element = elements[i];
      element.style.cssText = "display:"+set;
    }
  }
  
  /**
   *
   */     
  function getElements(tag, name) {
    var elem = document.getElementsByTagName(tag);
    var arr = new Array();
    for(i=0, idx=0; i<elem.length; i++) {
      att = elem[i].getAttribute("name");
      if(att == name) {
        arr[idx++] = elem[i];
      }
    }
    return arr;
  }
  
   /**
    *
    */
   function loadDocument() {
     setNavigation('settings-broker.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_Msging_JMS_TriggerMgmt');
  
     // when you return to this page from editState we need to open the trigger type that was being edited
     if ("standard" == "%value type encode(javascript)%") {
       open('Standard', 'StandardImg');
       hideStandard = "false";
     }else if ("soap" == "%value type encode(javascript)%") {
       open('SOAP', 'SOAPImg');
       hideSOAP = "false";
     }else if ("all" == "%value type encode(javascript)%") {
       open('Standard', 'StandardImg');
       hideStandard = "false";
       open('SOAP', 'SOAPImg');
       hideSOAP = "false";
     }
	 
//	 if ( %value action_type% != "status" )
//	{
//	window.location = "JMS_trigger.dsp?action_type=status&remote_server=%value remote_server%";
//  window.location.reload(false); 
//	}


   }     
   
    /**
     *
     */
    function refreshDSP() {
	  var appendStrAmp = '';
	  var appendStrQue = '';
	  if(is_csrf_guard_enabled && needToInsertToken) {
		appendStrAmp = "&"+_csrfTokenNm_+"="+_csrfTokenVal_ 
		appendStrQue = "?"+_csrfTokenNm_+"="+_csrfTokenVal_ 
	  }
      if (hideStandard == "false" && hideSOAP == "false") {
        window.location = "JMS_trigger.dsp?type=all"+appendStrAmp;
      }else if (hideStandard == "false") {
        window.location = "JMS_trigger.dsp?type=standard"+appendStrAmp;
      }else if (hideSOAP == "false") {
        window.location = "JMS_trigger.dsp?type=soap"+appendStrAmp;
      }else {
        window.location = "JMS_trigger.dsp"+appendStrQue;
      }
    }
	
	
	if ( "%value action_type encode(javascript)%" != "status" )
	{
	window.location = "JMS_trigger.dsp?action_type=status&remote_server=%value remote_server encode(javascript)%";
	}


	
  </script>
</head>


<body onLoad="loadDocument();">

<INPUT TYPE="hidden" NAME="action_type" VALUE="status">
  <table width="100%">
    <tr>
      <td class="menusection-Settings" colspan="2">Remote Server Management @ %value $host encode(html)%</td>
    </tr>
    
    %invoke support.action:rem_ctrl_active_trigger%

    
<!-- Navigation Menu -->
    
    <!--tr>
      <td colspan="2">
        <ul>
		<INPUT TYPE="button" onClick="location.reload()" VALUE="Refresh">
        </ul>
      </td>
    </tr-->
    
    <tr>
      <td Width=20><img src="images/blank.gif" height=10 width=20></td>

      <td>
        	
<!-- Individual Standard JMS Trigger Controls  -->
	   <!-- input type="submit" value="Enable"> <input type="submit" value="disable"> <input type="submit" value="suspend" -->
	   <p><b>SERVER ALIAS : %value remote_server encode(html)% </b></p>
	   
	   
<table width="100%">
<tr><td>
<table>
<td class="evenrow-l"><a href="JMS_trigger.dsp?action_type=enable&remote_server=%value remote_server%" class="button">Enable&nbsp;All</a></td>
<td class="oddrow-l"><a href="JMS_trigger.dsp?action_type=disable&remote_server=%value remote_server%" class="button">Disable&nbsp;All</a></td>
<td class="evenrow-l"><a href="JMS_trigger.dsp?action_type=suspend&remote_server=%value remote_server%" class="button">Suspend&nbsp;All</a></td>
<td class="oddrow-l"><button onclick="check_enable('selectedTriggers')">Enable Selected</button></td>
<td class="evenrow-l"><button onclick="check_disable('selectedTriggers')">Disable Selected</button></td>
<td class="oddrow-l"><button onclick="check_suspend('selectedTriggers')">Suspend Selected</button></td>
<td class="oddrow-l" colspan=2> &nbsp; </td> 
<td class="evenrow-l"><a href="JMS_trigger.dsp?action_type=status&remote_server=%value remote_server%" class="button">Refresh&nbsp;All</a></td>
</table>
</td></tr>

        
          <tr name="StandardHeader" onClick="toggle(this, 'Standard', 'StandardImg');">
            <td class="heading" colspan=8>
              <img id='StandardImg' src="images/collapsed.gif" border="0"><a name="StandardAnchor">&nbsp;Individual Standard JMS Trigger Controls </a>
            </td>
          </tr>
   
          <tr name="Standard" >
            <td class="oddcol-l">Trigger Name</td>
            <td class="oddcol-l">Processing Mode</td>
            <td class="oddcol-l">Maximum Threads</td>
     <!--       <td class="oddcol-l">Connection Count</td>  -->
            <td class="oddcol-l">Current Threads</td>
			<td class="oddcol">Select&nbsp;&nbsp;</td>
            <td class="oddcol">Enabled&nbsp;&nbsp;</td>
		  </tr> 
          
            <script>resetRows();</script>
            %loop triggerDataList%
          
              %ifvar trigger/jmsTriggerType equals('0')%
         
                <tr name="Standard" >
                  <script>writeTD("row-l");</script>%value node_nsName encode(html)%</td>
                  <script>writeTD("row-l");</script>%value trigger/processingModeLocalizedString encode(html)%</td>
                  <script>writeTD("row-l");</script>%value trigger/maxThreadsString encode(html)%</td>
           <!--       <script>writeTD("row-l");</script>%value trigger/connectionCount encode(html)%</td>  -->
                  <script>writeTDnowrap("row-l");</script>%value trigger/currentThreadsLocalizedString encode(html)%</td>
				  <script>writeTDnowrap("row-l");</script><input type="checkbox" name="selectedTriggers" value="%value node_nsName%"></td>
                  <script>writeTD("rowdata");</script>
				  
		   <!--  Trigger status Column -->
                  %switch trigger/state%
                    %case '0'%
                    
                      %ifvar trigger/currentThreads equals('-1')%
                        <a>
                          <img style="width: 13px; height: 13px;" alt="active" border="0" src="images/yellow_check.gif">Yes<br>
                        </a>
                      %else%
                        <a>
                          <img style="width: 13px; height: 13px;" alt="active" border="0" src="images/green_check.gif">Yes<br>
                        </a>
                      %endif%
                    
                    %case '1'%
                      <a>No</a>
                    %case '2'%
                      <a>
                        <img style="width: 13px; height: 13px;" alt="suspended" border="0" src="images/yellow_check.gif">Suspended<br>
                      </a>
                  %end%
                 </td>
				  
                </tr>
		
                <script>swapRows();</script>
		
		<!-- Error Message --> 
                %ifvar trigger/lastError%
                <tr name="Standard">
                  <script>writeTDspan("row-l", 8);</script>
                    <font color="red">%value trigger/lastError encode(html)%</font><br> 
                  </td>
                </tr>
		<script>swapRows();</script>
              %endif%
		
              %endif%
            %endloop%	

			
 <tr><td>&nbsp;</td></tr>
<tr><td>
<table>
<td class="oddrow-l"><b>JMS Connection Alias Control: </b></td>
<td class="oddrow-l"><button onclick="check_enable('selectedAlias')">Enable Selected</button></td>
<td class="evenrow-l"><button onclick="check_disable('selectedAlias')">Disable Selected</button></td>
<td class="oddrow-l"><a href="JMS_trigger.dsp?action_type=status&remote_server=%value remote_server%" class="button">Refresh&nbsp;All</a></td>
</table>
</td></tr>

<!-- ####  JMS Alias table  ####  -->


    <!-- Enable/Disable Logic -->

    %switch action%
    
    %case 'changeState'%
      %ifvar setEnabled equals('true')%
        %invoke wm.server.jms:enableConnectionAlias%
        <TR>
          <TD colspan="2">&nbsp;</td>
          </TR>
        <TR>
          <TD class="message" colspan=2>%value message encode(html)%</TD>
        </TR>
        %endinvoke%
      %else%
        %invoke wm.server.jms:disableConnectionAlias%
        <TR>
          <TD colspan="2">&nbsp;</td>
          </TR>
        <TR>
          <TD class="message" colspan=2>%value message encode(html)%</TD>
        </TR>
        %endinvoke%
      %endif%
      %rename aliasName editedAliasName%

    <!-- Delete Logic -->
   
    %case 'delete'%
      %invoke wm.server.jms:deleteConnectionAlias%
        <tr>
          <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
          <td class="message" colspan=2>%value message encode(html)%</td>
        </tr>
      %endinvoke%
      %rename aliasName editedAliasName%
   
    <!-- Create Logic -->
    
    %case 'create'%
      %invoke wm.server.jms:createConnectionAlias%
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td class="message" colspan=2>%value message encode(html)%</td>
        </tr>
      %endinvoke%  
      %rename aliasName editedAliasName%
    
    <!-- Stop/Suspend/Enable Trigger Logic -->
    
    %case 'suspendTrigger'%
      %invoke wm.server.jms:suspendJMSTriggers%
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td class="message" colspan=2>%value message encode(html)%</td>
        </tr>
      %onerror%
         <td class="message" colspan=2>%value errorMessage encode(html)%</td>
      %endinvoke%  
      %rename triggerName editedTriggerName%
    
    %case 'enableTrigger'%
      %invoke wm.server.jms:enableJMSTriggers%
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td class="message" colspan=2>%value message encode(html)%</td>
        </tr>
      %onerror%
         <td class="message" colspan=2>%value errorMessage encode(html)%</td>
      %endinvoke%
      %rename triggerName editedTriggerName%
      
    %case 'disableTrigger'%
      %invoke wm.server.jms:disableJMSTriggers%
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td class="message" colspan=2>%value message encode(html)%</td>
        </tr>
      %onerror%
         <td class="message" colspan=2>%value errorMessage encode(html)%</td>
      %endinvoke%
      %rename triggerName editedTriggerName%

    <!-- Clear CSQ Logic -->
    
    %case 'clearCSQ'%
      %invoke wm.server.jms:clearCSQ%
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td class="message" colspan=2>%value message encode(html)%</td>
        </tr>
      %endinvoke%  
      %rename aliasName editedAliasName%
      
    <!-- Set Global Trigger Settings -->
    
    %case 'setSettings'%
      %invoke wm.server.jms:setSettings%
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td class="message" colspan=2>%value message encode(html)%</td>
        </tr>
      %endinvoke%  
    %end%
	
	%invoke support.remote:control_active_jms_alias%
		
	  
		  <tr name="StandardHeader1" onClick="toggle(this, 'Standard1', 'StandardImg1');">
            <td class="heading" colspan=8>
              <img id='StandardImg1' src="images/collapsed.gif" border="0"><a name="StandardAnchor">&nbsp;JMS Connection Alias Definitions </a>
            </td>
          </tr>

          <tr name="Standard1" >
            <td class="oddcol-l" nowrap>Connection Alias Name</td>
            <td class="oddcol-l">Transaction Type</td>
            <td class="oddcol-l">CSQ Count</td>
            <td class="oddcol">Delete</td>
			<td class="oddcol">Select&nbsp;&nbsp;</td>
			<td class="oddcol">Enabled</td>
          </tr> 
		  
		  <INPUT TYPE="hidden" NAME="remote_server" VALUE="%value remote_server encode(html)%">
          
          %loop aliasDataList%
          
            <tr name="Standard1" >
            
              <!-- Alias Name -->
              
              <script>writeTD("row-l");</script><a>
                %value aliasName encode(html)%</a>
              </td>
                
              <!-- Transaction Mode -->
              
              <script>writeTD("row-l");</script>
                %switch transactionType%
                  %case '0'%NO TRANSACTION<br>
                  %case '1'%LOCAL TRANSACTION<br>
                  %case '2'%XA TRANSACTION<br>
                  %case%&nbsp;<br>
                %end%
              </td>
              
              <!-- CSQ Count -->

              <script>writeTD("row-l");</script>
                %value messageCount encode(html)%
              </td>


              <!-- Delete --> 
              <script>writeTD("rowdata");</script>
                %ifvar enabled equals('true')%
                  <img style="width: 13px; height: 13px;" alt="active" border="0" src="icons/delete_disabled.gif">
                %else%
                 %ifvar hasTriggers equals('true')%
                    <a href="JMS_trigger.dsp?action_type=status&remote_server=%value remote_server encode(url)%&action=delete&aliasName=%value aliasName encode(url)%" onClick="javascript:return confirm('Connection Alias %value aliasName encode(javascript)% is associated with one or more JMS Triggers. Are you sure you want to delete this Connection Alias?')">
                      <img style="width: 13px; height: 13px;" alt="active" border="0" src="icons/delete.gif">
                    </a>
                  %else%
                    <a href="JMS_trigger.dsp?action_type=status&remote_server=%value remote_server encode(url)%&action=delete&aliasName=%value aliasName encode(url)%" onClick="javascript:return confirm('Are you sure you want to delete Connection Alias %value aliasName encode(javascript)%?')">
                      <img style="width: 13px; height: 13px;" alt="active" border="0" src="icons/delete.gif">
                    </a>
                  %endif%
                %endif%
              </td>
			  
			  <script>writeTDnowrap("row-l");</script><input type="checkbox" name="selectedAlias" value="%value aliasName%"></td>
			  
			  
			   <!-- Enabled? -->
              <script>writeTD("rowdata");</script>
              
              %ifvar connected equals('false')%
                %ifvar enabled equals('false')%
                  <a href="JMS_trigger.dsp?action_type=status&remote_server=%value remote_server encode(url)%&action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=true">No</a>
                %else%
                  %ifvar lastError%
                    <a href="JMS_trigger.dsp?action_type=status&remote_server=%value remote_server encode(url)%&action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=false"><img style="width: 13px; height: 13px;" alt="enabled" border="0" src="images/green_check.gif">Yes</a>
                  %else%
                    <a href="JMS_trigger.dsp?action_type=status&remote_server=%value remote_server encode(url)%"><img style="width: 13px; height: 13px;" alt="active" border="0" src="images/yellow_check.gif">In&nbsp;Progress</a>
                  %endif%
                %endif%
              %else%
                <!--a href="JMS_trigger.dsp?action_type=status&remote_server=%value remote_server encode(url)%&action=changeState&aliasName=%value aliasName encode(url)%&setEnabled=false"><img style="width: 13px; height: 13px;" alt="enabled" border="0" src="images/green_check.gif">Yes</a-->
				 <a><img style="width: 13px; height: 13px;" alt="enabled" border="0" src="images/green_check.gif">Yes</a>
              %endif%
              
              <!-- Error Message --> 
              
              %ifvar lastError%
                <tr name="Standard1" >
                  <!-- <td class="subheading" colspan=6> -->
                  <script>writeTDspan("row-l", 6);</script>
                    <font color="red">%value lastError encode(html)%</font>
                  </td>
                </tr>
              %endif%
              
              <script>swapRows();</script>
  
          %endloop%	


	
<script>

function httpGet(theUrl)
{
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
    xmlHttp.send( null );
    return xmlHttp.responseText;
}


function check_enable(chkboxName) {
  var checkboxes = document.getElementsByName(chkboxName);
  var checkboxesChecked = [];
  var NameList = '';
  var AliasList = '';
  
  var clear = document.getElementById("myList");
	while (clear.hasChildNodes()) {
    clear.removeChild(clear.firstChild);
	}
  
  for (var i=0; i<checkboxes.length; i++) {
     if (checkboxes[i].checked) {
        checkboxesChecked.push(checkboxes[i].value);
		checkboxes.toString();
		NameList=NameList+"&triggerNameList="+checkboxes[i].value;
		AliasList=AliasList+"&aliasDataList="+checkboxes[i].value;
     }
  } 

  
  if (chkboxName == 'selectedTriggers'){
  
  httpGet("/invoke/support.action:rem_ctrl_trigger_list?remote_server=%value remote_server encode(javascript)%&action_type=enable" + NameList)
  window.location = "JMS_trigger.dsp?action_type=status&remote_server=%value remote_server%";
  }
  
  if (chkboxName == 'selectedAlias'){
  
  httpGet("/invoke/support.remote:control_jms_alias_list?remote_server=%value remote_server encode(javascript)%&action_type=enable" + AliasList)
  window.location = "JMS_trigger.dsp?action_type=status&remote_server=%value remote_server%";
  }
  
  
}

function check_disable(chkboxName) {
  var checkboxes = document.getElementsByName(chkboxName);
  var checkboxesChecked = [];
  var NameList = '';
  var AliasList = '';
  
  var clear = document.getElementById("myList");
	while (clear.hasChildNodes()) {
    clear.removeChild(clear.firstChild);
	}
  
  for (var i=0; i<checkboxes.length; i++) {
     if (checkboxes[i].checked) {
        checkboxesChecked.push(checkboxes[i].value);
		checkboxes.toString();
		NameList=NameList+"&triggerNameList="+checkboxes[i].value;
		AliasList=AliasList+"&aliasDataList="+checkboxes[i].value;
		
     }
  } 
  
  if (chkboxName == 'selectedTriggers'){
  
  httpGet("/invoke/support.action:rem_ctrl_trigger_list?remote_server=%value remote_server encode(javascript)%&action_type=disable" + NameList)
  window.location = "JMS_trigger.dsp?action_type=status&remote_server=%value remote_server%";
  }
  
  if (chkboxName == 'selectedAlias'){
  
  httpGet("/invoke/support.remote:control_jms_alias_list?remote_server=%value remote_server encode(javascript)%&action_type=disable" + AliasList)
  window.location = "JMS_trigger.dsp?action_type=status&remote_server=%value remote_server%";
  }
  
}

function check_suspend(chkboxName) {
  var checkboxes = document.getElementsByName(chkboxName);
  var checkboxesChecked = [];
  var NameList = '';
  var AliasList = '';
  
  var clear = document.getElementById("myList");
	while (clear.hasChildNodes()) {
    clear.removeChild(clear.firstChild);
	}
  
  for (var i=0; i<checkboxes.length; i++) {
     if (checkboxes[i].checked) {
        checkboxesChecked.push(checkboxes[i].value);
		checkboxes.toString();
		NameList=NameList+"&triggerNameList="+checkboxes[i].value;
		AliasList=AliasList+"&aliasDataList="+checkboxes[i].value;
		
     }
  } 
    if (chkboxName == 'selectedTriggers'){
  
  httpGet("/invoke/support.action:rem_ctrl_trigger_list?remote_server=%value remote_server encode(javascript)%&action_type=suspend" + NameList)
  window.location = "JMS_trigger.dsp?action_type=status&remote_server=%value remote_server%";
  }
  
  if (chkboxName == 'selectedAlias'){
  
  httpGet("/invoke/support.remote:control_jms_alias_list?remote_server=%value remote_server encode(javascript)%&action_type=suspend" + AliasList)
  window.location = "JMS_trigger.dsp?action_type=status&remote_server=%value remote_server%";
  }

}


</script>

    
   %onerror%
   
   <tr>
     <td class="message" colspan=2>%value errorService encode(html)%<br>%value error encode(html)%<br>%value errorMessage encode(html)%<br></td>
   </tr>
                  
   %endinvoke%
                
  </table>
<ul id="myList">
</ul>

  
  <script>	toggle(StandardHeader, 'Standard', 'StandardImg'); </script>
</body>
</html>
