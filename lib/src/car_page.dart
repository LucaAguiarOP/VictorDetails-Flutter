import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:victordetailsflutter/src/car_details_page.dart';
import 'package:victordetailsflutter/src/models/car_model.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key});

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  final cars = <Car>[];
  bool isLoading = true;
  final carNameController = TextEditingController();
  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => setState(
              () => cars.addAll(
                [
                  Car(
                      name: 'Fusquinha',
                      model: 'Fusca',
                      brand: 'Volkswagen',
                      year: '1995',
                      color: AppLocalizations.of(context)!.red,
                      imageUrl:
                          'https://lartbr.com.br/wp-content/uploads/2022/11/IMG_5591.jpg'),
                  Car(
                      name: 'Bmwzinha',
                      model: 'M420i',
                      brand: 'BMW',
                      year: '2023',
                      color: AppLocalizations.of(context)!.blue,
                      imageUrl:
                          'https://i.ytimg.com/vi/zGyjeqgAbdg/maxresdefault.jpg'),
                ],
              ),
            ));
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logovitor.png', width: 100),
            Text(
              AppLocalizations.of(context)!.garage,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () => addCarBottomSheet(),
              child: Text(
                AppLocalizations.of(context)!.add,
                style: const TextStyle(
                  color: Color(0xFFE30613),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: cars.isEmpty
            ? const CircularProgressIndicator()
            : _filledCarsBody(),
      ),
    );
  }

  Widget _filledCarsBody() => Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            final car = cars[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                tileColor: const Color.fromRGBO(51, 59, 71, 1),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(car.imageUrl),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(
                  car.model,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  car.brand,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CarDetailsPage(car: car),
                  ),
                ),
              ),
            );
          },
        ),
      );

  Widget _emptyCarsBody() => Column(
        children: [
          const SizedBox(height: 25),
          DottedBorder(
              color: Colors.white,
              dashPattern: const [8, 6],
              strokeWidth: 3,
              radius: const Radius.circular(30),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              borderPadding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    height: height * 0.1,
                    width: width * 0.2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.025,
                        width: width * 0.15,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: height * 0.025,
                        width: width * 0.3,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: height * 0.035,
                    width: width * 0.1,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: Text(
              AppLocalizations.of(context)!.noCarRegistered,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );

  Future<void> addCarBottomSheet() async {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: height * 0.9,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(33, 38, 46, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: height * 0.06,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(29, 29, 29, 0.94),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            AppLocalizations.of(context)!.cancel,
                            style: const TextStyle(
                              color: Color.fromRGBO(148, 0, 0, 1),
                              fontSize: 16,
                            ),
                          )),
                      const Spacer(),
                      Text(
                        AppLocalizations.of(context)!.addCar,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            AppLocalizations.of(context)!.add,
                            style: const TextStyle(
                              color: Color.fromRGBO(148, 0, 0, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  AppLocalizations.of(context)!.choosePhoto,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: height * 0.3,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(51, 59, 71, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 50.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider()
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.brand,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.none,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(179, 179, 178, 1),
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider()
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.model,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.notChosen,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(179, 179, 178, 1),
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider()
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.color,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.notChosen,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(179, 179, 178, 1),
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.year,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(76, 84, 98, 1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.yearMock,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
