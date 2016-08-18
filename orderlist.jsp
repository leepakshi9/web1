<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Orders</title>
</head>
<body background="C:\Users\Administrator\Pictures\background.png">
<p align="center"><img src="C:\Users\Administrator\Pictures\verizon.png" width="100" height="100" alt="" hspace="20" />
<font size="26"> <i><b>Phone Next Door</b></i> </font>
<img src="C:\Users\Administrator\Pictures\mobile.png" width="150" height="100" alt="" hspace="20" />
</p>
<div align="center">
<%

    int nm= Integer.parseInt(request.getParameter("q"));
	String hint=" ";
	Class.forName("oracle.jdbc.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	PreparedStatement pst =conn.prepareStatement("select product_name, cost, color from product_table where product_id=?");
	pst.setInt(1, nm);
	ResultSet rs=pst.executeQuery();
	int qty=Integer.parseInt(request.getParameter("quantity"));
	%>
	
	<TABLE BORDER="1">
    <TR>
        <TH>Product Name</TH>
        <TH>Cost</TH>
        <TH>Quantity</TH>
        <TH>Color</TH>
    </TR>
    <% while(rs.next()){ %>
    <TR>
        <TD> <%= rs.getInt(1) %></td>
        <TD> <%= rs.getInt(2) %></TD>
        <TD> <%= qty %></TD>
        <TD> <%= rs.getInt(3) %></TD>
        <TD></TD>
    </TR>
    <% } %>
</TABLE>
	<input type="submit" name="submit" value="/submit1.jsp">
	
</div>

</body>
</html>