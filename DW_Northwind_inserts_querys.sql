USE DW_Northwind;
GO

-- Insertar clientes
INSERT INTO dim_cliente VALUES
(1, 'Cliente A', 'Bolivia', 'Individual'),
(2, 'Cliente B', 'Chile', 'Corporativo');

-- Insertar productos
INSERT INTO dim_producto VALUES
(101, 'Producto X', 'Categoria1', 100.00),
(102, 'Producto Y', 'Categoria2', 250.00);

-- Insertar empleados
INSERT INTO dim_empleado VALUES
(201, 'Empleado Juan', 'Vendedor', 'Santa Cruz'),
(202, 'Empleado Maria', 'Vendedor', 'La Paz');

-- Insertar sucursales
INSERT INTO dim_sucursal VALUES
(301, 'Sucursal Central', 'Santa Cruz'),
(302, 'Sucursal Sur', 'La Paz');

-- Insertar tiempo
INSERT INTO dim_tiempo VALUES
(20260816, '2026-08-16', 2026, 3, 8, 16),
(20260817, '2026-08-17', 2026, 3, 8, 17);

-- Insertar hechos (ventas)
INSERT INTO fact_ventas VALUES
(1, 1, 101, 201, 301, 20260816, 2, 200.00),
(2, 2, 102, 202, 302, 20260817, 1, 250.00);

SELECT 
    p.nombre AS Producto,
    SUM(f.cantidad) AS UnidadesVendidas,
    SUM(f.monto_total) AS TotalIngresos
FROM fact_ventas f
JOIN dim_producto p ON f.producto_id = p.producto_id
GROUP BY p.nombre
ORDER BY TotalIngresos DESC;

SELECT 
    c.nombre AS Cliente,
    c.segmento AS Segmento,
    SUM(f.monto_total) AS TotalFacturado
FROM fact_ventas f
JOIN dim_cliente c ON f.cliente_id = c.cliente_id
GROUP BY c.nombre, c.segmento
ORDER BY TotalFacturado DESC;

SELECT 
    t.anio AS Año,
    t.mes AS Mes,
    SUM(f.monto_total) AS TotalVentas
FROM fact_ventas f
JOIN dim_tiempo t ON f.tiempo_id = t.tiempo_id
GROUP BY t.anio, t.mes
ORDER BY t.mes ASC;

SELECT 
    s.nombre_sucursal AS Sucursal,
    s.ciudad AS Ciudad,
    SUM(f.monto_total) AS TotalVentas
FROM fact_ventas f
JOIN dim_sucursal s ON f.sucursal_id = s.sucursal_id
GROUP BY s.nombre_sucursal, s.ciudad
ORDER BY TotalVentas DESC;

