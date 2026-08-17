-- Crear la base de datos del Data Warehouse
CREATE DATABASE DW_Northwind;
GO

USE DW_Northwind;
GO

-- ============================================
-- 1. Tablas de Dimensiones
-- ============================================

-- Dimensión Cliente
CREATE TABLE dim_cliente (
    cliente_id INT PRIMARY KEY,
    nombre NVARCHAR(100),
    pais NVARCHAR(50),
    segmento NVARCHAR(50)
);

-- Dimensión Producto
CREATE TABLE dim_producto (
    producto_id INT PRIMARY KEY,
    nombre NVARCHAR(100),
    categoria NVARCHAR(50),
    precio_base DECIMAL(10,2)
);

-- Dimensión Empleado (Vendedor)
CREATE TABLE dim_empleado (
    empleado_id INT PRIMARY KEY,
    nombre NVARCHAR(100),
    cargo NVARCHAR(50),
    ciudad NVARCHAR(50)
);

-- Dimensión Tiempo
CREATE TABLE dim_tiempo (
    tiempo_id INT PRIMARY KEY,
    fecha DATE,
    anio INT,
    trimestre INT,
    mes INT,
    dia INT
);

-- Dimensión Sucursal (usando la info de Shippers o regiones)
CREATE TABLE dim_sucursal (
    sucursal_id INT PRIMARY KEY,
    nombre_sucursal NVARCHAR(100),
    ciudad NVARCHAR(50)
);

-- ============================================
-- 2. Tabla de Hechos
-- ============================================

CREATE TABLE fact_ventas (
    venta_id INT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    empleado_id INT,
    sucursal_id INT,
    tiempo_id INT,
    cantidad INT,
    monto_total DECIMAL(12,2),

    FOREIGN KEY (cliente_id) REFERENCES dim_cliente(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES dim_producto(producto_id),
    FOREIGN KEY (empleado_id) REFERENCES dim_empleado(empleado_id),
    FOREIGN KEY (sucursal_id) REFERENCES dim_sucursal(sucursal_id),
    FOREIGN KEY (tiempo_id) REFERENCES dim_tiempo(tiempo_id)
);
GO
