import 'package:flutter/material.dart';

class UserProfile {
  final String id;
  final String name;
  final String title;
  final String bio;
  final String email;
  final String location;
  final String profileImage;
  final List<Project> projects;
  final List<LearningSkill> skills;
  final ProfileStats stats;

  UserProfile({
    required this.id,
    required this.name,
    required this.title,
    required this.bio,
    required this.email,
    required this.location,
    required this.profileImage,
    required this.projects,
    required this.skills,
    required this.stats,
  });
}

class Project {
  final String title;
  final String description;
  final String technology;
  final String status;
  final IconData icon;
  final Color color;
  final String? githubUrl;
  final String? liveUrl;

  Project({
    required this.title,
    required this.description,
    required this.technology,
    required this.status,
    required this.icon,
    required this.color,
    this.githubUrl,
    this.liveUrl,
  });
}

class LearningSkill {
  final String title;
  final String subtitle;
  final int progress;
  final IconData icon;
  final Color color;

  LearningSkill({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.icon,
    required this.color,
  });
}

class ProfileStats {
  final String hoursLearned;
  final String projects;
  final String certificates;
  final String experience;
  final String rating;

  ProfileStats({
    required this.hoursLearned,
    required this.projects,
    required this.certificates,
    required this.experience,
    required this.rating,
  });
}
