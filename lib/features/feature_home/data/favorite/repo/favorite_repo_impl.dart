import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/BookModel.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/function/get_locale_data.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  ApiService apiService = ApiService(Dio());
  @override
  Future<void> addItemInFavorite({required BookModel bookModel}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? email = sharedPreferences.getString("email");
    QuerySnapshot query = await users.where('email', isEqualTo: email).get();
    if (query.docs.isNotEmpty) {
      DocumentReference userDoc = query.docs.first.reference;
      await userDoc.update({
        'favorite': FieldValue.arrayUnion([bookModel.id]),
      });
    }
  }

  @override
  Future<List<String>> getBookIdFromFirebase() async {
    String? email = await getEmailFromLocaleData();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot query = await users.where('email', isEqualTo: email).get();
    List<dynamic> listOfBookIds = [];
    if (query.docs.isNotEmpty) {
      DocumentSnapshot userDoc = query.docs.first;
      listOfBookIds = userDoc.get("favorite");
    }
    return listOfBookIds.cast<String>();
  }

  @override
  Future<Either<List<BookModel>, ServerFailure>> getListBookById(
      List<String> listIds) async {
    try {
      List<Future<BookModel>> futures = listIds.map((id) async {
        var data = await apiService.get(endPoint: "volumes/$id");
        return BookModel.fromJson(data);
      }).toList();
      return left(await Future.wait(futures));
    } catch (e) {
      if (e is DioException) {
        return right(ServerFailure.fromDio(e));
      } else {
        return right(ServerFailure(errorMessage: "Not found"));
      }
    }
  }

  @override
  Future<void> deleteBook({required String bookId}) async {
    String? email = await getEmailFromLocaleData();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot =
        await users.where("email", isEqualTo: email).get();
    List<dynamic> listBooksIds = [];
    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDoc = querySnapshot.docs.first;
      var ref = userDoc.reference;
      ref.update({
        "favorite": FieldValue.arrayRemove([bookId])
      });
    }
  }
}
