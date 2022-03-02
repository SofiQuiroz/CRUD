from flask import Flask, render_template, redirect, url_for, flash
from flask_bootstrap import \
    Bootstrap  # se instala ->pip install flask-bootstrap --> es la versión BS3
from flaskext.mysql import MySQL  # se instala ->pip install flask-mysql
from flask_modals.modal import render_template_modal

from admin.form import Formulario #pip install flask-modals

app = Flask(__name__)
bootstrap = Bootstrap(app)  # creando una instancia bootstrap
mysql = MySQL()  # creando una instancia MYSQL para la base de datos

# Configuro una base de datos
app.config['MYSQL_DATABASE_USER'] = 'root'  # USUARIO DE LA BASE DE DATOS
app.config['MYSQL_DATABASE_PASSWORD'] = '1234' # CONTRASEÑA DE LA BASE DE DATOS
app.config['MYSQL_DATABASE_DB'] = 'bbdd'  # NOMBRE DE LA BASE DE DATOS
app.config['MYSQL_DATABASE_Host'] = 'localhost'
app.config['SECRET_KEY']='secret'
mysql.init_app(app)  # vinculando mysql con la db de mi app


def conexion():
    cone = mysql.connect()  # es el que levanta la conexión con la base de datos
    cursor = cone.cursor()  # es el que va y viene a buscar los datos
    return cone, cursor


@app.route('/')
def bienvenido():
    return render_template('index.html')


@app.route('/ver')
def lista():
    cone, cursor = conexion()
    cursor.execute("SELECT personas.id, nombre, apellido, ciudad, provincia FROM personas INNER JOIN locaciones ON id_locacion = locaciones.id ORDER BY apellido")
    data = cursor.fetchall() #se trae la info de la base de datos y se guarda en una variable
    cone.close()  #se cierra conexión con la base de datos
    return render_template('mostrar.html', lista=data)


@app.route('/agregar', methods=['GET','POST'])
def agregar():
    formulario=Formulario() #crea una instancia formulario
    get_locaciones(formulario) #me trae el formulario
    
    if formulario.validate_on_submit(): #una vez validado
        #rescato la informacion de los formularios
        nom=formulario.nombre.data 
        ape=formulario.apellido.data
        id_loc=formulario.locacion.data
        cone,cursor=conexion()
        sql="INSERT INTO personas (nombre, apellido, id_locacion) VALUES (%s, %s, %s)"
        val=(nom,ape,id_loc)
        cursor.execute(sql,val)
        cone.commit()
        cone.close()
        flash('Registro realizado con éxito!')
        return redirect(url_for('lista')) #me redirige a la pagina de la lista
    return render_template('agregar.html', formulario=formulario)


@app.route('/editar')
def editar():
    return "editar lista"


@app.route('/borrar/<int:id>')
def borrar(id):
    cone,cursor=conexion()
    sql=("DELETE FROM personas WHERE id=%s")
    cursor.execute(sql, id)
    #cursor.execute("DELETE FROM personas WHERE id=%s")
    cone.commit() #Cuando hago cambios en la BD se commitea
    cone.close() #cierra la conexión
    flash ('Registro eliminado!')
    return redirect(url_for('lista'))


''' @app.route('/acerca')
def acerca():
    return "acerca de..." '''


@app.errorhandler(404)
def not_found(error):
    return render_template('404.html', error=error)


@app.errorhandler(500)
def internal_server_error(error):
    return render_template('500.html', error=error)

#Creación de formulario
def get_locaciones(formulario):
    locaciones=[]
    cone,cursor=conexion()
    cursor.execute("SELECT DISTINCT * FROM locaciones")
    locs=cursor.fetchall()
    for i in locs:
        locaciones.append(i)
    cone.close()
    
    opciones=[(i[0], i[1]+", "+i[2]) for i in locaciones] 
    #i[0] es el id que vincula las dos tablas
    #i[1]+", "+i[2] el dato que me dibuja por pantalla
    opciones.sort(key=lambda x: x[1]) #ordena alfabeticamente
    #mete las locaciones dentro de las opciones del select
    formulario.locacion.choices=opciones 

if __name__ == '__main__':
    app.run(debug=True)
