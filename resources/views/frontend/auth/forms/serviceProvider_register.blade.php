<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title"> @changeLang('Register') </h5>
            <button type="button" aria-label="Close" class="close" data-dismiss="modal">×</button>
        </div>

        {!! Form::open(['id'=>'RegisterForm', 'url' => ['user/register', 'user_type' => 2] ]) !!}
            <div class="modal-body">
                
            </div>
        {!! Form::close() !!}
    </div>
</div>