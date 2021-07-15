package com.lgy.xiaoyou_index.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.lgy.tools.entity.TbMonStu;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ExcelMapper extends BaseMapper<TbMonStu> {
    @Select("select money_time,mon_name,tb_mon_stu.user_id,name,money_count from tb_mon_stu,tb_stu,tb_don_money where tb_mon_stu.user_id=tb_stu.user_id and tb_don_money.mon_id=tb_mon_stu.mon_id")
    List<TbMonStu> billList();
}