<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        
        <title>OrgProfile</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" rel="stylesheet">
     
     <style type="text/css">

     
     </style>
        
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
                		
		<link href="../css/theme.css" rel="stylesheet">
		<link href="../css/bootstrap.min.css" rel="stylesheet">
		<link href="../css/cmd.css" rel="stylesheet">
		<script
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
</script>
<script>

var myCenter=new google.maps.LatLng('<c:out value="${orgInfo.latitude}"/>','<c:out value="${orgInfo.longitude}"/>');

function initialize()
{
var mapProp = {
  center:myCenter,
  zoom:17,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker=new google.maps.Marker({
  position:myCenter,
  });

marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>

    
    </head>
    
    <body >
        
		<div class="navbar navbar-fixed-top header">
		<div class="col-md-12">
			<div class="navbar-header">
			  
			  <a href="#" class="navbar-brand">orgProfiles</a>
			  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse1">
			  <i class="glyphicon glyphicon-search"></i>
			  </button>
		  
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse1">
			  <form class="navbar-form pull-left" action="search.html">
				  <div class="input-group" style="max-width:470px;">
					<input type="text" class="form-control" name="place" placeholder="Search" name="srch-term" id="srch-term">
					
					<div class="input-group-btn">
					  <button class="btn btn-default btn-primary" type="submit"><i class="glyphicon glyphicon-search"></i></button>
					</div>
				  </div>
			  </form>
			  <ul class="nav navbar-nav navbar-right">
				 

				 
				 <li><i class="glyphicon glyphicon-user"></i>${orgInfo.name} </li>
			   </ul>
			</div>	
		 </div>	
		</div>
		


		<!--main-->
		<div class="container" id="main">
		
						<div class="row">
			<div class="col-md-12 col-sm-18">
			
			
				
<!--	<img src="http://maps.googleapis.com/maps/api/staticmap?center=${orgInfo.latitude},${orgInfo.longitude}&zoom=15&size=600x300&markers=color:red%7C${orgInfo.latitude},${orgInfo.longitude}=false" alt=""> -->			

<c:if test="${sessionimage != null}">
 <img src="../img/${sessionimage}" width="100%" />
</c:if>

				
				
			</div>
		    </div>
		<br>
		<!-- title start -->
				<div class="row" id="bigCallout">
				<div class="col-12">
					
				
					
					<!-- Visible only on small devices -->
					<div class="well well-small visible-sm">
						<a href="" class="btn btn-large btn-block btn-default"><span class="glyphicon glyphicon-phone"></span> Give us a call!</a>
					</div><!-- end well-small -->
					
					<div class="well">
						<div class="page-header">
							<h1>${orgInfo.name} <small>[${orgInfo.type}]</small></h1>
						</div><!-- end page-header -->
						
						<p class="lead">
						
						
						<span class="glyphicon glyphicon-globe"></span>: ${orgInfo.website} <br><span class="glyphicon glyphicon-phone"></span>:${orgInfo.phoneNum}
						<br>
						
						
					</div><!-- end well -->
					
				</div><!-- end col-12 -->
			</div><!-- end bigCallout -->
		<!-- title end -->
		
		
		
		<!-- start -->
<div class="row" id="moreInfo">
				<div class="col-sm-6">
					<h3 class="text-primary"> Contact Us</h3>
					<div class="tabbable">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tab1" data-toggle="tab">Map</a></li>
							<li><a href="#tab2" data-toggle="tab">Address</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tab1">
								<h4><span class="glyphicon glyphicon-map-marker"></span> Our Location </h4>
								
								<!-- map should be here -->
									<div id="googleMap" style="width:500px;height:380px;"></div>
								
								
								
								
							</div><!-- end tab-pane -->
							
							<div class="tab-pane" id="tab2">
							
								
								<pre>${orgInfo.address} <br><span class="glyphicon glyphicon-globe"></span>: ${orgInfo.website} <br><span class="glyphicon glyphicon-phone"></span>:${orgInfo.phoneNum} </pre>
								
								<hr>
								
								
								
								<div class="modal fade" id="myModal">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button class="close" data-dismiss="modal">&times;</button>
												
												<h4 class="modal-title">A Modal Window</h4>
											</div><!-- end modal-header -->
											<div class="modal-body">
												<h4>Text in a modal</h4>
										
												<form class="form-horizontal">
													<div class="form-group">
														<label class="col-lg-2 control-label" for="inputName">Name</label>
														<div class="col-lg-10">
															<input class="form-control" id="inputName" placeholder="Name" type="text">
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-lg-2 control-label" for="inputEmail">Email</label>
														<div class="col-lg-10">
															<input class="form-control" id="inputEmail" placeholder="Email" type="email">
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-lg-2 control-label" for="inputMessage">Message</label>
														<div class="col-lg-10">
															<textarea class="form-control" id="inputMessage" placeholder="Message" rows="3"></textarea>
															<button class="btn btn-success pull-right" type="submit">Send!</button>
														</div>
													</div>
												</form>
											</div><!-- end modal-body -->
											
											<div class="modal-footer">
												<button class="btn btn-default" data-dismiss="modal" type="button">Close</button> <button class="btn btn-primary" type="button">Save changes</button>
											</div><!-- end modal-footer -->
										</div><!-- end modal-content -->
									</div><!-- end modal-dialog -->
								</div><!-- end myModal -->
								
							</div><!-- end tab-pane -->
						</div><!-- end tab-content -->
					</div><!-- end tabbable -->
					
					
							
<!--cmd start  -->		
		
			<div class="detailBox">
    <div class="titleBox">
      <label>Comment Box</label>
        <button type="button" class="close" aria-hidden="true">&times;</button>
    </div>
    <div class="commentBox">
        
        <p class="taskDescription">You can post your comments here about This organization</p>
    </div>
    <div class="actionBox">
        <ul class="commentList" id="cmdList">
        <c:forEach items="${allMsg}" var="allMsg" varStatus="loop">
            <li>
                <div class="commenterImage">
                 <p class="glyphicon glyphicon-user"></p>
                </div>
                <div class="commentText">
                    <p class="">${allMsg.comment }</p> <span class="date sub-text">${allMsg.date}</span>

                </div>
            </li>
      </c:forEach>
     
        </ul>
        <form class="form-inline" role="form">
            <div class="form-group">
                <input class="form-control" id="cmdTExt" type="text" placeholder="Your comments" />
            </div>
            <div class="form-group">
                <button class="btn btn-default" id="Addcmd">Add</button>
            </div>
        </form>
    </div>
</div>
<!-- end cmd -->
					
					
				</div><!-- end col-sm-6 -->
				
				<div class="col-sm-6">
					<h3 class="text-primary">About Us</h3>
					<p>${orgInfo.description}</p>
					
					<h3 class="text-primary">News Update</h3>
					<div class="list-group">
					<c:forEach items="${news}" var="news" varStatus="loop">
					
					
					
					<c:if test="${loop.index < 4}">
					
								
						<a href="#" class="list-group-item" id="${news.id}">
							<h4 class="list-group-item-heading">${news.title }</h4>
							<p class="list-group-item-text">${news.news }</p>
						</a>
					
					





</c:if>
</c:forEach>

				</div><!-- list-group -->	
					
					
				</div><!-- end col-sm-6 -->
			</div><!-- end moreInfo -->
		<!-- end -->
		


			
			</div><!-- container -->
		
		
		    

		    		
		    		
			
			<br>
			
			<div class="clearfix"></div>
			  
			<hr>
			<div class="col-md-12 text-center"><p>Made by The programmer Sudeep cv © 2014</p></div>
			<hr>
			
		  </div>
		</div><!--/main-->







        
         <script  src="../js/jquery-1.11.0.min.js"></script>
        <script  src="../js/bootstrap.min2.3.js"></script> 
        <script  src="../js/jquery.validate.min.js"></script>
        <!-- JavaScript jQuery code from Bootply.com editor -->
        
        <script type='text/javascript'>
        
        $(document).ready(function() {
        	  $("#Addcmd").click(function(e){
        		  e.preventDefault();       
        		  var text =$("#cmdTExt").val();
        		    $("#cmdList").append('<li><div class=\"commenterImage\">'+
        	                  '<p class=\"glyphicon glyphicon-user\"></p>'+
        	                '</div><div class=\"commentText\"><p class=\"\">'+text+'</p> <span class=\"date sub-text\">on '+new Date($.now())+'</span>'+
        	                '</div></li>');
        		    var orgid=<c:out value="${orgInfo.id}" escapeXml="false"/>
        		    
        		    $.post("addcmd.json",{text:text,orgid:orgid,date:new Date($.now())});
        		    
        		  });
        
            /* toggle layout */
			$('#btnToggle').click(function(){
				if ($(this).hasClass('on')) {
					$('#main .col-md-6').addClass('col-md-4').removeClass('col-md-6');
					$(this).removeClass('on');
				}
				else {
					$('#main .col-md-4').addClass('col-md-6').removeClass('col-md-4');
					$(this).addClass('on');
				}
			});
        
        });
        
        </script>
        
        
        		<!--login modal-->
		<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-dialog">
		  <div class="modal-content">
			  <div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				  <h2 class="text-center"><img src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100" class="img-circle"><br>Login</h2>
			  </div>
			  <div class="modal-body"></div>
			  <div class="modal-footer">
				  <div class="col-md-12">
				  <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
				  </div>	
			  </div>
		  </div>
		  </div>
		</div>

        
    </body>
</html>