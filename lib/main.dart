import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';


class PizzaCalcScreen extends StatefulWidget {
  const PizzaCalcScreen({Key? key}) : super(key: key);

  @override
  _PizzaCalcScreenState createState() => _PizzaCalcScreenState();
}

enum Sauce { hot, sweet, cheese }

class _PizzaCalcScreenState extends State<PizzaCalcScreen> {
  bool _doughSlim = false;
  double _pizzaSize = 40;
  int _price = 100;
  Sauce? _sauce = Sauce.hot;
  bool _addCheese = true;
  int _calcPrice() {
    _price = _pizzaSize.round() * 10;
    if (_doughSlim == true) _price += 30;
    if (_addCheese == true) _price += 50;
    switch (_sauce) {
      case Sauce.hot:
        _price += 20;
        break;
      case Sauce.sweet:
        _price += 10;
        break;
      case Sauce.cheese:
        _price += 30;
        break;
    }
    return _price;
  }

  void _onSauceChanged(Sauce? value) {
    setState(() {
      _sauce = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    alignment: Alignment.centerRight,
                    height: 100,
                    child: const Image(image: const AssetImage('assets/pizza.png')),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Калькулятор пиццы',
                      style: TextStyle(fontSize: 30, color: Color(0xff000000))),
                  const SizedBox(
                    height: 9,
                  ),
                  const Text('Выберете параметры',
                      style: TextStyle(fontSize: 16, color: Color(0xff000000))),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: SlidingSwitch(
                      value: false,
                      width: 300,
                      onChanged: (bool value) {
                        _doughSlim = value;
                        setState(() {
                          _calcPrice();
                        });
                      },
                      height: 50,
                      animationDuration: const Duration(milliseconds: 50),
                      onTap: () {},
                      onDoubleTap: () {},
                      onSwipe: () {},
                      textOff: 'Обычное тесто',
                      textOn: 'Тонкое тесто',
                      colorOn: const Color(0xffffffff),
                      colorOff: const Color(0xffffffff),
                      background: const Color(0xffECEFF1),
                      buttonColor: const Color(0xff0079D0),
                      inactiveColor: const Color(0x77000000),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: const Text('Размер:',
                        style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
                  ),
                  SizedBox(
                      width: 300,
                      child: SfSlider(
                        min: 25,
                        max: 35,
                        value: _pizzaSize,
                        interval: 5,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 0,
                        stepSize: 5,
                        onChanged: (dynamic value) {
                          setState(() {
                            _pizzaSize = value;
                            _calcPrice();
                          });
                        },
                      )),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: const Text('Соус',
                        style: TextStyle(fontSize: 18, color: Color(0xff000000))),
                  ),
                  RadioListTile<Sauce>(
                    title: const Text('Острый'),
                    activeColor: Colors.green,
                    value: Sauce.hot,
                    groupValue: _sauce,
                    onChanged: _onSauceChanged,
                    visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 20,
                    thickness: 2,
                    indent: 18,
                    endIndent: 9,
                  ),
                  RadioListTile<Sauce>(
                    title: const Text('Кисло-сладкий'),
                    activeColor: Colors.green,
                    value: Sauce.sweet,
                    groupValue: _sauce,
                    onChanged: _onSauceChanged,
                    visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 20,
                    thickness: 2,
                    indent: 18,
                    endIndent: 9,
                  ),
                  RadioListTile<Sauce>(
                    title: const Text('Сырный'),
                    activeColor: Colors.green,
                    value: Sauce.cheese,
                    groupValue: _sauce,
                    onChanged: _onSauceChanged,
                    visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 20,
                    thickness: 2,
                    indent: 18,
                    endIndent: 9,
                  ),
                  SizedBox(
                    width: 300,
                    child: Card(
                      elevation: 0,
                      color: const Color(0xfff0f0f0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SizedBox(
                              width: 38,
                              height: 56,
                              child: Image.asset('assets/Icon_Cheese.png'),
                            ),
                          ),
                          const Text('Дополнительный сыр',
                              style: TextStyle(fontSize: 16, color: Color(0xff000000))),
                          Switch(
                            value: _addCheese,
                            activeColor: const Color(0xff0E4DA4),
                            onChanged: (bool value) {
                              setState(() {
                                _addCheese = value;
                                _calcPrice();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: const Text('Стоимость',
                        style: TextStyle(fontSize: 18, color: Color(0xff000000))),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: Card(
                      elevation: 0,
                      color: const Color(0xfff0f0f0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        '${_calcPrice()}',
                        style: const TextStyle(fontSize: 32, color: Color(0xff000000)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 154,
                    height: 42,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Заказать'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff0079D0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0)),
                        )),
                  ),
                ]),
              ),
            )));
  }
}

void main() {
  runApp(const PizzaCalcScreen());
}
