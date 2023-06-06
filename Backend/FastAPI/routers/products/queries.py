GET_RANDOM_PRODUCTS = """
            SELECT
            p.product_id AS id,
            p.title,
            JSON_OBJECT(
                'street', a.street,
                'number', a.number,
                'city', c.name,
                'state', s.name,
                'country', co.name
            ) AS address,
            p.description,
            p.stars,
            p.scoring,
            p.review,
            cat.title AS category,
            (
                SELECT JSON_ARRAYAGG(
                    JSON_OBJECT(
                        'id', f.feature_id,
                        'title', f.name
                    )
                )
                FROM product_feature AS pf
                INNER JOIN feature AS f ON pf.features_feature_id = f.feature_id
                WHERE pf.products_product_id = p.product_id
            ) AS features,
            JSON_ARRAYAGG(
                JSON_OBJECT(
                    'title', i.title,
                    'imageUrl', i.image_url
                )
            ) AS images
        FROM (
            SELECT *
            FROM product
            ORDER BY RAND()
            LIMIT 8
        ) AS p
        LEFT JOIN address AS a ON p.address_address_id = a.address_id
        LEFT JOIN city AS c ON a.city_id = c.city_id
        LEFT JOIN state AS s ON c.state_id = s.state_id
        LEFT JOIN country AS co ON s.country_id = co.country_id
        LEFT JOIN image AS i ON p.product_id = i.product_id
        LEFT JOIN category AS cat ON p.category_id = cat.category_id
        GROUP BY p.product_id;
        """

GET_PRODUCT_BY_ID =  f"""
       SELECT
        p.product_id AS id,
        p.title,
        JSON_OBJECT(
            'street', a.street,
            'number', a.number,
            'city', c.name,
            'state', s.name,
            'country', co.name
        ) AS address,
        p.description,
        p.stars,
        p.scoring,
        p.review,
        cat.title AS category,
        (
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id', f.feature_id,
                    'title', f.name
                )
            )
            FROM product_feature AS pf
            INNER JOIN feature AS f ON pf.features_feature_id = f.feature_id
            WHERE pf.products_product_id = p.product_id
        ) AS features,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'title', i.title,
                'imageUrl', i.image_url
            )
        ) AS images,
        JSON_OBJECT(
            'rules', pol.rules,
            'security', pol.security,
            'cancellation', pol.cancellation
        ) AS policy,
        (
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'reserve_id', r.reserve_id,
                    'check_in', r.check_in
                )
            )
            FROM reserve AS r
            WHERE r.product_id = p.product_id AND r.reserve_id IS NOT NULL
        ) AS reserves
    FROM product AS p
    LEFT JOIN address AS a ON p.address_address_id = a.address_id
    LEFT JOIN city AS c ON a.city_id = c.city_id
    LEFT JOIN state AS s ON c.state_id = s.state_id
    LEFT JOIN country AS co ON s.country_id = co.country_id
    LEFT JOIN image AS i ON p.product_id = i.product_id
    LEFT JOIN category AS cat ON p.category_id = cat.category_id
    LEFT JOIN policy AS pol ON p.policy_id = pol.policy_id
    WHERE p.product_id = %s
    GROUP BY p.product_id;
    """


GET_PRODUCTS_BY_CATEGORY = f"""
       SELECT
        p.product_id AS id,
        p.title,
        JSON_OBJECT(
            'street', a.street,
            'number', a.number,
            'city', c.name,
            'state', s.name,
            'country', co.name
        ) AS address,
        p.description,
        p.stars,
        p.scoring,
        p.review,
        cat.title AS category,
        (
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id', f.feature_id,
                    'title', f.name
                )
            )
            FROM product_feature AS pf
            INNER JOIN feature AS f ON pf.features_feature_id = f.feature_id
            WHERE pf.products_product_id = p.product_id
            ) AS features,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'title', i.title,
                'imageUrl', i.image_url
            )
        ) AS images
    FROM product AS p
    LEFT JOIN address AS a ON p.address_address_id = a.address_id
    LEFT JOIN city AS c ON a.city_id = c.city_id
    LEFT JOIN state AS s ON c.state_id = s.state_id
    LEFT JOIN country AS co ON s.country_id = co.country_id
    LEFT JOIN image AS i ON p.product_id = i.product_id
    LEFT JOIN category AS cat ON p.category_id = cat.category_id
    WHERE p.category_id = :key
    GROUP BY p.product_id;
    """

GET_PRODUCTS_BY_CITY = f"""
       SELECT
        p.product_id AS id,
        p.title,
        JSON_OBJECT(
            'street', a.street,
            'number', a.number,
            'city', c.name,
            'state', s.name,
            'country', co.name
        ) AS address,
        p.description,
        p.stars,
        p.scoring,
        p.review,
        cat.title AS category,
        (
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id', f.feature_id,
                    'title', f.name
                )
            )
            FROM product_feature AS pf
            INNER JOIN feature AS f ON pf.features_feature_id = f.feature_id
            WHERE pf.products_product_id = p.product_id
        ) AS features,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'title', i.title,
                'imageUrl', i.image_url
            )
        ) AS images
    FROM product AS p
    LEFT JOIN address AS a ON p.address_address_id = a.address_id
    LEFT JOIN city AS c ON a.city_id = c.city_id
    LEFT JOIN state AS s ON c.state_id = s.state_id
    LEFT JOIN country AS co ON s.country_id = co.country_id
    LEFT JOIN image AS i ON p.product_id = i.product_id
    LEFT JOIN category AS cat ON p.category_id = cat.category_id
    WHERE c.name = :key
    GROUP BY p.product_id;
    """

GET_PRODUCTS_BY_CITY_AND_DATES = f"""
    SELECT
        p.product_id AS id,
        p.title,
        JSON_OBJECT(
            'street', a.street,
            'number', a.number,
            'city', c.name,
            'state', s.name,
            'country', co.name
        ) AS address,
        p.description,
        p.stars,
        p.scoring,
        p.review,
        cat.title AS category,
        (
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id', f.feature_id,
                    'title', f.name
                )
            )
            FROM product_feature AS pf
            INNER JOIN feature AS f ON pf.features_feature_id = f.feature_id
            WHERE pf.products_product_id = p.product_id
        ) AS features,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'title', i.title,
                'imageUrl', i.image_url
            )
        ) AS images
    FROM product AS p
    LEFT JOIN address AS a ON p.address_address_id = a.address_id
    LEFT JOIN city AS c ON a.city_id = c.city_id
    LEFT JOIN state AS s ON c.state_id = s.state_id
    LEFT JOIN country AS co ON s.country_id = co.country_id
    LEFT JOIN image AS i ON p.product_id = i.product_id
    LEFT JOIN category AS cat ON p.category_id = cat.category_id
    WHERE c.name = :name
    AND p.product_id NOT IN (
        SELECT r.product_id
        FROM reserve AS r
        WHERE r.check_out >= :checkin AND r.check_in <= :checkout
    )
    GROUP BY p.product_id
    """
