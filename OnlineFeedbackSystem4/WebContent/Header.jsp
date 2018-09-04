<nav class="navbar navbar-expand-lg navbar-light bg-success">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Admin.jsp">HOME <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ADD/Modify Details
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item stl" href="AddCounsellorData">Add Counsellor</a>
          <a class="dropdown-item stl" href="ViewCounsellor" target="_blank">View Class Counsellor</a>   
        </div>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          View Feedback
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item"   href="FeedbackByName.jsp">View Feedback</a>
         
          
        </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="Logout" method="post">
       <input type="submit" value="Logout" name="logout">
    </form>
  </div>
</nav>
    <script src="js/jquery-3.3.1.min.js"></script>
     <script src="js/JQuery.js"></script>
    <script src="js/bootstrap.min.js"></script>