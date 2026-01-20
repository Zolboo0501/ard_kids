import 'package:ard_light/components/button.dart';
import 'package:ard_light/components/text_view.dart';
import 'package:ard_light/features/auth/presentation/widget/bullet_point.dart';
import 'package:ard_light/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FaceVerification extends StatefulWidget {
  final Function(int) onTabChange;

  const FaceVerification({Key? key, required this.onTabChange})
    : super(key: key);

  @override
  _FaceVerificationState createState() => _FaceVerificationState();
}

class _FaceVerificationState extends State<FaceVerification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Warning banner
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF4E5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: AppLocalizations.of(
                                  context,
                                )!.faceVerificationWarning,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFFF8C00),
                              ),
                              const SizedBox(height: 4),
                              TextView(
                                text: AppLocalizations.of(
                                  context,
                                )!.faceVerificationWarningDescription,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFF8C00),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFFF8C00),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: TextView(
                              text: 'i',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF8C00),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  TextView(
                    text: AppLocalizations.of(context)!.faceVerificationTitle,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 20),

                  // Correct face illustration
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 51),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(75),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              size: 80,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 77),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextView(
                            text: AppLocalizations.of(
                              context,
                            )!.faceVerificationCorrect,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF4CAF50),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Incorrect face illustration
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 51),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(75),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              size: 80,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: 77),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEBEE),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextView(
                            text: AppLocalizations.of(
                              context,
                            )!.faceVerificationIncorrect,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFF44336),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  BulletPoint(
                    text: AppLocalizations.of(
                      context,
                    )!.faceVerificationInstruction1,
                  ),
                  const SizedBox(height: 8),
                  BulletPoint(
                    text: AppLocalizations.of(
                      context,
                    )!.faceVerificationInstruction2,
                  ),
                  const SizedBox(height: 8),
                  BulletPoint(
                    text: AppLocalizations.of(
                      context,
                    )!.faceVerificationInstruction3,
                  ),
                  const SizedBox(height: 8),
                  BulletPoint(
                    text: AppLocalizations.of(
                      context,
                    )!.faceVerificationInstruction4,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Button(
            onTap: () {
              // Handle start face verification
            },
            text: AppLocalizations.of(context)!.faceVerificationStart,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
