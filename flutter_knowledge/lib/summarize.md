2019.8.6
1、手势。GestureDecorator、Inkwell、Listener几个监听手势。可以配合Transform使用。
2、Transform的使用。一般不直接使用，因为内部嵌套的Matrix4使用比较麻烦。
配合暴露的方法。Transform.rotation、Transfor.scale、Transform.translate使用起来会方便很多。
3、动画。牵扯到几个关键类。AnimatedController、Animatable（通过插值类Tween及其衍生类获取的）、Animation（通过Animatable获取）。
真正进行动画的可以有几种方式。Animation.addListen(){ setState() }、使用xxxTransition、使用Animatedxxxx(如AnimatedContainer等，这种实现方式需要利用其value值)。
4、线程问题。Future类。Dart中，事件循环的两个主要事件类，MicroTask和EventTask，我们需要知道其工作方式。
Future()、Future.microTask() 创建协程。
dart/ioslate 可以创建线程。但是不同线程间的传递有点麻烦。 这里的线程很类似ios 中的进程概念。
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

4、Dismissible侧滑删除。

5、KeepAlive。flutter中，如果控件从屏幕中移除，那么widget将会销毁。比如ListView，如果滚动，我们发现item的initState方法会频繁调用。


1.19
1、WillPopScope的调用时机，只有用户点击返回键或者通过手势返回才会调用。
通过Navigator.pod是不会调用的。


    首先晚上好，很开心能参加今天的这个面试，我是14毕业的，毕业后从事了一段时间的c语言开发，然后当时移动端开发很火，我就转的是ios开发，我的话也参与多个项目
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
1、flutter渲染引擎skia。 iOS的渲染有Metal、OpenGL ES。 在ios 10之上，就使用的Metal进行渲染。
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

        比较轻量级的isolate创建，可以使用compute，其本质还是通过Isolate.spawn进行创建isolate。

2022.6.20
1、app启动分析。
```dart
void runApp(Widget app) {
    WidgetsFlutterBinding.ensureInitialized()
      ..scheduleAttachRootWidget(app)
      ..scheduleWarmUpFrame();
}
```
    三行代码的作用其实就：
    1、生成Flutter engine和Flutter Framework的中间桥接对象。
    2、生成相应的app渲染树。
    3、绘制热身帧, 将渲染树生成的Layer图层通过Flutter Engine渲染到Flutter View上。

    WidgetsFlutterBinding。
    ```
    class WidgetsFlutterBinding extends BindingBase with GestureBinding, SchedulerBinding, ServicesBinding, PaintingBinding, SemanticsBinding, RendererBinding, WidgetsBinding {
        static WidgetsBinding ensureInitialized() {
            if (WidgetsBinding.instance == null)
            WidgetsFlutterBinding();
            return WidgetsBinding.instance!;
        }
    }
    ```
    继承自BindingBase。同时混入了7个mixin。包括：GestureBinding，SchedulerBinding，ServicesBinding,PaitingBinding,SemanticsBinding,RenderBinding,WidgetsBinding。
    BindingBase里面有Window是SingletonFlutterWindow。
    <!-- window.dart -->
    abstract class FlutterView {}
    class FlutterWindow extends FlutterView {}
    class SingletonFlutterWindow extends FlutterWindow {}

    可以看出来最基本的信息在FlutterView里面。
    比如：
    devicePixelRatio: 物理像素和虚拟像素的比。
    geometry：Flutter渲染的view在native中的位置。
    viewInsets: 各边的显示内容和能显示内容的间距。比如没有键盘viewInsets.bottom = 0。当有键盘的时候viewInsets.bottom = 键盘高度。
    padding: 类似安全区域。表示不建议显示的区域，比如statusbar、indicator。
    viewPadding: padding和viewInsets的组合。
    
```dart
abstract class FlutterView {
  // 
  PlatformDispatcher get platformDispatcher;
 
  // 
  ViewConfiguration get viewConfiguration;
 
  // 
  double get devicePixelRatio => viewConfiguration.devicePixelRatio;
 
  //
  Rect get physicalGeometry => viewConfiguration.geometry;
  //
  Size get physicalSize => viewConfiguration.geometry.size;
  // 
  WindowPadding get viewInsets => viewConfiguration.viewInsets;
  // 
  WindowPadding get viewPadding => viewConfiguration.viewPadding;
  //
  WindowPadding get systemGestureInsets => viewConfiguration.systemGestureInsets;
  //
  WindowPadding get padding => viewConfiguration.padding;
 
  //  render方法是将Flutter代码生成的渲染内容(Layer Tree生成的Scene)传递给Flutter Engine, 让GPU去渲染。
  void render(Scene scene) => _render(scene, this);
  void _render(Scene scene, FlutterView view) native 'PlatformConfiguration_render';
}
```
SingletonFlutterWindow.
```dart
// SingletonFlutterWindow的一个重要方法。就是devicePixelRatio, physicalSize, padding和viewInsets等的变化会触发的回调onMetricsChanged。
VoidCallback? get onMetricsChanged => platformDispatcher.onMetricsChanged;
set onMetricsChanged(VoidCallback? callback) {
    platformDispatcher.onMetricsChanged = callback;
}
// 手机设置改变
Locale get locale => platformDispatcher.locale;
VoidCallback? get onLocaleChanged => platformDispatcher.onLocaleChanged;
set onLocaleChanged(VoidCallback? callback) {
  platformDispatcher.onLocaleChanged = callback;
}
// 手势改变等
PointerDataPacketCallback? get onPointerDataPacket => platformDispatcher.onPointerDataPacket;
set onPointerDataPacket(PointerDataPacketCallback? callback) {
  platformDispatcher.onPointerDataPacket = callback;
}
```

