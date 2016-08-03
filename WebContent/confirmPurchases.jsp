<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*, java.util.*, db.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>

	<%@include file="header.html" %>   
	<title>SP Games Store</title>
</head>
<body>
<%if(session.getAttribute("userDetails")!=null) {
ArrayList<shoppingCart> resultsList=(ArrayList<shoppingCart>)session.getAttribute("results");%>
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
  
  <form role="form" action="" method="post">
    <div class="row setup-content" id="step-1">
      <div class="col-xs-6 col-md-offset-3">
        <div class="col-md-12">
          <h3> Step 1: Detail Confirmation</h3>
          <div class="form-group">
            <label class="control-label">Name:</label><br />
            <%=session.getAttribute("username") %>
          </div>
          <div class="form-group">
            <label class="control-label">Email:</label><br />
            <%=session.getAttribute("email") %>
          </div>
          <div class="form-group">
            <label class="control-label">Contact:</label><br />
            <%=session.getAttribute("contact") %>
          </div>
          <div class="form-group">
            <label class="control-label">Address:</label><br />
            <%=session.getAttribute("address") %>
          </div>
          <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
        </div>
      </div>
    </div>
    <div class="row setup-content" id="step-2">
      <div class="col-xs-6 col-md-offset-3">
        <div class="col-md-12">
          <h3> Step 2: Payment Details</h3>
           <div class='col-xs-12 form-group required'>
                <label class='control-label'>Name on Card</label>
                <input required="required" class='form-control' size='4' type='text'>
           </div>
          <div class="form-group">
            <div class='col-xs-12 form-group card required'>
                <label class='control-label'>Card Number</label>
                <input required="required" autocomplete='off' class='form-control card-number' size='20' type='text'>
              </div>
          </div>
          <div class="form-group">
            <div class='col-xs-4 form-group cvc required'>
                <label class='control-label'>CVC</label>
                <input required="required" autocomplete='off' class='form-control card-cvc' placeholder='ex. 311' size='4' type='text'>
              </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'>Expiration</label>
                <input required="required" class='form-control card-expiry-month' placeholder='MM' size='2' type='text'>
              </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'> </label>
                <input required="required" class='form-control card-expiry-year' placeholder='YYYY' size='4' type='text'>
              </div>
          </div>
          <button class="btn btn-primary nextBtn btn-lg pull-right" type="button" >Next</button>
        </div>
      </div>
    </div>
    <div class="row setup-content" id="step-3">
      <div class="col-xs-6 col-md-offset-3">
        <div class="col-md-12">
          <h3> Step 3: Cart Summary</h3>
          <label class="control-label">Game:</label><br />
          <%
          double total;
          double subtotal=0;
          for(shoppingCart shops: resultsList){
          total = shops.getPrice()*shops.getQuantity();
                	subtotal = subtotal+total;%>
          		<%=shops.getQuantity() %> <%=shops.getTitle() %><br />
          <%} %>
          <br /><label class="control-label">Total:</label><br />
          $<%=String.format("%.2f", subtotal) %>
        </div>
        <button class="btn btn-success btn-lg pull-right" type="submit">Pay Now</button>
      </div>
    </div>
  </form>
  
</div>
<%} else {
	response.sendRedirect("unauthorised.jsp");
}%>
</body>
</html>