import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'features/order/presentation/order_screen.dart';

final themeModeProvider = StateProvider<ThemeMode>((_) => ThemeMode.light);

class AppRoot extends ConsumerWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    return MaterialApp(
      title: 'SRV Order Builder',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: mode,
      home: const OrderScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}