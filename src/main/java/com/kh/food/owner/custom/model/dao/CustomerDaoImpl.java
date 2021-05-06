package com.kh.food.owner.custom.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.mark.model.vo.Mark;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectQnaList() {
		return session.selectList("oneVSone.oneVSoneList");
	}

	@Override
	public List<Map<String, String>> selectNoticeList() {
		return session.selectList("ownerMember.ownerNoticeList");
	}

	@Override
	public int storeFormEnd(Map<String, Object> store) {
		return session.insert("store.addStore", store);
	}

	@Override
	public int insertMark(Map<String, Object> maps) {
		return session.insert("store.insertMark", maps);
	}
	
	@Override
	public int updateMark(Map<String, Object> maps) {
		return session.update("store.updateMark", maps);
	}

	@Override
	public Mark selectMark(Map<String, Object> maps) {
		return session.selectOne("store.selectMark", maps);
	}

}
