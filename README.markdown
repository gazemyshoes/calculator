# Calculadora Flutter

## Descripción
Una aplicación de calculadora móvil desarrollada en **Flutter** con **Dart**, diseñada para imitar la apariencia y funcionalidad de una calculadora de teléfono. Incluye 19 botones organizados en 5 filas, con operaciones básicas y un diseño moderno.

## Características
- **Interfaz**: Pantalla superior que muestra "0" por defecto, con resultados actualizados.
- **Botones**:
  - Primera fila: AC, Borrar (⌫), %, ÷
  - Segunda fila: 7, 8, 9, ×
  - Tercera fila: 4, 5, 6, −
  - Cuarta fila: 1, 2, 3, +
  - Quinta fila: 0, ., =
- **Funcionalidades**: Suma, resta, multiplicación, división, porcentaje, borrar último dígito y reiniciar (AC).
- **Diseño**:
  - Fondo oscuro.
  - Botones numéricos en gris, operaciones en azul, y el botón "=" resaltado en azul oscuro.
  - Botones de la quinta fila con el mismo tamaño que los demás, con espacio vacío a la izquierda.
- Manejo de errores (por ejemplo, división por cero).

## Requisitos
- Flutter SDK (versión 3.0 o superior)
- Dart
- Un editor como Visual Studio Code o Android Studio
- Emulador o dispositivo móvil para pruebas

## Instalación
1. Clona el repositorio:
   ```bash
   git clone https://github.com/<tu-usuario>/calculadora-flutter.git
   ```
2. Navega al directorio del proyecto:
   ```bash
   cd calculadora-flutter
   ```
3. Instala las dependencias:
   ```bash
   flutter pub get
   ```
4. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## Uso
- Presiona los botones numéricos para ingresar números.
- Usa los botones de operaciones (+, −, ×, ÷, %) para realizar cálculos.
- Presiona "=" para ver el resultado.
- Usa "AC" para reiniciar y "⌫" para borrar el último dígito.

## Contribuciones
¡Las contribuciones son bienvenidas! Por favor, abre un *issue* o envía un *pull request* con mejoras o correcciones.

## Licencia
MIT License