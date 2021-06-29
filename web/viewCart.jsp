
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
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

        <c:set var="warningQuantity" value="${requestScope.OUTOFSTOCK}"/>
        <c:if test="${not empty warningQuantity}">
            <div>
                <h3 style="color: red">
                    ${warningQuantity}
                </h3>
            </div>
        </c:if>

        <c:set var="cart" value="${sessionScope.CART_USER}"/>
        <c:if test="${not empty cart}">
            <c:set var="result" value="${cart.list}"/>
            <c:if test="${not empty result}">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">No.</th>
                            <th scope="col">Product ID</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Image</th>
                            <th scope="col">Category</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Update</th>
                            <th scope="col">Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                        <form action="DispatchServlet">
                            <tr>
                                <th scope="row">${counter.count}</th>
                                <td>${dto.key}</td>                               
                                <td>${dto.value.name}</td>
                                <td><img src="${dto.value.image}" style="width: 120px; height: 50px;"/></td>
                                <td>
                                    <c:if test="${dto.value.categoryID == 'F'}">
                                        <c:out value="${'Flowers&Plant'}"/>
                                    </c:if> 
                                    <c:if test="${dto.value.categoryID == 'D'}">
                                        <c:out value="${'Gifts'}"/>
                                    </c:if>
                                </td>
                                <td>
                                    <input type="number" name="txtQuantity" value="${dto.value.quantity}" min="1" />                                    
                                </td>
                                <td>${String.format("%,.0f",dto.value.price)}</td>
                                <td>
                                    <button type="submit" class="btn btn-info" name="btnAction" value="UpdateItemFromCart">Update</button>
                                </td>
                                <td>
                                    <!-- Button trigger modal Remove -->
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#Delete${dto.key}">
                                        Remove
                                    </button>

                                    <!-- Modal Remove-->
                                    <div class="modal fade" id="Delete${dto.key}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLongTitle">Option</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Are you sure about that?
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="hidden" name="txtID" value="${dto.key}" />
                                                    <input type="hidden" name="txtName" value="${dto.value.name}" />                                                    
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-danger" name="btnAction" value="RemoveItemFromCart">Confirm</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                                                    
                                </td>
                            </tr>
                            <c:set var="totalPriceOneProduct" value="${dto.value.quantity * dto.value.price}"/>
                            <c:set var="totalPriceAll" value="${totalPriceAll + totalPriceOneProduct}"/>
                        </form>
                    </c:forEach>
                    <tr>
                        <th scope="row"></th>
                        <td colspan="5">

                        </td>
                        <td>
                            <c:set var="totalPrice" value="${totalPriceAll}"/>
                            Total Price: ${String.format("%,.0f",totalPriceAll)}
                        </td>
                    </tr>
                </tbody>
            </table>
            <div style="display: flex; justify-content: center">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#exampleModalLong">
                    Order
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Information</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="DispatchServlet">
                                <div class="modal-body">   

                                    <div class="form-row">                                                                
                                        <label>Phone number</label>
                                        <input type="text" class="form-control" name="txtPhoneNumber" value="" required>            
                                    </div>                                                            
                                    <div class="form-row">
                                        <label>Address</label>
                                        <input type="text" class="form-control" name="txtAddress" value="" required>
                                    </div>                                                                                            
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <input type="hidden" name="txtTotalPrice" value="${totalPrice}" />                                    
                                    <button type="submit" class="btn btn-info" name="btnAction" value="OrderProduct">Confirm order</button>            
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>            
    </c:if> 
    <c:if test="${empty result}">
        <h2>Your cart is Empty!!!</h2>
    </c:if>
</c:if>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
