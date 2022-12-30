import 'package:core/constants/constants.dart';
import 'package:core/generated/l10n.dart';
import 'package:core/theme/theme.dart';
import 'package:core/widgets/load_more_widget.dart';
import 'package:core/widgets/loader_overlay/loader_overlay_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/generated/l10n.dart';
import 'package:mobile/presentation/common/language/cubit/language_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:mobile/presentation/routes/routes.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    _preCacheImages();
    _initModules();

    super.initState();
  }

  List<BlocProvider> get providers => [
        BlocProvider<LanguageCubit>(
          create: (_) => getIt.get<LanguageCubit>(),
        ),
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
  }
}