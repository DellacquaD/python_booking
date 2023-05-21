def image_schema(image) -> dict:
    return {
            "image_id": int(image["image_id"]),
            "image_url": image["image_url"],
            "title": image["title"],
            "product_id": image["product_id"],
            }


def images_schema(images) -> list:
    images_list = list(images)
    return [image_schema(image) for image in images_list]