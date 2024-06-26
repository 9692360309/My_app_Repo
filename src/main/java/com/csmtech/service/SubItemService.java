package com.csmtech.service;

import java.util.List;

import com.csmtech.model.SubItem;

public interface SubItemService {

	//List<SubItem> getAllSubItems(Integer itemId);

	SubItem saveSubItem(SubItem sb);

	List<SubItem> getAllSubItemsByQuestionTypeId(Integer questionTypeId, Integer itemId);

	String findSubItemNameById(Integer subItemId);

	List<SubItem> findAll();

	Integer getSubIdByName(String subItem);


}
