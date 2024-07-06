<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.posts"%>
<%@page import="com.tech.blog.helper.connectionProvider"%>
<%@page import="com.tech.blog.dao.postDao"%>

<div class="row">
    <div class="col-md-6">
    <%
        postDao pd = new postDao(connectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        ArrayList<posts> list = null;
        if(cid == 0)
        {
          list = pd.getAllPosts();
        }
        else{
        list = pd.getPostsByCatid(cid);
        }
        if(list.size()==0)
        {
            out.println("<h3 class=display-3 text-center> No Post in this category</h3>");
            return;
        }
        for (posts post : list) 
        {
    %>
        <div class="card mt-2">
            <img class="card-img-top" src="posts-pics/<%=post.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b> <%=post.getpTitle()%><b>
                <p> <%=post.getpContent()%><p>
<!--                <pre><%=post.getpCode()%><pre>-->
            </div>
            <div class="card-footer primary-background text-center">
                <a href="show_blog_page.jsp?post_id=<%=post.getpId()%>" class="btn btn-outline-light btn-sm"> Read More</a>
                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span> 10 </span></a>
                <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span> 20 </span></a>
            </div>
        </div>
    </div>
    <%
    }
    %>
    </div>