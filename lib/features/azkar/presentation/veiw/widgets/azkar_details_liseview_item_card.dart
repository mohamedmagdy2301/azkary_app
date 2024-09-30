import 'package:azkary_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AzkarDetailsLiseviewItemCard extends StatelessWidget {
  const AzkarDetailsLiseviewItemCard({
    super.key,
    required this.dataList,
    required this.index,
  });
  final int index;
  final List<Map<String, String>>? dataList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: Card(
        elevation: 2,
        color: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الذكر ${index + 1}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorsAppLight.primaryColor,
                    ),
                  ),
                  Text(
                    "التكرار : ${dataList?[index]["count"]}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 35, 42, 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                dataList?[index]['content']?.replaceAll(".", ".\n") ?? "",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  height: 2,
                  wordSpacing: 2.2,
                  fontFamily: "Amiri",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
