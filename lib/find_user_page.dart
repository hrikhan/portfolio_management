import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/profile_controller.dart';
import 'models/user_profile.dart';
import 'user_profile_view_page.dart';
import 'widgets/animated_avatar.dart';

class FindUserPage extends StatelessWidget {
  const FindUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              const SizedBox(height: 20),
              const Text(
                'Find Users',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Switch between different user profiles',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 30),

              // Current Profile Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, color: Colors.blue[600], size: 24),
                          const SizedBox(width: 12),
                          const Text(
                            'Current Profile',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        profileController.currentProfile.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        profileController.currentProfile.title,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Available Profiles Section
              const Text(
                'Available Profiles',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              // Profiles List
              Expanded(
                child: ListView.builder(
                  itemCount: profileController.availableProfiles.length,
                  itemBuilder: (context, index) {
                    final profile = profileController.availableProfiles[index];
                    final isCurrentProfile =
                        profile.id == profileController.currentProfileId.value;

                    return _buildProfileCard(
                      profile,
                      isCurrentProfile,
                      profileController,
                      index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(
    UserProfile profile,
    bool isCurrentProfile,
    ProfileController profileController,
    int index,
  ) {
    return AnimatedProfileCard(
      delay: Duration(milliseconds: 150 * index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isCurrentProfile
              ? Border.all(color: Colors.blue[300]!, width: 2)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              // Navigate to detailed profile view page
              Get.to(() => UserProfileViewPage(userProfile: profile));
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Animated Profile Avatar
                      AnimatedAvatar(
                        size: 60,
                        gradientColors: _getProfileColors(profile.id),
                        delay: Duration(milliseconds: 100 * index),
                        assetImagePath: 'assets/${profile.profileImage}',
                      ),
                      const SizedBox(width: 16),

                      // Profile Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  profile.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                if (isCurrentProfile) ...[
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue[100],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      'Current',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue[700],
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              profile.title,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              profile.location,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Arrow Icon
                      if (!isCurrentProfile)
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey[400],
                        ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Profile Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('Projects', profile.stats.projects),
                      _buildStatItem('Experience', profile.stats.experience),
                      _buildStatItem('Rating', profile.stats.rating),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Bio
                  Text(
                    profile.bio,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
      ],
    );
  }

  List<Color> _getProfileColors(String profileId) {
    switch (profileId) {
      case 'hridoy_khan':
        return [Colors.blue[400]!, Colors.blue[600]!];
      case 'sarah_johnson':
        return [Colors.purple[400]!, Colors.purple[600]!];
      case 'alex_chen':
        return [Colors.teal[400]!, Colors.teal[600]!];
      default:
        return [Colors.grey[400]!, Colors.grey[600]!];
    }
  }
}
