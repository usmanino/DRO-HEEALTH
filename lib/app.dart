import 'package:dro/controller/Bloc/cubit/categories_cubit.dart';
import 'package:dro/controller/Bloc/cubit/database_cubit.dart';
import 'package:dro/controller/Bloc/cubit/suplement_cubit.dart';
import 'package:dro/core/app_config.dart';
import 'package:dro/core/styles.dart';
import 'package:dro/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Sizer(builder: (context, orientation, deviceType) {
        return BlocOverrides.runZoned(() => MultiBlocProvider(
              providers: [
                BlocProvider<SuplementCubit>(
                  create: (context) => SuplementCubit()..getSuplements(),
                ),
                BlocProvider<CategoriesCubit>(
                  create: (context) => CategoriesCubit()..getCategories(),
                ),
                BlocProvider(
                  create: (context) => DatabaseCubit()..initDatabase(),
                ),
              ],
              child: MaterialApp(
                title: AppConfig.app_name,
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light().copyWith(
                  textTheme: ThemeData.light().textTheme.apply(),
                  switchTheme: SwitchThemeData(
                    trackColor: MaterialStateProperty.all(kSecondaryColor),
                    thumbColor: MaterialStateProperty.all(kPrimaryColor),
                  ),
                  checkboxTheme: CheckboxThemeData(
                    fillColor: MaterialStateProperty.all(kPrimaryColor),
                  ),
                  appBarTheme: const AppBarTheme(
                    color: kScaffoldColor,
                  ),
                ),
                onGenerateRoute: AppRouter.route,
                initialRoute: DROPages.bottomnav,
              ),
            ));
      }),
    );
  }
}
