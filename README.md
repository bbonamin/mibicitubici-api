# mibicitubici-api
http://www.mibicitubici.gob.ar/

API no oficial para Mibicitubici en Rosario, Argentina

*Aviso: cada request en este momento hace una llamada al sitio oficial, y hace scraping de los contenidos, sería recomendable esperar a que se agregue una capa de caché antes de depender de este servicio en producción*


## Endpoints

#### Lista de estaciones
` GET /docking_stations`

Devuelve una lista con el estado de cada una de las estaciones de anclaje. Por ejemplo:
```
{
  "data":[
    {
      "address":"Pellegrini",
      "longitude":"-32.953886",
      "latitude":"-60.656628",
      "a":"",
      "b":"A",
      "c":"EO",
      "d":"11",
      "available_bikes":"11",
      "anchor":"9",
      "usage_status":"Est_Normal 1",
      "icon":"./img/ico_operacao.png",
      "id":"1",
      "station_name":"Museo Castagnino",
      "station_status":"en operación"
    },
    {...}
  ]
}
```

## Contribuir
- Requiere Ruby 2.2 o superior y Bundler

1. Clonar el repositorio
2. Ejecutar `bundle install`
3. Ejecutar `rackup config.ru`. El servidor estará disponible en `http://localhost:9292`

## Licencia
MIT

