

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="templatemo_style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="templatemo_background_section_top">
		
			<div class="templatemo_container">
			<div id="templatemo_header" >
				

				<div id="templatemo_logo">

					<h1>Transport Change Requisition </h1>


       </div>           
		</div> 
                        </div> 
                       <div  align="center" STYLE=" height: 200px; width: 1080px; font-size: 17px; overflow: auto;">
<table width="1082" border="1" align="center" >
     
      <tr>
        
        <th>Request ID</th>
        
        <th>Employee ID </th>
         <th>Employee Name </th>
        <th>Cab Type </th>
        <th>Required Date </th>
        <th>Location</th>
        <th>Request for </th>
        <th>Transport Decision</th>
          <th>Solve Request  </th>
        
      </tr>     
        
        <%
            String area = request.getParameter("area");
          String id = " ";
          
            int rid = 0;  
          String type = " ";
          String post = " ";
          String name = " ";
          String sdate = " ";
          String edate = " ";
          String type_of = " ";
          String loc = " ";
          String pick = " ";
          String drop = " ";
          String reas = " ";
          String authid = " ";
          String adec = " ";
          String tdec = " ";
            
            try
            {
                
           String myDriver = "com.mysql.jdbc.Driver";
//           out.print("First step made");
           
           String myUrl = "jdbc:mysql://localhost/choudhary";
           
           Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
//      out.print("Connection made");
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
      
      Statement stmt = conn.createStatement();
//      out.println("Connection established");
     
         
//      ResultSet rs = stmt.executeQuery(query);
//      out.println("first Query Done");
      String sql = " select * from requests where requests.statusauth = 'approve' and requests.location =" + "'"+area+"'";
      ;
                 
                 
//                 out.println("Second Query done");
                 
                 ResultSet rs = stmt.executeQuery(sql);
                 
                 
                 while(rs.next())
                 {
                      rid = rs.getInt("r_id");
           id = rs.getString("e_id");
          
           type = rs.getString("typ");
           post = rs.getString("auth_post");
           name = rs.getString("auth_name");
           sdate = rs.getString("startdate");
           edate = rs.getString("enddate");
           type_of = rs.getString("type_of");
           loc = rs.getString("location");
           pick = rs.getString("pickup");
           drop = rs.getString("dro");
           reas = rs.getString("reason");
           authid = rs.getString("auth_id");
           adec = rs.getString("statusauth");
           tdec = rs.getString("statustran");
          
              %>
               <tr align="center">
      
     <td width="148"><%=rid%></td>
        <td width="148"><%=id%></td>
         <td width="148"><%=name%></td>
        <td width="80"><%=type%></td>
        <td width="85"><%=sdate%> </td>
        <td width="100"><%=loc%></td>
        <td width="117"><%=type_of%> 
        <td width="117"><%=tdec%></td>
        <td>
      <form action="THDfinal.jsp">
           <input type="text" name="id" value="<%=rid%>" style='display:none' >
          <input type="submit" value="Solve">
          
      </form>      </td></tr>

         
              <%
                 }
                 
              }

      
      
            

            catch(Exception e)
            {
                out.println("We have an exception");
            }
            %>
    </body>
</html>
