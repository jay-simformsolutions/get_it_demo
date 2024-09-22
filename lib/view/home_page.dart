import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it_demo/common_widget/custom_button.dart';
import 'package:get_it_demo/locator/locator.dart';
import 'package:get_it_demo/navigation/route_strings.dart';
import 'package:get_it_demo/store/home_store.dart';
import 'package:get_it_demo/values/string_constants.dart';

import '../model/payment_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore store;

  @override
  void initState() {
    super.initState();

    /// Access home store object using get_it
    store = getIt.get<HomeStore>();
    store.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringConstants.getItDemo,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Observer(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                  buttonText: StringConstants.articles,
                  function: () {
                    Navigator.pushNamed(
                      context,
                      RouteStrings.articleList,
                    );
                  }),
              const SizedBox(height: 10),
              CustomElevatedButton(
                  buttonText: StringConstants.registerAsyncFactory,
                  function: () {
                    Navigator.pushNamed(
                      context,
                      RouteStrings.registerFactoryAsyncDemo,
                    );
                  }),
              const SizedBox(height: 10),
              CustomElevatedButton(
                  buttonText: StringConstants.singletonDependenciesDemo,
                  function: () {
                    Navigator.pushNamed(
                      context,
                      RouteStrings.singletonDependenciesDemo,
                    );
                  }),
              const SizedBox(height: 10),
              CustomElevatedButton(
                  buttonText: StringConstants.scopes,
                  function: () {
                    Navigator.pushNamed(
                      context,
                      RouteStrings.paymentRoute,
                    );
                  }),
              CustomElevatedButton(
                  buttonText: StringConstants.accessScopeVariable,
                  function: () {
                    /// step-7 Try to access scope variable
                    if (getIt.hasScope(StringConstants.paymentScope)) {
                      final amount =
                          getIt.get<PaymentBankModel>().bankAccountNo ?? 0;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(amount.toString()),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            StringConstants.objectIsNotRegister,
                          ),
                        ),
                      );
                    }
                  }),
            ],
          ),
        );
      }),
    );
  }
}
