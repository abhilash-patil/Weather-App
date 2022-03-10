import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
        style: TextStyle(fontFamily: 'Axiforma'),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: ListTile(
          title: Text('Temperature Unit',
          style: TextStyle(fontFamily: 'Axiforma'),),
          subtitle: Text('Celsius/Fahrenheit (Default: Celsius)',
          style: TextStyle(fontFamily: 'Axiforma'),),
          trailing: Switch(
            value: context.watch<TempSettingsBloc>().state.tempUnit ==
                TempUnit.celsius,
            onChanged: (_) {
              context.read<TempSettingsBloc>().add(ToggleTempUnitEvent());
            },
          ),
        ),
      ),
    );
  }
}
