$(document).ready(function () {

});

function namesValid(input, name) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data.length === 0) {
        result = false;
        $(small).text('Please provide your ' + name + ' name');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else if (data.length > 0 && data.length < 3) {
        result = false;
        $(small).text('Provide a full name please');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else if (/[^a-z A-Z]/.test(data)) {
        result = false;
        $(small).text('Please Provide only alphabets!');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}

function regnoValid(input) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data.length === 0) {
        result = false;
        $(small).text('Please provide your campus registration number');
        $(input).removeClass('is-valid').addClass('is-invalid');
    }
	/*else if (data.length > 0 && data.length < 7) {
        result = false;
        $(small).text('Registration number should be atleast 7 characters');
        $(input).removeClass('is-valid').addClass('is-invalid');
    }
	else if (/[^a-zA-Z0-9\/]/.test(data)) {
        result = false;
        $(small).text('Please Provide a valid registration number!');
        $(input).removeClass('is-valid').addClass('is-invalid');
    }
	else if (data.indexOf('/') === -1) {
        result = false;
        $(small).text('Please Provide a valid registration number!');
        $(input).removeClass('is-valid').addClass('is-invalid');
    }*/ else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }

    return result;
}

function passValid(input) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data.length === 0) {
        result = false;
        $(small).text('Please provide a password');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else if (data.length > 0 && data.length < 5) {
        result = false;
        $(small).text('Please rpovide a pasword with atleast 5 characters');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }

    return result;
}

function pfnoValid(input) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data.length === 0) {
        result = false;
        $(small).text('Please provide your campus PFnumber');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }

    return result;
}

function phoneValid(input) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data.length === 0) {
        result = false;
        $(small).text('Please provide  phone number');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else if (data.length > 0 && (data.length < 10 || data.length > 16)) {
        result = false;
        $(small).text('Phone number should atleast 10-16 digits only');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else if (/[^0-9\+]/.test(data)) {
        result = false;
        $(small).text('Please Provide only Digits');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}

function idValid(input) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data.length === 0) {
        result = false;
        $(small).text('Please provide id number');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else if (data.length > 0 && data.length < 4) {
        result = false;
        $(small).text('Id number/Birth should not be less than 4 digits');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else if (/[^0-9]/.test(data)) {
        result = false;
        $(small).text('Please Provide only Digits');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}

function reset(input) {

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');
    $(small).text('');
    $(input).removeClass('is-valid is-invalid');
    $(input).val('');


}

function genderValid(input) {
    var result = false;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data === '--Select Your Gender --' || data === '--Select Your Gender--') {
        result = false;
        $(small).text('Please select your gender');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        result = true;
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}

function countryValid(input) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data === '--Select Your Country --') {
        result = false;
        $(small).text('Please select your country');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}

function sportValid(input) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data === '--Select Main Sport --') {
        result = false;
        $(small).text('Please select a sport');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}
function sportDurationValid(input) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data === '--Select Sport Duration --') {
        result = false;
        $(small).text('Please select a valid duration time');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}

function gradeValid(input, level) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data === '--Select your Score --') {
        result = false;
        $(small).text('Please select your ' + level + ' school score');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}
function eventValid(input) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data === '--Select Filter Option --') {
        result = false;
        $(small).text('Please select a valid value');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}

function campusValid(input) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data === '--Select your Institution --') {
        result = false;
        $(small).text('Please select your current institution');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}


function dateValid(input) {
    var result = true;
    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data.length === 0) {
        result = false;
        $(small).text('Please provide your date of birth');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        var d = new Date().toString();
        var cyear = d.substring(11, 15);
        var syear = data.substring(0 - 4);


        if (cyear < syear || cyear === syear) {
            result = false;
            $(small).text('Please select a valid date of birth');
            $(input).removeClass('is-valid').addClass('is-invalid');
        } else {
            $(small).text('');
            $(input).removeClass('is-invalid').addClass('is-valid');
        }
    }
    return result;
}

function schoolValid(input, school) {
    var result = true;

    var data = $(input).val();
    var small = $(input).parent().parent().children('small');

    if (data.length === 0) {
        result = false;
        $(small).text('Please provide your ' + school + ' school name');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else if (data.length > 0 && data.length < 3) {
        result = false;
        $(small).text('Provide a full name please');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else if (/[^a-z A-Z 0-9 \' \- \.\,\"\:\;\&\`\~\?]/.test(data)) {
        result = false;
        $(small).text('Please Provide only alphabets!');
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}



function monthInt(month) {
    var r = '';
    if (month === "Jan") {
        r = '01';
    } else if (month === 'Feb') {
        r = '02';
    } else if (month === 'Mar') {
        r = '03';
    } else if (month === 'Apr') {
        r = '04';
    } else if (month === 'May') {
        r = '05';
    } else if (month === 'Jun') {
        r = '06';
    } else if (month === 'Jul') {
        r = '07';
    } else if (month === 'Aug') {
        r = '08';
    } else if (month === 'Sep') {
        r = '09';
    } else if (month === 'Oct') {
        r = '10';
    } else if (month === 'Nov') {
        r = '11';
    } else {
        r = '12';
    }
    return r;
}

function emailValid(input) {
    var result = true;

    var email = $(input).val();
    var small = $(input).parent().parent().children('small');

    var dotpos = email.indexOf(".");
    var atpos = email.indexOf("@");

    if (email.length === 0) {
        $(small).text("Please provide an email address");
        $(input).removeClass('is-valid').addClass('is-invalid');
        result = false;
    } else if (email.length < 8) {
        $(small).text("Email address should contain atleast 8 characters");
        $(input).removeClass('is-valid').addClass('is-invalid');
        result = false;
    } else if (dotpos < 1 || atpos < 1 || (dotpos - atpos) < 3 || (email.length - dotpos) < 3) {
        $(small).text("Provide a valid email address eg kusa@example.com");
        $(input).removeClass('is-valid').addClass('is-invalid');
        result = false;
    } else {
        $(small).text('');
        $(input).removeClass('is-invalid').addClass('is-valid');
    }
    return result;
}

function imageValid(input, img) {
    var valid = false;
    //var value = image.value;
    var small = $(input).parent().parent().children('small');
    if (input.files[0] === undefined) {
        $(small).text("Please provide your " + img + " image");
        $(input).removeClass('is-valid').addClass('is-invalid');
    } else {
        var name = input.files[0].name;
        var ext = name.split('.').pop().toLowerCase();
        var imgSize = input.files[0].size;
        //imagediv.innerHTML = '<p>Select an image for your product</p>';
        if (checkFormat(ext) === false)
        {
            $(small).text("Please select a valid " + img);
            $(input).removeClass('is-valid').addClass('is-invalid');
        } else if (imgSize < 2000)
        {
            $(small).text("Image quality is too low, select your " + img + " with a better resolution");
            $(input).removeClass('is-valid').addClass('is-invalid');
        } else
        {
            valid = true;
            $(small).text('');
            $(input).removeClass('is-invalid').addClass('is-valid');
        }
    }
    return valid;
}

function checkFormat(str) {
    var result = false;
    if (str === 'png') {
        result = true;
    } else if (str === 'jpg') {
        result = true;
    } else if (str === 'jpeg') {
        result = true;
    } else if (str === 'gif') {
        result = true;
    }
    return result;
}