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
> Quizás utilizar el AppThemeCubit para cambiar el theme de la app, para ello, se tendría que hacer un ThemeData customizado y, cambiar la UI de home_page.dart.
