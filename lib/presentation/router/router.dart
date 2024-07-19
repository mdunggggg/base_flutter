import 'package:auto_route/annotations.dart';
import 'package:auto_route/src/route/auto_route_config.dart';
import 'package:injectable/injectable.dart';

import 'router.gr.dart';


@injectable
@AutoRouterConfig()
class AppRouter extends $AppRouter{
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page),
  ];

}