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

  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
    'timeToPrep': '',
    'distance': '',
    'location': '',
    'categories': [],
    'vendorInfo': {},
  };

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      // _isInit is used so that this doesn't run to often,
      final mealId = ModalRoute.of(context).settings.arguments as String;
      if (mealId != null) {
        //To override the initial values of the textFormFields which are empty by default to be the value of the meal clicked to edit.
        _editedMeal =
            Provider.of<Meals>(context, listen: false).findById(mealId);
        _initValues = {
          'title': _editedMeal.title,
          'description': _editedMeal.description,
          'price': _editedMeal.price.toString(),
          'imageUrl':
              '', //cannot set initial value for image cos i'm using controller already.
          'timeToPrep': _editedMeal.timeToPrep.toString(),
          'distance': _editedMeal.distance.toString(),
          'location': _editedMeal.location,
          'categories': [],
          'vendorInfo': {},
        };
        _imageUrlController.text = _editedMeal.imageUrl;
      }
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

    if (_editedMeal.id != null) {
      Provider.of<Meals>(context, listen: false)
          .updateMeal(_editedMeal.id, _editedMeal);
    } else {
      Provider.of<Meals>(context, listen: false).addMeal(_editedMeal);
    }
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
                /////// MEAL TITLE TEXTFIELD ////////

                CustomTextField(
                  initialValue: _initValues['title'],
                  isPasswordInputField: false,
                  label: 'Meal name',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    _editedMeal = Meal(
                      id: _editedMeal.id,
                      isFavorite: _editedMeal.isFavorite,
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

                /////// MEAL DESCRIPTION TEXTFIELD ////////

                CustomTextField(
                  initialValue: _initValues['description'],
                  isPasswordInputField: false,
                  label: 'Meal description',
                  maxLines: 3,
                  textInputType: TextInputType.multiline,
                  onSaved: (value) {
                    _editedMeal = Meal(
                      id: _editedMeal.id,
                      isFavorite: _editedMeal.isFavorite,
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

                      /////// MEAL PRICE TEXTFIELD ////////

                      child: CustomTextField(
                        initialValue: _initValues['price'],
                        isPasswordInputField: false,
                        label: 'Price',
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          _editedMeal = Meal(
                            id: _editedMeal.id,
                            isFavorite: _editedMeal.isFavorite,
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

                      /////// TIME TO PREP MEAL TEXTFIELD ////////

                      child: CustomTextField(
                        initialValue: _initValues['timeToPrep'],
                        isPasswordInputField: false,
                        label: 'Time to prep (minutes)',
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          _editedMeal = Meal(
                            id: _editedMeal.id,
                            isFavorite: _editedMeal.isFavorite,
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

                      /////// MEAL IMAGE URL TEXTFIELD ////////

                      child: CustomTextField(
                        initialValue: null,
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
                            id: _editedMeal.id,
                            isFavorite: _editedMeal.isFavorite,
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
