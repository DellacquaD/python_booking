# import mysql.connector
# from fastapi import APIRouter, Depends, HTTPException, status
# from mysql.connector import connect, Connection
# from db.schemas import UserIn, UserOut
# from db.models import User

# router = APIRouter(prefix="/users", tags=["users"], responses={status.HTTP_404_NOT_FOUND: {"message": "No encontrado"}})

# @router.get("/{id}")
# async def get_user(id: int, db: connect = Depends(get_database_connection)):
#     query = "SELECT * FROM users WHERE user_id = %s"
#     values = (id,)
#     with db.cursor() as cursor:
#         cursor.execute(query, values)
#         result = cursor.fetchone()

#     if result is not None:
#         return UserOut(
#             user_id=result[0],
#             first_name=result[1],
#             last_name=result[2],
#             username=result[3],
#             email=result[4],
#             role=result[5],
#             password=result[6]
#         )
#     else:
#         raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Usuario no encontrado")

# @router.get("/")
# async def get_users(db: connect = Depends(get_database_connection)):
#     query = "SELECT * FROM users"
#     with db.cursor() as cursor:
#         cursor.execute(query)
#         result = cursor.fetchall()

#     result_list = [UserOut(
#         user_id=row[0],
#         first_name=row[1],
#         last_name=row[2],
#         username=row[3],
#         email=row[4],
#         role=row[5],
#         password=row[6]
#     ) for row in result]

#     return result_list

# @router.post("/", response_model=UserOut, status_code=status.HTTP_201_CREATED)
# async def create_user(user: UserIn, db: connect = Depends(get_database_connection)):
#     query = "SELECT * FROM users WHERE email = %s"
#     values = (user.email,)
#     with db.cursor() as cursor:
#         cursor.execute(query, values)
#         result = cursor.fetchone()

#     if result is not None:
#         raise HTTPException(
#             status_code=status.HTTP_400_BAD_REQUEST,
#             detail="El usuario ya existe"
#         )

#     query = "INSERT INTO users (first_name, last_name, username, email, role, password) VALUES (%s, %s, %s, %s, %s, %s)"
#     values = (user.first_name, user.last_name, user.username, user.email, user.role, user.password)
#     with db.cursor() as cursor:
#         cursor.execute(query, values)
#         db.commit()
#         new_user_id = cursor.lastrowid

#     return UserOut(
#         user_id=new_user_id,
#         first_name=user.first_name,
#         last_name=user.last_name,
#         username=user.username,
#         email=user.email,
#         role=user.role,
#         password=user.password
#     )

# @router.put("/", response_model=UserOut)
# async def update_user(user: User, db: connect = Depends(get_database_connection)):
#     query = "UPDATE users SET first_name = %s, last_name = %s, username = %s, email = %s, role = %s, password = %s WHERE user_id = %s"
#     values = (user.first_name, user.last_name, user.username, user.email, user.role, user.password, user.user_id)
#     with db.cursor() as cursor:
#         cursor.execute(query, values)
#         db.commit()

#     query = "SELECT * FROM users WHERE user_id = %s"
#     values = (user.user_id,)
#     with db.cursor() as cursor:
#         cursor.execute(query, values)
#         result = cursor.fetchone()

#     if result is not None:
#         return UserOut(
#             user_id=result[0],
#             first_name=result[1],
#             last_name=result[2],
#             username=result[3],
#             email=result[4],
#             role=result[5],
#             password=result[6]
#         )
#     else:
#         raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Usuario no encontrado")

# @router.delete("/{id}", status_code=status.HTTP_204_NO_CONTENT)
# async def delete_user(id: int, db: connect = Depends(get_database_connection)):
#     query = "DELETE FROM users WHERE user_id = %s"
#     values = (id,)
#     with db.cursor() as cursor:
#         cursor.execute(query, values)
#         db.commit()

#     if cursor.rowcount == 0:
#         raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Usuario no encontrado")