	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, java.util.*, db.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
<script type="text/javascript">
  Stripe.setPublishableKey('pk_test_KXA5yHKEOWN965jBq0XPBnLx');
</script>

	<%@include file="header.html" %>   
	<title>SP Games Store</title>
</head>

<!-- This page allows the user to confirm their purchase -->

<body>
<%if(session.getAttribute("userDetails")!=null) {
ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");

if(resultsList==null){
	session.setAttribute("errorMsg", "Please add games into your shopping cart before confirming your purchase");
	response.sendRedirect("index.jsp");
	return;
}%>
<%@include file="navbar.jsp" %>

<script src="js/confirmPurchases.js"></script>
<div class="container">
  
<div class="stepwizard col-md-offset-3">
    <div class="stepwizard-row setup-panel">
      <div class="stepwizard-step">
        <a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
        <p>Step 1</p>
      </div>
      <div class="stepwizard-step">
        <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
        <p>Step 2</p>
      </div>
      <div class="stepwizard-step">
        <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
        <p>Step 3</p>
      </div>
    </div>
  </div>
  <%UserModel details = (UserModel)session.getAttribute("userDetails");%>
    <div class="row setup-content" id="step-1">
      <div class="col-xs-6 col-md-offset-3">
        <div class="col-md-12">
          <h3> Step 1: Detail Confirmation</h3>
          <div class="form-group">
            <label class="control-label">Name:</label><br />
            <%=details.getUsername() %>
          </div>
          <div class="form-group">
            <label class="control-label">Email:</label><br />
            <%=details.getEmail() %>
          </div>
          <div class="form-group">
            <label class="control-label">Contact:</label><br />
            <%=details.getContact() %>
          </div>
          <div class="form-group">
            <label class="control-label">Address:</label><br />
            <%=details.getAddress() %>
          </div>
          <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
        </div>
      </div>
    </div>
    <div class="row setup-content" id="step-2">
      <div class="col-xs-6 col-md-offset-3">
        <div class="col-md-12">
          <h3> Step 2: Cart Summary</h3>
          <label class="control-label">Game:</label><br />
          <%
          double total;
          double subtotal=0;
          for(shoppingCart shops: resultsList){
          total = shops.getPrice()*shops.getUserquantity();
                	subtotal = subtotal+total;%>
          		<%=shops.getUserquantity() %> <%=shops.getTitle() %><br />
          <%} %>
          <br /><label class="control-label">Total:</label><br />
          $<%=String.format("%.2f", subtotal) %>
        </div>
          <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
        </div>
      </div>
    <div class="row setup-content" id="step-3">
      <div class="col-xs-6 col-md-offset-3">
        <div class="col-md-12">
          <h3> Step 3: Card Details</h3>
          <form action="Transaction">
          <input type="hidden" name="userID" value="<%=details.getUserID()%>">
          <script
  			 src="https://checkout.stripe.com/checkout.js" class="stripe-button"
  			 data-key="pk_test_KXA5yHKEOWN965jBq0XPBnLx"
   			 data-amount=""
   			 data-name="SP Gaming Store"
   			 data-description="Payment"
   			 data-image="./favicon.ico"
   			 data-locale="auto"
  			 data-currency="sgd">
  			</script>
              </form>
          </div>
      </div>
    </div>
 </div>
  
<%} else {
	response.sendRedirect("unauthorised.jsp");
}%>
</body>
</html>