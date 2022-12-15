$(document).ready(function () {
    $('#bio-data-form').submit(function (e) {
        e.preventDefault();
        bioData();
    });

});


function techfy(data) {
    $('#modal-feedback-body p').html(data);
    $('#modal-feedback').modal('show');
}

function bioData() {
    var fname = $('#bio-data-form .form-group:eq(0) .input-group input');
    var sname = $('#bio-data-form .form-group:eq(1) .input-group input');
    var lname = $('#bio-data-form .form-group:eq(2) .input-group input');
    var gender = $('#bio-data-form .form-group:eq(3) .input-group select');
    var nationality = $('#bio-data-form .form-group:eq(4) .input-group select');
    var county = $('#bio-data-form .form-group:eq(5) .input-group input');
    var dob = $('#bio-data-form .form-group:eq(6) .input-group input');
    var id = $('#bio-data-form .form-group:eq(7) .input-group input');
    var phone = $('#bio-data-form .form-group:eq(8) .input-group input');
    var email = $('#bio-data-form .form-group:eq(9) .input-group input');

    var i = $('#bio-data-form .form-group:eq(10) button i');

    var fnames = namesValid(fname, 'first');
    var snames = namesValid(sname, 'second');
    var lnames = namesValid(lname, 'last');
    var genders = genderValid(gender);
    var nations = countryValid(nationality);
    var ids = idValid(id);
    var phones = phoneValid(phone);
    var countys = namesValid(county, 'County\'s');
    var emails = emailValid(email);
    var dobs = dateValid(dob);
    if (fnames && snames && lnames && genders && nations && ids && phones && countys && emails && dobs) {
        var array = new Array();
        array[0] = $(fname).val();
        array[1] = $(sname).val();
        array[2] = $(lname).val();
        array[3] = $(gender).val();
        array[4] = $(nationality).val();
        array[5] = $(county).val();
        array[6] = $(dob).val();
        array[7] = $(id).val();
        array[8] = $(phone).val();
        array[9] = $(email).val();
        var json = JSON.stringify(array);
        i.removeClass('fa-arrow-right').addClass('spinner-border spinner-border-sm');
        $.post(
                'core/techfy.php',
                {
                    techfy: 'bio-data',
                    data: json
                },
                function (data, status) {
                    if (data === 'stored') {
                        techfy("Thank you for providing your bio-data.<br>Please provide your academic details!");
                        loadAcademic();
                    }
                }
        );


    } else {
        techfy('We detected some errors. Please correct then then try again');
//        $('html, body').animate({scrollTop:0},900);
    }
}


function academicData() {
    var primaryname = $('#academic-data-form .form-group:eq(0) .input-group input');
    var primarygrade = $('#academic-data-form .form-group:eq(1) .input-group select');
    var highname = $('#academic-data-form .form-group:eq(2) .input-group input');
    var highgrade = $('#academic-data-form .form-group:eq(3) .input-group select');
    var campusname = $('#academic-data-form .form-group:eq(4) .input-group select');
    var regno = $('#academic-data-form .form-group:eq(5) .input-group input');
    var i = $('#academic-data-form .form-group:eq(6) button:eq(1) i');
    var primarynames = schoolValid(primaryname, 'primary');
    var primarygrades = gradeValid(primarygrade, 'primary');
    var highnames = schoolValid(highname, 'high');
    var highgrades = gradeValid(highgrade, 'high');
    var campusnames = campusValid(campusname);
    var regnos = regnoValid(regno);
    if (primarynames && primarygrades && highnames && highgrades && campusnames && regnos) {
        var array = new Array();
        array[0] = $(primaryname).val();
        array[1] = $(primarygrade).val();
        array[2] = $(highname).val();
        array[3] = $(highgrade).val();
        array[4] = $(campusname).val();
        array[5] = $(regno).val();

        var json = JSON.stringify(array);
        i.removeClass('fa-arrow-right').addClass('spinner-border spinner-border-sm');
        $.post('core/techfy.php',
                {
                    techfy: 'academicData',
                    data: json
                },
                function (data, status) {
                    techfy("Thank you for providing your academic info.<br>Please provide your Sports info!");
                    loadSportData();
                }
        );
    } else {
        techfy('We detected some errors. Please correct then then try again');
//        $('html, body').animate({scrollTop:0},900);
    }
}

