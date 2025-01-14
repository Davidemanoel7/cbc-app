import 'package:cbc/core/widgets/fields_research_detail.dart';
import 'package:cbc/core/widgets/form_progress_widget.dart';
import 'package:cbc/core/widgets/header_research_detail.dart';
import 'package:cbc/core/widgets/market_list_detail.dart';
import 'package:cbc/data/models/research.dart';
import 'package:cbc/presentation/pages/research_detail/research_view_model.dart';
import 'package:cbc/providers/provider_base.dart';
import 'package:flutter/material.dart';

class ResearchDetailView extends StatelessWidget {
  final Research? research;

  const ResearchDetailView({super.key, this.research});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ResearchViewModel>(
      instance: () => ResearchViewModel(research: research),
      builder: (builder, viewModel) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            title: Text(viewModel.research?.title ?? ""),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                      'Os dados mostrados aqui são uma média de todos os supermercados em que a pesquisa foi realizada.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF535353), fontSize: 12)),
                ),
                HeaderResearchDetail(title: viewModel.research?.title ?? ''),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(12),
                  onPressed: (index) => viewModel.updateCurrentTab(index),
                  isSelected: [0, 1]
                      .map((index) => index == viewModel.currentTab)
                      .toList(),
                  constraints: const BoxConstraints(
                    maxWidth: 180,
                    minWidth: 180,
                    maxHeight: 50,
                    minHeight: 40
                  ),
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Itens da pesquisa'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text('Detalhes'),
                    ),
                  ],
                ),
                // Exibe a view com base no botão selecionado
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: viewModel.currentTab == 0
                        ? itensList(viewModel)
                        : marketList(viewModel),
                  ),
                ),
              ],
            ),
          )),
        );
      },
    );
  }

  Widget marketList(ResearchViewModel viewModel) {
    return MarketListDetail(markets: viewModel.research?.markets ?? [],);
  }

  Widget itensList(ResearchViewModel viewModel) {
    return Column(
      children: [
        const FormProgressWidget(
          percent: 1,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewModel.research?.items?.length ?? 0,
          itemBuilder: (context, index) {
            return FieldsResearchDetail(
                title: viewModel.research?.items?[index].title ?? '',
                price: viewModel
                        .formatPrice(viewModel.research?.items?[index].price) ??
                    '');
          },
        ),
      ],
    );
  }
}
