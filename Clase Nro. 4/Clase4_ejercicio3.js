
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
  Codigo: { type: Sequelize.INTEGER },
  Nombre: { type: Sequelize.STRING },
  Cantidad: { type: Sequelize.INTEGER }
}, {
  sequelize,
  modelName: 'libros'
});


/* INSERCION: insertar varios libros y actualizacion de libro existentes */
sequelize.sync()
  .then(() => Libro.create({ 
    Codigo: '2',
    Nombre: 'TheTwoTowers',
    Cantidad: '70'
    })
  )
  .then(() => Libro.create({
    Codigo: '17',
    Nombre: 'Programacion en JAVA',
    Cantidad: '130'
    })
  )
  .then(() => Libro.create({
    Codigo: '10',
    Nombre: '5InspiracionesEnLaLuna',
    Cantidad: '27'
    })
  )
  .then(() => Libro.create({
    Codigo: '2',
    Nombre: 'Martin Fierro',
    Cantidad: '5'
    })
  )
  /* ACTUALIZACION: actualizaciones el libro codigo 5 y en por nombre */
  .then(() => Libro.update (
    { Cantidad : '1' }, 
    { where: { Codigo: '5' } }
    )
  )
  .then(() => Libro.update (
    { Nombre: 'TheLordOfTheRings'}, 
    { where: { Nombre: 'ElSeñorDeLosAnillos' } }
    )
  )
  .then(() => { console.log("Listo") } 
);



  


