
Open sidebar
Upgrade


You said:



You said:
Screenshot_20260725_160558_com.android.chrome.jpg



ChatGPT said:
Earnmate Bd Flutter Starter
· dart



void main() {
  }
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Learn, earn, and grow'),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EarnMate BD'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Your starter app is ready.'),
            const SizedBox(height: 24),
            _InfoCard(
              icon: Icons.stars_rounded,
              title: 'Total Points',
              value: '0',
            ),
            const SizedBox(height: 12),
            _InfoCard(
              icon: Icons.check_circle_rounded,
              title: 'Daily Bonus',
              value: 'Available',
            ),
            const SizedBox(height: 12),
            _InfoCard(
              icon: Icons.quiz_rounded,
              title: 'Quiz',
              value: 'Coming soon',
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}
