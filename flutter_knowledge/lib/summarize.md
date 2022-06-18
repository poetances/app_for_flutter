2019.8.6
1、手势。GestureDecorator、Inkwell、Listener几个监听手势。可以配合Transform使用。
2、Transform的使用。一般不直接使用，因为内部嵌套的Matrix4使用比较麻烦。
配合暴露的方法。Transform.rotation、Transfor.scale、Transform.translate使用起来会方便很多。
3、动画。牵扯到几个关键类。AnimatedController、Animatable（通过插值类Tween及其衍生类获取的）、Animation（通过Animatable获取）。
真正进行动画的可以有几种方式。Animation.addListen(){ setState() }、使用xxxTransition、使用Animatedxxxx(如AnimatedContainer等，这种实现方式需要利用其value值)。
4、线程问题。Future类。Dart中，事件循环的两个主要事件类，MicroTask和EventTask，我们需要知道其工作方式。
Future()、Future.microTask() 创建异步线程。这里需要注意的是：创建的异步线程都是串行队列。
dart/ioslate 可以创建并发队列。但是不同线程间的传递有点麻烦。
sleep() 函数，存放在dart/io里面。
5、IO操作。File类操作文件、Director类操作文件夹。
Director操作文件夹其实很简单。
File类，操作文件。牵扯到两种情况，其实和其它语言一样。字符流操作、字节流操作。
字符流：直接调用其方法。字符流，只能用于操作文本文件，因为其内部原理，相当于将字节转为字符，然后在将字符转字节，所以如果有比如音频文件，
那么转字符的时候会出现乱码。导致文件孙华。
字节流：牵扯到读流Stream、写流IOSink。
6、Regex。正则表达式。


2019.8.7
1、Overlay和OverlayEntry的搭配使用。Overlay的本质就是MeteralApp会创建一个Stack组件，内部包含了OverLay。
2、Materail控件的使用。
3、ReorderListView。用于cell间的位置交换。需要注意onReorder方法的实现。
4、Dismissable的使用。注意是滑动删除。
5、DataTable的使用。用于数据的展示。但是其样式比较固定。可能不会直接使用，或者使用需要进行改动。


2019.8.8
1、Form搭配FormTextField使用。其作用是，可以用来进行字段校验validation。
2、extents、with、implement三个关键字的区别。
extents继承，当父类方法没有实现，那么就必须重写。
implement不管父类有没有实现，其子类都需要实现。
wit比较特殊，当我们像要实现多继承的时候，需要用到with关键字。而且with后面的，如果是class，那么就必须要继承Object类。如果继承的不是Object类，
需要用到关键字mixin和on来实现。
flutter 没有interface关键字。我们可以使用abstract和mixin进行替代。当然官方解释，所有的class都可以作为interface。

3、字符串String = r"xxxxx \n xxxxx"; 创建的raw字符。里面的所以字符都是字符比如\n就是字符，而不是换行。正则表达式可以使用。其实类似\n前面加\。
即\\n。
4、const修饰List数组，那么就不能向里面添加内容。const 修饰construction函数。那么其属性都必须是final类型的。
const相对于final，其不可变是会传递的。比如，用final修饰 数组，数组还是可以变的。但是const修饰那么数组是不会变的。
总的来说，const限制条件更加苛刻。
5、函数中的参数，有可选命名参数和可选位置参数。主要是参数名字是否写上的问题。可选位置参数是不需要写的，可选命名参数需要写。
6、factory工厂构造方法。 和其它的构造方法的区别就是。factory构造方法需要手动return 对象。
7、ListView可以通过。buildChildLayout来将其转换为，SliderListView。
8、Opacity控件。SingleChildRenderObjectWidget。
9、继承自Widget的有，StatelessWidget、StatefullWidget、RenderObjectWidget。其中：
RenderObjectWidget有三个子类，SingleChildRenderObjectWidget、LeafRenderObjectWidget、MulitChirldRenderObjectWidget。
我们使用的所有Widget的本质，其实就是上面三种。但是我们接触的一些Widget会发现经常继承StateLessWidget、StateFullWidget，这些widget会调用
build方法，而系统的一些Widget的build的实现还是RenderObjectWidget。比如Text是StatelessWidget，但在build方法中，会创建RichText，
而RichText是SingleChirldRenderObjectWidget。
所以说，真正搬砖的是我们这些程序员。
10、Widget、Element、RenderObject关系。Widget配置信息，Element显示的控件，而使其显示的绘画过程右RenderObject来完成。
其实是Element将RenderObject挂载到RenderTree上面。

2019.8.9
1、MethodChannel实现native和flutter进行交互。
2、PreferrSize对Appbar进行包裹，可以设置appbar的高度。PreferSize单独使用并不会限制子控件的尺寸，只是表明了想要子控件呈现的高度。
3、PreferSizeWidget，抽象类。其实现该类的有，AppBar、ToolBar、PreferSize。
4、WidgetsBindingObserver用来监听app的状态。其中有几个方法需要知道其作用：
didChangeMetrics() 尺寸改变。横竖屏、键盘弹出。
didChangeAppLifecycleState() app状态改变。前后台方面。
5、State的deactivate()方法，是在widget从widgteTree中移除的时候调用。会在dispose()方法调用前调用。
6、Context.size 获取widget的尺寸，前提是build（）结束。
7、context.findRenderObject()  获取widget相应的RenderObject。
8、window和MeidaQueyaData都能获取设备的一些信息。

