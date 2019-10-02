<%--
    Document   : connection
    Created on : October 07, 2018, 23:05:00 PM
    Author     : Shadab Shaikh,TedirGhazali
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style type="text/css">
 /*background: url(css/bg3.jpg);*/

    label#pw{
        margin-left: 41%;
    }
    .btn-primary{
        margin-left: 60%;   
    }



</style>
<%@ include file="../header.jsp" %>
        <p><br/></p>
        <div class='security'></div>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6"><h3>User Registration</h3></div>
                    <!-- <img src="../css/bg3.jpg" style="width:10px height:10px">  -->
                </div>
                <p></p>
                <form method="post">
                    <img src="../css/bg3.jpg"> 
                    <label for="uname">User Name</label>
                    <label for="passwd" id='pw'>Password</label>
                    <div class="form-inline">
                        <input type="text" class="form-control" id="uname" name="unm" placeholder="Username" style='width:45%' required="required">
                    
                        
                        <input type="text" class="form-control" id="passwd" name="pw" style="width: 45%;margin-left: 10%;" placeholder="Your password" required="required">
                    </div>

                    <div class="form-group">
                        <label for="myname">Name</label>
                        <input type="text" class="form-control" id="myname" name="nm" placeholder="Your name" required="required">
                    </div>

                    <div class="form-group">
                        <label for="myemail">Email address</label>
                        <input type="email" class="form-control" id="myemail" name="em" placeholder="Enter email" required="required">
                    </div>


                    <div class="form-group">
                        <label for="mynumber">Phone number</label>
                        <input type="tel" class="form-control" id="mynumber" name="pn" placeholder="Enter number" required="required">
                    </div>


                    <div class="form-group">
                        <label for="myaddress">Address</label>
                        <textarea class="form-control" id="myadrees" name="ad" placeholder="Your Address" required="required"></textarea>
                    </div>


                    <div class="form-group" >
                        <label for="age">Age</label>
                        <select name='ag' id='some_select' required="required">
                            
                        </select>
                    

                    <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                     <div id='div1' style='display:none';>
                        Successfully Registered!!!Redirecting in a bit
                    </div>
                    <br>
                </form>
            </div>
        </div>
<%@ include file="../footer.jsp" %>    
</html>

<script type="text/javascript">

    var select = '';
    for (i=18;i<=100;i++){
        select += '<option val=' + i + '>' + i + '</option>';
    }
    $('#some_select').html(select);
</script>
<script>
        $(document).ready(function() { 
            setTimeout(function() { 
                $('#div1').fadeOut(); 
         }, 2000); 
        });
</script> 

<%@ include file="../connection.jsp" %>
<%
String username=request.getParameter("unm");
String password=request.getParameter("pw");
String name=request.getParameter("nm");
String email=request.getParameter("em");
String phone=request.getParameter("pn");
String address=request.getParameter("ad");
String age=request.getParameter("ag");
int statusQuery = 0;
Class.forName("com.mysql.jdbc.Driver").newInstance();
if(username!=null && password!=null && name!=null && email!=null && phone!=null && address!=null && age!=null){
    try{
        String query="Insert into jspdemo(username,password,name,email,address,phoneno,age) values(?,?,?,?,?,?,?)";
        ps=connection.prepareStatement(query);
        ps.setString(1,username);
        ps.setString(2,password);
        ps.setString(3,name);
        ps.setString(4,email);
        ps.setString(5,address);
        ps.setString(6,phone);
        ps.setString(7,age);
        statusQuery=ps.executeUpdate();
        if(statusQuery>0){ 
            %>
            <script>
                $(document).ready(function(){
                        $('#div1').show();
                    });
              setTimeout(function() {
                  document.location = "../Login/login.jsp";
              }, 3000); // <-- this is the delay in milliseconds
            </script>
        <%  
        }
    }catch(Exception ex){
        out.println("Your Connection Failed");
    }
}
%>
