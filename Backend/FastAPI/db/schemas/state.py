def state_schema(state) -> dict:
    return {
            "state_id": int(state["state_id"]),
            "name": state["name"],
            "country_id": int(state["country_id"]),
            }


def states_schema(states) -> list:
    states_list = list(states)
    return [state_schema(state) for state in states_list]