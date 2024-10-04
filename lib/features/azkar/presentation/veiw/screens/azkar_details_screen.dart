import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
import 'package:azkary_app/core/theming/light_theme.dart';
import 'package:azkary_app/core/utils/colors.dart';
import 'package:azkary_app/features/azkar/data/azkar_data.dart';
import 'package:azkary_app/features/azkar/data/azkar_screen_body_item_model_data.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/widgets/azkar_details_liseview_item_card.dart';
import 'package:azkary_app/features/azkar/presentation/veiw/widgets/custom_notification_settings.dart';
import 'package:azkary_app/features/azkar/presentation/view_model/notification_manager/azkar_notification_cubit.dart';
import 'package:azkary_app/features/azkar/presentation/view_model/view_azkar/azkar_details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarDetailsScreen extends StatefulWidget {
  const AzkarDetailsScreen({super.key, this.selectedTime});

  static const String routeName = '/azkarDetailsScreen';
  final TimeOfDay? selectedTime;

  @override
  State<AzkarDetailsScreen> createState() => _AzkarDetailsScreenState();
}

class _AzkarDetailsScreenState extends State<AzkarDetailsScreen> {
  bool isSelectedNotification = false;
  Color colorAppbar = Colors.white;

  @override
  Widget build(BuildContext context) {
    final azkarScreenBodyItemModel =
        ModalRoute.of(context)?.settings.arguments as AzkarScreenBodyItemModel;
    var dataList = azkarData[azkarScreenBodyItemModel.title];
    bool isLightTheme =
        context.read<ThemeCubit>().state.themeData == lightTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AzkarDetailsCubit(dataList),
        ),
        BlocProvider(
          create: (context) => AzkarNotificationCubit(azkarScreenBodyItemModel),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(azkarScreenBodyItemModel.title),
          centerTitle: true,
          elevation: 0,
          backgroundColor: isLightTheme ? colorAppbar : Colors.transparent,
          surfaceTintColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSelectedNotification = !isSelectedNotification;
                  colorAppbar = isLightTheme
                      ? const Color.fromARGB(255, 228, 228, 228)
                      : Colors.transparent;
                });
              },
              icon: Icon(
                isSelectedNotification
                    ? CupertinoIcons.bell_fill
                    : CupertinoIcons.bell_slash,
                color: isSelectedNotification
                    ? ColorsAppLight.primaryColor
                    : Colors.grey,
              ),
            ),
          ],
        ),
        body: BlocBuilder<AzkarDetailsCubit, AzkarDetailsState>(
          builder: (context, state) {
            if (state.dataList == null) {
              return const Center(child: Text("No data available"));
            }
            return Column(
              children: [
                if (isSelectedNotification)
                  CustomNotificationSettings(
                    colorAppbar: colorAppbar,
                  ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.dataList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return AzkarDetailsLiseviewItemCard(
                        dataList: state.dataList,
                        index: index,
                        counter: state.counters[index],
                        onCounterChanged: () {
                          context
                              .read<AzkarDetailsCubit>()
                              .incrementCounter(index);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
