from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from jose import jwt, JWTError
from passlib.context import CryptContext
from datetime import datetime, timedelta
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from db.mod import User
from db.schem import UserDBSchema
from db.database import get_database_session, close_database_session


ALGORITHM = "HS256"
ACCESS_TOKEN_DURATION = 10
SECRET = "201d573bd7d1344d3a3bfce1550b69102fd11be3db6d379508b6cccc58ea230b"

router = APIRouter(prefix="/auth",
                   tags=["auth"],
                   responses={status.HTTP_404_NOT_FOUND: {"message": "Not Found"}})

oauth2 = OAuth2PasswordBearer(tokenUrl="login")

crypt = CryptContext(schemes=["bcrypt"])

class UserDB(BaseModel):
    username: str
    first_name: str
    last_name: str
    email: str
    password: str

@router.on_event("shutdown")
async def on_shutdown():
    database_session = get_database_session()
    close_database_session(database_session)

def search_user(username: str, session: Session):
    try:
        user = session.query(User).filter(User.username == username).first()
        if user:
            return UserDBSchema.from_orm(user)
        else:
            return None
    except SQLAlchemyError as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Error connecting to the database",
        )
    
async def auth_user(token: str = Depends(oauth2)):
    exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Invalid authentication credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )

    try:
        username = jwt.decode(token, SECRET, algorithms=[ALGORITHM]).get("sub")
        if username is None:
            raise exception
    except JWTError:
        raise exception

    session = get_database_session()
    try:
        return search_user(username, session)
    finally:
        session.close()


async def current_user(user: UserDB = Depends(auth_user)):
    if not user:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="Inactive user"
        )

    return user


@router.post("/login")
async def login(form: OAuth2PasswordRequestForm = Depends()):
    session = get_database_session()
    try:
        user = session.query(User).filter(User.username == form.username).first()
        if not user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Invalid username"
            )

        if not crypt.verify(form.password, user.password):
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST, detail="Invalid password"
            )

        token = {
            "sub": user.username,
            "exp": datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_DURATION),
        }

        return {
            "token": jwt.encode(token, SECRET, algorithm=ALGORITHM),
            "token_type": "bearer",
            "role": user.role,
            "firstname": user.first_name,
            "lastname": user.last_name,
        }
    except SQLAlchemyError as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Error connecting to the database",
        )
    finally:
        session.close()

@router.post("/register")
async def register_user(user: UserDBSchema):
    # Verificar si el usuario ya existe en la base de datos
    session = get_database_session()
    try:
        existing_user = session.query(User).filter(User.username == user.username).first()
        if existing_user:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Username already exists"
            )

        # Crear una nueva instancia de User a partir de los datos recibidos
        new_user = User(
            username=user.username,
            first_name=user.first_name,
            last_name=user.last_name,
            email=user.email,
            password=crypt.hash(user.password)
        )

        # Agregar el nuevo usuario a la sesión y guardar en la base de datos
        session.add(new_user)
        session.commit()

        # Retornar una respuesta exitosa
        return {"message": "User registered successfully"}

    except Exception as e:
        # Manejar cualquier error que pueda ocurrir durante la inserción en la base de datos
        session.rollback()
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Error registering user"
        )

    finally:
        # Cerrar la sesión de la base de datos
        session.close()
