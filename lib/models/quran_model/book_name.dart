class BookName {
  int? id;
  String? name;

  BookName({this.id, this.name});

  factory BookName.fromJson(Map<String, dynamic> json) {
    BookName bookName = BookName();
    bookName.id = json['Book_ID'];
    bookName.name = json['Book_Name'];
    return bookName;
  }
}
