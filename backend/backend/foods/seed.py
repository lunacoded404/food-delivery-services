from .models import Category, Food


CATEGORIES = [
    {
        "name": "Burger",
        "description": "Delicious burgers made with fresh ingredients and flavorful fillings.",
        "icon": "fast-food-outline",
    },
    {
        "name": "Healthy",
        "description": "Fresh and nutritious meals for a healthy and balanced lifestyle.",
        "icon": "leaf-outline",
    },
    {
        "name": "Coffee",
        "description": "A selection of aromatic coffee made from high-quality coffee beans.",
        "icon": "cafe-outline",
    },
    {
        "name": "Ice Cream",
        "description": "Creamy and refreshing ice cream desserts for every sweet tooth.",
        "icon": "ice-cream-outline",
    },
    {
        "name": "Pizza",
        "description": "Classic and delicious pizzas with a variety of flavorful toppings.",
        "icon": "pizza-outline",
    },
    {
        "name": "Seafood",
        "description": "Fresh seafood selections prepared with delicious flavors.",
        "icon": "fish-outline",
    },
    {
        "name": "Wine",
        "description": "A collection of red, white, sparkling, and sweet wines.",
        "icon": "wine-outline",
    },
]


FOODS = [

    # ==================================================
    # BURGER
    # ==================================================

    {
        "category": "Burger",
        "name": "Chicken Burger",
        "description": "A juicy chicken patty served with fresh vegetables and creamy sauce in a soft burger bun.",
        "price": 5.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788927502/chicken_burger_agkwfa.jpg",
        "is_recommended": True,
    },

    {
        "category": "Burger",
        "name": "Beef Burger",
        "description": "A classic beef burger with a juicy beef patty, fresh vegetables, cheese, and savory sauce.",
        "price": 6.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788927502/beef_burger_j2egex.jpg",
        "is_recommended": True,
    },

    {
        "category": "Burger",
        "name": "Egg Burger",
        "description": "A delicious burger topped with a freshly cooked egg, vegetables, and creamy sauce.",
        "price": 5.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788927501/egg_burger_zqdirv.jpg",
        "is_recommended": False,
    },

    {
        "category": "Burger",
        "name": "Fish Burger",
        "description": "A crispy fish fillet burger served with fresh lettuce and a flavorful creamy sauce.",
        "price": 6.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788927501/fish_burger_dzrsqx.jpg",
        "is_recommended": False,
    },

    {
        "category": "Burger",
        "name": "Assorted Burger",
        "description": "A satisfying assorted burger featuring a delicious combination of flavorful ingredients.",
        "price": 7.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788927501/Assorted_burger_sbm1yy.jpg",
        "is_recommended": True,
    },

    {
        "category": "Burger",
        "name": "Sausage Burger",
        "description": "A tasty burger filled with savory sausage, fresh vegetables, and special sauce.",
        "price": 5.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788927501/sausage_burger_ucvhqk.jpg",
        "is_recommended": False,
    },

    {
        "category": "Burger",
        "name": "Shrimp Burger",
        "description": "A flavorful shrimp burger combined with fresh vegetables and a creamy signature sauce.",
        "price": 7.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788927501/Shrimp_burger_rhzvn7.jpg",
        "is_recommended": True,
    },

    {
        "category": "Burger",
        "name": "Pork Burger",
        "description": "A tender pork patty burger served with crisp vegetables and savory sauce.",
        "price": 5.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788927500/pork_burger_jbwl4d.jpg",
        "is_recommended": False,
    },


    # ==================================================
    # HEALTHY
    # ==================================================

    {
        "category": "Healthy",
        "name": "Chicken Breast and Avocado Salad",
        "description": "A fresh salad combining grilled chicken breast, creamy avocado, and crisp vegetables.",
        "price": 8.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934404/Chicken_breast_and_avocado_salad_jjs1wd.jpg",
        "is_recommended": True,
    },

    {
        "category": "Healthy",
        "name": "Smoked Salmon Salad",
        "description": "A refreshing salad with smoked salmon, fresh vegetables, and a light dressing.",
        "price": 10.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934403/Smoked_salmon_salad_xxi5sa.jpg",
        "is_recommended": True,
    },

    {
        "category": "Healthy",
        "name": "Greek Salad",
        "description": "A classic Greek salad made with fresh vegetables, olives, and feta cheese.",
        "price": 7.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934401/Greek_Salad_w3tf0s.jpg",
        "is_recommended": False,
    },

    {
        "category": "Healthy",
        "name": "Brown Rice with Grilled Chicken Breast",
        "description": "Nutritious brown rice served with tender grilled chicken breast and fresh vegetables.",
        "price": 9.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934399/Brown_rice_with_grilled_chicken_breast_btdovp.jpg",
        "is_recommended": True,
    },

    {
        "category": "Healthy",
        "name": "Pan Seared Salmon with Asparagus",
        "description": "Pan-seared salmon served with fresh asparagus for a nutritious and flavorful meal.",
        "price": 12.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934398/Pan_seared_salmon_with_asparagus_t7xzjk.jpg",
        "is_recommended": True,
    },

    {
        "category": "Healthy",
        "name": "Healthy Shaking Beef",
        "description": "Tender beef cubes tossed with fresh vegetables and a flavorful healthy-style sauce.",
        "price": 10.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934396/Healthy_Shaking_Beef_kuasfo.jpg",
        "is_recommended": False,
    },

    {
        "category": "Healthy",
        "name": "Poke Bowl",
        "description": "A fresh and nutritious bowl combining seafood, vegetables, rice, and flavorful toppings.",
        "price": 9.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934394/Poke_Bowl_enpilv.jpg",
        "is_recommended": True,
    },

    {
        "category": "Healthy",
        "name": "Buddha Bowl",
        "description": "A wholesome bowl packed with vegetables, grains, and nutritious plant-based ingredients.",
        "price": 8.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934392/Buddha_Bowl_hiffwj.jpg",
        "is_recommended": False,
    },

    {
        "category": "Healthy",
        "name": "Whole Wheat Bread with Butter and Egg",
        "description": "Whole wheat bread served with butter and a freshly prepared egg for a simple healthy meal.",
        "price": 5.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934391/Whole_wheat_bread_with_butter_and_egg_xymbsu.jpg",
        "is_recommended": False,
    },

    {
        "category": "Healthy",
        "name": "Pumpkin Soup",
        "description": "A warm and creamy pumpkin soup made with fresh pumpkin and delicate seasoning.",
        "price": 6.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934389/Pumpkin_soup_g6p3hh.jpg",
        "is_recommended": False,
    },

    {
        "category": "Healthy",
        "name": "Fresh Spring Rolls",
        "description": "Fresh rice paper rolls filled with vegetables, herbs, and delicious healthy ingredients.",
        "price": 6.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934389/Fresh_Spring_Rolls_wvyibz.jpg",
        "is_recommended": True,
    },

    {
        "category": "Healthy",
        "name": "Smoothie Bowl",
        "description": "A refreshing smoothie bowl topped with fresh fruits and nutritious ingredients.",
        "price": 7.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788934388/Smoothie_Bowl_vv58tu.jpg",
        "is_recommended": True,
    },


    # ==================================================
    # COFFEE
    # ==================================================

    {
        "category": "Coffee",
        "name": "Arabica",
        "description": "Aromatic Arabica coffee with a smooth body and naturally rich flavor.",
        "price": 3.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930669/Arabica_jspwo4.jpg",
        "is_recommended": True,
    },

    {
        "category": "Coffee",
        "name": "Robusta",
        "description": "Bold and strong Robusta coffee with an intense aroma and rich taste.",
        "price": 3.29,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930668/Robusta_mnpk2u.jpg",
        "is_recommended": False,
    },

    {
        "category": "Coffee",
        "name": "Liberica",
        "description": "Distinctive Liberica coffee known for its unique aroma and bold character.",
        "price": 3.79,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930666/Liberica_spxwms.jpg",
        "is_recommended": False,
    },

    {
        "category": "Coffee",
        "name": "Espresso",
        "description": "A concentrated shot of rich and aromatic espresso with a smooth crema.",
        "price": 2.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930664/Espresso_szrx8p.jpg",
        "is_recommended": True,
    },

    {
        "category": "Coffee",
        "name": "Vietnam Filter Coffee",
        "description": "Traditional Vietnamese drip coffee with a rich, bold flavor and aromatic finish.",
        "price": 3.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930664/Vietnam_Filter_Coffee_gi335x.jpg",
        "is_recommended": True,
    },

    {
        "category": "Coffee",
        "name": "Cold Brew",
        "description": "Smooth and refreshing coffee slowly brewed with cold water for a mellow taste.",
        "price": 4.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930663/Cold_Brew_bslvsi.jpg",
        "is_recommended": True,
    },

    {
        "category": "Coffee",
        "name": "Pour-over",
        "description": "Hand-brewed coffee with a clean flavor, delicate aroma, and balanced finish.",
        "price": 4.29,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930663/Pour-over_iz2ppj.jpg",
        "is_recommended": False,
    },

    {
        "category": "Coffee",
        "name": "French Press",
        "description": "Rich and full-bodied coffee brewed using the classic French press method.",
        "price": 4.29,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930660/French_Press_reko4p.jpg",
        "is_recommended": False,
    },

    {
        "category": "Coffee",
        "name": "Americano",
        "description": "Smooth espresso diluted with hot water for a clean and refreshing coffee experience.",
        "price": 3.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930659/Americano_kazbzn.jpg",
        "is_recommended": True,
    },

    {
        "category": "Coffee",
        "name": "Latte",
        "description": "Smooth espresso combined with steamed milk and a light layer of creamy foam.",
        "price": 4.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930657/Latte_u1qxom.jpg",
        "is_recommended": True,
    },

    {
        "category": "Coffee",
        "name": "Cappuccino",
        "description": "Classic espresso topped with steamed milk and a generous layer of milk foam.",
        "price": 4.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930656/Cappuccino_oosdwy.jpg",
        "is_recommended": True,
    },

    {
        "category": "Coffee",
        "name": "Mocha",
        "description": "A delicious combination of espresso, chocolate, and steamed milk with a creamy finish.",
        "price": 4.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930656/Mocha_nmjl0r.jpg",
        "is_recommended": True,
    },

    {
        "category": "Coffee",
        "name": "Flat White",
        "description": "Velvety espresso-based coffee with finely textured steamed milk.",
        "price": 4.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930656/Flat_White_d19ufy.jpg",
        "is_recommended": False,
    },

    {
        "category": "Coffee",
        "name": "Macchiato",
        "description": "Rich espresso lightly marked with steamed milk for a bold and creamy flavor.",
        "price": 3.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930655/macchiato_byslty.jpg",
        "is_recommended": False,
    },


    # ==================================================
    # ICE CREAM
    # ==================================================

    {
        "category": "Ice Cream",
        "name": "Philadelphia Ice Cream",
        "description": "Rich and creamy Philadelphia-style ice cream with a smooth and refreshing texture.",
        "price": 4.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930068/Philadelphia_Ice_Cream_ramgby.jpg",
        "is_recommended": False,
    },

    {
        "category": "Ice Cream",
        "name": "French Ice Cream",
        "description": "Luxuriously creamy French-style ice cream with a rich and delicate flavor.",
        "price": 5.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930067/French_Ice_Cream_d0xydj.jpg",
        "is_recommended": True,
    },

    {
        "category": "Ice Cream",
        "name": "Gelato",
        "description": "Silky Italian-style gelato with an intense flavor and wonderfully smooth texture.",
        "price": 5.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930066/Gelato_mjqf5d.jpg",
        "is_recommended": True,
    },

    {
        "category": "Ice Cream",
        "name": "Soft Serve",
        "description": "Light and creamy soft serve ice cream with a smooth and refreshing finish.",
        "price": 3.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930065/Soft_Serve_t2rjcy.jpg",
        "is_recommended": True,
    },

    {
        "category": "Ice Cream",
        "name": "Sherbet",
        "description": "Refreshing fruit-based frozen dessert with a light and tangy flavor.",
        "price": 4.29,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930064/Sherbet_awlffe.jpg",
        "is_recommended": False,
    },

    {
        "category": "Ice Cream",
        "name": "Sorbet",
        "description": "Refreshing dairy-free frozen dessert made with fruity and vibrant flavors.",
        "price": 4.29,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930063/Sorbet_qnlpno.jpg",
        "is_recommended": True,
    },

    {
        "category": "Ice Cream",
        "name": "Sorbetto",
        "description": "Italian-style fruit sorbetto with a refreshing texture and bright natural flavor.",
        "price": 4.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930062/Sorbetto_rpvorg.jpg",
        "is_recommended": False,
    },

    {
        "category": "Ice Cream",
        "name": "Vegan Ice Cream",
        "description": "Creamy plant-based ice cream made for a delicious dairy-free dessert experience.",
        "price": 5.29,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930060/Vegan_Ice_Cream_je8kil.jpg",
        "is_recommended": False,
    },

    {
        "category": "Ice Cream",
        "name": "Frozen Yogurt",
        "description": "Light and tangy frozen yogurt with a smooth and refreshing texture.",
        "price": 4.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930060/Frozen_Yogurt_tycbog.jpg",
        "is_recommended": False,
    },

    {
        "category": "Ice Cream",
        "name": "Mochi Ice Cream",
        "description": "Soft Japanese mochi wrapped around creamy ice cream for a delightful dessert.",
        "price": 5.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930059/Mochi_Ice_Cream_kymb3l.jpg",
        "is_recommended": True,
    },

    {
        "category": "Ice Cream",
        "name": "Bingsu",
        "description": "Korean shaved ice dessert served with sweet toppings and creamy ingredients.",
        "price": 6.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930059/Bingsu_u9cflq.jpg",
        "is_recommended": True,
    },

    {
        "category": "Ice Cream",
        "name": "Kulfi",
        "description": "Traditional Indian frozen dessert with a rich, creamy, and aromatic flavor.",
        "price": 5.29,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788930059/Kulfi_cgvuth.jpg",
        "is_recommended": False,
    },


    # ==================================================
    # PIZZA
    # ==================================================

    {
        "category": "Pizza",
        "name": "Neapolitan Pizza",
        "description": "Classic Italian pizza with a soft crust, tomato sauce, mozzarella, and fresh basil.",
        "price": 10.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928638/Neapolitan_Pizza_gx9ps3.jpg",
        "is_recommended": True,
    },

    {
        "category": "Pizza",
        "name": "BBQ Chicken Pizza",
        "description": "Savory pizza topped with tender chicken, barbecue sauce, cheese, and fresh ingredients.",
        "price": 11.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/BBQ_Chicken_Pizza_j9bnnw.jpg",
        "is_recommended": True,
    },

    {
        "category": "Pizza",
        "name": "New York Style Pizza",
        "description": "Classic New York-style pizza with a thin, foldable crust and flavorful toppings.",
        "price": 10.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/New_York_style_Pizza_iclzyt.jpg",
        "is_recommended": False,
    },

    {
        "category": "Pizza",
        "name": "Chicago Deep Dish Pizza",
        "description": "Deep-dish pizza with a thick buttery crust, rich tomato sauce, cheese, and toppings.",
        "price": 12.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/Chicago_Deep_Dish_Pizza_wkjewf.jpg",
        "is_recommended": True,
    },

    {
        "category": "Pizza",
        "name": "Ground Beef Pizza",
        "description": "Flavorful pizza topped with seasoned ground beef, melted cheese, and fresh ingredients.",
        "price": 11.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/Ground_Beef_Pizza_ournyc.jpg",
        "is_recommended": False,
    },

    {
        "category": "Pizza",
        "name": "Pizza Marinara",
        "description": "Simple Italian pizza topped with tomato sauce, garlic, oregano, and olive oil.",
        "price": 8.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/Pizza_arinara_klcqf3.jpg",
        "is_recommended": False,
    },

    {
        "category": "Pizza",
        "name": "Pizza Capricciosa",
        "description": "Classic Italian pizza topped with cheese, mushrooms, ham, artichokes, and olives.",
        "price": 12.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/Pizza_Capricciosa_zkkhl6.jpg",
        "is_recommended": True,
    },

    {
        "category": "Pizza",
        "name": "Seafood Pizza",
        "description": "Delicious pizza topped with fresh seafood, melted cheese, tomato sauce, and herbs.",
        "price": 13.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928637/seafood_pizza_vvkgpe.jpg",
        "is_recommended": True,
    },

    {
        "category": "Pizza",
        "name": "Pizza Hawaii",
        "description": "Sweet and savory pizza combining ham, pineapple, tomato sauce, and melted cheese.",
        "price": 10.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928636/Pizza_Hawaii_wcf37c.jpg",
        "is_recommended": False,
    },

    {
        "category": "Pizza",
        "name": "Pizza Quattro Formaggi",
        "description": "Rich Italian pizza made with a delicious blend of four different cheeses.",
        "price": 12.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928636/Pizza_Quattro_Formaggi_kbvbyt.jpg",
        "is_recommended": True,
    },

    {
        "category": "Pizza",
        "name": "Pizza Pepperoni",
        "description": "Classic pizza topped with spicy pepperoni, melted mozzarella, and rich tomato sauce.",
        "price": 11.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928636/Pizza_Pepperoni_h93mrr.jpg",
        "is_recommended": True,
    },

    {
        "category": "Pizza",
        "name": "Pizza Margherita",
        "description": "Classic Italian pizza made with tomato sauce, mozzarella cheese, and fresh basil.",
        "price": 9.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788928636/Pizza_Margherita_ylkqp0.jpg",
        "is_recommended": True,
    },


    # ==================================================
    # SEAFOOD
    # ==================================================

    {
        "category": "Seafood",
        "name": "Shrimp",
        "description": "Fresh and succulent shrimp with a naturally sweet and delicate seafood flavor.",
        "price": 9.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933844/Shrimp_tr7amh.jpg",
        "is_recommended": True,
    },

    {
        "category": "Seafood",
        "name": "Crab",
        "description": "Fresh crab with sweet and tender meat, perfect for seafood lovers.",
        "price": 12.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933832/crab_gauylo.jpg",
        "is_recommended": True,
    },

    {
        "category": "Seafood",
        "name": "Lobster",
        "description": "Premium lobster with tender meat and a rich, naturally sweet seafood flavor.",
        "price": 19.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933831/Lobster_vmm9kt.jpg",
        "is_recommended": True,
    },

    {
        "category": "Seafood",
        "name": "Squid",
        "description": "Tender squid with a delicate seafood flavor and satisfying texture.",
        "price": 8.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933829/Squid_jeyvnd.jpg",
        "is_recommended": False,
    },

    {
        "category": "Seafood",
        "name": "Octopus",
        "description": "Tender octopus with a delicate flavor and satisfying texture.",
        "price": 11.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933827/octopus_qfqtej.jpg",
        "is_recommended": False,
    },

    {
        "category": "Seafood",
        "name": "Oysters",
        "description": "Fresh oysters with a delicate briny flavor and smooth texture.",
        "price": 13.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933825/Oysters_o2yssu.jpg",
        "is_recommended": True,
    },

    {
        "category": "Seafood",
        "name": "Abalone",
        "description": "Premium abalone with a delicate flavor and firm yet tender texture.",
        "price": 18.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933805/Abalone_ct9cjm.jpg",
        "is_recommended": True,
    },

    {
        "category": "Seafood",
        "name": "Scallops",
        "description": "Tender scallops with a naturally sweet flavor and delicate texture.",
        "price": 14.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933759/Scallops_aryk3e.jpg",
        "is_recommended": True,
    },

    {
        "category": "Seafood",
        "name": "Salmon",
        "description": "Fresh salmon with a rich flavor and tender, buttery texture.",
        "price": 13.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933758/Salmon_q2zvj5.jpg",
        "is_recommended": True,
    },

    {
        "category": "Seafood",
        "name": "Tuna",
        "description": "Fresh tuna with a rich, meaty texture and distinctive seafood flavor.",
        "price": 12.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933756/Tuna_qgxnmc.jpg",
        "is_recommended": False,
    },

    {
        "category": "Seafood",
        "name": "Mackerel",
        "description": "Flavorful mackerel with a rich taste and firm, tender texture.",
        "price": 9.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933755/Mackerel_vpqaqr.jpg",
        "is_recommended": False,
    },

    {
        "category": "Seafood",
        "name": "Seabass",
        "description": "Tender seabass with a mild flavor and delicate texture.",
        "price": 11.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788933741/Seabass_h8wrkm.jpg",
        "is_recommended": False,
    },


    # ==================================================
    # WINE
    # ==================================================

    {
        "category": "Wine",
        "name": "Cabernet Sauvignon",
        "description": "A full-bodied red wine with rich fruit flavors and a smooth, structured finish.",
        "price": 18.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929367/Cabernet_Sauvignon_vmdgcr.jpg",
        "is_recommended": True,
    },

    {
        "category": "Wine",
        "name": "Merlot",
        "description": "A smooth and approachable red wine with soft fruit flavors and a mellow finish.",
        "price": 17.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929366/Merlot_zc1v6v.jpg",
        "is_recommended": False,
    },

    {
        "category": "Wine",
        "name": "Pinot Noir",
        "description": "An elegant red wine with delicate fruit aromas and a smooth, balanced character.",
        "price": 19.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929365/Pinot_Noir_b6llvc.jpg",
        "is_recommended": True,
    },

    {
        "category": "Wine",
        "name": "Syrah",
        "description": "A bold red wine with rich fruit flavors, spice, and a deep finish.",
        "price": 18.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929364/Syrah_o80fs0.jpg",
        "is_recommended": False,
    },

    {
        "category": "Wine",
        "name": "Chardonnay",
        "description": "A smooth white wine with balanced fruit flavors and a refreshing finish.",
        "price": 17.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929363/Chardonnay_vdgpjq.jpg",
        "is_recommended": True,
    },

    {
        "category": "Wine",
        "name": "Sauvignon Blanc",
        "description": "A crisp and refreshing white wine with bright citrus and herbal notes.",
        "price": 16.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929362/Sauvignon_Blanc_cedjbd.jpg",
        "is_recommended": False,
    },

    {
        "category": "Wine",
        "name": "Riesling",
        "description": "An aromatic white wine with refreshing acidity and delicate fruit flavors.",
        "price": 17.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929361/Riesling_nr0esz.jpg",
        "is_recommended": False,
    },

    {
        "category": "Wine",
        "name": "Rosé Wine",
        "description": "A refreshing rosé wine with delicate fruit aromas and a light, crisp character.",
        "price": 16.49,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929361/Ros%C3%A9_Wine_sjzyba.jpg",
        "is_recommended": True,
    },

    {
        "category": "Wine",
        "name": "Prosecco",
        "description": "A light and refreshing Italian sparkling wine with bright fruity notes.",
        "price": 20.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929359/Prosecco_eo2ghl.jpg",
        "is_recommended": True,
    },

    {
        "category": "Wine",
        "name": "Champagne",
        "description": "Elegant French sparkling wine with fine bubbles and a refined, celebratory character.",
        "price": 29.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929359/Champagne_ewiphw.jpg",
        "is_recommended": True,
    },

    {
        "category": "Wine",
        "name": "Cava",
        "description": "Refreshing Spanish sparkling wine with crisp acidity and delicate fruit notes.",
        "price": 19.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929358/Cava_xtrq6w.jpg",
        "is_recommended": False,
    },

    {
        "category": "Wine",
        "name": "Fortified Wine",
        "description": "Rich and complex fortified wine with a deeper flavor and warming finish.",
        "price": 21.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929358/Fortified_Wine_zjukuh.jpg",
        "is_recommended": False,
    },

    {
        "category": "Wine",
        "name": "Sweet Red Wine",
        "description": "A smooth sweet red wine with rich fruity flavors and a pleasant finish.",
        "price": 17.99,
        "image": "https://res.cloudinary.com/decumd3lu/image/upload/v1788929358/Sweet_Red_Wine_ddjwg3.jpg",
        "is_recommended": False,
    },
]


def seed_foods():

    # ==========================================
    # CREATE CATEGORIES
    # ==========================================

    category_objects = {}

    for data in CATEGORIES:

        category, _ = Category.objects.update_or_create(
            name=data["name"],
            defaults={
                "description": data["description"],
                "icon": data["icon"],
            }
        )

        category_objects[data["name"]] = category


    # ==========================================
    # CREATE FOODS
    # ==========================================

    for data in FOODS:

        category = category_objects[
            data["category"]
        ]

        Food.objects.update_or_create(
            name=data["name"],
            category=category,
            defaults={
                "description": data["description"],
                "price": data["price"],
                "image": data["image"],
                "is_available": True,
                "is_recommended": data["is_recommended"],
            }
        )


    print(
        f"Created {len(category_objects)} categories "
        f"and {len(FOODS)} foods."
    )