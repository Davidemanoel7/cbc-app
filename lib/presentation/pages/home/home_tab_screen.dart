import 'package:cbc/app_coordinator.dart';
import 'package:cbc/core/constants/global_widgets.dart';
import 'package:cbc/core/widgets/research_card_widget.dart';
import 'package:cbc/core/widgets/section_list_widget.dart';
import 'package:cbc/data/models/research.dart';
import 'package:cbc/presentation/pages/home/home_view_model.dart';
import 'package:cbc/presentation/pages/markets/markets_view.dart';
import 'package:cbc/presentation/pages/research_detail/research_detail_view.dart';
import 'package:cbc/presentation/routes/router.dart';
import 'package:cbc/providers/provider_base.dart';
import 'package:flutter/material.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HomeViewModel>(
      instance: () => HomeViewModel(),
      builder: (builder, viewModel) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: SectionListWidget(
                        numberOfSection: () => 2,
                        numberOfRowsInSection: (section) {
                          return section == 0
                              ? viewModel.pendingResearches.isEmpty
                                  ? 1
                                  : viewModel.pendingResearches.length
                              : viewModel.completedResearches.isEmpty
                                  ? 1
                                  : viewModel.completedResearches.length;
                        },
                        sectionWidget: (section) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: 8, top: section == 0 ? 0 : 16),
                            child: Text(
                              section == 0
                                  ? 'Pesquisa em andamento'
                                  : 'Pesquisas finalizadas',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                        rowWidget: (section, row) {
                          return section == 0
                              ? viewModel.pendingResearches.isEmpty
                                  ? Center(
                                      child: Text(
                                        'A pesquisa desse mês já foi completa! Parabéns!',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: const Color(0xFFBDBDBD),
                                                fontSize: 16),
                                      ),
                                    )
                                  : ResearchCardWidget(
                                      title: viewModel
                                          .pendingResearches[row].title,
                                      isCompleted: viewModel
                                          .pendingResearches[row].isCompleted,
                                      percent: viewModel
                                              .pendingResearches[row].markets
                                              .where((e) => e.isCompleted)
                                              .toList()
                                              .length /
                                          viewModel.pendingResearches[row]
                                              .markets.length,
                                      backgroundColor: const Color(0xFFFEF9D7),
                                      onPressed: () {
                                        AppCoordinator.push(context, MarketsView(research: viewModel.pendingResearches[row]));
                                        // Navigator.pushNamed(
                                        //     context, RoutePaths.markets,
                                        //     arguments: viewModel
                                        //         .pendingResearches[row]);
                                      },
                                    )
                              : viewModel.completedResearches.isEmpty
                                  ? Center(
                                      child: Text(
                                      'Nenhuma pesquisa foi finalizada.',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: const Color(0xFFBDBDBD),
                                              fontSize: 16),
                                    ))
                                  : ResearchCardWidget(
                                      title: viewModel
                                          .completedResearches[row].title,
                                      isCompleted: viewModel
                                          .completedResearches[row].isCompleted,
                                      onPressed: () {
                                        AppCoordinator.push(context, ResearchDetailView(research: viewModel.completedResearches[row],),);
                                        // Navigator.pushNamed(
                                        //     context, RoutePaths.researchDetail,
                                        //     arguments: viewModel
                                        //         .completedResearches[row]);
                                      },
                                    );
                        }),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Research? newResearch = viewModel.createNewResearch();
              if (viewModel.pendingResearches.isNotEmpty) {
                showToast(context,
                    'Há uma pesquisa pendente, finalize-a para iniciar uma nova');
              } else if (newResearch == null) {
                showToast(context, "Uma pesquisa já foi iniciada e finalizada esse mês.");
              } else {
                AppCoordinator.push(context, MarketsView(research: newResearch,));
                //Navigator.pushNamed(context, RoutePaths.markets, arguments: newResearch);
              }
            },
            tooltip: "Iniciar uma nova pesquisa",
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}