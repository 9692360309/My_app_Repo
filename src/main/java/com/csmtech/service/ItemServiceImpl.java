package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.Items;
import com.csmtech.model.QuestionType;
import com.csmtech.repository.ItemRepository;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemRepository itemRepository;

	@Override
	public Items saveItems(Items item) {
		return itemRepository.save(item);
	}

	@Override
	public List<Items> findAllItem() {

		return itemRepository.findAll();
	}

	@Override
	public Integer getItemIdByName(String itemName) {

		return null;
	}

	@Override
	public List<String> getItemList(Integer itemId) {

		return null;
	}

	@Override
	public Items findItemNameByItemId(Integer itemId) {
		return itemRepository.findItemNameByItemId(itemId);
	}

//	@Override
//	public List<QuestionType> getAllQuestionByItemId(Integer itemId) {
//		return itemRepository.getAllQuestionByItemId(itemId);
//	}
}
