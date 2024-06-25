function fetchData() {
    // 여기서 서버로부터 데이터를 가져와서 테이블에 추가하는 로직을 구현할 수 있습니다.
    // AJAX를 사용하여 서버와 통신하여 데이터를 동적으로 가져오는 것이 일반적입니다.
}

function exportTableToExcel(tableID, filename = 'data') {
    var downloadLink;
    var dataType = 'application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');

    // Specify file name
    filename = filename ? filename + '.xls' : 'excel_data.xls';

    // Create download link element
    downloadLink = document.createElement("a");

    document.body.appendChild(downloadLink);

    if (navigator.msSaveOrOpenBlob) {
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob(blob, filename);
    } else {
        // Create a link to the file
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

        // Setting the file name
        downloadLink.download = filename;

        //triggering the function
        downloadLink.click();
    }
}
