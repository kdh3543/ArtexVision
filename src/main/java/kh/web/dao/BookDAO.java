package kh.web.dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookDAO {
	private static BookDAO instance = null;

	public static BookDAO getInstance(){
		if(instance == null) {
			instance = new BookDAO();
		}
		return instance;
	}

	private BookDAO() {}


	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
}
