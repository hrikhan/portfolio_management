import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'profile_controller.dart';
import '../models/user_profile.dart';

class DashboardController extends GetxController {
  late ProfileController profileController;

  @override
  void onInit() {
    super.onInit();
    profileController = Get.find<ProfileController>();
  }

  // Get current user's learning data
  List<LearningSkill> get learningData => profileController.currentProfile.skills;

  // Get current user's stats
  ProfileStats get stats => profileController.currentProfile.stats;

  // Method to update learning progress
  void updateProgress(String title, int newProgress) {
    final index = learningData.indexWhere((item) => item.title == title);
    if (index != -1) {
      // Note: In a real app, you'd update the data source here
      update(); // Trigger UI update
    }
  }

  // Method to get overall progress
  double get overallProgress {
    final totalProgress = learningData.fold<int>(0, (sum, item) => sum + item.progress);
    return totalProgress / learningData.length / 100;
  }
}
