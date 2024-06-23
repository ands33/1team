<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팝오버 댓글 기능</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <button type="button" class="btn btn-primary" id="commentButton" data-toggle="popover" title="댓글">
            댓글 달기
        </button>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            $('#commentButton').popover({
                html: true,
                content: function() {
                    return `
                        <div class="form-group">
                            <label for="commentText">댓글</label>
                            <textarea class="form-control" id="commentText" rows="3"></textarea>
                        </div>
                        <button type="button" class="btn btn-primary" onclick="submitComment()">댓글 작성</button>
                    `;
                }
            });
        });

        function submitComment() {
            let commentText = $('#commentText').val();
            alert('댓글 내용: ' + commentText);
            // 여기에 댓글을 저장하거나 처리하는 코드를 추가할 수 있습니다.
        }
    </script>
</body>
</html>
