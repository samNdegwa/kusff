$(document).ready(function () {
    $('#menu-btn').click(function () {
        toggleMenu();
    });
    loadEventMessages();
    loadEvent();

    $('#menu a:eq(0)').click(function () {
        eventOptions();
    }
    });
    $('#menu a:eq(1)').click(function () {
        messageOptions();
    });
    $('#menu a:eq(2)').click(function () {
        settingsOptions();
    });
    $('#menu a:eq(3)').click(function () {
        detailsOptions();
    });
});

function toggleMenu() {
    if ($('#menu').css('left') === '0px') {
        $('#menu').css('left', '-70%');
    } else {
        $('#menu').css('left', '0px');
    }
}

function togglerMenu() {
    if ($(window).width() < 768) {
        $('#menu').css('left', '-70%');
    }
}
function techfy(data) {
    $('#modal-feedback-body p').html(data);
    $('#modal-feedback').modal('show');
}
function error() {
    var data = "Something went wrong, please check internet connection then try again";
    $('#modal-feedback-body p').html(data);
    $('#modal-feedback').modal('show');
}



//=======================================================
// Menu Click Functions
//=======================================================


function loadEventMessages() {
    $('#menu a:eq(0) span').html('<i class="spinner-border spinner-border-sm"></i>');
    $('#event-stat').html('<i class="spinner-border spinner-border-sm"></i>');
    $.post('../core/techfy_athlete.php', {
        techfy: 'loadEventData'
    }, function (dat, stat) {
        if (stat === 'success') {
            var json = JSON.parse(dat);
            if (json[1] === 0) {
                $('#menu a:eq(0) span').html('');
                $('#event-stat').html('').removeClass('badge-success');
            } else {
                $('#menu a:eq(0) span').html(json[1]);
                $('#event-stat').html(json[1]);
            }
        } else {
            error();
        }
    });
}
function eventOptions() {
    $('#menu a:eq(0) i').removeClass('fa fa-bullseye').addClass('spinner-border spinner-border-sm');

    $.get('widgets/events/main-menu.php', function (data, status) {
        $('#menu a:eq(0) i').removeClass('spinner-border spinner-border-sm').addClass('fa fa-bullseye');
        $('#menu a:eq(0)').removeClass('menu-option').addClass('menu-option-active');
        $('#menu a:eq(2)').removeClass('menu-option-active').addClass('menu-option');
        $('#menu a:eq(1)').removeClass('menu-option-active').addClass('menu-option');
        $('#menu a:eq(3)').removeClass('menu-option-active').addClass('menu-option');
        $('#athlete-section').fadeOut(200, function () {
            togglerMenu();
            $(this).html(data).fadeIn(200);
            //sub options listeners will be 
            if ($('#menu a:eq(0) span').html().length === 0) {
                $('#event-stat').html('').removeClass('badge-success');
            } else {
                $('#event-stat').html($('#menu a:eq(0) span').html()).addClass('badge-success');
            }
            $('#new-event').click(function () {
                newEvents();
            });
            $('#applied-event').click(function () {
                appliedEvents();
            });

        });

    });
}



function detailsOptions() {
    $('#menu a:eq(3)').removeClass('menu-option').addClass('menu-option-active');
    $('#menu a:eq(0)').removeClass('menu-option-active').addClass('menu-option  ');
    $('#menu a:eq(1)').removeClass('menu-option-active').addClass('menu-option');
    $('#menu a:eq(2)').removeClass('menu-option-active').addClass('menu-option');
    $.get('widgets/details/main-menu.php', function (data, status) {
        $('#athlete-section').fadeOut(200, function () {
            $(this).html(data).fadeIn(200);
            togglerMenu();
            $('#bio-data').click(function () {
                loadBioData($(this));
            });
            $('#edu-data').click(function () {
                loadEducationData($(this));
            });
            $('#sport-data').click(function () {
                loadSportsData($(this));
            });
            $('#document-data').click(function () {
                loadDocumentData($(this));
            });

        });

    });
}

//=======================================================
// Loader Functions
//=======================================================


function loadBioData(data) {

    $(data).children('i')
            .removeClass('fa fa-folder-open-o')
            .addClass('spinner-border spinner-border-sm');
    $.get('widgets/details/bio-data.php', function (data, status) {
        $('#athlete-section').fadeOut(200, function () {
            $(this).html(data).fadeIn(200);
            back();
            togglerMenu();
            loadBiocontent();
            $('#athlete-bio-data').submit(function (e) {
                e.preventDefault();
                var n = $('#athlete-bio-data .form-group:eq(10) button').val();
                if (n === '1') {
                    enableEditBioData();
                } else {
                    updateBioData();
                }
            });
        });
    });

}

function enableEditBioData() {
    $('#athlete-bio-data .form-group:eq(8) .input-group input').removeAttr('disabled');
    $('#athlete-bio-data .form-group:eq(9) .input-group input').removeAttr('disabled');
    $('#athlete-bio-data .form-group:eq(10) button').
            removeClass('btn-secondary').
            addClass('btn-success').
            html('Save <i class="fa fa-save"><i/>').val('2');
}

