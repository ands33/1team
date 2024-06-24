package kca.cbt.view.criteria;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Iterator;

public class ExcelToDatabase {

    public static void main(String[] args) {
        String excelFilePath = "C:\\KCA문제은행 자동화 시스템 구축\\KCA문제은행 자동화 시스템 구축\\(참고자료)_kca문제은행\\(참고자료)_kca문제은행\\6. 출제영역_유사과목별 분류.xlsx";
        String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
        String username = "kd";
        String password = "1234";

        try (FileInputStream fis = new FileInputStream(excelFilePath);
             Workbook workbook = new XSSFWorkbook(fis);
             Connection connection = DriverManager.getConnection(jdbcURL, username, password)) {

            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rows = sheet.iterator();

            String sql = "INSERT INTO FAQ (column1, column2, column3) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);

            rows.next(); // Skip the header row

            while (rows.hasNext()) {
                Row row = rows.next();
                Iterator<Cell> cells = row.cellIterator();

                int index = 1;
                while (cells.hasNext()) {
                    Cell cell = cells.next();
                    switch (cell.getCellType()) {
                        case STRING:
                            statement.setString(index++, cell.getStringCellValue());
                            break;
                        case NUMERIC:
                            statement.setDouble(index++, cell.getNumericCellValue());
                            break;
                        default:
                            statement.setString(index++, cell.toString());
                            break;
                    }
                }

                statement.addBatch();
            }

            statement.executeBatch();

        } catch (IOException | SQLException e) {
            e.printStackTrace();
        }
    }
}
