import 'package:admob_flutter/admob_flutter.dart';
import 'package:cofrinho_app/generated/l10n.dart';
import 'package:cofrinho_app/src/shared/models/operation_model.dart';
import 'package:cofrinho_app/src/shared/models/piggy_bank_model.dart';
import 'package:cofrinho_app/src/shared/widgets/circular_indicator_widget.dart';
import 'package:cofrinho_app/src/utils/admob_utils.dart';
import 'package:cofrinho_app/src/utils/size_utils.dart';
import 'package:cofrinho_app/src/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit/bank/bank_cubit.dart';
import 'cubit/drop_menu/drop_menu_cubit.dart';
import 'cubit/operations/operation_cubit.dart';

enum DropMenu { exit, edit, clear }

class BankPage extends StatelessWidget {
  BankPage(this.id);
  final int id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BankCubit>(
          create: (context) => Modular.get<BankCubit>()..getBankDetail(id)),
      BlocProvider<OperationCubit>(
          create: (context) =>
              Modular.get<OperationCubit>()..getOperations(id)),
      BlocProvider<DropMenuCubit>(
        create: (context) => Modular.get<DropMenuCubit>(),
      )
    ], child: BankView(id));
  }
}

class BankView extends StatefulWidget {
  BankView(this.id);
  final int id;
  @override
  _BankViewState createState() => _BankViewState();
}