function updateBioData() {
    var fname = $('#athlete-bio-data .form-group:eq(0) .input-group input');
    var sname = $('#athlete-bio-data .form-group:eq(1) .input-group input');
    var lname = $('#athlete-bio-data .form-group:eq(2) .input-group input');
    var gender = $('#athlete-bio-data .form-group:eq(3) .input-group select');
    var nationality = $('#athlete-bio-data .form-group:eq(4) .input-group select');
    var county = $('#athlete-bio-data .form-group:eq(5) .input-group input');
    var dob = $('#athlete-bio-data .form-group:eq(6) .input-group input');
    var id = $('#athlete-bio-data .form-group:eq(7) .input-group input');
    var phone = $('#athlete-bio-data .form-group:eq(8) .input-group input');
    var email = $('#athlete-bio-data .form-group:eq(9) .input-group input');


    var phones = phoneValid(phone);
    var emails = emailValid(email);

    if (phones && emails) {
        var array = new Array();
        array[0] = fname.val();
        array[1] = sname.val();
        array[2] = lname.val();
        array[3] = gender.val();
        array[4] = nationality.val();
        array[5] = county.val();
        array[6] = dob.val();
        array[7] = id.val();
        array[8] = phone.val();
        array[9] = email.val();
        var json = JSON.stringify(array);
        $('#athlete-bio-data .form-group:eq(10) button').html('Saving <i class="spinner-border spinner-border-sm"><i/>');
        $.post('../core/techfy_athlete.php', {
            techfy: 'update_bio_data_athlete',
            data: json
        }, function (data, status) {
            if (data === 'success') {
                $('#athlete-bio-data .form-group:eq(10) button')
                        .html('Saved <i class="fa fa-check"><i/>')
                        .wait(700)
                        .html('Edit <i class="fa fa-edit"></i>')
                        .removeClass('btn-success')
                        .addClass('btn-secondary').val('1');
                $(fname).attr('disabled', 'disabled').removeClass('is-valid');
                $(sname).attr('disabled', 'disabled').removeClass('is-valid');
                $(lname).attr('disabled', 'disabled').removeClass('is-valid');
                $(gender).attr('disabled', 'disabled').removeClass('is-valid');
                $(nationality).attr('disabled', 'disabled').removeClass('is-valid');
                $(county).attr('disabled', 'disabled').removeClass('is-valid');
                $(id).attr('disabled', 'disabled').removeClass('is-valid');
                $(phone).attr('disabled', 'disabled').removeClass('is-valid');
                $(dob).attr('disabled', 'disabled').removeClass('is-valid');
                $(email).attr('disabled', 'disabled').removeClass('is-valid');
                $('#welcome').html($(fname).val() + ' ' + $(sname).val());
            }
        });
    }
}

function loadBiocontent() {

    $.post('../core/techfy_athlete.php',
            {
                techfy: 'load_bio_data_athlete'
            },
            function (data, status) {
                $('#response-div').html('');
                var json = JSON.parse(data);
                $('#athlete-bio-data .form-group:eq(0) .input-group input').val(json[0]);
                $('#athlete-bio-data .form-group:eq(1) .input-group input').val(json[1]);
                $('#athlete-bio-data .form-group:eq(2) .input-group input').val(json[2]);
                if (json[3] === 'Male') {
                    $('#athlete-bio-data .form-group:eq(3) .input-group select').html('<option>' + json[3] + '</option><option>Female</option><option>--Select Your Gender--</option>');
                } else {
                    $('#athlete-bio-data .form-group:eq(3) .input-group select').html('<option>' + json[3] + '</option><option>Male</option><option>--Select Your Gender--</option>');
                }
                $('#athlete-bio-data .form-group:eq(4) .input-group select').html('<option>' + json[4] + '</option><option>--Select Your Country--</option>');
                $('#athlete-bio-data .form-group:eq(5) .input-group input').val(json[5]);
                $('#athlete-bio-data .form-group:eq(6) .input-group input').val(json[6]);
                $('#athlete-bio-data .form-group:eq(7) .input-group input').val(json[7]);
                $('#athlete-bio-data .form-group:eq(8) .input-group input').val(json[8]);
                $('#athlete-bio-data .form-group:eq(9) .input-group input').val(json[9]);
            }
    );
}

function loadEducationData(data) {
    $(data).children('i')
            .removeClass('fa fa-folder-open-o')
            .addClass('spinner-border spinner-border-sm');
    $.get('widgets/details/academic-data.php', function (data, status) {
        $('#athlete-section').fadeOut(200, function () {
            $(this).html(data).fadeIn(200);
            back();
            togglerMenu();
            loadAcacontent();
            $('#academic-bio-data').submit(function (e) {
                e.preventDefault();
                var btn = $('#academic-bio-data button');

                if (btn.val() === '1') {
                    $('#academic-bio-data .form-group:eq(0) .input-group input').removeAttr('disabled');
                    $('#academic-bio-data .form-group:eq(2) .input-group input').removeAttr('disabled');
                    $(btn).removeClass('btn-secondary').addClass('btn-success').html('Save <i class="fa fa-save"></i>');
                    $(btn).val('2');
                } else {
                    UpdateAcademicData();
                }
            });
        });
    });
}
function UpdateAcademicData() {

    var primary = $('#academic-bio-data .form-group:eq(0) .input-group input');
    var secondary = $('#academic-bio-data .form-group:eq(2) .input-group input');

    var primary_stat = schoolValid(primary, 'Primary');
    var secondary_stat = schoolValid(secondary, 'Secondary');

    if (primary_stat && secondary_stat) {
        var array = new Array();
        array[0] = $(primary).val();
        array[1] = $(secondary).val();
        var json = JSON.stringify(array);
        $('#academic-bio-data button')
                .val('1')
                .html('Saving <i class="spinner-border spinner-border-sm"></i>')
        $.post('../core/techfy_athlete.php', {
            techfy: 'UpdateAcademicData',
            data: json
        }, function (data, status) {
            if (data === 'success') {

                $('#academic-bio-data button')
                        .val('1')
                        .html('Saved <i class="fa fa-check"></i>')
                        .wait(800)
                        .removeClass('btn-success')
                        .addClass('btn-secondary')
                        .html('Edit <i class="fa fa-edit"></i>');
                $('#academic-bio-data .form-group:eq(0) .input-group input').attr('disabled', 'disabled').removeClass('is-valid');
                $('#academic-bio-data .form-group:eq(2) .input-group input').attr('disabled', 'disabled').removeClass('is-valid');
            } else {
                alert('Something went wrong, Please try again later');
            }
        });
    }


}
function loadAcacontent() {

    $.post('../core/techfy_athlete.php', {
        techfy: 'loadAcacontent'
    }, function (data, status) {
        $('#response-div').html('');
        var json = JSON.parse(data);
        for (var a = 0; a < 6; a++) {
            $('#academic-bio-data .form-group:eq(' + a + ') .input-group input').val(json[a]);
        }
    });
}

