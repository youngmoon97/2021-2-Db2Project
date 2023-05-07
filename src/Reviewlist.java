import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.Types;

public class Reviewlist {
	private Review[] Reviewlist;
	
	public Reviewlist() throws SQLException{
		Connection con = null;
		String url="jdbc:oracle:thin:@localhost:1521:XE";
		String id = "RS";
		String password="1234";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver OK.");
		}catch(ClassNotFoundException e){
			System.out.println("Driver Failed");
		}
		
		try {
			con = DriverManager.getConnection(url, id, password);
			System.out.println("Connection Ok.");
		}catch(SQLException e) {
			System.out.println("Connection Ok.");
		}
		
		String query = "select * from REVIEW order by viewnum asc";
		
		try {
			PreparedStatement pstmt = con.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, 
					ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = pstmt.executeQuery();
			
			rs.last();
			int rnum=rs.getRow();
			rs.beforeFirst();
			
			Reviewlist=new Review[rnum];
			int i=0;
			while (rs.next()) {
				String vnum=rs.getString(1);
				String star=rs.getString(2);
				String writer=rs.getString(3);
				String resname=rs.getString(4);
				String content=rs.getString(5);
				
				Reviewlist[i] =new Review(Integer.parseInt(vnum), star, writer, resname, content);
				i++;
			}
			pstmt.close();
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			con.close();
		}
	}
		
		public Review[] get_Reviewlist() {
			return this.Reviewlist;
		}
		public static void main(String[] args) throws SQLException{
			Reviewlist rl=new Reviewlist();
		}
}