import 'package:flutter/material.dart';

class SearchEngineWidget extends StatelessWidget {
  const SearchEngineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buscador(context),
          ],
        ),
      ),
    );
  }

  Widget _buscador(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.1,
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          fillColor: const Color(0XFFF6F6F6),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 24,
          ),
          contentPadding: const EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          hintText: "ditto",
          hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
          filled: true,
        ),
        onTap: () => Navigator.pushNamed(context,
          '/searchPage',
        ),
      ),
    );
  }
}
