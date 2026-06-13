// ================================================================
//  PORTFOLIO DATA — Edit ONLY this file to update your portfolio
// ================================================================

class PortfolioData {
  PortfolioData._();

  static const String name     = 'Md. Ashikur Arman';
  static const String email    = 'ashikurarman92157@gmail.com';
  static const String phone    = '+8801843904734';
  static const String github   = 'https://github.com/ashikur-arman';
  static const String linkedin = 'https://www.linkedin.com/in/md-ashikur-arman';
  static const String summary  =
      'Flutter Developer with hands-on experience building production-ready '
      'mobile apps using Flutter, Firebase, GetX, and REST APIs. Proven ability '
      'to deliver scalable, user-centric solutions in both team-based and '
      'independent environments.';

  // Typewriter roles — add/remove freely
  static const List<String> roles = [
    'Flutter App Developer',
    'Android & iOS Developer',
    'Passionate Software Engineer',
    'Firebase & GetX Expert',
    'Mobile UI/UX Enthusiast',
    'Clean Architecture Advocate',
  ];

  static const List<StatModel> stats = [
    StatModel(value: '3+',   label: 'Production Apps'),
    StatModel(value: '150+', label: 'Problems Solved'),
    StatModel(value: '4+',   label: 'Personal Projects'),
    StatModel(value: '3.46', label: 'CGPA'),
  ];

  // Tech stack — shown in hero right panel with progress bars
  static const List<TechModel> techStack = [
    TechModel(name: 'Flutter / Dart', pct: 0.95),
    TechModel(name: 'Firebase',       pct: 0.88),
    TechModel(name: 'GetX',           pct: 0.90),
    TechModel(name: 'REST API',       pct: 0.85),
    TechModel(name: 'Clean Arch.',    pct: 0.82),
  ];

  // Marquee strip — scrolling tech tags below hero
  static const List<String> marqueeTags = [
    'Flutter', 'Firebase', 'GetX', 'REST API',
    'Clean Architecture', 'Android & iOS', 'Dart',
  ];

  // ── EXPERIENCE — add new ExperienceModel blocks here ─────────
  static final List<ExperienceModel> experiences = [
    ExperienceModel(
      company: 'AU LTD', companyUrl: 'https://aultdbd.com/index.html',
      role: 'Flutter App Developer', type: 'Remote',
      duration: 'Feb 2026 — Present',
      bullets: [
        'Built geofence-based attendance and clock-in/out system in FitWell-Flow with real-time shift tracking and auto clock-out logic.',
        'Integrated REST APIs with retry logic and offline detection across FitWell-Flow, Eshogol e-commerce and TeliKash fintech apps.',
        'Applied clean architecture with GetX state management to maintain scalability across 3 production-grade apps.',
      ],
    ),
    // ExperienceModel(
    //   company: 'New Company', companyUrl: 'https://...',
    //   role: 'Senior Flutter Developer', type: 'On-site',
    //   duration: 'Jan 2027 — Present',
    //   bullets: ['Achievement here.'],
    // ),
  ];

  // ── PROJECTS — add new ProjectModel blocks here ───────────────
  static final List<ProjectModel> projects = [
    ProjectModel(
      title: 'Smart Job Circular App', featured: true,
      desc: 'Job portal centralizing government and private circulars in Bangladesh '
            'with fast search, category filtering, PDF preview, and chunk-based '
            'Firestore feed architecture to minimize read costs.',
      impact: 'Reduces time and effort for job seekers by centralizing all circulars in one optimized app.',
      tags: ['Flutter','Firebase','GetX','Firestore'],
      githubUrl: null, isPrivate: true,
    ),
    ProjectModel(
      title: 'E-Learning Platform', featured: false,
      desc: 'Digital learning system with course enrollment, timed quizzes with '
            'real-time evaluation and Firestore-backed retake restrictions.',
      impact: 'Enables instant learning access and reduces dependency on printed resources.',
      tags: ['Flutter','Firebase'],
      githubUrl: 'https://github.com/Ashikur-Arman/E-Learnig-App', isPrivate: false,
    ),
    ProjectModel(
      title: 'Wholesale Platform', featured: false,
      desc: 'Inventory and order management system for small wholesale businesses.',
      impact: 'Streamlines inventory tracking and order processing workflows.',
      tags: ['Java','JavaFX'],
      githubUrl: 'https://github.com/ashikur-arman', isPrivate: false,
    ),
    // ProjectModel(
    //   title: 'My New App', featured: false,
    //   desc: 'Description here.',
    //   impact: 'Impact here.',
    //   tags: ['Flutter','Firebase'],
    //   githubUrl: null, isPrivate: false,
    // ),
  ];

  // ── SKILLS ────────────────────────────────────────────────────
  static final List<SkillCatModel> skills = [
    SkillCatModel(cat: 'Mobile Development',
        skills: ['Flutter','Dart','Android','iOS']),
    SkillCatModel(cat: 'State Management',
        skills: ['GetX','GetStorage']),
    SkillCatModel(cat: 'Backend / Cloud',
        skills: ['Firebase Auth','Firestore','Storage']),
    SkillCatModel(cat: 'API Integration',
        skills: ['REST API','Dio','JSON Parsing']),
    SkillCatModel(cat: 'Software Engineering',
        skills: ['Clean Architecture','Responsive UI','Performance Opt.']),
    SkillCatModel(cat: 'Tools',
        skills: ['Git','GitHub','VS Code','Postman']),
  ];

  // ── ACHIEVEMENTS — add new AchModel blocks here ───────────────
  static final List<AchModel> achievements = [
    AchModel(title: '2nd Runner-up',
        sub: 'Rangpur Divisional Project Competition (HSTU)'),
    AchModel(title: 'Codeforces Rating: 883',
        sub: 'Solved 150+ competitive programming problems'),
    AchModel(title: 'Open-Source Contributor',
        sub: 'Active contributor on GitHub'),
    AchModel(title: 'Active CSE Club Member',
        sub: 'HSTU — Dinajpur'),
  ];
}

// ── MODELS ────────────────────────────────────────────────────────

class StatModel {
  final String value, label;
  const StatModel({required this.value, required this.label});
}

class TechModel {
  final String name;
  final double pct;
  const TechModel({required this.name, required this.pct});
}

class ExperienceModel {
  final String company, companyUrl, role, type, duration;
  final List<String> bullets;
  const ExperienceModel({
    required this.company, required this.companyUrl, required this.role,
    required this.type, required this.duration, required this.bullets,
  });
}

class ProjectModel {
  final String title, desc, impact;
  final List<String> tags;
  final String? githubUrl;
  final bool isPrivate, featured;
  const ProjectModel({
    required this.title, required this.desc, required this.impact,
    required this.tags, required this.githubUrl,
    required this.isPrivate, required this.featured,
  });
}

class SkillCatModel {
  final String cat;
  final List<String> skills;
  const SkillCatModel({required this.cat, required this.skills});
}

class AchModel {
  final String title, sub;
  const AchModel({required this.title, required this.sub});
}