function loadMainMenu() {
    $.get('widgets/details/main-menu.php', function (data, status) {
        $('#athlete-section').fadeOut(200, function () {
            $(this).html(data).fadeIn(200);
            togglerMenu();
            $('#bio-data').click(function () {
                loadBioData($(this));
            });
            $('#edu-data').click(function () {
                loadEducationData($(this));
            });
            $('#sport-data').click(function () {
                loadSportsData($(this));
            });
            $('#document-data').click(function () {
                loadDocumentData($(this));
            });
        });

    });
}



function loadSportsData(data) {
    $(data).children('i')
            .removeClass('fa fa-folder-open-o')
            .addClass('spinner-border spinner-border-sm');
    $.get('widgets/details/sports.php', function (data, status) {

        $('#athlete-section').fadeOut(200, function () {
            $(this).html(data).fadeIn(200);
            back();
            $.post('../core/techfy_athlete.php', {techfy: 'loadSportsData'}, function (data, status) {
//                    alert(data);
                $('#response-div').html('');
                var json = JSON.parse(data);
                $('#sports-bio-data .form-group:eq(0) .input-group input').val(json[0]);
                $('#sports-bio-data .form-group:eq(1) .input-group input').val(json[1]);
                $('#sports-bio-data .form-group:eq(2) .input-group textarea').val(json[2]);
                $('#sports-bio-data').submit(function (e) {
                    e.preventDefault();
                    updateSportsData();
                });
            });
        });
    });
}


function updateSportsData() {
    var btn = $('#sports-bio-data .form-group:eq(3) button');
    if (btn.val() === '1') {
        $('#sports-bio-data .form-group:eq(2) .input-group textarea').removeAttr('disabled');
        $(btn).val('2').html('Save <i class="fa fa-save"></i>').removeClass('btn-secondary').addClass('btn-success');
    } else {

        var sports = $('#sports-bio-data .form-group:eq(2) .input-group textarea').val();
        if (sports.length === 0 || sports === 'No other Sports') {
            $('#sports-bio-data .form-group:eq(2) .input-group textarea').attr('disabled', 'disabled');
            $(btn).val('1').html('Edit <i class="fa fa-edit"></i>').removeClass('btn-success').addClass('btn-secondary');
        } else {
            $(btn).html('Saving <i class="spinner-border spinner-border-sm"></i>');
            var array = new Array();
            array[0] = sports;
            $('#sports-bio-data .form-group:eq(2) .input-group textarea').addClass('is-valid');
            var json = JSON.stringify(array);
            $.post(
                    '../core/techfy_athlete.php',
                    {
                        techfy: 'updateSportsData',
                        data: json
                    },
                    function (data, status) {
                        if (data === 'success') {
                            $('#sports-bio-data .form-group:eq(2) .input-group textarea').wait(700).removeClass('is-valid').attr('disabled', 'disabled');
                            $(btn).html('Saved <i class="fa fa-check"><i/>')
                                    .wait(700)
                                    .html('Edit <i class="fa fa-edit"></i>')
                                    .removeClass('btn-success')
                                    .addClass('btn-secondary').val('1');
                        }
                    }
            );
        }
    }
}

function back() {
    $('#menu-back').click(function () {
        $(this).children('i').removeClass('fa fa-hand-o-left').addClass('spinner-border spinner-border-sm');
        loadMainMenu();
    });
}
function backEvents() {
    $('#menu-back').click(function () {
        $(this).children('i').removeClass('fa fa-hand-o-left').addClass('spinner-border spinner-border-sm');
        loadEvent();
    });
}
function backSms() {
    $('#menu-back').click(function () {
        $(this).children('i').removeClass('fa fa-hand-o-left').addClass('spinner-border spinner-border-sm');
        messageOptions();
    });
}
function backSettings() {
    $('#menu-back').click(function () {
        $(this).children('i').removeClass('fa fa-hand-o-left').addClass('spinner-border spinner-border-sm');
        settingsOptions();
    });
}

