import 'package:car_store/features/add%20car/presentaition/views/add_car_view.dart';
import 'package:car_store/features/add%20post/presentaition/views/add_post_view.dart';
import 'package:car_store/features/add%20workshop/presentaition/views/add_wordshop_view.dart';
import 'package:car_store/features/auth/login/presentaition/views/login_view.dart';
import 'package:car_store/features/auth/singup/presentaition/views/signup_view.dart';
import 'package:car_store/features/car%20details/presentaition/views/car_details_view.dart';
import 'package:car_store/features/car%20post/profile/presentaition/views/profile_view.dart';
import 'package:car_store/features/car%20post/public%20wall/presentaition/views/public_wall_view.dart';
import 'package:car_store/features/home/presentaition/views/home_view.dart';
import 'package:car_store/features/main%20services/presentaition/views/main_services_view.dart';
import 'package:car_store/features/matched%20cars/presentaition/views/matched_car_view.dart';
import 'package:car_store/features/matched%20spares/presentaition/views/matched_spare_view.dart';
import 'package:car_store/features/matched%20workshop/presentaition/views/matched_workshop_view.dart';
import 'package:car_store/features/search/car%20search/presentaition/views/car_search_view.dart';
import 'package:car_store/features/search/spare%20search/presentaition/views/spare_search_view.dart';
import 'package:car_store/features/search/workshop%20search/presentaition/views/workshop_search_view.dart';
import 'package:car_store/features/spare%20details/presentaition/views/spare_details_view.dart';
import 'package:car_store/features/splash/presentaition/views/splash_view.dart';
import 'package:car_store/features/work%20shop%20details/presentaition/views/workshop_details_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static String login = "/login";
  static String singup = "/singup";
  static String mainServices = "/mainServices";
  static String profile = "/profile";
  static String home = "/home";
  static String post = "/post";
  static String addPost = "/addPost";
  static String addCar = "/addCar";
  static String addWorkshop = "/addWorkshop";
  static String addSpare = "/addSpare";
  static String spareSearch = "/spareSearch";
  static String carSearch = "/carSearch";
  static String workshopSearch = "/workshopSearch";
  static String matchedCar = "/matchedCar";
  static String matchedSpare = "/matchedSpare";
  static String matchedWorkshop = "/matchedWorkshop";
  static String carDetails = "/carDetails";
  static String spareDetails = "/spareDetails";
  static String workshopDetails = "/workshopDetails";

  static final router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => const SplashView()),
    GoRoute(path: login, builder: (context, state) => const LoginView()),
    GoRoute(path: singup, builder: (context, state) => const SignUpView()),
    GoRoute(
        path: mainServices,
        builder: (context, state) => const MainServicesView()),
    GoRoute(path: profile, builder: (context, state) => const ProfileView()),
    GoRoute(path: home, builder: (context, state) => const HomeView()),
    GoRoute(path: post, builder: (context, state) => const PublicWallView()),
    GoRoute(path: addCar, builder: (context, state) => const AddCarView()),
    GoRoute(path: addPost, builder: (context, state) => const AddPostView()),
    GoRoute(path: addSpare, builder: (context, state) => const AddPostView()),
    GoRoute(
        path: addWorkshop,
        builder: (context, state) => const AddWordshopView()),
    GoRoute(
        path: carSearch, builder: (context, state) => const CarSearchView()),
    GoRoute(
        path: spareSearch,
        builder: (context, state) => const SpareSearchView()),
    GoRoute(
        path: workshopSearch,
        builder: (context, state) => const WorkShopSearchView()),
    GoRoute(
        path: matchedCar, builder: (context, state) => const MatchedCarView()),
    GoRoute(
        path: matchedSpare,
        builder: (context, state) => const MatchedSpareView()),
    GoRoute(
        path: matchedWorkshop,
        builder: (context, state) => const MatchedWorkShopView()),
    GoRoute(
        path: carDetails, builder: (context, state) => const CarDetailsView()),
    GoRoute(
        path: spareDetails,
        builder: (context, state) => const SpareDetailsView()),
    GoRoute(
        path: workshopDetails,
        builder: (context, state) => const WorkShopDetailsView()),
  ]);
}
