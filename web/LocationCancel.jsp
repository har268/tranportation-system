
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
                            
			
        
        <%
            
            
            String place =" ";
            place = request.getParameter("place");
            session.setAttribute("place", place);    
              
            
            out.println(place);
            
            
            out.println("No requests for the requested place will be entertained");
            
            %>
            
             
            
        
    </body>
</html>
