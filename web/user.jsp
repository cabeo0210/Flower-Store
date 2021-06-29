
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <div style="display: flex; justify-content: space-between; width: 100%;">
            <font color="red">
            <h2>Welcome, ${sessionScope.USERNAME}</h2>
            </font>
            <form action="DispatchServlet" style="margin-top: 25px">
                <input style="background: #007cba; border-color: #007cba; color: #fff; text-decoration: none; text-shadow: none; border-radius: 3px; height: 30px" type="submit" value="Logout" name="btnAction" />
            </form>
        </div>
    </body>
</html>
