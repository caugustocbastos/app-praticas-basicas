import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int? isoNumeroSemana(DateTime dataSelecionada) {
  // Ajusta para segunda-feira como primeiro dia da semana
  final adjustedDate = dataSelecionada
      .add(Duration(days: DateTime.monday - dataSelecionada.weekday));

  // Define a data da primeira quinta-feira do ano
  final firstThursday = DateTime(adjustedDate.year, 1, 4);

  // Ajusta para a primeira quinta-feira da semana
  final firstThursdayAdjusted = firstThursday
      .add(Duration(days: DateTime.monday - firstThursday.weekday));

  // Calcula o número da semana ISO
  final weekNumber =
      ((adjustedDate.difference(firstThursdayAdjusted).inDays / 7) + 1).floor();

  return weekNumber;
}

int? mesNumero(DateTime dataSelecionada) {
  return dataSelecionada.month;
}

int? anoNumero(DateTime dataSelecionada) {
  return dataSelecionada.year;
}

double currencyRealDouble(String? input) {
  //   // receber uma string eem moeda Brasileira e devolver um decimal, divida por 100 para considerar os sentavos
  if (input == null || input.isEmpty) {
    return 0.0;
  }
  final cleanInput = input.replaceAll(',', '.').replaceAll('R\$', '').trim();
  return double.parse(cleanInput) / 100.0;
}

String saudacao() {
  var hour = DateTime.now().hour;
  if (hour < 4) {
    return 'Boa Madrugada';
  }
  if (hour < 12) {
    return 'Bom dia';
  }
  if (hour < 18) {
    return 'Boa Tarde';
  }
  return 'Boa Noite';
}

String formatCurrency(String value) {
  if (value.isEmpty) {
    return '';
  }

  // Remove todos os caracteres não numéricos
  String numbersOnly = value.replaceAll(RegExp(r'[^0-9]'), '');

  // Converte para um valor double
  double? doubleValue = double.tryParse(numbersOnly);
  if (doubleValue == null) {
    return value; // Retorna o valor original se a conversão falhar
  }

  // Divide por 100 para considerar centavos
  doubleValue = doubleValue / 100;

  // Formata como moeda brasileira
  final NumberFormat currencyFormatter =
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return currencyFormatter.format(doubleValue);
}

DateTime? somenteData(DateTime? dataSelecionada) {
  //   // retorne um Datetime no formato d/m/y , a entrada é um datetime
  if (dataSelecionada == null) return null;
  return DateTime(
      dataSelecionada.year, dataSelecionada.month, dataSelecionada.day);
}

int? mesNumeroAnterior(DateTime dataSelecionada) {
  return (dataSelecionada.month) - 1;
}

String primeiroNome(String? nomePessoa) {
  // retorne apenas o primeiro e o segundo nome, caso possua três nomes, retorne o terceiro apenas se o segundo contiver dois caracteres
  if (nomePessoa == null) {
    return '';
  }
  final nomes = nomePessoa.split(' ');
  if (nomes.length >= 2) {
    final segundoNome = nomes[1];
    if (segundoNome.length == 2 && nomes.length == 3) {
      return '${nomes[0]} $segundoNome ${nomes[2]}';
    }
    return '${nomes[0]} $segundoNome';
  }
  return nomes[0];
}

String diaMesDaSemanaAtual(DateTime? hoje) {
  // retorne o incio e fim da semana atual, no formato d/M à d/M
  if (hoje == null) hoje = DateTime.now();
  final inicioSemana = hoje.subtract(Duration(days: hoje.weekday - 1));
  final fimSemana = inicioSemana.add(Duration(days: 6));
  final inicioSemanaFormatado = DateFormat('d/M').format(inicioSemana);
  final fimSemanaFormatado = DateFormat('d/M').format(fimSemana);
  return '$inicioSemanaFormatado à $fimSemanaFormatado';
}

int somaJohrei(List<DiarioRow>? listaDiario) {
  // soma os valores  do campo oracao (tipo double) e retorna a soma
  double soma = 0.0;
  if (listaDiario != null) {
    for (final diario in listaDiario) {
      soma += diario.johrei ?? 0.0;
    }
  }
  return soma.toInt();
}

int somaEnsinamento(List<DiarioRow>? listaDiario) {
  // soma os valores  do campo oracao (tipo double) e retorna a soma
  double soma = 0.0;
  if (listaDiario != null) {
    for (final diario in listaDiario) {
      soma += diario.ensinamento ?? 0.0;
    }
  }
  return soma.toInt();
}

