import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_assignment_axis/features/home/domain/entities/popular.dart';
import 'package:movie_assignment_axis/features/home/presentation/cubit/home_cubit.dart';

import 'features/home/presentation/cubit/home_cubit_test.mocks.dart';

class PopularListWidget extends StatelessWidget {
  const PopularListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetPopularsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetPopularsLoaded) {
          return ListView.builder(
            itemCount: state.populars.length,
            itemBuilder: (context, index) {
              final person = state.populars[index];
              return ListTile(
                title: Text(person.name ?? ''),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

void main() {
  late HomeCubit cubit;
  late MockGetPopularsUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetPopularsUseCase();
    cubit = HomeCubit(mockUseCase);
  });

  final testPopulars = [
    const Popular(id: 1, name: 'Jason', profilePath: '/jason.jpg', films: []),
  ];

  testWidgets('shows loading and then loaded list',
      (WidgetTester tester) async {
    when(mockUseCase.call(page: 1)).thenAnswer((_) async {
      await Future.delayed(const Duration(milliseconds: 100));
      return right(testPopulars);
    });

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<HomeCubit>(
          create: (_) {
            cubit.getPopulars(page: 1);
            return cubit;
          },
          child: const Scaffold(body: PopularListWidget()),
        ),
      ),
    );

    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Jason'), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);
  });
}