BindingBase相当于一个接口。后面有7个Mixin。
RendererBinding的功能主要和渲染树相关。
ServicesBinding的主要功能是接收MethodChannel和SystemChannels传递过来的消息。我们来看看ServicesBinding的主要代码：
PaintingBinding其实它是处理图片缓存的mixin。和RenderObject的Paint没啥关系。
SchedulerBinding主要处理任务调度。
GestureBinding主要处理用户的各种操作。
WidgetsBinding主要处理widget tree的一些逻辑。

第二步：
scheduleAttachRootWidget。
attachRootWidget中初始化了一个RenderObjectToWidgetAdapter对象，构造函数传入了renderView和rootWidget。
renderView就是RendererBinding的initInstances方法中初始化的那个对象，rootWidget则是我们写的界面MyApp()。从构造函数的参数名我们可以看到，renderView是容器，rootWidget是这个容器的child。
也就是说renderView是所有的Widget的根。

2、setState的本质。 _element!.markNeedsBuild();

3、Flutter渲染引擎Skia
Skia就是Flutter向GPU提供数据的途径
Skia(全称Skia Graphics Library(SGL))是一个C++编写的图形库,能在低端设备上呈现高质量的2D图形,最初由Skia公司开发,后被Google收购.
目前,Skia已然是Android官方的图像渲染引擎了,因此Flutter Android SDK无需内嵌Skia引擎就可以获得天然的Skia支持.该引擎应用于Android,Google Chrome, Chrome OS等等当中.
而对于iOS平台来说,有Skia是跨平台的,因此它作为Flutter iOS渲染引擎被嵌入到Flutter的iOS SDK中,替代iOS闭源的Core Graphics/Core Animation /Core Text,这也正是Flutter iOS SDK打包的App包体积比Android要大的原因.

4、三棵树。Widget、Element、RenderObject.
    Widget，有createElement。生成Element。
    Element，renderObject。
    简而言之是为了性能，为了复用Element从而减少频繁创建和销毁RenderObject。因为实例化一个RenderObject的成本是很高的，频繁的实例化和销毁RenderObject对性能的影响比较大，
所以当Widget树改变的时候，Flutter使用Element树来比较新的Widget树和原来的Widget树：
可以说Element是存在于可变Widget树和不可变RenderObject树之间的桥梁。Element擅长比较两个Object，在Flutter里面就是Widget和RenderObject。它的作用是配置好Widget在树中的位置，
并且保持对于相对应的RenderObject和Widget的引用。
```
// 是否重绘Element，其核心就是canUpdate，判断两个Widget是否相等。
// 如果某一个位置的Widget和新Widget不一致，才需要重新创建Element；
// 如果某一个位置的Widget和新Widget一致时(两个widget相等或runtimeType与key相等)，则只需要修改RenderObject的配置，不用进行耗费性能的RenderObject的实例化工作了；
// 因为Widget是非常轻量级的，实例化耗费的性能很少，所以它是描述APP的状态（也就是configuration）的最好工具；重量级的RenderObject（创建十分耗费性能）则需要尽可能少的创建，并尽可能的复用；
static bool canUpdate(Widget oldWidget, Widget newWidget) {
    return oldWidget.runtimeType == newWidget.runtimeType && oldWidget.key == newWidget.key;
}
```

7.11
Dart语法。
1、dart中所有变量都是对象，即使是int类型。比如 int count; if (count == null) 这样的判断是完全可以的，因为万物皆对象。
2、dart中声明变量var、final，一般在函数内部建议是用var，而不是指定类型。
3、final、const。 

7.12
1、基本数据类型。num（包括：int、double）、String、bool、List、Map、Set、Rune、Symbol。 其中num中定义了各种运算符。+ - * / ~/等。
2、关于断言Asset(condition)，如果condition为true，则断言成功，则继续执行。如果为false则抛出异常。

3.7
Dart语言回顾。
语法习惯：
1、var修饰局部变量，即一般函数内部变量。
2、方法要有指定返回值。
```dart
// 返回值、成员变量最好指定类型
String name() { 
    var age = 12; // 局部变量使用var
    return '$age';
}
```
3、变量使用前必须初始化。
    注意：你并不需要在声明变量时初始化，只需在第一次用到这个变量前初始化即可。
4、late修饰符。延迟初始化一个变量。
    通常 Dart 的语义分析会在一个已声明为非空的变量被使用前检查它是否已经被赋值，但有时这个分析会失败。
    例如：在检查顶级变量和实例变量时，分析通常无法判断它们是否已经被初始化，因此不会进行分析。
    在下面这个例子中，如果 temperature 变量从未被使用的话，那么 readThermometer() 将永远不会被调用：
    late String temperature = readThermometer(); // Lazily initialized.
5、如果你不想更改一个变量，可以使用关键字 final 或者 const 修饰变量，这两个关键字可以替代 var 关键字或者加在一个具体的类型前。
    一个 final 变量只可以被赋值一次；一个 const 变量是一个编译时常量 (const 变量同时也是 final 的)。
    const构造方法，如果有，则参数必须是final类型。

6、标准类型及内置类型：
    num(int, double),
    String,
    Bool
    这些都是编译时字面量，所以可以使用const。而且如果使用final，会有警告。如果是字面量
    使用const的好处是编译就确定常量，这样可以提高程序性能，减少内存开销。
