def category_schema(category) -> dict:
    return {
            "id": int(category["category_id"]),
            "description": str(category["description"]),
            "imageUrl": str(category["image_url"]),
            "quantity": int(category["quantity"]),
            "title": str(category["title"]),
            }


def categorys_schema(categorys) -> list:
    categorys_list = list(categorys)
    return [category_schema(category) for category in categorys_list]