//===============================================================
//          This is documents code section start
//===============================================================
function loadDocumentData(data) {
    $(data).children('i')
            .removeClass('fa fa-folder-open-o')
            .addClass('spinner-border spinner-border-sm');
    $.get('widgets/details/documents.php', function (data, status) {
        $('#athlete-section').fadeOut(200, function () {
            $(this).html(data).fadeIn(200);
            back();


            //Load the content for the section
            //----------------------------------------
            $.post('../core/techfy_athlete.php'
                    ,
                    {
                        techfy: 'document-data'
                    },
                    function (data, status) {
                        var json = JSON.parse(data);

                        //populate the images first
                        //------------------------------
                        if (json[0] === '--personal-photo--') {
                            $('#personal-photo img').attr('src', '../img/kusa-west.jpg');
                        } else {
                            $('#personal-photo img').attr('src', '../docs/athlete/' + json[0]);
                        }


                        if (json[1] === '--birth-certificate--') {
                            $('#birth-cert img').attr('src', '../img/kusa-west.jpg');
                        } else {
                            $('#birth-cert img').attr('src', '../docs/athlete/' + json[1]);
                        }


                        if (json[2] === '--national-id-front--') {
                            $('#nid-front img').attr('src', '../img/kusa-west.jpg');
                        } else {
                            $('#nid-front img').attr('src', '../docs/athlete/' + json[2]);
                        }


                        if (json[3] === '--national-id-back--') {
                            $('#nid-back img').attr('src', '../img/kusa-west.jpg');
                        } else {
                            $('#nid-back img').attr('src', '../docs/athlete/' + json[3]);
                        }


                        if (json[4] === '--student-id--') {
                            $('#student-id img').attr('src', '../img/kusa-west.jpg');
                        } else {
                            $('#student-id img').attr('src', '../docs/athlete/' + json[4]);
                        }


                        if (json[5] === '--high-school-cert--') {
                            $('#high-cert img').attr('src', '../img/kusa-west.jpg');
                        } else {
                            $('#high-cert img').attr('src', '../docs/athlete/' + json[5]);
                        }




                        //personal-photo upload
                        $('#personal-photo .card-body button').click(function () {
                            loadPersonalPhoto($(this));
                        });
                        back();
                        $('#response-div').html('');

                        //nid - front upload
                        $('#nid-front .card-body button').click(function () {
                            loadNidFront($(this));
                        });
                        //load id back
                        $('#nid-back .card-body button').click(function () {
                            loadNidBack($(this));
                        });
                        //load student id
                        $('#student-id .card-body button').click(function () {
                            loadStudentId($(this));
                        });
                        //load High cert
                        $('#high-cert .card-body button').click(function () {
                            loadHighCert($(this));
                        });
                        //load High cert
                        $('#birth-cert .card-body button').click(function () {
                            loadBirthCert($(this));
                        });
                    }
            );

        });


        //

    });
}



function loadPersonalPhoto(btn) {
    if ($(btn).val() === '1') {
        $(btn).children('i').removeClass('fa fa-edit').addClass('spinner-border spinner-border-sm');
        $.get('widgets/details/documents/personal-photo.php', function (data, status) {
            $('#personal-photo .card-body').fadeOut(200, function () {
                $(this).html(data).fadeIn(200);
                $('#personal-photo .card-body button').click(function () {
                    loadPersonalPhoto($(this));
                });
            });
        });
    } else {
        var img = document.getElementById('personal_photo');
        var imgs = imageValid(img, 'Personal Photo');
        if (imgs) {
            $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            $.post('../core/techfy_athlete.php',
                    {
                        techfy: 'athlete_doc_name',
                        data: JSON.stringify(['personal_photo'])
                    },
                    function (data, status) {
                        var image = img.files[0];
                        var form_data = new FormData();
                        form_data.append("file", image);
                        $.ajax({
                            url: "updateAthleteDocs.php",
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
                                var data_json = JSON.parse(data);
                                if (data_json[0] === 'success') {
                                    $.post('../core/techfy_athlete.php',
                                            {
                                                techfy: 'updateDocName',
                                                data: JSON.stringify(['personal_photo', data_json[1]])
                                            },
                                            function (d, s) {
                                                var name = JSON.parse(d);
                                                $('#personal-photo img').attr('src', '../docs/athlete/' + name[0]);
                                                $('#personal-photo .card-body').html('<button value="1" class="btn btn-outline-secondary btn-sm"></button>');
                                                $('#personal-photo .card-body button')
                                                        .html('Document Uploaded ! <i class="fa fa-check"></i>')
                                                        .wait(1400)
                                                        .removeClass('btn btn-outline-secondary btn-sm')
                                                        .addClass('btn btn-outline-success btn-sm')
                                                        .html('Edit <i class="fa fa-edit"></i>')
                                                        .click(function () {
                                                            loadPersonalPhoto($(this));
                                                        });
                                            });
                                } else {
                                    alert('Please select an image with a little bit lower resolution');
                                    $('#personal-photo .card-body button')
                                            .html('Document Not Uploaded ! <i class="fa fa-check"></i>')
                                            .removeClass('btn btn-outline-secondary btn-sm')
                                            .addClass('btn btn-outline-danger btn-sm')
                                            .wait(1400)
                                            .removeClass('btn btn-outline-danger btn-sm')
                                            .addClass('btn btn-outline-success btn-sm')
                                            .html('Edit <i class="fa fa-edit"></i>')
                                            .click(function () {
                                                loadPersonalPhoto($(this));
                                            });
                                }

                            }
                        });
                    }
            );
        }
    }
}