List，数组。var a = [1, 2];则会进行类型推导为List<int>
    const b = [1, 2, 3];
    b = a;
        var c = const [1, 2, 3];
        c = a;
        注意：上面两句代码的区别。主要还是const修饰谁的问题。其实两句代码都说明List不可变，但是const修饰b，
        那么b不可变，如果在给b重新赋值，就会报错。c因为是var修饰，所以c=a不会报错。
        final b = [1, 2, 3]
        b.add(4); ✅，因为final修饰的是b，那么数组其实还是可变的。b = a❌
Set，无序的元素唯一集合。一般Set底部都是hash表，hash表一定是无序的。而且里面的元素是唯一的。
        var halogens = {2, 1, 3};
        halogens.add(4);
        halogens.add(2);
        halogens.add(1);
        结果还是{2, 1, 3, 4}
        var emptySet = <String>{};
       Map，Map 是用来关联 keys 和 values 的对象。其中键和值都可以是任何类型的对象。
          每个 键 只能出现一次但是 值 可以重复出现多次。
          // 会推导成Map<dynamic, dynamic>类型
          var a = {};
          // 可以使用 <String, String>{};去指定类型
          var gifts = <String, String>{};
          // 会推导成Map<String, int>类型
          var b = {
            'a': 12,
            'b': 15
          };
       注意：List、Set、Map都是抽象类。

Characters字符。UTF-16的全称是“Unicode Transformation Format 16-bit”，即Unicode转换格式16位。
    Unicode 编码为每一个字母、数字和符号都定义了一个唯一的数值。因为 Dart 中的字符串是一个 UTF-16 的字符序列，
    所以如果想要表示 32 位的 Unicode 数值则需要一种特殊的语法。
    表示 Unicode 字符的常见方式是使用\u1231，其中 XXXX 是一个四位数的 16 进制数字。
    例如心形字符（♥）的 Unicode 为 \u2665。对于不是四位数的 16 进制数字，需要使用大括号将其括起来。
    例如大笑的 emoji 表情（😆）的 Unicode 为 \u{1f600}。
    如果你需要读写单个 Unicode 字符，可以使用 characters 包中定义的 characters getter。
    它将返回 Characters 对象作为一系列 grapheme clusters 的字符串。下面是使用 characters API 的样例：

7、在Flutter中，使用const关键字可以创建一个不可变的widget，这在某些情况下是非常有用的。
    首先，使用const关键字创建widget可以提高性能。当使用const关键字创建widget时，Flutter会在编译时进行静态分析并将相同的widget合并为一个，
    从而减少了运行时的开销。这可以帮助减少应用程序的内存使用和提高性能。
8、操作符is, is!, as、 ??=
9、构造函数
    1、dart会默认生成一个无名、无参的构造函数。
    2、如果有成员变量，那么成员变量必须是可选类型、或者指定了默认值。
        否则需要有构造函数去进行初始化。
    3、构造函数不能继承。所以父类有了自定义构造函数，那么子类必须显示声明构造函数，
        同时需要调父类的构造函数。
    4、还可以通过超累构造函数的方式。但是Dart版本必须是2.17之后
    5、初始化列表 
    6、重定向构造函数
    7、单利
    8、setter、getter方法。默认实力对象都有一个getter方法，同时如果是非final属性，那么还有一个setter方法。
    9、操作符。我们可以通过operator关键字来定义操作符方法。
```dart
class OperatorClass {
  final int x, y;

  OperatorClass(this.x, this.y);
  
  // 当我们重写  == 操作符时候，必须要重写hashCode。
  // 在Dart中，Object类定义了一个hashCode方法，它返回一个整数值，用于表示该对象的哈希码。哈希码是用于快速查找和比较对象的一种方式。
  // 哈希码是由哈希函数生成的，它会将对象的内容转换为一个数字，这个数字可以作为对象的标识符。
  // 如果两个对象的哈希码相同，那么它们不一定相等，这种情况称为哈希冲突。
  @override
  bool operator ==(Object other) {
    if (other is OperatorClass) {
      return other.x == x && other.y == y;
    }
    return false;
  }
  
  @override
  int get hashCode => Object.hash(x, y);

  // 自己定义operator
  int operator +(OperatorClass other) {
    return x + other.x + y + other.y;
  }
}
```
10、abstract抽象类，一般用于定义接口。当然也可以定义基类。如果是接口，一般通过implements关键字来实现。
11、enum。虽然枚举，没有swift强大。但是dart的枚举，也是可以定义方法、常量构造函数、属性的。以及实现接口的。
    每个enum都有一个index，即下标。 name、values等固定属性。当然也是只有2.17之后才有。
```dart
/// 可以实现超级enum，并且能够实现接口。
/// 同时枚举也是支持属性、常量构造方法、增加方法。
enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);


  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}
```
12、对mixin的理解。
13、关于泛型，即泛型限制，泛型方法的使用。
14、dart中避空运算符， ??=(只有为空才会赋值)、??(前面为空，则用后面的值和swift很像) 语法的含义。
15、代码联级..用法。
16、late延时赋值，当一个赋值时候使用了耗时操作（比如用到this)或者给一个值进行延时赋值。
    该变量可能不需要，并且初始化它的成本很高。
    您正在初始化一个实例变量，并且其初始值设定项需要访问this。类似late String temperature = readThermometer(); // Lazily initialized.

8.8
关于Flutter中，Flex、Row、Colum以及Flexible之间的关系。
class Flex extends MultiChildRenderObjectWidget
class Column extends Flex
class Row extends Flex
class Flexible extends ParentDataWidget<FlexParentData>
class Expand extends Flexible
两个属性：flex:可以用于表示剩余空间占用比例
         fit: loose和tight。loose是已flex来进行处理、tight是以child大小来进行处理。
