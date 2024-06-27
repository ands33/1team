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
    text-align: center !important;
    padding: 8px;
}
th {
    background-color: #f2f2f2;
}
button {
    width: 53px;
    height: 27px;
    font-size: 13px !important;
    margin: 1px;
}
</style>
</head>
<body>
<%@ include file="adminheader.jsp"%>
<br>
<br>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_11 != null && !membersA_11.isEmpty() ? membersA_11.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_11 != null && !membersB_11.isEmpty() ? membersB_11.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_11 != null && !membersA_11.isEmpty() ? membersA_11.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_11 != null && !membersA_11.isEmpty() ? membersA_11.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_11 != null && !membersB_11.isEmpty() ? membersB_11.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_12 != null && !membersA_12.isEmpty() ? membersA_12.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_12 != null && !membersB_12.isEmpty() ? membersB_12.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_12 != null && !membersA_12.isEmpty() ? membersA_12.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_12 != null && !membersA_12.isEmpty() ? membersA_12.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_12 != null && !membersB_12.isEmpty() ? membersB_12.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_13 != null && !membersA_13.isEmpty() ? membersA_13.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_13 != null && !membersB_13.isEmpty() ? membersB_13.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_13 != null && !membersA_13.isEmpty() ? membersA_13.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_13 != null && !membersA_13.isEmpty() ? membersA_13.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_13 != null && !membersB_13.isEmpty() ? membersB_13.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_14 != null && !membersA_14.isEmpty() ? membersA_14.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_14 != null && !membersB_14.isEmpty() ? membersB_14.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_14 != null && !membersA_14.isEmpty() ? membersA_14.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_14 != null && !membersA_14.isEmpty() ? membersA_14.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_14 != null && !membersB_14.isEmpty() ? membersB_14.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_15 != null && !membersA_15.isEmpty() ? membersA_15.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_15 != null && !membersB_15.isEmpty() ? membersB_15.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_15 != null && !membersA_15.isEmpty() ? membersA_15.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_15 != null && !membersA_15.isEmpty() ? membersA_15.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_15 != null && !membersB_15.isEmpty() ? membersB_15.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_16 != null && !membersA_16.isEmpty() ? membersA_16.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_16 != null && !membersB_16.isEmpty() ? membersB_16.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_16 != null && !membersA_16.isEmpty() ? membersA_16.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_16 != null && !membersA_16.isEmpty() ? membersA_16.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_16 != null && !membersB_16.isEmpty() ? membersB_16.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
        </tr>

        <!-- 일곱 번째 과목 -->
        <tr>
            <td rowspan="7">2급</td>
            <td rowspan="3">1교시</td>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_24 != null && !membersA_24.isEmpty() ? membersA_24.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_24 != null && !membersB_24.isEmpty() ? membersB_24.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_24 != null && !membersA_24.isEmpty() ? membersA_24.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_24 != null && !membersA_24.isEmpty() ? membersA_24.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_24 != null && !membersB_24.isEmpty() ? membersB_24.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
        </tr>
        
        <!-- 여덟 번째 과목 -->
        <tr>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_21 != null && !membersA_21.isEmpty() ? membersA_21.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_21 != null && !membersB_21.isEmpty() ? membersB_21.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_21 != null && !membersA_21.isEmpty() ? membersA_21.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_21 != null && !membersA_21.isEmpty() ? membersA_21.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_21 != null && !membersB_21.isEmpty() ? membersB_21.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_23 != null && !membersA_23.isEmpty() ? membersA_23.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_23 != null && !membersB_23.isEmpty() ? membersB_23.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_23 != null && !membersA_23.isEmpty() ? membersA_23.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_23 != null && !membersA_23.isEmpty() ? membersA_23.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_23 != null && !membersB_23.isEmpty() ? membersB_23.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
        </tr>

        <!-- 열 번째 과목 -->
        <tr>
            <td rowspan="4">2교시</td>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_22 != null && !membersA_22.isEmpty() ? membersA_22.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_22 != null && !membersB_22.isEmpty() ? membersB_22.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_22 != null && !membersA_22.isEmpty() ? membersA_22.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_22 != null && !membersA_22.isEmpty() ? membersA_22.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_22 != null && !membersB_22.isEmpty() ? membersB_22.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_25 != null && !membersA_25.isEmpty() ? membersA_25.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_25 != null && !membersB_25.isEmpty() ? membersB_25.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_25 != null && !membersA_25.isEmpty() ? membersA_25.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_25 != null && !membersA_25.isEmpty() ? membersA_25.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_25 != null && !membersB_25.isEmpty() ? membersB_25.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_26 != null && !membersA_26.isEmpty() ? membersA_26.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_26 != null && !membersB_26.isEmpty() ? membersB_26.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_26 != null && !membersA_26.isEmpty() ? membersA_26.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_26 != null && !membersA_26.isEmpty() ? membersA_26.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_26 != null && !membersB_26.isEmpty() ? membersB_26.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
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
            <td>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersA_27 != null && !membersA_27.isEmpty() ? membersA_27.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingExamPlanList.do?member_id=<%= membersB_27 != null && !membersB_27.isEmpty() ? membersB_27.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
            <td>
                <button onclick="location.href='getBinaryWaiting.do?member_id=<%= membersA_27 != null && !membersA_27.isEmpty() ? membersA_27.get(0).getMember_id() : "" %>'">선제</button>
            </td>
            <td>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersA_27 != null && !membersA_27.isEmpty() ? membersA_27.get(0).getMember_id() : "" %>'">A위원</button>
                <button onclick="location.href='getWaitingPreBinaryClass.do?member_id=<%= membersB_27 != null && !membersB_27.isEmpty() ? membersB_27.get(0).getMember_id() : "" %>'">B위원</button>
            </td>
        </tr>
    </table>

    <div>[기출문제 저장]</div>
</body>
</html>
