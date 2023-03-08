import 'package:flutter/material.dart';

class StandardTypePage extends StatefulWidget {
  const StandardTypePage({Key? key}) : super(key: key);

  @override
  State<StandardTypePage> createState() => _StandardTypePageState();
}

class _StandardTypePageState extends State<StandardTypePage> {

  @override
  void initState() {
    super.initState();

    // _listVar();
    // _setVar();
    // _mapVar();
    _runasVar();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('StandardType'),),
      body: const Center(
        child: SingleChildScrollView(
          child: Text(
              '''
          标准类型及内置类型：
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
           
           Characters字符。
             Unicode 编码为每一个字母、数字和符号都定义了一个唯一的数值。因为 Dart 中的字符串是一个 UTF-16 的字符序列，
             所以如果想要表示 32 位的 Unicode 数值则需要一种特殊的语法。
             表示 Unicode 字符的常见方式是使用\u1231，其中 XXXX 是一个四位数的 16 进制数字。
             例如心形字符（♥）的 Unicode 为 \u2665。对于不是四位数的 16 进制数字，需要使用大括号将其括起来。
             例如大笑的 emoji 表情（😆）的 Unicode 为 \u{1f600}。
             如果你需要读写单个 Unicode 字符，可以使用 characters 包中定义的 characters getter。
             它将返回 Characters 对象作为一系列 grapheme clusters 的字符串。下面是使用 characters API 的样例：
             
           Symbol可以实现动态的调用。一般我们是用不到的。
          '''
          ),
        ),
      ),
    );
  }

  void _constVar() {
    const age = 12;
    const isGood = true;
    const name = 'David';
  }

  void _listVar() {
    var a = [1, 2];
    a.add(3);

    final b = [1, 2, 3];
    b.add(4);

    // 报错
    const b1 = [1, 2, 3];
    // b1.add(4);

    var c = const [1, 2, 3];
    c = a;

    // List支持...和...? 扩展字符
    var d = [1, 2, ...c];
    print(d.length);

    // 支持内置if
    var e = [1, 2, if (c.length == 4) 4];
    print(e.length);

    // 支持内置for
    var f = ['#1', '#2', for (var i in c) '#$i'];
    print(f);
  }

  void _setVar() {
    // 字面量创建
    var halogens = {2, 1, 3};
    halogens.add(4);
    halogens.add(2);
    halogens.add(1);
    print(halogens);
    print(halogens);

    // 空Set。注意如果直接var emptySet = {}; 那么默认会推导成Map
    var emptySet = <String>{};
    emptySet.add('1');

    // 可以直接创建const
    const constantSet = {1, 2, 3};
  }

  void _mapVar() {
    // 会推导成Map<dynamic, dynamic>类型
    var a = {};

    // 可以使用 <String, String>{};去指定类型
    var gifts = <String, String>{};

    // 会推导成Map<String, int>类型
    var b = {
      'a': 12,
      'b': 15
    };

    // map中，同样支持if、for、const。
  }

  // 字符编码。其实就是Characters
  void _runasVar() {
    var a = 'hi 🇨🇳';
    print(a.length);
    print(a.substring(a.length - 1));
    print(a.characters.last);
  }
}
