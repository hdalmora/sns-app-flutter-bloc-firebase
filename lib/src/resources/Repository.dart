import 'package:cloud_firestore/cloud_firestore.dart';
import 'FirestoreResources.dart';
import 'AuthenticationResources.dart';
import 'dart:async';

class Repository {
  final _firestoreResources = FirestoreProvider();
  final _authResources = AuthenticationResources();

  Stream<FirebaseUser> getUserOnAuthState() => _authResources.onAuthStateChange;

  Future<FirebaseUser> getUserAuth() => _authResources.getUserAuth();

  Future<String> getUserEmail() => _authResources.getUserEmail();

  Future<String> getUserUID() => _authResources.getUserUID();

  Future<bool> isUserAnonymous() => _authResources.isUserAnonymous();

  Future<bool> isUserEmailVerified() => _authResources.isUserEmailVerified();

  Future<void> createUserProfile(String userID, String email, String name, String about, DateTime arrivalOfJapan, String nationality, Map<String, String> languages, String industry) =>
      _firestoreResources.createUserProfile(userID, email, name, about, arrivalOfJapan, nationality, languages, industry);

  Stream<DocumentSnapshot> getUserData(String documentID) => _firestoreResources.getUserData(documentID);

  Future<void> signInAnonymously() => _authResources.signInAnonymously();

  Future<int> signInWithEmailAndPassword(String email, String password) => _authResources.signInWithEmailAndPassword(email, password);

  Future<int> signUpWithEmailAndPassword(String email, String password) => _authResources.signUpWithEmailAndPassword(email, password);

  Future<int> sendEmailConfirmation() => _authResources.sendEmailConfirmation();

  Future<void> signInWithGoogle() => _authResources.signWithGoogle();

  Future<void> signOut() => _authResources.signOut;

  Future<void> postBlog(String userUID, String userEmail, String title, String content) => _firestoreResources.postBlog(userUID, userEmail, title, content);

  Stream<QuerySnapshot> blogsList(int limit) => _firestoreResources.blogsList(limit);

  Future<void> likeBlogPost(String blogUID, String userUID) async => _firestoreResources.likeBlogPost(blogUID, userUID);

  Future<void> unlikeBlogPost(String blogUID, String userUID) async => _firestoreResources.unlikeBlogPost(blogUID, userUID);

  Future<bool> hasLikedBlog(String blogUID, String userUID) async => _firestoreResources.hasLikedBlog(blogUID, userUID);

  Future<QuerySnapshot> fetchBlogs(int limit) => _firestoreResources.fetchBlogs(limit);

  Future<QuerySnapshot> fetchBlogsFromLastDocument(int limit, DocumentSnapshot lastDoc) async => _firestoreResources.fetchBlogsFromLastDocument(limit, lastDoc);

  }
