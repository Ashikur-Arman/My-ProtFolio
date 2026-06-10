// ════════════════════════════════════════════════════════════
//  PORTFOLIO DATA  —  Edit this file to update your portfolio
//  Add new Experience / Project / Achievement by copying
//  the commented template blocks below each list.
// ════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

// ── PERSONAL ─────────────────────────────────────────────────
class PersonalInfo {
  PersonalInfo._();

  static const name      = 'Md. Ashikur Arman';
  static const email     = 'ashikurarman92157@gmail.com';
  static const phone     = '+8801843904734';
  static const github    = 'https://github.com/ashikur-arman';
  static const linkedin  = 'https://www.linkedin.com/in/md-ashikur-arman';
  static const summary   =
      'Flutter Developer with hands-on experience building production-ready '
      'mobile apps using Flutter, Firebase, GetX, and REST APIs. Proven '
      'ability to deliver scalable, user-centric solutions in both team-based '
      'and independent environments.';

  // Typewriter roles — add/remove freely
  static const List<String> roles = [
    'Flutter App Developer',
    'Android & iOS Developer',
    'Passionate Software Engineer',
    'Firebase & GetX Expert',
    'Mobile UI/UX Enthusiast',
    'Clean Architecture Advocate',
  ];
}

// ── STATS ────────────────────────────────────────────────────
class HeroStat {
  final String value;
  final String label;
  const HeroStat(this.value, this.label);
}

const heroStats = [
  HeroStat('3+',   'Production Apps'),
  HeroStat('150+', 'Problems Solved'),
  HeroStat('4+',   'Personal Projects'),
  HeroStat('3.46', 'CGPA'),
];

// ── TECH STACK (floating card) ────────────────────────────────
class TechItem {
  final String emoji;
  final String name;
  final double level; // 0.0 – 1.0
  const TechItem(this.emoji, this.name, this.level);
}

const techStack = [
  TechItem('🐦', 'Flutter / Dart', 0.95),
  TechItem('🔥', 'Firebase',       0.88),
  TechItem('⚙️', 'GetX',           0.90),
  TechItem('🔗', 'REST API',       0.85),
  TechItem('📐', 'Clean Arch.',    0.82),
];

// ── EXPERIENCE ────────────────────────────────────────────────
class ExperienceModel {
  final String company;
  final String companyUrl;
  final String role;
  final String type;
  final String duration;
  final List<String> bullets;
  const ExperienceModel({
    required this.company,
    required this.companyUrl,
    required this.role,
    required this.type,
    required this.duration,
    required this.bullets,
  });
}

final experiences = <ExperienceModel>[
  ExperienceModel(
    company:    'AU LTD',
    companyUrl: 'https://aultdbd.com/index.html',
    role:       'Flutter App Developer',
    type:       'Remote',
    duration:   'Feb 2026 → Present',
    bullets: [
      'Built geofence-based attendance and clock-in/out system in FitWell-Flow with real-time shift tracking and auto clock-out logic.',
      'Integrated REST APIs with retry logic and offline detection across FitWell-Flow, Eshogol e-commerce and TeliKash fintech apps.',
      'Applied clean architecture with GetX state management to maintain scalability across 3 production-grade apps.',
    ],
  ),

  // ── ADD NEW EXPERIENCE ──────────────────────────────────────
  // ExperienceModel(
  //   company:    'New Company',
  //   companyUrl: 'https://newcompany.com',
  //   role:       'Senior Flutter Developer',
  //   type:       'On-site',
  //   duration:   'Jan 2027 → Present',
  //   bullets: ['Achievement 1.', 'Achievement 2.'],
  // ),
];

// ── PROJECTS ─────────────────────────────────────────────────
class ProjectModel {
  final String emoji;
  final String title;
  final String description;
  final String impact;
  final List<TagModel> tags;
  final String? githubUrl;
  final bool isPrivate;
  final bool featured; // spans full width
  const ProjectModel({
    required this.emoji,
    required this.title,
    required this.description,
    required this.impact,
    required this.tags,
    this.githubUrl,
    this.isPrivate = false,
    this.featured  = false,
  });
}

class TagModel {
  final String label;
  final Color color;
  const TagModel(this.label, this.color);
}

