package util;
import com.sun.rowset.CachedRowSetImpl;

import javax.sql.RowSet;
import java.sql.*;

/**
 * 数据库工具类
 * @author 李嘉昊
  * @version 2020年11月20日
 */
public class DbUtil {
		private static String url = "jdbc:mysql://localhost:3306/Secondary_Market";
		private static String username = "root";
		private static String password = "12345";
		private static String jdbcname = "com.mysql.cj.jdbc.Driver";
		/**
		 * 创建三个内部变量进行通用的增删查该改
		 */
        public static Connection conn = null;
        public static PreparedStatement pstmt = null;
        public static ResultSet rs = null;
        
		public static Connection getConnection() {
			try {
				Class.forName(jdbcname);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			try {
				conn = DriverManager.getConnection(url, username, password);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return conn;
		}
	

	public static void close(PreparedStatement pstmt, Connection conn,ResultSet rs) {
		  if (rs != null)
	       {
	        try {
					rs.close();
				} catch (SQLException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				} 
	       }
		if (pstmt != null) 
			{
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (conn != null) 
			{
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
         
	  }
	/**
	 * 通用的增删改
	 * @param sql  
	 * @param obj  存放sql语句中的问号数据 主键删除
	 * @return  判断是否成功
	 */
    public static boolean update(String sql,Object[] obj) 
    {  
    	int result = 0;
    	try {
			pstmt = createPrepare(sql, obj);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally {
			close(pstmt, conn, rs);
		}
    	/**
    	 * 判断是否操作成功
     	 */
        if (result != 0)
        {
           return true;
        }
        return false;
    }
    /**
     * 处理prepared的参数
     * @param sql
     * @param obj
     * @return
     * @throws SQLException
     */
    private static PreparedStatement createPrepare(String sql,Object[] obj) throws SQLException
    {  
    	/**
    	 * 获取连接并处理信息集合
    	 */
    	pstmt = getConnection().prepareStatement(sql);
    	//obj不为空执行该操作
    	if (obj != null)
	    {  
    		for (int i=0; i<obj.length; i++)
	    	{   
	    		pstmt.setObject(i+1,obj[i]);
	    	}
    	}
    	return pstmt;
    }
    /**
     * 通用的查信息
     * @param sql
     * @param obj
     * @return  离线集合
     */
    public static RowSet query(String sql, Object[] obj)
    {   
    	CachedRowSetImpl rowset = null;
    	try {
			pstmt = createPrepare(sql, obj);
			rs = pstmt.executeQuery();
			rowset = new CachedRowSetImpl();
			rowset.populate(rs);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
    	return rowset;
    }
    /**
     *  
     * @return 查询所需要的表某类情况的数据总量
     */
    public static int totalData(String sql, Object[] obj)
    {   
    	
    	// 以result作为返回结果
    	int result = 0;
    	
		try {
			pstmt = createPrepare(sql, obj);
	    	rs = pstmt.executeQuery();
			if (rs != null&&rs.next())
			{	
				result = rs.getInt(1);
			}
		  }catch (SQLException e) {
			e.printStackTrace();
		  }finally {
			  close(pstmt, conn, rs);
		  }
	    return result;	
    }
}


