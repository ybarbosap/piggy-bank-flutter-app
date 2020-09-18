import 'package:admob_flutter/admob_flutter.dart';
import 'package:cofrinho_app/generated/l10n.dart';
import 'package:cofrinho_app/src/modules/home/sub_modules/add/cubit/cubit/add_cubit.dart';
import 'package:cofrinho_app/src/utils/admob_utils.dart';
import 'package:cofrinho_app/src/utils/size_utils.dart';
import 'package:cofrinho_app/src/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Modular.get<AddCubit>(),
      child: AddView(),
    );
  }
}

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final TextEditingController _titleController = TextEditingController();
  var s = Modular.get<S>();

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        s.home_add_title_page,
        style: GoogleFonts.satisfy(color: Colors.white),
      ),
      backgroundColor: ACCENT_COLOR,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  Widget _input() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: _titleController,
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }

  Widget _buttom() {
    return Container(
      height: 54,
      child: FlatButton(
        color: ACCENT_COLOR,
        onPressed: () {
          final title = _titleController.text.toString();
          context.bloc<AddCubit>().create(title);
        },
        child: Text(
          s.home_add_add,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: _appBar(),
        body: BlocListener<AddCubit, AddState>(
          listener: (context, state) {
            if (state is AddSuccess) {
              Modular.to.pop();
            }
          },
          child: Container(
            width: getWidth(context),
            height: getHeight(context),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _input(),
                          _buttom(),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: AdmobBanner(
                    adUnitId: AdmobId.homeAddBanner,
                    adSize: AdmobBannerSize.BANNER,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
