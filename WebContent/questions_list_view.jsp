<%@page import="com.actionbeans.admin.AdminQuestionsActionBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.beans.BeanClass"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="" method="post">
<jsp:include page="questions.jsp"></jsp:include>
	<%
		Vector<Vector<Object>>  data=null;
			Vector<Object>    row   = null;
			Iterator<Vector<Object>> itr_row = null;
			Iterator<Object>       itr_col=null;
			
			BeanClass bean = new BeanClass();
			
			bean.setSub_code(session.getAttribute("sub_code").toString());
			AdminQuestionsActionBean action=new AdminQuestionsActionBean(bean);
			
			data= action.listQues();
			
			 itr_row  =   data.iterator(); 
			 if(data.size()>0)
			 {
	%>
		    <center><h2><font color="darkred" ><b>List of Questions</b></font></h2></center>
				
				<table align="center"  border=1>
				
				<tr>	
						<th align="center">Subject Code</th>
							<th align="center">Question</th>
								<th align="center">Answer 1</th>
								<th align="center">Answer 2</th>
								<th align="center">Answer 3</th>
								<th align="center">Answer 4</th>
								<th align="center">Right Answer</th>
								
			</tr>
					
		<%			
									itr_row = 	data.iterator();					
									while(itr_row.hasNext())
									{
									
										 row  =     itr_row.next();
										itr_col =row.iterator();	
										
										

			%>
						<tr>
			<%							
										while(itr_col.hasNext())
										{
											
								%>
											
											<td><%=itr_col.next() %></td>
											
								<%		
										}
										
			
			%>
						</tr>
			<%
									}
									
									
			%>
					</table>
			<%
					}
									
					else{
		%>				
								<h3 align=center>No Record exist.</h3>		
			<%				
					}		
							
			%>
			</form>
	</body>
</html>