2019.8.12
1、widget中key的作用。主要是确定widget相对应的ElementTree中的Element是通过什么方式来进行更新的。如果Widget的runtimeType和key都相等，
那么Widget的canUpdate方法返回true。相应的Element会通过update方法来进行更新。如果不同，那么会通过Element的remove、add的方式更新。
2、Element的生命周期。
a、框架通过widget的creatElement创建element。
b、然后框架调用mount方法，将element添加到element tree中。并且会根据需要，调用attachRenderObject方法，将相对应的renderObject添加到
Render tree中。此时，element变为 active状态。
c、如果widget进行了rebuild，那么会通过widget的runtimeType和key来判断element是进行update还是进行remove操作。如果remove那么element
变成无效状态。并且会将其从element tree中进行卸载。
3、RenderObject类是负责渲染的（主要包括布局和绘制）。因为其没有坐标系，所以我们一般使用其子类RenderBox（内置一个笛卡尔坐标系和原生ios、android坐标系一样）。
一般情况，自定义UI。我们通过自定义Widget和CustomPaint就能够实现。但是，如果需要特殊情况，我们可以通过继承RenderBox来实现。
4、时间DateTime。通过showDatetimePicker 可以显示日期选择器。 TimeOfDay。通过showTimeOfPicker() 显示时间选择器。
5、Timer定时器。在dart：async库中。方法很简单，创建延迟调用和重复调用的两种情况。
6、Theme。默认MaterialApp有一个默认主题。同时我们可以使用Theme这个Widget进行局部主题设置。
所以Theme都是由ThemeDate来进行数据管理的。 有几个重要方法，copy、of(context)。
ThemeData(
primarySwatch: Colors.purple, //样本颜色。其很多主题受此影响。
accentColor: Colors.purple, // 文本、按钮。
accentColorBrightness: Brightness.light, // 亮度。
primaryColor: Colors.purple, // 主要颜色。Appbar、TabBar。
textTheme: TextTheme(
button: TextStyle(fontSize: 20)
)
); // 常用的可能就这么多。内部有很多配置，其实在使用的时候在进行配置就可以。
7、关键字。
show、hidden一般用于import 'xxxx' show/hidden xx;  表示使用库中的一部分。 比如.dart 文件中有多个类，我们可以通过使用
show（导入整个库中的 xxxx）、hidden（导入整个库除了xxxx）来进行选择导入指定的类。

    final 会进行类型推导。

    as、is、is！其中is和is！很好理解，就是判断是是否是一个类或其子类。其实就是oc中，isMemberOf和isKindOf两个的结合体。
    as有两个用途。1、类型转换。向下转换。(superClass as subClass).xxxx父类转子类，调用其子类方法。
                2、给指定.dart文件添加前缀。
                    import 'aaa.dart';
                    impoot 'bbb.dart';
                    如果aaa.dart 和bbb.dart中，同时有相同类xxx。那么我们使用xxx去创建的时候就有问题。此时可以通过
                    import 'bbb.dart' as B; 那么使用bbb.dart中的类就需要通过B.xxxx 来进行创建。有点类似swift中的命名空间。

    mixin on / with（混入。如果类没有是实现，那么就必须要实现） implements(和java一样必须要实现) extents（继承）。
    mixin on xxx 指定只有实现了on 后面的xxx才能进行混入，on其实也就是进行了混入限定。 常用于继承state类。
    with后面的类有一个特点：如果with后面是class，那么class必须是继承自Object类。所以，这大概就是引入mixin on的原因吧。

    typedef 和其它语言的typedef的作用没什么区别。但是语法有些不同。比如oc中，我们可以声明任意类型、block： typedef int xxx;
    dart中只能声明函数。typedef XXX = xx Function();

    defferred as 常用语import 'xxxxx.dart' defferred as XXX;表示该库为延时加载库，通常还需要给其重命名。

    covariant 协变。

    operator 操作符。如果我们想要一些操作符比如 + - == 等操作符，需要用该关键字，比如重写==方法。
    @override
      bool operator ==(other) {
        // TODO: implement ==
        return true;
      }

2019.8.13
1、Android Studio调试。 Systerm.out.println("xxxxx"); 比如断点打在这个位置：
a、step over（使用比较频繁）。表示我们println方法视为一步，越过该函数（该函数执行完毕）执行下一步。
b、step into。 跟上面的刚好相反，它会进入println方法内部执行。（严格意义上的一步一执行）。
c、force step into。 感觉和step into效果一样。
d、step out。一般配合step into使用。表示跳出进入的函数。step into和step out成对使用，其实就是step over的效果。
e、step to curse。 执行到光标所在位置。这个就很好理解。

    上面是比较基础的调试。像一些高级调试技巧：
    a、Evaluate Expression。就是step to curse右边的小计算器。功能很强大。我们可以通过输入一些调教，来获取相应的输出。
    b、条件断点。我们可以给断点输入条件，来进行筛选。比如for循环中，我们使用条件断点。
    c、异常断点。xcode其实也有这个功能。通过Run->View breakPoints来进行添加。这样就能够更加准确的定位错误信息。


2019.9.9
1、flutter中，set & get。
默认添加属性（非私有），系统会提供set、get方法。我们通过.语法可以调用set和get。这个和oc的原理很像。和java就很不一样。java中的点语法
其实是直接访问成员变量，java虚拟机并不会给其添加set、get方法，如果想要添加，我们需要手动添加set、get方法。

    flutter中，点语法的写法。 String get name {}, set name(String xx){} 后面大括号可以使用 => 来代替。
2、 flutter中，资源文件的控制。通过 pubspec.yaml 文件，来指定资源文件路径如下，assets就是我们穿件的文件夹（当然，我们不一定非要使用这个名字）。
assets:
- assets/
我们通过import 'package:flutter/services.dart'; 文件下面，我们可以使用rootAssetBundle 或者 PlateFormAssetBundle来获取pubspec.yaml指定
的资源路径。
3、 对fullter， StreamController的理解。 StreamController相当于一机器，该机器有入口sink（StreamSink）， 出口stream（Stream），
通过sink.add 添加数据， stream.listen（StreamSubscribe） 来监听数据。
StreamController两种初始化方法，StreamController()单订阅，即只能调用一次listent，取消后不能再次监听 和 StreamController.broadcast()广播，即可以多次listent。
StreamController注意关闭。
4、Theme和ThemeDate的搭配使用可以有效的控制主题。

2019.9.10
1、widget树间的传值。
自上向下——继承自InheritedWidget实现。 我们常用的MediaQurey其实就是继承自InheritedWidget的。
其实自上向下传值，我们直接借助参数传值也是可以实现的。
自下向上——继承自Notifycation配合，NotifycationLisent实现。
2、通过WidgetBindingObserver需要配合WidgetBing.instance.addOberser(this)；来实现一些监听。当然，我们也可以直接使用，
WidgetBinding.instance.addxxxxxxxxx来进行一些监听。
3、dart:math 库中，Random()生产随机数类、pi、常用函数。
4、Transfom.translate( chirld: GestureDecrator() )。 Transform.translate搭配GestureDecorater使用，可以进行拖动动画等。
5、AnmatedList可删除、增加的Widget的使用。主要是globleKey、数据、动画的搭配使用。
关于动画，Animation本身是一个抽象类。我们一般使用Tween插值(Animationable)动画来获取Animation。有一个drive方法。

2019.9.11
1、Material控件的使用。
2、Image和ImageProvider的区别。Image通过Image.asset等方法获取，ImageProvider通过AssetImage等获取。FadeInImage可以添加占位图。
3、自定义路由。PageRouteBuilder的使用，注意蒙版的使用。
4、圆形/圆角。圆形：ClipOvral、CircleAdapte。 圆角：ClipRRect。
5、ShaderMask添加蒙版。 注意Shade着色，可以通过Griender.createShader来进行获取。
6、直接使用 .0表示一个浮点型数据。

2019.9.12
1、源于Picker的使用，flutter自带，MonthPicker、DayPicker、TimePicker等，一般不会直接使用，通过show来实现。
2、CupertenoPicker一般不会直接使用，需要通过showCupertenoModalPopup()来实现。
3、Scaffold脚手架有几个重要方法，Scaffold.of(Context).showSnakeBar/showBottomSheetxxxxx/showBodyScrim(显示一个蒙版)，主要可以成功是因为，Scaffold在源码里面，
有添加相应的控件，便于我们使用。
1、我们可以从其中学习到其中的设计思路。 当调用show的时候，会调用其setState，而setState里面会添加相应的标识，在build的时候，通过相应的
标识，来确定界面显示方式。

