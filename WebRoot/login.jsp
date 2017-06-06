<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<!-- Head -->
<head>

	<title>登录|注册</title>

	<!-- Meta-Tags -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="keywords" content="Library Member Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //Meta-Tags -->

	<!-- Style -->
	    <link rel="stylesheet" href="css/common.css" type="text/css" media="all">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all">

	<!-- Fonts -->
		<link href="//fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
	<!-- //Fonts -->

</head>
<!-- //Head -->

<!-- Body -->
<body>

	<a href="bookstore.jsp"><h1>魔法书堡</h1></a>
	<div style="color: red">
	
   </div>
	<div class="container w3layouts agileits">

		<div class="login w3layouts agileits">
			<h2>登录</h2>
			
			<form method="post" action="/BookStore/loginServlet">
				<input type="text" name="email" value="${param['email']}" placeholder="注册邮箱" required="">
				<input type="password" name="password" value="${param['password']}" placeholder="密码" required="">
			
			<ul class="tick w3layouts agileits">
				<li>
					<input type="checkbox" id="brand1" value="">
					<label for="brand1"><span></span>记住密码</label>
				</li>
			</ul>
			<div class="send-button w3layouts agileits">
				
					<input type="submit" value="登录">
				</form>
			</div>
			<div class="clear"></div>
		</div>

		<div class="register w3layouts agileits">
			<h2>注册</h2>
			<form method="post" action="/BookStore/registServlet">
				<input type="text" id="inputName" Name="Name" value="${param['Name'] }" placeholder="用户名" required="">
				<input type="text" id="inputEmail" Name="Email" value="${param['Email'] }" placeholder="邮箱" required="">
				<input type="password" id="inputPassword" Name="Password" value="${param['Password'] }" placeholder="密码" required="">
				<input type="text" id="inputTel" Name="Tel" value="${param['Tel'] }" placeholder="电话号码" required="">
			
			<div class="send-button w3layouts agileits">
				
					<input type="submit" value="注册" onClick="return CheckForm()">
				</form>
			    <script type="text/javascript">
	         var msg="<%=request.getAttribute("msg") %>";
	        if(msg !="null"){
	         alert(msg);
	         request.removeAttribute("msg");
	          }
	            </script>
				<script>
			
				    	  
				    	  function CheckForm(){
				    	  
				    	  var name=document.getElementById("inputName").value;
				    	  if(name==null||name==""||name.length>10) {
				    	  alert("请检查你的用户名是否正确");
				    	  return false;}
				    	  var password=document.getElementById("inputPassword").value;
				    	  if(password==null||password==""||password.length>50){
				    	   alert("检查一下你的密码噢，你输入吗，密码不能超过50个字符哦");
				    	   return false;
				    	   }
				    	  
				    	  
				    	  
				    	  var email=document.getElementById("inputEmail").value;
				    	  var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
				    	  if(email.length>50){
				    	  alert("你的邮箱是不是太长了呢");
				    	  return false;
				    	  }
				    	  else if(!reg.test(email)){
				    	  alert("检查一下你的email噢，输入正确吗？");
				    	  return false;
				    	  }
				    	  var tel=document.getElementById("inputTel").value;
				    	  var regt = /^0?1[3|4|5|8][0-9]\d{8}$/;
				    	  if(!regt.test(tel)){
				    	  alert("检查一下你的电话噢，你输入正确吗？");
				    	  return false;
				    	  }
				    	  
				    	  
				    	  }
			
				    	 </script>
			</div>
			<div class="clear"></div>
		</div>

		<div class="clear"></div>

	</div>

	<div class="footer w3layouts agileits">
		<p> &copy; 2016 ECNU BOOK STORE. All Rights Reserved | Design by </a></p>
	</div>

</body>
<!-- //Body -->

</html>