<?php

namespace App\Http\Controllers;

use App\Models\BlogCategory;
use App\Models\BlogComment;
use App\Models\Booking;
use App\Models\Category;
use App\Models\GeneralSetting;
use App\Models\Language;
use App\Models\Page;
use App\Models\Review;
use App\Models\SectionData;
use App\Models\Service;
use App\Models\Subscribe;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Purifier;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Mail;
use App\Mail\Contact;
use App\Models\Admin;

class HomeController extends Controller
{
    public function index()
    {
        $pageTitle = 'Home';

        $sections = Page::where('name','home')->first();

        if(!$sections){

            $sections = Page::create([
                'name' => 'home',
                'sections'=>['blog'],
                'slug' => 'home',
                'seo_title' => 'home',
                'seo_description'=>'home',
                'page_order' => 1
            ]);

        }

        return view('frontend.home',compact('pageTitle','sections' ));
    }

    public function pages(Request $request)
    {
        $page = Page::where('slug',$request->pagename)->first();

        if(!$page){
            abort(404);
        }

        $pageTitle = "{$page->name}";

        return view('frontend.pages',compact('pageTitle','page'));
    }


    public function contact()
    {
        $pageTitle = 'Contact Us';

        $contact = content('contact.content');
        
        return view('frontend.contact',compact('pageTitle','contact'));
    }

    public function contactSend(Request $request)
    {
        $general = GeneralSetting::first();
        $data= $request->validate([
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'subject' => 'required',
            'message' => 'required',
            'g-recaptcha-response'=>Rule::requiredIf($general->allow_recaptcha== 1)
        ],[
            'g-recaptcha-response.required' => 'You Have To fill recaptcha'
        ]);

        // sendGeneralMail($data);
        $admins = Admin::all();
        foreach($admins as $admin){
            Mail::to($admin)->send(new Contact($data));
        }

        $notify[] = ['success','Contact With us successfully'];

        return back()->withNotify($notify);
    }

    public function subscribe(Request $request)
    {
        $validator = Validator::make($request->all(),['email'=>'required|email|unique:subscribes,email']);
        
        if($validator->fails()){
            return response()->json(['fails' => true, 'errorMsg' => $validator->getMessageBag()]);
        }

        Subscribe::create(['email'=> $request->email]);

        return response()->json(['success' => true, 'successMsg' => changeDynamic('Successfully Subscribe to our System')]);

    }

    public function categoryDetails(Request $request)
    {
        
        $category = Category::where('status',1)->where('slug',$request->slug)->firstOrFail();

        $pageTitle = $category->name;

        $users = User::where('user_type',2)->whereHas('services.category',function($q) use($category){
            $q->where('id', $category->id);
        })->inRandomOrder()->get();

        return view('frontend.category_details_updated',compact('pageTitle','users'));
    }

    public function userDetails($user)
    {
       
        $user = User::where('slug',$user)->firstOrFail();

        $pageTitle ="{$user->fullname}";

        $services = $user->services()->where('status',1)->where('admin_approval',1)->get();

        $workingHour = $user->schedules()->where('status',1)->get()->groupBy('week_name');

        $rating = Review::whereIn('service_id',$services->pluck('id')->toArray())->avg('review');

        $jobSuccess = Booking::whereIn('service_id',$services->pluck('id')->toArray())->where('is_completed',1)->count();

        return view('frontend.provider_details', compact('pageTitle','user','services','workingHour','rating','jobSuccess'));
    }

    public function experts()
    {
        $pageTitle = 'Our Experts';

        return view('frontend.experts',compact('pageTitle','experts'));
    }

    public function searchExperts(Request $request)
    {
        if(!$request->has('search') || !$request->has('category') || !$request->has('location')){
            $notify[] = ['error','Invalid Parameters'];
            return redirect()->route('home')->withNotify($notify);
        }
        elseif(is_null($request->search) && is_null($request->category) && is_null($request->location)){
            $notify[] = ['error', 'Please add a search input'];
            return redirect()->route('home')->withNotify($notify);
        }
        else{
            $search =$request->search;
            $categorySearch = $request->category;
            $location = $request->location;

            $pageTitle = 'Your Searched Experts';

            $services = Service::where('status',1)
                ->where('admin_approval',1)
                ->where('location','LIKE',"%$location%")
                ->whereHas('user', function($q) use($search){
                    $q->where('status',1)->serviceProvider()->where(DB::raw('concat(fname," ",lname)'), 'LIKE', "%$search%");
                })
                ->whereHas('category', function($q) use($categorySearch){
                    $q->where('name', 'LIKE',  "%".$categorySearch."%");
                })->get();
            return view('frontend.category_details_updated',compact('pageTitle', 'services'));
        }
    }


