import 'package:flutter/material.dart';
import 'package:get_it_demo/model/article_model.dart';
import 'package:get_it_demo/navigation/route_strings.dart';
import 'package:get_it_demo/view/articles/article_details.dart';
import 'package:get_it_demo/view/articles/article_view.dart';
import 'package:get_it_demo/view/home_page.dart';
import 'package:get_it_demo/view/login_page.dart';
import 'package:get_it_demo/view/no_route_found.dart';
import 'package:get_it_demo/view/payment_page.dart';
import 'package:get_it_demo/view/register_factory_async_demo.dart';
import 'package:get_it_demo/view/register_singleton_dependencies_demo.dart';
import 'package:get_it_demo/view/sign_up_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteStrings.loginRoute:
        return MaterialPageRoute<void>(
          builder: (_) => const LoginPage(),
        );
      case RouteStrings.signUpRoute:
        return MaterialPageRoute<void>(
          builder: (_) => const SignUp(),
        );
      case RouteStrings.homePageRoute:
        return MaterialPageRoute<void>(
          builder: (_) => const HomePage(),
        );
      case RouteStrings.paymentRoute:
        return MaterialPageRoute<void>(
          builder: (_) => const PaymentScreen(),
        );
      case RouteStrings.singletonDependenciesDemo:
        return MaterialPageRoute<void>(
          builder: (_) => const RegisterSingletonDependencies(),
        );
      case RouteStrings.registerFactoryAsyncDemo:
        return MaterialPageRoute<void>(
          builder: (_) => const RegisterFactoryAsyncDemo(),
        );
      case RouteStrings.articleList:
        return MaterialPageRoute<void>(
          builder: (_) => const ArticleView(),
        );
      case RouteStrings.articleDetails:
        final args = settings.arguments! as Articles;
        return MaterialPageRoute<void>(
          builder: (_) => ArticleDetails(articles: args),
        );
      // case RouteStrings.tempCounter:
      //   return MaterialPageRoute<void>(
      //     builder: (_) => const RandomCounterDemo(),
      //   );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => const NoRoutesFound(),
          settings: settings,
        );
    }
  }
}
