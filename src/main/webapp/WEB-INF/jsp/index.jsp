<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>orgProfiles-Msc ComputerScience project</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="#top">Menu</a>
            </li>
             <li>
                <a href="registration.html">SignUp</a>
            </li>
            <li>
                <a href="#about">About</a>
            </li>
     
        </ul>
    </nav>

    <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center">
            <h1>The online Organizations Profile Creator  </h1>
            <h3>when people go online and search for source of products,service or information you provide ;They can find you ? or the competitor?.!!! If you want to find you REGISTER WHITH US</h3>
            <br>
            <a href="org/search.html" class="btn btn-dark btn-lg">Search</a>
            <a href="registration.html" class="btn btn-info btn-lg">SignUp</a>
             <a data-toggle="modal" class="btn btn-info btn-lg" data-target="#loginModalindex">SignIn</a>
           
           
            
        </div>
    </header>


    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
    
                    <p class="text-muted">Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </div>
    </footer>

  

    <!-- jQuery Version 1.11.0 -->
    
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script>
    // Closes the sidebar menu
   
    
    $("#menu-close").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Opens the sidebar menu
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#sidebar-wrapper").toggleClass("active");
    });

    // Scrolls to the selected menu item on the page
    $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    </script>

				<!--login modal-->
		<div id="loginModalindex" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
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
					  <button class="btn btn-primary btn-lg btn-block">Sign In</button>
					  <span class="pull-right"><a href="registration.html">Register</a></span></span>
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

</body>

</html>