其实Row和Column都是继承Flex的。Flexible必须在Flex中使用。

// 用于指定固定尺寸。它可以强制其子widget具有特定的宽度和高度
class SizedBox extends SingleChildRenderObjectWidget

class Spacer extends StatelessWidget

2、Text
class Text extends StatelessWidget
但是Text的实现其实是基于RichText实现的。所以有了Text.rich这样的初始话。

class RichText extends MultiChildRenderObjectWidget

3、注解：自带的注解有@Deprecated、@deprecated和@override
在Dart中，元数据注解（Metadata annotation）是一种用于给你的代码添加信息的工具。元数据注解以字符`@`开始，后面跟着一个编译时常量的引用。它们可以为编译器提供信息，或者在运行时被代码读取。以下是一些元数据注解的作用：

1. **编译指示**：元数据注解可以影响代码的编译过程。例如，`@override`注解告诉编译器，此方法是重写了其父类的方法。如果父类没有这个方法，编译器则会报错。

2. **代码生成**：一些库使用元数据注解来自动生成代码。例如，JSON序列化库 `json_serializable` 使用 `@JsonSerializable` 注解来标记需要生成序列化代码的类。

3. **文档工具**：元数据注解可以用于生成API文档。例如，`@Deprecated`注解可以标识不再推荐使用的代码，并在生成的API文档中显示这个信息。

4. **自定义插件或框架**：如果你正在创建你自己的库、框架或者插件，你可能会用到元数据注解。你可以定义自己的注解，并在处理这些注解时执行特殊的逻辑。

需要注意的是，虽然元数据注解可以被添加到任何声明式代码之前（例如，类、方法、函数参数等等），但是并不能改变这些代码的行为。元数据仅提供额外的信息，并需要特定的工具或者你自己的代码来读取和处理这些信息。
`@JsonSerializable`是Dart JSON序列化库（`json_serializable`）中的一个注解，常用于标记需要生成JSON序列化和反序列化代码的类。
以下是其工作原理：
1. **标记类**：在你需要进行JSON序列化或反序列化的类上添加`@JsonSerializable`注解。
2. **运行代码生成**：在命令行运行`flutter pub run build_runner build`命令。这个命令会触发`build_runner`包的构建脚本，`build_runner`是Dart中的一个构建系统，可以自动化执行某些任务，如代码生成。
3. **代码生成**：`build_runner`通过调用`json_serializable`包中的生成器（generator）来读取标记了`@JsonSerializable`注解的类，然后为这些类生成相应的JSON序列化和反序列化代码。生成的代码通常会在一个单独的文件中，文件名为`<source_file>.g.dart`，其中`<source_file>`是源文件的名字。
4. **使用生成的代码**：在源代码中，你可以使用`part`指令来引入生成的文件，然后就可以调用生成的序列化和反序列化方法了。
使用`@JsonSerializable`和代码生成可以避免手动编写序列化和反序列化的代码，大大提高了开发效率，同时也减少了出错的可能性。

4、import导入库。常见的几种场景：
import 'package:lib2/lib2.dart' as lib2;
import 'package:lib1/lib1.dart' show foo;
import 'package:lib2/lib2.dart' hide foo;
// 延迟加载
import 'package:greetings/hello.dart' deferred as hello;

5、flutter的基础数据类型：
Numbers (int, double)： Number是一个抽象类，int、double都是继承Number
Strings (String): 字符串
Booleans (bool)：Bool类型
Records ((value1, value2))：Record是dart 3.0引入的，有点类似Swift中的元祖。
```dart
Recod a = (1, 2);
(String, int) a = ('david', 3);
a.$1
a.$2
```
Lists (List, also known as arrays): List抽象类
Sets (Set): 集合
Maps (Map)：字典
Runes (Runes; often replaced by the characters API)：Runes是一个字符串的unicode编码对应的十进制数。
```dart
Runes input = new Runes(
    'Hello 🌍'
);

input.forEach((int rune) {
  var character=new String.fromCharCode(rune);
  print(character);
});
```
Symbols (Symbol)：符号
    Symbol 在JavaScript中是将基本数据类型转换为唯一标识符,最常见的应用是可以将复杂引用数据类型转换为对象数据类型的键名.
    在Dart中,Symbol 是不透明的动态字符串名称,用于反映库中的元数据.用 Symbol 可以获得或引用类的一个镜像，概念比较复杂，但其实和 JavaScript 的用法基本上是一致的。
    例如，下面代码首先 new 了一个 test 为 Map 数据类型，设置一个属性 #t（Symbol 类型），然后分别打印 test、test 的 #t、test 的 Symbol("t") 和 #t。
```dart
Map test = new Map();
test[#t] = "symbol test";
print(test);
print(test[#t]);
print(test[Symbol('t')]);
print(#t);
//运行结果：
Flutter: {Symbol("t"): symbol test}
Fultter: "symbol test"
Fultter: "symbol test"
Fultter:  Symbol("t")
```
The value null (Null): Null其实也是一种类型。

8.9
1、关于List的特殊用法。
```dart
var list = [1, 2, 3];
var list2 = [0, ...list];
assert(list2.length == 4);

var list2 = [0, ...?list];
assert(list2.length == 1);

var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
assert(listOfStrings[1] == '#1');

var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
```
2、泛型。常见的泛型比如List、Set、Map。通常泛型E、T、K、V
同时我们可以进行泛型限定
```dart
class Foo<T extends SomeBaseClass> {
  String toString() => "Instance of 'Foo<$T>'";
}

// 泛型方法
T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}
```

