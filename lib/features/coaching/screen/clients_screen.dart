import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/provider/client_provider.dart';
import 'package:kinetic/features/coaching/widgets/client_widgets.dart';
import 'package:provider/provider.dart';


class ClientsScreen extends StatefulWidget {
  const ClientsScreen({Key? key}) : super(key: key);

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ClientProvider>().fetchClientsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<ClientProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/11.jpg')),
        ),
        title: Text(l10n.clientsTitle, style: AppTextStyles.trainAppBar20),
        actions: [
          IconButton(icon: const Icon(Icons.settings_outlined, color: AppColors.darkCharcoal), onPressed: () {}),
        ],
      ),
      body: provider.isLoading || provider.dashboardData == null
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  DashboardStatsRow(data: provider.dashboardData!, l10n: l10n),
                  const SizedBox(height: 24),
                  
                  SearchClientBar(l10n: l10n),
                  const SizedBox(height: 24),
                  
                  ...provider.dashboardData!.clients.map((client) => ClientCard(client: client, l10n: l10n)).toList(),
                  const SizedBox(height: 80), // مساحة للـ FAB
                ],
              ),
            ),
            
      // الزر العائم (FAB) - تم ضبطه كـ Squircle (مربع بحواف ناعمة) كما في الصورة[cite: 2]
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), // الحواف المنحنية بدل الدائرة
          gradient: const LinearGradient(
            colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
        ),
      ),
      // تم إزالة bottomNavigationBar كما طلبت
    );
  }
}