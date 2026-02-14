<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="css/style.css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
  </head>
<script src="<%= request.getContextPath() %>/js/app.js" defer></script>

</head>

<body>
<div class="login-container">
<h2>Login</h2>
<form action="login" method="post">
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Email address</label>
  <input type="email" class="form-control" name="username" id="exampleFormControlInput1" placeholder="name@example.com">
</div>
<label for="inputPassword5" class="form-label">Password</label>
<input type="password" id="inputPassword5" class="form-control" name="password" aria-describedby="passwordHelpBlock">
<div id="passwordHelpBlock" class="form-text">
  Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special characters, or emoji.
</div>
<div class="text-center mt-3">
  <input type="submit" value="Login" class="btn btn-primary w-30">
</div>

<p style="color:red">
${errorMessage}
</p>
</form>
</div>
</body>
</html>