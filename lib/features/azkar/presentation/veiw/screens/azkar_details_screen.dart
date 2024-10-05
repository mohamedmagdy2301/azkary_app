import 'package:azkary_app/core/theming/cubit_cahnge_themeing.dart';
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
  Color colorAppbar = Colors.white;

  @override
  Widget build(BuildContext context) {
    final azkarScreenBodyItemModel =
        ModalRoute.of(context)?.settings.arguments as AzkarScreenBodyItemModel;
    var dataList = azkarData[azkarScreenBodyItemModel.title];

    final isLightTheme = context.watch<ThemeCubit>().state == ThemeMode.light;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AzkarDetailsCubit(dataList),
        ),
        BlocProvider(
          create: (context) => AzkarNotificationCubit(azkarScreenBodyItemModel),
        ),
      ],
      child: BlocBuilder<AzkarNotificationCubit, AzkarNotificationState>(
        builder: (context, notificationState) {
          final azkarNotificationCubit = context.read<AzkarNotificationCubit>();

          return Scaffold(
            appBar: AppBar(
              title: Text(azkarScreenBodyItemModel.title),
              centerTitle: true,
              elevation: 0,
              backgroundColor: isLightTheme ? colorAppbar : Colors.transparent,
              surfaceTintColor: Colors.transparent,
              actions: [
                IconButton(
                  onPressed: () {
                    azkarNotificationCubit.viewSettingsNotification(context);
                  },
                  icon: Icon(
                    azkarNotificationCubit.isViewNotification
                        ? azkarNotificationCubit.isSwitchEnable
                            ? CupertinoIcons.bell_fill
                            : CupertinoIcons.bell_slash
                        : azkarNotificationCubit.isSwitchEnable
                            ? CupertinoIcons.bell_fill
                            : CupertinoIcons.bell_slash,
                    color: azkarNotificationCubit.isViewNotification
                        ? azkarNotificationCubit.isSwitchEnable
                            ? ColorsAppLight.primaryColor
                            : Colors.grey
                        : azkarNotificationCubit.isSwitchEnable
                            ? ColorsAppLight.primaryColor
                            : Colors.grey,
                  ),
                ),
              ],
            ),
            body: BlocBuilder<AzkarDetailsCubit, AzkarDetailsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    if (azkarNotificationCubit.isViewNotification)
                      CustomNotificationSettings(
                        azkarNotificationCubit: azkarNotificationCubit,
                        colorAppbar: !isLightTheme
                            ? Colors.transparent
                            : const Color.fromARGB(255, 228, 228, 228),
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
          );
        },
      ),
    );
  }
}