    public function categoryAll()
    {
        $pageTitle = "All Categories";

        $services = Service::where('status',1)->where('admin_approval',1)->groupBy('category_id')->paginate(9);

        return view('frontend.all_category',compact('pageTitle','services'));
    }

    public function blog()
    {
        $pageTitle = "Blog";

        $blogs = SectionData::where('key','blog.element')->latest()->paginate(9);

        return view('frontend.all_blog',compact('pageTitle','blogs'));
    }

    public function blogDetails(Request $request)
    {
        $data = str_replace('-',' ',$request->blog);


        $blog = SectionData::where('key','blog.element')->where('data->heading', $data)->withCount('blogComments')->firstOrFail();


        $recentPosts = SectionData::where('id','!=',$blog->id)->where('key','blog.element')->latest()->take(10)->get();

        $categories = BlogCategory::whereHas('blogs')->latest()->get();

        $pageTitle = "Blog Details";

        return view('frontend.blog_details',compact('blog','pageTitle','categories','recentPosts'));
    }

    public function blogComment(Request $request)
    {
        $blog = SectionData::findOrFail($request->id);

        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'phone' => 'required',
            'comment' => 'required'
        ]);

        BlogComment::create([
            'blog_id' => $blog->id,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'comment' => $request->comment
        ]);

        $notify[] = ['success','successfully placed your comment'];

        return back()->withNotify($notify);

    }

    public function blogCategory(Request $request)
    {
        $blogCategory = BlogCategory::where('slug',$request->category)->firstOrFail();

        $blogs = SectionData::where('key','blog.element')->where('category',$blogCategory->id)->latest()->paginate(9);
    
        $pageTitle = "{$request->category}";


        return view('frontend.category_blog',compact('pageTitle','blogs'));
    }

    public function policy(Request $request)
    {
        $policy = SectionData::where('key','policy.element')->where('data->slug',$request->policy)->firstOrFail();


        $pageTitle = $policy->data->pagename;

        return view("frontend.sections.policy",compact('pageTitle','policy'));
    }

    public function serviceDetails(Request $request)
    {
        if(!is_null($request->category_id)){
            $category = Category::find($request->category_id);
            $pageTitle = "{$category->name}";
            $services = Service::where('category_id', $request->category_id)->where('status',1)->where('admin_approval',1)->groupBy('user_id')->with('user')->inRandomOrder()->get();
            return view('frontend.category_details_updated',compact('pageTitle','services'));
        };
        $service = Service::where('id',$request->id)->where('status',1)->with('user')->withCount('reviews')->firstOrFail();

        $pageTitle = "{$service->name}";

        return view('frontend.service_details',compact('pageTitle','service'));
    }

    public function sendproviderMail(Request $request)
    {
        $general = GeneralSetting::first();
        $data = $request->validate([
            'name'  => 'required',
            'phone' =>  'required',
            'g-recaptcha-response'=>Rule::requiredIf($general->allow_recaptcha== 1)
        ],[
            'g-recaptcha-response.required' => 'You Have To fill recaptcha'
        ]);

        $provider = User::where('id', $request->id)->where('user_type', 2)->where('status',1)->firstOrFail();
        $user = auth()->user();
        $data['email'] = $user->email;
        $data['message'] = $request->message;
        // sendGeneralMail($data);
        Mail::to($provider)->send(new Contact($data));

        $notify[] = ['success','Email Send Successfully'];

        return redirect()->back()->withNotify($notify);
    }


    public function writeReview(Request $request,Service $service)
    {
        $general = GeneralSetting::first();
        
        $request->validate([
            'review' => 'required|integer|between:1,5',
            'review_comment' => 'required',
            'g-recaptcha-response'=>Rule::requiredIf($general->allow_recaptcha== 1)
        ],[
            'g-recaptcha-response.required' => 'You Have To fill recaptcha'
        ]);

        $isServiceBooked = auth()->user()->bookings()->whereHas('service.user',function($q) use($service){
            $q->where('id',$service->user->id);
        })->where('payment_confirmed',1)->count();

        if($isServiceBooked == 0){
            $notify[] = ['error','You can not review without taking any service'];

            return back()->withNotify($notify);
        }

        if($service->user_id == auth()->id()){
            $notify[] = ['error','You can not Review Your Own Service'];

            return back()->withNotify($notify);
        }

        $isReviewd = Review::where('user_id',auth()->id())->where('service_id', $service->id)->count();

        if($isReviewd > 0){
            $notify[] = ['error','You already Review this service'];

            return back()->withNotify($notify);
        }

        Review::create([
            'service_id' => $service->id,
            'user_id' => auth()->id(),
            'review' => $request->review,
            'review_message' => $request->review_comment
        ]);


        $notify[] = ['success','Successfully Reviewed this service'];

        return back()->withNotify($notify);
        
    }

   
}
