package com.lgy.xiaoyou_index.service.impl;

import com.lgy.tools.entity.TbMonStu;
import com.lgy.xiaoyou_index.mapper.ExcelMapper;
import com.lgy.xiaoyou_index.service.IExcelService;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;

@Service
public class ExcelServiceImpl implements IExcelService {
    @Resource
    private ExcelMapper excelMapper;

    @Override
    public HSSFWorkbook exportExcel() {
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook();
        HSSFSheet sheet = hssfWorkbook.createSheet("缴费清单");
        HSSFRow row = sheet.createRow(0);
        row.createCell(0).setCellValue(new HSSFRichTextString("序号"));
        row.createCell(1).setCellValue(new HSSFRichTextString("活动事务"));
        row.createCell(2).setCellValue(new HSSFRichTextString("姓名"));
        row.createCell(3).setCellValue(new HSSFRichTextString("费用"));
        row.createCell(4).setCellValue(new HSSFRichTextString("缴费时间"));
        List<TbMonStu>  tbMonStus = excelMapper.billList();
        Iterator<TbMonStu> iterator = tbMonStus.iterator();
        int num = 1;
        while (iterator.hasNext()) {
            TbMonStu tbMonStu = iterator.next();
            HSSFRow rowNum = sheet.createRow(num);
            rowNum.createCell(0).setCellValue(num);
            rowNum.createCell(1).setCellValue(new HSSFRichTextString(tbMonStu.getMonName()));
            rowNum.createCell(2).setCellValue(new HSSFRichTextString(tbMonStu.getName()));
            rowNum.createCell(3).setCellValue(new HSSFRichTextString(tbMonStu.getMoneyCount().toString()));
            rowNum.createCell(4).setCellValue(new HSSFRichTextString(tbMonStu.getMoneyTime().toString()));
            num++;
        }
        return hssfWorkbook;
    }
}
