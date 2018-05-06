


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Scanner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="rg1.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <%
            
            String id = request.getParameter("id");
            
            String log = " ";
            String name = " " ;
            String gender = " ";
            String depart = " ";
            String fname = " ";
            
            
            String pname  = " ";
            
            String manager = " ";
           
            String dgm = " ";
            
            int a=0,b=0;
         
            try
            {
                
//            out.print(id);
                String myDriver = "com.mysql.jdbc.Driver";
                String myUrl = "jdbc:mysql://localhost/choudhary";
                Class.forName(myDriver);
                Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
//                out.println("Connection made");
                
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
      
                Statement stmt = conn.createStatement();
                String query = " select * from employee where employee.e_id= " + "'"+id+"'";
//                out.println(query);
                ResultSet rs = stmt.executeQuery(query);
      
      // create the mysql insert preparedstatement
                       
            
        while(rs.next())
        {
             id = rs.getString("e_id");
            name = rs.getString("e_name");
            gender = rs.getString("gender");
             depart = rs.getString("depart");
             pname = rs.getString("p_name");
             manager = rs.getString("manager");
             dgm = rs.getString("DGM");
            log = rs.getString("logic_level");
            
//            out.println("values are");
//            
//            out.println("Id is " + id + "\n");
//// 
//            out.println("Name is " + name + "\n");

            a = log.compareToIgnoreCase("B");
            b = log.compareToIgnoreCase("C");
            
        }
        rs.close();
        
        stmt.close();
            }
            catch(Exception e)
            {
                out.println("You my friend have entered an exception");
            }
            

if(a!=0 && b!=0)
           {
//           out.println("You are authorised");
           }
else
{
//    out.println("You are not authorised");
    
}


%>


<!--             <div align="right">
                 
                      <p><a id="new_request" href="NewRequestRoute.jsp" > New Request	</a>  <a href="OnBehalfStatus.jsp" >On Behalf request 	</a>  <a id="r_history" href="newjsp.jsp" >Request History</a>  <a href="PendingSol.jsp" >Approve Request</a> <a   href="THDforward.jsp" >THD Request</a></p>
             </div>-->
<div class="pen-title">
  <h1>ON-BEHALF REQUEST</h1>
</div>
<!-- Form Module-->
<div class="module form-module">
  <div class="toggle">
 

    
  </div>
  <div class="form">
    <h2>Enter ID FOR Request</h2>
   <form action="NewRequestRoute.jsp">
     <input type="text" name="id">
    
         
	  <pre>

  <button type="submit">SUBMIT</button></a>
      </pre>
    </form>
  </div>
  </div>


    </body>
</html>
