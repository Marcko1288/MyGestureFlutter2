import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mygesture/9.Library/cash.dart';
import 'package:mygesture/9.Library/configuration.dart';
import 'package:mygesture/9.Library/widget.dart';
import 'package:flutterlibrary/Extension/extension_custom.dart';

class DetCashView extends StatefulWidget {
  Cash? cash;
  TypeState state;

  DetCashView({required this.state, Cash? cash}) : this.cash = cash ?? null;

  @override
  State<DetCashView> createState() => _DetCashViewState();
}

class _DetCashViewState extends State<DetCashView> {
  final _formKey = GlobalKey<FormState>();

  late Cash? cash;
  late TypeState state;
  late DateTime data_valore;
  late double conto;
  late double anticipo;
  late double otherp;
  late double otherm;
  late double totale;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBarTitle(
            text: state.title,
            icon: IconCustomState(
              typeState: state,
              onPressed: () {
                setState(() {
                  Cash cash_new = createCash();
                  actionElement(context, state, cash_new);
                  state = changeState(state);
                  update(cash_new, state);
                  refresh();
                });
              },
            )),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowDateCustom(
                      label: 'Data Valore',
                      initialValue: data_valore,
                      enable: state.state,
                      onChange: (value) {
                        setState(() {
                          data_valore = value;
                        });
                      }),
                  RowTextFieldCustom(
                    label: 'Conto',
                    initialValue: conto.changeDoubleToValuta(),
                    enable: state.state,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d*')),
                    onChange: (value) {
                      setState(() {
                        double number = value.changeStringToDouble();
                        totale = changeTotale(
                            value: totale, value_old: conto, value_new: number);
                        conto = number;
                      });
                    },
                  ),
                  RowTextFieldCustom(
                      label: 'Spesa +',
                      initialValue: anticipo.changeDoubleToValuta(),
                      enable: state.state,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d*')),
                      onChange: (value) {
                        setState(() {
                          double number = value.changeStringToDouble();
                          totale = changeTotale(
                              value: totale,
                              value_old: anticipo,
                              value_new: number);
                          anticipo = number;
                        });
                      }),
                  RowTextFieldCustom(
                      label: 'Spesa -',
                      initialValue: otherm.changeDoubleToValuta(),
                      enable: state.state,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d*')),
                      onChange: (value) {
                        setState(() {
                          double number = value.changeStringToDouble();
                          totale = changeTotale(
                              value: totale,
                              value_old: otherm,
                              value_new: number,
                              invert: true);
                          otherm = number;
                        });
                      }),
                  RowTextFieldCustom(
                      label: 'Spese \nStraordinarie',
                      initialValue: otherp.changeDoubleToValuta(),
                      enable: state.state,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d*')),
                      onChange: (value) {
                        setState(() {
                          double number = value.changeStringToDouble();
                          otherp = number;
                        });
                      }),
                  // RowTextCustom(
                  //     'Totale', totale.changeDoubleToValuta(), (value) {}),
                  RowTextFieldCustom(
                      label: 'Totale',
                      initialValue: totale.changeDoubleToValuta(),
                      enable: false,
                      onChange: (value) {}),
                  if (state == TypeState.modify)
                    Center(
                      child: ButtonToDelete(
                          title: 'Cancella',
                          onPress: () {
                            MasterProvider.provider.deleteCash(cash!);
                          }),
                    )
                ],
              )),
        ));
  }

  Cash createCash() {
    switch (state) {
      case TypeState.insert:
        return Cash(
            data_valore: data_valore,
            conto: conto,
            anticipo: anticipo,
            otherm: otherm,
            otherp: otherp);
      case TypeState.modify:
        return Cash(
          data_valore: data_valore != cash!.data_valore
              ? data_valore
              : cash!.data_valore,
          conto: conto != cash!.conto ? conto : cash!.conto,
          anticipo: anticipo != cash!.anticipo ? anticipo : cash!.anticipo,
          otherm: otherm != cash!.otherm ? otherm : cash!.otherm,
          otherp: otherp != cash!.otherp ? otherp : cash!.otherp,
        );
      case TypeState.read:
        return cash!;
    }
  }

  void update(Cash cash, TypeState state) {
    widget.cash = cash;
    widget.state = state;
  }

  void refresh() {
    print("refresh");
    cash = widget.cash;
    state = widget.state;
    data_valore = cash != null ? cash!.data_valore : DateTime.now();
    conto = cash != null ? cash!.conto : 0.0;
    anticipo = cash != null ? cash!.anticipo : 0.0;
    otherp = cash != null ? cash!.otherp : 0.0;
    otherm = cash != null ? cash!.otherm : 0.0;
    totale = cash != null ? cash!.totale : 0.0;
  }
}

double changeTotale(
    {required double value,
    required double value_old,
    required double value_new,
    bool invert = false}) {
  if (invert) {
    value_old = value_old * -1;
    value_new = value_new * -1;
  }

  value -= value_old;
  value += value_new;

  return value;
}

TypeState changeState(TypeState state) {
  switch (state) {
    case TypeState.insert:
      return TypeState.read;
    case TypeState.modify:
      return TypeState.read;
    case TypeState.read:
      return TypeState.modify;
  }
}

void actionElement(BuildContext context, TypeState state, Cash cash) {
  MasterProvider().init(context);
  switch (state) {
    case TypeState.insert:
      //Bisogna inserire il nuovo elemento nel DB
      MasterProvider.provider.insertCash(cash);
    case TypeState.modify:
      //Bisogna modificare il nuovo elemento nel DB
      MasterProvider.provider.modifyCash(cash);
    case TypeState.read:
      //Non bisogna fare nessuna azione
      break;
  }
}
