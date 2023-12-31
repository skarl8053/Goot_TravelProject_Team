package com.travel.dao.admin;

import java.util.ArrayList;
import java.util.Map;

import com.travel.dto.admin.DTO_Report_admin;

public interface IDao_Report_admin {

	public Integer pageCalculate(String param1, String keyword);
	
	public ArrayList<DTO_Report_admin> selectReportData(String param1, String keyword, Integer rowstart, Integer rowend);

	public void updateBlock(int review_index, String toggle);

	public void updateBlock_user(int m_no, String is_block);

	public void updateBlockAll(Map<String, Object> mp);

	public void updateBlockAll_user(Map<String, Object> mp);

	public DTO_Report_admin selectDetailReportData(int report_no);

	

}
