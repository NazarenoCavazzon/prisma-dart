import 'package:prisma_cli/src/generator/ast/client/client.dart';

import 'ast/ast.dart';
import 'ast/schema/schema_builder.dart';

class Generator extends Ast {
  final String schema;
  Generator(super.dmmf,this.schema);

  String generate() {
    final StringBuffer code = StringBuffer();
    code.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    code.writeln('// ignore_for_file: non_constant_identifier_names');
    code.writeln();
    code.writeln('import \'package:orm/orm.dart\';');
    code.writeln('import \'package:json_annotation/json_annotation.dart\';');
    code.writeln();
    code.writeln('part \'prisma_generated.g.dart\';');
    code.writeln();
    code.writeln('//'.padRight(80, '*'));
    code.writeln('// This file was generated by Prisma ORM');
    code.writeln('// GitHub: https://github.com/odroe/prisma');
    code.writeln('//'.padRight(80, '*'));
    code.writeln();
    code.writeln(PrismaClientBuilder(this).codeString);
    code.writeln(SchemaBuilder(this).codeString);
    code.writeln("const schema='''$schema''';");


    return code.toString();
  }
}
