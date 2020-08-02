<html>

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
        imgElem.src = '../images/expanded.gif'
      }else {
        hideStandard = "true";
        imgElem.src = '../images/collapsed.gif'
      }
    }else {
     if (hideSOAP == "true") {
        set = 'table-row';
        hideSOAP = "false";
        imgElem.src = '../images/expanded.gif'
      }else {
        hideSOAP = "true";
        imgElem.src = '../images/collapsed.gif'
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
    imgElem.src = '../images/expanded.gif'
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
        window.location = "ListMQdtls.dsp?type=all&$alias=OMPTRG_IS_97"+appendStrAmp;
      }else if (hideStandard == "false") {
        window.location = "ListMQdtls.dsp?type=standard&$alias=OMPTRG_IS_97"+appendStrAmp;
      }else if (hideSOAP == "false") {
        window.location = "ListMQdtls.dsp?type=soap&$alias=OMPTRG_IS_97"+appendStrAmp;
      }else {
        window.location = "ListMQdtls.dsp?$alias=OMPTRG_IS_97"+appendStrQue;
      }
    }
	
	

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


	
  </script>
<TITLE>Remote Server Management</TITLE>  
</head>

<body onLoad="loadDocument();">

  <table width="100%">
    <tr>
      <td class="menusection-Settings" colspan="2">Remote Management</td>
    </tr>
    
	%invoke wm.server.remote:serverList%  <!--Server List -->           
 
<!-- Server Lists -->
		
<table width="100%">  
        
          <tr name="RServerHeader" onClick="toggle(this, 'RServer', 'RServer');">
            <td class="heading" colspan=7>
              <img id='RServer' src="../images/collapsed.gif" border="0"><a name="RServerAnchor">&nbsp;Remote Servers</a>
            </td>
          </tr>
   
          <tr name="RServer" >
            <td class="oddcol-l">Server</td>
          </tr> 
          
            <script>resetRows();</script>
            %loop -struct servers% 			
                <tr name="RServer" >
                  <script>writeTD("row-l");</script><A id="a%value alias encode(htmlattr)%" TARGET="%ifvar target%%value $host encode(htmlattr)%%value target encode(htmlattr)%%else%body%endif%" HREF="ListMQdtls.dsp?remote_server=%value alias encode(htmlattr)%"> %value alias encode(html)% </a>   </td>
                <script>swapRows();</script>
            %endloop%
			    </tr>
</table>  

<!-- Server Lists Ended-->		


  </table>
</body>
</html>