3、typedef 类似iOS中的typealice
```dart
typedef Compare<T> = int Function(T a, T b);
typedef IntList = List<int>;

```

4、Dart是类型安全的编程语言。
```dart
class Animal {
  void chase(Animal a) { ... }
  Animal get parent => ...
}

/// ✅✅✅✅✅✅✅✅✅✅
class HoneyBadger extends Animal {
  @override
  void chase(Object a) { ... }

  // 注意这里可以收紧
  @override
  HoneyBadger get parent => ...
}

/// ❌❌❌❌❌❌❌❌❌ 下面属于类型收紧，是不允许的，但是可以借助：covariant 关键字。
class Mouse extends Animal {...}

class Cat extends Animal {
  @override
  void chase(Mouse x) { ... }
}
```

5、Dart中的匹配模式。
```dart
void test() {
  var a = [1, 2, 4];
  switch (a) {
    case [var a, var b]:
      print('ab===$a-$b');
      break;
      // 注意这个地方的匹配，第一值可以指定
    case [2, final aa, final bb]:
      print('aabb===$aa-$bb');
      break;
    case [final c, final d, final e]:
      print('cde==$c-$d-$e');
      break;
  }
  // 输出是cde==1-2-4


  // 也可以通过这种方式进行解构
  var [c, d, e] = a;
  print('cde===$c-$d-$e');
  
}
```

6、修饰类的几个关键字。interface、base、final、sealed、abstract、mixin；

7、git rebase和git merge。其实两个的作用都是将另一个上的分支合并到当前分支上。

8、Flutter中的异常FlutterError。默认Flutter中的异常是不需要捕捉的，程序不会因为有exception就退出。
```dart
class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
}

class Vector3d extends Vector2d {
  final double z;

  // Vector3d(final double x, final double y, this.z) : super(x, y);
  Vector3d(super.x, super.y, this.z);
}

class Point {
    final double x;
    final double y;

    // Initializer list sets instance variables before
    // the constructor body runs.
      Point.fromJson(Map<String, double> json)
          : x = json['x']!,
            y = json['y']! {
        print('In Point.fromJson(): ($x, $y)');
      }
}
```

8.22
1、Future(Function one).then(Function two)。
    首先flutter是基于时间循环，EventLoop来执行任务。里面有两种循环event和microTask。
    上面Future的代码其中then就是添加到microTask中。

2、在Dart中，有一个Isolate的概念，它是什么呢？
    我们已经知道Dart是单线程的，这个线程有自己可以访问的内存空间以及需要运行的事件循环；
    我们可以将这个空间系统称之为是一个Isolate；
    比如Flutter中就有一个Root Isolate，负责运行Flutter的代码，比如UI渲染、用户交互等等；

Dart的异步编程（例如Future，async和await）是基于单线程事件循环模型的，异步操作（例如文件I/O，计时器，网络请求等）在后台执行，
并且当它们完成时，它们的结果会被排队在事件循环中等待处理。这意味着虽然异步操作可以在后台执行，但在主线程上的代码仍然是顺序执行的。
这种模型可以帮助我们编写非阻塞的代码，并在等待异步操作完成时，让出CPU供其它代码使用。这增加了程序的响应性，使得用户界面可以在等待这些操作完成时仍然保持响应。
然而，这并不意味着这些操作是在多核CPU上并行执行的。如果你需要在Dart中实现真正的并行化，你可以使用Isolate，每个Isolate都在其自己的线程中运行，
这些线程可以在多核CPU上并行执行。但是，Isolate之间不共享内存，它们通过消息传递进行通信。

iOS中
使用async/await并不一定会开辟新的线程。Swift的并发模型是基于任务（Task）的，而不是基于线程。一个任务可以在主线程或者在后台线程上执行。
当你在主线程上启动一个异步任务时，这个任务会在主线程上执行直到它遇到一个await表达式。这时，控制权会返回到调用异步函数的代码，然后异步任务会在后台线程上继续执行。
当异步操作完成后，异步任务会重新回到主线程上继续执行。这样就能避免阻塞主线程，同时确保UI操作在主线程上执行。

具体是否开辟新的线程，还需要看任务的具体情况和系统的调度。例如，如果一个异步任务是一个CPU密集型的任务，那么系统可能会为这个任务创建一个新的线程。
而对于一些IO密集型的任务（如网络请求），则可能会在已有的线程池中选择一个线程执行。这样可以最大限度地利用系统资源，避免无谓的线程切换带来的性能损失。


8.23
1、
async返回Future.
async*返回Stream.
async*比多了一个*，加上*其实是函数生成器的意思。 被async*标记的函数会在返回一组返回值，这些返回值会被包裹在Stream中。async*其实是为yield关键字发出的值提供了一个语法糖。
Async* 用于创建一个一次返回一堆未来值的函数。每个结果都包含在 Stream 中。
可以使用
await for(final a in _createStream()) {
    print('收到stream $a');
}
或者
final a = _createStream();
a.listen((event) {
    print('收到stream $event');
});
来进行数据监听
```dart
Stream<int> countForOneMinute() async* {
  for (int i = 1; i <= 60; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i; // 这里只能用yield来代替return，如果使用return会报错，提示勇士async
  }
}
```
当然上面就带来了另外一个问题，yield和yield*的区别。
yield：yield关键字后面直接跟的是你想要返回的值，它会将这个值直接发送给生成器函数的调用者。一旦执行了yield语句，就会暂停生成器函数的执行，等待下一次迭代。
yield*：yield*关键字后面跟的是一个可迭代的对象（Iterable）或者一个Stream，它会将这个对象中的所有值依次发送给生成器函数的调用者。这个过程会暂停生成器函数的执行，直到所有值都被发送完。


