$(document).ready(function () {
    $('#bio-data-form').submit(function (e) {
        e.preventDefault();
        bioData();
    });

});




function techfy(data) {
    $('#modal-feedback-body p').html(data);
    $('#modal-feedback').modal('show').wait(4000).modal('toggle');
}
function error() {
    var data = "Something went wrong, please check internet connection then try again";
    $('#modal-feedback-body p').html(data);
    $('#modal-feedback').modal('show').wait(7000).modal('toggle');
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

    var i = $('#bio-data-form .form-group:eq(10) button span i:eq(1)');

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
                '../core/techfy.php',
                {
                    techfy: 'bio-data-hod',
                    data: json
                },
                function (data, status) {
                    if (data === 'stored') {
                        techfy("Proceed to fill your academic info!");
                        loadAcademic();
                    }
                }
        );


    } else {
        techfy('We detected some errors. Please correct them then try again');
    }
}


function academicData() {
    var primaryname = $('#academic-data-form .form-group:eq(0) .input-group input');
    var highname = $('#academic-data-form .form-group:eq(1) .input-group input');
    var campusname = $('#academic-data-form .form-group:eq(2) .input-group input');
    var institution = $('#academic-data-form .form-group:eq(3) .input-group select');
    var pfno = $('#academic-data-form .form-group:eq(4) .input-group input');
    var primarynames = schoolValid(primaryname, 'primary');
    var highnames = schoolValid(highname, 'high');
    var campusnames = schoolValid(campusname, 'campus');
    var institutions = campusValid(institution);
    var pfnos = pfnoValid(pfno);
    if (primarynames && highnames && campusnames && pfnos) {
        $('#academic-data-form .form-group:eq(4) button span i:eq(1)')
                .removeClass('fa-arrow-right')
                .addClass('spinner-border spinner-border-sm');
        var array = new Array();
        array[0] = $(primaryname).val();
        array[1] = $(highname).val();
        array[2] = $(campusname).val();
        array[3] = $(institution).val();
        array[4] = $(pfno).val();

        var json = JSON.stringify(array);
        $.post('../core/techfy.php',
                {
                    techfy: 'academicData-hod',
                    data: json
                },
                function (data, status) {
                    techfy("Proceed to fill your Sports info!");
                    loadSportData();
                }
        );
    } else {
        techfy('We detected some errors. Please correct them then try again');
    }
}

function sportData() {
    var mainSport = $('#sports-data-form .form-group:eq(0) .input-group select');

    var mainsposts = sportValid(mainSport);


    if (mainsposts) {
        $('#sports-daata-form .form-group:eq(1) button:eq(1) span i:eq(1)').removeClass('fa-send').addClass('fa-pulse fa-refresh');
        var array = new Array();
        array[0] = $(mainSport).val();
        var json = JSON.stringify(array);

        $.post('../core/techfy.php', {
            techfy: 'sportData-hod',
            data: json
        }, function (data, status) {

            if (data === 'success') {
                techfy("Thank you for registering with <b>K-U-S-A</b> assocciation.\n\
                    <br> You can now login to your new portal.\n\
                    <br>Your username is your email, your password is your id number.\n\
                    <br>Proceed to attach your documents!");
                loadDocumentData();
            } else {
                techfy(data);
            }

        });
    }
}



function loadPersonalPhotoHOD(btn) {
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
            url: "uploadDocumentsHOD.php",
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
                $.post('../core/techfy.php',
                        {
                            techfy: 'uploadDocumentHOD',
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
function loadIdfrontHOD(btn) {
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
            url: "uploadDocumentsHOD.php",
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
                $.post('../core/techfy.php',
                        {
                            techfy: 'uploadDocumentHOD',
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
function loadIdbackHOD(btn) {
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
            url: "uploadDocumentsHOD.php",
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
                $.post('../core/techfy.php',
                        {
                            techfy: 'uploadDocumentHOD',
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
function loadJobIdHOD(btn) {
    var i = $(btn).children('i');
    var hcs = document.getElementById('jobid');
    var hcss = imageValid(hcs, 'Work Place ID');
    if (hcss) {
        $(i).removeClass('fa-upload').addClass('spinner-border spinner-border-sm');
        $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
        var image = hcs.files[0];
        var form_data = new FormData();
        form_data.append("file", image);
        $.ajax({
            url: "uploadDocumentsHOD.php",
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
                var json = JSON.stringify(['jobid', data]);
                $.post('../core/techfy.php',
                        {
                            techfy: 'uploadDocumentHOD',
                            data: json
                        },
                        function (data, status) {
                            if (data === 'success') {
                                $(btn).html('Uploaded <i class="fa fa-check"></i>')
                                        .attr('disabled', 'disabled')
                                        .removeClass('btn-outline-secondary')
                                        .addClass('.btn-secondary');
                                hcs.disabled = 'disabled';
                            } else {

                            }

                        });
            }
        });
    }
}