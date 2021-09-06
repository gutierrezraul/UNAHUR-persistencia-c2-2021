
const Sequelize = require('sequelize');

const sequelize = new Sequelize('libreria', 'root', '', {
  host: 'localhost',
  dialect: 'mariadb' /* one of 'mysql' | 'mariadb' | 'postgres' | 'mssql' */
});

sequelize
  .authenticate()
  .then(() => {
    console.log('Conexion establecida...');
  })
  .catch(err => {
    console.error('No se pudo establecer conexion:', err);
  });


/* Instancia creacion: aca se inicializa la instancia sobre la tabla en la cual se van a crear y borrar los objetos*/
class Libro extends Sequelize.Model {}

Libro.init({
  Codigo: { type: Sequelize.INTEGER },
  Nombre: { type: Sequelize.STRING },
  Cantidad: { type: Sequelize.INTEGER }
}, {
  sequelize,
  modelName: 'libros'
});


/* INSERCION: insertar libros (dos objetos) y borrar un libro ya existente en la tabla */
sequelize.sync()
  .then(() => Libro.create({ 
    Codigo: '5',
    Nombre: 'Harry Potter1',
    Cantidad: '55'
    })
  )
  .then(() => Libro.create({
    Codigo: '5',
    Nombre: 'Sapo Pepe',
    Cantidad: '18'
    })
  )
  /* ACTUALIZAR: actualizar el libro con codigo 2 */
  .then(() => Libro.destroy ( 
    { where: { Nombre: 'Martin Fierro' } }
    )
  )
  .then(() => { console.log("Listo") } 
);



  


