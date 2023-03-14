<%-- 
    Document   : viewCart
    Created on : Feb 28, 2023, 1:49:58 PM
    Author     : ACER
--%>

<%@page import="java.util.Map"%>
<%@page import="ninhpd.cart.CartObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
    </head>
    <body>
        <h1>Book Store!</h1>

        <%
            //1. Customer goes to cart place
            if (session != null) {
                //2. Customer take his/her cart
                CartObj cart = (CartObj) session.getAttribute("CART");
                if (cart != null) {
                    //3.Customer gets items
                    Map<String, Integer> items = cart.getItems();
                    if (items != null) {
        %>
        <form action="DispatchServlet">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>                                  
                        <th>Quantity</th>
                        <th>Action</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 0;
                        for (String key : items.keySet()) {
                    %>
                    <tr>
                        <td>
                            <%= ++count%>.</td>
                        <td><%= key%></td>                                  
                        <td><%= items.get(key)%></td>
                        <td>
                            <input type="checkbox" name="chkItem" value="<%= key%>" />
                        </td>                                  

                    </tr>
                    <%
                        }//traverse Map based on key
                    %>
                    <tr>
                        <td colspan="3">
                            <%
                                String urlRewriting = "DispatchServlet"
                                        + "?btAction=Buy Book";
                            %>
                            <a href="<%= urlRewriting%>">Add more Book to Your Cart</a>
                        </td>
                        <td>
                            <input type="submit" value="Remove Item" name="btAction" />
                        </td>                                  
                    </tr>
                </tbody>
            </table>
        </form>

        <%
                    return;
                }//end items has existed
            }//end cart has existed
        %> <h2>
            No Cart is existed
        </h2 >
        <%
            }//end session has existed

        %>


    </body>
</html>
