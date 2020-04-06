<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Employees</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/view-employees.css">   
</head>
<body>
    <div class="container" >
    
    	<c:if test="${empty employees}">
    		<div class="card col-md-7 col-12 mx-auto" >
    			<div class="card-body">
    				<p class="card-text text-center">Sorry, No employees are present in the system. </p>
    			</div>
    		</div>
    	</c:if>
    	
    	
    
    	<c:forEach items="${employees}" var="item">
    	
	    	<div class="card col-md-7 col-12 mx-auto" >
	            <div class="row">
	                <div class="col-md-3 col-12">
	                    <img src="<c:url value="${item.employee_photo}"/>" class="m-3 d-block mx-auto" height="140" width="140">
	                </div>
	                <div class="col-md-9 col-12">
	                    <div class="card-body">
	                        <h5 class="card-title text-center" style="white-space: nowrap; ">${item.firstname} ${item.lastname}</h5>
	                        <p class=" mb-0 card-text text-center">
	                        <fmt:formatDate value = "${item.DOB}" var = "parsedEmpDate" pattern = "dd-MM-yyyy" />
	                        Born on ${parsedEmpDate}</p>
	                        <p class=" mb-0 card-text text-center">EMP ID Number: ${item.employeeId}</p>
	                        <p class=" mb-0 card-text text-center">Technologies known:</p>
	                        <p class=" mb-0 card-text text-center">${item.sel_technologies}</p>
	                    </div>
	                </div>
	            </div>
	        </div>
    	
    	</c:forEach>
        
        
    </div>
</body>
</html>