class QuotesModal {
  String category;
  String quote;
  String author;

  QuotesModal({
    required this.category,
    required this.quote,
    required this.author,
  });

  factory QuotesModal.fromMap({required Map data}) {
    return QuotesModal(
      category: data['category'],
      quote: data['quote'],
      author: data['author'],
    );
  }
}
