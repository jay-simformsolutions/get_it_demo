import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it_demo/navigation/route_strings.dart';
import 'package:get_it_demo/store/payment_store.dart';
import 'package:get_it_demo/values/string_constants.dart';

import '../locator/locator.dart';
import '../model/payment_model.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late TextEditingController amount;
  late TextEditingController discountAmount;
  late PaymentStore paymentStore;

  @override
  void initState() {
    super.initState();
    paymentStore = getIt.get<PaymentStore>();

    /// Step - 5 push payment scope
    getIt.pushNewScope(
      scopeName: StringConstants.paymentScope,
      init: (getIt) {
        initializeDependency();
        getIt.registerLazySingleton(() => PaymentBankModel());
      },
      dispose: () {
        amount.dispose();
        discountAmount.dispose();
      },
    );

    amount = TextEditingController();
    discountAmount = TextEditingController();
  }

  @override
  void dispose() {
    /// Step-6 pop the payment scope
    getIt.popScope();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Amount',
                labelText: 'Enter Discount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: discountAmount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Discount',
                labelText: 'Enter Discount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                paymentStore.totalBillAmount(
                  int.parse(amount.text),
                  int.parse(discountAmount.text),
                );
                setState(() {});
              },
              child: const Text(StringConstants.generateBill),
            ),
            const SizedBox(
              height: 16,
            ),
            Observer(builder: (context) {
              return Text(
                'Total Bill is ${paymentStore.billableAmount}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            }),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteStrings.paymentRoute);
              },
              child: const Text(StringConstants.payBill),
            ),
          ],
        ),
      ),
    );
  }
}
