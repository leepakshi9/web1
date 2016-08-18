<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" import="Ankur" import="valid.Distance"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Ankur ld=new Ankur();
int cust_id=ld.username;
double clon,clat;
%>
String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = DriverManager.getConnection(url, "scott", "tiger");
		PreparedStatement statement = conn.prepareStatement() ;
	    ResultSet resultset = 
	        statement.executeQuery("Select lat,longt from Customer where Cust_Id=? ") ;
		clat=resultset.getDouble(1);
		clon=resultset.getDouble(2);
	    
<%
	
	Distance d=new Distance();
	int store=d.shortest(clon,clat);
%>
		
	PreparedStatement statement = conn.prepareStatement("insert into order values(?,?,?,?,?)") ;
	statement.setInt(1,cust_id);
	statement.setInt(2,store);
	statement.setInt()
	    ResultSet resultset = 
	        statement.executeQuery() ;
	  
	  <p><i>Order Placed</i></p>  
		
</body>
</html>