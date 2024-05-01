import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arc_bloc/features/presentation/base/base_states.dart';

import '../../di/di_container.dart'; // Import your service locator

class BaseView<TBloc extends Bloc<dynamic, BaseState>> extends StatelessWidget {
  final Widget Function(BuildContext, InitialState) onInitial;
  final Widget Function(BuildContext, LoadingState) onLoading;
  final Widget Function(BuildContext, ErrorState) onError;
  final Widget Function(BuildContext, DataState) onData;

  const BaseView({
    super.key,
    required this.onInitial,
    required this.onLoading,
    required this.onError,
    required this.onData,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = locator<TBloc>();

    return BlocBuilder<TBloc, BaseState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is InitialState) {
          return onInitial(context, state);
        } else if (state is LoadingState) {
          return onLoading(context, state);
        } else if (state is ErrorState) {
          return onError(context, state);
        } else if (state is DataState) {
          return onData(context, state);
        }
        return Container();
      },
    );
  }
}