2019.9.16
1、Flutter中，提供的show方法的使用。
showGeneralDiaolog，这个是最原始的方法。其中，showDiaolog、ShowCupetenoDialog、showDatePicker等都是直接或间接使用该方法显示的。
showBottomsheet和showModalBottomSheet的区别。
showBottomSheet是通过Scafold.of(context).showxxx来实现。
showModalBottomSheet是通过自定义转场来是吸纳。
showCupertinaoModalpopup 也是通过自定义转场来实现。 其实效果都是一样的，从下往上。
2、SafeArea的使用。
3、MediaQuery.removePadding这个其实也是移除安全距离的，和SafeArea类似，如果我们看源码就会发现，其实SafeArea的源码就是，通过removepadding来实心的。

2019.9.18
1、关于Appbar。evalution阴影高度、centerTitle=true
2、TabBar和TabBarView的搭配使用，牵扯到TabController。 AppBar和TabBar都是可以通过PreferSize来进行高度设定。
TabBar是可以单独使用的。
3、Flutter创建app的层次结构。其实和ios（window->rootViewController->TabBarController->chirldControllers->NavigationController）一样。
Flutter相当于，MateralApp(bottomNavigationBar、body)，其中body就是每个页面，而Scaffold直接可以设置body的naviagtionBar。
其实每个页面都可以有，bottomNavigationBar，上面只是我们正常app的一般层次结构，根据实际开发，可以调整。
所以Flutter更像是搭积木的形式，每个部位的widget都是随意搭配。
4、BottomNavigationBar重要属性，onTap和currentIndex来控制index显示。
注意，因为Scaffold中，bottomNavigationBar是widget类型，所以我们可以使用自定义的，比如Container和BottomAppBar搭配使用。
5、BottomAppBar的特点是，有一个evalution，而且样式已经有默认的。
6、Flex、Row、Column其实功能一样。类似Android的线性布局。其中Row、Column是继承自Flex。所以，如果能使用Row、Column那么就一定能使用Flex。
Flex、Row、Column内部配合Expanded使用。
Expanded的特点，就是会占用剩余空间，所以Row里面有多个widget和多个Expanded时候的样式，我们需要知道其规律。
Flexible也是配合Flex、Row、Column使用。但是他不会强制使子widget铺满空间。感觉使用场景不多。
Space(),默认提供一个flex = 1的间距。用来控制间距使用。
对于mainAligment，crosAligment（其中strtch表示交叉轴上面铺满）、texDirection（水平方向）、verifyDirection的理解。
7、Color的使用，直接初始化，传16进制数。0xAARRGGBB 是上诉格式，其中aa可以是00透明或者ff不透明。

2019.9.19
1、json相关知识。json属于convert包。
所以与json相关的知识，有一个总的封装类JsonCodec，可以处理json->modal、modal->json。
JsonCodec，有两个get方法分别获取，JsonDecoder和JsonEncoder来分别处理，当然也暴露两个方法encode()、decode()两个方法。
所以json中，转换的本质是通过JsonEncode().convert()、JsonDecoder().convert()进行的。
实际上我们可以直接使用，jsonEncode()、jsonDecode()来进行转换，这是flutter封装好的方法。

    我们使用dio实际上已经做了处理。

2、关于dio知识点。
Dio dio =Dio([BaseOptions options])；进行初始化时候，可以设置baseoptions。
dio.request(); 进行网络请求。 其中我们可以设置options，（RequestOptions、Options）进行请求方法等设置。
当然，我们可以直接使用post、get、put等封装后的方法进行请求。
因为该方法是Future类，我们可以通过.catchError或者是try{ } on DioError catch(error) { }来进行错误捕捉。
3、Flutter中app运行机制，就是有两个队列，microTasks、EventTasks。而Flutter中，所以任务都是存放在任务队列eventTasks中，而且是串行执行。
和oc、java不同的是，oc、java不管是什么线程如果异常没有处理就会直接崩溃。但是flutter不会，flutter中，如果异常那么知识该队列不会执行，
并不会程序退出。而会继续执行队列中的其他任务。
Flutter中，通过Future() 来创建一个异步操作，如果有返回值，那么必须是Future类型。async、await其实是dart对异步操作的一个语法糖。
这个其实和ios中的dispatch差不多。
4、Flutter中的异常捕获，
如果是正常方法中throw 的异常，通过try-catch进行捕获。
future中throw的异常，通过 future.catchError捕获、或者是通过try{ await futurnFunc()  }catch { }捕获。
5、async标识一个方法具有异步能力。如果如果内部调用Future创建对象，那么才会是异步方法。
async、Future、await的关系。
注意async关键字的使用场景，并不是有Future的函数一定要使用async进行标记。
一般async和await是成对出现的（没有使用await，函数标记为async也没什么意义。 使用await就必须要使用async来进行函数标记。）
async/await只是相对于标记的函数的。
Future才是实现异步的核心代码。Future包裹的代码块里面才是执行异步的操作。如果出现Future，那么里面的耗时操作就是开启子线程执行，Future
类似ios中的Dispath。
而async/await只是相对于标记函数是否等Future内部代码执行完在执行。

Future<T>的返回写法。 注意下面返回值是11。而且需要注意的是then返回的也是Future类型。在实际开发中，一般不用这样写，直接返回Future就ok了。
then只是表示，Future代码块执行完后，执行该操作。
Future<int> futureMehod() {
print("开始");
return Future((){
sleep(Duration(seconds: 2));
print("future 执行");

      return 12;

    }).then((value){
      print("future then");

      return 11;
    });
}

2019.9.20
1、对于Card组件的使用，由于Card组件的特性，我们可以多使用Card组件来代替Container组件。
其实Card的源码可以看出，Card其实就是Container，增加evaluation的结果。
2、Hero组件，配合PageRoute来进行一些特殊效果。PageRoute中，重要属性，pageBuilder、transitionBuilder(常见SliderTransition、FadeTransition)等。
3、Dart是单线程模型语言。 Dart的循环机制。 isloate。也就没有了所谓的主线程/子线程之分。
想ios、android其实是多线程模型，可以开启线程，然后cpu不停的在线程间调度，从而实现多线程功能。但是Dart是单线程模型，
那么如何实现多线程呢？
Dart是单线程和Event loop机制。其中 Event Loop 事件循环就是把一系列的（点击事件/滑动事件/网络请求/ IO 事件等）
事件存放在 Event Queue 队列中，循环执行从 Event Loop 中获取事件进行执行，直到清空队列事件；

    使用Future类，可以将任务加入到Event Queue的队尾。
        这也就是为什么，我们需要理解Future((){ }) 和 Future.delay(duration, (){ })。两者间的区别。
        当调用Future((){  耗时操作 }), 会将《耗时操作》立刻添加到Event loop中，这个时候点击屏幕会没有返回，因为点击事件也会
        添加到event queue中，而event queue中现在有《耗时操作》，所以就需要《耗时操作执行完成后才能执行点击事件》。
        Future.delay(duration, (){ 耗时操作 })，会在duration之后，将《耗时操作》添加到event queue中，所以我们在duration之前
        是能点击屏幕的（点击屏幕事件会立刻添加到event queue中），之后就需要等到《耗时操作》执行完成后才能点击。
    使用scheduleMicrotask函数，将任务加入到Microtask Queue队尾。

    注意理解Dart中，Event Queue和microtask Queue。
    总结：dart，具体的事件或者代码什么时候执行，我们心里需要有一个严格的event queue概念。同时需要清晰的知道事件添加到event queue
    中的顺序。


