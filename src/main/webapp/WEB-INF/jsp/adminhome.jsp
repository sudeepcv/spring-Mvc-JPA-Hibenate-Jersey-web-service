<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>orgProfiles</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
                		
		<link href="css/theme.css" rel="stylesheet">
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
			  <form class="navbar-form pull-left">
				  <div class="input-group" style="max-width:470px;">
					<input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
					<div class="input-group-btn">
					  <button class="btn btn-default btn-primary" type="submit"><i class="glyphicon glyphicon-search"></i></button>
					</div>
				  </div>
			  </form>
			  <ul class="nav navbar-nav navbar-right">
				 <li><a href="http://www.bootply.com" target="_ext"></a></li>
			
			
				 <li><a href="#"><i class="glyphicon glyphicon-user"></i></a>Adimin</li>
			   </ul>
			</div>	
		 </div>	
		</div>
		
		<div class="navbar navbar-default" id="subnav">
			<div class="col-md-12">
				<div class="navbar-header">
				  
				  <a href="#" style="margin-left:15px;" class="navbar-btn btn btn-default btn-plus dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-home" style="color:#dd1111;"></i> Home <small><i class="glyphicon glyphicon-chevron-down"></i></small></a>
				  <ul class="nav dropdown-menu">
					  <li><a href="#"><i class="glyphicon glyphicon-user" style="color:#1111dd;"></i> Profile</a></li>
					  <li><a href="#"><i class="glyphicon glyphicon-dashboard" style="color:#0000aa;"></i> Dashboard</a></li>
					  <li><a href="#"><i class="glyphicon glyphicon-inbox" style="color:#11dd11;"></i> Pages</a></li>
					  <li class="nav-divider"></li>
					  <li><a href="#"><i class="glyphicon glyphicon-cog" style="color:#dd1111;"></i> Settings</a></li>
					  <li><a href="#"><i class="glyphicon glyphicon-plus"></i> More..</a></li>
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
					 <li class="active"><a href="#">Posts</a></li>
					 
					 <li><a href="#aboutModal" role="button" data-toggle="modal">About</a></li>
				   </ul>
				</div>	
			 </div>	
		</div>
		
		<!--main-->
		<div class="container" id="main">
			<div class="row">
				   <div class="col-md-12 col-sm-18">
				   	
				<div class="panel panel-default">
				  <div class="panel-heading"><h4>All organizations</h4></div>
					<div class="panel-body">
					
					
					<table class="table table-hover table-striped">
<thead>
<tr>

<th>Organizations Name</th>
<th>Type</th>
<th>Review</th>
<th>Delete</th>
</tr>
</thead>
<c:forEach items="${allOrg}" var="allCompany">
<tr id="<c:out value="${allCompany.id}" escapeXml="false" />">

<td>${allCompany.name}</td>
<td>${allCompany.type}</td>
<td><a href="org/<c:out value="${allCompany.name}.html" escapeXml="false" />"  target="_blank" class="btn btn-primary btn-lg btn-block">Review ${allCompany.name} profile</a></td>
<td>
<form action ="deleteOrg.html" id="f${allCompany.id}" method="POST">
<input type="hidden" name="orgId" value="${allCompany.id}"/>
<input type="submit" name="remove_levels" id="<c:out value="${allCompany.id}" escapeXml="false" />" class="btn btn-danger btn-lg" value="Delete">
</form>
</td>

</tr>
</c:forEach>
 </table>
 
					

				  
					</div>
				</div>
			 
	
			 
			

			</div>
			
			</div>
			
		</div>

<hr>
<div class="col-md-12 text-center"><p>Made by The programmer Sudeep cv © 2014</p></div>

		  
		  <div class="modal fade" id="confirm">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">Are you sure you want to delete This Organization??</h4>
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




        
        <script type='text/javascript' src="js/jquery.min.js"></script>
        <script type='text/javascript' src="js/bootstrap.min.js"></script>
        <script type='text/javascript' src="js/script.js"></script>

        <!-- JavaScript jQuery code from Bootply.com editor -->
        
        <script type='text/javascript'>
        
        $(document).ready(function() {
        	
        	
         	
        	$('input[name="remove_levels"]').on('click', function(e){
        		var ide=$(this).attr('id'); 
        		
        		
        	    //var $form=$('input[name="remove_levels"]').closest("form");
        	   // var $form=$('#'+ide).closest("form");
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
        
    </body>
</html>