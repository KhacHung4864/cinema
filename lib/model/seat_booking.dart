class Seat {
  final String id;
  final String chairId;
  final String chairName;
  final String filmId;
  String status;
  final String type;
  final int price;

  Seat({
    required this.id,
    required this.chairId,
    required this.chairName,
    required this.filmId,
    required this.status,
    required this.type,
    required this.price,
  });

  void select() {
    status = 'SELECTED';
  }

  void book() {
    status = 'BOOKED';
  }
}
