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
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
                		
		<link href="../css/theme.css" rel="stylesheet">
				<link href="../css/maplace.css" rel="stylesheet">
		<style>
  body { padding: 10px; background-color:#CCC }
  #map-canvas { height: 345px }
</style>
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
				 
				 <li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-bell"></i></a>
					<ul class="dropdown-menu">
					  <li><a href="#"><span class="badge pull-right">40</span>Link</a></li>
					  <li><a href="#"><span class="badge pull-right">2</span>Link</a></li>
					  <li><a href="#"><span class="badge pull-right">0</span>Link</a></li>
					  <li><a href="#"><span class="label label-info pull-right">1</span>Link</a></li>
					  <li><a href="#"><span class="badge pull-right">13</span>Link</a></li>
					</ul>
				 </li>
				 <li><a href="#" id="btnToggle"><i class="glyphicon glyphicon-th"></i></a></li>
				 <li><a href="#"><i class="glyphicon glyphicon-user"></i></a></li>
			   </ul>
			</div>	
		 </div>	
		</div>
		
		
		<!--main-->
		<div class="container" id="main">
			<div class="row">
				   <div class="col-md-12 col-sm-18">
				   	
				<div class="panel panel-default">
				  <div class="panel-heading"><h4>Search</h4></div>
					<div class="panel-body">
					
					
					<!-- start search form -->
					<form class="form-horizontal" action="search.html">
													<div class="form-group">
														<label class="col-lg-2 control-label" for="inputName">Place</label>
														<div class="col-lg-10">
														<a data-toggle="modal" role="button" class="btn btn-default btn-info" href="#mapmodals">Select Place..</a>
															<input class="form-control" value="" name="place" id="place" placeholder="Place" type="text">
														</div>
													</div>
													
													<div class="form-group">
														<label class="col-lg-2 control-label" for="inputEmail">Org Name</label>
														<div class="col-lg-10">
															<input class="form-control" id="inputEmail" value="" name="name" placeholder="Name" type="text">
														</div>
													</div>
													
													
													    <div class="form-group">
                <label for="luckynumber" class="col-sm-2 control-label">Type</label>
                <div class="col-sm-10">
                    <select name="type" id="type" class="col-sm-10 form-control">
                        <option value="">select one</option>
                        <option value="IT related company">IT related company</option>
                        <option value="Educational organizations">Educational organizations</option>
                        <option value="Shopes">Shopes</option>
                        <option value="Hospital">Hospital</option>
                        <option value="Hotel">Hotels</option>
                        <option value="Textiles">Textiles</option>
                        <option value="Jewellery">Jewellery</option>
                        <option value="other">Other</option>ther">Other</option>
                    </select>
                </div>
            </div>
													
													
												
													<button class="btn btn-primary btn-lg center-block" type="submit">Search</button>
												
				</form>
					<!-- end search form -->
					
					
					
					<table class="table table-hover table-striped">
<thead>
<tr>

<th>Company Name</th>
<th>Type</th>
<th>Place</th>
<th>Review</th>

</tr>
</thead>
<c:forEach items="${allOrg}" var="allCompany">
<tr id="<c:out value="${allCompany.id}" escapeXml="false" />">

<td>${allCompany.name}</td>
<td>${allCompany.type}</td>
<td>${allCompany.place}</td>
<td><a href="<c:out value="${allCompany.name}.html" escapeXml="false" />" class="btn btn-primary btn-lg btn-block">Review ${allCompany.name} profile</a></td>


</tr>
</c:forEach>
 </table>
 
					

				  
					</div>
				</div>
			 
	
			 
			

			</div>
			
			</div>
			
		</div>
		
		<!-- Modal -->
  <div class="modal fade" id="mapmodals">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Select your place</h4>
        </div>
        <div class="modal-body">
            <input id="pac-input" class="controls"  type="text"
        placeholder="Enter a location">
    <div id="type-selector" class="controls">
      <input type="radio" name="type" id="changetype-all" checked="checked">
      <label for="changetype-all">All</label>

      <input type="radio" name="type" id="changetype-establishment">
      <label for="changetype-establishment">Establishments</label>

      <input type="radio" name="type" id="changetype-geocode">
      <label for="changetype-geocode">Geocodes</label>
    </div>
    <div id="map-canvas"></div>
    
         
        </div>
        <div class="modal-footer">
          <button type="button" onclick="addplace()" class="btn btn-success center-block" data-dismiss="modal">Save</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

<hr>

<div class="col-md-12 text-center"><p>Made by The programmer Sudeep cv © 2014</p></div>



        
        <script type='text/javascript' src="../js/jquery.min.js"></script>
        <script type='text/javascript' src="../js/bootstrap.min.js"></script>
        <script type='text/javascript' src="../js/script.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>
        <script  src="../js/mapcustom.js"></script>

        <!-- JavaScript jQuery code from Bootply.com editor -->
        
        <script type='text/javascript'>
        
        $(document).ready(function() {
        
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