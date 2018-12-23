package com.kenny.service.logistics.json.response;


import io.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * Created by WKL on 2017-3-3.
 */
public class PageResponse<T> {
    @ApiModelProperty("总数")
    private Integer total;
    @ApiModelProperty("从第几个开始")
    private Integer offset;
    @ApiModelProperty("每页数量")
    private Integer pageSize;
    @ApiModelProperty("内容列表")
    private List<T> item;

    public PageResponse(){}

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getItem() {
        return item;
    }

    public void setItem(List<T> item) {
        this.item = item;
    }
}
