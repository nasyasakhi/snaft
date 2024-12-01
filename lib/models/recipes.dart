class Recipes {
  final String title, subtitle, image;
  final int id, calory;

  Recipes({
    required this.id,
    required this.calory,
    required this.title, 
    required this.subtitle, 
    required this.image
  });

  static List<Recipes> recipes = [
    Recipes(
      id: 1, 
      calory: 250,
      title: "Chopped Spring Ramen", 
      subtitle: 'Scallions & tomatoes', 
      image: 'assets/images/spring-ramen.png'
    ),
    
    Recipes(
      id: 2, 
      calory: 250,
      title: "Grilled Chicken Salad",
      subtitle: 'Fresh greens & zesty dressing',
      image: 'assets/images/lemon-herb-chicken-salad.png'
    ),

    Recipes(
      id: 3, 
      calory: 250,
      title: "Veggie Delight", 
      subtitle: 'Broccoli & tofu', 
      image: 'assets/images/veggie-delight.png'
    ),

    Recipes(
      id: 4, 
      calory: 230,  
      title: "Vegetable Quinoa Pilaf",  
      subtitle: 'Carrots, peas & herbs',  
      image: 'assets/images/vegetable-quinoa-pilaf.png'  
    ),
  ];
}