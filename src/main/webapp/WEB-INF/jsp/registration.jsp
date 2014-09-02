<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8">
        <title>orgProfiles</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
                		
		<link href="css/theme.css" rel="stylesheet">
		<link href="css/maplace.css" rel="stylesheet">
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
				  <div class="panel-heading"><h4>SignUP</h4>
				   
				  	
				  	<div class="alert alert-success alert-block fade in" id="successAlertRegistration">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						
						<h4>Success!</h4>
						<p>Your organizational successfully Registered . now you can login with your username and password <a data-toggle="modal"  href="#loginModal" class="btn btn-primary">click here</a> to log in</p>
					</div><!-- end alert -->
				  
				  
				  
				  </div>
				  
				  						<div class="row">
			<div class="col-md-12 col-sm-18">
<!-- 				
<c:if test="${ErrorLogin != null}">
 <div role="alert" class="alert alert-danger fade in">
      <button data-dismiss="alert" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
      <h4>Oh snap! You got an error!</h4>
      <p>In order to log in you have to register first!!If you have already registered try login again!!</p>
      <p>
        
        <button class="btn btn-default btn-parimary" type="button" data-toggle="modal"  href="#loginModal">Click here to login</button>
      </p>
    </div>
</c:if>   -->

				
				
			</div>
		    </div>
		    <br>
				  
					<div class="panel-body" id="registrationFormId">
					
					
	<form class="form-horizontal"  id="registrationform" action="#" method="post" enctype="multipart/form-data">

        <fieldset class="col-sm-6">
            <legend>Organization Information</legend>
            <div class="form-group">
                <label for="fullname" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" id="name" name="name" class="form-control" />
                </div>
            </div>

            <div class="form-group">
                <label for="comments" class="col-sm-2 control-label">Description</label>
                <div class="col-sm-10">
                    <textarea name="description" id="description" class="form-control" rows="5" cols="40"></textarea>
                </div>
            </div>
            
                <div class="form-group">
                <label for="comments" class="col-sm-2 control-label">Address</label>
                <div class="col-sm-10">
                    <textarea name="address" id="address" class="form-control" rows="5" cols="40"></textarea>
                </div>
            </div>
            
               <div class="form-group">
                <label for="fullname" class="col-sm-2 control-label">PhoneNumber</label>
                <div class="col-sm-10">
                    <input type="text" id="phoneNum" name="phoneNum" class="form-control" />
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
                        <option value="other">Other</option>
                    </select>
                </div>
            </div>
                           <div class="form-group">
                <label for="fullname" class="col-sm-2 control-label">Website</label>
                <div class="col-sm-10">
                    <input type="text" id="website" name="website" class="form-control" />
                </div>
            </div>
                       <div class="form-group">
                <label for="fullname" class="col-sm-2 control-label">Place</label>
                <div class="col-sm-10">
                
                <a data-toggle="modal" role="button" class="btn btn-default btn-primary" href="#mapmodals">Select Place..</a>
                    <input type="text" id="place" name="place" class="form-control" />
                </div>
            </div>
            
            
                  
        
            
  
            

            
        </fieldset>

        <fieldset class="col-sm-6">
            <legend>Login information</legend>
             <div class="form-group">
                <label for="fullname" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="text" id="userName" name="userName" class="form-control" />
                </div>
            </div>
            
                    <div class="form-group">
                <label for="fullname" class="col-sm-2 control-label">Password</label>
                <div class="col-sm-10">
                    <input type="password" id="password" name="password" class="form-control" />
                </div>
            </div>
            
         
            
            

            



    

        </fieldset>
        <br />
            <div class="form-group" align="center">
                <div class="col-sm-10">
                <button class="btn btn-danger btn-lg" type="reset">Reset</button>
                <button type="submit" class="btn btn-primary btn-lg">SignUp</button>
                   
                </div>
            </div>
            
   <input type="hidden" value="" id="latitude" name="latitude" />
   <input type="hidden" value="" id="longitude" name="longitude" />
        
    </form>
				  
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
			
		</div><!-- /.contain -->

<hr>


             
<div class="col-md-12 text-center"><p>Made by The programmer Sudeep cv © 2014</p></div>


		<!--login modal-->
		<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
		  <div class="modal-dialog">
		  <div class="modal-content">
			  <div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				  <h2 class="text-center">Login</h2>
			  </div>
			  <div class="modal-body">
				  <form class="form col-md-12 center-block" action="loginAction.html" method="post">
					<div class="form-group">
					  <input type="text" name="email" class="form-control input-lg" placeholder="Email">
					</div>
					<div class="form-group">
					  <input type="password" name="password" class="form-control input-lg" placeholder="Password">
					</div>
					<div class="form-group">
					  <button type="submit" class="btn btn-primary btn-lg btn-block">Sign In</button>
					  
					</div>
				  </form>
			  </div>
			  <div class="modal-footer">
				  <div class="col-md-12">
				  <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
				  </div>	
			  </div>
		  </div>
		  </div>
		</div>
		<!--login modal end-->
        
        <script  src="js/jquery-1.11.0.min.js"></script>
        <script  src="js/bootstrap.min2.3.js"></script> 
        <script  src="js/jquery.validate.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>
        <!--<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script> -->
        <script  src="js/mapcustom.js"></script>
               
        <script  src="js/script.js"></script>
        
      <!--    <script src="http://malsup.github.com/jquery.form.js"></script> 

       JavaScript jQuery code from Bootply.com editor -->
        

        
    </body>
</html>