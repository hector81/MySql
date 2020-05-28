select P.precio 
	  from precio_habitacion p,temporada t,habitaciones  h 
	  where h.numhabitacion=101 
	  and  p.tipo_habitacion=H.tipo_habitacion
	  and p.temporada=t.temporada 
	  AND  '2009-03-16'  between 
      t.fechainicio and t.fechafinal;