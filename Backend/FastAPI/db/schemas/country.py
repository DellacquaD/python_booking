def country_schema(country) -> dict:
    return {
            "country_id": int(country["country_id"]),
            "name": country["name"],
            }


def countrys_schema(countrys) -> list:
    countrys_list = list(countrys)
    return [country_schema(country) for country in countrys_list]