function sportData() {
    var mainSport = $('#sports-data-form .form-group:eq(0) .input-group select');
    var durations = $('#sports-data-form .form-group:eq(1) .input-group select');
    var otherSports = $('#sports-data-form .form-group:eq(2) .input-group textarea');

    var mainsposts = sportValid(mainSport);
    var durationss = sportDurationValid(durations);
    otherSports.addClass('is-valid');
    var sports = '';
    if (otherSports.val().length === 0) {
        sports = 'No other Sports';
    } else {
        sports = $(otherSports).val();
    }

    if (mainsposts && durationss) {
        var array = new Array();
        array[0] = $(mainSport).val();
        array[1] = $(durations).val();
        array[2] = sports;
        var json = JSON.stringify(array);
        $('#sports-daata-form .form-group:eq(1) button:eq(1) i')
                .removeClass('fa fa-send')
                .addClass('spinner-border spinner-border-sm');

        $.post('core/techfy.php', {
            techfy: 'sportData',
            data: json
        }, function (data, status) {

            if (data === 'success') {
                techfy("Thank you for registering with <b>K-U-S-A</b>.\n\
                    <br> You can now login to your new portal.\n\
                    <br>Your <b>username</b> is your <b>email</b>.<br> your <b>password</b> is your <b>id number</b>.\n\
                    <br>Proceed to attach your documents!");
                loadDocumentData();
            } else {
                techfy(data);
            }

        });
    }
}



function loadPersonalPhoto(btn) {
    var i = $(btn).children('i');
    var personalphoto = document.getElementById('personal_photo');
    var personalphotostatus = imageValid(personalphoto, 'personal photo');
    if (personalphotostatus) {
        $(i).removeClass('fa-upload').addClass('spinner-border spinner-border-sm');
        $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
        var image = personalphoto.files[0];
        var ext = name.substring(name.indexOf('.') + 1);
        var form_data = new FormData();
        form_data.append("file", image);
        $.ajax({
            url: "uploadDocuments.php",
            method: "POST",
            data: form_data,
            contentType: false,
            cache: false,
            processData: false,
            beforeSend: function () {
                $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            },
            success: function (data)
            {
                var json = JSON.stringify(['personalPhoto', data]);
                $.post('core/techfy.php',
                        {
                            techfy: 'uploadDocument',
                            data: json
                        },
                        function (data, status) {
                            $(btn).html('Uploaded <i class="fa fa-check"></i>')
                                    .attr('disabled', 'disabled')
                                    .removeClass('btn-outline-secondary')
                                    .addClass('.btn-secondary');
                            personalphoto.disabled = 'disabled';
                        });
            }
        });
    }
}

