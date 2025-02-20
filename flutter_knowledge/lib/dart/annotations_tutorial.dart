import 'package:flutter/material.dart';

class AnnotationsTutorial extends StatelessWidget {
  const AnnotationsTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('注解'),),
      body: const SingleChildScrollView(
        child: Text("""
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
 
 注解（Annotations）在Dart（包括Flutter）中用于提供关于代码的元数据。这些元数据不会直接影响代码的运行，但可以被工具、库或编译器在编译时或运行时使用，以实现特定的行为或生成额外的代码。
 注解的作用相当于给代码加上了标签或备注，这些标签或备注可以被其他程序读取和解释。
 
 Four annotations are available to all Dart code: @Deprecated, @deprecated, @override, and @pragma. 
 For examples of using @override, see Extending a class. Here’s an example of using the @Deprecated annotation:  
 
 @Deprecated和@deprecated的区别，@Deprecated可以指定信息
 You can use @deprecated if you don’t want to specify a message. However, we recommend always specifying a message with @Deprecated.

  Flutter常见注解：
  @immutable: 标记一个类应该是不可变的。如果一个被@immutable标记的类有非final字段，Dart分析器会给出警告。这对于Flutter的Widget和Element类特别有用，因为它们应该是不可变的。
  @immutable
  class MyWidget extends StatelessWidget {
  final String title;

  const MyWidget({Key? key, required this.title}) : super(key: key);
  }
  
  @required: 在Flutter中，@required用于标记函数参数为必需的。但从Dart 2.12开始，可以使用required关键字代替，而不需要使用@required注解。
  许多第三方库也定义了自己的注解来启用各种功能，如JSON序列化（json_serializable库中的@JsonSerializable）、依赖注入等。
        """),
      ),
    );
  }

  /// Use [turnOn] to turn the power on instead.
  @Deprecated('user other instead')
  void activate() {
    turnOn();
  }
  void turnOn() { }

  /// 也可以自定义注解
  @Todo('Dash', 'Implement this function')
  void doSomething() {
    print('Do something');
  }
}

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}