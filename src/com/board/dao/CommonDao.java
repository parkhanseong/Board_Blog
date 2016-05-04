package com.board.dao;

import com.board.db.sqlconfig.IBastisDBConnector;
import com.ibatis.sqlmap.client.SqlMapClient;

public class CommonDao {
	
	private static SqlMapClient myDB;
	
	public void SetDB(){
		myDB = IBastisDBConnector.getSqlMapInstance();
	}
	
	protected static SqlMapClient GetDB(){
		return myDB;
	}
}


