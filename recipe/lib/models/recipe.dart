class Recipe {
  final int? id;
  final String title;
  final String ingredients;
  final String instructions;
  final String? imagePath;
  final double rating;
  final String category;

  Recipe({
    this.id,
    required this.title,
    required this.ingredients,
    required this.instructions,
    this.imagePath,
    required this.rating,
    required this.category,
  });

  // Convert a Recipe into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'ingredients': ingredients,
      'instructions': instructions,
      'imagePath': imagePath,
      'rating': rating,
      'category': category,
    };
  }

  // Implement toString to make it easier to see information about each recipe when using the print statement.
  @override
  String toString() {
    return 'Recipe{id: $id, title: $title, ingredients: $ingredients, instructions: $instructions, imagePath: $imagePath, rating: $rating, category: $category}';
  }
}
