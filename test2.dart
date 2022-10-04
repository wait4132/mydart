// brew tap dart-lang/dart && brew install dart
// dart run ./00_helloworld
void main(List<String> args) {
  myVar();
  default_value();
  variablesTest();
  FunctionTest();
  OperatorTest();
  ProcessControlTest();
}
// https://dart.cn/guides/language/language-tour#variables
void variablesTest() {
  var name = 'Bob';
  int? lineCount;
  assert(lineCount == null);
  lineCount = 0;
  print(name);
  print(lineCount);

  late String description;
  description = 'Feijoada!';
  print(description);

  final String nickname = 'Bobby';
  print(nickname);

  const bar = 1000000; // Unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // Standard atmosphere

  var foo = const [];
  const baz = []; // Equivalent to `const []`

  foo = [1, 2, 3]; // Was const []
  print(foo);
  print(baz);

  const Object i = 3; // Where i is a const Object with an int value...
  const list = [i as int]; // Use a typecast.
  const map = {if (i is int) i: 'int'}; // Use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.

  var y = 1.1;
  var exponents = 1.42e5;

  num x = 1; // x can have both int and double values
  x += 2.5;
  print(x);
  print(y);
  print(exponents);
  print(set);
  print(map);

  // String -> int
  var one = int.parse('1');
  assert(one == 1);

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 | 4) == 7); // 0011 | 0100 == 0111
  assert((3 & 4) == 0); // 0011 & 0100 == 0000

  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;

  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  print(s1);
  print(s2);
  print(s3);
  print(s4);

  var s = 'string interpolation';

  assert('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, '
          'which is very handy.');
  assert('That deserves all caps. '
          '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. '
          'STRING INTERPOLATION is very handy!');

  var ss = '字符串插值';

  assert('Dart 有$ss，使用起来非常方便。' == 'Dart 有字符串插值，使用起来非常方便。');
  assert('使用${ss.substring(3, 5)}表达式也非常方便' == '使用插值表达式也非常方便。');

  var ss1 = '可以拼接'
      '字符串'
      "即便它们不在同一行。";
  assert(ss1 == '可以拼接字符串即便它们不在同一行。');

  var ss2 = '使用加号 + 运算符' + '也可以达到相同的效果。';
  assert(ss2 == '使用加号 + 运算符也可以达到相同的效果。');

  var s5 = '''
  You can create
  multi-line strings like this one.
  ''';

  var s6 = """This is also a
  multi-line string.""";

  var s7 = r'在 raw 字符串中，转义字符串 \n 会直接输出 “\n” 而不是转义为换行。';

  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

  // These do NOT work in a const string.
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  const validConstString = '$aConstNum $aConstBool $aConstString';
  // const invalidConstString = '$aNum $aBool $aString $aConstList';

  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);

  // Check for zero.
  var hitPoints = 0;
  assert(hitPoints <= 0);

  // Check for null.
  var unicorn;
  assert(unicorn == null);

  // Check for NaN.
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);

  var list1 = [
    'Car',
    'Boat',
    'Plane',
  ];

  assert(list.length == 3);
  assert(list[1] == 2);

  //list[1] = 1;
  assert(list[1] == 1);

  var list2 = [0, ...list];
  assert(list2.length == 4);

  var nav = ['Home', 'Furniture', 'Plants', if (false) 'Outlet'];

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');

  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);

  assert(elements.length == 5);

  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  print(constantSet);

  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  var gifts1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var nobleGases1 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  var gifts2 = {'first': 'partridge'};
  gifts['fourth'] = 'calling birds'; // Add a key-value pair

  var gifts3 = {'first': 'partridge'};
  assert(gifts['fifth'] == null);

  var hi = 'Hi 🇩🇰';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
}

// https://dart.cn/guides/language/language-tour#functions
void FunctionTest() {
  void printElement(int element) {
    print(element);
  }

  var list = [1, 2, 3];

  // Pass printElement as a parameter.
  list.forEach(printElement);

  Function makeAdder(int addBy) {
    return (int i) => addBy + i;
  }

  print(makeAdder(5));

  fool() {}

  assert(fool() == null);
}

// https://dart.cn/guides/language/language-tour#operators
void OperatorTest() {
  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int
  assert(5 % 2 == 1); // Remainder

  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');

  assert(2 == 2);
  assert(2 != 3);
  assert(3 > 2);
  assert(2 < 3);
  assert(3 >= 3);
  assert(2 <= 3);

  // Assign value to a
  var a = 2, value, b;
  //a = value;
  // Assign value to b if b is null; otherwise, b stays the same
  b ??= value;

  a *= 3; // Assign and multiply: a = a * 3
  assert(a == 6);

  var done = false, col = 0;
  if (!done && (col == 0 || col == 3)) {
    // ...Do something...
  }

  final value1 = 0x22;
  final bitmask = 0x0f;

  assert((value1 & bitmask) == 0x02); // AND
  assert((value1 & ~bitmask) == 0x20); // AND NOT
  assert((value1 | bitmask) == 0x2f); // OR
  assert((value1 ^ bitmask) == 0x2d); // XOR
  assert((value1 << 4) == 0x220); // Shift left
  assert((value1 >> 4) == 0x02); // Shift right
//  assert((value1 >>> 4) == 0x02); // Unsigned shift right
  assert((-value >> 4) == -0x03); // Shift right
//  assert((-value >>> 4) > 0); // Unsigned shift right
  var isPublic = true;
  var visibility = isPublic ? 'public' : 'private';
  print(visibility);
}

void ProcessControlTest() {
  var message = StringBuffer('Dart is fun');
  for (var i = 0; i < 5; i++) {
    message.write('!');
  }
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