final projects = <ProjectModel>[
  ProjectModel(
    emoji:       '💼',
    title:       'Smart Job Circular App',
    description: 'A job portal centralizing government and private circulars in '
                 'Bangladesh with fast search, category filtering, PDF preview, '
                 'and a chunk-based Firestore feed architecture to minimize read costs.',
    impact:      'Reduces time and effort for job seekers by centralizing all circulars in one optimized app.',
    tags: [
      TagModel('Flutter',    AppColors.neonCyan),
      TagModel('Firebase',   AppColors.neonPurple),
      TagModel('GetX',       AppColors.neonPurple),
      TagModel('GetStorage', AppColors.neonGreen),
      TagModel('Firestore',  AppColors.neonCyan),
    ],
    isPrivate: true,
    featured:  true,
  ),
  ProjectModel(
    emoji:       '🎓',
    title:       'E-Learning Platform',
    description: 'Digital learning system with course enrollment, timed quizzes '
                 'with real-time evaluation and Firestore-backed retake restrictions.',
    impact:      'Enables instant learning access and reduces dependency on printed resources.',
    tags: [
      TagModel('Flutter',  AppColors.neonCyan),
      TagModel('Firebase', AppColors.neonPurple),
      TagModel('Firestore',AppColors.neonGreen),
    ],
    githubUrl: 'https://github.com/Ashikur-Arman/E-Learnig-App',
  ),
  ProjectModel(
    emoji:       '📊',
    title:       'Wholesale Platform',
    description: 'Inventory and order management system for small wholesale '
                 'businesses built with Java and JavaFX.',
    impact:      'Streamlines inventory tracking and order processing workflows.',
    tags: [
      TagModel('Java',   AppColors.neonAmber),
      TagModel('JavaFX', AppColors.neonAmber),
    ],
    githubUrl: 'https://github.com/ashikur-arman',
  ),

  // ── ADD NEW PROJECT ──────────────────────────────────────────
  // ProjectModel(
  //   emoji:       '🚀',
  //   title:       'My New App',
  //   description: 'Description here.',
  //   impact:      'Impact here.',
  //   tags: [TagModel('Flutter', AppColors.neonCyan)],
  //   githubUrl: 'https://github.com/ashikur-arman/my-app',
  // ),
];

// ── SKILLS ───────────────────────────────────────────────────
class SkillCategory {
  final String label;
  final List<SkillItem> skills;
  const SkillCategory(this.label, this.skills);
}

class SkillItem {
  final String name;
  final Color color;
  const SkillItem(this.name, this.color);
}

final skillCategories = <SkillCategory>[
  SkillCategory('Mobile Development', [
    SkillItem('Flutter',  AppColors.neonCyan),
    SkillItem('Dart',     AppColors.neonCyan),
    SkillItem('Android',  AppColors.neonCyan),
    SkillItem('iOS',      AppColors.neonCyan),
  ]),
  SkillCategory('State Management', [
    SkillItem('GetX',       AppColors.neonPurple),
    SkillItem('GetStorage', AppColors.neonPurple),
  ]),
  SkillCategory('Backend / Cloud', [
    SkillItem('Firebase Auth', AppColors.neonGreen),
    SkillItem('Firestore',     AppColors.neonGreen),
    SkillItem('Storage',       AppColors.neonGreen),
  ]),
  SkillCategory('API Integration', [
    SkillItem('REST API',     AppColors.neonAmber),
    SkillItem('Dio',          AppColors.neonAmber),
    SkillItem('JSON Parsing', AppColors.neonAmber),
  ]),
  SkillCategory('Software Engineering', [
    SkillItem('Clean Architecture', AppColors.neonPink),
    SkillItem('Responsive UI',      AppColors.neonPink),
    SkillItem('Performance Opt.',   AppColors.neonPink),
  ]),
  SkillCategory('Tools', [
    SkillItem('Git',            AppColors.neonCyan),
    SkillItem('GitHub',         AppColors.neonCyan),
    SkillItem('VS Code',        AppColors.neonCyan),
    SkillItem('Android Studio', AppColors.neonCyan),
    SkillItem('Postman',        AppColors.neonCyan),
  ]),
];

// ── ACHIEVEMENTS ─────────────────────────────────────────────
class AchievementModel {
  final String emoji;
  final String title;
  final String subtitle;
  const AchievementModel(this.emoji, this.title, this.subtitle);
}

final achievements = <AchievementModel>[
  AchievementModel('🏆', '2nd Runner-up',          'Rangpur Divisional Project Competition (HSTU)'),
  AchievementModel('💻', 'Codeforces Rating: 883',  'Solved 150+ competitive programming problems'),
  AchievementModel('🌐', 'Open-Source Contributor', 'Active contributor on GitHub'),
  AchievementModel('🎓', 'Active CSE Club Member',  'HSTU — Dinajpur'),

  // ── ADD NEW ACHIEVEMENT ──────────────────────────────────────
  // AchievementModel('🥇', 'Award Title', 'Description here'),
];
