let register = {
    renderform: (user_type)=> {
        $.ajax({
            url: '/user/register/create',
            type: 'GET',
            data: {'user_type': user_type},
            success: function (result) {
                $('#modal_book').html(result);
                $('#modal_book').modal('show');
            },
            error: function (result) {
                console.log(result);
                $.notify("Can't load the register form");
            },
        });
    },

    sendOTP: ()=> {
        let continueEx = true;
        let uniqueNumber = $.ajax({
            url: '/user/register/checkMobile',
            type: 'GET',
            data: {'mobile': $('#number').val()},
            error: function (result){            
                continueEx = false;
            },
        })
        Promise.all([uniqueNumber]).then(()=>{
            if(continueEx){
                let phoneNo = '+2' + $('#number').val();
                let appVerifier = window.recaptchaVerifier;
                let counter = 57;
        
                let text = $('#verifPhNum').text();
                $('#verifPhNum').css('display', 'none');
                $('#verifPhNumdisabled').css('display', 'block');
        
                firebase.auth().signInWithPhoneNumber(phoneNo, appVerifier)
                    .then(function (confirmationResult) {
                        window.confirmationResult=confirmationResult;
                        coderesult=confirmationResult;
                        $('#verify-otp').removeClass('d-none');
                        setInterval(()=>{
                            $('#verifPhNumdisabled').text(text + ' ' + counter);
                            counter--;
                            if(counter == 0){
                                clearInterval(this);
                                counter = 57;
                                $('#verifPhNum').css('display', 'inline-block');
                                $('#verifPhNumdisabled').css('display', 'none');
                            }
                        }, 1000);
                    }).catch(function (error) {
                        $('#verifPhNum').css('display', 'inline-block');
                        $('#verifPhNumdisabled').css('display', 'none');
                        $.notify("لقد قمت بادخال رقم خاطيء");
                })
            }
        }).catch((result) => {
            $.notify(result.responseText);
        })
    },

    verifyOTP: (elem)=> {
        let code = $('#codeToVerify').val();
        // console.log(code);
        $(elem).attr('disabled', 'disabled');
        $(elem).text('Processing..');

        confirmationResult.confirm(code).then(function (result) {
            $('#verify-otp').addClass('d-none');
            $('#sendOtpDiv').addClass('d-none');

            $('#number').attr('readonly', true);
            $('#passwordDiv').removeClass('d-none');
            $('#submitDiv').removeClass('d-none');
            
        }.bind($(elem))).catch(function (error) {
            // User couldn't sign in (bad verification code?)
            // ...
            $(elem).removeAttr('disabled');
            $(elem).text('رمز خاطيء');
            $.notify('Invalid Code Entered', "error");
            setTimeout(() => {
                $(elem).text('تحقق من رمز الOTP');
            }, 2000);
        }.bind($(elem)));
    }
}


let resetPass = {
    sendOTP: ()=> {
        let continueEx = true;
        let uniqueNumber = $.ajax({
            url: '/user/forgot/password/checkUser',
            type: 'GET',
            data: {'mobile': $('#number').val()},
            error: function (result){            
                continueEx = false;
            },
        })
        Promise.all([uniqueNumber]).then(()=>{
            if(continueEx){
                let phoneNo = '+2' + $('#number').val();
                let appVerifier = window.recaptchaVerifier;
                let counter = 57;

                let text = $('#verifPhNum').text();
                $('#verifPhNum').css('display', 'none');
                $('#verifPhNumdisabled').css('display', 'block');
        
                firebase.auth().signInWithPhoneNumber(phoneNo, appVerifier)
                    .then(function (confirmationResult) {
                        window.confirmationResult=confirmationResult;
                        coderesult=confirmationResult;
                        $('#verify-otp').removeClass('d-none');
                        setInterval(()=>{
                            $('#verifPhNumdisabled').text(text + ' ' + counter);
                            counter--;
                            if(counter == 0){
                                clearInterval(this);
                                counter = 57;
                                $('#verifPhNum').css('display', 'inline-block');
                                $('#verifPhNumdisabled').css('display', 'none');
                            }
                        }, 1000);
                    }).catch(function (error) {
                        $('#verifPhNum').css('display', 'inline-block');
                        $('#verifPhNumdisabled').css('display', 'none');
                        $.notify("لقد قمت بادخال رقم غير صحيح");
                })
            }
        }).catch((result) => {
            $.notify(result.responseText);
        })
    },


    verifyOTP: (elem)=> {
        let code = $('#codeToVerify').val();
        // console.log(code);
        $(elem).attr('disabled', 'disabled');
        $(elem).text('Processing..');

        confirmationResult.confirm(code).then(function (result) {
            $('#verify-otp').addClass('d-none');
            $('#sendOtpDiv').addClass('d-none');

            $('#number').attr('readonly', true);
            $('#passwordDiv').removeClass('d-none');
            $('#submitDiv').removeClass('d-none');
            
        }.bind($(elem))).catch(function (error) {
            // User couldn't sign in (bad verification code?)
            // ...
            $(elem).removeAttr('disabled');
            $(elem).text('رمز خاطيء');
            $.notify('Invalid Code Entered', "error");
            setTimeout(() => {
                $(elem).text('تحقق من رمز الOTP');
            }, 2000);
        }.bind($(elem)));
    }
}


const firebaseConfig = {
    apiKey: "AIzaSyBzl6K-5eujx6uqctTG0q7hiovxZtJGMjI",
    authDomain: "test-6b38e.firebaseapp.com",
    projectId: "test-6b38e",
    storageBucket: "test-6b38e.appspot.com",
    messagingSenderId: "934820884227",
    appId: "1:934820884227:web:db23859847b3ccf062c336",
    measurementId: "G-XKYHD7XQQ5"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);