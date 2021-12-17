@extends('frontend.layout.master')

@section('breadcrumb')
    <section class="section">
        <div class="section-header">
                <h1>@changeLang('Contacts')</h1>
        </div>
    </section>
@endsection

@push('custom-style')
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
@endpush

@section('content')

    <div class="card-body text-right">
        <div class="table-responsive">
            <table class="table table-striped cell-border" id="contactsTbl">
                <thead>
                    <tr>
                        <th class="col-1">@changeLang('Sl')</th>
                        <th class="col-2">@changeLang('Client Name')</th>
                        <th class="col-2">@changeLang('Client Number')</th>
                        <th class="col-4">@changeLang('Message')</th>
                        <th class="col-2">@changeLang('Date')</th>
                        <th class="col-1">@changeLang('Contacted')</th>
                    </tr>
                </thead>

                <tbody>
                    @forelse ($contacts as $key=>$contact)
                        <tr style="{{ $key %2 == 0 ? "background: white" : "background: #f2f2f2"}}; {{$contact->is_read ? 'text-decoration: line-through' : ''}}">
                            <td class="col-1">
                                {{ $key + 1 }}
                            </td>

                            <td class="col-2">
                                {{ $contact->user->fname . " " . $contact->user->lname}}
                            </td>

                            <td class="col-2">
                                {{ $contact->phone}}
                            </td>

                            <td class="col-4">
                                {{ $contact->message}}
                            </td>

                            <td class="col-2">
                                {{ $contact->created_at}}
                            </td>
                            <td class="col-1">
                                <input type="checkbox" name="" id="" onchange="read(this.parentElement.parentElement, {{$contact->id}})" {{$contact->is_read ? 'checked' : ''}}>
                            </td>
                        </tr>
                    @empty
                        <div class="row">
                            <p class="col-12 h4" style="text-align: center"> @changeLang('There is no contacts yet') </p>
                        </div>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

@endsection

@push('custom-script')
    <script src="{{ asset('frontend/js/jquery.dataTables.min.js') }}"></script>
    <script>
        $('#contactsTbl').DataTable({
            "columnDefs": [{
                "targets": [2, 3, 5],
                "orderable": false
                }],
            "oLanguage": {
                    "sSearch":         "بحث:",
                    "sEmptyTable":     "لا يوجد بيانات",
                    "sLengthMenu":     "أظهر _MENU_ اتصال",
                    "sInfo":           "تم إظهار _START_ إلي _END_ من أصل _TOTAL_ إتصال",
                    "sInfoEmpty":      "تم إظهار عدد 0 اتصال",
                    "oPaginate": {
                        "sFirst":      "الأول",
                        "sLast":       "الأخير",
                        "sNext":       "التالي",
                        "sPrevious":   "السابق"
                    }
            }
        })
    </script>
    <script>
        function read(elem, contact_id){
            if(elem.style.textDecoration == "line-through"){
                elem.style.textDecoration = "none";
            }
            else{
                elem.style.textDecoration = "line-through";
            }
            $.get({
                url: "/user/change-read-status/" + contact_id,
                error: function(result){
                    console.log(result.statusText);
                }
            })
        }
    </script>
@endpush