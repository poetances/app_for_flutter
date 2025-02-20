import 'package:flutter/material.dart';

class VariableTutorial extends StatefulWidget {
  const VariableTutorial({Key? key}) : super(key: key);

  @override
  State<VariableTutorial> createState() => _VariableTutorialState();
}

class _VariableTutorialState extends State<VariableTutorial> {

  late String name = _getName();

  String _getName() {
    print('_getName start');
    return 'David';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Variable'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Text('''
1、若你启用了空安全，你必须在使用变量前初始化它的值。
int lineCount = 0;
2、你并不需要在声明变量时初始化，只需在第一次用到这个变量前初始化即可。例如，下面的代码是正确的，
因为 Dart 可以在 lineCount 被传递到 print() 时检测它是否为空:
int lineCount;
if (weLikeToCount) {
  lineCount = countLines();
} else {
  lineCount = 0;
}
print(lineCount);
*
* 3、late延时赋值
* 在下面这个例子中，如果 temperature 变量从未被使用的话，那么 readThermometer() 将永远不会被调用：
* late String temperature = readThermometer();
*
* 4、final和const
* final和const表示类型或者类不可改变。
* 区别final变量只会被赋值一次。
* const编译时候确定类型，const变量同时也是final变量。实例变量不能用const
*
* 5、只有当对象有const构造函数时候，才能使用const创建。
* class Person3 {
    int age;
    Person3(this.age);
  }
  * 使用 var per = const Person3(12); 则会报错，因为没有const构造方法。
 同时，如果有const构造函数，那么如果其参数不是const类型，我们是可以通过非const构造函数创建的。
  *
  * 6、关于Widget创建。其实编译器会提示那些位置需要const，但是我们还是需要知道其原理。
  * 首先增加const，可以在编译时候就确定Widget，从而减少内存开发和提高性能。其次，如果顶部Widget
  * 是const，那么其所有属性包括child都是必须是编译时候能够确定的字面常量。而且多层Widget，那么需要将
  * 最外层用const修饰。
  * 在 Flutter 中，使用 const 修饰的对象会被存储在编译时常量池中。这个常量池是在应用程序编译时由 Dart 编译器创建的，
  * 它位于可执行文件的常量段（.rodata 段）中。常量池中存储的对象在整个应用程序生命周期中都只会被分配一次，并且在运行时被共享。
  * 这里的常量池，其实就是我们所说的常量区。因为编译时候就确定，所以对内存和性能有很大帮助。    
  
  在Flutter中使用const来修饰Widget，如Text，确实可以提升性能。当你使用const关键字创建一个Widget时，Flutter框架可以在编译时（而非运行时）确定该Widget的配置，
  并且重复使用相同配置的Widget实例。这意味着如果你在你的代码中多次使用相同的const Text('Example')，实际上在内存中只会有一个Text实例。
  那么在程序的内存中将有两个Text实例。每个Text因为其显示的文本字符串不同，被视为不同的实例。即使你使用了const来修饰它们，由于它们的配置（在这里是文本内容）不同，它们仍然代表了两个不同的实例。 
  
  关于Object和dynamic，虽然使用一样，但是两者还是有些差别：
  dynamic的特点：
  类型绕过：使用dynamic声明的变量可以绕过静态类型检查。这意味着你可以在dynamic类型的变量上调用任何方法或访问任何属性而不会在代码编写时引发编译时错误。如果在运行时所执行的操作不适用于变量的实际类型，则会抛出运行时错误。
  灵活性：dynamic提供了极大的灵活性，允许你编写不受Dart静态类型系统约束的代码。这在与动态类型的API交互或进行快速原型开发时可能很有用。
  dynamic a = 12;
  for (final element in a) { } 不会报错。
  
  Object的特点：
  类型安全：使用Object或Object?声明的变量仍然受到Dart静态类型检查的约束。你不能在一个Object类型的变量上调用不存在的方法或访问不存在的属性，除非使用类型转换或显式地告诉编译器变量的具体类型。
  通用性：几乎所有Dart对象都是Object的实例，因此，使用Object（或Object?）可以让你声明一个可以引用任何Dart对象的变量。然而，除非通过类型检查或转换，否则你不能对其执行除Object类中定义的操作之外的任何操作。
  Object a = 12;
  for (final element in a) { } ❌会报错。  
         
          '''),
            ),
          ),
          ElevatedButton(onPressed: (){
            print(name); // 注意：只有使用到时候，_getName方法才会被调用。
          }, child: const Text('使用变量')),

          ElevatedButton(onPressed: (){
            _testException(); // 注意，这种error是不需要捕捉的
          }, child: const Text('Exception'))
        ],
      ),
    );
  }

  void _testException() {

    throw Exception('this is exception');
  }
}

class Person {
  final String age;
  const Person(this.age);
}

class Person2 {
  // 使用关键字 const 修饰变量表示该变量为 编译时常量。
  // 如果使用 const 修饰类中的变量，则必须加上 static 关键字，即 static const（译者注：顺序不能颠倒）。
  static const String age = '';
}

class Person3 {
  int age;
  Person3(this.age);
}