import 'package:cbc/app_coordinator.dart';
import 'package:cbc/core/constants/global_widgets.dart';
import 'package:cbc/core/widgets/custom_button.dart';
import 'package:cbc/data/models/research.dart';
import 'package:cbc/presentation/pages/markets/markets_view_model.dart';
import 'package:cbc/presentation/pages/research_form/research_form_view.dart';
import 'package:cbc/presentation/routes/router.dart';
import 'package:cbc/providers/provider_base.dart';
import 'package:flutter/material.dart';

class MarketsView extends StatelessWidget {

  final Research? research;

  const MarketsView({super.key, this.research});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MarketsViewModel>(
        instance: () => MarketsViewModel(research: research),
        builder: (builder, viewModel) {
          return Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.white,
              title: const Text(
                'Supermercados',
              ),
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: viewModel.research?.markets.length,
              itemBuilder: (context, index) => RadioListTile(
                value: index,
                groupValue: viewModel.selectedIndex,
                activeColor: Theme.of(context).colorScheme.primary,
                visualDensity: VisualDensity.standard,
                selected: viewModel.selectedIndex != null && viewModel.research != null &&
                    viewModel.selectedIndex! < viewModel.research!.markets.length &&
                    viewModel.research?.markets[viewModel.selectedIndex!] ==
                        viewModel.research?.markets[index],
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(viewModel.research?.markets[index].name ?? "",
                        style: viewModel.selectedIndex != null && viewModel.research != null &&
                                viewModel.selectedIndex! <
                                    viewModel.research!.markets.length &&
                                viewModel.research?.markets[viewModel.selectedIndex!] ==
                                    viewModel.research?.markets[index]
                            ? Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold)
                            : Theme.of(context).textTheme.bodyLarge),
                    Text(
                      viewModel.research != null && viewModel.research!.markets[index].isCompleted
                          ? "Realizada"
                          : "Pendente",
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                ),

                // opções desabilitadas
                // onChanged: viewModel.research != null && viewModel.research!.markets[index].isCompleted
                //         ?  null : (value) => viewModel.select(value as int),

                // Mostrando o toast
                onChanged: (value) => viewModel.research != null && viewModel.research!.markets[index].isCompleted
                    ? showToast(context,
                        "A pesquisa desse supermecado já foi completa!")
                    : viewModel.select(value as int),
              ),
            ),
            persistentFooterButtons: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: CustomButton(
                  title: "Continuar",
                  type: ButtonType.primary,
                  onPressed: () {
                    if (viewModel.selectedIndex == null) {
                      showToast(context,
                          "Você precisa selecionar um supermercado para iniciar a pesquisa");
                    } else {
                      AppCoordinator.pop(context);
                      AppCoordinator.push(context, ResearchFormView(selectedMarket: viewModel.research?.markets[viewModel.selectedIndex!], research: research,),);
                      //Navigator.popAndPushNamed(
                      //     context, RoutePaths.researchForm, arguments: {'market': viewModel.research?.markets[viewModel.selectedIndex!], 'research': research}
                      // );
                    }
                  },
                ),
              )
            ],
          );
        });
  }
}
