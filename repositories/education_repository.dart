import 'package:boris_ilic_portfolio/features/home/model/experience_model.dart';
import 'package:boris_ilic_portfolio/global_components/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class EducationRepository {
  EducationRepository();

  final educationExperienceCollection =
      FirebaseFirestore.instance.collection('educationExperience');

  Future<List<ExperienceModel>> getEducationExperienceListData() async {
    final querySnapshot = await educationExperienceCollection
        .doc(AppConstants.owner)
        .collection('educationExperienceList')
        .orderBy('timestamp', descending: true)
        .get();

    return querySnapshot.docs
        .map((doc) => ExperienceModel.fromJson(doc.data()))
        .toList();
  }

  Future<void> addEducationExperience(ExperienceModel experience) async {
    final data = {
      ...experience.toJson(),
      'timestamp': FieldValue.serverTimestamp(),
    };

    await educationExperienceCollection
        .doc(AppConstants.owner)
        .collection('educationExperienceList')
        .add(data);
  }

  // Function to initialize education data
  Future<void> initializeEducationData() async {
    final educationList = [
      const ExperienceModel(
        title: "Specialist course on Faculty of information science (FON)",
        subTitle: "JAVA technologies",
        duration: "Jan 2018 – Jul 2018",
        description:
            "I attended a java programmer course for two semesters in parallel with my faculty, which was a UNDP scholarship for young talents. As a result of the course, I became proficient in Java, JSF, MySql, Hibernate. The certificates of this course helped me find my first job.",
        responsibilities: [],
        technologies: [],
      ),
      const ExperienceModel(
        title: "School for Electrical and Computer Engineering Belgrade",
        subTitle: "Computer Technologies",
        duration: "2020 - 2023",
        description: "GPA: 8.55/10.00",
        responsibilities: [],
        technologies: [],
      ),
      const ExperienceModel(
        title: "School for Electrical and Computer Engineering Belgrade",
        subTitle: "Computer Technologies",
        duration: "2017 - 2020",
        description: "GPA: 9.31/10.00",
        responsibilities: [],
        technologies: [],
      ),
      const ExperienceModel(
        title:
            "High School for Electrical Engineering \"Nikola Tesla\" Belgrade",
        subTitle: "Computer and electronics technician",
        duration: "2012 - 2016",
        description: "",
        responsibilities: [],
        technologies: [],
      ),
    ];

    // Create a batch write operation
    final batch = FirebaseFirestore.instance.batch();

    // Reference to your education list collection
    final collectionRef = educationExperienceCollection
        .doc(AppConstants.owner)
        .collection('educationExperienceList');

    // Add each education entry to the batch
    for (var education in educationList) {
      final docRef = collectionRef.doc(); // Generate a new document ID
      batch.set(docRef, {
        ...education.toJson(),
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    // Commit the batch
    await batch.commit();
  }

  //  Function to clear all education data before reinitializing
  Future<void> clearEducationData() async {
    final querySnapshot = await educationExperienceCollection
        .doc(AppConstants.owner)
        .collection('educationExperienceList')
        .get();

    final batch = FirebaseFirestore.instance.batch();

    for (var doc in querySnapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }

  //  Function to reinitialize all education data
  Future<void> reinitializeEducationData() async {
    await clearEducationData();
    await initializeEducationData();
  }
}
