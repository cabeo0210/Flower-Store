

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css">
    </head>
    <body>
        <div class="header">
            <div class="header__content">
                <h2>Flơwer<span class="header__logo">Store</span></h2>
                <nav>
                    <ul> 
                        <font color="white">                                
                        <h3 style="margin-top: 40px;">Welcome, ${sessionScope.USERNAME}</h2>
                            </font>
                            <li class="header__item" style="margin-top: 40px"><a href="DispatchServlet?btnAction=Search Food">Shopping</a></li>
                           
                    </ul>
                </nav>
            </div>            
        </div>
        <h2 style="color: greenyellow">
            Congratulations, Your Order is success!!! 
        </h2>
    </body>
</html>
