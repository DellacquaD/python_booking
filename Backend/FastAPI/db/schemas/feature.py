def feature_schema(feature) -> dict:
    return {
            "feature_id": int(feature["feature_id"]),
            "name": feature["name"],
            }


def features_schema(features) -> list:
    features_list = list(features)
    return [feature_schema(feature) for feature in features_list]