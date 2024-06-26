package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.SubItem;
import com.csmtech.repository.SubItemRepository;

@Service
public class SubItemServiceImpl implements SubItemService {

	@Autowired
	private SubItemRepository subItemRepository;

	@Override
	public SubItem saveSubItem(SubItem sb) {
		return subItemRepository.save(sb);
	}

	@Override
	public List<SubItem> getAllSubItemsByQuestionTypeId(Integer questionTypeId, Integer itemId) {

		return subItemRepository.getAllSubItemsByQuestionTypeId(questionTypeId, itemId);
	}

	@Override
	public String findSubItemNameById(Integer subItemId) {

		return subItemRepository.findSubItemNameById(subItemId);
	}

	@Override
	public List<SubItem> findAll() {
		return subItemRepository.findAll();
	}

	@Override
	public Integer getSubIdByName(String subItem) {
		return subItemRepository.getSubIdByName(subItem);
	}

}
