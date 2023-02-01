import 'package:core/constants/constants.dart';
import 'package:core/generated/l10n.dart';
import 'package:core/theme/theme.dart';
import 'package:core/widgets/load_more_widget.dart';
import 'package:core/widgets/loader_overlay/loader_overlay_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../data/datasources/local/data_manager.dart';
import '../di/injection.dart';
import '../generated/l10n.dart';
import 'common/language/cubit/language_cubit.dart';
import 'common/user/bloc/user_bloc.dart';
import 'common/user/user_delegate.dart';
import 'routes/routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with UserDelegate {
  UserBloc get _userBloc => getIt.get<UserBloc>();
  DataManager get _dataManager => getIt.get<DataManager>();

  @override
  void initState() {
    _preCacheImages();
    _initModules();

    super.initState();
  }

  @override
  void onLoggedIn() {
    // TODO: implement onLoggedIn
  }

  @override
  void onLogout() {
    // TODO: implement onLogout
  }

  List<BlocProvider> get providers => [
        BlocProvider<LanguageCubit>(
          create: (_) => getIt.get<LanguageCubit>(),
        ),
        BlocProvider<UserBloc>(
          create: (_) => _userBloc,
        )
      ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return GlobalLoaderOverlay(
            useDefaultLoading: false,
            overlayWidget: const LoaderOverlayWidget(),
            overlayColor: Colors.black54,
            overlayOpacity: 0.3,
            child: RefreshConfiguration(
              headerBuilder: () => const WaterDropHeader(
                waterDropColor: AppColors.primary,
              ),
              headerTriggerDistance: 80.0,
              footerBuilder: () => CustomFooter(
                builder: (context, status) => LoadMoreFooter(status: status),
              ),
              springDescription: const SpringDescription(
                mass: 1.9,
                stiffness: 170,
                damping: 16,
              ),
              maxOverScrollExtent: 100,
              maxUnderScrollExtent: 0,
              enableScrollWhenRefreshCompleted: true,
              enableLoadingWhenFailed: true,
              hideFooterWhenNotFull: false,
              enableBallisticLoad: true,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: Locale.fromSubtags(languageCode: state.language),
                supportedLocales: S.delegate.supportedLocales,
                navigatorKey: rootNavigatorKey,
                onGenerateRoute: Routes.generateRoute,
                initialRoute: Routes.root,
                localizationsDelegates: const [
                  S.delegate,
                  SCore.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                ],
                theme: theme,
              ),
            ),
          );
        },
      ),
    );
  }

  void _preCacheImages() {
    //! cache internal image resource
  }

  void _initModules() {
    //! init modules

    if (_dataManager.isFirstOpenApp()) {
      _dataManager.clearAll();
      _dataManager.saveFirstOpenApp();
    }

    Future.delayed(
      Duration.zero,
      () {
        _userBloc.delegate = this;
      },
    );
  }
}