2、GetX的强大功能。
    1、路由方式包括命名路由和匿名路由。
    2、SnakeBar、Dialogue的自定义。
    3、内存缓存。Get.put 和 Get.find
    4、离线缓存。get_storage也是GetX作者提供的一种离线缓存方案，并不依赖原生，性能会更好。
    
23.9.26
1、Exception和Error的区别及使用场景。 总的来说Exception是用来捕获的，而Error用来解决的。
    Exception它们通常代表了由于外部系统的问题（如文件系统或网络），或由于用户的输入导致的问题。
    Error代表编程错误，这些问题应该在测试时被发现和修复，而不是在生产环境中捕获和处理。

3、PageStorageKey可以直接就实现了KeepAlive效果。

23.9.28
1、Android SDK中的配置。
    location指定位置
    SDK Platforms 列举了所有Android的系统版本，相当于升级xcode之后跟随升级的swift版本。
    SDK Tools 这里列出了所有可用的SDK工具，包括Android SDK Build-Tools，Android Emulator，Android SDK Platform-Tools等
    Android SDK Update Sites更新站点

10.7
1、async、await原理
并发和并行。 并发是系统管理多个I/O操作，交由CPU执行
并行：多核CPU同时运行。
多线程并发 操作系统在线程等待IO的时候，会阻塞当前线程，切换到其它线程，这样在当前线程等待IO的过程中，其它线程可以继续执行。
    当系统线程较少的时候没有什么问题，但是当线程数量非常多的时候，却产生了问题。一是系统线程会占用非常多的内存空间，二是过多的线程切换会占用大量的系统时间。
协程 运行在线程之上，当一个协程执行完成后，可以选择主动让出，让另一个协程运行在当前线程之上。协程并没有增加线程数量，
    只是在线程的基础之上通过分时复用的方式运行多个协程，而且协程的切换在用户态完成，切换的代价比线程从用户态到内核态的代价小很多。

2、
Widget![img.png](img.png)
直接继承于该类的主要子类有
StatelessWidget
StatefulWidget
ProxyWidget
RenderObjectWidget

Element![img_1.png](img_1.png)
直接继承于该类的主要子类有
ComponentElement
RenderObjectElement
从最上层总结看来，Widget和Element可以划分为两大类：组合类和渲染类；
上图中绿色的分支为组合类Widget和Element，蓝色的分支为渲染类Widget和Element

3.6
1、Widget，其中最为关键的内容
abstract class Widget {
    Key? key;

    Element createElement();

    static bool canUpdate(Widget oldWidget, Widget newWidget) {
    return oldWidget.runtimeType == newWidget.runtimeType
        && oldWidget.key == newWidget.key;
    }
}

abstract class StatelessWidget extends Widget {
    const StatelessWidget({ super.key });
    
    @override
    StatelessElement createElement() => StatelessElement(this);
    @protected
    Widget build(BuildContext context);
}

abstract class StatefulWidget extends Widget {
    const StatefulWidget({ super.key });
    
    @override
    StatefulElement createElement() => StatefulElement(this);
    
    @protected
    @factory
    State createState();
}

abstract class State<T extends StatefulWidget> with Diagnosticable {

    BuildContext get context 
    
    StatefulElement? _element;
    
    @protected
    @mustCallSuper
    void initState() 
    
    @protected
    void setState(VoidCallback fn) 
    
    @protected
    @mustCallSuper
    void deactivate() { }
    
    @protected
    @mustCallSuper
    void activate() { }
    
    @protected
    @mustCallSuper
    void dispose() 
    
    @protected
    Widget build(BuildContext context);
    
    @protected
    @mustCallSuper
    void didChangeDependencies() { }
}
注意Element和BuildContext关系
abstract class Element extends DiagnosticableTree implements BuildContext 
Element
   Element是Widget在树结构中的实例。每个Widget都会创建一个对应的Element。Element是桥接Widget和实际渲染树的关键。Element树是稳定的，即使Widget树在每次重建时都会重新创建，已存在的Element会被复用。
StatelessElement和StatefulElement分别对应StatelessWidget和StatefulWidget。

RenderObject是实际进行布局和绘制工作的对象。每个RenderObject都会有一个对应的RenderElement（一种特殊的Element），它们负责在Element树和RenderObject树之间建立联系。

渲染原理
Widget树的构建：应用启动时，会根据根Widget开始构建Widget树。
Element树的创建和更新：对于每个Widget，Flutter框架会创建或更新一个对应的Element。Element树基本上是Widget树的映射，但它是稳定的。
与RenderObject的关联：某些类型的Element（如RenderObjectElement）会创建或更新对应的RenderObject。RenderObject负责实际的布局和绘制工作。
布局和绘制：RenderObject树会进行布局（layout）和绘制（paint）操作，这些操作的结果会被发送到屏幕上，用户就可以看到应用的UI了。
状态变化和重建：当StatefulWidget的状态改变时（通过调用setState），Flutter框架会重新执行其State对象的build方法来构建新的Widget树。然后，这个新的Widget树会与当前的Element树进行对比，框架会更新Element树和RenderObject树，以反映Widget树的变化。
通过这一系列的步骤，Flutter能够高效地管理UI的构建和更新，实现流畅的用户体验。这个过程中，Element作为稳定的结构在Widget的不可变性和RenderObject的可变性之间起到了关键的桥梁作用。

