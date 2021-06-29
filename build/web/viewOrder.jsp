
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Order</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body>
        <div class="header">
            <div class="header__content">
                <h2>Flower<span class="header__logo">Store</span></h2>
                <nav>
                    <ul>  
                        <font color="white">                                
                        <h3 style="margin-top: 40px;">Welcome, ${sessionScope.USERNAME}</h2>
                            </font>
                            <li class="header__item" style="margin-top: 40px"><a href="DispatchServlet?btnAction=Search Food">Back To Home</a></li>
                            
                    </ul>
                </nav>
            </div>
        </div>

        <c:set var="resultHistory" value="${requestScope.LIST_ORDERHISTORY}"/>
        <c:if test="${not empty resultHistory}">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">No.</th>
                        <th scope="col">Order ID</th>
                        <th scope="col">Address</th>
                        <th scope="col">Phone Number</th>
                        <th scope="col">Date Order</th>
                        <th scope="col">Time Order</th>
                        <th scope="col">Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${resultHistory}" varStatus="counter">
                        <tr>
                            <th scope="row">${counter.count}</th>
                            <td>${dto.orderID}</td>
                            <td>${dto.address}</td>
                            <td>${dto.phoneNumber}</td>
                            <td>${dto.dateOrder}</td>
                            <td>${dto.timeOrder}</td>
                            <td>${String.format("%,.0f",dto.totalPrice)}</td>
                        </tr>
                    </c:forEach>                                        
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty resultHistory}">
            <font>
            <h2>No history be record!!!</h2>
            </font>
        </c:if>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
