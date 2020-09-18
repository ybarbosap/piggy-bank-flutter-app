// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static m0(balance) => "R\$ ${balance}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "bank_add_deposit" : MessageLookupByLibrary.simpleMessage("Deposito"),
    "bank_add_hint_text" : MessageLookupByLibrary.simpleMessage("R\$"),
    "bank_add_insufficient" : MessageLookupByLibrary.simpleMessage("Saldo insuficiente para realizar operação"),
    "bank_add_title_buttom" : MessageLookupByLibrary.simpleMessage("Salvar"),
    "bank_add_withdraw" : MessageLookupByLibrary.simpleMessage("Saque"),
    "bank_balance_title" : MessageLookupByLibrary.simpleMessage("SALDO ATUAL"),
    "bank_clear_operation_alert" : MessageLookupByLibrary.simpleMessage("Não será possível recuperar os dados novamente. Deseja continuar?"),
    "bank_clear_operation_title" : MessageLookupByLibrary.simpleMessage("Aviso"),
    "bank_dropmenu_change_account" : MessageLookupByLibrary.simpleMessage("Sair"),
    "bank_dropmenu_change_title" : MessageLookupByLibrary.simpleMessage("Alterar título"),
    "bank_dropmenu_edit_title_cancel" : MessageLookupByLibrary.simpleMessage("Cancelar"),
    "bank_dropmenu_edit_title_confirm" : MessageLookupByLibrary.simpleMessage("Confirmar"),
    "bank_dropmenu_edit_title_title" : MessageLookupByLibrary.simpleMessage("Novo título"),
    "bank_dropmenu_reset_balance" : MessageLookupByLibrary.simpleMessage("Zerar saldo"),
    "bank_no_operation" : MessageLookupByLibrary.simpleMessage("Nenhuma operação registrada"),
    "banl_balance" : m0,
    "home_add" : MessageLookupByLibrary.simpleMessage("Adicionar"),
    "home_add_add" : MessageLookupByLibrary.simpleMessage("Cadastrar"),
    "home_add_title_page" : MessageLookupByLibrary.simpleMessage("Cadastrar"),
    "home_buttom_select" : MessageLookupByLibrary.simpleMessage("Selecionar"),
    "home_manager" : MessageLookupByLibrary.simpleMessage("Gerenciar Contas"),
    "home_no_account" : MessageLookupByLibrary.simpleMessage("Nenhuma conta cadastrada"),
    "home_remove" : MessageLookupByLibrary.simpleMessage("Remover"),
    "home_remove_action1_alert" : MessageLookupByLibrary.simpleMessage("Não"),
    "home_remove_action2_alert" : MessageLookupByLibrary.simpleMessage("Sim"),
    "home_remove_content_alert" : MessageLookupByLibrary.simpleMessage("Todos os extratos e informações serão deletados. Não será possível recuperar esses dados"),
    "home_remove_success_message" : MessageLookupByLibrary.simpleMessage("foi deletado"),
    "home_remove_title_alert" : MessageLookupByLibrary.simpleMessage("Deletar "),
    "home_remove_title_page" : MessageLookupByLibrary.simpleMessage("Remover")
  };
}
