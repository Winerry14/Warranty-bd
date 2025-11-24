Base de datos Warranty (PostgreSQL)

Estructura general
La base de datos implementa el modelo relacional del sistema Warranty en PostgreSQL. Incluye tablas para usuarios, tiendas, boletas, 
detalles de boleta, productos, garantías, reglas de notificación, notificaciones y reclamos. Las relaciones se centran en la boleta: 
cada boleta pertenece a un usuario y opcionalmente a una tienda; tiene uno o varios detalles de productos, una única garantía asociada
y puede generar múltiples notificaciones y reclamos.

Relaciones principales
USUARIO se relaciona con BOLETA y TIENDA mediante claves foráneas.
BOLETA se relaciona con DETALLE_BOLETA, GARANTIA y NOTIFICACION.
PRODUCTO se asocia a DETALLE_BOLETA.
REGLA_NOTIFICACION define las reglas usadas para generar registros en NOTIFICACION vinculados a BOLETA y GARANTIA.
DETALLE_BOLETA se relaciona con RECLAMO para registrar reclamos sobre productos específicos.

Cómo ejecutar los scripts

En PostgreSQL, en la base de datos llamada warranty.

Abrir pgAdmin, conectarse al servidor, expandir “Databases” y seleccionar la base de datos warranty.

Clic derecho sobre warranty → “Query Tool” (Nueva consulta).

Pegar el contenido del script de creación de tablas y restricciones (Script creación base de datos) y presionar el botón Ejecutar para que se creen todos los objetos.

En la misma ventana de consulta, pegar el script de carga de datos (script carga de datos.sql) o las sentencias de inserción correspondientes y volver a ejecutar.

