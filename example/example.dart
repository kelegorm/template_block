import "package:template_block/template_block.dart";

void main() {
  var statement = new TemplateBlock(_templateStatement);
  statement.assign("MIN", 0);
  statement.assign("MAX", 128);
  var methodFoo = new TemplateBlock(_templateMethodFoo);
  methodFoo.assign("#STATEMENTS", statement.process());
  statement = statement.clone();
  statement.assign("MIN", 512);
  statement.assign("MAX", 1024);
  methodFoo.assign("#STATEMENTS", statement.process());
  var methodBaz = new TemplateBlock(_templateMethodBaz);
  var clazz = new TemplateBlock(_templateClass);
  clazz.assign("NAME", "MyClass");
  clazz.assign("#METHODS", methodBaz.process());
  clazz.assign("#METHODS", methodFoo.process());
  var library = new TemplateBlock(_templateLibraryPart);
  library.assign("NAME", "my_lib");
  library.assign("#CLASSES", clazz.process());
  print(library.process().join("\n"));
}

final String _templateLibraryPart =
    '''
part of {{NAME}};

{{#CONSTANTS}}
{{#VARIABLES}}
{{#CLASSES}}
''';

final String _templateClass =
    '''
class {{NAME}} {
  {{#CONSTANTS}}
  {{#VARIABLES}}
  {{#METHODS}}
}
''';

final String _templateMethodFoo =
    '''
int foo(int start, int end) {
  $BAZ_NAME();
  {{#STATEMENTS}}
}
''';

const String BAZ_NAME = "baz";

final String _templateMethodBaz = '''
void $BAZ_NAME() {
}
''';

final String _templateStatement =
    '''
for (var i = {{MIN}}; i < {{MAX}}; i++) {
}''';
