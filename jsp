<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Book" %>
<% List<Book> books = (List<Book>) request.getAttribute("books"); %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Book List</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
  <div class="container">
    <h1>Book Management</h1>
    <a class="btn" href="books?action=add">+ Add New Book</a>
    <table>
      <thead>
        <tr><th>ID</th><th>Title</th><th>Author</th><th>Price</th><th>Published</th><th>Actions</th></tr>
      </thead>
      <tbody>
      <% if (books != null) {
           for (Book b : books) { %>
          <tr>
            <td><%= b.getId() %></td>
            <td><%= b.getTitle() %></td>
            <td><%= b.getAuthor() %></td>
            <td><%= String.format("%.2f", b.getPrice()) %></td>
            <td><%= (b.getPublishedDate() != null ? b.getPublishedDate().toString() : "") %></td>
            <td>
              <a class="action" href="books?action=edit&id=<%= b.getId() %>">Edit</a>
              |
              <a class="action" href="books?action=delete&id=<%= b.getId() %>" 
                 onclick="return confirm('Delete this book?');">Delete</a>
            </td>
          </tr>
      <%   }
         } %>
      </tbody>
    </table>
  </div>
</body>
</html>
