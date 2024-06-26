package kca.cbt.view.login;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import kca.cbt.login.MemberVO;

public class ExcelView extends AbstractXlsView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setHeader("Content-Disposition", "attachment; filename=\"memberList.xls\"");

        @SuppressWarnings("unchecked")
        List<MemberVO> memberList = (List<MemberVO>) model.get("memberList");
        
        @SuppressWarnings("unchecked")
        Map<String, Map<String, String>> subjectData = (Map<String, Map<String, String>>) model.get("subjectData");

        Sheet sheet = workbook.createSheet("Member List");

        int rowNum = 0;

        // Header
        Row headerRow = sheet.createRow(rowNum++);
        headerRow.createCell(0).setCellValue("급수");
        headerRow.createCell(1).setCellValue("교시");
        headerRow.createCell(2).setCellValue("과목명");
        headerRow.createCell(3).setCellValue("과목삭제");
        headerRow.createCell(4).setCellValue("과목코드");
        headerRow.createCell(5).setCellValue("ID");
        headerRow.createCell(6).setCellValue("PW");
        headerRow.createCell(7).setCellValue("A + B / A");
        headerRow.createCell(8).setCellValue("이름");

        // Center align cell style
        CellStyle centerAlignStyle = workbook.createCellStyle();
        centerAlignStyle.setAlignment(HorizontalAlignment.CENTER);
        centerAlignStyle.setVerticalAlignment(VerticalAlignment.CENTER);

        // Data
        String currentGrade = "";
        int gradeStartRow = 1;
        int sessionStartRow = 1;
        String currentSession = "1교시";
        for (int i = 0; i < memberList.size(); i++) {
            MemberVO member = memberList.get(i);
            Map<String, String> subjects = subjectData.get(member.getMember_id());
            Set<String> subjectCodes = subjects.keySet();
            
            String grade = (i < 12) ? "1급" : "2급";  // 13행 이전은 1급, 이후는 2급
            String session = ((i >= 0 && i <= 5) || (i >= 12 && i <= 17)) ? "1교시" : "2교시";
            
            if (!grade.equals(currentGrade)) {
                if (!currentGrade.isEmpty() && gradeStartRow < rowNum - 1) {
                    // 급수 병합 처리
                    sheet.addMergedRegion(new CellRangeAddress(gradeStartRow, rowNum - 1, 0, 0));
                    // 급수 병합된 셀에 스타일 적용
                    for (int r = gradeStartRow; r <= rowNum - 1; r++) {
                        Row row = sheet.getRow(r);
                        Cell cell = row.getCell(0);
                        if (cell != null) {
                            cell.setCellStyle(centerAlignStyle);
                        }
                    }
                }
                currentGrade = grade;
                gradeStartRow = rowNum;
            }

            if (!session.equals(currentSession)) {
                if (!currentSession.isEmpty() && sessionStartRow < rowNum - 1) {
                    // 교시 병합 처리
                    sheet.addMergedRegion(new CellRangeAddress(sessionStartRow, rowNum - 1, 1, 1));
                    // 교시 병합된 셀에 스타일 적용
                    for (int r = sessionStartRow; r <= rowNum - 1; r++) {
                        Row row = sheet.getRow(r);
                        Cell cell = row.getCell(1);
                        if (cell != null) {
                            cell.setCellStyle(centerAlignStyle);
                        }
                    }
                }
                currentSession = session;
                sessionStartRow = rowNum;
            }

            for (String subjectCode : subjectCodes) {
                Row row = sheet.createRow(rowNum++);
                Cell gradeCell = row.createCell(0);
                gradeCell.setCellValue(grade);
                gradeCell.setCellStyle(centerAlignStyle);
                Cell sessionCell = row.createCell(1);
                sessionCell.setCellValue(session);
                sessionCell.setCellStyle(centerAlignStyle);
                row.createCell(2).setCellValue(subjects.get(subjectCode));
                row.createCell(3).setCellValue("[삭제]");
                row.createCell(4).setCellValue(subjectCode);
                row.createCell(5).setCellValue(member.getMember_id());
                row.createCell(6).setCellValue(member.getPw());
                row.createCell(7).setCellValue(member.getMember_type());
                row.createCell(8).setCellValue(member.getMember_name());
            }
        }
        // 마지막 급수 병합 처리
        if (!currentGrade.isEmpty() && gradeStartRow < rowNum - 1) {
            sheet.addMergedRegion(new CellRangeAddress(gradeStartRow, rowNum - 1, 0, 0));
            // 병합된 셀에 스타일 적용
            for (int r = gradeStartRow; r <= rowNum - 1; r++) {
                Row row = sheet.getRow(r);
                Cell cell = row.getCell(0);
                if (cell != null) {
                    cell.setCellStyle(centerAlignStyle);
                }
            }
        }
        // 마지막 교시 병합 처리
        if (!currentSession.isEmpty() && sessionStartRow < rowNum - 1) {
            sheet.addMergedRegion(new CellRangeAddress(sessionStartRow, rowNum - 1, 1, 1));
            // 병합된 셀에 스타일 적용
            for (int r = sessionStartRow; r <= rowNum - 1; r++) {
                Row row = sheet.getRow(r);
                Cell cell = row.getCell(1);
                if (cell != null) {
                    cell.setCellStyle(centerAlignStyle);
                }
            }
        }

        // Auto size columns for subject name column
        sheet.autoSizeColumn(2);
    }
}
