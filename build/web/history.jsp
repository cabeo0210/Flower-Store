
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body>
        <a:set var="currentUser" value="${sessionScope.USER_LOGIN.id}"/>
        <header class="header">
            <div class="header__content">                
                <h2>Flower<span class="header__logo">Store</span></h2>
                <font color="white">                                
                <h3 style="margin-top: 20px; margin-left: 100px">Welcome, ${sessionScope.USERNAME}</h2>
                    </font>
                    <li class="header__item" style="margin-top: 10px;  list-style: none"><a href="DispatchServlet">Home</a></li>                                    
            </div>
        </header>

        <a:set var="listHistory" value="${requestScope.LIST_HISTORY}"/>
        <a:if test="${not empty listHistory}">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">No.</th>
                        <th scope="col">History ID</th>
                        <th scope="col">Product ID</th>
                        <th scope="col">User ID</th>
                        <th scope="col">Update Date</th>
                        <th scope="col">Description</th>
                    </tr>
                </thead>
                <tbody>
                    <a:forEach var="dto" items="${listHistory}" varStatus="counter">
                        <tr>
                            <th scope="row">${counter.count}</th>
                            <td>${dto.historyID}</td>
                            <td>${dto.productID}</td>
                            <td>${dto.userID}</td>
                            <td>${dto.updateDate}</td>
                            <td>${dto.description}</td>
                        </tr>
                    </a:forEach>                                        
                </tbody>
            </table>
        </a:if>
        <a:if test="${empty listHistory}">
            <font>
            <h2>No history be record!!!</h2>
            </font>
        </a:if>       
    </body>
</html>
