class BoardingContent {
  String images;
  String title;
  String description;

  BoardingContent(
      {required this.title, required this.images, required this.description});
}

List<BoardingContent> contents = [
  BoardingContent(
    title: "Home Workout",
    images: 'assets/images/boarding/pic1.png',
    description:
        "This fitness app is designed specifically to assist with exercise, other types of physical training, nutrition, diet, or related fitness topics."
        "they are part of a healthcare movement called mobile health (mHealth).",
  ),
  BoardingContent(
    title: "Ours Purpose",
    images: 'assets/images/boarding/pic2.png',
    description:
        "The purpose of a fitness app is to provide the user with instructions and" 
        "examples of one or more types of exercise, physical activity, nutritional programs, or some other fitness topic.",
  ),
    BoardingContent(
    title: "Lets Go!!!",
    images: 'assets/images/boarding/pic3.png',
    description:
        "Now you only have to login or register new account if you are new member," 
        "and you can start workout at home.",
  ),
];
