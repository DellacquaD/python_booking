import json

def product_schema(product, include_policy=False, include_reserve=False) -> dict:
    result = {
        "id": int(product[0]),
        "title": product[1],
        "address": json.loads(product[2]) if product[2] is not None else [],
        "description": product[3],
        "stars": product[4],
        "scoring": product[5],
        "review": product[6],
        "category": product[7],
        "features": json.loads(product[8]) if product[8] is not None else [],
        "images": json.loads(product[9]) if product[9] is not None else [],
    }
    if include_policy:
        result["policy"] = json.loads(product[10]) if product[10] is not None else []
    if include_reserve:
        result["reserve"] = json.loads(product[11]) if product[11] is not None else []
    return result

def products_schema(products, include_policy=False, include_reserve=False) -> list:
    return [product_schema(product, include_policy=include_policy, include_reserve=include_reserve) for product in products]
