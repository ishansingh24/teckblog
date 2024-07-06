import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class likeDao {
    public Connection con;

    public likeDao(Connection con) {
        this.con = con;
    }
   public boolean insertLike(int pid, int uid)
   {
       String query = "insert into liked(pid, uid) values(?,?)";
       boolean b = false;
       
       try{
           PreparedStatement pstmt = this.con.prepareStatement(query);
           pstmt.setInt(1, pid);
           pstmt.setInt(1, uid);
           pstmt.executeUpdate();
           b = true;
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return b;
   }
   
   public int countLikeOnPost(int pid)
   {
       int count = 0;
       String Query = "select count(*) from liked where pid = ?";
       
       try{
           PreparedStatement pstmt = this.con.prepareStatement(Query);
           pstmt.setInt(1, pid);
           
           ResultSet rs = pstmt.executeQuery();
           
           while(rs.next())
           {
               count = rs.getInt(1);
           }
           
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       
       
       return count;
   }
   
   
   public boolean isLikedByUser(int pid, int uid)
   {
       boolean f = false;
       String Query = "select from liked where pid = ? and uid = ?";
       try{
           PreparedStatement pstmt = this.con.prepareStatement(Query);
           pstmt.setInt(1, pid);
           pstmt.setInt(2, uid);
           
           
           ResultSet rs = pstmt.executeQuery();
           
           while(rs.next())
           {
              f = true;
           }
           
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return f;
   }
   
   public boolean deleteLike(int pid, int uid)
   {
       boolean f = false;
       String Query = "delete from liked where pid = ? and uid = ?";
       try{
           PreparedStatement pstmt = this.con.prepareStatement(Query);
           pstmt.setInt(1, pid);
           pstmt.setInt(2, uid);
           
           
           pstmt.executeUpdate();
           f = true;
           
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return f;
   }
}
