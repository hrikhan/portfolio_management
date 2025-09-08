import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class ProfileController extends GetxController {
  final currentProfileId = 'hridoy_khan'.obs;
  final profiles = <String, UserProfile>{}.obs;

  UserProfile get currentProfile => profiles[currentProfileId.value]!;
  
  List<UserProfile> get allProfiles => profiles.values.toList();

  @override
  void onInit() {
    super.onInit();
    _initializeProfiles();
  }

  void _initializeProfiles() {
    profiles.addAll({
      'hridoy_khan': UserProfile(
        id: 'hridoy_khan',
        name: 'Hridoy Khan',
        title: 'Flutter Developer',
        bio: 'Passionate Flutter developer with expertise in mobile app development and backend technologies.',
        email: 'hridoy.khan@example.com',
        location: 'Dhaka, Bangladesh',
        profileImage: '66fcde00cf54d71747a52bac_upwork-profile-photo-tips.jpg',
        projects: [
          Project(
            title: 'E-Commerce Flutter App',
            description: 'A complete e-commerce mobile application with cart, payment integration, and user authentication.',
            technology: 'Flutter, Dart, Firebase',
            status: 'Completed',
            icon: Icons.shopping_cart,
            color: Colors.blue,
            githubUrl: 'https://github.com/hridoy/ecommerce-app',
            liveUrl: 'https://play.google.com/store/apps/details?id=com.hridoy.ecommerce',
          ),
          Project(
            title: 'Restaurant Management System',
            description: 'PHP-based web application for managing restaurant orders, inventory, and staff.',
            technology: 'PHP, MySQL, Bootstrap',
            status: 'In Progress',
            icon: Icons.restaurant,
            color: Colors.orange,
            githubUrl: 'https://github.com/hridoy/restaurant-system',
          ),
          Project(
            title: 'Task Management App',
            description: 'Flutter app for managing daily tasks with notifications and progress tracking.',
            technology: 'Flutter, SQLite, BLoC',
            status: 'Completed',
            icon: Icons.task_alt,
            color: Colors.green,
            githubUrl: 'https://github.com/hridoy/task-manager',
          ),
          Project(
            title: 'Weather Forecast App',
            description: 'Real-time weather application with location-based forecasts and beautiful UI.',
            technology: 'Flutter, API Integration',
            status: 'Completed',
            icon: Icons.wb_sunny,
            color: Colors.amber,
            githubUrl: 'https://github.com/hridoy/weather-app',
          ),
          Project(
            title: 'Blog Management System',
            description: 'PHP-based CMS for creating and managing blog posts with admin panel.',
            technology: 'PHP, MySQL, JavaScript',
            status: 'Completed',
            icon: Icons.article,
            color: Colors.purple,
            githubUrl: 'https://github.com/hridoy/blog-cms',
          ),
          Project(
            title: 'Chat Application',
            description: 'Real-time messaging app with group chats and file sharing capabilities.',
            technology: 'Flutter, Firebase, WebSocket',
            status: 'In Progress',
            icon: Icons.chat,
            color: Colors.teal,
            githubUrl: 'https://github.com/hridoy/chat-app',
          ),
        ],
        skills: [
          LearningSkill(
            title: 'Flutter',
            subtitle: 'Mobile App Development',
            progress: 85,
            icon: Icons.flutter_dash,
            color: Colors.blue,
          ),
          LearningSkill(
            title: 'PHP',
            subtitle: 'Backend Development',
            progress: 70,
            icon: Icons.code,
            color: Colors.purple,
          ),
          LearningSkill(
            title: 'Dart',
            subtitle: 'Programming Language',
            progress: 90,
            icon: Icons.language,
            color: Colors.teal,
          ),
          LearningSkill(
            title: 'JavaScript',
            subtitle: 'Web Development',
            progress: 75,
            icon: Icons.javascript,
            color: Colors.orange,
          ),
          LearningSkill(
            title: 'MySQL',
            subtitle: 'Database Management',
            progress: 65,
            icon: Icons.storage,
            color: Colors.indigo,
          ),
          LearningSkill(
            title: 'Git',
            subtitle: 'Version Control',
            progress: 80,
            icon: Icons.source,
            color: Colors.red,
          ),
        ],
        stats: ProfileStats(
          hoursLearned: '120+',
          projects: '6',
          certificates: '3',
          experience: '3 Years',
          rating: '4.8',
        ),
      ),
      'sarah_johnson': UserProfile(
        id: 'sarah_johnson',
        name: 'Sarah Johnson',
        title: 'Full Stack Developer',
        bio: 'Experienced full-stack developer specializing in React, Node.js, and cloud technologies.',
        email: 'sarah.johnson@example.com',
        location: 'New York, USA',
        profileImage: 'assets/sarah_profile.jpg',
        projects: [
          Project(
            title: 'Social Media Platform',
            description: 'A comprehensive social media platform with real-time messaging and content sharing.',
            technology: 'React, Node.js, MongoDB',
            status: 'Completed',
            icon: Icons.people,
            color: Colors.indigo,
            githubUrl: 'https://github.com/sarah/social-platform',
            liveUrl: 'https://mysocialplatform.com',
          ),
          Project(
            title: 'E-Learning Platform',
            description: 'Online learning platform with video streaming, quizzes, and progress tracking.',
            technology: 'React, Express.js, PostgreSQL',
            status: 'Completed',
            icon: Icons.school,
            color: Colors.green,
            githubUrl: 'https://github.com/sarah/elearning',
          ),
          Project(
            title: 'Cloud Analytics Dashboard',
            description: 'Real-time analytics dashboard for cloud infrastructure monitoring.',
            technology: 'Vue.js, AWS, Docker',
            status: 'In Progress',
            icon: Icons.analytics,
            color: Colors.blue,
            githubUrl: 'https://github.com/sarah/cloud-analytics',
          ),
          Project(
            title: 'Cryptocurrency Tracker',
            description: 'Real-time cryptocurrency price tracking with portfolio management.',
            technology: 'React Native, Redux, API',
            status: 'Completed',
            icon: Icons.currency_bitcoin,
            color: Colors.orange,
            githubUrl: 'https://github.com/sarah/crypto-tracker',
          ),
        ],
        skills: [
          LearningSkill(
            title: 'React',
            subtitle: 'Frontend Framework',
            progress: 95,
            icon: Icons.web,
            color: Colors.blue,
          ),
          LearningSkill(
            title: 'Node.js',
            subtitle: 'Backend Runtime',
            progress: 88,
            icon: Icons.dns,
            color: Colors.green,
          ),
          LearningSkill(
            title: 'AWS',
            subtitle: 'Cloud Services',
            progress: 82,
            icon: Icons.cloud,
            color: Colors.orange,
          ),
          LearningSkill(
            title: 'MongoDB',
            subtitle: 'NoSQL Database',
            progress: 78,
            icon: Icons.storage,
            color: Colors.green,
          ),
          LearningSkill(
            title: 'Docker',
            subtitle: 'Containerization',
            progress: 75,
            icon: Icons.developer_board,
            color: Colors.blue,
          ),
          LearningSkill(
            title: 'GraphQL',
            subtitle: 'Query Language',
            progress: 70,
            icon: Icons.api,
            color: Colors.purple,
          ),
        ],
        stats: ProfileStats(
          hoursLearned: '200+',
          projects: '4',
          certificates: '5',
          experience: '5 Years',
          rating: '4.9',
        ),
      ),
      'alex_chen': UserProfile(
        id: 'alex_chen',
        name: 'Alex Chen',
        title: 'Mobile App Developer',
        bio: 'iOS and Android developer with a passion for creating beautiful, user-friendly mobile experiences.',
        email: 'alex.chen@example.com',
        location: 'San Francisco, USA',
        profileImage: 'assets/alex_profile.jpg',
        projects: [
          Project(
            title: 'Fitness Tracking App',
            description: 'Comprehensive fitness app with workout plans, nutrition tracking, and social features.',
            technology: 'Swift, Kotlin, Firebase',
            status: 'Completed',
            icon: Icons.fitness_center,
            color: Colors.red,
            githubUrl: 'https://github.com/alex/fitness-tracker',
            liveUrl: 'https://apps.apple.com/app/fitness-tracker',
          ),
          Project(
            title: 'Food Delivery App',
            description: 'Multi-restaurant food delivery platform with real-time tracking and payments.',
            technology: 'React Native, Node.js',
            status: 'Completed',
            icon: Icons.delivery_dining,
            color: Colors.orange,
            githubUrl: 'https://github.com/alex/food-delivery',
          ),
          Project(
            title: 'Music Streaming App',
            description: 'Spotify-like music streaming application with offline playback and playlists.',
            technology: 'Flutter, Dart, AWS',
            status: 'In Progress',
            icon: Icons.music_note,
            color: Colors.purple,
            githubUrl: 'https://github.com/alex/music-stream',
          ),
          Project(
            title: 'AR Shopping Assistant',
            description: 'Augmented reality app for virtual try-on and product visualization.',
            technology: 'ARKit, ARCore, Unity',
            status: 'In Progress',
            icon: Icons.view_in_ar,
            color: Colors.teal,
            githubUrl: 'https://github.com/alex/ar-shopping',
          ),
          Project(
            title: 'Travel Planner',
            description: 'Smart travel planning app with itinerary management and local recommendations.',
            technology: 'Swift, Google Maps API',
            status: 'Completed',
            icon: Icons.travel_explore,
            color: Colors.blue,
            githubUrl: 'https://github.com/alex/travel-planner',
          ),
        ],
        skills: [
          LearningSkill(
            title: 'Swift',
            subtitle: 'iOS Development',
            progress: 92,
            icon: Icons.phone_iphone,
            color: Colors.blue,
          ),
          LearningSkill(
            title: 'Kotlin',
            subtitle: 'Android Development',
            progress: 88,
            icon: Icons.android,
            color: Colors.green,
          ),
          LearningSkill(
            title: 'React Native',
            subtitle: 'Cross-platform',
            progress: 85,
            icon: Icons.mobile_friendly,
            color: Colors.cyan,
          ),
          LearningSkill(
            title: 'Flutter',
            subtitle: 'Cross-platform',
            progress: 80,
            icon: Icons.flutter_dash,
            color: Colors.blue,
          ),
          LearningSkill(
            title: 'ARKit/ARCore',
            subtitle: 'Augmented Reality',
            progress: 75,
            icon: Icons.view_in_ar,
            color: Colors.orange,
          ),
          LearningSkill(
            title: 'Firebase',
            subtitle: 'Backend Services',
            progress: 82,
            icon: Icons.cloud_done,
            color: Colors.amber,
          ),
        ],
        stats: ProfileStats(
          hoursLearned: '180+',
          projects: '5',
          certificates: '4',
          experience: '4 Years',
          rating: '4.7',
        ),
      ),
    });
  }

  void switchProfile(String profileId) {
    if (profiles.containsKey(profileId)) {
      currentProfileId.value = profileId;
    }
  }

  List<String> get availableProfileIds => profiles.keys.toList();

  List<UserProfile> get availableProfiles => profiles.values.toList();
}
