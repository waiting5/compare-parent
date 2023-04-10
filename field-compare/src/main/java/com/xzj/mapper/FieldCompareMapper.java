package com.xzj.mapper;

import com.xzj.entity.FieldCompare;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FieldCompareMapper {

    List<FieldCompare> queryList(FieldCompare fieldCompare);

    int insert(FieldCompare fieldCompare);

    int update(FieldCompare fieldCompare);

}
