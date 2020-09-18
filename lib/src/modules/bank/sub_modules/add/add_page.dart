import 'package:admob_flutter/admob_flutter.dart';
import 'package:cofrinho_app/generated/l10n.dart';
import 'package:cofrinho_app/src/utils/admob_utils.dart';
import 'package:cofrinho_app/src/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cubit/add_cubit.dart';

class AddOPage extends StatelessWidget {
  AddOPage(this.id) : assert(id != null);
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddCubit>(
      create: (context) => Modular.get<AddCubit>()..setId(id),
      child: AddOView(),
    );
  }
}

class AddOView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final MoneyMaskedTextController _maskedTextController =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

  Widget _body(BuildContext context) {
    final List<DropdownMenuItem<String>> _itens = [
      DropdownMenuItem(
        child: Text(S.of(context).bank_add_deposit),
        value: S.of(context).bank_add_deposit,
      ),
      DropdownMenuItem(
          child: Text(S.of(context).bank_add_withdraw),
          value: S.of(context).bank_add_withdraw),
    ];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _maskedTextController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefix: Text(S.of(context).bank_add_hint_text)),
            ),
            BlocBuilder<AddCubit, AddState>(
              builder: (context, state) {
                if (state is AddInitialValue) {
                  return DropdownButton<String>(
                    items: _itens,
                    value: state.value,
                    isExpanded: true,
                    elevation: 16,
                    onChanged: context.bloc<AddCubit>().setDropItem,
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.bloc<AddCubit>().setDropItem(S.of(context).bank_add_deposit);
    return SafeArea(
      child: BlocListener<AddCubit, AddState>(
        listener: (context, state) {
          if (state is AddSuccess) {
            Modular.to.pop();
          }
        },
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.grey[100],
          body: Center(
            child: _body(context),
          ),
          appBar: AppBar(
            backgroundColor: Colors.grey[100],
            elevation: 0,
            iconTheme: IconThemeData(color: ACCENT_COLOR),
            bottom: PreferredSize(
              preferredSize: Size(320, 50),
              child: AdmobBanner(
                adUnitId: AdmobId.bankAddBanner,
                adSize: AdmobBannerSize.BANNER,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (_maskedTextController.value.text != "0.00")
                context
                    .bloc<AddCubit>()
                    .createOperation(
                        _maskedTextController.value.text.toString())
                    .then((value) {
                  if (value == null) showSnack(context);
                });
            },
            label: Text(S.of(context).bank_add_title_buttom),
            icon: Icon(Icons.save),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }

  void showSnack(BuildContext context) {
    var snack = SnackBar(
      content: Text(S.of(context).bank_add_insufficient),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.red,
    );
    _scaffoldKey.currentState.showSnackBar(snack);
  }
}
