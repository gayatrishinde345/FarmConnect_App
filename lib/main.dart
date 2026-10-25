import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/routes/routes.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_bloc_observer.dart';
import 'data/provider/app_provider.dart';
import 'feature/home_module/pages/home_page.dart';
import 'feature/profile_module/business_logic/bloc/language_bloc.dart';
import 'l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(const FarmConnectApp());
}

class FarmConnectApp extends StatelessWidget {
  const FarmConnectApp({super.key});
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: AppProviders.blocs,
    child: BlocProvider<LanguageBloc>(
      create: (_) => LanguageBloc()..add(const LoadLanguage()),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (_, state) => MaterialApp(
        navigatorKey: NavigationUtils.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'FarmConnect',
        theme: AppTheme.lightTheme,
        locale: state.locale,
        supportedLocales: const [Locale('en'), Locale('mr'), Locale('hi')],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        onGenerateRoute: AppRoutes.onGenerateRoute,
        home: const HomePage(),
        ),
      ),
    ),
  );
}
