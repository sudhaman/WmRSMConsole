<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Open prop. file</TITLE>
</HEAD>
<BODY>
<br>
<h3 align="center"><font face="Calibri">Open selected</font></h3>
%invoke Test1.myutil:getxmlfile%
<TABLE WIDTH="90%" BORDER="1">

<TABLE BORDER="3">
<TR style="background-color:#4CAF50"><TH>Value</TH></TR>
	<TR>
	<TD><textarea style="border:none;" rows="20" cols="80" wrap="hard">%value xmldata%</textarea></TD>
	</TR>
</TABLE>
<FORM><INPUT Type="button" VALUE="Get Back" onClick="history.go(-1);return true;"></FORM>
</BODY>
</HTML>
