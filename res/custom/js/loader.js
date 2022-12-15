function loadAcademic() {
    $.get('widget/registration/academics.php', function (data, status) {
        $('#form-area').html(data);
        $.post('core/techfy.php',
                {
                    techfy: 'loadUniversities'
                },
                function (data, status) {
                    $('#academic-data-form .form-group:eq(4) .input-group select').html(data);
                }
        );
        $('#academic-data-form').submit(function (e) {
            e.preventDefault();
            academicData();
        });

        $('#academic-data-form .form-group:eq(6) button:eq(0)').click(function () {
            var i = $(this).children('i');
            loadBioWithData(i, 'arrow');
        });
        $('.custom-box .custom-visitable:eq(0)').click(function () {
            var i = $(this).children('i');
            loadBioWithData(i, 'smile');
        });
    });
    $('.custom-box li:eq(0)').removeClass('custom-active').addClass('custom-visitable');
    $('.custom-box li:eq(1)').addClass('custom-active');
}

function loadSportData() {
    $.get('widget/registration/sports.php', function (data, status) {
        $('#form-area').html(data);
        $('#sports-data-form').submit(function (e) {
            e.preventDefault();
            sportData();
        });

        var span = $('#sports-data-form .form-group:eq(0) .input-group .input-group-prepend .input-group-text i');
        var select = $('#sports-data-form .form-group:eq(0) .input-group select');
        $(span).removeClass('fa-soccer-ball-o').addClass('spinner-border spinner-border-sm');
        $.post('core/techfy.php', {
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
            $(span).removeClass('spinner-border spinner-border-sm').addClass('fa-soccer-ball-o');
        });

        $('#sports-data-form .form-group:eq(6) button:eq(0)').click(function () {
//           .removeClass('fa fa-arrow-left').addClass('spinner-border spinner-border-sm');
            var i = $(this).children('i');
            loadAcademicWithData(i, 'arrow');
        });
    });
    $('.custom-box li:eq(1)').removeClass('custom-active').addClass('custom-visitable');
    $('.custom-box li:eq(2)').addClass('custom-active');
}

function loadDocumentData() {
    $.get("widget/registration/documents-attachment.php", function (data, status) {
        $('#form-area').html(data);
        $('#document-data-form .form-group:eq(0) .input-group .input-group-append button').click(function () {
            loadPersonalPhoto($(this));
        });
        $('#document-data-form .form-group:eq(1) .input-group .input-group-append button').click(function () {
            loadBirthCert($(this));
        });
        $('#document-data-form .form-group:eq(2) .input-group .input-group-append button').click(function () {
            loadIdfront($(this));
        });
        $('#document-data-form .form-group:eq(3) .input-group .input-group-append button').click(function () {
            loadIdback($(this));
        });
        $('#document-data-form .form-group:eq(4) .input-group .input-group-append button').click(function () {
            loadStudentid($(this));
        });
        $('#document-data-form .form-group:eq(5) .input-group .input-group-append button').click(function () {
            loadHighCert($(this));
        });
    });
    $('.custom-box li:eq(2)').removeClass('custom-active').addClass('custom-visitable');
    $('.custom-box li:eq(3)').addClass('custom-active');
}

