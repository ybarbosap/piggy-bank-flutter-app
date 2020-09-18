// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(balance) => "\$ ${balance}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "bank_add_deposit" : MessageLookupByLibrary.simpleMessage("Deposit"),
    "bank_add_hint_text" : MessageLookupByLibrary.simpleMessage("\$"),
    "bank_add_insufficient" : MessageLookupByLibrary.simpleMessage("Insufficient balance to carry out operation"),
    "bank_add_title_buttom" : MessageLookupByLibrary.simpleMessage("Save"),
    "bank_add_withdraw" : MessageLookupByLibrary.simpleMessage("Withdraw"),
    "bank_balance_title" : MessageLookupByLibrary.simpleMessage("CURRENT BALANCE"),
    "bank_clear_operation_alert" : MessageLookupByLibrary.simpleMessage("You will not be able to recover the data again. Do you wish to continue?"),
    "bank_clear_operation_title" : MessageLookupByLibrary.simpleMessage("Warning"),
    "bank_dropmenu_change_account" : MessageLookupByLibrary.simpleMessage("Exit"),
    "bank_dropmenu_change_title" : MessageLookupByLibrary.simpleMessage("Change title"),
    "bank_dropmenu_edit_title_cancel" : MessageLookupByLibrary.simpleMessage("Cancel"),
    "bank_dropmenu_edit_title_confirm" : MessageLookupByLibrary.simpleMessage("Confirm"),
    "bank_dropmenu_edit_title_title" : MessageLookupByLibrary.simpleMessage("New title"),
    "bank_dropmenu_reset_balance" : MessageLookupByLibrary.simpleMessage("Reset balance"),
    "bank_no_operation" : MessageLookupByLibrary.simpleMessage("No operations registered"),
    "banl_balance" : m0,
    "home_add" : MessageLookupByLibrary.simpleMessage("Add"),
    "home_add_add" : MessageLookupByLibrary.simpleMessage("Register"),
    "home_add_title_page" : MessageLookupByLibrary.simpleMessage("Register"),
    "home_buttom_select" : MessageLookupByLibrary.simpleMessage("Select"),
    "home_manager" : MessageLookupByLibrary.simpleMessage("Manage Accounts"),
    "home_no_account" : MessageLookupByLibrary.simpleMessage("No account registered"),
    "home_remove" : MessageLookupByLibrary.simpleMessage("Remove"),
    "home_remove_action1_alert" : MessageLookupByLibrary.simpleMessage("No"),
    "home_remove_action2_alert" : MessageLookupByLibrary.simpleMessage("Yes"),
    "home_remove_content_alert" : MessageLookupByLibrary.simpleMessage("All statements and information will be deleted. You will not be able to recover this data"),
    "home_remove_success_message" : MessageLookupByLibrary.simpleMessage("Has been deleted"),
    "home_remove_title_alert" : MessageLookupByLibrary.simpleMessage("Delete "),
    "home_remove_title_page" : MessageLookupByLibrary.simpleMessage("Remove")
  };
}
