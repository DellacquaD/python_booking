def policy_schema(policy) -> dict:
    return {
            "policy_id": int(policy["policy_id"]),
            "cancellation": policy["cancellation"],
            "rules": policy["rules"],
            "security": policy["security"],
            }


def policys_schema(policys) -> list:
    policys_list = list(policys)
    return [policy_schema(policy) for policy in policys_list]