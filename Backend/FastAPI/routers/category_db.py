from fastapi import APIRouter, HTTPException, status
from sqlalchemy import func
from sqlalchemy.orm import Session
from db.mod import Category
from db.database import get_database_session

router = APIRouter(prefix="/category",
                   tags=["category"],
                   responses={status.HTTP_404_NOT_FOUND: {"message": "No encontrado"}})
# GET

@router.get("/")
def get_categorys():
    session = get_database_session()
    try:
        categories = session.query(Category).all()
        category_list = [category.to_dict() for category in categories]
        return category_list
    finally:
        session.close()

################################################################

def category_list():
    session = get_database_session()
    try:
        categories = session.query(Category).all()
        category_list = [category.to_dict() for category in categories]
        return category_list
    finally:
        session.close()


def search_category(session: Session, field: str, key):
    try:
        if field == "category_id":
            query = session.query(Category).filter(Category.category_id == key).first()
        else:
            return None

        if query:
            return query.to_dict()
        else:
            return None
    except Exception as e:
        print(f"Error al buscar la categoría: {e}")
        return None
    
def search_random_categorys(session: Session):
    try:
        query = session.query(Category).order_by(func.rand()).limit(8).all()
        random_categorys = [category.to_dict() for category in query]
        return random_categorys
    except Exception as e:
        print(f"Error al buscar las categorías aleatorias: {e}")
        return []
# POST 

# @router.post("/", response_model=category, status_code=status.HTTP_201_CREATED)
# async def create_category(category: category):
#     query = "SELECT * FROM category WHERE id = %s"
#     values = (category.category_id,)
#     client.execute(query, values)
#     result = client.fetchone()

#     if result is not None:
#         raise HTTPException(
#             status_code=status.HTTP_404_NOT_FOUND, detail="El categoryo ya existe"
#         )

#     query = "INSERT INTO users (first_name, last_name, username, email, role, password) VALUES (%s, %s, %s, %s, %s, %s)"
#     values = (user.first_name, user.last_name, user.username, user.email, user.role, user.password)
#     client.execute(query, values)
#     db.commit()

#     new_category_id = client.lastrowid
#     new_user = search_category("category_id", new_category_id)

#     return new_user

# PUT /users

# @router.put("/", response_model=User)
# async def update_user(user: User):
#     query = "UPDATE users SET first_name = %s, last_name = %s, username = %s, email = %s, role = %s, password = %s WHERE category_id = %s"
#     values = (user.first_name, user.last_name, user.username, user.email, user.role, user.password, user.category_id)
#     client.execute(query, values)
#     db.commit()

#     return search_category("category_id", user.category_id)


# @router.delete("/{id}", status_code=status.HTTP_204_NO_CONTENT)
# async def delete_user(id: int):
#     query = "DELETE FROM category WHERE category_id = %s"
#     values = (id,)
#     client.execute(query, values)
#     db.commit()

#     if client.rowcount == 0:
#         return {"error": "No se ha eliminado el usuario"}
    

