import 'package:cofrinho_app/src/shared/models/piggy_bank_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountAvatar extends StatelessWidget {
  AccountAvatar(this.model);
  final PiggyBankModel model;

  @override
  Widget build(BuildContext context) {
    final splitName = model.title?.split(" ");
    final initals = splitName.length > 1
        ? "${splitName[0][0].toUpperCase()}${splitName[1] != '' ? splitName[0][1].toUpperCase() : ''}"
        : "${model.title[0].toUpperCase()}";

    return CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          initals,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.openSansCondensed(fontSize: 22),
        ));
  }
}
