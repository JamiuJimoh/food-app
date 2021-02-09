import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../constants.dart';
import '../widgets/widgets.dart';

class EditUserMealScreen extends StatefulWidget {
  static const String id = 'edit_product_screen';
  @override
  _EditUserMealScreenState createState() => _EditUserMealScreenState();
}

class _EditUserMealScreenState extends State<EditUserMealScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form =
      GlobalKey<FormState>(); //to get direct access to the form widget.

  var _isInit = true;
  List<String> _mealPickedCategoryId = [];

  var _editedMeal = Meal(
    id: null,
    categories: [],
    title: '',
    description: '',
    price: 0.0,
    imageUrl: '',
    timeToPrep: 0,
    vendorInfo: {},
    distance: 0.0,
    location: '',
  );

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final mealId = ModalRoute.of(context).settings.arguments as String;
      _editedMeal = Provider.of<Meals>(context, listen: false).findById(mealId);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if (!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https') ||
          !_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.startsWith('.jpeg') &&
              !_imageUrlController.text.startsWith('.jpg')) {
        return;
      }
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    Provider.of<Meals>(context, listen: false).addProduct(_editedMeal);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesData = Provider.of<Categories>(context, listen: false);
    _mealPickedCategoryId = categoriesData.mealPickedCategoryId;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 45.0),
        child: SingleChildScrollView(
          child: Form(
            key: _form, //to establish a connection with the connection

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  isPasswordInputField: false,
                  label: 'Meal name',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    _editedMeal = Meal(
                      id: null,
                      title: value,
                      price: _editedMeal.price,
                      categories: _mealPickedCategoryId,
                      description: _editedMeal.description,
                      imageUrl: _editedMeal.imageUrl,
                      timeToPrep: _editedMeal.timeToPrep,
                      vendorInfo: _editedMeal.vendorInfo,
                      distance: _editedMeal.distance,
                      location: _editedMeal.location,
                    );
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a name for your meal!';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  isPasswordInputField: false,
                  label: 'Meal description',
                  maxLines: 3,
                  textInputType: TextInputType.multiline,
                  onSaved: (value) {
                    _editedMeal = Meal(
                      id: null,
                      title: _editedMeal.title,
                      price: _editedMeal.price,
                      categories: _mealPickedCategoryId,
                      description: value,
                      imageUrl: _editedMeal.imageUrl,
                      timeToPrep: _editedMeal.timeToPrep,
                      vendorInfo: _editedMeal.vendorInfo,
                      distance: _editedMeal.distance,
                      location: _editedMeal.location,
                    );
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a description for your meal!';
                    }
                    if (value.length < 10) {
                      return 'Must be at least 10 characters long';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      // flex: 1,
                      child: CustomTextField(
                        isPasswordInputField: false,
                        label: 'Price',
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          _editedMeal = Meal(
                            id: null,
                            title: _editedMeal.title,
                            price: double.parse(value),
                            categories: _mealPickedCategoryId,
                            description: _editedMeal.description,
                            imageUrl: _editedMeal.imageUrl,
                            timeToPrep: _editedMeal.timeToPrep,
                            vendorInfo: _editedMeal.vendorInfo,
                            distance: _editedMeal.distance,
                            location: _editedMeal.location,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the price';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Must be a valid number';
                          }
                          if (double.parse(value) <= 0) {
                            return 'Must be greater than zero';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      // flex: 2,
                      child: CustomTextField(
                        isPasswordInputField: false,
                        label: 'Time to prep (minutes)',
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          _editedMeal = Meal(
                            id: null,
                            title: _editedMeal.title,
                            price: _editedMeal.price,
                            categories: _mealPickedCategoryId,
                            description: _editedMeal.description,
                            imageUrl: _editedMeal.imageUrl,
                            timeToPrep: int.parse(value),
                            vendorInfo: _editedMeal.vendorInfo,
                            distance: _editedMeal.distance,
                            location: _editedMeal.location,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter the time';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Must be a valid number';
                          }
                          if (double.parse(value) <= 0) {
                            return 'Must be greater than zero';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Select the meal categories',
                  style: kDescTextStyle,
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: categoriesData.catListLength,
                    itemBuilder: (ctx, i) => CategoriesListBuilder(
                      index: i,
                      childWidget: CategoryCheckTile(),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: kAccentColor,
                          ),
                        ),
                        child: _imageUrlController.text.isEmpty
                            ? Center(
                                child: Text(
                                  'Enter a URL',
                                  style: kDescTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : FittedBox(
                                child: Image.network(
                                  _imageUrlController.text,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      flex: 4,
                      child: CustomTextField(
                        paddingBottom: 0.0,
                        isPasswordInputField: false,
                        label: 'Image URL',
                        textInputType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNode,
                        onFieldSubmitted: (_) => _saveForm(),
                        onSaved: (value) {
                          _editedMeal = Meal(
                            id: null,
                            title: _editedMeal.title,
                            price: _editedMeal.price,
                            categories: _mealPickedCategoryId,
                            description: _editedMeal.description,
                            imageUrl: value,
                            timeToPrep: _editedMeal.timeToPrep,
                            vendorInfo: _editedMeal.vendorInfo,
                            distance: _editedMeal.distance,
                            location: _editedMeal.location,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter an image URl';
                          }
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return 'Please enter a valid URL';
                          }
                          if (!value.endsWith('.png') &&
                              !value.startsWith('.jpeg') &&
                              !value.startsWith('.jpg')) {
                            return 'Please enter a valid image URL';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAccentColor3,
        onPressed: _saveForm,
        child: Icon(Icons.publish),
      ),
    );
  }
}
