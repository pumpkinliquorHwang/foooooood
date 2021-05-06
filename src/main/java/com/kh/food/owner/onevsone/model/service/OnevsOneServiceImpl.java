package com.kh.food.owner.onevsone.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.owner.member.model.vo.Owner;
import com.kh.food.owner.onevsone.model.dao.OnevsOneDao;
import com.kh.food.owner.onevsone.model.vo.OwnerQnaAttachment;

@Service
public class OnevsOneServiceImpl implements OnevsOneService {
	
	@Autowired
	OnevsOneDao dao;

	@Override
	public List<Map<String, String>> oneVSoneList(int cPage, int numPerPage) {
		return dao.oneVSoneList(cPage, numPerPage);
	}
	
	@Override
	public int qnaCount() {
		return dao.qnaCount();
	}

	@Override
	public List<Map<String, String>> myQnaList(String ownerId, int cPage, int numPerPage) {
		return dao.myQnaList(ownerId, cPage, numPerPage);
	}

	@Override
	public int myQnaCount(int ownerNum) {
		return dao.myQnaCount(ownerNum);
	}

	@Override
	public Map<String, String> oneVSoneView(int qnaCode) {
		return dao.oneVSoneView(qnaCode);
	}

	@Override
	public List<Map<String, String>> qnaSearch(Map<String, String> map) {
		return dao.qnaSearch(map);
	}


	@Override
	public List<Map<String, String>> commentList(int qnaCode) {
		return dao.commentList(qnaCode);
	}


	@Override
	public int qnaFormEnd(Map<String, Object> qna, List<OwnerQnaAttachment> files){
		int result=0;
		try {
			result=dao.insertQna(qna);
			if(result==0) {
				throw new Exception();
			}
			for(OwnerQnaAttachment a : files) {
				a.setQnaCode(Integer.parseInt((String) qna.get("qnaCode")));
				result=dao.insertAttach(a);
				if(result==0) {
					throw new Exception("업로드 실패");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Map<String, String>> ownerAttach(int qnaCode) {
		return dao.ownerAttach(qnaCode);
	}

	@Override
	public int qnaDelete(int qnaCode) {
		return dao.qnaDelete(qnaCode);
	}

	@Override
	public Owner selectMyPage(int ownerNum) {
		return dao.selectMyPage(ownerNum);
	}

	@Override
	public int updateMyPage(Map<String, Object> owner) {
		return dao.updateMyPage(owner);
	}

	@Override
	public int selectQnaCount(int ownerNum) {
		return dao.selectQnaCount(ownerNum);
	}

	@Override
	public int businessReviewCount(int businessCode) {
		return dao.businessReviewCount(businessCode);
	}
	
	
}
