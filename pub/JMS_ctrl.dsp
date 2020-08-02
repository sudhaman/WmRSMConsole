<html>
<TITLE>%value $host encode(html)% - Remote Server Management</TITLE>  
<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" type="text/css" href="webMethods.css">
  <script src="webMethods.js.txt"></script>
  
 </head>


<BODY>
<h3 align="center"><font face="Calibri"> Trigger action</font></h3>

%invoke support.action:rem_ctrl_trigger_list%

 %onerror%
        <p> value errorService encode(html)%<br>%value error encode(html)%<br>%value errorMessage encode(html)%<br></p>
 %endinvoke%
   
   
<script>

// window.location = "JMS_trigger.dsp?remote_server=%value remote_server encode(javascript)%";

</script>




</BODY>
</HTML>