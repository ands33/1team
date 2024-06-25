<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Map, java.util.List, kca.cbt.login.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="./img/favicon-32x32.png">
<title>Insert title here</title>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}
th, td {
    border: 1px solid black;
    text-align: center;
    padding: 8px;
}
th {
    background-color: #f2f2f2;
}
</style>
</head>
<body>
    <%
        Map<Integer, String> subjectMap = (Map<Integer, String>) request.getAttribute("subjectMap");
        Map<Integer, Map<String, List<MemberVO>>> subjectMemberMap = (Map<Integer, Map<String, List<MemberVO>>>) request.getAttribute("subjectMemberMap");
    %>
    
    <table>
        <tr>
            <th rowspan="2">급수</th>
            <th rowspan="2">교시</th>
            <th rowspan="2">과목명</th>
            <th colspan="2">출제위원</th>
            <th rowspan="2">문항카드</th>
            <th rowspan="2">시험지</th>
            <th rowspan="2">출제계획 및 이원분류표</th>
            <th rowspan="2">선제이원분류표</th>
            <th rowspan="2">문항검토결과표</th>
        </tr>
        <tr>
            <th>출제위원A</th>
            <th>출제위원B</th>
        </tr>
        
        <!-- 첫 번째 과목 -->
        <tr>
            <td rowspan="6">1급</td>
            <td rowspan="3">1교시</td>
            <td><%= subjectMap.get(11) %></td>
            <td>
                <%
                    List<MemberVO> membersA_11 = subjectMemberMap.get(11).get("A");
                    if (membersA_11 != null) {
                        for (MemberVO member : membersA_11) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_11 = subjectMemberMap.get(11).get("B");
                    if (membersB_11 != null) {
                        for (MemberVO member : membersB_11) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>
        
        <!-- 두 번째 과목 -->
        <tr>
            <td><%= subjectMap.get(12) %></td>
            <td>
                <%
                    List<MemberVO> membersA_12 = subjectMemberMap.get(12).get("A");
                    if (membersA_12 != null) {
                        for (MemberVO member : membersA_12) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_12 = subjectMemberMap.get(12).get("B");
                    if (membersB_12 != null) {
                        for (MemberVO member : membersB_12) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>

        <!-- 세 번째 과목 -->
        <tr>
            <td><%= subjectMap.get(13) %></td>
            <td>
                <%
                    List<MemberVO> membersA_13 = subjectMemberMap.get(13).get("A");
                    if (membersA_13 != null) {
                        for (MemberVO member : membersA_13) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_13 = subjectMemberMap.get(13).get("B");
                    if (membersB_13 != null) {
                        for (MemberVO member : membersB_13) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>

        <!-- 네 번째 과목 -->
        <tr>
            <td rowspan="3">2교시</td>
            <td><%= subjectMap.get(14) %></td>
            <td>
                <%
                    List<MemberVO> membersA_14 = subjectMemberMap.get(14).get("A");
                    if (membersA_14 != null) {
                        for (MemberVO member : membersA_14) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_14 = subjectMemberMap.get(14).get("B");
                    if (membersB_14 != null) {
                        for (MemberVO member : membersB_14) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>
        
        <!-- 다섯 번째 과목 -->
        <tr>
            <td><%= subjectMap.get(15) %></td>
            <td>
                <%
                    List<MemberVO> membersA_15 = subjectMemberMap.get(15).get("A");
                    if (membersA_15 != null) {
                        for (MemberVO member : membersA_15) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_15 = subjectMemberMap.get(15).get("B");
                    if (membersB_15 != null) {
                        for (MemberVO member : membersB_15) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>
        
        <!-- 여섯 번째 과목 -->
        <tr>
            <td><%= subjectMap.get(16) %></td>
            <td>
                <%
                    List<MemberVO> membersA_16 = subjectMemberMap.get(16).get("A");
                    if (membersA_16 != null) {
                        for (MemberVO member : membersA_16) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_16 = subjectMemberMap.get(16).get("B");
                    if (membersB_16 != null) {
                        for (MemberVO member : membersB_16) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>

        <!-- 일곱 번째 과목 -->
        <tr>
            <td rowspan="7">2급</td>
            <td rowspan="3">1교시</td>
            <td><%= subjectMap.get(21) %></td>
            <td>
                <%
                    List<MemberVO> membersA_21 = subjectMemberMap.get(21).get("A");
                    if (membersA_21 != null) {
                        for (MemberVO member : membersA_21) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_21 = subjectMemberMap.get(21).get("B");
                    if (membersB_21 != null) {
                        for (MemberVO member : membersB_21) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>
        
        <!-- 여덟 번째 과목 -->
        <tr>
            <td><%= subjectMap.get(22) %></td>
            <td>
                <%
                    List<MemberVO> membersA_22 = subjectMemberMap.get(22).get("A");
                    if (membersA_22 != null) {
                        for (MemberVO member : membersA_22) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_22 = subjectMemberMap.get(22).get("B");
                    if (membersB_22 != null) {
                        for (MemberVO member : membersB_22) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>

        <!-- 아홉 번째 과목 -->
        <tr>
            <td><%= subjectMap.get(23) %></td>
            <td>
                <%
                    List<MemberVO> membersA_23 = subjectMemberMap.get(23).get("A");
                    if (membersA_23 != null) {
                        for (MemberVO member : membersA_23) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_23 = subjectMemberMap.get(23).get("B");
                    if (membersB_23 != null) {
                        for (MemberVO member : membersB_23) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>

        <!-- 열 번째 과목 -->
        <tr>
            <td rowspan="4">2교시</td>
            <td><%= subjectMap.get(24) %></td>
            <td>
                <%
                    List<MemberVO> membersA_24 = subjectMemberMap.get(24).get("A");
                    if (membersA_24 != null) {
                        for (MemberVO member : membersA_24) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_24 = subjectMemberMap.get(24).get("B");
                    if (membersB_24 != null) {
                        for (MemberVO member : membersB_24) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>
        
        <!-- 열한 번째 과목 -->
        <tr>
            <td><%= subjectMap.get(25) %></td>
            <td>
                <%
                    List<MemberVO> membersA_25 = subjectMemberMap.get(25).get("A");
                    if (membersA_25 != null) {
                        for (MemberVO member : membersA_25) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_25 = subjectMemberMap.get(25).get("B");
                    if (membersB_25 != null) {
                        for (MemberVO member : membersB_25) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>

        <!-- 열두 번째 과목 -->
        <tr>
            <td><%= subjectMap.get(26) %></td>
            <td>
                <%
                    List<MemberVO> membersA_26 = subjectMemberMap.get(26).get("A");
                    if (membersA_26 != null) {
                        for (MemberVO member : membersA_26) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_26 = subjectMemberMap.get(26).get("B");
                    if (membersB_26 != null) {
                        for (MemberVO member : membersB_26) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>
        
        <!-- 열세 번째 과목 -->
        <tr>
            <td><%= subjectMap.get(27) %></td>
            <td>
                <%
                    List<MemberVO> membersA_27 = subjectMemberMap.get(27).get("A");
                    if (membersA_27 != null) {
                        for (MemberVO member : membersA_27) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>
                <%
                    List<MemberVO> membersB_27 = subjectMemberMap.get(27).get("B");
                    if (membersB_27 != null) {
                        for (MemberVO member : membersB_27) {
                            out.print(member.getMember_name() + "<br/>");
                        }
                    }
                %>
            </td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
            <td>클릭</td>
        </tr>
    </table>

    <div>[기출문제 저장]</div>
</body>
</html>
