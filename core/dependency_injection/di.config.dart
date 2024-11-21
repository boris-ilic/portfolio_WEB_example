// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:boris_ilic_portfolio/features/about/cubit/about_detail_cubit.dart'
    as _i114;
import 'package:boris_ilic_portfolio/features/home/cubit/experience_cubit.dart'
    as _i611;
import 'package:boris_ilic_portfolio/features/home/cubit/testimonial_cubit.dart'
    as _i654;
import 'package:boris_ilic_portfolio/features/localization/bloc/localization_bloc.dart'
    as _i985;
import 'package:boris_ilic_portfolio/features/project/cubit/project_cubit.dart'
    as _i950;
import 'package:boris_ilic_portfolio/repositories/about_section_repository.dart'
    as _i823;
import 'package:boris_ilic_portfolio/repositories/education_repository.dart'
    as _i106;
import 'package:boris_ilic_portfolio/repositories/experience_repository.dart'
    as _i874;
import 'package:boris_ilic_portfolio/repositories/project_repository.dart'
    as _i270;
import 'package:boris_ilic_portfolio/repositories/shared_preference_repository.dart'
    as _i73;
import 'package:boris_ilic_portfolio/repositories/testimonial_repository.dart'
    as _i423;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i874.WorkExperienceRepository>(
        () => _i874.WorkExperienceRepository());
    gh.singleton<_i423.TestimonialRepository>(
        () => _i423.TestimonialRepository());
    gh.singleton<_i270.ProjectRepository>(() => _i270.ProjectRepository());
    gh.singleton<_i823.AboutSectionRepository>(
        () => _i823.AboutSectionRepository());
    gh.singleton<_i73.SharedPreferencesRepository>(
        () => _i73.SharedPreferencesRepository());
    gh.singleton<_i106.EducationRepository>(() => _i106.EducationRepository());
    gh.factory<_i950.ProjectCubit>(
        () => _i950.ProjectCubit(gh<_i270.ProjectRepository>()));
    gh.factory<_i654.TestimonialCubit>(
        () => _i654.TestimonialCubit(gh<_i423.TestimonialRepository>()));
    gh.factory<_i985.LocalizationBloc>(
        () => _i985.LocalizationBloc(gh<_i73.SharedPreferencesRepository>()));
    gh.factory<_i114.AboutDetailCubit>(
        () => _i114.AboutDetailCubit(gh<_i823.AboutSectionRepository>()));
    gh.factory<_i611.ExperienceCubit>(() => _i611.ExperienceCubit(
          gh<_i874.WorkExperienceRepository>(),
          gh<_i106.EducationRepository>(),
        ));
    return this;
  }
}