function loadBirthCert(btn) {
    var i = $(btn).children('i');
    var birth_certificate = document.getElementById('birth_certificate');
    var birth_status = imageValid(birth_certificate, 'birth certificate');
    if (birth_status) {
        $(i).removeClass('fa-upload').addClass('spinner-border spinner-border-sm');
        $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
        var image = birth_certificate.files[0];
        var form_data = new FormData();
        form_data.append("file", image);
        $.ajax({
            url: "uploadDocuments.php",
            method: "POST",
            data: form_data,
            contentType: false,
            cache: false,
            processData: false,
            beforeSend: function () {
                $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            },
            success: function (data)
            {
                var json = JSON.stringify(['birthCertificate', data]);
                $.post('core/techfy.php',
                        {
                            techfy: 'uploadDocument',
                            data: json
                        },
                        function (data, status) {
                            $(btn).html('Uploaded <i class="fa fa-check"></i>')
                                    .attr('disabled', 'disabled')
                                    .removeClass('btn-outline-secondary')
                                    .addClass('.btn-secondary');
                            birth_certificate.disabled = 'disabled';
                        });
            }
        });
    }
}
function loadIdfront(btn) {
    var i = $(btn).children('i');
    var nid_front = document.getElementById('nid_front');
    var nid_fronts = imageValid(nid_front, 'national id(front)');
    if (nid_fronts) {
        $(i).removeClass('fa-upload').addClass('spinner-border spinner-border-sm');
        $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
        var image = nid_front.files[0];
        var form_data = new FormData();
        form_data.append("file", image);
        $.ajax({
            url: "uploadDocuments.php",
            method: "POST",
            data: form_data,
            contentType: false,
            cache: false,
            processData: false,
            beforeSend: function () {
                $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            },
            success: function (data)
            {

                var json = JSON.stringify(['idFront', data]);
                $.post('core/techfy.php',
                        {
                            techfy: 'uploadDocument',
                            data: json
                        },
                        function (data, status) {
                            $(btn).html('Uploaded <i class="fa fa-check"></i>')
                                    .attr('disabled', 'disabled')
                                    .removeClass('btn-outline-secondary')
                                    .addClass('.btn-secondary');
                            nid_front.disabled = 'disabled';
                        });

            }
        });
    }

}
function loadIdback(btn) {
    var i = $(btn).children('i');
    var nid_back = document.getElementById('nid_back');
    var nid_backs = imageValid(nid_back, 'national id(back)');
    if (nid_backs) {
        $(i).removeClass('fa-upload').addClass('spinner-border spinner-border-sm');
        $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
        var image = nid_back.files[0];
        var form_data = new FormData();
        form_data.append("file", image);
        $.ajax({
            url: "uploadDocuments.php",
            method: "POST",
            data: form_data,
            contentType: false,
            cache: false,
            processData: false,
            beforeSend: function () {
                $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            },
            success: function (data)
            {
                var json = JSON.stringify(['idBack', data]);
                $.post('core/techfy.php',
                        {
                            techfy: 'uploadDocument',
                            data: json
                        },
                        function (data, status) {
                            $(btn).html('Uploaded <i class="fa fa-check"></i>')
                                    .attr('disabled', 'disabled')
                                    .removeClass('btn-outline-secondary')
                                    .addClass('.btn-secondary');
                            nid_back.disabled = 'disabled';
                        });
            }
        });
    }


}
function loadStudentid(btn) {
    var i = $(btn).children('i');
    var sid = document.getElementById('sid');
    var sids = imageValid(sid, 'student id');
    if (sids) {
        $(i).removeClass('fa-upload').addClass('spinner-border spinner-border-sm');
        $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
        var image = sid.files[0];
        var form_data = new FormData();
        form_data.append("file", image);
        $.ajax({
            url: "uploadDocuments.php",
            method: "POST",
            data: form_data,
            contentType: false,
            cache: false,
            processData: false,
            beforeSend: function () {
                $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            },
            success: function (data)
            {
                var json = JSON.stringify(['studentId', data]);
                $.post('core/techfy.php',
                        {
                            techfy: 'uploadDocument',
                            data: json
                        },
                        function (data, status) {
                            $(btn).html('Uploaded <i class="fa fa-check"></i>')
                                    .attr('disabled', 'disabled')
                                    .removeClass('btn-outline-secondary')
                                    .addClass('.btn-secondary');
                            sid.disabled = 'disabled';
                        });
            }
        });
    }

}
function loadHighCert(btn) {
    var i = $(btn).children('i');
    var hcs = document.getElementById('hcert');
    var hcss = imageValid(hcs, 'High School Certificate');
    if (hcss) {
        $(i).removeClass('fa-upload').addClass('spinner-border spinner-border-sm');
        $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
        var image = hcs.files[0];
        var form_data = new FormData();
        form_data.append("file", image);
        $.ajax({
            url: "uploadDocuments.php",
            method: "POST",
            data: form_data,
            contentType: false,
            cache: false,
            processData: false,
            beforeSend: function () {
                $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            },
            success: function (data)
            {
                var json = JSON.stringify(['highCert', data]);
                $.post('core/techfy.php',
                        {
                            techfy: 'uploadDocument',
                            data: json
                        },
                        function (data, status) {
                            if (data === 'success') {
                                $(btn).html('Uploaded <i class="fa fa-check"></i>')
                                        .attr('disabled', 'disabled')
                                        .removeClass('btn-outline-secondary')
                                        .addClass('.btn-secondary');
                                personalphoto.disabled = 'disabled';
                            } else {

                            }

                        });
            }
        });
    }
}