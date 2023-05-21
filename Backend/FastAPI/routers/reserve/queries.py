GET_RESERVE_BY_PRODUCT = f""" 
SELECT
    reserve.start_time,
    reserve.check_in,
    reserve.check_out
FROM reserve
LEFT JOIN product AS p ON reserve.product_id = p.product_id
WHERE p.product_id = %s
"""

GET_RESERVE_BY_USER = f"""
SELECT
    reserve.start_time,
    reserve.check_in,
    reserve.check_out,
    p.title AS productName,
    reserve.reserve_id AS idReserve
FROM reserve
LEFT JOIN users AS u ON reserve.user_id = u.user_id
LEFT JOIN product AS p ON reserve.product_id = p.product_id
WHERE u.user_id = %s
"""