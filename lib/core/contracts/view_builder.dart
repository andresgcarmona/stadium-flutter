import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stadium/core/contracts/base_model.dart';
import 'package:stadium/core/services/locator.dart';

class ViewBuilder<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onCreated;

  ViewBuilder({this.builder, this.onCreated});

  @override
  _ViewBuilderState<T> createState() => _ViewBuilderState<T>();
}

class _ViewBuilderState<T extends BaseModel> extends State<ViewBuilder<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onCreated != null) {
      widget.onCreated(model);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
