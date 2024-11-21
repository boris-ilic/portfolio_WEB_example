import 'package:boris_ilic_portfolio/features/about/model/about_detail_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import '../../../global_components/constants/constants.dart';

@singleton
class AboutSectionRepository {
  AboutSectionRepository();
  final aboutCollection = FirebaseFirestore.instance.collection('about');

  Future<AboutDetailModel> getAboutData() async {
    final querySnapshot = await aboutCollection.doc(AppConstants.owner).get();

    if (!querySnapshot.exists) {
      return const AboutDetailModel();
    }

    final data = querySnapshot.data() as Map<String, dynamic>;
    return AboutDetailModel.fromJson(data);
  }

  Future<void> setInitialData() async {
    final services = [
      const ServiceModel(
        title: "Mobile Development",
        description:
            "Creating high-performance mobile applications for iOS and Android that meet the demands of today's fast-paced digital landscape. My approach to mobile development is user-centric, ensuring that each app is not only visually appealing but also intuitive and efficient. I offer end-to-end development services, from initial concept and design to testing and launch.",
      ),
      const ServiceModel(
        title: "Web Development",
        description:
            "Crafting modern, responsive, and engaging web applications that drive results. I specialize in creating websites that are not only visually impressive but also optimized for speed, accessibility, and user experience. From e-commerce platforms to portfolio websites, my web development services encompass everything from front-end design to back-end programming.",
      ),
      const ServiceModel(
        title: "Full IT Support",
        description:
            "Offering complete IT support to keep your systems running smoothly and efficiently. I provide a broad range of IT services, including system setup, troubleshooting, maintenance, and tech support. Whether you're a small business needing occasional help or a larger organization seeking ongoing support, I'm equipped to handle it all.",
      ),
      const ServiceModel(
        title: "Interview Support",
        description:
            "Helping you find and secure top talent by providing professional interview and recruitment support. I assist businesses in designing effective interview processes, conducting candidate screenings, and evaluating applicants to ensure they meet both the skill requirements and cultural fit for your team.",
      ),
      const ServiceModel(
        title: "Consultancy Support",
        description:
            "Providing strategic consulting to help you make informed decisions that align with your business goals. With years of experience in technology and business strategy, I offer advisory services that cover a wide range of needs, from digital transformation and project planning to technology adoption and risk management.",
      ),
    ];

    final aboutData = AboutDetailModel(
      aboutService:
          "I offer a comprehensive suite of services to support businesses in leveraging technology to achieve their goals. With a focus on quality, innovation, and user-centered design, I provide solutions tailored to meet the specific needs of my clients, whether it's developing a mobile app, creating a robust website, offering IT support, or providing strategic consulting. My goal is to help businesses thrive in a digital-first world by offering the expertise and support they need to succeed.",
      services: services,
    );

    // Use the custom toFirestoreJson method instead of toJson
    await aboutCollection
        .doc(AppConstants.owner)
        .set(aboutData.toFirestoreJson());
  }
}
