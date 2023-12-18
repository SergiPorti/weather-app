## APP del tiempo
<p>Pequeña app del Tiempo que utiliza la Api de OpenWeatherMap, esta api está integrada directamente en un package de Flutter llamado "Weather"</p>
<p>Esta app la he hecho para estudiar y entender tanto la arquitectura BLoC como el provider mismo</p>

<p>Imagen de la App</p>

![IMAGE](https://i.imgur.com/c7FgNV2.png)

>[!IMPORTANT]
> Para poder utilizar correctamente esta APP, tienes que importar el siguiente package --> https://pub.dev/packages/weather, además, registrate en --> https://openweathermap.org/ y poner la API_KEY que te proporcionan en environment.dart

>[!TIP]
>BLoC se refiere a Business Logic Component

>[!NOTE]
> En esta app se podrían mejorar varias cosas como por ejemplo, refactorizar home_page.dart en componentes más pequeños para que no sea una clase tan extensa.
> También, utilizar Lozalizacion para que el DateTime se le pase el Locale() del dispositivo.
> Utilizar y hacer uso de todos los estados que he hecho para controlar diferentes situaciones en los estados de los BLoC así mismo hacer una pantalla en específico según el estado.
> Usar ThemeCubit que ya está creado, se debería hacer un ThemeData custom según el estado del booleano y si uno quiere, cambiar la UI del widget de home_page.dart.