function loadBioWithData(i, cls) {
    var ic;
    if (cls === 'arrow') {
        ic = 'fa fa-arrow-left';
    } else if (cls === 'smile') {
        ic = 'fa fa-smile-o';
    }
    $(i).removeClass(ic).addClass('spinner-border spinner-border-sm');
    $.get('widget/registration/bio-data.php', function (data, status) {
        $('#form-area').html(data);
        $('#bio-data-form .form-group:eq(10) button')
                .html('Wait <i class="spinner-border spinner-border-sm"></i>')
                .attr('disabled', 'disabled');
        $.post('core/techfy.php', {
            techfy: 'loadSavedBioData'
        }, function (data, status) {
            var json = JSON.parse(data);
            $('#bio-data-form .form-group:eq(0) .input-group input').val(json[0]);
            $('#bio-data-form .form-group:eq(1) .input-group input').val(json[1]);
            $('#bio-data-form .form-group:eq(2) .input-group input').val(json[2]);

            if (json[3] === 'Male') {
                $('#bio-data-form .form-group:eq(3) .input-group select')
                        .html('<option>Male</option><option>Female</option><option>--Select Your Gender --</option>');
            } else if (json[3] === 'Female') {
                $('#bio-data-form .form-group:eq(3) .input-group select')
                        .html('<option>Female</option><option>Male</option><option>--Select Your Gender --</option>');
            } else {
                $('#bio-data-form .form-group:eq(3) .input-group select')
                        .html('<option>--Select Your Gender --</option><option>Male</option><option>Female</option>');
            }
            $('#bio-data-form .form-group:eq(4) .input-group select').html('<option>' + json[4] + '</option><option>--Select Your Country --</option>');
            $('#bio-data-form .form-group:eq(5) .input-group input').val(json[5]);
            $('#bio-data-form .form-group:eq(6) .input-group input').val(json[6]);
            $('#bio-data-form .form-group:eq(7) .input-group input').val(json[7]);
            $('#bio-data-form .form-group:eq(8) .input-group input').val(json[8]);
            $('#bio-data-form .form-group:eq(9) .input-group input').val(json[9]);
            $('#bio-data-form').submit(function (e) {
                e.preventDefault();
                bioData();
            });
            $(i).removeClass('spinner-border spinner-border-sm').addClass(ic);
            $('#bio-data-form .form-group:eq(10) button').html('Continue <i class="fa fa-arrow-right"></i>').removeAttr('disabled');
        });
    });
}

function loadAcademicWithData(i, cls) {
    var ic;
    if (cls === 'arrow') {
        ic = 'fa fa-arrow-left';
    } else if (cls === 'smile') {
        ic = 'fa fa-smile-o';
    }
    $(i).removeClass(ic).addClass('spinner-border spinner-border-sm');
    $.get('widget/registration/academics.php', function (data, status) {
        $('#form-area').html(data);
        $('#academic-data-form .form-group:eq(6) button')
                .html('Wait <i class="spinner-border spinner-border-sm"></i>')
                .attr('disabled', 'disabled');
    });
}

function loadSportsWithData() {

}


/*
 * This function is responsible for swithhing the grades as per the selected in an array 
 * 
 * */

function scorePopulator(data) {
    var array = new Array();
    array[0] = 'A (plain)';
    array[1] = 'A- (minus)';
    array[2] = 'B+ (plus)';
    array[3] = 'B (plain)';
    array[4] = 'B- (minus)';
    array[5] = 'C+ (plus)';
    array[6] = 'C (plain)';
    array[7] = 'C- (minus)';
    array[8] = 'D+ (plus)';
    array[9] = 'D (plain)';
    array[10] = 'D- (minus)';
    array[11] = 'E (plain)';
    array[12] = '--Select your Score --';

    var fb = '<option>' + data + '</option>';

    for (var a = 0; a < array.length; a++) {
        if (array[a] === data) {
            //do nothing
        } else {
            fb += '<option>' + array[a] + '</option>';
        }
    }

    return fb;

}
/*
 * This function is responsible for swithhing the selected Institution as per the selected in an array 
 * 
 */
function institutionopulator(data1) {
    var span = $('#academic-data-form .form-group:eq(4) .input-group .input-group-prepend .input-group-text i');
    var select = $('#academic-data-form .form-group:eq(4) .input-group select');
    $(span).removeClass('fa fa-university').addClass('spinner-border spinner-border-sm');
    $.post('core/techfy.php', {
        techfy: 'loadUniversities'
    }, function (data, status) {
        $(span).addClass('spinner-border spinner-border-sm').removeClass('fa-university');
        $(select).html(data);
        $(select).val(data1);
        $(span).removeClass('spinner-border spinner-border-sm').addClass('fa-university');
    });
}