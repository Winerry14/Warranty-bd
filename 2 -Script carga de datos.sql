-- =========================================================
-- SCRIPT DE CARGA DE DATOS - SISTEMA WARRANTY (PostgreSQL)
-- Debe ejecutarse después del script de creación de tablas.
-- Este es solo una prueba para poblar tablas y ver funcionalidad
-- =========================================================

-- (Opcional) Limpiar tablas si ya tenían datos
-- TRUNCATE TABLE public.reclamo,
--                  public.notificacion,
--                  public.regla_notificacion,
--                  public.garantia,
--                  public.detalle_boleta,
--                  public.producto,
--                  public.boleta,
--                  public.tienda,
--                  public.usuario
-- RESTART IDENTITY CASCADE;

-- 1. USUARIOS
INSERT INTO public.usuario (id_usuario, nombre, email, password, rol) VALUES
(1, 'Administrador Warranty', 'admin@warranty.cl', 'admin123', 'ADMIN'),
(2, 'Usuario Demo',          'usuario@warranty.cl', 'usuario123', 'USUARIO');

-- 2. TIENDAS
INSERT INTO public.tienda (id_tienda, id_usuario, nombre_tienda, direccion, email, telefono, rut_tienda) VALUES
(1, 1, 'Tienda Lider Centro',  'Av. Principal 123, Concepción', 'contacto@lidercentro.cl',  '+56 41 2222222', '11.111.111-1'),
(2, 1, 'Tech Store Online',    'Sin dirección física',          'soporte@techstore.cl',     '+56 9 77777777', '22.222.222-2');

-- 3. PRODUCTOS
INSERT INTO public.producto (id_producto, nombre_producto, marca, modelo, categoria, sku, garantia_meses) VALUES
(1, 'Televisor 55" 4K',     'Samsung', 'TU8500',  'Electrónica', 'TV55-SAM-TU8500', 12),
(2, 'Notebook 15.6"',       'Lenovo',  'IdeaPad', 'Computación', 'NB15-LEN-IDEA',   12),
(3, 'Lavadora 9 kg',        'LG',      'TurboWash','Línea Blanca','LAVA9-LG-TW',    24),
(4, 'Audífonos Bluetooth',  'Sony',    'WH-CH510','Audio',       'AUD-SNY-CH510',   6);

-- 4. BOLETAS
INSERT INTO public.boleta (id_boleta, numero_boleta, fecha_compra, total, url_imagen, nombre_vendedor, id_usuario, id_tienda) VALUES
(1, 'BOL-0001', DATE '2025-10-01', 89990, 'https://storage/warranty/boletas/bol_0001.jpg', 'Carlos Pérez', 2, 1),
(2, 'BOL-0002', DATE '2025-10-15', 459990,'https://storage/warranty/boletas/bol_0002.jpg', 'María López',  2, 2);

-- 5. DETALLE_BOLETA
INSERT INTO public.detalle_boleta (id_detalle, id_boleta, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 4, 1, 39990),   -- Audífonos Bluetooth en boleta 1
(2, 1, 1, 1, 50000),   -- Televisor 55" en boleta 1
(3, 2, 2, 1, 259990),  -- Notebook en boleta 2
(4, 2, 3, 1, 200000);  -- Lavadora en boleta 2

-- 6. GARANTÍA (una por boleta)
INSERT INTO public.garantia (id_garantia, fecha_inicio, fecha_termino, estado, id_boleta) VALUES
(1, DATE '2025-10-01', DATE '2026-03-30', 'vigente', 1),
(2, DATE '2025-10-15', DATE '2026-04-13', 'vigente', 2);

-- 7. REGLAS DE NOTIFICACIÓN
INSERT INTO public.regla_notificacion (id_regla, nombre_regla, dias_previstos, canal, plantilla, activo, id_usuario) VALUES
(1, 'Aviso 60 días antes', 60, 'correo', 'Tu garantía está próxima a vencer en 60 días.', true, 2),
(2, 'Aviso 30 días antes', 30, 'correo', 'Tu garantía está próxima a vencer en 30 días.', true, 2),
(3, 'Aviso 7 días antes',   7, 'correo', 'Quedan 7 días para el término de tu garantía.', true, 2),
(4, 'Aviso 1 día antes',    1, 'correo', 'Mañana vence la garantía de tu producto.',      true, 2);

-- 8. NOTIFICACIONES (ejemplos generados a partir de las reglas)
INSERT INTO public.notificacion (id_notificacion, fecha_envio, tipo_notificacion, estado, id_boleta, id_garantia, id_regla) VALUES
(1, TIMESTAMP '2026-02-29 10:00:00', 'correo', 'enviada', 1, 1, 1),
(2, TIMESTAMP '2026-03-30 09:00:00', 'correo', 'pendiente',1, 1, 4),
(3, TIMESTAMP '2026-03-14 11:00:00', 'correo', 'enviada', 2, 2, 2),
(4, TIMESTAMP '2026-04-12 09:30:00', 'correo', 'pendiente',2, 2, 4);

-- 9. RECLAMOS (sobre productos específicos de una boleta)
INSERT INTO public.reclamo (id_reclamo, fecha_reclamo, resultado, id_detalle) VALUES
(1, DATE '2025-11-10', 'Cambio de producto', 1),
(2, DATE '2025-12-05', 'Reparación aceptada', 3);

-- FIN DEL SCRIPT DE CARGA DE DATOS
