def city_schema(city) -> dict:
    return {
            "city_id": int(city["city_id"]),
            "name": city["name"],
            }


def citys_schema(citys) -> list:
    citys_list = list(citys)
    return [city_schema(city) for city in citys_list]