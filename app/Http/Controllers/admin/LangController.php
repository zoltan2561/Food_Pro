<?php
  
namespace App\Http\Controllers\admin;
  
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App;
use App\Models\Languages;
use Illuminate\Support\Facades\Validator;
  
class LangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
    */

    public function index(Request $request)
    {
        
        $getlanguages = Languages::where('is_available','1')->get();

        if($request->code == "") {
            foreach($getlanguages as $firstlang)
            {
                $currantLang = Languages::where('code',$firstlang->code)->first();
                break;
            }
        } else {
            $currantLang = Languages::where('code',$request->code)->first();
        }
        $dir = base_path() . '/resources/lang/' . $currantLang->code;
        
        if(!is_dir($dir))
        {
            $dir = base_path() . '/resources/lang/en';
        }
        $arrLabel   = json_decode(file_get_contents($dir .'/'.'labels.json'));

        $arrMessage   = json_decode(file_get_contents($dir .'/'.'messages.json'));
        $arrCheckout = is_file($dir . '/checkout.php') ? require $dir . '/checkout.php' : [];

        return view('admin.language.index',compact('getlanguages','currantLang','arrLabel','arrMessage','arrCheckout'));
    }

    public function language(Request $request)
    {
        $getlanguages = Languages::where('is_available','1')->get();

        if($request->code == "") {
            foreach($getlanguages as $firstlang)
            {
                $currantLang = Languages::where('code',$firstlang->code)->first();
                break;
            }
        } else {
            $currantLang = Languages::where('code',$request->code)->first();
        }
        $dir = base_path() . '/resources/lang/' . $currantLang->code;
        
        if(!is_dir($dir))
        {
            $dir = base_path() . '/resources/lang/en';
        }
        $arrLabel   = json_decode(file_get_contents($dir .'/'.'labels.json'));

        $arrMessage   = json_decode(file_get_contents($dir .'/'.'messages.json'));
        $arrCheckout = is_file($dir . '/checkout.php') ? require $dir . '/checkout.php' : [];

        return view('admin.language.index',compact('getlanguages','currantLang','arrLabel','arrMessage','arrCheckout'));
    }

    public function storeLanguageData(Request $request)
    {
        $data = $request->validate([
            'currantLang' => 'required|string|max:12',
            'file' => 'required|in:label,message,checkout',
            'label' => 'required_if:file,label|array',
            'message' => 'required_if:file,message|array',
            'checkout' => 'required_if:file,checkout|array',
        ]);
        abort_unless(Languages::where('code', $data['currantLang'])->exists(), 404);

        $base = $data['file'] === 'label' ? 'labels' : ($data['file'] === 'message' ? 'messages' : 'checkout');
        $directory = base_path('resources/lang/' . $data['currantLang']);
        abort_unless(is_dir($directory), 404);
        $phpPath = $directory . '/' . $base . '.php';
        $jsonPath = $directory . '/' . $base . '.json';
        $existing = $base === 'checkout'
            ? require $phpPath
            : json_decode(file_get_contents($jsonPath), true, 512, JSON_THROW_ON_ERROR);
        $submitted = $data[$data['file']];
        foreach ($existing as $key => $value) {
            if (array_key_exists($key, $submitted) && (is_string($submitted[$key]) || is_null($submitted[$key]))) {
                $existing[$key] = (string) $submitted[$key];
            }
        }

        file_put_contents($phpPath, "<?php\n\nreturn " . var_export($existing, true) . ";\n", LOCK_EX);
        if ($base !== 'checkout') {
            file_put_contents($jsonPath, json_encode($existing, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_THROW_ON_ERROR) . "\n", LOCK_EX);
        }
        return redirect()->back()->with('success', trans('messages.success'));
    }
    public function layout(Request $request)
    {
        $language = Languages::find($request->id);
        $language->layout = $request->status;
        $language->save();
        if($language){
            return 1;
        }else{
            return 0;
        }
    }

    public function edit($id)
    {
        $getlanguage = Languages::where('id',$id)->first();
        return view('admin.language.edit',compact('getlanguage'));
    }

    public function update(Request $request,$id)
    {
        try {
            $validator = Validator::make($request->all(),[
                'layout'=> 'required',
            ],[
                "layout.required"=>trans('messages.layout_required'),
            ]);
            if ($validator->fails()){
                return redirect()->back()->withErrors($validator)->withInput();
            }else{
                $default = 2;
                if($request->default == 1) {
                    Languages::where('is_default','1')->update(array('is_default' => 2));
                    $default = $request->default;
                }
                $language = Languages::where('id',$id)->first();
                $language->layout = $request->layout;
                $language->is_default = @$default;
                if ($request->has('image')) {
                    $flagimage = 'flag-' . uniqid() . "." .$request->file('image')->getClientOriginalExtension();
                    $request->file('image')->move(public_path('admin-assets/images/language/'),$flagimage);
                    $language->image = $flagimage;
                }
                $language->update();
                return redirect('admin/language-settings')->with('success', trans('messages.success'));
            }
        } catch (\Throwable $th) {
            return redirect('admin/language-settings')->with('error', trans('messages.wrong'));
        }
    }

    

    // Language change from header
    public function change(Request $request)
    {
     
        $layout = Languages::select('name','layout','image')->where('code', $request->lang)->first();
        App::setLocale($request->lang);
        session()->put('locale', $request->lang);
        session()->put('language', $layout->name);
        session()->put('flag', $layout->image);
        session()->put('direction', $layout->layout);
        return redirect()->back();
    }

    public function delete(Request $request){
    
        $Languages = Languages::where('id', $request->id)->first();
        
        $updateLanguages = Languages::where('id', $request->id)->update( array('is_available'=> $request->status) );
        if ($updateLanguages) {
            if(file_exists(public_path('admin-assets/images/Languages/').$Languages->image)){
                unlink(public_path('admin-assets/images/Languages/').$Languages->image);
            }
            return 1;
        } else {
            return 0;
        }
    }

   
}
