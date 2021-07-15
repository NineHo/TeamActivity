package com.lgy.xiaoyou_index.controller;
import com.lgy.xiaoyou_index.service.IExcelService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

@Controller
public class ExcelController {
    @Autowired
    private IExcelService exportExcel;
    // 将数据库导出成excel
    @RequestMapping(value="exportBillByExcel",method = RequestMethod.GET)
    public void exportBillByExcel(HttpServletResponse response) {
        HSSFWorkbook workbook = exportExcel.exportExcel();
        // 获取输出流
        OutputStream os = null;
        try {
            // 获取输出流
            os = response.getOutputStream();
            // 重置输出流
            response.reset();
            // 设定输出文件头
            response.setHeader("Content-disposition",
                    "attachment; filename=" + new String("缴费清单".getBytes("GB2312"), "8859_1") + ".xls");
            // 定义输出类型
            response.setContentType("application/msexcel");
            workbook.write(os);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 关闭资源
            try {
                assert os != null;
                os.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}