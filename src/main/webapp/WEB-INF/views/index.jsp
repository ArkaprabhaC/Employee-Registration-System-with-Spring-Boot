<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Registration Window</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css"  type="text/css" >
</head>

<body>
    <div class="container">
        <form:form modelAttribute="employee" action="" onsubmit="return selectAll()" enctype="multipart/form-data" method="post" class="col-md-8 col-12 mx-auto my-4 p-4" style="border-radius:10px">
            <div class="form-group">
                <p class="text-center">Upload your picture</p>
                <div>
                    <img src="https://www.oneworldplayproject.com/wp-content/uploads/2016/03/avatar-1024x1024.jpg"
                        height="130" width="130" class="d-block mx-auto" style="border-radius: 50%;" id="userimg"/>

                        <input type="file" name="file" id="selectedFile" style="display:none" />
                        <input type="button" class="btn btn-primary btn-sm d-block mx-auto m-4" value="Browse..." onclick="document.getElementById('selectedFile').click();" />
                </div>
            </div>
            
            <c:if test="${!empty message }">
            	<p style="color:green;text-align:center;font-weight:bold">${message}</p>
            </c:if>
            
            <div class="form-group">
                <form:label path="firstname">First Name</form:label>
                <form:input type="text" path="firstname" required="required" class="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="lastname">Last Name</form:label>
                <form:input type="text" path="lastname" required="required" class="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="employeeId">Employee ID</form:label>
                <form:input type="text" path="employeeId" required="required" maxlength="6" pattern="[0-9]*" class="form-control"/>
            </div>
            <div class="form-group">
                <form:label path="DOB">Employee DOB</form:label> 
                <form:input type="date" path="DOB" required="required" class="form-control"/>
            </div>
            <div class="form-group">
                <p>Technologies Known</p>
                <div class="row">
                    <div class="col-md-5 col-12">
                        <select id="listbox1" class="form-control" multiple="multiple" role="listbox">
                            <option value="Java">Java</option>
                            <option value=".NET">.NET</option>
                            <option value="Selenium">Selenium</option>
                            <option value="Spring">Spring</option>
                            <option value="ReactJS">ReactJS</option>
                            <option value="NodeJS">NodeJS</option>
                        </select>
                    </div>
                    <div class="col-md-2 col-12">
                        <input type="button" class="btn btn-success btn-sm d-block mx-auto mt-2" value="Add" id="btnAdd" onclick="listboxresult()" />
                        <input type="button" class="btn btn-danger btn-sm d-block mx-auto m-2" value="Remove" id="btnRemove" onclick="listboxremove()" />
                    </div>
                    <div class="col-md-5 col-12">
                        <form:select id="listbox2" path="sel_technologies" multiple="multiple" class="form-control"></form:select>
                    </div>
                </div>
            </div>
            

            <input type="submit" value="Register" name="submit" class="btn btn-primary d-block mx-auto mb-5">
            
            <a class="btn btn-success d-block mx-auto col-3 m-5" href="/view">View Employees!</a>
            
            
        </form:form>
        
        
    </div>
</body>

<script>

	document.getElementById("selectedFile").required = true; 
	
	
	function selectAll(){
		var select_listbox = document.getElementById("listbox2");
		for(var i=0;i<select_listbox.options.length;i++){
			select_listbox.options[i].selected = true;
		}
		
		return true;
		
	}
    function setPicture(){
        const input = document.querySelector("#selectedFile");
        const img = document.getElementById("userimg");

        input.addEventListener('change',function(){
            const file = this.files[0]
            if(file){
                const reader = new FileReader();
                reader.readAsDataURL(file);
                
                reader.addEventListener('load',function(){
                    img.setAttribute("src",this.result);
                });

                
            } 
        });
    }
    setPicture();
    function listboxremove() {
        const listboxprimary = document.getElementById("listbox2");
        const result = document.getElementById("listbox1");

        modifyLists(listboxprimary,result);
    }
    function listboxresult() {
        const listboxprimary = document.getElementById("listbox1");
        const result = document.getElementById("listbox2");

        modifyLists(listboxprimary,result);
    }
    function modifyLists(listboxprimary, result) {
        for (let i = 0; i < listboxprimary.length; i++) {
            if (listboxprimary.options[i].selected === true) {
                result.options[result.length] = new Option(listboxprimary.options[i].text,listboxprimary.options[i].value);
                listboxprimary.options[i] = null;
                i=i-1;
            }
        }
    }
</script>

</html>