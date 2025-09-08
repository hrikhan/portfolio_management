import 'package:get/get.dart';
import '../models/user_profile.dart';
import 'profile_controller.dart';

class AuthController extends GetxController {
  final ProfileController _profileController = Get.find<ProfileController>();
  
  final isLoggedIn = false.obs;
  final currentUser = Rxn<UserProfile>();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Check if user is already logged in (you can add persistence later)
    checkLoginStatus();
  }

  void checkLoginStatus() {
    // For now, we'll start with no user logged in
    // In a real app, you'd check SharedPreferences or secure storage
    isLoggedIn.value = false;
    currentUser.value = null;
  }

  Future<bool> login(String email, String password) async {
    isLoading.value = true;
    
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Simple authentication logic - in real app, this would be API call
      UserProfile? user = _findUserByCredentials(email, password);
      
      if (user != null) {
        currentUser.value = user;
        isLoggedIn.value = true;
        
        // Set the current profile in ProfileController
        _profileController.switchProfile(user.id);
        
        isLoading.value = false;
        return true;
      } else {
        isLoading.value = false;
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      return false;
    }
  }

  UserProfile? _findUserByCredentials(String email, String password) {
    // Simple credential matching - in real app, this would be secure
    final credentials = {
      'hridoy.khan@example.com': 'password123',
      'sarah.johnson@example.com': 'password123',
      'alex.chen@example.com': 'password123',
    };
    
    if (credentials[email] == password) {
      // Find user by email
      return _profileController.allProfiles.firstWhereOrNull(
        (profile) => profile.email == email,
      );
    }
    return null;
  }

  void logout() {
    currentUser.value = null;
    isLoggedIn.value = false;
    // Clear any cached data
  }

  bool get isUserLoggedIn => isLoggedIn.value;
  UserProfile? get loggedInUser => currentUser.value;
}
