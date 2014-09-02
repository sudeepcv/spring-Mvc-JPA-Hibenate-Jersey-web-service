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
        
        <!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
                		
		<link href="css/theme.css" rel="stylesheet">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/maplace.css" rel="stylesheet">
		<style>
  body { padding: 10px; background-color:#CCC }
  #map-canvas { height: 345px }
</style>
    
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
				 

				 
				 <li><i class="glyphicon glyphicon-user"></i>${sessionUname}</li>
			   </ul>
			</div>	
		 </div>	
		</div>
		
		<div class="navbar navbar-default" id="subnav">
			<div class="col-md-12">
				<div class="navbar-header">
				  
				  <a href="#" style="margin-left:15px;" class="navbar-btn btn btn-default btn-plus dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-home" style="color:#dd1111;"></i> Home <small><i class="glyphicon glyphicon-chevron-down"></i></small></a>
				  <ul class="nav dropdown-menu">
					  <li><a href="userhome.html?uname=${sessionUname}"><i class="glyphicon glyphicon-user" style="color:#1111dd;"></i>Profile</a></li>
					  <li><a href="#"><i class="glyphicon glyphicon-dashboard" style="color:#0000aa;"></i> AllMessages</a></li>
					  <li><a href="#"><i class="glyphicon glyphicon-inbox" style="color:#11dd11;"></i>Addnews</a></li>
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
					    
					 <li><a data-target="#loginModal" role="button" data-toggle="modal" data-remote="http://maps.google.com/?q=-37.866963,144.980615">Logout</a></li>
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
				  <div class="panel-heading"><h4>Up data Profile</h4>
				  <a  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"  >Add/Update cover Photo</a>
				  
				  
				  					<div class="alert alert-success alert-block fade in" id="successAlertRegistration">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						
						<h4>Success!</h4>
						<p>Your Profile successfully Updated ..<a href="userhome.html?uname=${sessionUname}"  >click here</a> to log in</p>
					</div><!-- end alert -->
				  
				  
				  
				  </div>
					<div class="panel-body" id="registrationFormId">
					
					
	<form class="form-horizontal"  id="registrationform" action="#" method="post" enctype="multipart/form-data">

        <fieldset class="col-sm-6">
            <legend>Organization Information</legend>
            <div class="form-group">
                <label for="fullname" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" id="name" name="name" class="form-control" value="${orgInfo.name }" />
                </div>
            </div>

            <div class="form-group">
                <label for="comments" class="col-sm-2 control-label">Description</label>
                <div class="col-sm-10">
                    <textarea name="description" id="description" class="form-control" rows="5" cols="40" >${orgInfo.description}</textarea>
                </div>
            </div>
            
                <div class="form-group">
                <label for="comments" class="col-sm-2 control-label">Address</label>
                <div class="col-sm-10">
                    <textarea name="address" id="address" class="form-control" rows="5" cols="40">${orgInfo.address}</textarea>
                </div>
            </div>
            
               <div class="form-group">
                <label for="fullname" class="col-sm-2 control-label">PhoneNumber</label>
                <div class="col-sm-10">
                    <input type="text" id="phoneNum" value="${orgInfo.phoneNum}" name="phoneNum" class="form-control" />
                </div>
            </div>
            

            <div class="form-group">
                <label for="luckynumber" class="col-sm-2 control-label">Type</label>
                <div class="col-sm-10">
                    <select name="type" id="type" class="col-sm-10 form-control">
                        <option value="">select one</option>
                        <option value="it">IT related company</option>
                        <option value="Edu">Educational organizations</option>
                        <option value="shope">Shopes</option>
                        <option value="shope">Hospital</option>
                        <option value="other">Other</option>
                    </select>
                </div>
            </div>
                           <div class="form-group">
                <label for="fullname" class="col-sm-2 control-label">Website</label>
                <div class="col-sm-10">
                    <input type="text" id="website" name="website" class="form-control"  value="${orgInfo.phoneNum}"/>
                </div>
            </div>
                       <div class="form-group">
                <label for="fullname" class="col-sm-2 control-label">Place</label>
                <div class="col-sm-10">
                
                <a data-toggle="modal" role="button" class="btn btn-default btn-primary" data-target="#mapmodalsEdit">Select Place..</a>
                    <input type="text" id="place" name="place" class="form-control" value="" />
                </div>
            </div>

        </fieldset>

        <fieldset class="col-sm-6">
            <legend>Login information</legend>
             <div class="form-group">
                <label for="fullname" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="text" id="userName" name="userName" class="form-control" value="${orgInfo.loginCredentials.userName}" />
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
                <button type="submit" class="btn btn-primary btn-lg">Updata profile</button>
                   
                </div>
            </div>
    <input type="hidden" name="orgId" value="${orgInfo.id}"/>        
   <input type="hidden" value="" id="latitude" name="latitude" />
   <input type="hidden" value="" id="longitude" name="longitude" />
        
    </form>
				  
					</div>
				</div>
			 
	
			 
			

			</div>
			
			</div>
			
		
		
		    

		    		
		    		
			
			<br>
			
			<div class="clearfix"></div>
			  
			<hr>
			<div class="col-md-12 text-center"><p>Made by The programmer Sudeep cv © 2014</p></div>
			<hr>
			
		  </div>
		</div><!--/main-->

		<!-- modal window start -->
											
								<div class="modal fade" id="myModal">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button class="close" data-dismiss="modal">&times;</button>
															
												<h4 class="modal-title">UpLoad Image</h4>
											</div><!-- end modal-header -->
											<div class="modal-body">
												
												<form class="form col-md-12 center-block" action="UploadImage.html" method="post" enctype="multipart/form-data">
												
													<div class="form-group">
														<label class="col-lg-2 control-label" for="inputName">File:</label>
														<div class="col-lg-10">
															<input class="form-control" name="file" id="inputName" placeholder="Name" type="file">
														</div>
													</div>
													
												<br/>
													
													<div class="form-group">
														<label class="col-lg-2 control-label" for="name">Name</label>
														<div class="col-lg-10">
															<input class="form-control" id="name" name="name" placeholder="Name" type="text">
														</div>
													</div>
													<input type="hidden" name="uname" value="${orgInfo.loginCredentials.userName}"/>
													<input type="hidden" name="orgId" value="${orgInfo.id}"/> 
												 <button class="btn btn-primary" type="submit">Upload</button>
												<!--  <button class="btn btn-success pull-right" type="submit">Upload</button>-->
												</form>
											</div><!-- end modal-body -->
											
											<div class="modal-footer">
												
											</div><!-- end modal-footer -->
										</div><!-- end modal-content -->
									</div><!-- end modal-dialog -->
								</div><!-- end myModal -->
		<!-- modal window end -->
		

					<!-- Modal -->
  <div class="modal fade" id="mapmodalsEdit">
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
          <button  type="button" class="btn btn-success center-block" data-dismiss="modal">Save</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->



        
   <script  src="js/jquery-1.11.0.min.js"></script>
        <script  src="js/bootstrap.min2.3.js"></script> 
        <script  src="js/jquery.validate.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>
        <!--<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script> -->
        
        <script  src="js/editprofile.js"></script>
        <script  src="js/editmap.js"></script>
        

        

		

			
		
		

		


        
    </body>
</html>