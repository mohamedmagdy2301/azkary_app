import 'package:azkary_app/features/azkar/data/azkar_data.dart';
import 'package:azkary_app/features/azkar/data/azkar_screen_body_item_model_data.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/widgets/azkar_details_liseview_item_card.dart';
import 'package:azkary_app/features/azkar/presentation/view_model/azkar_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarDetailsScreen extends StatelessWidget {
  const AzkarDetailsScreen({super.key});

  static const String routeName = '/azkarDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final azkarScreenBodyItemModel =
        ModalRoute.of(context)?.settings.arguments as AzkarScreenBodyItemModel;
    var dataList = azkarData[azkarScreenBodyItemModel.title];

    return BlocProvider(
      create: (context) => AzkarDetailsCubit(dataList),
      child: Scaffold(
        appBar: AppBar(
          title: Text(azkarScreenBodyItemModel.title),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            color: Colors.white,
          ),
        ),
        body: BlocBuilder<AzkarDetailsCubit, AzkarDetailsState>(
          builder: (context, state) {
            if (state.dataList == null) {
              return const Center(child: Text("No data available"));
            }

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.dataList?.length ?? 0,
              itemBuilder: (context, index) {
                return AzkarDetailsLiseviewItemCard(
                  dataList: state.dataList,
                  index: index,
                  counter: state.counters[index],
                  onCounterChanged: () {
                    context.read<AzkarDetailsCubit>().incrementCounter(index);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
