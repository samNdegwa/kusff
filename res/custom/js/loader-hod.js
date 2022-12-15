function loadAcademic() {
    $.get('../widget/coach/academics.php', function (data, status) {
        $('#form-area').html(data);
        $.post('../core/techfy.php',
                {
                    techfy: 'loadUniversities'
                },
                function (data, status) {
                    $('#academic-data-form .form-group:eq(3) .input-group select').html(data);
                }
        );
        $('#academic-data-form').submit(function (e) {
            e.preventDefault();
            academicData();
        });
    });
    $('.custom-box li:eq(0)').removeClass('custom-active').addClass('custom-visitable');
    $('.custom-box li:eq(1)').addClass('custom-active');
}

function loadSportData() {
    $.get('../widget/coach/sports.php', function (data, status) {
        $('#form-area').html(data);
        $('#sports-data-form').submit(function (e) {
            e.preventDefault();
            sportData();
        });
        var span = $('#sports-data-form .form-group:eq(0) .input-group .input-group-prepend .input-group-text i');
        var select = $('#sports-data-form .form-group:eq(0) .input-group select');
        $(span).removeClass('fa-soccer-ball-o').addClass('fa-pulse fa-refresh');
        $.post('../core/techfy.php', {
            techfy: 'loadSports'
        }, function (data, status) {
            var json = JSON.parse(data);
            var index = JSON.parse(json[0]);
            var names = JSON.parse(json[1]);
            var fb = "<option>--Select Main Sport --</option>";
            var opt = "";
            $(span).addClass('fa-pulse fa-refresh').removeClass('fa-soccer-ball-o');
            for (var a = 0; a < index.length; a++) {
                fb += "<option value=" + index[a] + ">" + names[a] + "</option>";
            }
            $(select).html(fb);
            $(span).removeClass('fa-pulse fa-refresh').addClass('fa-soccer-ball-o');
        });
    });
    $('.custom-box li:eq(1)').removeClass('custom-active').addClass('custom-visitable');
    $('.custom-box li:eq(2)').addClass('custom-active');
}

function loadDocumentData() {
    $.get("../widget/coach/documents-attachment.php", function (data, status) {
        $('#form-area').html(data);
        $('#document-data-form .form-group:eq(0) .input-group .input-group-append button').click(function () {
            loadPersonalPhotoHOD($(this));
        });
        $('#document-data-form .form-group:eq(1) .input-group .input-group-append button').click(function () {
            loadIdfrontHOD($(this));
        });
        $('#document-data-form .form-group:eq(2) .input-group .input-group-append button').click(function () {
            loadIdbackHOD($(this));
        });
        $('#document-data-form .form-group:eq(3) .input-group .input-group-append button').click(function () {
            loadJobIdHOD($(this));
        });
    });
    $('.custom-box li:eq(2)').removeClass('custom-active').addClass('custom-visitable');
    $('.custom-box li:eq(3)').addClass('custom-active');
}