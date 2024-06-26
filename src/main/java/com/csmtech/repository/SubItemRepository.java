package com.csmtech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.csmtech.model.SubItem;

@Repository
public interface SubItemRepository extends JpaRepository<SubItem, Integer> {

	@Query("FROM SubItem WHERE item.itemId=:itemId")
	List<SubItem> findSubItemByItemId(Integer itemId);

	// from SubItem si where si.questionType.questionTypeId=:questionTypeId and
	// si.item.itemId=:itemId
	// FROM SubItem WHERE questionType.questionTypeId=:questionTypeId and
	// item.itemId=:itemId
	@Query("FROM SubItem WHERE questionType.questionTypeId=?1 and item.itemId=?2")
	List<SubItem> getAllSubItemsByQuestionTypeId(Integer questionTypeId, Integer itemId);

	@Query("Select subItemName FROM SubItem WHERE subItemId=:subItemId")
	String findSubItemNameById(Integer subItemId);

	@Query("Select subItemId FROM SubItem WHERE subItemName=:subItem")
	Integer getSubIdByName(String subItem);

}
