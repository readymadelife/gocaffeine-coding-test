import 'package:flutter/material.dart';
import 'package:gocaffeine/views/detail_view.dart';

class MovieItemWrapper extends StatelessWidget {
  const MovieItemWrapper({
    super.key,
    required this.title,
    required this.thumbImage,
    required this.releaseDate,
    required this.imdbID,
  });
  final String title;
  final String thumbImage;
  final String releaseDate;
  final String imdbID;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MovieDetailView(imdbID: imdbID);
        }))
      },
      child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                // image
                child: Image.network(
                  thumbImage,
                  width: 100,
                  height: 148,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                        width: 100,
                        height: 148,
                        child: Center(child: Text('이미지 로드에 실패했습니다.')));
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    Text(title,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                          fontSize: 14,
                        )),
                    // 개봉날짜
                    Text(
                      releaseDate,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    // 국가
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
