

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Product Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body>        
        <c:set var="currentUser" value="${sessionScope.USER_LOGIN.id}"/>
        <header class="header">
            <div class="header__content">                
                <h2>Flower<span class="header__logo">Store</span></h2>
                <nav>
                    <ul>
                        <c:if test="${sessionScope.USER_LOGIN != null or not empty sessionScope.USER_LOGIN}">
                            <div style="display: flex; justify-content: space-between; width: 100%;">
                                <font color="white">                                
                                <h3 style="margin-top: 40px;">Welcome, ${sessionScope.USERNAME}</h2>
                                    </font>
                                    <c:if test="${sessionScope.USER_LOGIN.isAdmin}">
                                        <form action="DispatchServlet" style="margin-top: 25px"> 
                                            <input type="hidden" name="userInsert" value="${currentUser}" />
                                            <!-- Button trigger modal -->
                                            <li class="header__item"><a type="button" data-toggle="modal" data-target="#exampleModalLong" href="">Create Product</a></li>                                           

                                            <!-- Modal -->
                                            <c:set var="rsErr" value="${requestScope.ERROR_PRODUCTID}"/>
                                            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLongTitle">Add new Product</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="false">&times;</span>
                                                            </button>                                                                                                                       
                                                        </div>
                                                        <div class="modal-body">                                                            
                                                            <div class="form-row">                                                                
                                                                <label>ID</label>
                                                                <input type="text" class="form-control" name="txtID" value="" required>                                                               
                                                            </div>                                                            
                                                            <div class="form-row">
                                                                <label>Name</label>
                                                                <input type="text" class="form-control" name="txtName" value="" required>
                                                            </div>
                                                            <div class="form-row">
                                                                <label>Image</label>
                                                                <input type="text" class="form-control" name="txtImage" value="" required>
                                                            </div>                                                        
                                                            <div class="form-row">
                                                                <label>Description</label>
                                                                <input type="text" class="form-control" name="txtDesc" value=""  required>
                                                            </div>
                                                            <div class="form-row">
                                                                <label>Quantity</label>
                                                                <input type="text" class="form-control" name="txtQuantity" value=""  min="1" required>
                                                            </div>
                                                            <div class="form-row">
                                                                <label>Price</label>
                                                                <input type="text" class="form-control" name="txtPrice" value="" required>
                                                            </div>
                                                            <div class="form-row">                                                            
                                                                <label>Category</label>
                                                                <select class="form-control" name="cbCategory" required>   
                                                                    <option>-- Select Category --</option>                                                                   
                                                                    <option value="F">Flowers&Plants</option>
                                                                    <option value="D">Gifts</option>                                                                        
                                                                </select>                                                       
                                                            </div>                                                            
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>                                                            
                                                            <button type="submit" class="btn btn-info" name="btnAction" value="Create Product">Create</button>                                                                                                               
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                        <form action="DispatchServlet" style="margin-top: 25px">                                                                                              
                                            <li class="header__item"><a href="DispatchServlet?btnAction=View History">View history</a></li>                                    
                                        </form>
                                    </c:if>
                                    <c:if test="${!sessionScope.USER_LOGIN.isAdmin}">
                                        <form action="DispatchServlet" style="margin-top: 25px">                                                   
                                            <li class="header__item"><a href="DispatchServlet?btnAction=ViewCartPage">View Cart</a></li> 
                                        </form>
                                    </c:if>
                                    <c:if test="${!sessionScope.USER_LOGIN.isAdmin}">
                                        <form action="DispatchServlet" style="margin-top: 25px">                                             
                                            <li class="header__item"><a href="DispatchServlet?btnAction=ViewOrder&txtID=${currentUser}">View History</a></li> 
                                        </form>
                                    </c:if>
                                    <form action="DispatchServlet" style="margin-top: 25px">                                                   
                                        <li class="header__item"><a href="DispatchServlet?btnAction=Logout">Logout</a></li>                                    
                                    </form>                                    
                            </div>
                        </c:if>                        
                        <c:if test="${sessionScope.USER_LOGIN == null or empty sessionScope.USER_LOGIN}">
                            <li class="header__item" style="margin-top: 40px;"><a href="login.html">Login</a></li>
                            </c:if>                        
                        <li class="header__item" style="margin-top: 40px;"><a href="DispatchServlet?btnAction=Search Product">Home</a></li>
                    </ul>
                </nav>
            </div>
        </header> 
        <c:if test="${not empty rsErr}">
            <div style="margin-top: 40px"></div>
            <h2 style="color:red">
                ${requestScope.ERROR_PRODUCTID} 
            </h2>
        </c:if>

        <div style="display: flex; justify-content: center; margin: 80px 0;">
            <form action="DispatchServlet" class="d-flex" style="width: 20%; margin-right: 50px">
                <input name="txtSearchNameFood" value="${param.txtSearchNameFood}" class="form-control me-2" type="text" placeholder="Search Product By Name..." aria-label="Search">
                <button style="cursor: pointer" value="Search by name" name="btnAction" class="btn btn-outline-info" type="submit">Search</button>
            </form>
                        
            <div class="dropdown">
                <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Search by category
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="DispatchServlet?btnAction=Search by category&cbCategory=F">Flowers&Plants</a>
                    <a class="dropdown-item" href="DispatchServlet?btnAction=Search by category&cbCategory=D">Gifts</a>                
                </div>
            </div> 
        </div>  

        <c:set var="result" value="${requestScope.LIST_RESULT}"/>   
        <c:if test="${sessionScope.USER_LOGIN.isAdmin eq true}">
            <c:if test="${not empty result}">
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">No.</th>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Image</th>
                            <th scope="col">Description</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Create Date</th>
                            <th scope="col">Category</th>
                            <th scope="col">Status</th>
                            <th scope="col">Remove</th>
                            <th scope="col">Update</th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="DispatchServlet">
                        <input type="hidden" name="lastUserDelete" value="${currentUser}" />
                        <input type="hidden" name="btnActionSearch" value="${requestScope.ACTIONFORM}" />               
                        <input type="hidden" name="pageIndex" value="0" />
                        <input type="hidden" name="txtSearchValueName" value="${param.txtSearchNameFood}" />
                        <input type="hidden" name="txtMinPrice" value="${param.txtRangeMinMoney}" />
                        <input type="hidden" name="txtMaxPrice" value="${param.txtRangeMaxMoney}" />                                                
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                            <tr>
                                <th scope="row">${counter.count}</th>
                                <td>${dto.id}</td>
                                <td>${dto.name}</td>
                                <td>
                                    <img src="${dto.image}" style="width: 100px; height: 60px"/>
                                </td>
                                <td>${dto.desc}</td>
                                <td>${dto.quantity}</td>
                                <td> ${String.format("%,.0f",dto.price)}</td>
                                <td>${dto.createDate}</td>
                                <td>
                                    <select name="cbCategory">
                                        <c:if test="${dto.categoryID == 'F'}">
                                            <option value="${dto.categoryID}">Flowers&Plants</option>
                                            <option value="D">Gifts</option>   
                                        </c:if>
                                        <c:if test="${dto.categoryID == 'D'}">
                                            <option value="${dto.categoryID}">Gifts</option>
                                            <option value="F">Flowers&Plants</option>   
                                        </c:if>
                                    </select>
                                </td>
                                <td>
                                    <select name="productStatus">
                                        <c:if test="${dto.productStatus == 'Active'}">
                                            <option value="${dto.productStatus}">Active</option>
                                            <option value="Inactive">Inactive</option>
                                        </c:if>
                                        <c:if test="${dto.productStatus == 'Inactive'}">
                                            <option value="${dto.productStatus}">Inactive</option>
                                            <option value="Active">Active</option>
                                        </c:if>
                                    </select>
                                </td>
                                <td>
                                    <input type="checkbox" name="ckRemove" value="${dto.id}" />
                                </td>
                                <td>
                                    <!-- Button trigger Update Modal -->
                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#${dto.id}">
                                        Update
                                    </button>
                                </td>
                            </tr>                                                    
                        </c:forEach>                          
                        <tr>
                            <th scope="row"></th>
                            <td colspan="9"></td>
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
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-danger" name="btnAction" value="Remove chk Product">Confirm</button>                                
                                            </div>
                                        </div>
                                    </div>
                                </div>                                
                            </td>
                        </tr>
                    </form>
                    <c:forEach var="dto" items="${result}">
                        <!-- Modal Update -->
                        <div class="modal fade" id="${dto.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                            <form action="DispatchServlet">                                                                                                                                                                                           
                                <input type="hidden" name="txtID" value="${dto.id}" />
                                <input type="hidden" name="lastUserDelete" value="${currentUser}" />
                                <input type="hidden" name="btnActionSearch" value="${requestScope.ACTIONFORM}" />               
                                <input type="hidden" name="pageIndex" value="0" />
                                <input type="hidden" name="txtSearchValueName" value="${param.txtSearchNameFood}" />
                                <input type="hidden" name="txtMinPrice" value="${param.txtRangeMinMoney}" />
                                <input type="hidden" name="txtMaxPrice" value="${param.txtRangeMaxMoney}" />                                                               
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Update Form</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-row">
                                                <label>Product ID</label>
                                                <input type="text" class="form-control" name="txtID" value="${dto.id}" readonly="" required>
                                            </div>
                                            <div class="form-row">
                                                <label>Name</label>
                                                <input type="text" class="form-control" name="txtName" value="${dto.name}" required>
                                            </div>
                                            <div class="form-row">
                                                <label>Image</label>
                                                <input type="text" class="form-control" name="txtImage" value="${dto.image}" required>
                                            </div>                                                        
                                            <div class="form-row">
                                                <label>Description</label>
                                                <input type="text" class="form-control" name="txtDesc" value="${dto.desc}" required>
                                            </div>
                                            <div class="form-row">
                                                <label>Quantity</label>
                                                <input type="text" class="form-control" name="txtQuantity" value="${dto.quantity}"  required>
                                            </div>
                                            <div class="form-row">
                                                <label>Price</label>
                                                <input type="text" class="form-control" name="txtPrice" value="${dto.price}" required>
                                            </div>
                                            <div class="form-row">                                                            
                                                <label>Category</label>
                                                <select class="form-control" name="cbCategory">
                                                    <c:if test="${dto.categoryID == 'F'}">
                                                        <option value="${dto.categoryID}">Flowers&Plants</option>
                                                        <option value="D">Gifts</option>   
                                                    </c:if>
                                                    <c:if test="${dto.categoryID == 'D'}">
                                                        <option value="${dto.categoryID}">Gifts</option>
                                                        <option value="F">Flowers&Plants</option>   
                                                    </c:if>
                                                </select>                                                           
                                            </div>
                                            <div class="form-row">                                                                                                                                                                                            
                                                <label>Status</label>
                                                <select class="form-control" name="productStatus">                                                    
                                                    <c:if test="${dto.productStatus == 'Active'}">
                                                        <option value="${dto.productStatus}">Active</option>
                                                        <option value="Inactive">Inactive</option>
                                                    </c:if>
                                                    <c:if test="${dto.productStatus == 'Inactive'}">
                                                        <option value="${dto.productStatus}">Inactive</option>
                                                        <option value="Active">Active</option>
                                                    </c:if>
                                                </select>
                                            </div>                                                                                                                                                            
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>                                                                                                                                                                                                        
                                            <button type="submit" name="btnAction" value="Save Change" class="btn btn-info">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>                    
                    </c:forEach>
                </tbody>                  
            </table>
            <div style="margin-top: 50px">      
                <nav style="display: flex; justify-content: center;">
                    <ul class="pagination pagination-lg">
                        <c:forEach begin="0" end="${requestScope.ENDPAGE - 1}" varStatus="counter">
                            <li class="page-item">
                                <a class="page-link" href="${requestScope.ACTIONFORM}?&cbCategory=${param.cbCategory}&txtSearchNameFood=${param.txtSearchNameFood}&txtRangeMinMoney=${param.txtRangeMinMoney}&txtRangeMaxMoney=${param.txtRangeMaxMoney}&pageIndex=${counter.count - 1}">${counter.count}</a>
                            </li>
                        </c:forEach>                        
                    </ul>
                </nav>
            </div>             
        </c:if>            
    </c:if>

    <c:if test="${sessionScope.USER_LOGIN.isAdmin eq false or sessionScope.USER_LOGIN.isAdmin == null}">            
        <c:if test="${not empty result}">
            <div class="search-page">
                <c:forEach var="dto" items="${result}">
                    <div class="search-item">
                        <img src="${dto.image}" style="width: 370px; height: 250px">
                        <div>
                            <h3 style="margin: 20px 0">${dto.name}</h3>
                            <p>Product ID: ${dto.id}</p>
                            <p>Description: ${dto.desc}</p>                     
                            <p>Price: ${String.format("%,.0f",dto.price)} </p>
                            <p>Quantity: ${dto.quantity}</p> 
                            <div style="display: flex; justify-content: center">
                                <c:if test="${sessionScope.USER_LOGIN.isAdmin eq false}">
                                    <form action="DispatchServlet" style="margin-right: 10px">                                        
                                        <input type="hidden" name="txtName" value="${dto.name}" />
                                        <input type="hidden" name="txtPrice" value="${dto.price}" />
                                        <input type="hidden" name="txtCategory" value="${dto.categoryID}" />
                                        <input type="hidden" name="currentUserBuy" value="${currentUser}" />
                                        <input type="hidden" name="txtImage" value="${dto.image}" />

                                        <input type="hidden" name="txtID" value="${dto.id}" />                                        
                                        <input type="hidden" name="btnActionSearch" value="${requestScope.ACTIONFORM}" />               
                                        <input type="hidden" name="pageIndex" value="0" />
                                        <input type="hidden" name="txtSearchValueName" value="${param.txtSearchNameFood}" />                           
                                        <input type="hidden" name="cbCategory" value="${param.cbCategory}" />
                                        <button type="submit" value="Add to Cart" name="btnAction" class="btn btn-info">Add to cart</button>
                                    </form>
                                </c:if>
                                <c:if test="${sessionScope.USER_LOGIN == null}">
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addToCart"> 
                                        Add to cart
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="addToCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLongTitle">Warning</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    You need login to buy this product
                                                </div>
                                                <div class="modal-footer">
                                                    <form action="DispatchServlet">
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-info" name="btnAction" value="LoginToBuy">Login</button>
                                                    </form>                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>                                       
                        </div>
                    </div>                    
                </c:forEach>               
            </div> 
            <div>      
                <nav style="display: flex; justify-content: center;">
                    <ul class="pagination pagination-lg">
                        <c:forEach begin="0" end="${requestScope.ENDPAGE - 1}" varStatus="counter">
                            <li class="page-item">
                                <a class="page-link" href="${requestScope.ACTIONFORM}?&cbCategory=${param.cbCategory}&txtSearchNameFood=${param.txtSearchNameFood}&txtRangeMinMoney=${param.txtRangeMinMoney}&txtRangeMaxMoney=${param.txtRangeMaxMoney}&pageIndex=${counter.count - 1}">${counter.count}</a>
                            </li>
                        </c:forEach>                        
                    </ul>
                </nav>
            </div>
        </c:if>
        <c:if test="${empty result}">
            <font style="color: #ff0000">
            <h2>No result is matched!!!</h2>
            </font>
        </c:if>
    </c:if>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
