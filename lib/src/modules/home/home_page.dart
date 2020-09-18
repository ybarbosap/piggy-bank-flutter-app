import 'package:admob_flutter/admob_flutter.dart';
import 'package:cofrinho_app/src/shared/widgets/account_avatar_widget.dart';
import 'package:cofrinho_app/src/utils/admob_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../generated/l10n.dart';
import '../../modules/home/cubits/cubit/home_controller_cubit.dart';
import '../../shared/models/piggy_bank_model.dart';
import '../../shared/widgets/circular_indicator_widget.dart';
import '../../utils/size_utils.dart';
import '../../utils/theme_utils.dart';

enum Route { ADD, REMOVE }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<HomeControllerCubit>()..getBanks(),
      child: HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  Widget _background(BuildContext context) {
    return Container(
      width: getWidth(context),
      height: getHeight(context),
      child: Column(
        children: [
          Container(
            height: getHeight(context) * .3,
            decoration: BoxDecoration(color: ACCENT_COLOR),
          ),
          const Spacer()
        ],
      ),
    );
  }

  Widget _piggyIcon(BuildContext context) {
    final size = getHeight(context) * .14;
    return Padding(
      padding: EdgeInsets.only(top: (getHeight(context) * .025)),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Image.asset("assets/money.png"),
        ),
      ),
    );
  }

  Widget _account(BuildContext context, PiggyBankModel model) {
    return ListTile(
      leading: AccountAvatar(model),
      trailing: Container(
        height: 34,
        child: OutlineButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setInt("id", model.id);
            Modular.to.pushReplacementNamed("/bank", arguments: model.id);
          },
          child: Text(
            S.of(context).home_buttom_select,
            style: TextStyle(color: ACCENT_COLOR),
          ),
        ),
      ),
      title: Text(
        "${model.title}",
      ),
    );
  }

  Widget _cardPiggyAccounts(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: BlocBuilder<HomeControllerCubit, HomeControllerState>(
        builder: (context, state) {
          if (state is HomeControllerIsLoading) {
            return const CircularIndicator();
          } else if (state is HomeControllerInitial) {
            return Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  width: 55,
                  height: 55,
                  child: Image.asset(
                    "assets/notificacao.png",
                    fit: BoxFit.cover,
                  )),
              Text(
                S.of(context).home_no_account,
                style: TextStyle(color: SECONDARY_TEXT_COLOR),
              ),
            ]));
          } else if (state is HomeControllerSuccess) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: _account(context, state.data[index]));
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _manageButtom(final BuildContext context,
      {final String icon, final String label, final Route route}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (route == Route.ADD) {
              Modular.to.pushNamed("/home/add").then((_) async {
                await context.bloc<HomeControllerCubit>().getBanks();
              });
            } else {
              Modular.to.pushNamed("home/remove").then((_) async {
                await context.bloc<HomeControllerCubit>().getBanks();
              });
            }
          },
          child: Container(
              width: 45,
              height: 45,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset(
                "assets/$icon",
                color: ACCENT_COLOR,
                fit: BoxFit.cover,
              )),
        ),
        Text(
          label,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(color: SECONDARY_TEXT_COLOR),
        ),
      ],
    );
  }

  Widget _cardAddAccount(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            S.of(context).home_manager,
            style: GoogleFonts.satisfy(fontSize: 18, color: PRIMARY_TEXT_COLOR),
          ),
          _manageButtom(context,
              icon: "add_user.png",
              label: S.of(context).home_add,
              route: Route.ADD),
          _manageButtom(context,
              icon: "remove_user.png",
              label: S.of(context).home_remove,
              route: Route.REMOVE),
        ],
      ),
    );
  }

  Widget _cardContainer(BuildContext context) {
    return Center(
      child: Container(
        height: getHeight(context) * .6,
        width: getWidth(context) * .9,
        child: Column(
          children: [
            Expanded(flex: 2, child: _cardPiggyAccounts(context)),
            const SizedBox(height: 15),
            Expanded(flex: 1, child: _cardAddAccount(context)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _background(context),
            _piggyIcon(context),
            _cardContainer(context),
            Positioned(
              bottom: 0,
              child: AdmobBanner(
                adUnitId: AdmobId.homeBanner,
                adSize: AdmobBannerSize.BANNER,
              ),
            )
          ],
        ),
      ),
    );
  }
}
