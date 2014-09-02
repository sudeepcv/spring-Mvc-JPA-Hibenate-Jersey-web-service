<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        
        <title>OrgProfile</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" rel="stylesheet">
        
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
                		
		<link href="css/theme.css" rel="stylesheet">
		<link href="css/bootstrap.min.css" rel="stylesheet">



    
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
				 

				 
				 <li><i class="glyphicon glyphicon-user"></i>${sessionUname} </li>
			   </ul>
			</div>	
		 </div>	
		</div>
		
		<div class="navbar navbar-default" id="subnav">
			<div class="col-md-12">
				<div class="navbar-header">
				  
				  <a href="#" style="margin-left:15px;" class="navbar-btn btn btn-default btn-plus dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-home" style="color:#dd1111;"></i> Home <small><i class="glyphicon glyphicon-chevron-down"></i></small></a>
				  <ul class="nav dropdown-menu">
					  <li><a href="userhome.html?uname=${sessionUname}&orgid=${orgid}"><i class="glyphicon glyphicon-user" style="color:#1111dd;"></i>Profile</a></li>
					  <li><a href="#"><i class="glyphicon glyphicon-dashboard" style="color:#0000aa;"></i> AllMessages</a></li>
					  <li><a href="#"><i class="glyphicon glyphicon-inbox " style="color:#11dd11;"></i>Addnews</a></li>
					  <li class="nav-divider"></li>
				
				  </ul>
				  
				  
				  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse2">
				  <span class="sr-only">Toggle navigation</span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  </button>
			  
				</div>
				<div class="collapse navbar-collapse" id="navbar-collapse2">
				  <ul class="nav navbar-nav navbar-right">
					 <li class="active"><a href="#">profile</a></li>
					   
					 <li><a href="logout.html">Logout</a></li>
					 <li><a href="#aboutModal" role="button" data-toggle="modal">About</a></li>
				   </ul>
				</div>	
			 </div>	
		</div>

		<!--main-->
		<div class="container" id="main">
		
		<c:if test="${flag != null}">
		
			<div class="alert alert-success alert-block fade in" id="successAlertAddnews">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						
						<h4>Success!</h4>
						<p>Your News Added successfully !!!</p>
					</div><!-- end alert -->
		

 
</c:if>
		
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
						<!-- add news button -->
						<br/>
						<a href="#addNewsModal" role="button" class="btn btn-warning btn-lg" data-toggle="modal"><span class="glyphicon glyphicon-hand-up"></span>Add News</a>
						
					</div><!-- end well -->
					
				</div><!-- end col-12 -->
			</div><!-- end bigCallout -->
		<!-- title end -->
		
		

		
		
		

		    
		    <div class="row">
		    <div class="col-md-12 col-sm-18">
		    
		    <!-- are u sure -->
		   <!--   <div role="alert" class="alert alert-danger fade in">
      <button data-dismiss="alert" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
      <h4>Are you sure you want to delete this news?</h4>
      <p>If you want to then click on yes else click on no</p>
      <p>
        <button class="btn btn-danger" type="button">Yes</button>
        
      </p>
    </div>-->
		    <!-- are you sure? -->
		  

		    <table class="table table-striped table-hover">
		    <tr>
		    <th>Title</th>
		    <th>Date</th>
		    <th>News</th>		    
		    <th>Delete</th>
		    </tr>
		    <c:forEach items="${allnews}" var="news">
		      <c:set var="fulNews" value="${news.news}"/>
		    <c:set var="newslill" value="${fn:substring(fulNews,0,100)}.." />
		    <tr id="${news.id}">
		    <td>${news.title}</td>
		    <td>${news.date}</td>
		    <td>${newslill} </td>
		    <td><form action ="deletNews.html" id="f${news.id}" method="POST">
		    <input type="hidden" name="orgid" value="${orgid}" /> 
		    <input type="hidden" name="uname" value="${sessionUname}"/>
		    <input type="hidden" name="newsid" value="${news.id}" />
		    <input type="submit" id="${news.id}"  name="remove_levels"   class="btn btn-danger btn-lg" value="Delete" /></form></td>
		    </tr>
		    </c:forEach>
  
           </table>
		    </div>
		    </div>
		    
		    
		    

		  
		  
		  <div class="modal fade" id="confirm">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">Are you sure you want to delete the news?</h4>
      </div>
      <div class="modal-body">
        <p>If you want to then click on yes else click on no!!&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        <button type="button" class="btn btn-primary" id="delete">Yes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
		  
		    
	
		</div><!--/main-->







        
         <script  src="js/jquery-1.11.0.min.js"></script>
        <script  src="js/bootstrap.min2.3.js"></script> 
        <script  src="js/jquery.validate.min.js"></script>
        <!-- JavaScript jQuery code from Bootply.com editor -->
        
        <script type='text/javascript'>
        
        $(document).ready(function() {
        	
         
        	
        	
        	$('input[name="remove_levels"]').on('click', function(e){
        		var ide=$(this).attr('id'); 
        		
        		
        	    //var $form=$('input[name="remove_levels"]').closest("form");
        	    var $form=$('#'+ide).closest("form");
        	  //  var $form=$('#'+ide);
        	    
        	    e.preventDefault();
        	    
        	    $('#confirm').modal({ backdrop: 'static', keyboard: false })
        	    
        	        .one('click', '#delete', function (e) {
        	        	
        	            $("#f"+ide).submit();
        	        });
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
        
			
								
								<div class="modal fade" id="addNewsModal">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button class="close" data-dismiss="modal">&times;</button>
												<br><br>
												<h4 class="modal-title">Add News</h4>
											</div><!-- end modal-header -->
											<div class="modal-body">											
										
												<form class="form-horizontal" action="addnewsAction.html" method="post">
												<input type="hidden" name="orgId" value="${orgid}" />
												<input type="hidden" name="uname" value="${sessionUname}" />
												
													<div class="form-group">
														<label class="col-lg-2 control-label" for="inputName">Title</label>
														<div class="col-lg-10">
															<input class="form-control" id="title" name="title" placeholder="title" type="text">
														</div>
													</div>
												
													
													<div class="form-group">
														<label class="col-lg-2 control-label" for="inputMessage">News</label>
														<div class="col-lg-10">
															<textarea class="form-control" id="news" placeholder="news" name="news" rows="3"></textarea>
															
														</div>
													</div>
												
											</div><!-- end modal-body -->
											
											<div class="modal-footer">
												<button class="btn btn-default" data-dismiss="modal" type="button">Close</button> <button class="btn btn-primary" type="submit">Save News</button>
											</form>
											</div><!-- end modal-footer -->
										</div><!-- end modal-content -->
									</div><!-- end modal-dialog -->
								</div><!-- end myModal -->

        
    </body>
</html>