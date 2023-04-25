<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_signup.aspx.cs" Inherits="Task_otobit.user_signup" %>


<!DOCTYPE html>


<html lang="en">

<!-- Mirrored from codervent.com/bulona/demo/authentication-signup.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Feb 2019 05:33:50 GMT -->
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>
  <title>Task</title>
  <!--favicon-->
  <%--<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">--%>
  <!-- Bootstrap core CSS-->
  <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
  <!-- animate CSS-->
  <link href="assets/css/animate.css" rel="stylesheet" type="text/css"/>
  <!-- Icons CSS-->
  <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
  <!-- Custom Style-->
  <link href="assets/css/app-style.css" rel="stylesheet"/>
  
</head>

<body>

<!-- start loader -->
   <div id="pageloader-overlay" class="visible incoming"><div class="loader-wrapper-outer"><div class="loader-wrapper-inner" ><div class="loader"></div></div></div></div>
   <!-- end loader -->

<!-- Start wrapper-->
 <div id="wrapper">

	<div class="card card-authentication1 mx-auto my-4">
		<div class="card-body">
		 <div class="card-content p-2">
		 	<div class="text-center">
		 		
		 	</div>
		  <div class="card-title text-uppercase text-center py-3">Sign Up</div>
		    <form runat="server">
			  <div class="form-group">
			  <label for="exampleInputName" class="sr-only">Name</label>
			   <div class="position-relative has-icon-right">
                   <%--<input type="text" id="exampleInputName" class="form-control input-shadow" placeholder="Enter Your Name">--%>
				   <asp:TextBox ID="txtuname" runat="server" class="form-control input-shadow" placeholder="Enter Your Name"></asp:TextBox>
				   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Your Name !!" ControlToValidate="txtuname" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
				  <div class="form-control-position">
					  <i class="icon-user"></i>
				  </div>
			   </div>
			  </div>
			  <div class="form-group">
			  <label for="exampleInputEmailId" class="sr-only">Email ID</label>
			   <div class="position-relative has-icon-right">
				  <%--<input type="text" id="exampleInputEmailId" class="form-control input-shadow" placeholder="Enter Your Email ID">--%>
				   <asp:TextBox ID="txtemail" runat="server"  class="form-control input-shadow" placeholder="Enter Your Email ID"></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Email !!" ControlToValidate="txtemail" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Email Properly !!" ControlToValidate="txtemail" ForeColor="#FF3300" Display="Dynamic" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ></asp:RegularExpressionValidator>
					<asp:Label ID="Label1" runat="server" Style="color:red" Visible="False"></asp:Label>
				  <div class="form-control-position">
					  <i class="icon-envelope-open"></i>
				  </div>
			   </div>
			  </div>
			  <div class="form-group">
			   <label for="exampleInputPassword" class="sr-only">Password</label>
			   <div class="position-relative has-icon-right">
				  <%--<input type="text" id="exampleInputPassword" class="form-control input-shadow" placeholder="Choose Password" >--%>
				   <asp:TextBox ID="txtpass" runat="server" class="form-control input-shadow" placeholder="Choose Password" TextMode="Password"></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Password !!"  ControlToValidate="txtpass" ForeColor="#FF3300" Display="Dynamic" ></asp:RequiredFieldValidator>
				  <div class="form-control-position">
					  <i class="icon-lock"></i>
				  </div>
			   </div>
			  </div>
			  <div class="form-group">
			   <label for="exampleInputPassword" class="sr-only">Select Picture</label>
			   <div class="position-relative has-icon-right">
				  <%--<input type="text" id="exampleInputPassword" class="form-control input-shadow" placeholder="Choose Password" >--%>
				<asp:FileUpload ID="FileUpload1" runat="server" />
				   <br />
				   <p></p>
				    <asp:Label ID="Label2" runat="server" Text="" Visible="False"></asp:Label>
                    <asp:Image ID="Image1" runat="server" Width="100px" Height="100px"/>
				
			   </div>
			  </div>
			   <div class="form-group">
			     <div class="icheck-material-primary">
                   <input type="checkbox" id="user-checkbox" checked="" />
                   <label for="user-checkbox">I Agree With Terms & Conditions</label>
			     </div>
			    </div>
			  
			 <%--<button type="button" class="btn btn-primary btn-block waves-effect waves-light">Sign Up</button>--%>
				<asp:Button ID="btn_submit" class="btn btn-primary btn-block waves-effect waves-light" runat="server" Text="Sign Up" OnClick="btn_submit_Click"  />
			 
			
			 </form>
		   </div>
		  </div>
		  <div class="card-footer text-center py-3">
		    <p class="text-dark mb-0">Already have an account? <a href="user_signin.aspx"> Sign In here</a></p>
		  </div>
	     </div>
    
     <!--Start Back To Top Button-->
    <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
    <!--End Back To Top Button-->
	
	<!--start color switcher-->
   <div class="right-sidebar">
    <div class="switcher-icon">
      <i class="zmdi zmdi-settings zmdi-hc-spin"></i>
    </div>
    <div class="right-sidebar-content">

      <p class="mb-0">Gaussion Texture</p>
      <hr>
      
      <ul class="switcher">
        <li id="theme1"></li>
        <li id="theme2"></li>
        <li id="theme3"></li>
        <li id="theme4"></li>
        <li id="theme5"></li>
        <li id="theme6"></li>
      </ul>

      <p class="mb-0">Gradient Background</p>
      <hr>
      
      <ul class="switcher">
        <li id="theme7"></li>
        <li id="theme8"></li>
        <li id="theme9"></li>
        <li id="theme10"></li>
        <li id="theme11"></li>
        <li id="theme12"></li>
      </ul>
      
     </div>
   </div>
  <!--end color cwitcher-->
	
	</div><!--wrapper-->
	
  <!-- Bootstrap core JavaScript-->
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/popper.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
	
  <!-- sidebar-menu js -->
  <script src="assets/js/sidebar-menu.js"></script>
  
  <!-- Custom scripts -->
  <script src="assets/js/app-script.js"></script>
  
</body>

<!-- Mirrored from codervent.com/bulona/demo/authentication-signup.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Feb 2019 05:33:50 GMT -->
</html>
