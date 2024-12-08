
import 'package:stacked/stacked.dart';

class HomescreenController extends BaseViewModel {
  int currentIndex = 0;
  void onBottomNavTap(int value) {
    currentIndex = value;
    notifyListeners();
  }

  int filterCurrentIndex = 0;
  void onFilterTap(int index) {
    filterCurrentIndex = index;
    notifyListeners();
  }

  void onProfileTap(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
