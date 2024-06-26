package com.csmtech.exporter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.csmtech.model.Question;

public class SubjectiveQuestionExcelExporter {
private XSSFWorkbook workbook;
private XSSFSheet sheet;
//private List<Question> questions;

public SubjectiveQuestionExcelExporter() {
//this.questions = questions;
workbook = new XSSFWorkbook();
}

private void writeHeaderLine() {
sheet = workbook.createSheet("Users");

Row row = sheet.createRow(0);

CellStyle style = workbook.createCellStyle();
XSSFFont font = workbook.createFont();
font.setBold(true);
font.setFontHeight(16);
style.setFont(font);

//         createCell(row, 0, "User ID", style);      
// createCell(row, 0, "User ID", style);
createCell(row, 0, "Question Text", style);

createCell(row, 1, "Correct Answer", style);

}

private void createCell(Row row, int columnCount, Object value, CellStyle style) {
sheet.autoSizeColumn(columnCount);
Cell cell = row.createCell(columnCount);
if (value instanceof Integer) {
cell.setCellValue((Integer) value);
} else if (value instanceof Boolean) {
cell.setCellValue((Boolean) value);
} else {
cell.setCellValue((String) value);
}
cell.setCellStyle(style);
}

private void writeDataLines() {
int rowCount = 1;

CellStyle style = workbook.createCellStyle();
XSSFFont font = workbook.createFont();
font.setFontHeight(14);
style.setFont(font);

/*
* for (Question quest : questions) { Row row = sheet.createRow(rowCount++); int
* columnCount = 0;
* 
* // createCell(row, columnCount++, user.getId(), style); // createCell(row,
* columnCount++, cand.getCandid(), style); createCell(row, columnCount++,
* quest.getQuestionText(), style); createCell(row, columnCount++,
* quest.getOption1(), style); }
*/
}

public void export(HttpServletResponse response) throws IOException {
writeHeaderLine();
writeDataLines();

ServletOutputStream outputStream = response.getOutputStream();
workbook.write(outputStream);
workbook.close();

outputStream.close();

}

}