
import 'package:cbc/core/constants/global_widgets.dart';
import 'package:cbc/core/widgets/custom_button.dart';
import 'package:cbc/core/widgets/custom_dialog.dart';
import 'package:cbc/core/widgets/fields_research_form.dart';
import 'package:cbc/core/widgets/form_progress_widget.dart';
import 'package:cbc/core/widgets/header_research_form.dart';
import 'package:cbc/data/models/market.dart';
import 'package:cbc/data/models/research.dart';
import 'package:cbc/main.dart';
import 'package:cbc/presentation/pages/research_form/research_form_view_model.dart';
import 'package:cbc/providers/provider_base.dart';
import 'package:flutter/material.dart';

class ResearchFormView extends StatelessWidget implements ResearchFormViewDelegate {
  final Market? selectedMarket;
  final Research? research;

  const ResearchFormView({super.key, this.selectedMarket, this.research});

  Future _onWillPop(BuildContext context) async {
    // Mostra o diálogo de confirmação
    return await showDialog(
      context: context,
      barrierDismissible: false, // Não fecha o modal tocando fora dele
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deseja mesmo sair?'),
          content: const Text('Todos os dados preenchidos serão perdidos'),
          actions: <Widget>[
            TextButton(
              child: const Text('Não'),
              onPressed: () {
                Navigator.of(context).pop(false); // Não permite voltar
              },
            ),
            TextButton(
              child: const Text('Sim'),
              onPressed: () {
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true); // Permite voltar
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();

    return ProviderWidget<ResearchFormViewModel>(
      instance: () => ResearchFormViewModel(
          view: this, selectedMarket: selectedMarket, research: research),
      builder: (builder, viewModel) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            title: Text(
              'Cadastrar nova pesquisa',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 18),
            ),
            leading: IconButton(
                onPressed: () => _onWillPop(context),
                icon: const Icon(Icons.chevron_left)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderResearchForm(
                  market: viewModel.selectedMarket?.name ?? "",
                  month: viewModel.research?.title ?? '',
                ),
                FormProgressWidget(percent: viewModel.filledPercent()),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.controllers.length,
                    itemBuilder: (context, index) {
                      return FieldsResearchForm(
                        item: viewModel.controllers[index].name,
                        brandController:
                            viewModel.controllers[index].brandController,
                        priceController:
                            viewModel.controllers[index].priceController,
                        onEnd: () => viewModel.onEditingComplete(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          persistentFooterButtons: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: CustomButton(
                title: "Finalizar pesquisa",
                type: ButtonType.primary,
                onPressed: () async {
                  // if (formKey.currentState?.validate() ?? false) {
                    viewModel.save();
                  // } else {
                  //   showToast(context, "Você precisa preencher todos os dados");
                  // }
                },
              ),
            )
          ],
        );
      },
    );
  }

  void showSuccessDialog() {
    showDialog(context: navigatorKey.currentContext!, builder: (_) => CustomDialog(
      title: 'Sucesso ao enviar uma pesquisa!',
      subtitle: 'Parabéns, uma nova pesquisa foi enviada para o professor!',
      imagePath: 'lib/assets/images/success_register_research.png',
      buttons: [
        CustomButton(
          title: 'Fechar',
          type: ButtonType.outlined,
          onPressed: () {
            if (navigatorKey.currentContext != null) {
              Navigator.of(navigatorKey.currentContext!).pop();
              Navigator.of(navigatorKey.currentContext!).pop();
            }
          }),
      ],
    ));
  }
  
  @override
  void failure() {
    showToast(navigatorKey.currentContext!, "Não foi possível enviar a pesquisa, tente novamente ou veja sua conexão com a intenet.");
  }
  
  @override
  void success() {
    showSuccessDialog();
  }
}
