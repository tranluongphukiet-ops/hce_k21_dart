import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bai_02/bai_02.dart' as bai_02;

// void main() {
//  var diem = 8.5; // double, suy luận kiểu
//  final monHoc = 'Dart & Flutter';
//  const soTinChi = 3;
//  String? ghiChu = "xin chao HCE"; // co the null (null safety)
 
//  String xepLoai(double diem) {
//   if (diem >= 9.0) {
//   return 'Xuat sac';
//   } else if (diem >= 8.0) {
//   return 'Gioi';
//   } else if (diem >= 6.5) {
//   return 'Kha';
//   } else if (diem >= 5.0) {
//   return 'Trung binh';
//   } else {
//   return 'Yeu';
//   }
//   }
//   String tenThu(int soThu) {
//     switch (soThu) {
//     case 2:
//     return 'Thu Hai';
//     case 3:
//     return 'Thu Ba';
//     case 4:
//     return 'Thu Tu';
//     case 5:
//     return 'Thu Nam';
//     case 6:
//     return 'Thu Sau';
//     case 7:
//     return 'Thu Bay';
//     case 1:
//     return 'Chu Nhat';
//     default:
//     return 'Khong xac dinh';
//     }
//   }
//   print('Mon: $monHoc ($soTinChi tin chi) - Diem: $diem');
//   print('Ghi chu: ${ghiChu ?? "khong co"}');
//   print('Xep loai hoc luc: ${xepLoai(diem)}');
//   print('Ngay: ${tenThu(4)}');
//   void inSoNguyenTo(int gioiHan) {
//     for (var n = 2; n <= gioiHan; n++) {
//       var laSoNguyenTo = true;
//       for (var i = 2; i * i <= n; i++) {
//         if (n % i == 0) {
//           laSoNguyenTo = false;
//           break;
//         }
//       }
//       if (laSoNguyenTo) {
//         print('$n la so nguyen to');
//       }
//     }
//   }
//   inSoNguyenTo(8);
// }

// Future<List<Map<String, dynamic>>> taiDanhSachSanPham() async {
//   final uri = Uri.parse('https://fakestoreapi.com/products');
//   final client = HttpClient();

//   try {
//     await Future.delayed(const Duration(milliseconds: 3000));
//     final request = await client.getUrl(uri);
//     final response = await request.close();
//     final noiDung = await response.transform(utf8.decoder).join();

//     if (response.statusCode != HttpStatus.ok) {
//       throw HttpException('HTTP ${response.statusCode}', uri: uri);
//     }

//     final duLieu = jsonDecode(noiDung);
//     if (duLieu is! List) {
//       throw const FormatException('Du lieu API khong phai danh sach');
//     }

//     return List<Map<String, dynamic>>.from(duLieu);
//   } finally {
//     client.close(force: true);
//   }
// }

// Future<String> taiDuLieuNguoiDung(int id) async {
//  print('Dang tai du lieu nguoi dung $id...');
//  await Future.delayed(Duration(seconds: 5)); // gia lap do tre mang
//  if (id == 2) {
//   throw Exception('Loi gia lap khi tai nguoi dung $id');
//  }
//  return 'Nguoi dung #$id: Nguyen Van A';
// }
// void main() async {
//   print('Bat dau');
//   final dongHo = Stopwatch()..start();
//   final boDemGiay = Timer.periodic(const Duration(seconds: 1), (_) {
//     print('Da chay: ${dongHo.elapsed.inSeconds} giay');
//   });

//   try {
//     final sanPham = await taiDanhSachSanPham();
//     final sanPhamDanhGiaCao = sanPham.where((item) {
//       final danhGia = item['rating'];
//       final rate = danhGia is Map ? danhGia['rate'] : null;
//       return rate is num && rate >= 4.0;
//     });

//     String formatCell(Object? value, int width) {
//       final text = value?.toString() ?? '';
//       final clippedText = text.length > width
//           ? '${text.substring(0, width - 3)}...'
//           : text;
//       return clippedText.padRight(width);
//     }

//     final border = '+-${'-' * 4}-+-${'-' * 48}-+-${'-' * 10}-+-${'-' * 5}-+';
//     print('San pham co rate >= 4.0:');
//     print(border);
//     print(
//       '| ${formatCell('ID', 4)} | ${formatCell('Ten san pham', 48)} | '
//       '${formatCell('Gia', 10)} | ${formatCell('Rate', 5)} |',
//     );
//     print(border);
//     for (final item in sanPhamDanhGiaCao) {
//       final rate = (item['rating'] as Map)['rate'];
//       print(
//         '| ${formatCell(item['id'], 4)} | ${formatCell(item['title'], 48)} | '
//         '${formatCell('\$${item['price']}', 10)} | ${formatCell(rate, 5)} |',
//       );
//     }
//     print(border);

//     final nguoiDung7 = await taiDuLieuNguoiDung(7);
//     print(nguoiDung7);

//     final ketQuaDongThoi = await Future.wait([
//       taiDuLieuNguoiDung(1),
//       taiDuLieuNguoiDung(2),
//       taiDuLieuNguoiDung(3),
//     ]);
//     for (final nguoiDung in ketQuaDongThoi) {
//       print(nguoiDung);
//     }
//   } catch (loi) {
//     print('Loi khi tai du lieu: $loi');
//   } finally {
//     boDemGiay.cancel();
//     dongHo.stop();
//   }

//   print('Tong thoi gian: ${dongHo.elapsed.inSeconds} giay');
//   print('Ket thuc');
// }

// Stream<int> demNguoc(int tu) async* {
//  for (var i = tu; i >= 0; i--) {
//  await Future.delayed(Duration(seconds: 1));
//  yield i;
//  }
// }
// void main() async {
//  await for (final giaTri in demNguoc(5)) {
//  print('Con lai: $giaTri');
//  }
//  print('Het gio!');
// }

Future<String> moPhongDangNhap(String user, String pass) async {
  await Future.delayed(const Duration(milliseconds: 1000));

  if (pass == '123456') {
    return "Dang nhap thanh cong";
  }
  throw Exception('Sai mật khẩu');
}

void main() async{

  try{
    final ketQua = await moPhongDangNhap("cano999999", "123476");
    print(ketQua);
  } catch(loi){
    print(loi);
  }

  try{
    final ketQua = await moPhongDangNhap("cano999999", "123456");
    print(ketQua);
  } catch(loi){
    print(loi);
  }
  
}