function loadNidFront(btn) {
    if ($(btn).val() === '1') {
        $(btn).children('i').removeClass('fa fa-edit').addClass('spinner-border spinner-border-sm');
        $.get('widgets/details/documents/nid-front.php', function (data, status) {
            $('#nid-front .card-body').fadeOut(200, function () {
                $(this).html(data).fadeIn(200);
                $('#nid-front .card-body button').click(function () {
                    loadNidFront($(this));
                });
            });
        });
    } else {
        var img = document.getElementById('nid_front');
        var imgs = imageValid(img, 'National id (front)');
        if (imgs) {
            $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            $.post('../core/techfy_athlete.php',
                    {
                        techfy: 'athlete_doc_name',
                        data: JSON.stringify(['nid_front'])
                    },
                    function (data, status) {
                        var image = img.files[0];
                        var form_data = new FormData();
                        form_data.append("file", image);
                        $.ajax({
                            url: "updateAthleteDocs.php",
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
                                var data_json = JSON.parse(data);
                                if (data_json[0] === 'success') {
                                    $.post('../core/techfy_athlete.php',
                                            {
                                                techfy: 'updateDocName',
                                                data: JSON.stringify(['nid_front', data_json[1]])
                                            },
                                            function (d, s) {
                                                var name = JSON.parse(d);
                                                $('#nid-front img').attr('src', '../docs/athlete/' + name[0]);
                                                $('#nid-front .card-body').html('<button value="1" class="btn btn-outline-secondary btn-sm"></button>');
                                                $('#nid-front .card-body button')
                                                        .html('Document Uploaded ! <i class="fa fa-check"></i>')
                                                        .wait(1400)
                                                        .removeClass('btn btn-outline-secondary btn-sm')
                                                        .addClass('btn btn-outline-success btn-sm')
                                                        .html('Edit <i class="fa fa-edit"></i>')
                                                        .click(function () {
                                                            loadNidFront($(this));
                                                        });
                                            });
                                } else {
                                    alert('Please select an image with a little bit lower resolution');
                                    $('#nid-front .card-body button')
                                            .html('Document Not Uploaded ! <i class="fa fa-check"></i>')
                                            .removeClass('btn btn-outline-secondary btn-sm')
                                            .addClass('btn btn-outline-danger btn-sm')
                                            .wait(1400)
                                            .removeClass('btn btn-outline-danger btn-sm')
                                            .addClass('btn btn-outline-success btn-sm')
                                            .html('Edit <i class="fa fa-edit"></i>')
                                            .click(function () {
                                                loadNidFront($(this));
                                            });
                                }

                            }
                        });
                    }
            );
        }
    }
}

function loadNidBack(btn) {
    if ($(btn).val() === '1') {
        $(btn).children('i').removeClass('fa fa-edit').addClass('spinner-border spinner-border-sm');
        $.get('widgets/details/documents/nid-back.php', function (data, status) {
            $('#nid-back .card-body').fadeOut(200, function () {
                $(this).html(data).fadeIn(200);
                $('#nid-back .card-body button').click(function () {
                    loadNidBack($(this));
                });
            });
        });
    } else {
        var img = document.getElementById('nid_back');
        var imgs = imageValid(img, 'National id (back)');
        if (imgs) {
            $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            $.post('../core/techfy_athlete.php',
                    {
                        techfy: 'athlete_doc_name',
                        data: JSON.stringify(['nid_back'])
                    },
                    function (data, status) {
                        var image = img.files[0];
                        var form_data = new FormData();
                        form_data.append("file", image);
                        $.ajax({
                            url: "updateAthleteDocs.php",
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
                                var data_json = JSON.parse(data);
                                if (data_json[0] === 'success') {
                                    $.post('../core/techfy_athlete.php',
                                            {
                                                techfy: 'updateDocName',
                                                data: JSON.stringify(['nid_back', data_json[1]])
                                            },
                                            function (d, s) {
                                                var name = JSON.parse(d);
                                                $('#nid-back img').attr('src', '../docs/athlete/' + name[0]);
                                                $('#nid-back .card-body').html('<button value="1" class="btn btn-outline-secondary btn-sm"></button>');
                                                $('#nid-back .card-body button')
                                                        .html('Document Uploaded ! <i class="fa fa-check"></i>')
                                                        .wait(1400)
                                                        .removeClass('btn btn-outline-secondary btn-sm')
                                                        .addClass('btn btn-outline-success btn-sm')
                                                        .html('Edit <i class="fa fa-edit"></i>')
                                                        .click(function () {
                                                            loadNidBack($(this));
                                                        });
                                            });
                                } else {
                                    alert('Please select an image with a little bit lower resolution');
                                    $('#nid-back .card-body button')
                                            .html('Document Not Uploaded ! <i class="fa fa-check"></i>')
                                            .removeClass('btn btn-outline-secondary btn-sm')
                                            .addClass('btn btn-outline-danger btn-sm')
                                            .wait(1400)
                                            .removeClass('btn btn-outline-danger btn-sm')
                                            .addClass('btn btn-outline-success btn-sm')
                                            .html('Edit <i class="fa fa-edit"></i>')
                                            .click(function () {
                                                loadNidBack($(this));
                                            });
                                }

                            }
                        });
                    }
            );
        }
    }
}

function loadStudentId(btn) {
    if ($(btn).val() === '1') {
        $(btn).children('i').removeClass('fa fa-edit').addClass('spinner-border spinner-border-sm');
        $.get('widgets/details/documents/student-id.php', function (data, status) {
            $('#student-id .card-body').fadeOut(200, function () {
                $(this).html(data).fadeIn(200);
                $('#student-id .card-body button').click(function () {
                    loadStudentId($(this));
                });
            });
        });
    } else {
        var img = document.getElementById('student_id');
        var imgs = imageValid(img, 'Student Id');
        if (imgs) {
            $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            $.post('../core/techfy_athlete.php',
                    {
                        techfy: 'athlete_doc_name',
                        data: JSON.stringify(['student_id'])
                    },
                    function (data, status) {
                        var image = img.files[0];
                        var form_data = new FormData();
                        form_data.append("file", image);
                        $.ajax({
                            url: "updateAthleteDocs.php",
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
                                var data_json = JSON.parse(data);
                                if (data_json[0] === 'success') {
                                    $.post('../core/techfy_athlete.php',
                                            {
                                                techfy: 'updateDocName',
                                                data: JSON.stringify(['student_id', data_json[1]])
                                            },
                                            function (d, s) {
                                                var name = JSON.parse(d);
                                                $('#student-id img').attr('src', '../docs/athlete/' + name[0]);
                                                $('#student-id .card-body').html('<button value="1" class="btn btn-outline-secondary btn-sm"></button>');
                                                $('#student-id .card-body button')
                                                        .html('Document Uploaded ! <i class="fa fa-check"></i>')
                                                        .wait(1400)
                                                        .removeClass('btn btn-outline-secondary btn-sm')
                                                        .addClass('btn btn-outline-success btn-sm')
                                                        .html('Edit <i class="fa fa-edit"></i>')
                                                        .click(function () {
                                                            loadStudentId($(this));
                                                        });
                                            });
                                } else {
                                    alert('Please select an image with a little bit lower resolution');
                                    $('#nid-back .card-body button')
                                            .html('Document Not Uploaded ! <i class="fa fa-check"></i>')
                                            .removeClass('btn btn-outline-secondary btn-sm')
                                            .addClass('btn btn-outline-danger btn-sm')
                                            .wait(1400)
                                            .removeClass('btn btn-outline-danger btn-sm')
                                            .addClass('btn btn-outline-success btn-sm')
                                            .html('Edit <i class="fa fa-edit"></i>')
                                            .click(function () {
                                                loadStudentId($(this));
                                            });
                                }

                            }
                        });
                    }
            );
        }
    }
}

