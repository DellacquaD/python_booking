import json

def reserve_schema(reserve, include_product_title=False, include_reserve_id=False) -> dict:
    result = {
        "start_time": reserve[0],
        "check_in": reserve[1],
        "check_out": reserve[2],
    }
    if include_product_title:
        result["title"] = json.loads(reserve[3]) if reserve[3] is not None else []
    if include_reserve_id:
        result["productName"] = json.loads(reserve[4]) if reserve[4] is not None else []
    return result

def reserves_schema(reserves, include_product_title=False, include_reserve_id=False) -> list:
    return [reserve_schema(reserve, include_product_title=include_product_title, include_reserve_id=include_reserve_id) for reserve in reserves]