不是每个Element都有对应的RenderObject。在Flutter的框架中，Element主要负责组织和维护Widget树的结构，而RenderObject负责具体的布局和绘制工作。根据Widget类型的不同，它们对应的Element可能会或者不会持有一个RenderObject。
具体来说：
RenderObjectWidget：这类Widget会创建一个对应的RenderObject。例如，基础的布局Widget如Container、Column和Row都是RenderObjectWidget的实例，它们直接对应于一个RenderObject。这类Widget的Element通常是RenderObjectElement类型的，它会持有并管理一个RenderObject。
StatelessWidget和StatefulWidget：这两种类型的Widget主要用于构建UI结构，并不直接涉及布局和绘制。它们对应的Element（分别是StatelessElement和StatefulElement）不直接持有RenderObject。但是，这些Widget的build方法可以返回一个RenderObjectWidget，这样间接通过RenderObjectWidget来创建RenderObject。
其它Widget类型：Flutter还有其他类型的Widget，如InheritedWidget和ProxyWidget，它们对应的Element也不直接持有RenderObject。这些Widget主要用于在Widget树中传递数据、控制Widget的配置等，而不直接参与布局或绘制。
总结来说，只有RenderObjectWidget及其子类的Element会直接持有一个RenderObject。其它类型的Widget可能通过其子Widget树中的RenderObjectWidget间接与RenderObject相关联。这种设计使得Flutter的UI系统既灵活又高效，可以支持复杂的布局和绘制需求，同时保持良好的组织和可维护性。

BuildContext在Flutter中是一个非常核心的概念，它主要用于在构建UI时标识Widget在Widget树中的位置。每个Widget都会关联一个BuildContext，而且在Flutter的整个Widget树中，每个BuildContext都是唯一的。BuildContext实际上是一个接口，真正的实现是由Element对象来提供的，这意味着每个Element都是一个BuildContext。

abstract class Element implements BuildContext {
    Widget get widget;
    BuildContext get context => this;
    
    // Element树的父节点
    Element? _parent;
    // Element树的子节点
    List<Element>? _children;
    
    // 从BuildContext中获取指定类型的最近的InheritedWidget
    @override
    InheritedWidget? dependOnInheritedElement(InheritedElement ancestor, {Object aspect});
    
    // 获取RenderObject，如果当前Element是一个RenderObjectElement
    @override
    RenderObject? findRenderObject();
    
    // 其它BuildContext方法...
}
Widget与Element：Widget只是一个不可变的配置描述，实际的UI构建过程是由Element来完成的。当Widget树被创建或更新时，Flutter框架会使用Widget的信息来创建或更新对应的Element树。Element持有Widget的实例，并负责根据Widget的描述来管理UI的生命周期。
Element与RenderObject：某些特定类型的Element（比如RenderObjectElement）会创建一个RenderObject。这些Element负责将Widget的配置应用到其对应的RenderObject上。RenderObject树负责实际的布局计算和UI绘制。
Widget与RenderObject：虽然Widget和RenderObject之间没有直接关联，但Widget通过Element间接控制RenderObject。Widget提供了构建和配置UI的声明，而RenderObject根据这些声明执行实际的布局和绘制工作。
总结来说，Widget提供了一个声明式的方式来构建和配置UI，Element作为桥梁负责管理Widget的生命周期和状态，而RenderObject则执行实际的布局和绘制操作。这三者的协同工作使得Flutter能够高效地构建和渲染复杂的UI界面。

abstract class BuildContext {
    // 获取与当前BuildContext关联的Widget
    Widget get widget;
    
    // 依赖某个InheritedWidget，并在该InheritedWidget变化时重新构建
    T dependOnInheritedWidgetOfExactType<T extends InheritedWidget>();
    
    // 找到最近的祖先Element对应的RenderObject
    RenderObject? findRenderObject();
    
    // 更多与定位、导航、资源访问相关的方法...
}
访问继承的Widget：通过BuildContext，我们可以使用类似Theme.of(context)或MediaQuery.of(context)这样的方法来访问树中最近的Theme或MediaQuery等继承的Widget。这是因为BuildContext提供了dependOnInheritedElement方法，该方法能够向上遍历Element树，找到最近的指定类型的InheritedWidget
static T of<T extends InheritedWidget>(BuildContext context) {
    final inheritedWidget = context.dependOnInheritedElement(_ancestor);
    return inheritedWidget as T;
}
获取尺寸和位置：BuildContext可以用来获取Widget的尺寸和位置信息。这是因为BuildContext关联的Element可能是一个RenderObjectElement，它持有一个RenderObject，我们可以通过findRenderObject方法获取到这个RenderObject，然后使用它来查询尺寸和位置信息。
Size? size = context.findRenderObject()?.size;
导航和路由：BuildContext也用于导航和路由，如使用Navigator.of(context)来进行页面跳转。这同样是通过BuildContext查找最近的Navigator Widget的Element实现的。
局部更新：在调用setState方法时，只会重新构建与当前BuildContext关联的Widget子树，这使得界面更新更加高效。

InheritedWidget是Flutter框架中一个非常重要的类，它允许在Widget树中有效地向下传递数据。当使用InheritedWidget时，任何依赖于这些数据的子Widget都可以在数据发生变化时被自动重建，而不需要手动传递回调函数或使用全局状态管理。
abstract class InheritedWidget extends Widget {
    const InheritedWidget({Key? key, required Widget child}) : super(key: key, child: child);
    