function loadHighCert(btn) {
    if ($(btn).val() === '1') {
        $(btn).children('i').removeClass('fa fa-edit').addClass('spinner-border spinner-border-sm');
        $.get('widgets/details/documents/high-cert.php', function (data, status) {
            $('#high-cert .card-body').fadeOut(200, function () {
                $(this).html(data).fadeIn(200);
                $('#high-cert .card-body button').click(function () {
                    loadHighCert($(this));
                });
            });
        });
    } else {
        var img = document.getElementById('high_cert');
        var imgs = imageValid(img, 'High school certificate');
        if (imgs) {
            $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            $.post('../core/techfy_athlete.php',
                    {
                        techfy: 'athlete_doc_name',
                        data: JSON.stringify(['high_cert'])
                    },
                    function (data, status) {
                        var image = img.files[0];
                        var form_data = new FormData();
                        form_data.append("file", image);
                        $.ajax({
                            url: "updateAthleteDocs.php",
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
                                var data_json = JSON.parse(data);
                                if (data_json[0] === 'success') {
                                    $.post('../core/techfy_athlete.php',
                                            {
                                                techfy: 'updateDocName',
                                                data: JSON.stringify(['high_cert', data_json[1]])
                                            },
                                            function (d, s) {
                                                var name = JSON.parse(d);
                                                $('#high-cert img').attr('src', '../docs/athlete/' + name[0]);
                                                $('#high-cert .card-body').html('<button value="1" class="btn btn-outline-secondary btn-sm"></button>');
                                                $('#high-cert .card-body button')
                                                        .html('Document Uploaded ! <i class="fa fa-check"></i>')
                                                        .wait(1400)
                                                        .removeClass('btn btn-outline-secondary btn-sm')
                                                        .addClass('btn btn-outline-success btn-sm')
                                                        .html('Edit <i class="fa fa-edit"></i>')
                                                        .click(function () {
                                                            loadHighCert($(this));
                                                        });
                                            });
                                } else {
                                    alert('Please select an image with a little bit lower resolution');
                                    $('#high-cert .card-body button')
                                            .html('Document Not Uploaded ! <i class="fa fa-check"></i>')
                                            .removeClass('btn btn-outline-secondary btn-sm')
                                            .addClass('btn btn-outline-danger btn-sm')
                                            .wait(1400)
                                            .removeClass('btn btn-outline-danger btn-sm')
                                            .addClass('btn btn-outline-success btn-sm')
                                            .html('Edit <i class="fa fa-edit"></i>')
                                            .click(function () {
                                                loadHighCert($(this));
                                            });
                                }

                            }
                        });
                    }
            );
        }
    }
}

function loadBirthCert(btn) {
    if ($(btn).val() === '1') {
        $(btn).children('i').removeClass('fa fa-edit').addClass('spinner-border spinner-border-sm');
        $.get('widgets/details/documents/birth-cert.php', function (data, status) {
            $('#birth-cert .card-body').fadeOut(200, function () {
                $(this).html(data).fadeIn(200);
                $('#birth-cert .card-body button').click(function () {
                    loadBirthCert($(this));
                });
            });
        });
    } else {
        var img = document.getElementById('birth_cert');
        var imgs = imageValid(img, 'birth certificate');
        if (imgs) {
            $(btn).html('Uploading <i class="spinner-border spinner-border-sm"></i>');
            $.post('../core/techfy_athlete.php',
                    {
                        techfy: 'athlete_doc_name',
                        data: JSON.stringify(['birth_cert'])
                    },
                    function (data, status) {
                        var image = img.files[0];
                        var form_data = new FormData();
                        form_data.append("file", image);
                        $.ajax({
                            url: "updateAthleteDocs.php",
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
                                var data_json = JSON.parse(data);
                                if (data_json[0] === 'success') {
                                    $.post('../core/techfy_athlete.php',
                                            {
                                                techfy: 'updateDocName',
                                                data: JSON.stringify(['birth_cert', data_json[1]])
                                            },
                                            function (d, s) {
                                                var name = JSON.parse(d);
                                                $('#birth-cert img').attr('src', '../docs/athlete/' + name[0]);
                                                $('#birth-cert .card-body').html('<button value="1" class="btn btn-outline-secondary btn-sm"></button>');
                                                $('#birth-cert .card-body button')
                                                        .html('Document Uploaded ! <i class="fa fa-check"></i>')
                                                        .wait(1400)
                                                        .removeClass('btn btn-outline-secondary btn-sm')
                                                        .addClass('btn btn-outline-success btn-sm')
                                                        .html('Edit <i class="fa fa-edit"></i>')
                                                        .click(function () {
                                                            loadBirthCert($(this));
                                                        });
                                            });
                                } else {
                                    alert('Please select an image with a little bit lower resolution');
                                    $('#birth-cert .card-body button')
                                            .html('Document Not Uploaded ! <i class="fa fa-check"></i>')
                                            .removeClass('btn btn-outline-secondary btn-sm')
                                            .addClass('btn btn-outline-danger btn-sm')
                                            .wait(1400)
                                            .removeClass('btn btn-outline-danger btn-sm')
                                            .addClass('btn btn-outline-success btn-sm')
                                            .html('Edit <i class="fa fa-edit"></i>')
                                            .click(function () {
                                                loadBirthCert($(this));
                                            });
                                }

                            }
                        });
                    }
            );
        }
    }
}

