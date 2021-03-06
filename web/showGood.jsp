<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Funtime二手商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
  <link rel="shortcut icon" href="img/jspImg/2_BigPic.ico" />
  <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
   <script type="text/javascript">
   function out()
   {  
  	if(confirm("确认要退出该系统吗？我们舍不得你离开唉"))
  	{
  		window.location.href="Logout";
  	}
   }
     function Message()
     {  
    	 var Message = $('#Message').val();
    	 if (Message != "")
        {
    		 alert(Message);
         }
     }
  </script>
  <style type="text/css">
	   body{
		margin: 0;
		padding: 0;
	} 
	body{
		height: 1000px;
		font: 14px/1.5 "Helvetica Neue",Helvetica,Arial,"Microsoft Yahei","Hiragino Sans GB","Heiti SC","WenQuanYi Micro Hei",sans-serif;
	}
	a{  
	    color: #b0b0b0;
		font-size:12px;
		text-decroation: none;
	}
	.topbar{
		background-color: transparent;
		height: 40px;
	}
	.container{
		/*border: 1px solid black;*/
		margin: 0 auto;
		width: 1226px;
	}
	.container::before,.container::after{
		content: "";
		display: table;
	}
	.container::after{
		clear: both;
	}
	.topbar a{
		color: black;
		font-size:20px;
		text-decoration: none;
		cursor: pointer;
		transition: all 0.2s;
	}
	.topbar a:hover{
		color: #409EFF;
		transform: scale(1.2);
	}
	.topbar-nav{
		float: left;
		height: 40px;
		line-height: 40px;
		font-size: 0;
	}
	.topbar-nav span{
		font-size: 12px;
		color: #424242;
		font-family: sans-serif;
		margin: 0.5em;
	}
	.topbar-info,.topbar-cart{
		float: right;
	}
	.topbar-cart a{
		display:block;
		height: 40px;
		line-height: 40px;
		text-align: center;
		width: 120px;
		background: #424242;
	}
	.topbar-cart hover{
		background-color: #fff;
		color:  #ff0000;
	}
	.topbar-cart span{
		margin-left: -4px;
		font-size: 12px;
	}
	.topbar-info a{
		float: left;
		padding: 0 5px;
		line-height: 40px;
		height: 40px;
	}
	.topbar-info span{
		float: left;
		font-family: sans-serif;
		font-size: 12px;
		color: #424242;
		line-height: 40px;
		height: 40px;
	}
	 .hh {
	  display: inline; 
	 }
	 .btn3_mouseout {
	 BORDER-RIGHT: #2C59AA 1px solid; 
	 PADDING-RIGHT: 2px; BORDER-TOP: #2C59AA 1px solid; 
	 PADDING-LEFT: 2px; FONT-SIZE: 12px; 
	 FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#C3DAF5); 
	 BORDER-LEFT: #2C59AA 1px solid; 
	 CURSOR: hand; COLOR: black; 
	 PADDING-TOP: 2px; 
	 BORDER-BOTTOM: #2C59AA 1px solid;
	}
	.formclass{
		font-size: 20px;
	    border-radius: 125px;
	    color: black;
	    font-family: sans-serif;
	    outline: none;
	    border: 1px solid #000;
	    text-align:center;
	}
	.label{
	    display: inline-block;
	    width: 143px;
	    text-align: right;
	    font-weight: bold;
	    font-size: large;
	}
	.right{
	width:14%; float:left; height:100%;
	 }
	.left{width:14%; float:left; height:100%; }
	
	.container2{
		width: 70%;
		margin: 0 auto;
		display: flex;
		flex-wrap: wrap;
		align-content: center;
		justify-content: center;
		background:white;
		position: relative;
		padding-bottom: 100px;
	}
	div.img {
	    margin: 5px;
	    border: 1px solid #ccc;
	    float: left;
	    width: 180px;
	}
	
	div.img:hover {
	    border: 1px solid #777;
	}
	
	div.img img {
	    width: 100%;
	    height: auto;
	}
	div.good{
	    margin: 5px;
	    border: 1px solid #ccc;
	    float: left;
	    width: 510px;
	}
	div.desc {
	    padding: 15px;
	    text-align: center;
	}
	 ul {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    overflow: hidden;
	    background-color: #333;
	    position: fixed;
	    bottom: 0;
	    width: 100%;
	    display: flex;
	    justify-content: center;
	} 
	li a {
	    display: block;
	    color: white;
	    text-align: center;
	    font-size:font-size:20px;
	    padding: 14px 16px;
	    text-decoration: none;
	}
	li a:hover {
	    background-color: #111;
	}
	.formBox{
		position: absolute;
		bottom: 0;
		left: 50%;
		transform: translateX(-50%);
	}
	  </style>
