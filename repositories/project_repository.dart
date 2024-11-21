import 'package:boris_ilic_portfolio/features/project/model/project_model.dart';
import 'package:boris_ilic_portfolio/global_components/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProjectRepository {
  ProjectRepository();
  final projectCollection = FirebaseFirestore.instance.collection('project');

  Future<List<ProjectModel>> getProjectListData() async {
    final querySnapshot = await projectCollection
        .doc(AppConstants.owner)
        .collection('projectList')
        .orderBy('timestamp', descending: true)
        .get();
    return querySnapshot.docs
        .map((doc) => ProjectModel.fromJson(doc.data()))
        .toList();
  }

  Future<void> addProject(ProjectModel project) async {
    final data = {
      ...project.toJson(),
      'timestamp': FieldValue.serverTimestamp(),
    };

    await projectCollection
        .doc(AppConstants.owner)
        .collection('projectList')
        .add(data);
  }

  // Function to initialize project data with dummy projects
  Future<void> initializeProjectData() async {
    final projectList = [
      const ProjectModel(
        title: "My Care Salute",
        description:
            "Independently developed a comprehensive Flutter application for a healthcare facility in Italy. The application serves as an all-inclusive platform for patient health monitoring, secure document review for medical histories, and facilitates virtual consultations with medical professionals.",
        categories: [
          "Health care monitoring",
        ],
        imageUrl:
            "https://play-lh.googleusercontent.com/dhqZC91yxp6ThZuSuXBmJ7_Lq2ExQ1auiD4NhkPWWnULtEXrg05L1E_nGX-yFnd4lkNj=w480-h960-rw",
        url:
            "https://play.google.com/store/apps/details?id=it.unisalute.unincontra.mobile&hl=en",
      ),
      const ProjectModel(
        title: "Clariti Private Video Conference",
        description:
            "During my tenure as a Flutter developer, I was entrusted with developing a video conferencing application for American companies – similar to Zoom and other video conferencing apps. The application was unique in that it boasted a highly secure system, complete with an admin panel that provided full control over every aspect of the app. Initially, I also worked as a web developer, after which we adapted the app to be used on both Android and IOS platforms.",
        categories: ["Video Conference", "Android & IOS development"],
        imageUrl: "",
        url: "https://www.hp.com/us-en/poly/software-and-services.html",
      ),
      const ProjectModel(
        title: "Centtrip UK - MarTrust",
        description:
            "Lead Flutter developer on a project MarTrust platform, this the platform is mainly for making payroll and business payments. My company took over the project, my task was to fix all the remaining bugs on the platform, to add some new functionalities and to create and build applications for iOS and Android using the code magic tool. The main aspect of my engagement is maintaining the platform.",
        categories: ["Code Magic", "Android & IOS development"],
        imageUrl: "",
        url: "https://www.martrust.com/",
      ),
      const ProjectModel(
        title: "Sherazi",
        description:
            "I was a Lead Flutter developer on a project based on engaging people around animals. Each user could choose three different purposes of the application, the first one was like Tinder for animals, the second one was adopting animals and the third one was finding a home for a pet. The application was for the UAE market",
        categories: [],
        imageUrl:
            "https://is1-ssl.mzstatic.com/image/thumb/Purple112/v4/31/6f/79/316f79a8-66c5-e3f8-f58c-98b44fd5d5cd/AppIcon-0-0-1x_U007emarketing-0-7-0-0-85-220.png/460x0w.webp",
        url: "https://apps.apple.com/sa/app/sherazi/id1619924822l",
      ),
      const ProjectModel(
        title: "CarSnoop",
        description:
            "The project was done for one of the car sales giants in America. The application itself deals with buying/selling cars under US law. We built web and mobile applications.",
        categories: [
          "E-commerce",
        ],
        imageUrl:
            "https://carsnoop.com/_next/image/?url=%2F_next%2Fstatic%2Fmedia%2Fdark-carsnoop-logo.dcebfc61.png&w=1920&q=75",
        url: "https://carsnoop.com/",
      ),
      const ProjectModel(
        title: "Morph",
        description:
            "I was part of a team that created an app for training, organizing my training, and also creating them. It was possible to communicate with your coaches and organize training sessions.",
        categories: ["Fitness"],
        imageUrl:
            "https://play-lh.googleusercontent.com/5iEdlWImlVqdf410Jdd3y8ildMGHiDGBdm86d-_i1uCO0HukaM3TwQnstMi7WVhxLTU=w480-h960-rw",
        url:
            "https://play.google.com/store/apps/details?id=com.morph.fit&hl=fr_CA&gl=US",
      ),
      const ProjectModel(
        title: "Levasoft",
        description:
            "My job was to adapt the Invoice Ninja platform together with my colleague on the backend to the client's needs, the client himself was engaged in the sale of solar panels and equipment. Our platform enabled them to do all the calculations related to payment on the web.",
        categories: [],
        imageUrl:
            "https://spt.solar/wp-content/uploads/2019/10/SPT_Logo-Claim-weiss75.svg",
        url: "https://spt.solar/levasoft/",
      ),
      const ProjectModel(
        title: "MAKA",
        description:
            "The Maka app is an e-commerce app based in America (Silicon Wally) and operating in Nigeria, the app itself is a combination of Aliexpress and TikTok. At MAKA, I was a leading Flutter developer, with a wider range of activities. In addition to programming applications for iOS and Android, I participated in publishing applications, in direct communication with the backend team, in analytical services and in designing the application itself with our product owner. I joined a startup that had been operating for some time, the colleagues and team were excellent",
        categories: ["E-commerce"],
        imageUrl:
            "https://play-lh.googleusercontent.com/lkaXvrkHp5fT6LywCSnJx3vRO_5mZUAxxStszrv1EcOnnw46oj8fnxGWKsHS0AXCJrye=w480-h960-rw",
        url:
            "https://play.google.com/store/apps/details?id=com.maka.live&hl=en",
      ),
    ];

    // Create a batch write operation
    final batch = FirebaseFirestore.instance.batch();

    // Reference to your project list collection
    final collectionRef =
        projectCollection.doc(AppConstants.owner).collection('projectList');

    // Add each project entry to the batch
    for (var project in projectList) {
      final docRef = collectionRef.doc(); // Generate a new document ID
      batch.set(docRef, {
        ...project.toJson(),
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    // Commit the batch
    await batch.commit();
  }

  Future<void> clearProjectData() async {
    final querySnapshot = await projectCollection
        .doc(AppConstants.owner)
        .collection('projectList')
        .get();

    final batch = FirebaseFirestore.instance.batch();

    for (var doc in querySnapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }

  Future<void> reinitializeProjectData() async {
    await clearProjectData();
    await initializeProjectData();
  }
}
