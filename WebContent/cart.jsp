<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, java.util.*, db.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@include file="header.html" %>   
	<title>SP Games Store</title>
</head>
<body>

	<!-- This is the page that displays the shopping cart -->
	
	<%
	if(session.getAttribute("userDetails")!=null){%>
		
	<%	ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");
		%>
		<%@include file="navbar.jsp" %>
		
		<div class="container">
		<%if(session.getAttribute("errorMsg") != null){ %>
	<div class="alert alert-danger">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	 	<strong>Error:</strong> <%=session.getAttribute("errorMsg") %>
	</div>
	
	<%
	session.removeAttribute("errorMsg");
	}%>	
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                <%
			if(resultsList!=null){
				double total=0;
				double subtotal=0;
				int scgid = -1;
				
                for (shoppingCart shops:resultsList) {
                	total = shops.getPrice()*shops.getUserquantity();
                	subtotal = subtotal+total;
                scgid++;
                %>
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                             <img class="media-object" src=<%=shops.getImageLocation() %> > 
                            <div class="media-body">
                                <h4 class="media-heading"><%=shops.getTitle() %></h4>
                                <h5 class="media-heading"> by <%=shops.getCompany() %></h5>
                                <span>Pre-Owned: </span><span class="text-success"><strong><%=shops.getPreOwned() %></strong></span><br />
                            	<span>Stock: </span><span class="text-success"><stong><%=shops.getQuantityDB() %></stong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <form action="updateCart">
                        <input type="hidden" name="scgid" value="<%=scgid %>">
                        <input type="hidden" name="gameID" value="<%=shops.getGameID() %>">
                        <input type="number" min="1" class="form-control" name="number" value="<%=shops.getUserquantity()%>">
                        <button type="submit" class="btn btn-default">
                            Update
                        </button></form>
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>$<%=String.format("%.2f", shops.getPrice()) %></strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>$<%=String.format("%.2f", total)%></strong></td>
                        <td class="col-sm-1 col-md-1">
                        <%if(resultsList.size()==1){ %>
                        	<form action ="deleteAll">
                        	<input type="hidden" name="scgid" value="<%=scgid %>"/>
                       		<button type="submit" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> Remove
                        </button></form>
                        <%} else{ %>
                        <form action ="removeFromCart">
                        <input type="hidden" name="scgid" value="<%=scgid %>"/>
                        <button type="submit" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> Remove
                        </button></form><%} %>
                        </td>
                    </tr>
                    <%} %>
                    
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong>$<%=String.format("%.2f", subtotal) %></strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td><form action="deleteAll"><button type="submit" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> Remove All
                        </button></form></td>
                        <td>
                        <a href="index.jsp"><button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </button></a></td>
                        <td>
                        <form action="CheckQuantity"><button type="submit" class="btn btn-success">
                            Checkout <span class="glyphicon glyphicon-play"></span>
                        </button></form></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%		}
	}else{
		response.sendRedirect("unauthorised.jsp");
	}%>
</body>
</html>