package com.kg.library.book;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


public class test {

    public static void main(String[] args) {
        try {
            // 데이터베이스 연결 정보 설정
            String jdbcUrl = "jdbc:mysql://your_database_host:your_database_port/your_database_name";
            String username = "your_username";
            String password = "your_password";

            // JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 데이터베이스 연결
            try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
                // SQL 쿼리 실행
                String sqlQuery = "SELECT * FROM your_table_name";
                try (Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery(sqlQuery)) {

                    // JSON 배열 생성
                    JSONArray jsonArray = new JSONArray();

                    // 데이터베이스 결과셋에서 데이터를 읽어와 JSON 객체로 추가
                    while (resultSet.next()) {
                        // JSON 객체 생성
                        JSONObject jsonObject = new JSONObject();

                        // 컬럼 이름과 값을 읽어와 JSON 객체에 추가
                        int columnCount = resultSet.getMetaData().getColumnCount();
                        for (int i = 1; i <= columnCount; i++) {
                            String columnName = resultSet.getMetaData().getColumnName(i);
                            String columnValue = resultSet.getString(i);

                            jsonObject.put(columnName, columnValue);
                        }

                        // JSON 객체를 배열에 추가
                        jsonArray.put(jsonObject);
                    }

                    // JSON 파일로 저장
                    try (FileWriter fileWriter = new FileWriter("output.json")) {
                        fileWriter.write(jsonArray.toJSONString(2)); // 들여쓰기를 위해 toString(2) 사용
                        System.out.println("JSON 파일이 생성되었습니다.");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