//===============================================================
//          This is documents code section end
//===============================================================


function loadEvent() {
    $.get('widgets/events/main-menu.php', function (data, status) {
        $('#athlete-section').fadeOut(200, function () {
            $(this).html(data).fadeIn(200)
            //sub options listeners will be here
            if ($('#menu a:eq(0) span').html().length === 0) {
                $('#event-stat').html('').removeClass('badge-success');
            } else {
                $('#event-stat').html($('#menu a:eq(0) span').html()).addClass('badge-success');
            }

            $('#new-event').click(function () {
                newEvents();
            });
            $('#applied-event').click(function () {
                appliedEvents();
            });
        });
    });
}


function newEvents() {
    $('#new-event i').removeClass('fa-folder-open-o').addClass('spinner-border spinner-border-sm');
    $.get('widgets/events/upcomming-events.php', function (data, stat) {
        $('#athlete-section').fadeOut(200, function () {
            $(this).html(data).fadeIn(200);
            backEvents();
            //some more options here
            $.post('../core/techfy_athlete.php', {
                techfy: 'newEvents'
            }, function (data, status) {
                if (status === 'success') {
                    var json = JSON.parse(data);
                    $('#menu a:eq(0) span').text(json[1]);
                    $('#table-events tbody').fadeOut(200, function () {
                        $(this).html(json[0]).fadeIn(200);
                        //register the button click event

                        $('#table-events tbody button').click(function () {
                            applyEvent($(this));
                        });

                        menuUpdate(json[1]);
                    });
                } else {
                    error();
                }
            });
        });
    });
}

function applyEvent(data) {
    var val = $(data).val();
    var eventType = $(data).parent().siblings('td:eq(1)').text() + ' ' + $(data).parent().siblings('td:eq(2)').text();
    var eventFee = $(data).parent().siblings('td:eq(5)').text();
    var c = confirm('You are about to Apply for the event :\n----------\n ' + eventType + '\n----------\n Proceed to apply?');
    if (c === true) {
        $(data).html('Applying <i class="spinner-border spinner-border-sm"></i>');
        $.post('../core/techfy_athlete.php',
                {
                    techfy: 'applyEvent',
                    data: JSON.stringify([val])
                },
                function (dat, status) {
                    if (status === 'success') {
                        var json = JSON.parse(dat);
                        if (json[0] === 'success') {
                            var r = '';
                            if (eventFee === ' Open!') {
                                r = 'You have successfully applied for the event<br><b>' + eventType + '</b>.<br> Now await for approval from your Games HOD';
                            } else {
                                r = 'You have successfully applied for the event<br><b>' + eventType + '</b>.<br> Now Pay <b style="font-size:larger">KSh. ' + eventFee + '</b> to your Games HOD to facilitate your approval!';
                            }
                            techfy(r);
                            var js = JSON.parse(json[1]);
                            $('#table-events tbody').fadeOut(200, function () {
                                $(this).html(js[0]).fadeIn(200);
                                $('#table-events tbody button').click(function () {
                                    applyEvent($(this));
                                });
                                menuUpdate(js[1]);
                            });
                            if (json[2] === '0') {
                                $('#menu a:eq(0) span').text('');
                            } else {
                                $('#menu a:eq(0) span').text(json[2]);
                            }

                        } else {
                            techfy(json[0]);
                        }

                    } else {
                        error();
                    }
                }
        );
    }

}

function menuUpdate(data) {
    if (data === 0) {
        $('#menu a:eq(0) span').html('');
    } else {
        $('#menu a:eq(0) span').text(data);
    }
}

function settingsOptions() {
    $('#menu a:eq(2) i').removeClass('fa fa-bullseye').addClass('spinner-border spinner-border-sm');
    $.get('widgets/settings/main-menu.php', function (data, status) {
        $('#menu a:eq(2) i').removeClass('spinner-border spinner-border-sm').addClass('fa fa-bullseye');
        $('#menu a:eq(2)').removeClass('menu-option').addClass('menu-option-active');
        $('#menu a:eq(0)').removeClass('menu-option-active').addClass('menu-option');
        $('#menu a:eq(1)').removeClass('menu-option-active').addClass('menu-option');
        $('#menu a:eq(3)').removeClass('menu-option-active').addClass('menu-option');
        $('#athlete-section').fadeOut(200, function () {
            $(this).html(data).fadeIn(200);
            togglerMenu();
            $('#reset-menu').click(function () {
                resetPassword();
            });
            $('#help-menu').click(function () {
                alert('Ot1');
            });
        });
    });
}

function resetPassword() {
    $('#reset-menu i').removeClass('fa fa-lock').addClass('spinner-border spinner-border-sm');
    $.get('widgets/settings/reset-password.php', function (d, s) {
        if (s === 'success') {
            $('#athlete-section').fadeOut(200, function () {
                $(this).html(d).fadeIn(200);
                backSettings();
                $('#reset-password-form').submit(function (e) {
                    e.preventDefault();
                    rewritePassword();
                });
            });
        } else {
            error();
        }
    });
}

