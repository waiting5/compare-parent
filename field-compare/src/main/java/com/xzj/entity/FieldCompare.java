package com.xzj.entity;


import lombok.Data;

@Data
public class FieldCompare {

    private int compareId;

    private int tableId;

    private String tableField;

    private int interfaceId;

    private String interfaceField;

    private String fieldDesc;

    private String compareDetail;

    private String tableName;

    private String tableDesc;

    private String interfaceName;

    private String interfaceDesc;

}
