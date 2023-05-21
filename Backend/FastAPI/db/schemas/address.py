def address_schema(address) -> dict:
    return {
            "address_id": int(address["address_id"]),
            "number": str(address["number"]),
            "street": str(address["street"]),
            "city_id": int(address["city_id"]),
            }


def addresss_schema(addresss) -> list:
    addresss_list = list(addresss)
    return [address_schema(address) for address in addresss_list]