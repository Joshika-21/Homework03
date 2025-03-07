class CardModel {
  final int id;
  final String content; // Stores emoji
  bool isFaceUp;
  bool isMatched;

  CardModel({
    required this.id,
    required this.content,
    this.isFaceUp = false,
    this.isMatched = false,
  });
}
