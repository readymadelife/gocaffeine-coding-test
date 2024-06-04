import 'package:flutter/material.dart';
import 'package:gocaffeine/models/movie_item_detail_model.dart';

// 영화 상세 정보 wrapper 구성
class MovieDetailWrapper extends StatelessWidget {
  const MovieDetailWrapper({
    super.key,
    required this.movie,
  });
  final MovieItemDetailModel movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            movie.poster,
            width: 300,
            height: 443,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                  width: 300,
                  height: 443,
                  child: Center(child: Text('이미지 로드에 실패했습니다.')));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(movie.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(movie.actors),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(movie.year),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text('Score ${movie.imdbRating}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(movie.plot),
          ),
        ],
      ),
    ));
  }
}
