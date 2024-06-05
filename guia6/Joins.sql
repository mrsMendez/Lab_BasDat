-- GUIA6 
-- Realizar 2 consultas multitabla usando JOIN, en base al tema elegido
--  Mostrar una lista de los productos que se tienen a la venta, con los detalles del 
-- tipo de producto, presentación y proveedor.
-- o Mostrar una lista de las ventas realizadas, con los detalles del cliente que compró, 
-- el vendedor, y el monto de la venta incluyendo impuestos fiscales como el IVA y
-- crédito fiscal (si está registrando este último).
use supermarket;

SELECT 
    p.producto, 
    c.categoria,
    m.marca,
    u.unidadMedida,
    d.distribuidor
FROM producto p
    INNER JOIN categoria c ON p.idCategoria = c.idCategoria
    INNER JOIN marca m ON p.idMarca = m.idMarca
    INNER JOIN unidadMedida u ON p.idUnidadMedida = u.idUnidadMedida
    INNER JOIN distribuidor d ON p.idDistribuidor = d.idDistribuidor;

-- 2
SELECT
  v.fechaVenta AS Fecha_Venta,
  CONCAT(c.nombreCliente, ' ', c.apellidoCliente) AS Cliente,
  CONCAT(e.nombreEmpleado, ' ', e.apellidoEmpleado) AS Empleado,
  dv.cantidadProductosVenta AS Cantidad,
  p.precioVenta AS Precio_Unitario,
  (dv.cantidadProductosVenta * p.precioVenta) AS SubTotal,
  fv.ivaFacturaVenta AS IVA,
  fv.creditoFiscalFacturaVenta AS Credito_Fiscal,
  (dv.cantidadProductosVenta * p.precioVenta) + fv.ivaFacturaVenta AS Total
FROM venta v
    INNER JOIN detalleVenta dv ON v.idVenta = dv.idVenta
    INNER JOIN producto p ON dv.idProducto = p.idProducto
    INNER JOIN cliente c ON v.idCliente = c.idCliente
    INNER JOIN empleado e ON v.idEmpleado = e.idEmpleado
    INNER JOIN facturaVenta fv ON dv.idDetalleVenta = fv.idDetalleVenta;