int somaEncaminhamento(List<DiarioRow>? listaDiario) {
  // soma os valores  do campo oracao (tipo double) e retorna a soma
  double soma = 0.0;
  if (listaDiario != null) {
    for (final diario in listaDiario) {
      soma += diario.encaminhamento ?? 0.0;
    }
  }
  return soma.toInt();
}

int somaDonativo(List<DiarioRow>? listaDiario) {
  // soma os valores  do campo oracao (tipo double) e retorna a soma
  double soma = 0.0;
  if (listaDiario != null) {
    for (final diario in listaDiario) {
      soma += diario.donativo ?? 0.0;
    }
  }
  return soma.toInt();
}

int somaOracao(List<DiarioRow>? listaDiario) {
  // soma os valores  do campo oracao (tipo double) e retorna a soma em inteiro
  double soma = 0.0;
  if (listaDiario != null) {
    for (final diario in listaDiario) {
      soma += diario.oracao ?? 0.0;
    }
  }
  return soma.toInt();
}

bool dataJaExiste(
  String? idPratica,
  String idPessoa,
  List<dynamic>? listaDiario,
  DateTime dataPratica,
) {
  // Se a lista de registros do diário for nula ou vazia, retorne falso.
  if (listaDiario == null || listaDiario.isEmpty) {
    return false;
  }

  // Itera sobre cada item na lista de diário, assumindo que cada item é um Map<String, dynamic>.
  for (final item in listaDiario) {
    if (item is Map<String, dynamic>) {
      // Converte o campo 'data' do JSON para DateTime.
      final DateTime dataDiario = DateTime.parse(item['data'] as String);

      // Verifica se o ID da prática é diferente do atual, o ID da pessoa é o mesmo
      // e se a data corresponde ao dia, mês e ano da dataPratica.
      if (item['id'] != idPratica &&
          item['idPessoa'] == idPessoa &&
          dataDiario.year == dataPratica.year &&
          dataDiario.month == dataPratica.month &&
          dataDiario.day == dataPratica.day) {
        return true; // Retorna verdadeiro se uma entrada correspondente for encontrada.
      }
    }
  }

  // Retorna falso se nenhuma entrada correspondente for encontrada.
  return false;
}

String dataFormatadaDiaMes(DateTime? data) {
  // receba uma data e retorne uma string no formatado dd/MM
  if (data == null) return '';
  final formatter = DateFormat('dd/MM');
  return formatter.format(data);
}

bool isEmpty(String? texto) {
  // retorne true se a string for vazia ou nula
  return texto == null || texto.isEmpty;
}

String numeroEmHoraMinuto(double? numero) {
  // calcule as horas e minutos de um numero, parametro valor em minutos, retorne uma string no formato hh:mm se a hora e minuto for maior que zero,  retorne uma string no formato hh se o minuto calculado for igual a zero e a hora maior que zero, retorne uma string no formato mm se a hora for igual a zero.
  if (numero == null) return '';
  if (numero == 0) return '00min';

  int tempo = numero.toInt();
  final int horas = (tempo / 60).floor();
  final int minutos = tempo % 60;

  if (horas > 0 && minutos > 0) {
    return '${horas.toString().padLeft(2, '0')}h${minutos.toString().padLeft(2, '0')}';
  } else if (horas > 0 && minutos == 0) {
    return '${horas.toString().padLeft(2, '0')}h';
  } else if (horas == 0 && minutos > 0) {
    return '${minutos.toString().padLeft(2, '0')}min';
  } else {
    return '';
  }
}

DateTime ultimosDias(
  int dias,
  DateTime data,
) {
  //  retorne a data menos o numero de dias, ignore as horas antes e depois do calculo
  return DateTime(data.year, data.month, data.day - dias);
}

String incrementaValorTextField(String textField) {
  // incrementa Valor de um TextField, se for vazio ou zero retorna 1
  int valor = int.tryParse(textField) ?? 0;
  valor = valor == 0 ? 1 : valor + 1;
  return valor.toString();
}

String decrementaValorTextField(String textfield) {
  // decrementa Valor de um TextField, se for vazio ou zero retorna 0
  int valor = int.tryParse(textfield) ?? 0;
  valor = math.max(0, valor - 1);
  return valor.toString();
}
