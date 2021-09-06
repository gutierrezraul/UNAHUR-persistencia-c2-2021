
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


/* Instancia creacion: aca se inicializa la instancia "creando la tabla" en la cual se van a crear los objetos*/
class Libro extends Sequelize.Model {}

Libro.init({
  Codigo: { type: Sequelize.INTEGER(11)},
  Nombre: { type: Sequelize.STRING(100) },
  Cantidad: { type: Sequelize.INTEGER(11) }
}, {
  sequelize,
  modelName: 'libros'
}); 


/* INSERCION: insertar libros (dos objetos) y actualizacion de libro (sobre los creados) */
sequelize.sync()
  .then(() => Libro.create({ 
    Codigo: '2',
    Nombre: 'LordOfTheRings',
    Cantidad: '170'
    })
  )
  .then(() => Libro.create({
    Codigo: '10',
    Nombre: '10AñosDeSoledad',
    Cantidad: '138'
    })
  )
  /* ACTUALIZAR: actualizar el libro con codigo 2 */
  .then(() => Libro.update (
    { Nombre: 'ElSeñorDeLosAnillos', Cantidad: '9' }, 
    { where: { Codigo: '2' } }
    )
  )
  .then(() => { console.log("Listo") } 
);



  


