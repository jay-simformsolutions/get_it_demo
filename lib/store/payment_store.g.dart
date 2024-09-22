// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentStore on _PaymentStore, Store {
  late final _$billableAmountAtom =
      Atom(name: '_PaymentStore.billableAmount', context: context);

  @override
  double get billableAmount {
    _$billableAmountAtom.reportRead();
    return super.billableAmount;
  }

  @override
  set billableAmount(double value) {
    _$billableAmountAtom.reportWrite(value, super.billableAmount, () {
      super.billableAmount = value;
    });
  }

  @override
  String toString() {
    return '''
billableAmount: ${billableAmount}
    ''';
  }
}
