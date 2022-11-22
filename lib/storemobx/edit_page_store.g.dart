// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdatePostStore on _UpdatePostStore, Store {
  late final _$titleAtom =
      Atom(name: '_UpdatePostStore.title', context: context);

  @override
  TextEditingController get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(TextEditingController value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$bodyAtom = Atom(name: '_UpdatePostStore.body', context: context);

  @override
  TextEditingController get body {
    _$bodyAtom.reportRead();
    return super.body;
  }

  @override
  set body(TextEditingController value) {
    _$bodyAtom.reportWrite(value, super.body, () {
      super.body = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
body: ${body}
    ''';
  }
}
