@extends('frontend.layout.master')

@section('breadcrumb')
    <section class="section">
        <div class="section-header">
                <h1>@changeLang('Contacts')</h1>
        </div>
    </section>
@endsection

@push('custom-style')
    <link rel="stylesheet" href="{{ asset('frontend/css/datatable.min.css') }}">
@endpush

@section('content')

    <div class="card-body text-right">
        <div class="table-responsive">
            <table class="table table-striped" id="contactsTbl">
                <thead>
                    <tr>
                        <th class="col-1">@changeLang('Sl')</th>
                        <th class="col-2">@changeLang('Client Name')</th>
                        <th class="col-2">@changeLang('Client Number')</th>
                        <th class="col-5">@changeLang('Message')</th>
                        <th class="col-2">@changeLang('Date')</th>
                    </tr>
                </thead>

                <tbody>
                    @forelse ($contacts as $key=>$contact)
                        <tr style="{{ $key %2 == 0 ? "background: white" : "background: #f2f2f2"}}">
                            <td class="col-1">
                                {{ $key + 1 }}
                            </td>

                            <td class="col-2">
                                {{ $contact->user->fname . " " . $contact->user->lname}}
                            </td>

                            <td class="col-2">
                                {{ $contact->phone}}
                            </td>

                            <td class="col-5">
                                {{ $contact->message}}
                            </td>

                            <td class="col-2">
                                {{ $contact->created_at}}
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
@endpush