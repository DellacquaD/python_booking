from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from routers import users_db, cities_db, category_db, jwt_auth_users
from routers.products import products_db
from routers.reserve import reserve_db

app = FastAPI()

# Configurar los orígenes permitidos para las solicitudes CORS
origins = [
    "http://localhost:5173",
    # Agrega aquí los demás orígenes permitidos
]

# Habilitar CORS en la aplicación
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "DELETE"],
    allow_headers=["*", "Content-Type"],
)

# Rutas
# app.include_router(users_db.router)
app.include_router(products_db.router)
app.include_router(cities_db.router)
app.include_router(category_db.router)
app.include_router(reserve_db.router)
app.include_router(jwt_auth_users.router)

@app.get("/")
async def root():
    return "Hola FastAPI!"


# Inicia el server: uvicorn main:app --reload
# Detener el server: CTRL+C

# Documentación con Swagger: http://127.0.0.1:8000/docs
# Documentación con Redocly: http://127.0.0.1:8000/redoc
