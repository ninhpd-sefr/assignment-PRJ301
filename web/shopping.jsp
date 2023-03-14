<%-- 
    Document   : shopping
    Created on : Mar 3, 2023, 12:07:43 PM
    Author     : TienPhong
--%>

<%@page import="ninhpd.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
    </head>
    <body>
        <h1>Book Store</h1>
        <%
            List<ProductDTO> products = (List<ProductDTO>)
                        request.getAttribute("PRODUCT");
            if (products != null){
        %>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 0;
                        for (ProductDTO dto : products){
                    %>
                    <form action="DispatchServlet">
                        <tr>
                            <td>
                                <%= ++count %>
                            </td>
                            <td>
                                <%= dto.getName() %>
                                <input type="hidden" name="txtName" 
                                       value="<%= dto.getName() %>" /> 
                            </td>
                            <td>
                                <%= dto.getDescription() %>
                            </td>
                            <td>
                                <%= dto.getPrice() %>
                            </td>
                            <td>
                                <%= dto.getQuantity() %>
                            </td>
                            <td>
                                <input type="submit" value="Add Book to Your Cart" name="btAction" />
                            </td>
                        </tr>
                    </form>
                    <%
                        }//end traverse dto
                    %>
                    <form name="btAction" action="DispatchServlet">
                        <input type="submit" value="View Your Cart" name="btAction" />
                    </form>

                </tbody>
            </table>
        <%
            } else {
        %>
              <h2>
                  No record is matched!!!
              </h2>   
        <%  
            }//end no result found
        %>            
    </body>
</html>
