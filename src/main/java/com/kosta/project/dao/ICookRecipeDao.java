package com.kosta.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosta.project.dto.CookRecipeDto;

public interface ICookRecipeDao {

   // 요리톡 상품등록 INSERT
   public void Cook_write(CookRecipeDto dto);
   
   // 요리톡 상품삭제 delete
   public void Cook_delete(String k_no);
   
   // k_no에 해당하는 요리톡상품 선택
   // update할때도사용
   // 요리톡 상품삭제할때 실제 폴더에서 사진지우기 위해 사진파일명 뽑기
   public CookRecipeDto Cook_selectAll(String k_no);
   
   // 요리톡 수정 update
   public void Cook_update(CookRecipeDto dto);
   
   // 레시피 상품 리스트 SELECT ALL /
   public List<CookRecipeDto> Cook_listAll();

   // 레시피 카테고리1별 상품 리스트
   public List<CookRecipeDto> Cook_listCategory(String k_category);

   // 페이징처리 위해 해당 페이지에 출력될 내용 뽑기 _ CookRecipe전체
   public List<CookRecipeDto> Cook_onePageList(@Param("_startRow") int startRow, @Param("_endRow")int endRow);
      
   // 페이징처리 위해 해당 페이지에 출력될 내용 뽑기 _ CookRecipe카테고리별
   public List<CookRecipeDto> Cook_onePageListCategory(@Param("_k_category") String k_category, @Param("_startRow") int startRow, @Param("_endRow") int endRow);
   
   // 레시피 테마 테이블 전체 데이터 갯수
   public int Cook_countAll();
}