import 'dart:io'; // For File handling
import 'package:image_picker/image_picker.dart'; // For image picking
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../models/recipe.dart';


class AddEditRecipeScreen extends StatefulWidget {
  final Recipe? recipe;

  const AddEditRecipeScreen({this.recipe});

  @override
  _AddEditRecipeScreenState createState() => _AddEditRecipeScreenState();
}


class _AddEditRecipeScreenState extends State<AddEditRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _ingredients;
  late String _instructions;
  late String _category;
  late double _rating;

  File? _image; // To store the selected image
  final ImagePicker _picker = ImagePicker(); // Instance of ImagePicker

  @override
  void initState() {
    super.initState();
    if (widget.recipe != null) {
      _title = widget.recipe!.title;
      _ingredients = widget.recipe!.ingredients;
      _instructions = widget.recipe!.instructions;
      _category = widget.recipe!.category;
      _rating = widget.recipe!.rating;
      _image =
      widget.recipe!.imagePath != null ? File(widget.recipe!.imagePath!) : null;
    } else {
      _title = '';
      _ingredients = '';
      _instructions = '';
      _category = '';
      _rating = 0.0;
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe == null ? 'Add Recipe' : 'Edit Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: _title,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
                TextFormField(
                  initialValue: _ingredients,
                  decoration: const InputDecoration(labelText: 'Ingredients'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter ingredients';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _ingredients = value!;
                  },
                ),
                TextFormField(
                  initialValue: _instructions,
                  decoration: const InputDecoration(labelText: 'Instructions'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter instructions';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _instructions = value!;
                  },
                ),
                TextFormField(
                  initialValue: _category,
                  decoration: const InputDecoration(labelText: 'Category'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a category';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _category = value!;
                  },
                ),
                TextFormField(
                  initialValue: _rating.toString(),
                  decoration: const InputDecoration(labelText: 'Rating'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a rating';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _rating = double.parse(value!);
                  },
                ),
                const SizedBox(height: 20),

                // Display the selected image or a placeholder
                _image == null ? Text('No image selected.')
                    : Image.file(_image!, height: 200, width: 200),

                const SizedBox(height: 20),

                // Button to pick an image
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick Image'),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final recipe = Recipe(
                        title: _title,
                        ingredients: _ingredients,
                        instructions: _instructions,
                        imagePath: _image?.path,
                        rating: _rating,
                        category: _category,
                      );
                      if (widget.recipe == null) {
                        Provider.of<RecipeProvider>(context, listen: false)
                            .addRecipe(recipe);
                      } else {
                        Provider.of<RecipeProvider>(context, listen: false)
                            .updateRecipe(recipe);
                      }
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                      widget.recipe == null ? 'Add Recipe' : 'Update Recipe'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

