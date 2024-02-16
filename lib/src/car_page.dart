import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';

import 'package:victordetailsflutter/src/car_details_page.dart';
import 'package:victordetailsflutter/src/models/car_model.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key});

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  final cars = <Car>[];

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
            const Car(
                model: 'Fusca',
                brand: 'Volkswagen',
                year: '1997',
                color: 'Vermelha',
                imageUrl:
                    'https://lartbr.com.br/wp-content/uploads/2022/11/IMG_5591.jpg'),
            const Car(
                model: 'M420i',
                brand: 'BMW',
                year: '2023',
                color: 'Azul',
                imageUrl:
                    'https://i.ytimg.com/vi/zGyjeqgAbdg/maxresdefault.jpg'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Garagem',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => addCarBottomSheet(),
            child: const Text(
              'Adicionar',
              style: TextStyle(
                color: Color.fromRGBO(148, 0, 0, 1),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: cars.isEmpty ? _emptyCarsBody() : _filledCarsBody(),
      ),
    );
  }

  Widget _filledCarsBody() => Container(
        padding: const EdgeInsets.all(16),
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
                  radius: 30.0,
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
            child: Text(
              'Você não possui nenhum carro cadastrado :( ',
              textAlign: TextAlign.center,
              style: TextStyle(
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
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                              color: Color.fromRGBO(148, 0, 0, 1),
                              fontSize: 16,
                            ),
                          )),
                      const Spacer(),
                      const Text(
                        'Adicionar Carro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Adicionar',
                            style: TextStyle(
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
                const Text(
                  'Escolher foto',
                  style: TextStyle(
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
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              'Nome do carro',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Divider()
                        ],
                      ),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Marca',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Nenhum',
                                  style: TextStyle(
                                    color: Color.fromRGBO(179, 179, 178, 1),
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider()
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Modelo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Não escolhido',
                                  style: TextStyle(
                                    color: Color.fromRGBO(179, 179, 178, 1),
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider()
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cor',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Não escolhido',
                                  style: TextStyle(
                                    color: Color.fromRGBO(179, 179, 178, 1),
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Ano',
                              style: TextStyle(
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
                              child: const Text(
                                '01 de Janeiro 1999',
                                style: TextStyle(
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