2019.9.23
1、ExpensionTitle二级及多级菜单的展示，其实和ListTitle的基本功能是一样的，其trailing默认是个向下箭头，知识增加了点击，展示chirldren的能力。
ListView配合ExpensionTitle就可以实现展开效果。
ExpansionPanelList其实和上面组合实现的效果一样。
2、AspectRadio用于调整控件的宽高比。
3、FittedBox，主要属性fit(BoxFit类型)用于控制子控件显示的方式。这个其实和Image的fit很类似。
4、Stepper的使用，用于一步一步执行的widget。
5、chip小控件的使用。有几个特殊的，ActionChip带点击事件的、FilterChip点击时候左侧有✅的、
ChoiceChip（和FilterChip不同的是，其左侧没有✅）最常用的。

2019.9.30
1、关于动画。通过源码我们知道，使用XXXTransition是继承AnimatedWidget。AnimatedXXXX是继承ImplicitlyAnimatedWidget。
AnimatedWidget的特点：通过传入的一个LisenAble（Animation继承Lisenable），会进行动画监听（其实就是调用addLissent方法），
调用_handleChange() { setState}。
XXXTransition和AnimatedXXX的不同点就是：
XXXTransiton在setState的时候会获取lisentable.value的值。
AnimtedXXX在setState的时候不会去重新获取lisentable.value的值。 所以，一般使用XXXTransition会方便一些。

我们知道动画AnmationController需要传入sync: Tikerprovider。TikerProvider的作用就是生成Tiker。而Tiker就是
获取屏幕每一帧的刷新通知（实现动画的核心）。类似ios中，CADisplayLink。所以有动画的地方就需要TikerProvider。

所以动画的原理其实就是，通过TikeProvider获取每一帧的刷新通知，当通知来了获取Tween插值所计算出来的动画值，然后
调用setState进行刷新。

需要注意一点就是：动画当页面销毁时候，我们需要手动调用xxxx.dispose()避免浪费资源。其实通过源码发现就是移除了监听。

2、Flutter中所有能够滚动的控件都是直接或者间接使用ScrolleAble组件的。而ScrollerAble能实现滚动的核心是有ViewPort组件。
3、PageView使用了ScrollAble组件，而且还使用了TikerProvider来提供动画。
4、WillPopScop用来监听Navigator.of().pop。


2019.10.12
1、关于extents、with、implement的加深理解。 其实dart中的类也可以理解为接口（没有interface关键字）。
1、extents继承父类。 如果父类方法没有实现（父类是抽象类）,那么子类必须要实现。如果父类实现了，子类可以不去重写。
2、implements也是继承父类。和java中的implement含义不一样。dart中implements不管父类有没实现，子类都要实现。
3、mixin混入。 mixin修饰的也是一个类（最少可以理解为一个类, 但是不能使用关键字extents）。
使用场景。比如一个 A extents B with C 这个时候C也是一个类，而且C必须要继承Object。 如果C 不是继承Object，
那么就需要使用mixin C on State{} ，通过mixin/on来修饰C。

    mixin修饰符和abstract类似，该类可以拥有成员变量，普通方法，抽象方法，但是不能被实例化。 mixin一般用于描述一种具有
    某种功能的组块。
    比如：我们有一种绘画的能力。教师就有这种能力。
    mixin DrawFunc {
        String content = '';
        void draw();
    }

    class Teacher with DrawFunc {

        @override
        void draw() {
        }
    }

    如果想要限定某种类型： 比如人类才有绘画功能。
    class Person {}
    mixin DrawFunc on Person {

    }
    那么这种情况下，就必须是Person类或者其子类才能有DrawFunc的能力。
    只能这样写。
    class Child extends Person with DrawFunc {

    }


2、CircleAdvate的误区。如果使用该控件进行切圆角，我们必须将圆角图片设置为backgroudImage。从这个角度来讲我们使用Container
也是可以实现的。 它的chirld的属性的理解，相当于在原控件上放一个subView, 从源码可以发现，其实就是一个AnimatedContainer。
所以实现切圆角，最好使用ClipOvel、ClipRRect。

3、AutomaticKeepAliveClientMixin该混入类。 注意其build方法是@mustcallSuper的。如果我们with AutomaticKeepAliveClientMixin。
那么build方法，就必须要调用super.build()。 如果不调用我们会发现有一个小警告。
注意AutomaticKeepAliveClientMixin的源码。

    AutomaticKeepAliveClientMixind常用使用场景是PageView、TabView的子widget使用。但是实际上，使用不局限于此。之所以需要调用
    super.build(context)的原因就是，其内部是通过_ensureKeepAlive()方法确保切面状态保护，之所以能保存状态就是需要我们在state各种
    生命周期方法中调用该方法才行。。 有个场景就是，当我们push到下一页面，然后在pop回来的时候，，调用build方法，如果我们不调用super.build就无法调用到_ensureKeepAlive()
    方法来保存状态。


2019.10.14
1、dart中的mixin其实更像abstract class。 里面可以声明方法，而且声明的方法可以实现或不实现。
2、dart中的set、get方法和swift中set、get方法一样，只能作为计算属性。

2019.10.16
1、Column中的chirld： 会尽可能缩小子控件大小。所以我们才需要配合Expande使用。
2、对于手势GestureDecorator的源码理解。之所以能进行手势识别，其核心是，GestureRecognize（手势识别器。）。
起源码也是很简单，就是使用RawGestureDecorator。

2019.10.17
1、Semantics组件，包括一些空间中semanticsValue/lable的含义。
其实该属性或控件是可选属性。
意味着可以与Android TalkBack或iOS VoiceOver一起使用（例如主要由视障人士使用），包括屏幕阅读器。

2、AppTheme中比较重要的一些属性。
appbarTheme：   appBar的主题。

    primarywatch：  一些导航颜色。如appbar的颜色但优先级低（也就是如果设置appbarTheme的颜色，该属性就补齐作用）。
                    datetimepicker的导航颜色。
                    同时会影响radio、chexbox、progress、floatingbutton的颜色。优先级低（如果accentColor有值，那么该属性不管用）

    accentColor:   特点颜色。具有一些突出特性的颜色。比如radio、checbox、progress、floatingbutton等颜色。
                    Slider的颜色比较特殊，受primarywatch影响。
                                      min: 0,
                                      max: 100,
                                      divisions: 10, 这三个属性的作用。
    // 分割线样式。
    dividerColor: 分割线。

    // 设置输入框样式。
    inputDecorationTheme： 输入框主题。默认是下划线样式。

