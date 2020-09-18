import 'package:admob_flutter/admob_flutter.dart';
import 'package:cofrinho_app/src/utils/admob_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../generated/l10n.dart';
import '../../../../shared/models/piggy_bank_model.dart';
import '../../../../shared/widgets/circular_indicator_widget.dart';
import '../../../../utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'cubit/remove_cubit.dart';

class RemovePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoveCubit>(
      create: (context) => Modular.get<RemoveCubit>()..getBanks(),
      child: RemoveView(),
    );
  }
}

class RemoveView extends StatelessWidget {
  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        S.of(context).home_remove_title_page,
        style: GoogleFonts.satisfy(color: Colors.white),
      ),
      backgroundColor: ACCENT_COLOR,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  Widget _account(BuildContext context, PiggyBankModel model) {
    final splitName = model.title?.split(" ");
    final initals = splitName.length > 1
        ? "${splitName[0][0].toUpperCase()}${splitName[1] != '' ? splitName[0][1].toUpperCase() : ''}"
        : "${model.title[0].toUpperCase()}";

    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            initals,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.openSansCondensed(fontSize: 22),
          )),
      trailing: Container(
        child: IconButton(
          onPressed: () => openAlert(context, model),
          icon: Icon(
            Icons.delete_outline,
            color: Colors.red,
          ),
        ),
      ),
      title: Text(
        "${model.title}",
      ),
    );
  }

  Future<void> openAlert(BuildContext context, PiggyBankModel model) async {
    final alert = AlertDialog(
      title: Text("${S.of(context).home_remove_title_alert} ${model.title} ?"),
      content: Text(S.of(context).home_remove_content_alert),
      actions: [
        FlatButton(
          onPressed: () => Modular.to.pop(),
          child: Text(S.of(context).home_remove_action1_alert),
        ),
        FlatButton(
          onPressed: () async {
            Modular.to.pop();
            await context.bloc<RemoveCubit>().delete(model.id);
          },
          child: Text(S.of(context).home_remove_action2_alert),
        ),
      ],
    );
    await showDialog(context: context, builder: (_) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: _appBar(context),
        body: BlocListener<RemoveCubit, RemoveState>(
          listener: (context, state) {
            if (state is RemoveSuccess) {
              context.bloc<RemoveCubit>().getBanks();
            }
          },
          child: BlocBuilder<RemoveCubit, RemoveState>(
            builder: (context, state) {
              if (state is RemoveLoading) {
                return CircularIndicator();
              } else if (state is RemoveInitial) {
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
              } else if (state is GetSuccess) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return _account(context, state.data[index]);
                        },
                        separatorBuilder: (_, index) => Divider(),
                        itemCount: state.data.length,
                      ),
                    ),
                    AdmobBanner(
                      adUnitId: AdmobId.homeRemoveBanner,
                      adSize: AdmobBannerSize.BANNER,
                    )
                  ],
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
