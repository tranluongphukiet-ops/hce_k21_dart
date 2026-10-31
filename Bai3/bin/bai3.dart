import 'package:bai3/bai3.dart' as bai3;
// Tham so vi tri bat buoc + tuy chon
String gioiThieu(String ten, [String? biDanh]) {
  if (biDanh == null) return 'Toi la $ten';
  return 'Toi la $ten, biet danh $biDanh';
  }
  // Tham so dat ten, co gia tri mac dinh
  double tinhDiemTB({required double giuaKy, required double cuoiKy, double
  heSoCK = 0.6}) {
  return giuaKy * (1 - heSoCK) + cuoiKy * heSoCK;
}
void demTanSuatChu(String cauVan) {
 final Map<String, int> tanSuat = {};
 for (final ky in cauVan.toLowerCase().split('')) {
 if (ky == ' ') continue;
 tanSuat[ky] = (tanSuat[ky] ?? 0) + 1;
 }
 tanSuat.forEach((k, v) => print('\'$k\' xuat hien $v lan'));
}

void main(List<String> arguments) {
  var ds = <int>[1,2,3,2];
  var dssv = <String>["Ng Van A","Tran Thi B","Ng Thi C","Ng Van A"];
  var ds1 = <int>{1,2,3,2};
  var sinhvien = <String,int>{"Ng Van A":1};
  final List<Map<String, dynamic>> sinhVien = [
    {'ten': 'An', 'diem': 8.5},
    {'ten': 'Binh', 'diem': 6.0},
    {'ten': 'Chi', 'diem': 9.2},
  ];
  for (var x in sinhVien) {
    print('${x['ten']}: ${x['diem']}');
  }
  final diemCaoNhat = sinhVien
    .map((sv) => sv['diem'] as double)
    .reduce((a, b) => a > b ? a : b);
    print('Diem cao nhat: $diemCaoNhat');
  
  demTanSuatChu("Xin chao cac ban HCE");
  var dshsg = sinhVien.where((x)=>(x['diem'] as double)>=8).toList();

  dshsg.forEach((sv)=>print('${gioiThieu(sv['ten'],"Khong")}:${sv['diem']}'));
}