3、注意ProgressIndicator的使用。包括LinerProgressIndicator、CircleProgressIndicator。即可显示进度，也可以显示value。
特别是其valueColor：AlwaysStoppedAnimation(Colors.red), backGroudColor：的设置。



2019.11.13
1、Slide和ios的UISlide一样。
2、ScrollBar是滚动条。一般chirld是一个滚动视图，比如SingleChirldScrollView。
3、Form和TextFormFiled是一起使用的。
Form(child: Column(
children: <Widget>[
TextFormField(

                  ),
                  TextFormField()
                ],
              ))

4、IgnorePointer和AborbingPointer，用于控制事件传递的。也就是能否在子控件中监听事件。

5、关于进度条。CirleProgressBar、LineProgressBar的valueColor，使用AlwaysStoppedAnimation<Color>（Colors.purper）来进行设置。

6、flutter中，Column的一个属性mainAxisSize，用于设置其大小，默认是MainAxisSize.max，所以，Column默认是撑满父控件的。如果社会组其为.min
则会为最小，有点类似Container是否设置子控件的一些状态。

2019.11.14
1、Flutter动画梳理。
AnimtionController，继承Animation。
Tween，继承AnimationAble。
Animation、一般通过Tweenxxxx.animtion(AnimtionConroller获取)。

    AnimtionController用来启动动画的。常见方法，froward、stop、reverse、dispose。
    Animtion用来监听动画变化。
    Tween用来指定动画变化方式。

    其实AnimationController和Animation都是可以监听，动画变化的，和status的变化，注意status中dissimiss的对应的是reverse执行完成后的状态。

2、对于Key的理解。以及常用的UniqueKey和ValueKey的区别。
UniqueKey()，其源码就是，拿该key的hash值作为比较对象，所以每次初始化UniqueKey都是不同的。
ValueKey(value), 其实比较的是其value值，如果一样就是相等的。ValueKey（1） 和ValueKey(1) 是一样的，如果使用该key，那么就不会更新elementtree。
ObjectKey(obj), 其实比较的是obj的地址是否相同，源码中，使用了一个方法，identical(a,b)，其实使用比较的identityHashCode（obj）。

3、AnimatedSwitch的使用，用于控件内容显示的动态变化，注意其chirld配合ValueKey的使用。
AnimatedSwitcher(
duration: Duration(seconds: 2),
child: Icon(_iconData,key: ValueKey(_iconData),),
transitionBuilder: (Widget child, Animation<double> animation) {
return ScaleTransition(child: child, scale: animation);
},
),


2019.11.18
1、Materail控件的使用场景。当我们开始一个新界面的时候常常需要该控件。比如，showxxxDialog、Overlay等里面。 当我们使用了Scallfold不需要该控件，是因为，
Scallfold默认内部是有Materal的。

2、关于Image的fit属性。
BoxFit.fill。填满，图片有可能出现拉伸现象。
BoxFit.Container。 等比例拉伸，但是图片不会出现剪切现象。类似ios中，aspactScallxxx
BoxFit.Cover。     等比例拉伸，图片会出现剪切现象。也就是拉伸后的图片会铺满Image。
BoxFit.Fitxx。     只拉伸xxx（宽\高）。
BoxFit.ScallDowm。 和Container差不多，但是只能等比例缩小，不能等比例扩大。


3、关Dart语言的构造函数。
Dart构造函数有4种格式：
ClassName(...) //普通构造函数
Classname.identifier(...) //命名构造函数
const ClassName(...) //常量构造函数
factroy ClassName(...) //工厂构造函数

    普通类很好理解：
    1、创建类默认提供一个无名、无参的默认构造函数。
    2、可以定义一个无名有参的构造函数。最多只有一个。
    3、可以定义多个有名构造函数。

    有父类的类：
    1、如果父类的构造函数可以通过SuperClass()进行初始化。那么子类构造函数可以不写super，默认会调用。
        换而言之，
        class Person {
          String name;
          int age;
          Person(this.name, this.age);
        }， 子类必须调用super。

         class Person {
              String name;
              int age;
              Person({this.name, this.age});
         }， 子类必须调用super。

    2、如果父类的构造函数是有名的。那么子类必须要重写父类的构造函数。

    其构造方法，相对于Android是有一定的优化的。相当于，增加的有名构造方法。
    ios中构造方法是会继承父类的构造方法。
    swift：如果父类有构造方法（系统将不会提供默认构造方法），子类如果不新增构造方法，那么相当于继承了父类的构造方法，如果子类重写构造方法，那么需要调用父类构造方法。
    oc：不管类是否有自定义构造方法，系统都会提供默认构造方法。在加上子类会继承父类构造方法，所以oc中所有类都有默认构造方法。

    java和dart一样子类是不会继承父类的构造方法，这就是为什么如果父类有构造方法，子类必须重写构造方法的原因（因为子类不会继承父类的构造方法）。


4、关于Flutter和Native的交互问题。
普通pulugin。
和使用UIKitView、AndroidView来加载部分view。

2019.11.19
1、iphoneX 系列手机，只有xr使用@2x图。其它的是@3x图。
2、关于图片适配问题。
我们可以设置
xx/xx/.../2.0x/
xx/xx/.../3.0x/
等2倍图和3倍图。

    具体配置，只需要在pubspec.yaml 中指定使用路径就可以。比如xx/xx/.../xx.png(不需要带上2.0x或者是3.0x，系统会根据手机分辨率来记载。)
    而且在没有1倍图的情况下，不能出现汉字。

3、Future中的异常，不能通过try-catch进捕获。


2019.11.20
1、ValueListenableBuilder用来监听Value的变化。配合ValueNotifier使用。
NotifyListen 通过Notify进行传值。反向传值。

2、InheritedWidget正向传值的使用。如果出现，widget节点过多的时候，并且在不同的页面，那么这个控件就格外游泳。

3、关于GestureDecorator中的Behavior的作用，因为默认如果控件是透明的，那么就不会响应事件，这点和ios很像。通过设置behavior能够使其接受事件。

4、Dart/io中，文件操作File类和文件夹操作类Directory。

5、关于GridView的使用。

6、Size的一个重要使用场景，Size.square(value) 生成一个长宽都是value的尺寸。

7、关于动画。Interval控制动画执行的范围。

8、Matrix4来控制，矩阵变换。配合Transform实现不同的变换。
因为默认Transform.rotation 只能围绕中心点（也就是z轴进行旋转，有时不满足要求）。其中Aligment是控制锚点的。
Transfom的默认中心点是start，即左上角，我们需要设置为Aligment.center。

Matrix4的使用。
1、Matrix4.identify()取初始矩阵状态。和Matrix4.zero（）含义差不过。
2、Matrix4.diagonal3Values缩放变换，直接相当于Matrix4.zero()的基础上进行变换。

