import 'package:get/get.dart';

import '../../monitor/views/monitor_view.dart';
import '../../pesanan/views/pesanan_view.dart';
import '../../produksi/views/produksi_view.dart';
import '../../stok/views/stok_view.dart';
import '../../cerdas/views/cerdas_view.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

final pages = [
  () => MonitorView(),
  () => PesananView(),
  () => ProduksiView(),
  () => StokView(),
  () => CerdasView(),
];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}