package util;

import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

public class PoiWriteXls {
		/**
		 * 通过POI将对象集合，数据库表导出到本地
		 * @author StruggleYang
		 * @param objList 用户传入的对象集合
		 * @throws Exception 
		 */
        public static void xlsReport(List objList) throws Exception {
        		
        	// 截取指定包名.号后的类名作为文件名
	            int replace = objList.get(0).getClass().getName().indexOf(".")+1;
	            String fileName = objList.get(0).getClass().getName().substring(replace);
        	
            // 创建Excel的工作书册 Workbook,对应到一个excel文档
            HSSFWorkbook wb = new HSSFWorkbook();

            // 创建Excel的工作sheet,对应到一个excel文档的tab
            HSSFSheet sheet = wb.createSheet(fileName);
  
            // 创建单元格样式
            HSSFCellStyle style = wb.createCellStyle();
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            style.setFillForegroundColor(HSSFColor.LIGHT_TURQUOISE.index);
            style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

            // 设置边框
            style.setBottomBorderColor(HSSFColor.BLACK.index);
            style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            style.setBorderRight(HSSFCellStyle.BORDER_THIN);
            style.setBorderTop(HSSFCellStyle.BORDER_THIN);
            
            // 通过遍历数组来获得行和列
            List list = objList;
            //  首先建立行对象和单元格对象
            HSSFRow row = null;
            HSSFCell cell = null;
            //  循环初始值，全局以便调用
            int i = 0;
            // 反射获取实体类的所有属性，返回Field数组  
            Field[] field = list.get(i).getClass().getDeclaredFields(); 
            // 第一行放列名
            row = sheet.createRow(i);
            row.setHeight((short) 500);// 设定行的高度
            for( int r1 = 0;r1 < field.length;r1++){
            	// 设置excel每列宽度
                sheet.setColumnWidth(r1, 4000);
            	// 遍历到一个属性则创建一个Excel的单元格
                cell = row.createCell(r1);
                // 给Excel的单元格设置样式和赋值
                cell.setCellStyle(style);
            	// 将当前遍历到的属性名称放到一行作为表头标题
            	cell.setCellValue(field[r1].getName());
            }
            
    		//  循环遍历对象数据,外循环控制行，内循环控制列
    		for ( ; i < list.size(); i++) {
    			// 一个对象为一行，创建Excel的sheet的一行
                row = sheet.createRow(i+1);
                row.setHeight((short) 500);// 设定行的高度
                // 通过属性数组获得属性长度
                for( int j = 0;j < field.length;j++){
                	// 设置excel每列宽度
                    sheet.setColumnWidth(j, 4000);
                	// 遍历到一个属性则创建一个Excel的单元格
                    cell = row.createCell(j);
                    // 给Excel的单元格设置样式和赋值
                    cell.setCellStyle(style);
                	// 获取属性名称
                	String name = field[j].getName();
                	// 将属性的首字符大写，方便构造get，set方法  
                    name = name.substring(0, 1).toUpperCase() + name.substring(1);
                    // 通过Method获取到对象属性所所对应的get方法,
                    Method m = list.get(i).getClass().getMethod("get" + name);
                    // 通过invoke调用getter方法获取属性值 ,防止数据转换异常家空字符串，-1是因为列名占了一行
                    String value = (String) m.invoke(list.get(i)).toString();
                	//不是第一行则将属性值插入单元格
                	cell.setCellValue(value);
                }
			}
    		// 设置excel每列宽度
            sheet.setColumnWidth(0, 4000);
            // 循环结束末尾添加一行，添加一个文件写入时间
    		row = sheet.createRow(i+2);
    		row.setHeight((short) 500);// 设定行的高度
    		// 设置单元格内容格式，将单元格的时间格式设置为
    		HSSFCellStyle style1 = wb.createCellStyle();
    		style1.setDataFormat(HSSFDataFormat.getBuiltinFormat("yyyy-m-d h:mm:ss"));
            style1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 
            style1.setFillForegroundColor(HSSFColor.WHITE.index);

            // 设置边框
            style1.setBottomBorderColor(HSSFColor.RED.index);
    		// 建立单元格
    		cell = row.createCell(0);
            // 给Excel的单元格设置样式和赋值
            cell.setCellStyle(style1);
            cell.setCellValue("写入时间："+new Date());
            
            // 将文件通过输出流写入本地
            FileOutputStream os = new FileOutputStream("D:\\"+fileName+".xls");
            // 关闭各流
            wb.write(os);
            os.close();
    }

}