9、Interval用于控制多长时间进行完成。有点类似ios中，CABasicAnimation的beginTime = CACurrentMediaTime()+xx。
在进行组合动画的时候，Interval显得格外重要。
_animation = Tween(begin: 0.0, end: pi/4).animate(
CurvedAnimation(
parent: _animationController,
curve: Interval(0.5, 1)
)
)..addListener(()=>setState((){}));

    ios中核心动画的继承关系。
    CAAnimation是基类。 实现了CAMediaTiming协议，能够控制动画执行曲线。
        CAAnimtionGroup，组动画。
        CAPropertyAnimtion， 属性动画。
            CABasicAnimation，基础动画。
            CAKeyFrameAnimtion，帧动画。
        CATranstion，转场动画。UINavigationController就是通过该动画实现的转场效果。


通过SpinKit，我们发现一个复杂的动画，显然通过控件Transform使用。


10、Flutter关于动画实现方式。
1、通过AnimtionController.forward（)执行动画。
Animtion.lisent() => setState((){}) 通过animtion监听动画，然后setState进行赋值。 一般配合Transform使用。

    2、通过系统暴露的能够动画的组件，如AnimtedContainer、AnimtedOpacity等进行动画。类似ios中，CALayer的隐式动画（也就是我们给其赋值时候，会
        有从旧值到新值的动画。）。
        其实现原理就是，这些控件继承ImplicitlyAnimatedWidget -> StatefullWidget。ImplicitlyAnimatedWidgetState内部，initState的时候
        初始化一个AnimtionController，widget进行赋值的时候，会调用 didUpdateWidget 方法，而该方法内部，创建一个Animtion并赋值其begin和end
        同时开始进行动画。

    3、通过系统暴露组件，xxTransition进行动画，继承自AnimtedWidget。直接赋值Animtion。
        其实现原理就简单一些，在内部，给Animation增加监听事件，当动画执行的时候，监听到动画，同时执行setState，而在build方法中就帮我们获取到了值。
        其实就是对方式1进行了简化，将其监听动画和setState和或者value值，系统帮我们处理了。

    4、AnimatedBuilder，该方式创建动画也是继承自AnimatedWidget。其实和3的唯一区别就是系统帮我们监听到动画，不会获取当animmation.value的值（
        其实也是理所当然，因为系统根本不知道build里面你想取什么值）。

    所以我们也可以自定义动画 XXWidget extents AnimtedWidget。初始化的时候，需要传一个Animation。