function rewritePassword() {
    var d = document.getElementsByClassName('form-group');
    if (d.length === 2) {
        // validate the password
        var btn = $('#reset-password-form .form-group:eq(1) button');
        var p1 = $('#reset-password-form .form-group:eq(0) .input-group input');
        var p1s = passValid(p1);
        if (p1s) {
            //check the password from the database 
            var json = JSON.stringify([p1.val()]);
            $(btn).html('Continue <i class="spinner-border spinner-border-sm"></i>').attr('disabled', 'disabled');
            $.post('../core/techfy_athlete.php', {
                techfy: 'checkPassword',
                data: json
            }, function (d, s) {
                if (s === 'success') {
                    var json = JSON.parse(d);
                    if (json[0] === 'found') {
                        $(btn).html('Please Wait <i class="spinner-border spinner-border-sm"></i>').attr('disabled', 'disabled');
                        $.get('widgets/settings/pass/new-pass.php', function (data, status) {
                            $('#info-pass').fadeOut(200, function () {
                                $(this).html('Your Current password is Correct, now<br>1.Provide your new password').fadeIn(200);
                            });
                            $('#reset-password-form').fadeOut(200, function () {
                                $(this).html(data).removeClass('mt-5').addClass('mt-3').fadeIn(200);
                            });
                        });
                    } else {
                        techfy('Invalid password provided');
                        $(btn).html('Continue <i class="fa fa-arrow-right"></i>').removeAttr('disabled');
                    }
                } else {
                    error();
                    $(btn).html('Continue <i class="fa fa-arrow-right"></i>').removeAttr('disabled');
                }
            });
        }
    }
    //this is for the update my password event    
    else
    {
        var p1 = $('#reset-password-form .form-group:eq(0) input');
        var p2 = $('#reset-password-form .form-group:eq(1) input');
        var btn = $('#reset-password-form .form-group:eq(2) button');
        var p1s = passValid(p1);
        var p2s = passValid(p2);
        if (p1s && p2s) {
            if (p1.val() === p2.val()) {
                $(btn).html('Saving Changes <i class="spinner-border spinner-border-sm"></i>').attr('disabled', 'disabled');
                $.post('../core/techfy_athlete.php', {
                    techfy: 'updateChanges',
                    data: JSON.stringify([p1.val()])
                }, function (d, s) {
                    if (s === 'success') {
                        var js = JSON.parse(d);
                        if (js[0] === '0') {
                            error();
                        } else {
                            techfy('Your password is successfuly changed! Use your new password on next login');
                            $(btn).html('Save Changes <i class="fa fa-save"></i>').removeAttr('disabled');
                            settingsOptions();
                        }
                    } else {
                        error();
                        $(btn).html('Save Changes <i class="fa fa-save"></i>').removeAttr('disabled');
                    }
                });
            } else {
                $(p1).removeClass('is-valid').addClass('is-invalid');
                $(p2).removeClass('is-valid').addClass('is-invalid');
                techfy('Your passwords do not match!');
            }
        }

    }
}
/*
 ===========================================================
 APPLIED EVENT LOGIC
 ===========================================================
 */

function appliedEvents() {
    $('#applied-event i').removeClass('fa-folder-open-o').addClass('spinner-border spinner-border-sm');
    $.get('widgets/events/my-events.php', function (data, status) {
        $('#athlete-section').fadeOut(200, function () {
            $(this).html(data).fadeIn(200);
            backEvents();
            loadAppliedEvents();
            $('#filter-events-form').submit(function (e) {
                e.preventDefault();
                filterEvents();
            });
        });
    });
}

function loadAppliedEvents() {
    $.post('../core/techfy_athlete.php'
            ,
            {
                techfy: 'loadAppliedEvents'
            },
            function (data, status) {
                $('#table-events tbody').fadeOut(200, function () {
                    $(this).html(data).fadeIn(200);

                    $('#table-events tbody button').click(function () {
                        deregisterEvent($(this));
                    });
                });
            }
    );
}

function filterEvents() {
    var btn = $('#filter-events-form .form-group:eq(0) button');
    var filter = $('#filter-events-form .form-group:eq(0) select');

    var filters = eventValid(filter);

    if (filters) {
        $(btn).html('Filtering <i class="spinner-border spinner-border-sm"></i>').attr('disabled', 'disabled');
        $.post('../core/techfy_athlete.php', {
            techfy: 'filterEvents',
            data: JSON.stringify([$(filter).val()])
        }, function (dat, stat) {
            if (stat === 'success') {
                $('#table-events tbody').fadeOut(200, function () {
                    $(this).html(dat).fadeIn(200);
                    $(btn).html('Filter <i class="fa fa-search"></i>').removeAttr('disabled');
                    $(filter).removeClass('is-valid');
                    $('#table-events tbody button').click(function () {
                        deregisterEvent($(this));
                    });
                });
            } else {
                error();
            }
        });
    }
}

function deregisterEvent(data) {
    var val = data.val();
    var event = $(data).parent().siblings('td:eq(1)').text() + ' ' + $(data).parent().siblings('td:eq(2)').text();
    if (event.length > 10) {
        var c = confirm('Are you sure you want to un-apply for the event:  \n' + event + ' ?');
        if (c) {
            $(data).html('Un-applying <i class="spinner-border spinner-border-sm"></i>');
            $.post('../core/techfy_athlete.php', {
                techfy: 'deregetserEvent',
                data: JSON.stringify([val])
            }, function (d, s) {
                if (s === 'success') {
                    var js = JSON.parse(d);
                    if (js[0] === 'success') {
                        $('#table-events tbody').fadeOut(200, function () {
                            $(this).html(js[1]).fadeIn(200);
                            $('#table-events tbody button').click(function () {
                                deregisterEvent($(this));
                            });

                            var json = JSON.parse(js[2]);
                            menuUpdate(json[1]);
                        });
                    } else {
                        error();
                    }
                } else {
                    error();
                }
            });

        }
    }
}