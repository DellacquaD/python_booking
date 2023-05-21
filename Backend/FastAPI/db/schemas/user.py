def user_schema(user) -> dict:
    return {"id": int(user["user_id"]),
            "email": user["email"],
            "first_name": user["first_name"],
            "last_name": user["last_name"],
            "role": user["role"],          
            "username": user["username"],
            }


def users_schema(users) -> list:
    users_list = list(users)
    return [user_schema(user) for user in users_list]