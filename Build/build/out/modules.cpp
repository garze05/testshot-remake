extern "C" void vmInitialiseScript(const char* scriptName);

void RegisterTestID(int id) { /* there are no tests */ }

extern "C" void Setup_GM_GMAudio();
extern "C" void Setup_GM_GMBackground();
extern "C" void Setup_GM_GMExtension();
extern "C" void Setup_GM_GMFiltersAndEffects();
extern "C" void Setup_GM_GMFont();
extern "C" void Setup_GM_GML_Benchmark();
extern "C" void Setup_GM_GML_BindSupport();
extern "C" void Setup_GM_GML_Core();
extern "C" void Setup_GM_GML_Framework();
extern "C" void Setup_GM_GML_GPU();
extern "C" void Setup_GM_GML_ImGUI();
extern "C" void Setup_GM_GML_WebGPU();
extern "C" void Setup_GM_GMParticleSystem();
extern "C" void Setup_GM_GMPath();
extern "C" void Setup_GM_GMRoom();
extern "C" void Setup_GM_GMSequence();
extern "C" void Setup_GM_GMShader();
extern "C" void Setup_GM_GMSprite();
extern "C" void Setup_GM_GMTag();
extern "C" void Setup_GM_GMTexture();
extern "C" void Setup_YoYo_Collision();
extern "C" void Setup_YoYo_Compatibility();
extern "C" void Setup_YoYo_Compatibility_GML_Alarm();
extern "C" void Setup_YoYo_Compatibility_GML_Array();
extern "C" void Setup_YoYo_Compatibility_GML_Audio();
extern "C" void Setup_YoYo_Compatibility_GML_Buffer();
extern "C" void Setup_YoYo_Compatibility_GML_Collision();
extern "C" void Setup_YoYo_Compatibility_GML_Core();
extern "C" void Setup_YoYo_Compatibility_GML_DataTypes();
extern "C" void Setup_YoYo_Compatibility_GML_Date();
extern "C" void Setup_YoYo_Compatibility_GML_Debugger();
extern "C" void Setup_YoYo_Compatibility_GML_Draw();
extern "C" void Setup_YoYo_Compatibility_GML_DS();
extern "C" void Setup_YoYo_Compatibility_GML_Effects();
extern "C" void Setup_YoYo_Compatibility_GML_Encode();
extern "C" void Setup_YoYo_Compatibility_GML_Extension();
extern "C" void Setup_YoYo_Compatibility_GML_File();
extern "C" void Setup_YoYo_Compatibility_GML_Flexpanel();
extern "C" void Setup_YoYo_Compatibility_GML_Font();
extern "C" void Setup_YoYo_Compatibility_GML_Game();
extern "C" void Setup_YoYo_Compatibility_GML_GPU();
extern "C" void Setup_YoYo_Compatibility_GML_Instance();
extern "C" void Setup_YoYo_Compatibility_GML_IO();
extern "C" void Setup_YoYo_Compatibility_GML_JSON();
extern "C" void Setup_YoYo_Compatibility_GML_Math();
extern "C" void Setup_YoYo_Compatibility_GML_Matrix();
extern "C" void Setup_YoYo_Compatibility_GML_Misc();
extern "C" void Setup_YoYo_Compatibility_GML_Network();
extern "C" void Setup_YoYo_Compatibility_GML_Object();
extern "C" void Setup_YoYo_Compatibility_GML_Particles();
extern "C" void Setup_YoYo_Compatibility_GML_Path();
extern "C" void Setup_YoYo_Compatibility_GML_Room();
extern "C" void Setup_YoYo_Compatibility_GML_Sequence();
extern "C" void Setup_YoYo_Compatibility_GML_Skeleton();
extern "C" void Setup_YoYo_Compatibility_GML_Sprite();
extern "C" void Setup_YoYo_Compatibility_GML_String();
extern "C" void Setup_YoYo_Compatibility_GML_Surfaces();
extern "C" void Setup_YoYo_Compatibility_GML_Text();
extern "C" void Setup_YoYo_Compatibility_GML_View();
extern "C" void Setup_YoYo_Compatibility_GML_WAD();
extern "C" void Setup_YoYo_EffectsManager();
extern "C" void Setup_YoYo_ES2020_ArrayBuffer();
extern "C" void Setup_YoYo_ES2020_Atomics();
extern "C" void Setup_YoYo_ES2020_DataView();
extern "C" void Setup_YoYo_ES2020_Date();
extern "C" void Setup_YoYo_ES2020_JSON();
extern "C" void Setup_YoYo_ES2020_Map();
extern "C" void Setup_YoYo_ES2020_Math();
extern "C" void Setup_YoYo_ES2020_Promise();
extern "C" void Setup_YoYo_ES2020_Proxy();
extern "C" void Setup_YoYo_ES2020_Reflect();
extern "C" void Setup_YoYo_ES2020_Set();
extern "C" void Setup_YoYo_ES2020_SharedArrayBuffer();
extern "C" void Setup_YoYo_ES2020_TypedArray();
extern "C" void Setup_YoYo_ES2020_WeakMap();
extern "C" void Setup_YoYo_ES2020_WeakRef();
extern "C" void Setup_YoYo_ES2020_WeakSet();
extern "C" void Setup_YoYo_FontManager();
extern "C" void Setup_YoYo_Input();
extern "C" void Setup_YoYo_JS_WebAPI();
extern "C" void Setup_YoYo_Movement();
extern "C" void Setup_YoYo_ParticleManager();
extern "C" void Setup_YoYo_Physics();
extern "C" void Setup_YoYo_Rendering();
extern "C" void Setup_YoYo_SequenceManager();
extern "C" void Setup_YoYo_SpriteManager();
void InitModules()
{
    Setup_GM_GMAudio();
    Setup_GM_GMBackground();
    Setup_GM_GMExtension();
    Setup_GM_GMFiltersAndEffects();
    Setup_GM_GMFont();
    Setup_GM_GML_Benchmark();
    Setup_GM_GML_BindSupport();
    Setup_GM_GML_Core();
    Setup_GM_GML_Framework();
    Setup_GM_GML_GPU();
    Setup_GM_GML_ImGUI();
    Setup_GM_GML_WebGPU();
    Setup_GM_GMParticleSystem();
    Setup_GM_GMPath();
    Setup_GM_GMRoom();
    Setup_GM_GMSequence();
    Setup_GM_GMShader();
    Setup_GM_GMSprite();
    Setup_GM_GMTag();
    Setup_GM_GMTexture();
    Setup_YoYo_Collision();
    Setup_YoYo_Compatibility();
    Setup_YoYo_Compatibility_GML_Alarm();
    Setup_YoYo_Compatibility_GML_Array();
    Setup_YoYo_Compatibility_GML_Audio();
    Setup_YoYo_Compatibility_GML_Buffer();
    Setup_YoYo_Compatibility_GML_Collision();
    Setup_YoYo_Compatibility_GML_Core();
    Setup_YoYo_Compatibility_GML_DataTypes();
    Setup_YoYo_Compatibility_GML_Date();
    Setup_YoYo_Compatibility_GML_Debugger();
    Setup_YoYo_Compatibility_GML_Draw();
    Setup_YoYo_Compatibility_GML_DS();
    Setup_YoYo_Compatibility_GML_Effects();
    Setup_YoYo_Compatibility_GML_Encode();
    Setup_YoYo_Compatibility_GML_Extension();
    Setup_YoYo_Compatibility_GML_File();
    Setup_YoYo_Compatibility_GML_Flexpanel();
    Setup_YoYo_Compatibility_GML_Font();
    Setup_YoYo_Compatibility_GML_Game();
    Setup_YoYo_Compatibility_GML_GPU();
    Setup_YoYo_Compatibility_GML_Instance();
    Setup_YoYo_Compatibility_GML_IO();
    Setup_YoYo_Compatibility_GML_JSON();
    Setup_YoYo_Compatibility_GML_Math();
    Setup_YoYo_Compatibility_GML_Matrix();
    Setup_YoYo_Compatibility_GML_Misc();
    Setup_YoYo_Compatibility_GML_Network();
    Setup_YoYo_Compatibility_GML_Object();
    Setup_YoYo_Compatibility_GML_Particles();
    Setup_YoYo_Compatibility_GML_Path();
    Setup_YoYo_Compatibility_GML_Room();
    Setup_YoYo_Compatibility_GML_Sequence();
    Setup_YoYo_Compatibility_GML_Skeleton();
    Setup_YoYo_Compatibility_GML_Sprite();
    Setup_YoYo_Compatibility_GML_String();
    Setup_YoYo_Compatibility_GML_Surfaces();
    Setup_YoYo_Compatibility_GML_Text();
    Setup_YoYo_Compatibility_GML_View();
    Setup_YoYo_Compatibility_GML_WAD();
    Setup_YoYo_EffectsManager();
    Setup_YoYo_ES2020_ArrayBuffer();
    Setup_YoYo_ES2020_Atomics();
    Setup_YoYo_ES2020_DataView();
    Setup_YoYo_ES2020_Date();
    Setup_YoYo_ES2020_JSON();
    Setup_YoYo_ES2020_Map();
    Setup_YoYo_ES2020_Math();
    Setup_YoYo_ES2020_Promise();
    Setup_YoYo_ES2020_Proxy();
    Setup_YoYo_ES2020_Reflect();
    Setup_YoYo_ES2020_Set();
    Setup_YoYo_ES2020_SharedArrayBuffer();
    Setup_YoYo_ES2020_TypedArray();
    Setup_YoYo_ES2020_WeakMap();
    Setup_YoYo_ES2020_WeakRef();
    Setup_YoYo_ES2020_WeakSet();
    Setup_YoYo_FontManager();
    Setup_YoYo_Input();
    Setup_YoYo_JS_WebAPI();
    Setup_YoYo_Movement();
    Setup_YoYo_ParticleManager();
    Setup_YoYo_Physics();
    Setup_YoYo_Rendering();
    Setup_YoYo_SequenceManager();
    Setup_YoYo_SpriteManager();
}

void RunModules()
{
}