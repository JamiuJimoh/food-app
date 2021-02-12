class ValidationMixin {
  String validateMealName(String value) {
    if (value.isEmpty) {
      return 'Please provide a name for your meal!';
    }
    return null;
  }

  String validateMealDesc(String value) {
    if (value.isEmpty) {
      return 'Please provide a description for your meal!';
    }
    if (value.length < 10) {
      return 'Must be at least 10 characters long';
    }
    return null;
  }

  String validateMealPrice(String value) {
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
  }

  String validateMealTimeToPrep(String value) {
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
  }

  String validateMealImageURL(String value) {
    if (value.isEmpty) {
      return 'Please enter an image URl';
    }
    if (!value.startsWith('http') && !value.startsWith('https')) {
      return 'Please enter a valid URL';
    }
    if (!value.endsWith('.png') &&
        !value.startsWith('.jpeg') &&
        !value.startsWith('.jpg')) {
      return 'Please enter a valid image URL';
    }
    return null;
  }
}
