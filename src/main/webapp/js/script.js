        $.validator.addMethod("validEmail", function (value, element) {
            return /[\w-]+@([\w-]+\.)+[\w-]+/.test(value);
        }, 'Enter a valid Email');
        
        $.validator.addMethod("validPhoneNum", function (value, element) {
            return /([0-9]{10})|(\([0-9]{3}\)\s+[0-9]{3}\-[0-9]{4})/.test(value);
        }, 'Enter a valid Phone Number');
        
$(document).ready(function(){
	
	
	 
	$("#registrationform").validate({
		  rules: {
		    name: {
		      minlength: 3,
		      maxlength:30,
		      required: true
		    },
		    address:{
		    	required:true
		    },
		    place:{
		      minlength: 3,
		      required: true
		    },
		    userName:{
		    	validEmail:true,
		    	required:true
		    },
		    phoneNum:{
		    	required:true,
		        validPhoneNum:true
		    },
		    password:{
		    	minlength:5,
		    	required:true
		    },
		    description:{
		    	required:true,
		    	minlength:5
		    },
		    place:{
		    	required:true,
		    	
		    },
		    website:{
		    	required:true
		    },
		    type:{
		    	required:true
		    }
		    
		  },
		  showErrors: function(errorMap, errorList) {
		    $.each(this.successList, function(index, value) {
		      return $(value).popover("hide");
		    });
		    return $.each(errorList, function(index, value) {
		      var varpopover="nice";
		      console.log(value.message);
		      
		      varpopover = $(value.element).popover({
		        trigger: "manual",
		        placement: "top",
		        content: value.message,
		        template: "<div style=\"color:red;\" class=\"popover\"><div class=\"arrow\"></div><div class=\"popover-inner\"><div class=\"popover-content\"><p></p></div></div></div>"
		      });
		      
 varpopover.data("popover").options.content = value.message; 
		      return $(value.element).popover("show");
		    });
		  },submitHandler: function(form) {
  	          

              var formData = $('#registrationform').serializeArray();
            

              $.post('registration.json', formData)
                  .done(function () {
                	  $('#successAlertRegistration').slideDown();
                	  $("#registrationFormId :input").attr("disabled", true);
//                      alert('success!');
                  })
                  .fail(function () {
                      alert('error!');
                  });
  		}  });
	
	


        });

