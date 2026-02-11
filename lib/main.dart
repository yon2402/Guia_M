// Importa el paquete de Material Design para construir la interfaz de usuario.
import 'package:flutter/material.dart';

// La función principal que inicia la aplicación.
void main() => runApp(MaterialApp(home: PeopleCounter())); // Ejecuta la aplicación envolviendo el widget principal en un MaterialApp.

// Define la clase PeopleCounter, que es un widget con estado.
class PeopleCounter extends StatefulWidget {
  // El constructor para el widget PeopleCounter.
  const PeopleCounter({super.key}); // Usa una clave (key) para identificar el widget en el árbol de widgets.

  // Sobrescribe el método createState para crear el estado mutable para este widget.
  @override
  // Crea y devuelve una instancia de _PeopleCounterState.
  State<PeopleCounter> createState() => _PeopleCounterState();
}

// Define la clase _PeopleCounterState, que contiene el estado para el widget PeopleCounter.
class _PeopleCounterState extends State<PeopleCounter> {
  // Declara una lista de strings para almacenar los nombres de las personas.
  final List<String> _people = [];
  // Declara un controlador para el campo de texto.
  final TextEditingController _inputController = TextEditingController();

  // Sobrescribe el método build para construir la interfaz de usuario del widget.
  @override
  // El método build se llama cada vez que el widget necesita ser renderizado.
  Widget build(BuildContext context) {
    // Devuelve un widget Scaffold, que proporciona una estructura visual básica para la app.
    return Scaffold(
      // Define la barra de aplicación (AppBar).
      appBar: AppBar(
        // Muestra el título y el número de personas registradas.
        title: Text("Contador de Personas: ${_people.length}"),
      ),
      // Define el cuerpo principal de la pantalla.
      body: Column(
        // Usa un widget Column para organizar sus hijos verticalmente.
        children: [
          // Añade un padding (espaciado) alrededor del campo de texto.
          Padding(
            // Define el valor del padding en todos los lados.
            padding: const EdgeInsets.all(16.0),
            // Crea un campo de texto para que el usuario ingrese datos.
            child: TextField(
              // Asigna el controlador al campo de texto.
              controller: _inputController,
              // Define la decoración del campo de texto, como la etiqueta.
              decoration: const InputDecoration(labelText: "Nombre de la Persona"),
            ),
          ),
          // Crea un botón elevado.
          ElevatedButton(
            // Define la acción que se ejecuta cuando se presiona el botón.
            onPressed: () {
              // Llama a setState para notificar a Flutter que el estado ha cambiado.
              setState(() {
                // Añade el texto del campo de entrada a la lista de personas si no está vacío.
                if (_inputController.text.isNotEmpty) {
                  _people.add(_inputController.text);
                  // Limpia el campo de texto después de registrar.
                  _inputController.clear();
                }
              });
            },
            // Define el widget hijo del botón, que en este caso es un texto.
            child: const Text("Registrar"),
          ),
          // Usa un widget Expanded para que la lista ocupe todo el espacio restante.
          Expanded(
            // Crea un constructor de vistas de lista (ListView.builder).
            child: ListView.builder(
              // Especifica el número de elementos en la lista.
              itemCount: _people.length,
              // Define cómo construir cada elemento de la lista.
              itemBuilder: (context, index) {
                // Muestra cada nombre en un widget ListTile.
                return ListTile(
                  // Muestra el nombre de la persona.
                  title: Text(_people[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