</head>
<body style="background:url(img/jspImg/center.jpg) ;background-size:cover;text-align:center;"onload="Message()">
  <input id="Message" value="${requestScope.Message}" type="hidden">
   <div class="topbar">
     	<div class="container">
        	<div class="topbar-nav">
	        	 <a href="QueryAllGoods">首页</a><span>|</span>
	         <c:if test="${not empty sessionScope.user.priority}">
	        	 <a href="QueryOrder">我的订单</a><span>|</span>
	        	 <a href="QueryMyGoods">我的商品</a><span>|</span>
	        	 <a href="user-Info.jsp">个人中心</a><span>|</span>
	        	 <c:if test="${sessionScope.user.priority == '管理员'}">
	        	   	   <a href="QueryByManager">管理商品</a><span>|</span>
	        	   	   <a href="QueryAllUsers">管理用户</a>
	        	 </c:if>
	        </c:if>
            </div>
            <c:if test="${not empty sessionScope.user.priority}">
	            <div class="topbar-cart">
	            
	                   <a href="QueryAllCart">购物车</a>
	            </div>
	         </c:if>
        <div class="topbar-info"> 
                      <c:if test="${empty sessionScope.user}">
                            <a href="login.jsp">登录</a>
                      </c:if>
                      <c:if test="${not empty sessionScope.user}">
                           <a onclick="out()"> 注销</a>
                           <a>你好,${sessionScope.user.priority}</a>
                      </c:if>      
        </div> 
     </div>
    </div>
  <div>
	  <div>
		  <img src="img/jspImg/2_BigPic.ico" alt="Funtime二手商城" style="width: 60px">
		  <h1 style="font-size: 60px">Funtime二手商城</h1>
	  </div>
    <div class="container2">
      <!-- 商品展示 -->
				<div class="good">
				    <a target="_blank">
				      <img src="${requestScope.good.photo}" title="${requestScope.good.message}"width="500px" >
				    </a>
				     <div class="desc">
				       <p>商品：${requestScope.good.name}</p>
				       <p>价格：${requestScope.good.price}￥</p>
				       <p>销量：${requestScope.good.buy_Sum}</p>
				       <p>商品号：${requestScope.good.id}</p>
				       <p>库存：${requestScope.good.sum}</p>
				       <p>商家：${requestScope.good.owner}</p>
				    </div>
                 </div>    
           <!-- 提交订单  若是自己则不能购买--> 
           <!-- 不是自己可以购买 -->
          <c:if test="${requestScope.good.owner == sessionScope.user.id}">
                  <h1>不能购买自己的商品喔！</h1>
          </c:if>
          <c:if test="${requestScope.good.owner != sessionScope.user.id}">  
		         <form action="CreateOrderDir" method="post">
		            <input type="hidden" name="ownerId" value="${requestScope.good.owner}">
		            <input type="hidden" name="buyerId" value="${sessionScope.user.id}">
		            <input type="hidden" name="money" value="${requestScope.good.price}">
		            <input type="hidden" name="goodId" value="${requestScope.good.id}">
		            <label class="lable">购买数量</label>
		                    <input type="number" name="goodSum" class="formclass"placeholder="大于0小于库存量" autocomplete="off" max="${requestScope.good.sum}" min="1"><br>
		            <label class="lable">收货地址</label>
		                    <input type="text" name="sendAddress" required="required"class="formclass" placeholder="输入收货地址"><br>
		            <label class="lable">联系方式</label>
		                    <input type="text" name="phone" autocomplete="off" placeholder="输入11位的电话号码"class="formclass"
		                               pattern="^(0|86|17951)?(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$" required="required"><br>
		            <label class="lable">信息</label>
		                   <input type="text" name="relateMessage" autocomplete="off" placeholder="请求购买要求信息" class="formclass"
		                              required="required">
		                     <br>
		                  <input type="submit" value="购买" class="formclass">
		           </form>
		          <div>
			          <form action="AddCart" method="post">
			               <input type="hidden" name="goodId" value="${requestScope.good.id}">
			               <input type="hidden" name="userId" value="${sessionScope.user.id}">
			               <label class="lable">购买数量</label>
			                  <input type="number" name="sum" class="formclass"placeholder="购买数量" 
			                                   autocomplete="off" max="${requestScope.good.sum}" min="1">
			                   <br>               
			                  <input type="submit" value="加入购物车" class="formclass">
			          </form>
			      </div>
           </c:if> 
     </div>
   </div>
</body>
</html>