
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
        <%
            
            String id = request.getParameter("id");
            
              String log = " ";
            String depart = " ";
            out.println("Id to be cancelled is " + id);
             
          
   try    
    {
      // create a mysql database connection
      String myDriver = "com.mysql.jdbc.Driver";
      String myUrl = "jdbc:mysql://localhost/choudhary";
      Class.forName(myDriver);      
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      Statement stmt = conn.createStatement();
      
      // create a sql date object so we can use it in our INSERT statement
      
      // the mysql insert statement
//       String query = " select * from requests where requests.e_id = " +id ;
//         ResultSet rs = stmt.executeQuery(query);
         
         
                String query = " select * from employee where employee.e_id= " + "'"+id+"'";
//                out.println(query);
                ResultSet rs = stmt.executeQuery(query);
       
       
       while(rs.next())
      { 
         
          
        // rid = rs.getInt("r_id");
               //   out.println("before");
           id = rs.getString("e_id");
           
          // out.println(id);
              //     out.println("after");
          // type = rs.getString("typ");
          // post = rs.getString("auth_post");
          // ename = rs.getString("auth_name");
         //  sdate = rs.getString("startdate");
         //  edate = rs.getString("enddate");
          // type_of = rs.getString("type_of");
          //loc = rs.getString("location");
          // pick = rs.getString("pickup");
          // drop = rs.getString("dro");
          // reas = rs.getString("reason");
          // authid = rs.getString("auth_id");
          // adec = rs.getString("statusauth");
         //  tdec = rs.getString("statustran");
      //  out.println("issue");
            log = rs.getString("logic_level");
//out.println(log);
            depart = rs.getString("depart");
        //    out.println(depart);
         %>
      
        
         <div id="templatemo_menu">
                		<div id="templatemo_menu_bg_l"></div>
                    <div id="templatemo_menu_bg_r">
                    	<ul>
	
                            <li class="current"><a id="new"  href="NewRequestRoute.jsp" ><b> New Request</b></a></li>  
                            <li><a id="on"  href="OnBehalfStatus.jsp"><b>On Behalf request</b></a></li>
                            <li><a id="history" href="newjsp.jsp"><b>Request History</b></a></li>
                            <li> <a id="pending" href="PendingSol.jsp"><b>Approve Request</b></a></li>
                            <li> <a id="thd" href="THDforward.jsp"><b>THD Request</b></a></li>
                        </ul>
                    </div>

                </div>
 </div>
</div>
         <script type="text/javascript">

 if("<%=log%>"==="B"  || "<%=log%>"==="C" )
    {   
        if("<%=depart%>" === "TRANSPORT" || "<%=depart%>" === "transport")
        {
        document.getElementById('new').style.visibility = 'visible';
        document.getElementById('on').style.display = 'none';
        document.getElementById('history').style.visibility = 'visible';
        document.getElementById('pending').style.display = 'none';
        document.getElementById('thd').style.visibility = 'visible';
        }
        else 
        {
        document.getElementById('new').style.visibility = 'visible';
        document.getElementById('on').style.display = 'none';
        document.getElementById('history').style.visibility = 'visible';
        document.getElementById('pending').style.display = 'none';
        document.getElementById('thd').style.display = 'none';
            
        }   
}
if("<%=log%>"!=="B" && "<%=log%>"!=="C")
    {   
        
        if("<%=depart%>" === "TRANSPORT" || "<%=depart%>" === "transport")
        {
        document.getElementById('new').style.visibility = 'visible';
        document.getElementById('on').style.visibility = 'visible';
        document.getElementById('history').style.visibility = 'visible';
        document.getElementById('pending').style.visibility = 'visible';
        document.getElementById('thd').style.visibility = 'visible';
        }
        else 
        {
         document.getElementById('new').style.visibility = 'visible';
        document.getElementById('on').style.visibility = 'visible';
        document.getElementById('history').style.visibility = 'visible';
        document.getElementById('pending').style.visibility = 'visible';
        document.getElementById('thd').style.display = 'none';
            
        } 
}



    </script>
                
             <%  
          
       
      }
    }
        catch(Exception e)
        {
            out.println("HAHA..!  We are exceptions");
            
        }
        %>
         
       
       
       
       <%
               
            try
            {
                String myDriver = "com.mysql.jdbc.Driver";
      String myUrl = "jdbc:mysql://localhost/choudhary";
      Class.forName(myDriver);      
      Connection conn = DriverManager.getConnection(myUrl, "root", "indianmilitaryacademy");
      Statement stmt = conn.createStatement();
      
      // create a sql date object so we can use it in our INSERT statement
//      out.println("Connection made");
      // the mysql insert statement
       String query = " update requests set statusauth='Cancel',statustran='Cancel' where r_id =" + id ;
       
       
//       out.println(query);
       
         stmt.executeUpdate(query);
         
//         out.println("Query executed"); 
      
    }
        catch(Exception e)
        {
            out.println("HAHA..! We are exceptions");
            
        }
            %>
            
             
    </body>
</html>
