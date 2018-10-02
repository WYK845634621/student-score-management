package com.yikai.crud.dao;

import com.yikai.crud.bean.Clas;
import com.yikai.crud.bean.ClasExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClasMapper {
    long countByExample(ClasExample example);

    int deleteByExample(ClasExample example);

    int deleteByPrimaryKey(String clas);

    int insert(Clas record);

    int insertSelective(Clas record);

    List<Clas> selectByExample(ClasExample example);

    int updateByExampleSelective(@Param("record") Clas record, @Param("example") ClasExample example);

    int updateByExample(@Param("record") Clas record, @Param("example") ClasExample example);
}