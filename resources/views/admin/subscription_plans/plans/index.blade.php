@extends('admin.layout.master')
@section('breadcrumb')
    <section class="section">
            <div class="section-header">
            @if(request()->routeIs('admin.plans.index'))
                <h1>@changeLang('All Plans')</h1>
            @else
                <h1>@changeLang('Plans')</h1>

            @endif
            
            </div>
    </section>
@endsection

@section('content')
    <div class="card-header bg-transparent border-0">
        <a href="{{ route('admin.plans.create') }}" class="btn btn-primary"><i class="fa fa-plus"></i>
            @changeLang('Add Plan')</a>
    </div>

<div class="card-body text-center">
    <div class="table-responsive">
        <table class="table table-striped mr-2 ml-2" id="PlansTbl">
            <thead>
                <tr class="row" style="background: #f2f2f2;">
                    <th class="col-1">@changeLang('Sl')</th>
                    <th class="col-1">@changeLang('name')</th>
                    <th class="col-2">@changeLang('description')</th>
                    <th class="col-1">@changeLang('Price')</th>
                    <th class="col-2">@changeLang('Services number')</th>
                    <th class="col-2">@changeLang('Renewals number')</th>
                    <th class="col-1">@changeLang('Period')</th>
                    <th class="col-2">@changeLang('ِAction')</th>
                </tr>
            </thead>

            <tbody>
                @forelse ($plans as $key => $plan)
                <tr class="row" style="{{ $key %2 == 0 ? "background: white" : "background: #f2f2f2"}}">
                    <td class="col-1">
                        {{ $key + 1 }}
                    </td>
                    <td class="col-1">
                        {{ $plan->name }}
                    </td>
                    <td class="col-2">
                        {{ $plan->description }}
                    </td>
                    <td class="col-1">
                        {{ $plan->price }}
                    </td>
                    <td class="col-2">
                        {{ $plan->num_of_services < 0 ? "Unlimited" :  $plan->num_of_services}}
                    </td>
                    <td class="col-2">
                        {{ $plan->num_of_renewals < 0 ? "Unlimited" :  $plan->num_of_renewals}}
                    </td>
                    <td class="col-1">
                        {{ $plan->period }} Months
                    </td>
                    <td class="col-2">
                        <a href="{{ route('admin.plans.edit', $plan->id) }}" class="btn btn-primary"><i
                                class="fa fa-pen"></i></a>
                        <a href="" data-url="{{ url('admin/plans/'. $plan->id )}}"
                            class="btn btn-danger delete"><i class="fa fa-trash"></i></a>
                    </td>
                </tr>

                @empty
                <tr>
                    <td> You haven't added any plans </td>
                </tr>
                @endforelse
            </tbody>


    <div class="modal fade" tabindex="-1" role="dialog" id="delete">
        <div class="modal-dialog" role="document">
            <form action="" method="POST">
                @csrf
                @method("DELETE")
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">@changeLang('Delete Plan')</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p class="text-danger">@changeLang('Are You Sure to Delete this Plan')?</p>
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
        $('#PlansTbl').DataTable({
            "paging":   false,
            "ordering": false,
            "info":     false,
            "searching": false
        });
    </script>
@endpush
