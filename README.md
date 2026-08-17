# DMBI_TAREA4
GRUPO 1 BRUNO MENDOZA, LEONARDO ROMERO , DANNA PEREZ

# Tarea 4 - Proyecto Tabular con DW_Northwind

## Antecedentes
Los modelos tabulares de Analysis Services son bases de datos en memoria que permiten análisis rápidos mediante el motor VertiPaq.  
En esta tarea se implementa un modelo tabular utilizando como base el Data Warehouse **DW_Northwind** diseñado en la Tarea 2.

## Desarrollo
Debido a limitaciones de compatibilidad con Visual Studio, el modelo tabular se implementó en **Power BI Desktop**, que utiliza el mismo motor VertiPaq y permite consumir el DW_Northwind de manera equivalente.

### Pasos realizados
1. Se ejecutaron los scripts SQL para crear y poblar la base **DW_Northwind** en SQL Server.
2. Se conectó Power BI Desktop al servidor SQL y se importaron las tablas:
   - `fact_ventas`
   - `dim_cliente`
   - `dim_producto`
   - `dim_empleado`
   - `dim_sucursal`
   - `dim_tiempo`
3. Se definieron las relaciones entre la tabla de hechos y las dimensiones (modelo estrella).
4. Se generaron reportes de ejemplo (ventas por producto, ventas por cliente).

## Resultados
- Archivo `.pbix` con el modelo tabular y reportes.
- Capturas de pantalla del diagrama de relaciones y gráficos.
- Scripts SQL del DW para reproducir la base.

## Formato de entrega
Este repositorio incluye:
- `DW_Northwind_Tabular.pbix`
- `README.md`
- Capturas de pantalla (`relaciones.png`, `ventas_producto.png`)
- Scripts SQL (`DW_Northwind_structure.sql`, `DW_Northwind_inserts.sql`)
