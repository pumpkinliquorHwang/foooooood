package com.kh.food.owner.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.admin.notice.attachment.vo.NoticeAttachment;
import com.kh.food.owner.notice.attachment.vo.OwnerNoticeAttachment;

public interface OwnerNoticeDao {
	
	List<Map<String,String>>ownerNoticeList(int cPage,int numPerPage);
	int ownNotCount();
	Map<String,String>selectOwnerNotice(int ownerNoticeNum);
	List<Map<String,String>>selectOwnerAttach(int ownerNoticeNum);
	int deleteOwnerNotice(int ownerNoticeNum);
	int insertOwnerNotice(Map<String,String> notice); 
	int insertOwnerNoticeAttach(OwnerNoticeAttachment a);
	
	int ownerNoticeUpdateEnd(Map<String,Object> map);
	int ownerNoticeAUpdateEnd(OwnerNoticeAttachment a);
	 
	
	List<Map<String,String>>ownerNoticeList();
	List<Map<String,String>>ownerNoticeListOwnerView(int cPage,int numPerPage);
	int memberCount();
	int ownerCount();
	int todayPayCount();
	void modifyFore(int ownerNoticeNum);
	List<OwnerNoticeAttachment> selectAttachModify(int ownerNoticeNum);
}
