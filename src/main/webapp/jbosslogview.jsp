<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String file = request.getParameter("file");
File logFile = new File(System.getProperty("jboss.server.log.dir"),file);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title><%=file %></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
<style type="text/css">
body{background-color: black;color:green;}
p{margin: 0px;font-weight:bold;}
p.fatal {color: rgb(128,0,0);}
p.error {color: rgb(250,0,255);}
p.warn {color: yellow;}
p.info {color: green;}
p.debug {color: green;}
p.trace {color: green;}
</style>
  
  <body>
<%
try {
  InputStreamReader read = new InputStreamReader(
  new FileInputStream(logFile),"UTF-8");
  BufferedReader bufferedReader = new BufferedReader(read);
  String lineTxt = null;
  String lineClass = "";
  while((lineTxt = bufferedReader.readLine()) != null){
  		boolean isNewLogRecord = false;
	  if(lineTxt.indexOf(" FATAL [") != -1){
		  lineClass = "class=\"fatal\"";
		  isNewLogRecord = true;
	  }else if(lineTxt.indexOf(" ERROR [") != -1){
		  lineClass = "class=\"error\"";
		  isNewLogRecord = true;
	  }else if(lineTxt.indexOf(" WARN [") != -1){
		  lineClass = "class=\"warn\"";
		  isNewLogRecord = true;
	  }else if(lineTxt.indexOf(" INFO [") != -1){
		  lineClass = "class=\"info\"";
		  isNewLogRecord = true;
	  }else if(lineTxt.indexOf(" DEBUG [") != -1){
		  lineClass = "class=\"debug\"";
		  isNewLogRecord = true;
	  }else if(lineTxt.indexOf(" TRACE [") != -1){
		  lineClass = "class=\"trace\"";
		  isNewLogRecord = true;
	  }else{
	  	  isNewLogRecord = false;
	  }
		  
  %>
  <%
  	if(isNewLogRecord){
  	%>
  	<span>&nbsp;</span>
  	<%
  	}
   %>
  <p <%=lineClass%>><%=lineTxt%></p>
<%      
  }
  read.close();
} catch (Exception e) {
%>
    <p>读取文件内容出错</p>
	<p><%=e.getMessage()%>
<%
}    
%>    
  </body>
</html>
