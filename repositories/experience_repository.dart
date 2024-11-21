import 'package:boris_ilic_portfolio/features/home/model/work_experience_model.dart';
import 'package:boris_ilic_portfolio/global_components/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class WorkExperienceRepository {
  WorkExperienceRepository();

  final workExperienceCollection =
      FirebaseFirestore.instance.collection('workExperience');

  Future<List<WorkExperienceModel>> getWorkExperienceListData() async {
    final querySnapshot = await workExperienceCollection
        .doc(AppConstants.owner)
        .collection('workExperienceList')
        .orderBy('timestamp', descending: true)
        .get();

    return querySnapshot.docs
        .map((doc) => WorkExperienceModel.fromJson(doc.data()))
        .toList();
  }

  Future<void> addWorkExperience(WorkExperienceModel experience) async {
    final data = {
      ...experience.toJson(),
      'timestamp': FieldValue.serverTimestamp(),
    };

    await workExperienceCollection
        .doc(AppConstants.owner)
        .collection('workExperienceList')
        .add(data);
  }

  // Function to initialize work experience data with all experiences
  Future<void> initializeWorkExperienceData() async {
    final workList = [
      const WorkExperienceModel(
        companyName: "MAKA",
        role: "Senior Flutter Developer",
        duration: "Apr 2024-Present",
        projectType: "Mobile",
        teamSize: 10,
        projectArea: "E-commerce app",
        description:
            "Led the development of the Maka e-commerce app, focusing on iOS and Android platforms. Coordinated with backend teams, participated in app design, and managed the publishing process. Achieved over 150,000 users on Android and 100,000 on iOS devices.",
        technologies: ["Flutter", "Dart", "Firebase"],
        visitAppLink:
            "https://play.google.com/store/apps/details?id=com.maka.live&hl=en",
      ),
      const WorkExperienceModel(
        companyName: "ANDERSEN LAB",
        role: "Senior Flutter Developer",
        duration: "May 2022 - Apr 2024",
        projectType: "Web",
        teamSize: 3,
        projectArea:
            "Invoice management tool\nCarSnoop\nMorph Project\nSherazi\nMarTrust",
        description:
            "Adapted the Invoice Ninja platform to meet the needs of a solar panel and equipment sales client. Enhanced the platform to handle all payment-related calculations efficiently.",
        technologies: [
          "Flutter",
          "Dart",
          "Jira",
          "Postman",
          "Firebase",
          "Codemagic",
          "CI/CD",
          "Git",
          "REST API"
        ],
        visitAppLink: "https://spt.solar/levasoft/",
      ),
      const WorkExperienceModel(
        companyName: "Endava",
        role: "Senior Flutter Developer",
        duration: "Oct 2020 – May 2022",
        projectType: "Web & Mobile",
        teamSize: 40,
        projectArea: "Video conferencing platform",
        description:
            "Developed a highly secure video conferencing application for American companies, featuring a comprehensive admin panel. Adapted the app for both Android and iOS platforms, following initial web development.",
        technologies: [
          "Flutter",
          "Dart",
          "Jira",
          "Teams",
          "Swagger",
          "Git",
          "REST API"
        ],
        visitAppLink: "",
      ),
      const WorkExperienceModel(
        companyName: "Exe4U",
        role: "Medior Flutter Developer",
        duration: "May 2020 – Oct 2020",
        projectType: "Mobile",
        teamSize: 3,
        projectArea: "Healthcare app with real-time patient monitoring",
        description:
            "Independently developed an all-inclusive healthcare app for an Italian facility, featuring patient health monitoring, secure document review, and virtual consultations with medical professionals.",
        technologies: [
          "Flutter",
          "Dart",
          "ClickUp",
          "Swagger",
          "Git",
          "REST API"
        ],
        visitAppLink:
            "https://play.google.com/store/apps/details?id=it.unisalute.unincontra.mobile",
      ),
      const WorkExperienceModel(
        companyName: "LESTE",
        role: "Junior Java/Flutter Developer",
        duration: "July 2018 – May 2020",
        projectType: "Web & Mobile",
        teamSize: 3,
        projectArea: "E-learning app",
        description:
            "Developed an e-learning platform using Java, JSF, JS, and MySQL. Later transitioned the platform to mobile using Dart and Flutter for Android and iOS, integrating Firebase and REST API for MySQL connectivity.",
        technologies: [
          "Java",
          "MySQL",
          "Hibernate",
          "JSF",
          "JS",
          "Flutter",
          "Dart",
          "Firebase",
          "Git",
          "REST API"
        ],
        visitAppLink: "",
      ),
    ];

    // Create a batch write operation
    final batch = FirebaseFirestore.instance.batch();

    // Reference to your work experience list collection
    final collectionRef = workExperienceCollection
        .doc(AppConstants.owner)
        .collection('workExperienceList');

    // Add each work experience entry to the batch
    for (var work in workList.reversed) {
      final docRef = collectionRef.doc();
      batch.set(docRef, {
        ...work.toJson(),
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    // Commit the batch
    await batch.commit();
  }

  Future<void> clearWorkExperienceData() async {
    final querySnapshot = await workExperienceCollection
        .doc(AppConstants.owner)
        .collection('workExperienceList')
        .get();

    final batch = FirebaseFirestore.instance.batch();

    for (var doc in querySnapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }

  Future<void> reinitializeWorkExperienceData() async {
    await clearWorkExperienceData();
    await initializeWorkExperienceData();
  }
}
