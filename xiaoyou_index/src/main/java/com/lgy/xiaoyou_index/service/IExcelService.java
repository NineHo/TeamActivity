package com.lgy.xiaoyou_index.service;
import com.lgy.tools.entity.TbMonStu;
import com.lgy.xiaoyou_index.mapper.ExcelMapper;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.util.List;

public interface IExcelService {
    HSSFWorkbook exportExcel();
}
