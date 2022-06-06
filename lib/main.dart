import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/data/record.dart';
import 'package:flutter_application_7/logic/dash_upgrades.dart';
import 'package:flutter_application_7/logic/firebase_notifier.dart';
import 'package:flutter_application_7/model/firebase_state.dart';
import 'package:flutter_application_7/model/purchasable_product.dart';
import 'package:flutter_application_7/model/store_state.dart';
import 'package:flutter_application_7/provider/switch.dart';
import 'package:flutter_application_7/repo/iap_repo.dart';
import 'package:flutter_application_7/screens/achievements/achievement.dart';
import 'package:flutter_application_7/screens/questions.dart';
import 'package:flutter_application_7/screens/result/result.dart';
import 'package:flutter_application_7/screens/statistics.dart';
import 'package:flutter_application_7/widgets/parts/appbar.dart';
import 'package:flutter_application_7/widgets/parts/drawer.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart' as p;
import './screens/home.dart';
import './values/colors.dart' as custom_colors;
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import './test.dart';

//inapp Test
import './logic/dash_counter.dart';
import './logic/dash_purchases.dart';
//inappTest

//Route Aware Test
abstract class RouteAware {
  /// Called when the top route has been popped off, and the current route
  /// shows up.
  void didPopNext() {}

  /// Called when the current route has been pushed.
  void didPush() {}

  /// Called when the current route has been popped off.
  void didPop() {}

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  void didPushNext() {}
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  InAppPurchase;
  MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
      tagForChildDirectedTreatment: TagForChildDirectedTreatment.unspecified,
      testDeviceIds: <String>[
        "d3b14dfe-7806-41c1-a8e4-f064ca23dbe9",
        "b707453f-ec54-4d0e-8f08-c3d236ce513f"
      ]));

  ///in app purchase
  runApp(p.MultiProvider(providers: [
    p.ChangeNotifierProvider<FirebaseNotifier>(
        create: (_) => FirebaseNotifier()),
    p.ChangeNotifierProvider<DashCounter>(create: (_) => DashCounter()),
    p.ChangeNotifierProvider<DashUpgrades>(
      create: (context) => DashUpgrades(
        context.read<DashCounter>(),
        context.read<FirebaseNotifier>(),
      ),
    ),
    p.ChangeNotifierProvider<IAPRepo>(
      create: (context) => IAPRepo(context.read<FirebaseNotifier>()),
    ),
    p.ChangeNotifierProvider<DashPurchases>(
      create: (context) => DashPurchases(
        context.read<DashCounter>(),
        context.read<FirebaseNotifier>(),
        context.read<IAPRepo>(),
      ),
      lazy: false,
    ),
  ], child: const MyApp()));
}

Record R = Record();

//test inapp
// Gives the option to override in tests.
class IAPConnection {
  static InAppPurchase? _instance;
  static set instance(InAppPurchase value) {
    _instance = value;
  }

  static InAppPurchase get instance {
    _instance ??= InAppPurchase.instance;
    return _instance!;
  }
}
//inapp end

//루트 관리
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    //inapp

    //inapp

    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    // Load ads.
  }

  @override
  Widget build(BuildContext context) {
    R.loadRecord();

    //in app

    //in app end

    return Providers(
        providers: [
          Provider<DrawerSwitch>.value(
            drawerSwitch,
            disposer: (v) => v.dispose(),
          ),
          Provider<AppBarSwitch>.value(
            appBarSwitch,
            disposer: (v) => v.dispose(),
          ),
          Provider<HomeSwitch>.value(
            homeSwitch,
            disposer: (v) => v.dispose(),
          ),
        ],
        child: MaterialApp(
            title: 'A',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  color: custom_colors.primaryColor1,
                  actionsIconTheme: IconThemeData(
                    color: Colors.white,
                    size: 32,
                  )),
            ),
            home: Scaffold(
              appBar: const BaseAppBar(),
              drawer: const Drawer(child: BaseDrawer()),
              body: MaterialApp(
                navigatorObservers: [routeObserver],
                initialRoute: "/home",
                routes: {
                  '/home': (context) => const HomePage(),
                  '/question': (context) => const Question(),
                  '/result': (context) => const Result(),
                  '/achievement': (context) => const Achievement(),
                  '/test': (context) => const TestScreen(),
                  '/statistics': (context) => const Statistics(),
                },
              ),
            )));
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  TestScreenState createState() => TestScreenState();
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var firebaseNotifier = context.watch<FirebaseNotifier>();

    if (firebaseNotifier.isLoggingIn) {
      return const Center(
        child: Text('Logging in...'),
      );
    }
    return Center(
        child: ElevatedButton(
      onPressed: () {
        firebaseNotifier.login();
      },
      child: const Text('Login'),
    ));
  }
}

class TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    var firebaseNotifier = context.watch<FirebaseNotifier>();
    if (firebaseNotifier.state == FirebaseState.loading) {
      return _PurchasesLoading();
    } else if (firebaseNotifier.state == FirebaseState.notAvailable) {
      return _PurchasesNotAvailable();
    }

    if (!firebaseNotifier.loggedIn) {
      return const LoginPage();
    }

    var upgrades = context.watch<DashPurchases>();

    Widget storeWidget;
    switch (upgrades.storeState) {
      case StoreState.loading:
        storeWidget = _PurchasesLoading();
        break;
      case StoreState.available:
        storeWidget = _PurchaseList();
        break;
      case StoreState.notAvailable:
        storeWidget = _PurchasesNotAvailable();
        break;
    }
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      storeWidget,
      const Padding(
        padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
        child: Text(
          'Past purchases',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      const PastPurchasesWidget(),
    ]));
  }
}

class _PurchasesLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Store is loading'));
  }
}

class _PurchasesNotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Store not available'));
  }
}

class _PurchaseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var purchases = context.watch<DashPurchases>();
    var products = purchases.products;
    return Column(
      children: products
          .map((product) => _PurchaseWidget(
              product: product,
              onPressed: () {
                purchases.buy(product);
              }))
          .toList(),
    );
  }
}

class _PurchaseWidget extends StatelessWidget {
  final PurchasableProduct product;
  final VoidCallback onPressed;

  const _PurchaseWidget({
    required this.product,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var title = product.title;
    if (product.status == ProductStatus.purchased) {
      title += ' (purchased)';
    }
    return InkWell(
        onTap: onPressed,
        child: ListTile(
          title: Text(
            title,
          ),
          subtitle: Text(product.description),
          trailing: Text(_trailing()),
        ));
  }

  String _trailing() {
    switch (product.status) {
      case ProductStatus.purchasable:
        return product.price;
      case ProductStatus.purchased:
        return 'purchased';
      case ProductStatus.pending:
        return 'buying...';
    }
  }
}

class PastPurchasesWidget extends StatelessWidget {
  const PastPurchasesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var purchases = context.watch<IAPRepo>().purchases;
    return ListView.separated(
      shrinkWrap: true,
      itemCount: purchases.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(purchases[index].title),
        subtitle: Text(purchases[index].status.toString()),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}

////////////////////////////
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          flex: 2,
          child: DashClickerWidget(),
        ),
        Expanded(child: UpgradeList()),
      ],
    );
  }
}

class DashClickerWidget extends StatelessWidget {
  const DashClickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CounterStateWidget(),
          InkWell(
            // Don't listen as we don't need a rebuild when the count changes
            onTap: Provider.of<DashCounter>(context, listen: false).increment,
            child: Image.asset(context.read<DashPurchases>().beautifiedDash
                ? 'assets/dash.png'
                : 'assets/dash_old.png'),
          )
        ],
      ),
    );
  }
}

class CounterStateWidget extends StatelessWidget {
  const CounterStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // This widget is the only widget that directly listens to the counter
    // and is thus updated almost every frame. Keep this as small as possible.
    var counter = context.watch<DashCounter>();
    return RichText(
      text: TextSpan(
        text: 'You have tapped Dash ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: counter.countString,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const TextSpan(text: ' times!'),
        ],
      ),
    );
  }
}

class UpgradeList extends StatelessWidget {
  const UpgradeList({super.key});

  @override
  Widget build(BuildContext context) {
    var upgrades = context.watch<DashUpgrades>();
    return ListView(children: [
      _UpgradeWidget(
        upgrade: upgrades.tim,
        title: 'Tim Sneath',
        onPressed: upgrades.addTim,
      ),
    ]);
  }
}

class _UpgradeWidget extends StatelessWidget {
  final Upgrade upgrade;
  final String title;
  final VoidCallback onPressed;

  const _UpgradeWidget({
    required this.upgrade,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: ListTile(
          leading: Center(
            widthFactor: 1,
            child: Text(
              upgrade.count.toString(),
            ),
          ),
          title: Text(
            title,
            style: !upgrade.purchasable
                ? const TextStyle(color: Colors.redAccent)
                : null,
          ),
          subtitle: Text('Produces ${upgrade.work} dashes per second'),
          trailing: Text(
            '${NumberFormat.compact().format(upgrade.cost)} dashes',
          ),
        ));
  }
}

//in app class