class _BankViewState extends State<BankView>
    with SingleTickerProviderStateMixin {
  final TextEditingController _titleController = TextEditingController();

  AnimationController _animationController;
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.idle:
          break;
        case ScrollDirection.forward:
          _animationController.forward();
          break;
        case ScrollDirection.reverse:
          _animationController.reverse();
          break;
      }
    });

    _animationController = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
      value: 1,
    );

    super.initState();
  }

  Widget _dropMenu() {
    return BlocBuilder<DropMenuCubit, DropMenuState>(
      builder: (context, state) {
        if (state is DropMenuInitial)
          return DropdownButton<DropMenu>(
            icon: Icon(Icons.more_vert, color: ACCENT_COLOR),
            isExpanded: false,
            underline: Container(),
            items: [
              DropdownMenuItem<DropMenu>(
                child: Text(S.of(context).bank_dropmenu_change_title),
                value: DropMenu.edit,
              ),
              DropdownMenuItem<DropMenu>(
                child: Text(S.of(context).bank_dropmenu_reset_balance),
                value: DropMenu.clear,
              ),
              DropdownMenuItem<DropMenu>(
                child: Text(S.of(context).bank_dropmenu_change_account),
                value: DropMenu.exit,
                onTap: () async {},
              ),
            ],
            value: state.item,
            onChanged: (value) {
              switch (value) {
                case DropMenu.exit:
                  SharedPreferences.getInstance()
                      .then((prefs) => prefs.clear())
                      .then((_) {
                    Modular.to.pushNamed('/');
                  });
                  break;
                case DropMenu.edit:
                  _alertEditTitle(context);
                  break;
                case DropMenu.clear:
                  _alertClear(context);
                  break;
              }
            },
          );

        return Container();
      },
    );
  }

  Widget _appBar(BuildContext context, PiggyBankModel model) {
    return Container(
      height: 54,
      width: getWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/money.png",
            fit: BoxFit.cover,
            width: 44,
            height: 44,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              "${model.title}",
              style: GoogleFonts.satisfy(
                  fontSize: 22, color: SECONDARY_TEXT_COLOR),
            ),
          ),
          _dropMenu()
        ],
      ),
    );
  }

  Widget _bankDetail(BuildContext context, PiggyBankModel model) {
    var balance = model.balance;
    var balanceParsing = balance.toStringAsFixed(2);

    return Container(
      padding: const EdgeInsets.all(16),
      height: 160,
      width: getWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(context, model),
          const SizedBox(height: 16),
          Text(
            S.of(context).bank_balance_title,
            style: TextStyle(color: SECONDARY_TEXT_COLOR),
          ),
          Text(
            S.of(context).banl_balance(balanceParsing),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.nanumMyeongjo(
              fontSize: 38,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _noOperations(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: const EdgeInsets.all(3),
              margin: const EdgeInsets.only(bottom: 10),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              width: 55,
              height: 55,
              child: Image.asset(
                "assets/notificacao.png",
                fit: BoxFit.cover,
              )),
          Text(
            S.of(context).bank_no_operation,
            style: TextStyle(color: SECONDARY_TEXT_COLOR),
          ),
        ],
      ),
    );
  }

  Widget _operationsContainer(OperationModel model) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Text(
          "${model.type[0]}",
          style: TextStyle(
            color: model.type == "Deposit" || model.type == "Deposito"
                ? Colors.green[200]
                : Colors.red[100],
            fontSize: 22,
          ),
        ),
      ),
      subtitle: Text("${model.date}"),
      title: Text("${model.type}"),
      trailing: Text(S.of(context).banl_balance(model.value.toStringAsFixed(2))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<BankCubit, BankState>(
              builder: (context, state) {
                if (state is BankLoading) {
                  return Container(
                    width: getWidth(context),
                    height: 170,
                    child: CircularIndicator(),
                  );
                } else if (state is BankSuccess) {
                  return Column(
                    children: [
                      _bankDetail(context, state.model),
                      AdmobBanner(
                        adUnitId: AdmobId.bankBanner,
                        adSize: AdmobBannerSize.BANNER,
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
            Expanded(
              child: BlocBuilder<OperationCubit, OperationState>(
                builder: (context, state) {
                  if (state is OperationLoading) {
                    return CircularIndicator();
                  } else if (state is OperationSuccess) {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: state.data.length,
                      itemBuilder: (_, index) =>
                          _operationsContainer(state.data[index]),
                    );
                  } else if (state is OperationInitial) {
                    return Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: _noOperations(context),
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
        floatingActionButton: ScaleTransition(
          scale: _animationController,
          child: FloatingActionButton(
            onPressed: () {
              Modular.to
                  .pushNamed("/bank/add", arguments: widget.id)
                  .then((_) async {
                await context.bloc<OperationCubit>().getOperations(widget.id);
                await context.bloc<BankCubit>().getBankDetail(widget.id);
              });
            },
            mini: true,
            child: Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
      ),
    );
  }

  Future<void> _alertEditTitle(BuildContext context) async {
    var alert = AlertDialog(
      title: Text(S.of(context).bank_dropmenu_edit_title_title),
      content: TextField(
        controller: _titleController,
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: Text(S.of(context).bank_dropmenu_edit_title_cancel),
        ),
        FlatButton(
          onPressed: () {
            Modular.to.pop();
            context
                .bloc<BankCubit>()
                .updateTile(_titleController.value.text, widget.id)
                .then((_) {
              _titleController.clear();
            });
          },
          child: Text(S.of(context).bank_dropmenu_edit_title_confirm),
        ),
      ],
    );

    await showDialog(context: context, builder: (_) => alert);
  }

  Future<void> _alertClear(BuildContext context) async {
    var alert = AlertDialog(
      title: Text(S.of(context).bank_clear_operation_title),
      content: Text(S.of(context).bank_clear_operation_alert),
      actions: [
        FlatButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: Text(S.of(context).home_remove_action1_alert),
        ),
        FlatButton(
          onPressed: () {
            Modular.to.pop();
            context.bloc<OperationCubit>().clearOperations(widget.id).then((_) {
              context.bloc<BankCubit>().getBankDetail(widget.id).then((_) {});
            });
          },
          child: Text(S.of(context).home_remove_action2_alert),
        ),
      ],
    );

    await showDialog(context: context, builder: (_) => alert);
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _animationController?.dispose();
    super.dispose();
  }
}
