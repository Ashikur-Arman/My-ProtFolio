// ============================================================
// PORTFOLIO DATA — Edit this file to update your portfolio
// ============================================================

class PortfolioData {
  PortfolioData._();

  // ── PERSONAL INFO ──────────────────────────────────────────
  static const String name = 'Md. Ashikur Arman';
  static const String role = 'Flutter App Developer';
  static const String tagline = 'Android & iOS';
  static const String summary =
      'Flutter Developer with hands-on experience building production-ready '
      'mobile applications using Flutter, Firebase, GetX, and REST APIs. '
      'Proven ability to deliver scalable, user-centric solutions in both '
      'team-based and independent environments.';

  static const String email = 'ashikurarman92157@gmail.com';
  static const String phone = '+8801843904734';
  static const String github = 'https://github.com/ashikur-arman';
  static const String linkedin =
      'https://www.linkedin.com/in/md-ashikur-arman';

  // ── EXPERIENCE ─────────────────────────────────────────────
  // To add a new experience, copy one ExperienceModel block and paste below.
  static final List<ExperienceModel> experiences = [
    ExperienceModel(
      company: 'AU LTD',
      companyUrl: 'https://aultdbd.com/index.html',
      role: 'Flutter App Developer',
      type: 'Remote',
      duration: 'Feb 2026 – Present',
      bullets: [
        'Built geofence-based attendance and clock-in/out system in FitWell-Flow with real-time shift tracking and auto clock-out logic.',
        'Integrated REST APIs with retry logic and offline detection across FitWell-Flow, Eshogol e-commerce and TeliKash fintech apps.',
        'Applied clean architecture with GetX state management to maintain scalability across 3 production-grade apps.',
      ],
    ),
    // ── ADD NEW EXPERIENCE HERE ──
    // ExperienceModel(
    //   company: 'New Company',
    //   companyUrl: 'https://newcompany.com',
    //   role: 'Senior Flutter Developer',
    //   type: 'On-site',
    //   duration: 'Jan 2027 – Present',
    //   bullets: [
    //     'Your achievement here.',
    //   ],
    // ),
  ];

  // ── PROJECTS ───────────────────────────────────────────────
  // To add a new project, copy one ProjectModel block and paste below.
  static final List<ProjectModel> projects = [
    ProjectModel(
      title: 'Smart Job Circular App',
      description:
          'A job portal centralizing government and private circulars in Bangladesh '
          'with fast search, category filtering, PDF preview, and a chunk-based '
          'Firestore feed architecture to minimize read costs.',
      impact:
          'Reduces time and effort for job seekers by centralizing all circulars in one optimized app.',
      tags: ['Flutter', 'Firebase', 'GetX', 'GetStorage', 'Firestore'],
      githubUrl: null,
      isPrivate: true,
    ),
    ProjectModel(
      title: 'E-Learning Platform',
      description:
          'A digital learning system with course enrollment, instant material access, '
          'and timed quizzes with real-time evaluation and Firestore-backed retake restrictions.',
      impact:
          'Enables instant learning access and reduces dependency on printed educational resources.',
      tags: ['Flutter', 'Firebase', 'Firestore', 'GetX'],
      githubUrl: 'https://github.com/Ashikur-Arman/E-Learnig-App',
      isPrivate: false,
    ),
    ProjectModel(
      title: 'Wholesale Platform',
      description:
          'Inventory and order management system built with Java and JavaFX for small wholesale businesses.',
      impact: 'Streamlines inventory tracking and order processing.',
      tags: ['Java', 'JavaFX'],
      githubUrl: 'https://github.com/ashikur-arman',
      isPrivate: false,
    ),
    ProjectModel(
      title: 'NotePad App',
      description:
          'Offline-first note-taking application using Flutter and Hive for local persistence.',
      impact: 'Fast, lightweight note management with zero internet dependency.',
      tags: ['Flutter', 'Hive', 'Dart'],
      githubUrl: 'https://github.com/ashikur-arman',
      isPrivate: false,
    ),
    // ── ADD NEW PROJECT HERE ──
    // ProjectModel(
    //   title: 'My New Project',
    //   description: 'Description here.',
    //   impact: 'Impact here.',
    //   tags: ['Flutter', 'Firebase'],
    //   githubUrl: 'https://github.com/ashikur-arman/my-project',
    //   isPrivate: false,
    // ),
  ];

  // ── SKILLS ─────────────────────────────────────────────────
  static final List<SkillCategoryModel> skills = [
    SkillCategoryModel(
      category: 'Mobile Development',
      skills: ['Flutter', 'Dart', 'Android', 'iOS'],
    ),
    SkillCategoryModel(
      category: 'State Management',
      skills: ['GetX', 'GetStorage'],
    ),
    SkillCategoryModel(
      category: 'Backend / Cloud',
      skills: ['Firebase Auth', 'Firestore', 'Firebase Storage'],
    ),
    SkillCategoryModel(
      category: 'API Integration',
      skills: ['REST API', 'JSON Parsing', 'Dio'],
    ),
    SkillCategoryModel(
      category: 'Software Engineering',
      skills: ['Clean Architecture', 'Responsive UI', 'Performance Optimization'],
    ),
    SkillCategoryModel(
      category: 'Tools',
      skills: ['Git', 'GitHub', 'VS Code', 'Android Studio', 'Postman'],
    ),
  ];

  // ── ACHIEVEMENTS ───────────────────────────────────────────
  static final List<AchievementModel> achievements = [
    AchievementModel(
      title: '2nd Runner-up',
      subtitle: 'Rangpur Divisional Project Competition (HSTU)',
      icon: '🏆',
    ),
    AchievementModel(
      title: 'Codeforces Rating: 883',
      subtitle: 'Solved 150+ competitive programming problems',
      icon: '💻',
    ),
    AchievementModel(
      title: 'Open-Source Contributor',
      subtitle: 'Active contributor on GitHub',
      icon: '🌐',
    ),
    AchievementModel(
      title: 'Active CSE Club Member',
      subtitle: 'HSTU — Hajee Mohammad Danesh Science & Technology University',
      icon: '🎓',
    ),
    // ── ADD NEW ACHIEVEMENT HERE ──
  ];

  // ── EDUCATION ──────────────────────────────────────────────
  static const String university =
      'Hajee Mohammad Danesh Science and Technology University, Dinajpur';
  static const String degree =
      'B.Sc. in Computer Science and Engineering (CSE)';
  static const String eduDuration = '2022 – Present';
  static const String cgpa = '3.456';
  static const String expectedGraduation = 'Mid-2026';
}

// ── MODELS ─────────────────────────────────────────────────

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

class ProjectModel {
  final String title;
  final String description;
  final String impact;
  final List<String> tags;
  final String? githubUrl;
  final bool isPrivate;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.impact,
    required this.tags,
    required this.githubUrl,
    required this.isPrivate,
  });
}

class SkillCategoryModel {
  final String category;
  final List<String> skills;

  const SkillCategoryModel({
    required this.category,
    required this.skills,
  });
}

class AchievementModel {
  final String title;
  final String subtitle;
  final String icon;

  const AchievementModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}
