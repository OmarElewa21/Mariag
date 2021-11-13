@extends('admin.layout.master')
@section('breadcrumb')
    <section class="section">
            <div class="section-header">
            @if(request()->routeIs('admin.subscriptions.index'))
                <h1>@changeLang('All Subscriptions')</h1>
            @else
                <h1>@changeLang('Subscriptions')</h1>

            @endif
            
            </div>
    </section>
@endsection

@section('content')
    <div class="card-header bg-transparent border-0">
        <a href="{{ route('admin.subscriptions.create') }}" class="btn btn-primary"><i class="fa fa-plus"></i>
            @changeLang('Add Subscription')</a>
    </div>

<div class="card-body text-center">
    <div class="table-responsive">
        <table class="table table-striped mr-2 ml-2" id="subsriptions_table">
            <thead>
                <tr class="row" style="background: #f2f2f2;">
                    <th class="col-1">@changeLang('Sl')</th>
                    <th class="col-2">@changeLang('Provider name')</th>
                    <th class="col-2">@changeLang('Provider email')</th>
                    <th class="col-2">@changeLang('Plan name')</th>
                    <th class="col-2">@changeLang('Ends at')</th>
                    <th class="col-1">@changeLang('Valid')</th>
                    <th class="col-2">@changeLang('ِAction')</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($subscriptions as $key => $subscription)
                <tr class="row" style="{{ $key %2 == 0 ? "background: white" : "background: #f2f2f2"}}">
                    <td class="col-1">
                        {{ $key + 1 }}
                    </td>
                    <td class="col-2">
                        {{ $subscription->user->fname . " " . $subscription->user->lname}}
                    </td>
                    <td class="col-2">
                        {{ $subscription->user->email }}
                    </td>
                    <td class="col-2">
                        {{ $subscription->plan->name }}
                    </td>
                    <td class="col-2">
                        {{ $subscription->ends_at }}
                    </td>
                    <td class="col-1">
                        <i class="{{ $subscription->has_ended ? 'fas fa-times btn btn-danger' : 'fas fa-check btn btn-primary'}}"></i>
                    </td>
                    <td class="col-2">
                        <a href="{{ route('admin.subscriptions.edit', $subscription->id) }}" class="btn btn-primary"><i
                                class="fa fa-pen"></i></a>
                        <a href="" data-url="{{ url('admin/subscriptions/'. $subscription->id )}}"
                            class="btn btn-danger delete"><i class="fa fa-trash"></i></a>
                    </td>
                </tr>
                @empty
                <tr>
                    <td style="text-align: center"> There are no Subscriptions </td>
                </tr>
                @endforelse
            </tbody>
        </table>

    <div class="modal fade" tabindex="-1" role="dialog" id="delete">
        <div class="modal-dialog" role="document">
            <form action="" method="POST">
                @csrf
                @method("DELETE")
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">@changeLang('Delete Subscription')</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p class="text-danger">@changeLang('Are You Sure to Delete this Subscription')?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">@changeLang('Close')</button>
                        <button type="submit" class="btn btn-danger">@changeLang('Delete')</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection


@push('custom-script')
<script src="{{ asset('frontend/js/jquery.dataTables.min.js') }}"></script>
    <script>
        $(function() {
            'use strict'

            $('.delete').on('click', function(e) {
                e.preventDefault();
                const modal = $('#delete');
                modal.find('form').attr('action', $(this).data('url'));
                modal.modal('show');
            })
        })
        $('#subsriptions_table').DataTable({
            "paging":   false,
            "ordering": false,
            "info":     false
        });
        $('.dataTables_filter label').css("float", "right");
        $('.dataTables_filter input').css({"margin-left":"10px", "border-radius":"10px"});
    </script>
@endpush
