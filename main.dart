import 'package:flutter/material.dart';

void main() {
  runApp(const FixMesterApp());
}

class FixMesterApp extends StatelessWidget {
  const FixMesterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FixMester',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

// 1. BETÖLTŐ / SPLASH KÉPERNYŐ
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FixMesterHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Text(
                'FM',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'FixMester',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Megbízható szakemberek a te kerületedben',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// Értékelés modell
class Review {
  String authorName;
  String comment;
  double rating;
  String date;

  Review({
    required this.authorName,
    required this.comment,
    required this.rating,
    required this.date,
  });
}

// Szakember modell
class Expert {
  String name;
  String prof;
  List<String> dists;
  String phone;
  String email;
  String rating;
  String badge;
  String bio;
  String avatarUrl;
  String regCode;
  List<String> workPhotos;
  List<Review> reviewsList;
  int profileViews;
  int callClicks;

  Expert({
    required this.name,
    required this.prof,
    required this.dists,
    required this.phone,
    required this.email,
    required this.rating,
    required this.badge,
    required this.bio,
    required this.avatarUrl,
    required this.regCode,
    required this.workPhotos,
    required this.reviewsList,
    this.profileViews = 34,
    this.callClicks = 9,
  });
}

// 2. FŐOLDAL
class FixMesterHomePage extends StatefulWidget {
  const FixMesterHomePage({Key? key}) : super(key: key);

  @override
  State<FixMesterHomePage> createState() => _FixMesterHomePageState();
}

class _FixMesterHomePageState extends State<FixMesterHomePage> {
  String searchQuery = "";
  String selectedProf = "Összes szakma";
  String selectedDist = "Minden kerület";
  
  bool isAdminMode = false;
  final String secretAdminCode = "FixMester_Secure_Admin_2026#";

  // TELJES BŐVÍTETT SZAKMA LISTA
  final List<String> allProfessions = [
    'Összes szakma',
    'Vízszerelő',
    'Villanyszerelő',
    'Klímaszerelő',
    'Fűtésszerelő',
    'Festő',
    'Burkoló',
    'Asztalos',
    'Duguláselhárító',
    'Redőnyös',
    'Zár-, és biztonságtechnika',
    'Kertész / Fakivágás',
    'Kárpitos',
    'Kőműves',
    'Takarító'
  ];

  List<Expert> experts = [
    Expert(
      name: 'Kovács Péter',
      prof: 'Vízszerelő',
      dists: ['XI. kerület', 'XII. kerület', 'I. kerület'],
      phone: '+36 30 555 1234',
      email: 'kovacs.peter@fixmester.hu',
      rating: '4.9',
      badge: 'Apukám ajánlásával · Ellenőrzött',
      bio: '20 év tapasztalat csőtörés elhárításban és fürdőszoba felújításban.',
      avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150&auto=format&fit=crop&q=80',
      regCode: 'FM-REF-001',
      workPhotos: [
        'https://images.unsplash.com/photo-1581092160607-ee22621dd758?w=500&auto=format&fit=crop&q=60',
        'https://images.unsplash.com/photo-1542013936693-8846383c0abd?w=500&auto=format&fit=crop&q=60',
      ],
      reviewsList: [
        Review(authorName: 'Nagy Anna', comment: 'Nagyon pontos és precíz munkát végzett!', rating: 5.0, date: '2026.05.12'),
      ],
      profileViews: 120,
      callClicks: 28,
    ),
    Expert(
      name: 'Molnár Ferenc',
      prof: 'Kertész / Fakivágás',
      dists: ['II. kerület', 'XII. kerület', 'XI. kerület'],
      phone: '+36 70 888 4321',
      email: 'molnar.ferenc@fixmester.hu',
      rating: '5.0',
      badge: 'Apukám ajánlásával · Ellenőrzött',
      bio: 'Veszélyes fakivágás alpinista technikával, gallyazás és kertfenntartás.',
      avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&auto=format&fit=crop&q=80',
      regCode: 'FM-REF-002',
      workPhotos: [
        'https://images.unsplash.com/photo-1589939705384-5185137a7f0f?w=500&auto=format&fit=crop&q=60',
      ],
      reviewsList: [
        Review(authorName: 'Kovács Judit', comment: 'Gyorsan és biztonságosan kivágták a nagy diófát.', rating: 5.0, date: '2026.06.02'),
      ],
      profileViews: 95,
      callClicks: 22,
    ),
  ];

  final TextEditingController searchController = TextEditingController();

  void checkAdminCode(String input) {
    String trimmed = input.trim();

    if (trimmed.toUpperCase() == "EXIT" || (isAdminMode && trimmed == secretAdminCode)) {
      setState(() {
        isAdminMode = false;
        searchController.clear();
        searchQuery = "";
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kiléptél az admin módból!'), backgroundColor: Colors.grey),
      );
      return;
    }

    if (trimmed == secretAdminCode) {
      setState(() {
        isAdminMode = true;
        searchController.clear();
        searchQuery = "";
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sikeres ADMIN belépés!'), backgroundColor: Colors.red),
      );
    }
  }

  void showAdminRegistrationsModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Admin: Új Regisztrációk', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: experts.length,
                  itemBuilder: (context, index) {
                    Expert exp = experts[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      elevation: 1,
                      child: ListTile(
                        leading: CircleAvatar(backgroundImage: NetworkImage(exp.avatarUrl)),
                        title: Text('${exp.name} (${exp.regCode})', style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${exp.prof} | Kerületek: ${exp.dists.join(", ")}\nTel: ${exp.phone}'),
                        isThreeLine: true,
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              experts.remove(exp);
                            });
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${exp.name} törölve!'), backgroundColor: Colors.red),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void openAddReviewDialog(Expert expert) {
    final TextEditingController nameC = TextEditingController();
    final TextEditingController commentC = TextEditingController();
    double selectedRating = 5.0;

    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return StatefulBuilder(
          builder: (BuildContext ctx, StateSetter setDialogState) {
            return AlertDialog(
              title: Text('Értékelés: ${expert.name}'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(controller: nameC, decoration: const InputDecoration(labelText: 'Neved')),
                    const SizedBox(height: 8),
                    const Text('Csillagok:', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Row(
                      children: [
                        sliderStarButton(1.0, selectedRating, setDialogState, (v) => selectedRating = v),
                        sliderStarButton(2.0, selectedRating, setDialogState, (v) => selectedRating = v),
                        sliderStarButton(3.0, selectedRating, setDialogState, (v) => selectedRating = v),
                        sliderStarButton(4.0, selectedRating, setDialogState, (v) => selectedRating = v),
                        sliderStarButton(5.0, selectedRating, setDialogState, (v) => selectedRating = v),
                        const SizedBox(width: 8),
                        Text('$selectedRating', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(controller: commentC, maxLines: 3, decoration: const InputDecoration(labelText: 'Vélemény...')),
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Mégse')),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
                  onPressed: () {
                    if (nameC.text.isNotEmpty && commentC.text.isNotEmpty) {
                      setState(() {
                        expert.reviewsList.insert(
                          0,
                          Review(authorName: nameC.text, comment: commentC.text, rating: selectedRating, date: 'Ma'),
                        );
                        double sum = 0;
                        for (var r in expert.reviewsList) {
                          sum += r.rating;
                        }
                        expert.rating = (sum / expert.reviewsList.length).toStringAsFixed(1);
                      });
                      Navigator.pop(ctx);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Értékelés rögzítve!'), backgroundColor: Colors.green),
                      );
                    }
                  },
                  child: const Text('Küldés'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget sliderStarButton(double value, double current, StateSetter setDialogState, Function(double) onChanged) {
    return IconButton(
      icon: Icon(value <= current ? Icons.star : Icons.star_border, color: Colors.amber),
      onPressed: () => setDialogState(() => onChanged(value)),
    );
  }

  void openReg() {
    final TextEditingController nameC = TextEditingController();
    final TextEditingController phoneC = TextEditingController();
    final TextEditingController emailC = TextEditingController();
    final TextEditingController bioC = TextEditingController();
    
    List<String> regProfessions = allProfessions.where((p) => p != 'Összes szakma').toList();
    String profC = regProfessions.first;
    
    List<String> allDistricts = ['I. kerület', 'II. kerület', 'III. kerület', 'IV. kerület', 'XI. kerület', 'XII. kerület', 'XIII. kerület', 'XIV. kerület', 'XVI. kerület'];
    Map<String, bool> selectedDistricts = {
      'I. kerület': false, 'II. kerület': false, 'III. kerület': false, 'IV. kerület': false,
      'XI. kerület': true, 'XII. kerület': false, 'XIII. kerület': false, 'XIV. kerület': false, 'XVI. kerület': false,
    };

    String uploadedAvatar = 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&auto=format&fit=crop&q=80';
    List<String> uploadedWorkPhotos = [
      'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=500&auto=format&fit=crop&q=60'
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext ctx) {
        return StatefulBuilder(
          builder: (BuildContext ctx, StateSetter setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Új szakember regisztrációja', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(radius: 40, backgroundImage: NetworkImage(uploadedAvatar)),
                          const SizedBox(height: 8),
                          OutlinedButton.icon(
                            onPressed: () {
                              setModalState(() {
                                uploadedAvatar = 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=150&auto=format&fit=crop&q=80';
                              });
                            },
                            icon: const Icon(Icons.person_pin, size: 16, color: Colors.orange),
                            label: const Text('Profilkép kiválasztása', style: TextStyle(color: Colors.orange)),
                            style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.orange)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(controller: nameC, decoration: const InputDecoration(labelText: 'Név')),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: profC,
                      items: regProfessions
                          .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                          .toList(),
                      onChanged: (val) => setModalState(() => profC = val!),
                      decoration: const InputDecoration(labelText: 'Szakma / Szolgáltatás'),
                    ),
                    const SizedBox(height: 12),
                    
                    const Text('Mely kerületekben vállalsz munkát?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.orange)),
                    const SizedBox(height: 6),
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: allDistricts.map((dist) {
                          return CheckboxListTile(
                            title: Text(dist, style: const TextStyle(fontSize: 13)),
                            value: selectedDistricts[dist],
                            activeColor: Colors.orange,
                            dense: true,
                            onChanged: (bool? value) {
                              setModalState(() {
                                selectedDistricts[dist] = value ?? false;
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 12),

                    TextField(controller: phoneC, decoration: const InputDecoration(labelText: 'Telefonszám')),
                    const SizedBox(height: 8),
                    TextField(
                      controller: emailC,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: 'Valódi E-mail cím'),
                    ),
                    const SizedBox(height: 8),
                    TextField(controller: bioC, decoration: const InputDecoration(labelText: 'Rövid leírás')),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
                        onPressed: () {
                          String email = emailC.text.trim();
                          bool isEmailValid = email.contains('@') && email.contains('.') && email.length > 5;
                          
                          List<String> chosenDists = [];
                          selectedDistricts.forEach((dist, isSelected) {
                            if (isSelected) chosenDists.add(dist);
                          });

                          if (nameC.text.isNotEmpty && phoneC.text.isNotEmpty && isEmailValid && chosenDists.isNotEmpty) {
                            String generatedCode = 'FM-REF-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';

                            setState(() {
                              experts.insert(
                                0,
                                Expert(
                                  name: nameC.text,
                                  prof: profC,
                                  dists: chosenDists,
                                  phone: phoneC.text,
                                  email: email,
                                  rating: '5.0',
                                  badge: 'Új regisztrált',
                                  bio: bioC.text.isNotEmpty ? bioC.text : 'Szakember leírása.',
                                  avatarUrl: uploadedAvatar,
                                  regCode: generatedCode,
                                  workPhotos: uploadedWorkPhotos,
                                  reviewsList: [],
                                  profileViews: 1,
                                  callClicks: 0,
                                ),
                              );
                            });
                            Navigator.pop(ctx);
                            
                            if (isAdminMode) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('🔔 ADMIN ÉRTESÍTÉS: Új szaki! Kód: $generatedCode'),
                                  backgroundColor: Colors.red.shade800,
                                  duration: const Duration(seconds: 6),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Sikeres regisztráció!'), backgroundColor: Colors.green),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Kérlek tölts ki minden mezőt, és válassz ki legalább EGY kerületet!'), backgroundColor: Colors.red),
                            );
                          }
                        },
                        child: const Text('Regisztráció'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void openDetail(Expert expert) {
    setState(() {
      expert.profileViews++;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(radius: 35, backgroundImage: NetworkImage(expert.avatarUrl)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(expert.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 2),
                            Text(expert.prof, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.w600, fontSize: 14)),
                            const SizedBox(height: 2),
                            Text('Kerületek: ${expert.dists.join(", ")}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 4),
                      Text(expert.rating, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Text(' (${expert.reviewsList.length} értékelés)', style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // STATISZTIKA KÁRTYA
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.orange.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.insights, color: Colors.orange, size: 18),
                            SizedBox(width: 8),
                            Text('FixMester Teljesítmény Statisztika', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.orange)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text('${expert.profileViews}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                const Text('Profil megtekintés', style: TextStyle(fontSize: 11, color: Colors.grey)),
                              ],
                            ),
                            Container(height: 25, width: 1, color: Colors.orange.shade200),
                            Column(
                              children: [
                                Text('${expert.callClicks}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                                const Text('Appon belüli hívás', style: TextStyle(fontSize: 11, color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Telefonszám', style: TextStyle(fontSize: 11, color: Colors.grey)),
                            Text(expert.phone, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              expert.callClicks++;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('📞 FixMester hívás indítva: ${expert.phone}'), backgroundColor: Colors.green),
                            );
                          },
                          icon: const Icon(Icons.phone, size: 16),
                          label: const Text('Hívás az Appból'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Bemutatkozás', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 6),
                  Text(expert.bio, style: const TextStyle(color: Colors.black87, fontSize: 14)),
                  const SizedBox(height: 20),
                  const Text('Munkák képei', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: expert.workPhotos.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(image: NetworkImage(expert.workPhotos[index]), fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Ügyfelek értékelései', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ElevatedButton.icon(
                        onPressed: () => openAddReviewDialog(expert),
                        icon: const Icon(Icons.rate_review, size: 14),
                        label: const Text('Értékelés írása'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade700, foregroundColor: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: expert.reviewsList.length,
                    itemBuilder: (context, index) {
                      Review rev = expert.reviewsList[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        elevation: 0,
                        color: Colors.grey.shade100,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(rev.authorName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                  Text(rev.date, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Row(
                                    children: List.generate(5, (starIdx) {
                                      return Icon(
                                        starIdx < rev.rating ? Icons.star : Icons.star_border,
                                        color: Colors.amber,
                                        size: 14,
                                      );
                                    }),
                                  ),
                                  const SizedBox(width: 6),
                                  Text('${rev.rating}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(rev.comment, style: const TextStyle(fontSize: 13, color: Colors.black87)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Expert> filtered = experts.where((item) {
      bool matchSearch = item.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          item.prof.toLowerCase().contains(searchQuery.toLowerCase());
      bool matchProf = selectedProf == "Összes szakma" || item.prof == selectedProf;
      bool matchDist = selectedDist == "Minden kerület" || item.dists.contains(selectedDist);
      return matchSearch && matchProf && matchDist;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isAdminMode ? Colors.red.shade800 : Colors.orange,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Text(isAdminMode ? 'ADMIN' : 'FM', style: TextStyle(color: isAdminMode ? Colors.red.shade800 : Colors.orange, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 10),
            Text(isAdminMode ? 'FixMester [ADMIN MÓD]' : 'FixMester', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(4)),
              child: Text(isAdminMode ? 'VÉDETT' : 'Béta', style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ],
        ),
        actions: [
          if (isAdminMode)
            IconButton(
              icon: const Icon(Icons.list_alt, color: Colors.white),
              tooltip: 'Regisztráltak megtekintése',
              onPressed: showAdminRegistrationsModal,
            ),
          IconButton(
            icon: const Icon(Icons.person_add, color: Colors.white),
            onPressed: openReg,
            tooltip: 'Új Szaki',
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  onChanged: (val) {
                    setState(() => searchQuery = val);
                    checkAdminCode(val);
                  },
                  onSubmitted: (val) => checkAdminCode(val),
                  decoration: InputDecoration(
                    hintText: 'Keresés név vagy szakma (pl. klíma, fa...) szerint...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: const Color(0xFFF8FAFC),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedProf,
                        isExpanded: true,
                        items: allProfessions
                            .map((p) => DropdownMenuItem(value: p, child: Text(p, style: const TextStyle(fontSize: 12))))
                            .toList(),
                        onChanged: (val) => setState(() => selectedProf = val!),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedDist,
                        isExpanded: true,
                        items: ['Minden kerület', 'I. kerület', 'II. kerület', 'III. kerület', 'IV. kerület', 'XI. kerület', 'XII. kerület', 'XIII. kerület', 'XIV. kerület', 'XVI. kerület']
                            .map((d) => DropdownMenuItem(value: d, child: Text(d, style: const TextStyle(fontSize: 12))))
                            .toList(),
                        onChanged: (val) => setState(() => selectedDist = val!),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(isAdminMode ? 'Szakemberek kezelése (Admin Mód)' : 'Elérhető Szakemberek', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isAdminMode ? Colors.red.shade800 : Colors.black)),
                Text('${filtered.length} szaki', style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                Expert item = filtered[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 1,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => openDetail(item),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(radius: 30, backgroundImage: NetworkImage(item.avatarUrl)),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(6)),
                                      child: Text(item.dists.isNotEmpty ? item.dists.first : 'Kerület', style: const TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(item.prof, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 13)),
                                const SizedBox(height: 4),
                                Text('📍 ${item.dists.length} kerületben vállal munkát', style: const TextStyle(color: Colors.blueGrey, fontSize: 11)),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber, size: 16),
                                    const SizedBox(width: 4),
                                    Text(item.rating, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                    Text(' (${item.reviewsList.length})', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(item.badge, style: const TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.w500)),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('📞 Telefonszám rejtve', style: TextStyle(color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic)),
                                    Row(
                                      children: [
                                        if (isAdminMode) ...[
                                          IconButton(
                                            icon: const Icon(Icons.delete_forever, color: Colors.red),
                                            tooltip: 'Törlés',
                                            onPressed: () {
                                              setState(() {
                                                experts.remove(item);
                                              });
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('${item.name} törölve!'), backgroundColor: Colors.red),
                                              );
                                            },
                                          ),
                                          const SizedBox(width: 4),
                                        ],
                                        ElevatedButton.icon(
                                          onPressed: () => openDetail(item),
                                          icon: const Icon(Icons.phone, size: 14),
                                          label: const Text('Szám megtekintése', style: TextStyle(fontSize: 12)),
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 10)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
