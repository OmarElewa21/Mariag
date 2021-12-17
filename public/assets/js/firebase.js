$(document).ready(function() {
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

    window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container', {
        'size': 'invisible',
        'callback': function (response) {
        }
    });
});


function submit(elem, user_id) {
    let code = $('#codeToVerify').val();
    // console.log(code);
    $(elem).attr('disabled', 'disabled');
    $(elem).text('Processing..');

    confirmationResult.confirm(code).then(function (result) {
        // console.log(result);
        $.get(
            "/verify/email",
            {"user_id": user_id, "status":1},
            function(data, status){
                $.notify("User verified", status);
                location.reload(true);
            }
        );
        // ...
    }.bind($(elem))).catch(function (error) {
        // User couldn't sign in (bad verification code?)
        // ...
        $(elem).removeAttr('disabled');
        $(elem).text('Invalid Code');
        $.notify('Invalid Code', "error");
        setTimeout(() => {
            $(elem).text('Verify OTP');
        }, 2000);
    }.bind($(elem)));
}

function sendOTP(){
    let phoneNo = '+2' + user_mobile;
    // console.log(phoneNo);
    // getCode(phoneNo);
    let appVerifier = window.recaptchaVerifier;
    $('#getcode').css('display', 'none');
    $('#getcodedisabled').css('display', 'block');
    firebase.auth().signInWithPhoneNumber(phoneNo, appVerifier)
    .then(function (confirmationResult) {
        window.confirmationResult=confirmationResult;
        coderesult=confirmationResult;
        let text = $('#getcodedisabled').text();
        let counter = 57;
        setInterval(()=>{
            $('#getcodedisabled').text(text + ' ' + counter);
            counter--;
            if(counter == 0){
                clearInterval(this);
                $('#getcode').css('display', 'inline-block');
                $('#getcodedisabled').css('display', 'none');
            }
        }, 1000);
    }).catch(function (error) {
        $('#getcode').css('display', 'inline-block');
        $('#getcodedisabled').css('display', 'none');
        // console.log(error.message);
})};
