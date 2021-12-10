<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title"> @changeLang('Register') </h5>
            <button type="button" aria-label="Close" class="close" data-dismiss="modal">×</button>
        </div>
        {!! Form::open(['id'=>'RegisterForm', 'url' => ['user/register', 'user_type' => $user_type] ]) !!}
        <div class="modal-body">
            <div class="row">
                <div class="form-group col-sm-6">
                        <label class="font-weight-bold"> @changeLang('First Name') </label> <span class="text-danger">*</span>
                        {!! Form::text('fname', null, ['class' => 'form-control col-12', 'required']) !!}
                </div>

                <div class="form-group col-sm-6">
                    <label class="font-weight-bold"> @changeLang('Last Name') </label> <span class="text-danger">*</span>
                    {!! Form::text('lname', null, ['class' => 'form-control', 'required']) !!}
                </div>

                @if ($user_type == 2)
                    <div class="form-group col-sm-12">
                        <label class="font-weight-bold"> @changeLang('Email') </label> <span class="text-danger">*</span>
                        <input type="email" name="email" class="form-control" required>
                    </div>
                @endif

                <div id="recaptcha-container"></div>
                <div class="form-group col-sm-12">
                    <label class="font-weight-bold">@changeLang('Phone Number')</label> <span class="text-danger">*</span>
                    <input type="text" class="form-control" name="mobile" id="number" placeholder="01*********">
                    <div id="sendOtpDiv">
                        <a class="btn btn-danger btn-sm btn-block text-center" id="verifPhNum" onclick="register.sendOTP()">@changeLang('Send OTP')</a>
                        <span id="verifPhNumdisabled" class="btn btn-secondary text-center" style="display:none; cursor:default">@changeLang('Send OTP')</span>
                    </div>
                </div>

                <div class="form-group col-sm-12 d-none" id="verify-otp">
                    <input type="text" id="codeToVerify" name="getcode" class="form-control text-center" placeholder= @changeLang("Enter code sent")>
                    <a class="btn btn-primary btn-sm btn-block mb-2 text-center" id="verifPhNum" onclick="register.verifyOTP(this)">@changeLang('Verify OTP')</a>
                    <div class="text-center">
                        <span id="getcodedisabled" class="text-secondary text-center" style="display:none">@changeLang('Resend Code')</span>
                    </div>
                </div>

                <div class="form-group col-sm-12 d-none" id="passwordDiv">
                    <label class="font-weight-bold"> @changeLang('Password') </label> <span class="text-danger">*</span>
                    <input name="password" type="password" class="form-control" required>
                </div>

                <div class="text-right col-12 d-none" id="submitDiv">
                    <button type='submit' class='btn btn-primary' id='btnSave' data-loading-text="<span class='spinner-border spinner-border-sm'></span> Processing..."> @changeLang('Register') </button>
                    <button type="button" id="btnCancel" class="btn btn-light ml-1"
                            data-dismiss="modal">@changeLang('Cancel')</button>
                </div>
            </div>
        {!! Form::close() !!}
    </div>
</div>


<style>
    .font-weight-bold {
        font-weight: 450 !important;
    }
</style>

<script>
    window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container', {
        'size': 'invisible',
        'callback': function (response) {
            console.log(response);
        }
    });
</script>