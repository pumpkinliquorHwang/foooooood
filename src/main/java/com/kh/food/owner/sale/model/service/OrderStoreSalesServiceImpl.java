package com.kh.food.owner.sale.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.owner.order.model.vo.Pay;
import com.kh.food.owner.sale.model.dao.OrderStoreSalesDao;

@Service
public class OrderStoreSalesServiceImpl implements OrderStoreSalesService {

	@Autowired
	OrderStoreSalesDao dao;
	
	@Override
	public List<Map<String, String>> selectSalesDateList(int cPage,int numPerPage,Map<String, String> map) {
		return dao.selectSalesDateList(cPage,numPerPage,map);
	}

	@Override
	public int selectSaleDateCount(Map<String, String> map) {
		return dao.selectSaleDateCount(map);
	}

	@Override
	public String selectTodaySales(String businessCode) {
		return dao.selectTodaySales(businessCode);
	}

	@Override
	public String selectMonthSales(String businessCode) {
		return dao.selectMonthSales(businessCode);
	}

	@Override
	public String selectYearSales(String businessCode) {
		return dao.selectYearSales(businessCode);
	}

	@Override
	public List<Map<String,String>> selectCaMenuList(int menuCategorycode) {
		return dao.selectCaMenuList(menuCategorycode);
	}

	@Override
	public List<Map<String, String>> menuCateList(int cPage,int numPerPage,Map<String, String> map) {
		return dao.menuCateList(cPage,numPerPage,map);
	}

	@Override
	public int selectMenuCount(Map<String, String> map) {
		return dao.selectMenuCount(map);
	}

	@Override
	public List<Map<String, String>> selectSalePriceList(int cPage, int numPerPage, Map<String, String> map) {
		return dao.selectSalePriceList(cPage,numPerPage,map);
	}

	@Override
	public List<Pay> selectOrderOneList(int cPage, int numPerPage, int businessCode1) {
		return dao.selectOrderOneList(cPage,numPerPage,businessCode1);
	}

	@Override
	public int selectOrderCount(int businessCode1) {
		return dao.selectOrderCount(businessCode1);
	}

	@Override
	public String selectWeekSales(String businessCode) {
		return dao.selectWeekSales(businessCode);
	}

	
}
