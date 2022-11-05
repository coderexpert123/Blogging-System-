<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row"> 
<% 
    Thread.sleep(400);
    PostDao d=new PostDao(ConnectionProvider.getConnection());
    int cid=Integer.parseInt(request.getParameter("cid"));
    List<Post>posts=null;
    
    if(cid==0){
    posts=d.getAllPost();
    }
    else{
    posts=d.getAllPostbyCatId(cid);
    }
    if(posts.size()==0){
    
    out.println("<h2>No Post in this Category</h2>");
    return;
    
    }
    
    for(Post p:posts){
%>

<div class="col-md-6">
    <div class="card mt-2 mb-3">
       <div class="card-body"> 
           <b><%= p.getpTittle() %></b>
           <p><%= p.getpContent() %></p>
           
       </div>
           
           <div class="card-footer">
       
               <a href="show_blog.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm">Read more...</a>
               <a href="" class="btn btn-outline-primary btn-sm">Like <span>10</span></a>
               <a href="" class="btn btn-outline-primary btn-sm">Comment<span> 2</span></a>

          
           </div>
    </div>
</div>

<% } %>

</div>