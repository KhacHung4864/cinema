// import 'package:flutter/material.dart';
// import 'package:flutter_cinema_app/model/seat_booking.dart';
// import 'package:flutter_cinema_app/provider/seat_provider.dart';
// import 'package:flutter_cinema_app/resource/images/app_images.dart';
// import 'package:provider/provider.dart';

// class SeatGridView extends StatelessWidget {
//   const SeatGridView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final seat = Provider.of<SeatProvider>(context);
//     final List<Seat> listSeat = seat.fetchSeat;
//     const int seatsPerRow = 10; // Số ghế trong mỗi hàng
//     final int numRows = (listSeat.length / seatsPerRow).ceil(); // Số hàng cần tạo
//     List<List<Seat>> seatRows = [];
//     for (int i = 0; i < numRows; i++) {
//       int start = i * seatsPerRow;
//       int end = start + seatsPerRow;
//       if (end > listSeat.length) {
//         end = listSeat.length;
//       }
//       List<Seat> rowSeats = listSeat.sublist(start, end);
//       seatRows.add(rowSeats);
//     }
//     return GridView.builder(
//       shrinkWrap: true,
//       itemCount: listSeat.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 5,
//       ),
//       itemBuilder: (BuildContext context, int index) {
//         int rowIndex = index ~/ 10;
//         Seat newSeat = seatRows[rowIndex][index % 10];

//         return GestureDetector(
//             onTap: () {
//               if (newSeat.status == 'UNBOOKED') {
//                 seat.selectSeat(newSeat);
//               } else if (newSeat.status == 'SELECTED') {
//                 seat.unSelectSeat(newSeat);
//               }
//             },
//             child: Container(
//               child: _getSeat(newSeat.status),
//             ));
//       },
//     );
//   }

//   Widget _getSeat(String status) {
//     switch (status) {
//       case 'UNBOOKED':
//         return Container(
//             width: 30,
//             height: 25,
//             margin: const EdgeInsets.all(10),
//             child: Image.asset(AppImages.iconUnbookedSeat));
//       case 'SELECTED':
//         return Container(
//             width: 30,
//             height: 25,
//             margin: const EdgeInsets.all(10),
//             child: Image.asset(AppImages.iconBookingSeat));
//       case 'BOOKED':
//         return Container(
//             width: 30,
//             height: 25,
//             margin: const EdgeInsets.all(10),
//             child: Image.asset(AppImages.iconBookedSeat));
//       default:
//         return Container(
//           width: 50,
//             height: 50,
//             margin: const EdgeInsets.all(10),
//             child: Image.asset(AppImages.iconUnbookedSeat));
//     }
//   }
// }