    @override
    InheritedElement createElement() => InheritedElement(this);
    
    // 用于判断旧的InheritedWidget和新的InheritedWidget是否等价
    // 当数据发生变化时，依赖于这个InheritedWidget的Widget是否需要重建，就是通过这个方法判断的
    @protected
    bool updateShouldNotify(covariant InheritedWidget oldWidget);
}
InheritedWidget通过updateShouldNotify方法，来判断当数据发生变化时，是否需要通知依赖于这个InheritedWidget的子Widget进行重建。如果返回true，则依赖它的子Widget将会重新构建。

Flutter中继承了InheritedWidget的一些类
Flutter框架中有很多类继承自InheritedWidget，以下是一些常见的例子：

Theme：Theme是一个非常常见的InheritedWidget，它用于传递主题数据。通过Theme.of(context)方法可以获取最近的Theme实例。
MediaQuery：MediaQuery提供了媒体查询信息，如设备的屏幕尺寸、设备的像素密度等。这对于响应式布局非常有帮助。
Locale（通过Localizations）：Localizations Widget提供了本地化资源的访问，它内部使用了InheritedWidget来传递Locale数据。
Navigator：虽然Navigator自身不是InheritedWidget，但它使用InheritedWidget来使得子Widget能够找到最近的Navigator状态。
Directionality：Directionality提供了文本方向信息，比如从左到右（LTR）还是从右到左（RTL）。
这些只是几个例子，实际上Flutter框架中使用了很多InheritedWidget来实现数据的有效传递和状态管理。通过InheritedWidget，Flutter能够实现高效的数据共享和Widget树的局部更新。

在Flutter中，StatefulWidget本身并不直接支持创建of方法。这是因为of方法通常与InheritedWidget配合使用，用于在Widget树中向下传递数据，并允许子Widget通过BuildContext访问这些数据。StatefulWidget和StatelessWidget是用于构建UI的基础，而InheritedWidget是为了数据共享和访问设计的。
然而，你可以通过结合使用StatefulWidget和InheritedWidget来实现类似的功能。这样做可以让你在StatefulWidget中管理状态，并通过一个内部的InheritedWidget来让子Widget访问这个状态。这种模式在Flutter中是很常见的。


Util、Manager、Helper的场景。
Util一般提供静态方法，比如StringUtils
class JSONUtil {
    static func toJSONString<T: Encodable>(_ object: T) -> String? {
    let encoder = JSONEncoder()
    guard let jsonData = try? encoder.encode(object) else { return nil }
    return String(data: jsonData, encoding: .utf8)
    }
}

Hellper含义：Helper类是为了提供一组辅助功能而存在的，通常用于支持其他类的操作。与Util不同，Helper可能不仅仅包含静态方法，也可能维护一些状态信息。
使用场景：当你的类需要一些额外的功能，但这些功能不足以构成一个独立的类时。例如，对特定对象模型的解析、特定数据格式的转换等。
class URLRequestHelper {
var baseURL: URL

    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func createURLRequest(endpoint: String, method: String = "GET") -> URLRequest? {
        guard let url = URL(string: endpoint, relativeTo: baseURL) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
}
Manager
含义：Manager类通常负责协调和管理一些资源或者复杂的逻辑，如连接管理、事务处理等。
class NetworkManager {
static let shared = NetworkManager()

    private init() {}
    
    func fetchData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: completion)
        task.resume()
    }
}

A/B测试，也称为拆分测试，是一种统计学方法，用于比较两个或多个版本（通常是两个版本，分别称为A和B）以确定哪个版本的性能更好。
黑盒测试，不需要编程知识，测试人员可以不了解程序的内部逻辑。
白盒测试，可以发现内部的设计和实现错误，包括逻辑错误、路径错误等。

CPU渲染
当在CPU上进行图形渲染时，Skia或其他图形库会根据绘图命令计算出每个像素点的颜色值。这个过程通常发生在系统的内存中。CPU会执行所有必要的图形计算，包括颜色混合、形状绘制、图像处理等操作。完成后，得到的像素数据（通常是一个位图或称为帧缓冲区）表示了最终应该显示在屏幕上的图像。
GPU渲染
当使用GPU进行图形渲染时，图形库会将绘制命令和数据发送到GPU。GPU使用它的并行处理能力来快速处理这些图形命令，生成对应的像素数据。这个过程一般发生在显存中，GPU会执行顶点着色、片元着色、纹理映射等操作，最终生成的也是一张位图，即一系列描述屏幕上每个像素颜色的数据。
显示在屏幕上需要的数据
无论是CPU渲染还是GPU渲染，最终的目标都是生成一张位图，这张位图包含了屏幕上每个像素的颜色值。这张位图就是渲染的最终产物，它会被发送到显示设备（如LCD显示器）上展示出来。

runApp函数
runApp函数接受一个Widget作为参数，这个Widget通常是应用的顶层Widget。runApp的实现大致可以分为以下几个步骤：

确保Widgets绑定：首先，runApp会调用WidgetsFlutterBinding.ensureInitialized()来确保Widgets框架与Flutter引擎正确绑定。WidgetsFlutterBinding是WidgetsBinding的一个具体实现，它负责初始化框架层面的服务，比如绘制、事件处理等。
设置根Widget：随后，runApp会通过WidgetsBinding的attachRootWidget方法将传入的Widget设置为根Widget。
启动渲染循环：最后，调用WidgetsBinding的scheduleWarmUpFrame方法来启动第一帧的渲染，进而触发应用的绘制流程。