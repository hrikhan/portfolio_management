import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'profile_controller.dart';
import '../models/user_profile.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;
  late ProfileController profileController;

  @override
  void onInit() {
    super.onInit();
    profileController = Get.find<ProfileController>();
  }

  // Get current user's projects
  List<Project> get _projects => profileController.currentProfile.projects;

  // Reactive list of filtered projects
  RxList<Project> get filteredProjects {
    if (searchQuery.value.isEmpty) {
      return _projects.obs;
    }
    return _projects.where((project) {
      return project.title.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
             project.description.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
             project.technology.toLowerCase().contains(searchQuery.value.toLowerCase());
    }).toList().obs;
  }

  // Update search query
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  // Clear search
  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
