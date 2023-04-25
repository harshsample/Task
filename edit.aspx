<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="Task_otobit.edit" %>

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
    <link href="Styles/sweetalert.css" rel="stylesheet" />
    <script src="Scripts/sweetalert.min.js"></script>
  <!--favicon-->
 
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

	<div class="col-lg-8" style="margin-left:300px; margin-top:100px">
        <div class="card">
           <div class="card-body">
           <div class="card-title">Update Your Account Details</div>
           <hr>
            <form runat="server">
               
           <div class="form-group">
            <label for="input-7">User Name </label>
            <%--<input type="text" class="form-control form-control-rounded" id="input-7" placeholder="Enter Your Email Address">--%>
               <asp:TextBox ID="txtuname" required="this field is required" class="form-control form-control-rounded" runat="server" ></asp:TextBox>
           </div>
            <div class="form-group">
            <label for="input-9">Email</label>
            <%--<input type="text" class="form-control form-control-rounded" id="input-9" placeholder="Enter Password">--%>
               <asp:TextBox ID="txtemail" required="this field is required" class="form-control form-control-rounded" runat="server" ></asp:TextBox>
           </div>
           <div class="form-group">
            <label for="input-8">Select Image</label>
            <%--<input type="text" class="form-control form-control-rounded" id="input-8" placeholder="Enter Your Mobile Number">--%>
          
                <div class="fallback">
                    <asp:FileUpload ID="FileUpload1"  runat="server" />
                    <asp:Label ID="Label2" runat="server" Text="" ></asp:Label>
                    <asp:Image ID="Image1" runat="server" Width="100px" Height="100px"/>
                </div>
           </div>
          
           <div class="form-group">
            <label for="input-9">Password</label>
            <%--<input type="text" class="form-control form-control-rounded" id="input-9" placeholder="Enter Password">--%>
               <asp:TextBox ID="txtpass" required="this field is required" class="form-control form-control-rounded" runat="server" ></asp:TextBox>
           </div>
           <div class="form-group">
            <%--<button type="submit" class="btn btn-primary btn-round px-5"><i class="icon-lock"></i> Register</button>--%>
               <asp:Button ID="btn_insertplace" runat="server" class="btn btn-primary btn-round px-5" Text="Insert" />
               <asp:Button ID="btn_updateplace" runat="server" Text="Update"   class="btn btn-success btn-round px-5" Visible="False" OnClick="btn_updateplace_Click" />
               <asp:Button ID="btn_cancel" runat="server" class="btn btn-danger btn-round px-5" Text="Cancel" />
          </div>
                
          </form>
         </div>
         </div>
      </div>
	
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

<!-- Mirrored from codervent.com/bulona/demo/authentication-signup.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Feb 2019 05:33:50 GMT -->
</html>
