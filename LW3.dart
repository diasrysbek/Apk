class Book {
  String title;
  String author;
  double price;
  bool isBorrowed;

  Book({
    required this.title,
    required this.author,
    required this.price,
    this.isBorrowed = false,
  });
}

class Library {
  List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  List<Book> getAvailableBooks() {
    return _books.where((book) => !book.isBorrowed).toList();
  }

  double getTotalValue() {
    return _books.fold(0.0, (total, book) => total + book.price);
  }
}

void main() {
  Library library = Library();

  library.addBook(
    Book(title: 'Harry Potter', author: 'J.K. Rowling', price: 25.0),
  );

  library.addBook(
    Book(
      title: 'The Hobbit',
      author: 'J.R.R. Tolkien',
      price: 30.0,
      isBorrowed: true,
    ),
  );

  library.addBook(Book(title: '1984', author: 'George Orwell', price: 20.0));

  library.addBook(
    Book(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', price: 22.0),
  );

  print('Available books');

  for (Book book in library.getAvailableBooks()) {
    print('${book.title} by ${book.author} - \$${book.price}');
  }

  print('Total collection value:  \$${library.getTotalValue()}');
}
