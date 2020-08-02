<html>
    <head>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <meta http-equiv="Expires" CONTENT="-1">
        <title>Connection Details</title>
        <link rel="stylesheet" TYPE="text/css" HREF="/WmRoot/webMethods.css"></link>    
        <SCRIPT SRC="/WmRoot/webMethods.js.txt"></SCRIPT>
        <script src="artconnjs.txt"></script>
		<script type="text/javascript">
		function load()
		{		
			if (document.form.elements[".CMGRPROP.poolable"]!=undefined && document.form.elements[".CMGRPROP.poolable"].value == "false") {
				setEnabledFields(document.form, false);
			}		
		}
	</script>
    </head>
    <body onload="load()">
        <form name="form" action="ListResources.dsp" method="POST" onSubmit="return validateForm(form)">
        <input type="hidden" name="action" value="editConnection">
        <input type="hidden" name="passwordChange" value="false">
		<!-- ION -->
		<input type="hidden" name="searchConnectionName" value="%value searchConnectionName%">
<table width=100%>
            %invoke pub.art.connection:listAdapterConnections%
            %loop connectionDataList/connectionAlias%

            %invoke wm.art.admin:retrieveAdapterTypeData%
            %onerror%
            %endinvoke%
<td class="oddcol">
            %invoke wm.art.admin.connection:getResourceConfiguration%
            <script>writeTD("row");</script>%value connectionAlias% Details</td>
              
            %include viewConnectionProperties.dsp%
            </tr>
                   
            %onerror%
                %ifvar localizedMessage%
                    %comment%-- Localized error message supplied --%endcomment%
                    <tr><td class="message">Error encountered <PRE>%value localizedMessage%</PRE></td></tr>
                %else%
                    %ifvar error%
                        <tr><td class="message">Error encountered <PRE>%value errorMessage%</PRE></td></tr>
                    %endif%
                %endif%
            %endinvoke%
        </form>    
    </body>
</html>
