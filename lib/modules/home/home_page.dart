import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final pages = [
    Container(
      color: Colors.white,
      child: BoletoTileWidget(
        data: BoletoModel(
          name: 'Bruno',
          dueDate: '25/06/2021',
          value: 23.90,
          barcode: 'asdas',
        ),
      ),
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 172,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: 'Olá, ',
                    style: AppTextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: 'Bruno',
                          style: AppTextStyles.titleBoldBackground),
                    ]),
              ),
              subtitle: Text(
                'Mantenha suas contas em dia',
                style: AppTextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
        ),
      ),
      body: pages[homeController.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(Icons.home),
                color: AppColors.primary,
                onPressed: () {
                  homeController.setPage(0);
                  setState(() {});
                }),
            GestureDetector(
              onTap: () {
                //Navigator.pushNamed(context, '/barcode_scanner');
                Navigator.pushNamed(context, '/insert_boleto');
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.description_outlined),
              color: AppColors.body,
              onPressed: () {
                homeController.setPage(1);
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
