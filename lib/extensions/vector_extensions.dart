import 'package:ml_linalg/distance.dart';
import 'package:ml_linalg/vector.dart';

extension Similarity on Vector {
  double cosineSimilarity(Vector other) {
    if (length != other.length) {
      return 0.0;
    }

    final distance = distanceTo(other, distance: Distance.cosine);
    return 1.0 - distance;
  }
}
