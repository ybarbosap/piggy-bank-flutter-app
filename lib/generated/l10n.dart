// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Manage Accounts`
  String get home_manager {
    return Intl.message(
      'Manage Accounts',
      name: 'home_manager',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get home_add {
    return Intl.message(
      'Add',
      name: 'home_add',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get home_remove {
    return Intl.message(
      'Remove',
      name: 'home_remove',
      desc: '',
      args: [],
    );
  }

  /// `No account registered`
  String get home_no_account {
    return Intl.message(
      'No account registered',
      name: 'home_no_account',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get home_add_add {
    return Intl.message(
      'Register',
      name: 'home_add_add',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get home_add_title_page {
    return Intl.message(
      'Register',
      name: 'home_add_title_page',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get home_remove_title_page {
    return Intl.message(
      'Remove',
      name: 'home_remove_title_page',
      desc: '',
      args: [],
    );
  }

  /// `Delete `
  String get home_remove_title_alert {
    return Intl.message(
      'Delete ',
      name: 'home_remove_title_alert',
      desc: '',
      args: [],
    );
  }

  /// `All statements and information will be deleted. You will not be able to recover this data`
  String get home_remove_content_alert {
    return Intl.message(
      'All statements and information will be deleted. You will not be able to recover this data',
      name: 'home_remove_content_alert',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get home_remove_action1_alert {
    return Intl.message(
      'No',
      name: 'home_remove_action1_alert',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get home_remove_action2_alert {
    return Intl.message(
      'Yes',
      name: 'home_remove_action2_alert',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get home_buttom_select {
    return Intl.message(
      'Select',
      name: 'home_buttom_select',
      desc: '',
      args: [],
    );
  }

  /// `Has been deleted`
  String get home_remove_success_message {
    return Intl.message(
      'Has been deleted',
      name: 'home_remove_success_message',
      desc: '',
      args: [],
    );
  }

  /// `CURRENT BALANCE`
  String get bank_balance_title {
    return Intl.message(
      'CURRENT BALANCE',
      name: 'bank_balance_title',
      desc: '',
      args: [],
    );
  }

  /// `No operations registered`
  String get bank_no_operation {
    return Intl.message(
      'No operations registered',
      name: 'bank_no_operation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get bank_dropmenu_edit_title_cancel {
    return Intl.message(
      'Cancel',
      name: 'bank_dropmenu_edit_title_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Change title`
  String get bank_dropmenu_change_title {
    return Intl.message(
      'Change title',
      name: 'bank_dropmenu_change_title',
      desc: '',
      args: [],
    );
  }

  /// `Reset balance`
  String get bank_dropmenu_reset_balance {
    return Intl.message(
      'Reset balance',
      name: 'bank_dropmenu_reset_balance',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get bank_dropmenu_change_account {
    return Intl.message(
      'Exit',
      name: 'bank_dropmenu_change_account',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get bank_dropmenu_edit_title_confirm {
    return Intl.message(
      'Confirm',
      name: 'bank_dropmenu_edit_title_confirm',
      desc: '',
      args: [],
    );
  }

  /// `New title`
  String get bank_dropmenu_edit_title_title {
    return Intl.message(
      'New title',
      name: 'bank_dropmenu_edit_title_title',
      desc: '',
      args: [],
    );
  }

  /// `You will not be able to recover the data again. Do you wish to continue?`
  String get bank_clear_operation_alert {
    return Intl.message(
      'You will not be able to recover the data again. Do you wish to continue?',
      name: 'bank_clear_operation_alert',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get bank_clear_operation_title {
    return Intl.message(
      'Warning',
      name: 'bank_clear_operation_title',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get bank_add_deposit {
    return Intl.message(
      'Deposit',
      name: 'bank_add_deposit',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get bank_add_withdraw {
    return Intl.message(
      'Withdraw',
      name: 'bank_add_withdraw',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get bank_add_title_buttom {
    return Intl.message(
      'Save',
      name: 'bank_add_title_buttom',
      desc: '',
      args: [],
    );
  }

  /// `$`
  String get bank_add_hint_text {
    return Intl.message(
      '\$',
      name: 'bank_add_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Insufficient balance to carry out operation`
  String get bank_add_insufficient {
    return Intl.message(
      'Insufficient balance to carry out operation',
      name: 'bank_add_insufficient',
      desc: '',
      args: [],
    );
  }

  /// `$ {balance}`
  String banl_balance(Object balance) {
    return Intl.message(
      '\$ $balance',
      name: 'banl_balance',
      desc: '',
      args: [balance],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}