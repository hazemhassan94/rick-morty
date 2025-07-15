import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/character_cubit.dart';
import '../cubit/character_state.dart';
import '../repository/character_repository.dart';
import 'character_details_page.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CharacterCubit(CharacterRepository())..fetchCharacters(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Rick & Morty Characters')),
        body: BlocBuilder<CharacterCubit, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CharacterLoaded) {
              return ListView.builder(
                itemCount: state.characters.length,
                itemBuilder: (context, index) {
                  final character = state.characters[index];
                  return ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(character.image)),
                    title: Text(character.name),
                    subtitle: Text(character.status),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CharacterDetailsPage(character: character),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is CharacterError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
