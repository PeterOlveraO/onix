# Ónix

App móvil de finanzas familiares, open source, para Android e iOS. Cada familia usa su propia instancia de Supabase; la app funciona sin conexión (SQLite local) y sincroniza al volver la red.

Estado: prueba de compilación. Todavía no hay funciones de la app.

## Estructura

- `app/`: la app Flutter (Android e iOS).
- `.github/workflows/build.yml`: análisis, tests y compilación del APK y del `.ipa`.

## Obtener la app

Cada push a `main` corre el workflow **Build**. Al terminar, en la página de la ejecución (pestaña Actions) aparecen dos archivos:

- `onix-android`: contiene `app-release.apk`. Se instala directamente en Android (permitir instalar apps de origen desconocido).
- `onix-ios`: contiene `onix.ipa` sin firmar.

### Instalar en iPhone sin Mac (Windows)

1. Instalar iTunes e iCloud descargados de la web de Apple (no las versiones de Microsoft Store) y [Sideloadly](https://sideloadly.io).
2. Conectar el iPhone por USB, abrir Sideloadly, arrastrar `onix.ipa` e iniciar sesión con tu Apple ID.
3. En el iPhone: Ajustes > Privacidad y seguridad > Modo de desarrollador > activar y reiniciar.
4. Ajustes > General > VPN y gestión de dispositivos > confiar en tu Apple ID.
5. Con Apple ID gratuito la app caduca a los 7 días; Sideloadly puede refirmarla automáticamente.

## Desarrollo local

```bash
cd app
flutter pub get
flutter test
flutter run   # en un Android conectado o emulador
```