11、关于Flutter的Widget生命周期。
initState（） 相当于重新创建的时候才会调用。 相当于Element tree改变了就会调用。
类似android中的oncreate、ios中的viewdidLoad。这个时候，widget对应的element还没有渲染，但是已经加载到渲染树种，此时mount变成了true，
当dispose的时候会变成false。

    didChangeDepandcy() 当initState调用后，立即调用。

    didUpdateWidget(）会在build的前调用。注意一定是update的时候调用，初始化的时候不会调用。所以一般initState和didUpdateWidget不会同时调用。
        其实相当于每次hot load的时候会调用。

    build()  这两个很像，当调用setState，或者父widget调用setState都会调用。


Flutter中，App的生命周期需要借助widgetbind.instanse.addobserve来实现监听。


2019.11.21
1、关于ShaderMask的使用。给控件进行渐变着色。



2019.11.22
1、Stack组件的特点。首先是撑满父控件的。
fit：StackFit.loose\.expand 该属性是，在子控件没有Position包裹的时候才起作用。
StackFit.expand 是将子控件撑满父控件，优先级特别高。

2、Column组件的特点。
Column和Row默认都是撑满父类的。 而且需要知道子widget的尺寸。常见的问题就是，Colum内部有scrollView，需要用Expand进包裹。




2019.11.26
1、关于flutter，状态栏颜色的设置。 通过AppBar的brightLess.dark设置。最好，在主题样式里面设置。
当然也可在  AnnotatedRegion<SystemUiOverlayStyle>(
value: SystemUiOverlayStyle.dark,
child: Material(child: Scaffold(body: loginMain(),),),
);

2、关于Git的使用。
当我们在一个分支上，checkout到某次提交（sourchtree 就是鼠标双击以前的某次提交），会弹出

    你确定你想要检出'bbf5b46ae754b9cc2cd4a6dea41b5265110bea4b'？
    这样做会使得你的工作区变成一个“分离的HEAD”，这意味着你不会在任何一个分支上。
    如果你在这之后想要提交，你将很有可能要么检出一个分支，要么创建一个新的分支。这样可以吗？

    以上提示的理解。因为默认比如我们在master分支上，那么master指针和head指针是在一起的，每次做一次提交，两个指针就会同时向后移动，当我们检出到
    某个提交的时候，这时这种【绑定】状态就会打破，就会出现上述提示，那么如果这个时候我们想要做修改，那么只需要修改后，新建branch就可以了。
    不然修改的内容会丢失。


    关于提交回滚和将xx重置到这次提交的区别。
    比如。1、2、3、4、5、6、7。 我们在3上面执行提交回滚操作，那么只是将3这次提交的代码移除掉（相当于没有做3这次操作），但是4、5、6、7还在，执行完后
    的顺序是1、2、4、5、6、7。而且sourcetree会显示落后一个版本（因为我们做的是本地操作），如果要同步需要进一次提交。

    重置xx到这次提交。
    1、2、3、4、5、6、7。选择3，右击选择重置到这次提交，选择硬合并。这个时候发现本地代码已经回到选中的那次，如果想要远程服务器


2019.12.6
1、关于showDialog，中，build的创建。 需要使用center和Matero进行包裹。不然，设置会出现失败。


2019.12.11
1、ListWheelScrollView 实现轮子是滚动。有点3d效果。
2、注意ListView默认是没有滚动条的，滚动条需要通过ScrollBar来加。
3、注意ListView有Padding属性。内容会实现偏移。
4、TabBar也是可以通过lablePadding来实现内容的padding。
5、关于ListView的理解。我们知道，ios中，UITableView，有自身高度，如果滚动需要知道contentSize。
但是flutter中，有点区别，Listview的高度其实就是自widget的高度（也就是没有contentSize的概念，这和android有点类似）。这也就是说，要渲染必须
知道子控件的高度。其实ios也是一样。
这就带来一个问题，如果ListView嵌套ListView或者GridView的时候，会出现问题。这时候就需要使用shrinkWrap属性，因为默认ListView是尽可能大的。



2019.12.12
关于FocusScope、Focus、FocusNode的关系。

flutter的源码告诉我们:
void runApp(Widget app) {
WidgetsFlutterBinding.ensureInitialized()
..attachRootWidget(app)
..scheduleWarmUpFrame();
}

其中，WidgetsFlutterBinding.ensureInitialized() 会进行各种事件的绑定。

void attachRootWidget(Widget rootWidget) {
_renderViewElement = RenderObjectToWidgetAdapter<RenderBox>(
container: renderView,
debugShortDescription: '[root]',
child: rootWidget,
).attachToRenderTree(buildOwner, renderViewElement);
}
会创建。buildOwner 其中buildOwner会创建一个FocusManager进行键盘的管理。这也是我们通过，FocustScope.of(context)就是FocusManger.rootScaopNode。

我们发现，所有跟键盘有关的都和 FocusMananger有着关系。

Focus我们从源码发现，如果不传FocusNode，他会默认创建一个FocusNode，这也是Focus能进行键盘换气的根本原因。

FocusScope其实是Focus子类。 我们通过Focus和FocusScope来进行键盘的控制。

2019.12.17。
1、关于TextField的几个重要属性。
enableBoard： 未点击时候样式。命名有点奇怪。
highhtBoard： 点击时候样式。
contentPadding：TextFiled高度控制，主要是，又是莫名奇妙的高度。Tab里面的padding有相似效果。
fill： 配合fillColor使用。
fillColor：填充色，前提是fill = true。默认是false。


2019.1.7
1、dart中关键字。extends 继承。 implement和java中implement一样。 with关键字。
dart中，没有interface关键字。但是有interface概念。任意类都可以作为interface接口。

2020.9.25
1、理解Widget、Element和RenderObject之间的关系。
根据Widget生成Element，然后创建相应的RenderObject并关联到Element.renderObject属性上，最后再通过RenderObject
来完成布局排列和绘制。最终所有Element的RenderObject构成一棵树，我们称之为Render Tree即渲染树。
总结一下，我们可以认为Flutter的UI系统包含三棵树：Widget树、Element树、渲染树。他们的依赖关系是：
Element树根据Widget树生成，而渲染树又依赖于Element树，最终的UI树其实是由一个个独立的Element节点构成。
widget是配置信息（相当于配置文件）。
Element同时持有widget和renderObject，用来进行渲染逻辑，同时决定是否将renderObject
RenderObject是真正用来进行layout、paint等复杂操作。

    widget和element是一一对应的，但是一个element不一定对应一个renderObject, 有一些Element会有多个子节点，如继承自RenderObjectElement的一些类，
    比如MultiChildRenderObjectElement。

    关于widget源码有几个重要方法：
    abstract class Widget extends DiagnosticableTree {

      const Widget({ this.key });

      final Key key;

      @protected
      Element createElement(); // 创建相应的Element。

      @override
      String toStringShort() {
        return key == null ? '$runtimeType' : '$runtimeType-$key';
      }

      @override
      void debugFillProperties(DiagnosticPropertiesBuilder properties) {
        super.debugFillProperties(properties);
        properties.defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.dense;
      }

      // element在调用更新前会调用widget的canUpdate方法，来确认是否服用旧Element。
      static bool canUpdate(Widget oldWidget, Widget newWidget) {
        return oldWidget.runtimeType == newWidget.runtimeType
            && oldWidget.key == newWidget.key;
      }
    }

    当有父Widget的配置数据改变时，同时其State.build返回的Widget结构与之前不同，此时就需要重新构建对应的Element树。为了进行Element复用，
    在Element重新构建前会先尝试是否可以复用旧树上相同位置的element，element节点在更新前都会调用其对应Widget的canUpdate方法，如果返回true，
    则复用旧Element，旧的Element会使用新Widget配置数据更新，反之则会创建一个新的Element。Widget.canUpdate主要是判断newWidget与oldWidget的runtimeType和key是否同时相等，
    如果同时相等就返回true，否则就会返回false。根据这个原理，当我们需要强制更新一个Widget时，可以通过指定不同的Key来避免复用。


    我们知道 StatelessWidget 和 StatefulWidget 两种直接继承自 Widget 的类，
    在 Flutter 中，还有另一个类 RenderObjectWidget 也同样直接继承自 Widget，它没有 build 方法，
    可通过 createRenderObject 直接创建 RenderObject 对象放入渲染树中。Column 和 Row 等控件都间接继承自 RenderObjectWidget。

2、BuildContext的理解。
BuildContext就是相应Widget对于的xxxElement。

3、Flutter是如何构建视图的。在flutter中，everything is widget，我们是通过构建widget来编写ui界面。实际上widget并不是显示在屏幕
上的东西，只是一个配置信息，它永远是immutable的，而真正显示的是Element tree（并不是Widget tree）。那么显示的如下：
a、abstract class StatelessWidget extends Widget {
const StatelessWidget({ Key key }) : super(key: key);
@override
StatelessElement createElement() => StatelessElement(this);
...
所以我们发现Widget首先会调用createElement来创建Element，并且传入的widget本身。
b、class StatelessElement extends ComponentElement {
/// Creates an element that uses the given widget as its configuration.
StatelessElement(StatelessWidget widget) : super(widget);

        @override
        StatelessWidget get widget => super.widget;

        @override
        Widget build() => widget.build(this);

        @override
        void update(StatelessWidget newWidget) {
          super.update(newWidget);
          assert(widget == newWidget);
          _dirty = true;
          rebuild();
        }
      }
      所有我们发现，Element是可以获取widget的（因为createElement的时候回将widget传入进来）。而 build()方法会调用
      widget.build（this）方法，这个也是我们创建widget的时候的build方法，生成的是newWidget（也就是build后的widget）。
      然后在update方法中判断是否要重写重载Element。

    c、class StatelessElement extends ComponentElement
      ...
      abstract class ComponentElement extends Element
      ...
      abstract class Element extends DiagnosticableTree implements BuildContext
      从上面我们可以看出，BuildContext其实就是StatelessElement或者StatefulElement。继承自ComponentElement和Element。

      所以我们现在再来看官方对于BuildContext的解释:
      BuildContext objects are actually Element objects. The BuildContext interface is used to discourage direct manipulation of Element objects.
      BuildContext对象实际上就是Element对象，BuildContext 接口用于阻止对 Element 对象的直接操作。



11.12
1、关于状态管理。
event和provider的优缺点。以及使用场景。

    event使用需要注意销毁监听。event_bus就是基于streamController的封装。
    provider使用，需要注意provider所在节点位置。provider是基于InheritWidget。


    这其实给我们了一个思路，比如我们全局有UserInfoModel，因为很可能全局我们都需要使用该模型，那么我们使用Provider是不是会好很多。
    其实，如果牵扯到模型更新，使用Provider来进行状态管理明显会好很多。 仅仅是通知的话，event会好一些。

    Provider中有几个重要类，Provider、ChangeNotifyProvider、MultiProvider。 提供Provider的。
    获取ChangeNotify的有，Consumer、Selector等。当然开发中，我们可以不使用该控件。


2、注意StreamBuilder和FutureBuilder的使用方式。
StreamBuilder一般需要借助StreamController使用。
FutureBuilder需要借助Future来使用。

11.13
1、Dart 没有 byte、char 和 float，int、double 都是 64 位。

11.27
1、关于pubspec.lock和pubspec.yaml的工作原理。
首先通过pubspec.yaml加载的库是存放在flutter sdk中。 flutter/.pub-cache/hosted/pub.flutter-io.cn/ 下面。

    pub get和pub update的区别。
    pub get会根据pubspec.lock文件中的版本号进行下载，并存放在flutter/.pub-cache/hosted/pub.flutter-io.cn/下面。如果有就
    不会重新下载。

    pub update会下载工具的最新版本，同时将pubspec.lock中相应工具的版本号修改为最高。

    我们项目中到底使用是那个版本的spec。是根据pubspec.lock文件确定的。
    同时pubspec.lock的版本会随着pubspec.yaml的增加而增加，但是并不会随着yaml文件版本的降低而降低。


1.13
1、flutter中的列表。SingleScrollView、ListView、CustomScrollView（配合sliver使用）、MergeableMaterial（注意其使用方式，可以动态的进行增加和删除）。
2、ListWheelScrollView，齿轮滚动。
3、async 和 async* 的区别。
async 返回是Future类型，使用return 返回。
async* 返回是Stream。使用 yield 返回。
Stream<int> countForOneMinute() async* {
for (int i = 1; i <= 60; i++) {
await Future.delayed(const Duration(seconds: 1));//延迟一秒
yield i;//生成Stream的一个值
}
}
输出日志：
/*
flutter: _bids----null：ConnectionState.waiting
flutter: _bids----1：ConnectionState.active
flutter: _bids----2：ConnectionState.done
*/

    Future<int> doSomeLongTask() async { //异步函数
      await Future.delayed(const Duration(seconds: 1));
      return 42;
    }

    了解Stream和Future的区别。 以及StreamBuilder和FutureBuilder的使用。

4、Dismissible侧滑删除。

5、KeepAlive。flutter中，如果控件从屏幕中移除，那么widget将会销毁。比如ListView，如果滚动，我们发现item的initState方法会频繁调用。


1.19
1、WillPopScope的调用时机，只有用户点击返回键或者通过手势返回才会调用。
通过Navigator.pod是不会调用的。


    首先晚上好，我叫朱朝俊，我是14毕业的，毕业后从事了一段时间的c语言开发，然后当时移动端开发很火，我就转的是ios开发，我的话也参与多个项目
    在原生开发这块擅长oc和swift开发，android的开发也懂一些，以为原生开发需要大量的经验积累，所以android不是特别精通。在跨平台方面，
    擅长flutter开发，我目前的这个项目本来就是swift项目，然后我们二期用flutter进行了重构，我个人目前也接了一个flutter的私人项目，所以
    flutter还是比较熟悉的。我本人其实也是一个比较踏实的一个人，工作也是比较认真的，平时也喜欢学习一些新技术，丰富自己的技能栈。


    首先我擅长移动端开发，所以短期内可能还是从事这方面工作。
    在技术层面上，我也希望在深入学习android和后台方面的知识，丰富自己技术栈。希望自己以后能够在移动端开发中，熟悉各个流程和原理，
    能够在这方面独当一面吧。
    而且我个人希望能够把参与的项目做到同类型中比较出色的，项目的话能够有很好发展和前景，包括用户量、日活等都有比较可观的数据。
    同时希望自己学到的东西能在项目中很好的展示。

3.12
1、AbsorbPointer和IgnorePointer
AbsorbPointer和IgnorePointer都能控制其子控件是否响应点击事件。但是两者直接的根本区别是，
AbsorbPointer, 会将点击事件吸收，表示事件不会向下传播。
IgnorePointer，如果将ignore = true，那么事件会向下传播。

3.18
1、CompositedTransformFollower和CompositedTransformTarget，实现两个控件的绑定。

3.30
1、widget生命周期。
initState
didChangeDependencies
didUpdateWidget
build
dispose

    其中initState、build和dispose很好理解。
    didChangeDependencies和didUpdateWidget两者间的关系。
    didChangeDependencies一般和initState是成对出现的，表示界面进行重构。
    didUpdateWidget和didChangeDependencies一般是互斥的，只会出现一个。didUpdateWidget当widget进行了初始化会调用。

    总结：didChangeUpdateWidget是widget进行了重新初始化、并且elementTree没有进行重写创建和渲染（也就是没调用initState）。
    didChangeDependencies是widget进行了重新初始化、并且elemenTree进行了重新创建和渲染（也就是调用了initState方法）。


4.20
1、dart是没有结构体的。

2022.6.14
1、flutter渲染引擎。 iOS的渲染有Metal、OpenGL ES。 在ios 10之上，就使用的Metal进行渲染。
2、flutter engine。
![img.png](../../../Documents/宝藏/Code/flutter_knowledge/app_for_fluuter/lib/img.png)
    Flutter的整体架构有三部分：Framework、Engine和Platform。
    Framework（Dart）：该层是Dart库，google通过dart语言开发了一套基础库，包括widget、手势、绘图、动画等。
    Engine: 用C++编写，实现了Flutter的核心库，包括Dart虚拟机、动画和图形、文字渲染、通讯。
3、flutter多线程。flutter默认是单线程，如果不开启多线程，默认是在主线程中处理任务。
    a、事件处理。和iOS很像，在Dart中也存在事件循环和消息队列的概念。在dart中的线程叫isolate。程序启动后，默认开启的是main isolate。
        每个isolate包含一个事件循环及两个事件队列。event loop事件循环，以及event queue和microtask queue。其中两个event queue和mirotask queue类似
        ios中的source 0、source 1。
        event queue：处理i/o事件、绘制事件、手势事件、接受其它isolate消息等外部消息。
        microtask queue: 可以自己想ioslate里面添加事件，优先级比event queue高。
        ![img_1.png](../../../Documents/宝藏/Code/flutter_knowledge/app_for_fluuter/lib/img_1.png)
        这两个队列也是有优先级的，当isolate开始执行后，会先处理microtask的事件，当microtask队列中没有事件后，才会处理event队列中的事件，并按照这个顺序反复执行。
        但需要注意的是，当执行microtask事件时，会阻塞event队列的事件执行，这样就会导致渲染、手势响应等event事件响应延时。为了保证渲染和手势响应，应该尽量将耗时操作放在event队列中。

        async、await、Future，用于异步调度。Future其实就是一个类型。所以一般一个异步操作，我们会封装成Future对象。
        Flutter中和时间操作有关的，差不多都和Future有关。
        协程
        如果想要了解async、await的原理，就要先了解协程的概念，async、await本质上就是协程的一种语法糖。协程，也叫作coroutine，是一种比线程更小的单元。如果从单元大小来说，基本可以理解为进程->线程->协程。

        任务调度
        在弄懂协程之前，首先要明白并发和并行的概念，并发指的是由系统来管理多个IO的切换，并交由CPU（一个）去处理。并行指的是多核CPU在同一时间里执行多个任务。
        
        aync、await的原理，其实就是利用协程概念。 协程是线程的最小单元。async，其实修饰的就是一个代码块，有自己的上线文环境，当执行到await的时候，
        则表示需要等待，cpu去调度执行其它i\o操作的协程操作。然后cpu过一段时间去查看await的协程是否执行完，如果执行完，就会执行后续操作，也就是await后面的操作。
        async和await并没有开启新线程，只是i/o的中断和cpu的调度。网络请求我们是可以使用async、await。如果要执行大量耗时操作，应该使用isolate开启新线程。

        isolae是dart中开启线程的方式。和普通Thead不同，isolate有独立的内存，所以isolate是由线程和内存组成。正是因为isolate内存不共享，所以
        不存在资源抢夺，也就不需要锁。

            