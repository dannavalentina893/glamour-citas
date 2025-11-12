USE glamour_citas;

-- Tabla de usuarios
CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    telefono BIGINT NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    rol ENUM('administrador', 'cliente', 'empleado') NOT NULL
);

-- Tabla de empleados
CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

-- Tabla de clientes
CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

-- Tabla de servicios
CREATE TABLE servicios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(60),
    precio DECIMAL(10,2) NOT NULL,
    tiempo_minutos INT NOT NULL
);

-- Tabla de citas
CREATE TABLE citas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_servicio INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    observaciones VARCHAR(400),
    estado ENUM('pendiente', 'cancelado', 'aplazada', 'finalizada') NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id)
);

-- Categoría de productos
CREATE TABLE categoria_producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    descripcion VARCHAR(60)
);

-- Productos
CREATE TABLE producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    precio_unitario DECIMAL(6,2) NOT NULL,
    descripcion_producto VARCHAR(60),
    FOREIGN KEY (id_categoria) REFERENCES categoria_producto(id)
);

CREATE TABLE inventario(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_producto int not null,
    stock int not null,
    FOREIGN key(id_producto)REFERENCES producto(id)  
)

-- Compras
CREATE TABLE compra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha_compra DATE NOT NULL,
    hora_compra TIME NOT NULL,
    total_compras DECIMAL(9,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

-- Detalle de compra
CREATE TABLE detalle_compra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_compra INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad_producto INT NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES compra(id),
    FOREIGN KEY (id_producto) REFERENCES producto(id)
);
