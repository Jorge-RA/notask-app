import 'package:flutter/material.dart';
import 'package:to_do_list/search/delegate.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: const [
              SizedBox(width: 20),
              Icon(Icons.manage_search_rounded),
              SizedBox(width: 20),
              Text('Buscar tarea...')
            ],
          ),
        ),
        onTap: () {
          showSearch(context: context, delegate: ToDoListDelegate());
        },
      ),
    );
  }
}
