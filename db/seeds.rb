Customer.create!([
  {email: "maria@gmail.com", password: "$2a$10$fREqUqGshtMzVhR9Pxakg.OlBAchljueODD0J1kSwbuKjwAv1pTFa", nombre: "Cecilia Castillo", rut: "10.531.758-1", telefono: 3345678, direccion: "Curicó 98", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-10-03 04:14:01", last_sign_in_at: "2016-10-03 02:51:24", current_sign_in_ip: "::1", last_sign_in_ip: "::1", razon_social: "Comestible Castillo", giro_comercial_id: 2},
  {email: "carlos@gmail.com", password: "$2a$10$V8G.VwlS/oOTwXQ1NJxisOY6xqQXB2ivfks3hP9QowjozVswAT47m", nombre: "Carlos Soto", rut: "14.230.950-5", telefono: 34565455, direccion: "san carlos 123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-10-03 02:52:20", last_sign_in_at: "2016-10-03 02:52:20", current_sign_in_ip: "::1", last_sign_in_ip: "::1", razon_social: "Forrajes Soto", giro_comercial_id: 1},
  {email: "silvana@gmail.com", password: "$2a$10$rkGiIsswO0BFiZJzBj2P4uL8UJGueIxjrrDMjoo2t20lF.nVLcbRW", nombre: "Silvana Cubillos", rut: "19.062.599-0", telefono: 6546543, direccion: "Curicó 98", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-10-03 02:53:20", last_sign_in_at: "2016-10-03 02:53:20", current_sign_in_ip: "::1", last_sign_in_ip: "::1", razon_social: "Ganadería Cubillos", giro_comercial_id: 3},
  {email: "milenko@gmail.com", password: "$2a$10$2Fe9lHhc.P8mXB2sQ3cXYugXu0umNOVIwqWFPGD1foTC9O2lvijq2", nombre: "Milenko Garca", rut: "17.318.826-9", telefono: 9875876, direccion: "koiko7524", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-10-03 02:55:29", last_sign_in_at: "2016-10-03 02:55:29", current_sign_in_ip: "::1", last_sign_in_ip: "::1", razon_social: "Comestible García", giro_comercial_id: 1}
])
Usuario.create!([
  {permission_level: 1, nombre: "Diego Garca", email: "garcia.castillo23@gmail.com", password: "$2a$10$Yc/tbO3af/6EfmMneOyDNO5WdIe5NZN25x8wUSjRpZYnbl17oHBr.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2016-10-03 05:11:27", last_sign_in_at: "2016-10-03 04:55:41", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {permission_level: 0, nombre: "Paola Lueiza", email: "paola@gmail.com", password: "$2a$10$MQQm1lywBL2aVnZZLN0wvObUadVzTVfQNft1mA48z4qUdToS2V/HW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-10-03 04:22:43", last_sign_in_at: "2016-10-03 02:18:10", current_sign_in_ip: "::1", last_sign_in_ip: "::1"}
])
Employee.create!([
  {nombre: "Camila", rut: "19.062.599-0", email: "camila@gmail.com", fecha_ingreso: "2016-10-03", sueldo: 100000},
  {nombre: "Francisco Luna", rut: "17.255.894-1", email: "a@a.cl", fecha_ingreso: "2016-07-31", sueldo: 200000},
  {nombre: "Natalia Faundez", rut: "18.095.629-8", email: "naty@gmail.com", fecha_ingreso: "2015-11-06", sueldo: 250000}
])
Fecha.create!([
  {fecha: "2016-09-28"},
  {fecha: "2016-09-29"},
  {fecha: "2016-10-02"}
])
Category.create!([
  {nombre: "Construccion"},
  {nombre: "Fertilizantes"},
  {nombre: "Pesticidas"}
])
Product.create!([
  {nombre: "Acido Nitrico", unidades: 10, medida: "123", category_id: 2, precio: 10000, codigo: 0},
  {nombre: "Cemento", unidades: 100, medida: "123", category_id: 1, precio: 10000, codigo: 1},
  {nombre: "Nitrato de sodio", unidades: 100, medida: "Kg", category_id: 3, precio: 10000, codigo: 2}
])

GiroComercial.create!([
  {nombre: "SERVICIO DE CORTE Y ENFARDADO DE FORRAJE"},
  {nombre: "OTROS SERVICIOS AGRÍCOLAS N.C.P."},
  {nombre: "SERVICIOS GANADEROS, EXCEPTO ACTIVIDADES VETERINARIAS"}
])
Assistance.create!([
  {fecha_id: 1, employee_id: 1, asiste: true},
  {fecha_id: 1, employee_id: 2, asiste: true},
  {fecha_id: 1, employee_id: 3, asiste: true},
  {fecha_id: 2, employee_id: 1, asiste: true},
  {fecha_id: 2, employee_id: 3, asiste: true},
  {fecha_id: 3, employee_id: 3, asiste: true}
])
Bill.create!([
  {numero: 1, fecha: "2016-10-03", razon_social: "MIM", giro_comercial: "SERVICIO DE CORTE Y ENFARDADO DE FORRAJE", customer_id: 1, monto_neto: 10000, iva: 190, total: 10190, anulado: true},
  {numero: 2, fecha: "2016-10-03", razon_social: "MIM", giro_comercial: "SERVICIO DE CORTE Y ENFARDADO DE FORRAJE", customer_id: 2, monto_neto: 100000, iva: 19000, total: 119000, anulado: false},
  {numero: 3, fecha: "2016-10-03", razon_social: "MIM", giro_comercial: "OTROS SERVICIOS AGRÍCOLAS N.C.P.", customer_id: 1, monto_neto: 10000, iva: 190, total: 10190, anulado: true}
])
BillProduct.create!([
  {bill_id: 1, product_id: 3, cantidad: 3},
  {bill_id: 3, product_id: 3, cantidad: 3}
])
Matter.create!([
  {nombre: "Piedras", medida: "kg", saldo: nil},
  {nombre: "Agua", medida: "Litro", saldo: nil},
  {nombre: "Sodio", medida: "kg", saldo: nil}
])

Order.create!([
  {numero: 1, fecha: "2016-09-28", detalle: nil, medida: nil, customer_id: 1, fecha_final: "2016-10-03", cantidad: nil, estado: 0, anulado: false},
  {numero: 2, fecha: "2016-09-28", detalle: nil, medida: nil, customer_id: 2, fecha_final: "2016-10-03", cantidad: nil, estado: 2, anulado: false},
  {numero: 3, fecha: "2016-09-28", detalle: nil, medida: nil, customer_id: 4, fecha_final: "2016-11-03", cantidad: nil, estado: 0, anulado: false},
  {numero: 4, fecha: "2016-09-28", detalle: nil, medida: nil, customer_id: 2, fecha_final: "2016-11-03", cantidad: nil, estado: 1, anulado: false}
])

CustomerMatter.create!([
  {matter_id: 1, cantidad: 4, order_id: 1},
  {matter_id: 2, cantidad: 6, order_id: 1},
  {matter_id: 3, cantidad: 7, order_id: 1},
  {matter_id: 1, cantidad: 3, order_id: 2},
  {matter_id: 2, cantidad: 3, order_id: 2},
  {matter_id: 3, cantidad: 3, order_id: 2},
  {matter_id: 1, cantidad: 3, order_id: 3},
  {matter_id: 3, cantidad: 0, order_id: 4}
])
Lincense.create!([
  {employee_id: 2, fechaInicio: "2015-11-05", duracion: 11, detalle: "Dolor de estómago"},
  {employee_id: 1, fechaInicio: "2016-09-03", duracion: 3, detalle: "Esguince en el pie derecho"},
  {employee_id: 2, fechaInicio: "2016-07-30", duracion: 20, detalle: "Estrés post-traumático"}
])

MatterProduct.create!([
  {matter_id: 1, product_id: 1, cantidad: 2},
  {matter_id: 2, product_id: 1, cantidad: 2},
  {matter_id: 3, product_id: 1, cantidad: 2},
  {matter_id: 1, product_id: 2, cantidad: 2},
  {matter_id: 2, product_id: 2, cantidad: 3},
  {matter_id: 3, product_id: 2, cantidad: 4},
  {matter_id: 1, product_id: 3, cantidad: 100}
])
OrderProduct.create!([
  {order_id: 1, product_id: 1, cantidad: 3},
  {order_id: 1, product_id: 2, cantidad: 3},
  {order_id: 1, product_id: 3, cantidad: 3},
  {order_id: 2, product_id: 1, cantidad: 3},
  {order_id: 2, product_id: 2, cantidad: 3},
  {order_id: 2, product_id: 3, cantidad: 3},
  {order_id: 3, product_id: 1, cantidad: 1},
  {order_id: 3, product_id: 2, cantidad: 1},
  {order_id: 4, product_id: 3, cantidad: 3}
])
