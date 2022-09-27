// brew tap dart-lang/dart && brew install dart
// dart run ./00_helloworld
void main(List<String> args) {
  //myVar();
  default_value();
}
void myVar()
{
  /*变量仅存储对象的引用。这里名为 name 的变量存储了一个 String 类型对象的引用，“Bob” 则是该对象的值。

name 变量的类型被推断为 String，但是你可以为其指定类型。如果一个对象的引用不局限于单一的类型，可以将其指定为 Object（或 dynamic）类型。*/
  var vname = 'Bob';
  Object oname = 'Bob';
  String name = 'wait';//也可以指定类型：
  print(name);
}
 void default_value(){
  /*在 Dart 中，未初始化以及可空类型的变量拥有一个默认的初始值 null。（如果你未迁移至 空安全，所有变量都为可空类型。）即便数字也是如此，因为在 Dart 中一切皆为对象，数字也不例外。*/
  int? lineCount;
  assert(lineCount == null);
  print(lineCount);
  //assert() 的调用将会在生产环境的代码中被忽略掉。在开发过程中，assert(condition) 将会在 条件判断 为 false 时抛出一个异常。
 }