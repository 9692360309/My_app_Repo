package com.csmtech.service;

import java.util.List;

import com.csmtech.model.Items;
import com.csmtech.model.QuestionType;

public interface ItemService {

	Items saveItems(Items item);

	List<Items> findAllItem();

	Integer getItemIdByName(String itemName);

	List<String>getItemList(Integer itemId);

	Items findItemNameByItemId(Integer itemId);

//	List<QuestionType> getAllQuestionByItemId(Integer itemId);

}
