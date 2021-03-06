import 'package:flutter/material.dart';
import './backdrop.dart';
import './category.dart';
import './category_row.dart';
import './unit.dart';
import './unit_converter.dart';

class CategoryRoute extends StatefulWidget {
  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {
  Category _category;

  @override
  void initState() {
    super.initState();

    _category = _categories[0];
  }

  @override
  Widget build(context) {
    return Backdrop(
      category: _category,
      frontPanel: UnitConverter(category: _category),
      backPanel: Padding(
        padding: EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 48,
        ),
        child: _buildCategoryWidgets(),
      ),
      frontTitle: Text('Unit Converter'),
      backTitle: Text('Select a Category'),
    );
  }

  Widget _buildCategoryWidgets() => LayoutBuilder(
        builder: (context, constraints) {
          final size = new Size(constraints.maxWidth, constraints.maxHeight);
          final shouldBeList = size.width < 320 * 2;

          return shouldBeList
              ? ListView.builder(
                  itemBuilder: (context, index) => _categories
                      .map((category) => CategoryRow(
                            category: category,
                            icon: Icons.cake,
                            onTap: _onTapCategory,
                          ))
                      .toList()[index],
                  itemCount: _categories.length,
                )
              : GridView.count(
                  crossAxisCount: size.width ~/ 320,
                  childAspectRatio: size.width / (size.width ~/ 320) / 100,
                  children: _categories
                      .map((category) => CategoryRow(
                            category: category,
                            icon: Icons.cake,
                            onTap: _onTapCategory,
                          ))
                      .toList(),
                );
        },
      );

  void _onTapCategory(Category category) {
    setState(() {
      _category = category;
    });
  }
}

const _categories = [
  Category(
    name: 'Length',
    color: Colors.teal,
    units: [
      Unit(
        name: 'ABC',
        conversion: 1.0,
      ),
      Unit(
        name: 'DEF',
        conversion: 1.0,
      ),
      Unit(
        name: 'GHI',
        conversion: 1.0,
      ),
    ],
  ),
  Category(
    name: 'Area',
    color: Colors.orange,
    units: [
      Unit(
        name: 'ABC',
        conversion: 1.0,
      ),
      Unit(
        name: 'DEF',
        conversion: 1.0,
      ),
      Unit(
        name: 'GHI',
        conversion: 1.0,
      ),
    ],
  ),
  Category(
    name: 'Volume',
    color: Colors.pinkAccent,
    units: [
      Unit(
        name: 'ABC',
        conversion: 1.0,
      ),
      Unit(
        name: 'DEF',
        conversion: 1.0,
      ),
      Unit(
        name: 'GHI',
        conversion: 1.0,
      ),
    ],
  ),
  Category(
    name: 'Mass',
    color: Colors.blueAccent,
    units: [
      Unit(
        name: 'ABC',
        conversion: 1.0,
      ),
      Unit(
        name: 'DEF',
        conversion: 1.0,
      ),
      Unit(
        name: 'GHI',
        conversion: 1.0,
      ),
    ],
  ),
  Category(
    name: 'Time',
    color: Colors.yellow,
    units: [
      Unit(
        name: 'ABC',
        conversion: 1.0,
      ),
      Unit(
        name: 'DEF',
        conversion: 1.0,
      ),
      Unit(
        name: 'GHI',
        conversion: 1.0,
      ),
    ],
  ),
  Category(
    name: 'Digital Storage',
    color: Colors.greenAccent,
    units: [
      Unit(
        name: 'ABC',
        conversion: 1.0,
      ),
      Unit(
        name: 'DEF',
        conversion: 1.0,
      ),
      Unit(
        name: 'GHI',
        conversion: 1.0,
      ),
    ],
  ),
  Category(
    name: 'Energy',
    color: Colors.purpleAccent,
    units: [
      Unit(
        name: 'ABC',
        conversion: 1.0,
      ),
      Unit(
        name: 'DEF',
        conversion: 1.0,
      ),
      Unit(
        name: 'GHI',
        conversion: 1.0,
      ),
    ],
  ),
  Category(
    name: 'Currency',
    color: Colors.red,
    units: [
      Unit(
        name: 'ABC',
        conversion: 1.0,
      ),
      Unit(
        name: 'DEF',
        conversion: 1.0,
      ),
      Unit(
        name: 'GHI',
        conversion: 1.0,
      ),
    ],
  ),
];

List<Unit> _retrieveUnitList(String categoryName) => List.generate(
      10,
      (index) => Unit(
            name: '$categoryName Unit ${index + 1}',
            conversion: (index + 1).toDouble(),
          ),
    );
