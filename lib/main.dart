import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF3F3F3),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D7DBB)),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _rollController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final roll = _rollController.text.trim();
    final password = _passwordController.text.trim();

    if (roll.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your Roll No and Password.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DashboardPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 52,
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'My Portfolio',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 26),
                    TextField(
                      controller: _rollController,
                      decoration: InputDecoration(
                        labelText: 'Roll No',
                        prefixIcon: const Icon(Icons.badge_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A5F),
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(52),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardItems = [
      _DashboardItem(
        number: '1.',
        title: 'About Me',
        icon: Icons.person_outline,
        color: Colors.blue,
      ),
      _DashboardItem(
        number: '2.',
        title: 'Course Certifications (Skills)',
        icon: Icons.workspace_premium_outlined,
        color: Colors.purple,
      ),
      _DashboardItem(
        number: '3.',
        title: 'Extra-Curricular Activities',
        icon: Icons.emoji_events_outlined,
        color: Colors.green,
      ),
      _DashboardItem(
        number: '4.',
        title: 'Certificates Video',
        icon: Icons.movie_creation_outlined,
        color: Colors.orange,
      ),
      _DashboardItem(
        number: '5.',
        title: 'Logout -> Back to Login Page',
        icon: Icons.logout,
        color: Colors.red,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3A5F),
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(18),
        itemCount: dashboardItems.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = dashboardItems[index];
          return Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                if (item.title.startsWith('Logout')) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => false,
                  );
                  return;
                }

                if (item.number == '1.') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutMePage()),
                  );
                  return;
                }

                if (item.number == '2.') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CertificatePage()),
                  );
                  return;
                }

                if (item.number == '3.') {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ActivitiesPage()));
                  return;
                }

                if (item.number == '4.') {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const AchievementsVideoPage()));
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.title} selected'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: item.color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(item.icon, color: item.color, size: 28),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        '${item.number} ${item.title}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    final educationRows = [
      ['BVRIT HYDERABAD College of Engineering for Women, Hyderabad, India', 'Bachelor of Technology – Computer Science and Engineering', '2024–2028'],
      ['Excellence Junior College, Telangana', 'Intermediate (Telangana State Board)', '2022–2024'],
      ['Alphores High School, Telangana', 'Secondary School (BSE Telangana)', '2021–2022'],
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: const Color(0xFF1E3A5F),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 62,
                        backgroundImage: AssetImage('assets/images/profile.jpeg'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'MINUPALA SHARANYA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1B1B1B),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'minupalasharanaya724@gmail.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '+91 9550724114',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'GitHub - LinkedIn',
                  style: TextStyle(fontSize: 21, color: Colors.black87),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Objective',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0E0E0E),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Computer Science undergraduate with strong foundations in Java, Data Structures & Algorithms, and web development. Passionate about problem-solving and building practical software applications. Currently developing full-stack skills and seeking opportunities to apply technical knowledge to real-world software projects.',
                  style: TextStyle(fontSize: 20, height: 1.6, color: Colors.black87),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Education',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0E0E0E),
                  ),
                ),
                const SizedBox(height: 16),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(3),
                    2: FlexColumnWidth(1.1),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black.withValues(alpha: 0.35), width: 1.2)),
                      ),
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Institution',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Course / Details',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Year',
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    ...educationRows.map(
                      (row) => TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(row[0], style: const TextStyle(fontSize: 17)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(row[1], style: const TextStyle(fontSize: 17)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(row[2], style: const TextStyle(fontSize: 17)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CertificatePage extends StatelessWidget {
  const CertificatePage({super.key});

  static const items = [
    ['Object Oriented Programming Through Java', 'CodeChef', 'November 2, 2025', 'assets/images/certificates/codechef_java.png'],
    ['HTML5 - The Language', 'Infosys Springboard', 'February 7, 2026', 'assets/images/certificates/infosys_html5.png'],
    ['CSS3', 'Infosys Springboard', 'February 8, 2026', 'assets/images/certificates/infosys_css3.png'],
    ['JavaScript', 'Infosys Springboard', 'February 8, 2026', 'assets/images/certificates/infosys_javascript.png'],
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Course Certificates'), backgroundColor: const Color(0xFF1E3A5F), foregroundColor: Colors.white),
        body: ListView(padding: const EdgeInsets.all(18), children: [
          const Text('Certificates earned by Minupala Sharanaya', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...items.map((item) => Card(
                clipBehavior: Clip.antiAlias,
                child: ExpansionTile(
                  leading: const CircleAvatar(child: Icon(Icons.workspace_premium_outlined)),
                  title: Text(item[0], style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${item[1]} • ${item[2]}'),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Image.asset(
                        item[3],
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('Certificate image could not be loaded.'),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ]),
      );
}
class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  static const _certificatePath =
      'assets/images/certificates/autosuggest_bootcamp.jpeg';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Extra-Curricular Activities'),
          backgroundColor: const Color(0xFF1E3A5F),
          foregroundColor: Colors.white,
        ),
        body: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.emoji_events_outlined,
                        color: Colors.green, size: 40),
                    SizedBox(height: 12),
                    Text('AutoSuggest Bootcamp',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Certificate of Participation - Being Infinity and BVRITH'),
                    SizedBox(height: 8),
                    Text(
                      'Participated on June 19-20, 2026. Conducted by BVRIT Hyderabad College of Engineering for Women in collaboration with Being Infinity.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => showDialog<void>(
                  context: context,
                  builder: (dialogContext) => Dialog(
                    insetPadding: const EdgeInsets.all(12),
                    child: InteractiveViewer(
                      minScale: 0.8,
                      maxScale: 4,
                      child: Image.asset(
                        _certificatePath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('Certificate image could not be loaded.'),
                        ),
                      ),
                    ),
                  ),
                ),
                child: Image.asset(
                  _certificatePath,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Certificate image could not be loaded.'),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Tap the certificate to view it full size.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
class AchievementsVideoPage extends StatelessWidget {
  const AchievementsVideoPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Certificates Video'),
          backgroundColor: const Color(0xFF1E3A5F),
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'All Certificates',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/videos/certificate_montage.gif',
                      width: double.infinity,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text('Certificate video could not be loaded.'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Certificate montage',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
// ignore: unused_element
class _OriginalCertificatePage extends StatelessWidget {
  const _OriginalCertificatePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        title: const Text('Certificate'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            width: 1100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFC9932C), width: 4),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 6)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 28, 28, 18),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 22,
                        color: const Color(0xFFBFDDE8),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Infosys',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0B8AC7),
                          letterSpacing: -2,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '®',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0B8AC7),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Navigate your next',
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF0B8AC7),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 18,
                          color: const Color(0xFFDDEAF1),
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Text(
                        'COURSE COMPLETION CERTIFICATE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0B8AC7),
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Container(
                          height: 18,
                          color: const Color(0xFFDDEAF1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 34),
                  const Text(
                    'The certificate is awarded to',
                    style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Minupala Sharanaya',
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'for successfully completing the course',
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'HTML5 - The Language',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'on February 7, 2026',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 26),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 24),
                      Container(
                        width: 240,
                        height: 240,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          color: Colors.white,
                        ),
                        child: CustomPaint(
                          painter: QRCodePainter(),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Infosys',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF0B8AC7),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Springboard',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFFA6A3C),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Congratulations! You make us proud!',
                              style: TextStyle(
                                fontSize: 28,
                                fontStyle: FontStyle.italic,
                                color: Color(0xFFFA6A3C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      Column(
                        children: const [
                          Icon(Icons.edit_note_rounded, size: 44, color: Colors.blueGrey),
                          SizedBox(height: 8),
                          Text(
                            'Sathesha B. Nanjappa',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'Senior Vice President and Head',
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          Text(
                            'Education, Training and Assessment',
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          Text(
                            'Infosys Limited',
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Issued on: Sunday, February 7, 2026',
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                      Text(
                        'To verify, scan the QR code at https://verify.onwingspan.com',
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashboardItem {
  final String number;
  final String title;
  final IconData icon;
  final Color color;

  const _DashboardItem({
    required this.number,
    required this.title,
    required this.icon,
    required this.color,
  });
}

class QRCodePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    final cell = size.width / 21;

    for (var row = 0; row < 21; row++) {
      for (var col = 0; col < 21; col++) {
        final dx = col * cell;
        final dy = row * cell;

        final shouldPaint = _isFilled(row, col);
        if (!shouldPaint) continue;

        canvas.drawRect(
          Rect.fromLTWH(dx + 1, dy + 1, cell - 2, cell - 2),
          paint,
        );
      }
    }
  }

  bool _isFilled(int row, int col) {
    final total = row * col + row + col;
    final border = row < 7 || col < 7 || row > 13 || col > 13;
    final matrix = (row * 3 + col * 5 + total) % 5 == 0;
    final center = ((row - 10).abs() <= 2 && (col - 10).abs() <= 2);
    return border || matrix || center;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
