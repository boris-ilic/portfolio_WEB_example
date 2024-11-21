import 'package:boris_ilic_portfolio/features/home/model/testimonial_model.dart';
import 'package:boris_ilic_portfolio/global_components/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class TestimonialRepository {
  TestimonialRepository();
  final projectCollection =
      FirebaseFirestore.instance.collection('testimonial');

  Future<List<TestimonialModel>> getTestimonialListData() async {
    final querySnapshot = await projectCollection
        .doc(AppConstants.owner)
        .collection('testimonialList')
        .get();

    return querySnapshot.docs
        .map((doc) => TestimonialModel.fromJson(doc.data()))
        .toList();
  }
}
