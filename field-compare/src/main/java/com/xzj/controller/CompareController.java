package com.xzj.controller;


import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzj.basic.base.dto.AjaxResult;
import com.xzj.entity.FieldCompare;
import com.xzj.entity.PageResponse;
import com.xzj.mapper.FieldCompareMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
public class CompareController {

    @Resource
    private FieldCompareMapper fieldCompareMapper;

    @GetMapping("queryList")
    public PageResponse queryList(@RequestParam("page") int page, @RequestParam("limit") int limit){
        PageHelper.startPage(page,limit);
        List<FieldCompare> fieldCompareList = fieldCompareMapper.queryList(new FieldCompare());
        PageInfo<FieldCompare> fieldComparePageInfo = new PageInfo<>(fieldCompareList);
        PageResponse pageResponse = PageResponse.successResult().putData(fieldComparePageInfo.getList());
        pageResponse.putCount(fieldComparePageInfo.getTotal());
        return pageResponse;
    }

    @PostMapping("save")
    public AjaxResult save(@RequestBody FieldCompare fieldCompare){
        AjaxResult ajaxResult = AjaxResult.successResult();
        int size;
        if(ObjectUtil.isEmpty(fieldCompare.getCompareId()) && fieldCompare.getCompareId() != 0){
            size = fieldCompareMapper.insert(fieldCompare);
        }else{
            size = fieldCompareMapper.update(fieldCompare);
        }
        return ajaxResult.putData(size);
    }

}
