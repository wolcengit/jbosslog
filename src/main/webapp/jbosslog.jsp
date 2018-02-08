<%@ page language="java" import="java.util.*,java.io.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>jbosslog</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
<style type="text/css">
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>  
<body>
<table width="100%" class="gridtable" >
    <tr>
        <th width="65%">文件名称</th>
        <th width="10%" nowrap="nowrap">大小</th>
        <th width="15%" nowrap="nowrap">修改日期</th>
        <th width="10%">下载</th>
    </tr>
    <%
    File logs = new File(System.getProperty("jboss.server.log.dir"));
    File[] files = logs.listFiles();
    for(File file:files){
        if(file.isDirectory()) continue;
        if(file.length() == 0 ) continue;
        String strDate = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date(file.lastModified()));
    %>
    <tr>
        <th width="65%"><a href="<%=basePath%>jbosslogview.jsp?file=<%=file.getName()%>" ><%=file.getName() %></a></th>
        <th width="10%" nowrap="nowrap"><%=file.length() %></th>
        <th width="15%" nowrap="nowrap"><%=strDate %></th>
        <th width="10%"><a href="<%=basePath%>jbosslogdown.jsp?file=<%=file.getName()%>" >下载</a></th>
    </tr>
    <%
    }
    %>
</table>    
</body>
</html>
