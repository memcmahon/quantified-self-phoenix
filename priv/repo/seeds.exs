# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
QuantifiedSelfPhoenix.Repo.delete_all(QuantifiedSelfPhoenix.MealFood)
QuantifiedSelfPhoenix.Repo.delete_all(QuantifiedSelfPhoenix.Food)
QuantifiedSelfPhoenix.Repo.delete_all(QuantifiedSelfPhoenix.Meal)
QuantifiedSelfPhoenix.Repo.query("ALTER SEQUENCE mealfoods_id_seq RESTART")
QuantifiedSelfPhoenix.Repo.query("ALTER SEQUENCE foods_id_seq RESTART")
QuantifiedSelfPhoenix.Repo.query("ALTER SEQUENCE meals_id_seq RESTART")

QuantifiedSelfPhoenix.Repo.insert!(%QuantifiedSelfPhoenix.Food{
  name: "Banana",
  calories: 35
  })
QuantifiedSelfPhoenix.Repo.insert!(%QuantifiedSelfPhoenix.Food{
  name: "Orange",
  calories: 40
  })

QuantifiedSelfPhoenix.Repo.insert!(%QuantifiedSelfPhoenix.Meal{
  name: "Breakfast"
  })
QuantifiedSelfPhoenix.Repo.insert!(%QuantifiedSelfPhoenix.Meal{
  name: "Lunch"
  })
QuantifiedSelfPhoenix.Repo.insert!(%QuantifiedSelfPhoenix.Meal{
  name: "Snacks"
  })
QuantifiedSelfPhoenix.Repo.insert!(%QuantifiedSelfPhoenix.Meal{
  name: "Dinner"
  })

QuantifiedSelfPhoenix.Repo.insert!(%QuantifiedSelfPhoenix.MealFood{
  meal_id: 1,
  food_id: 1
  })
QuantifiedSelfPhoenix.Repo.insert!(%QuantifiedSelfPhoenix.MealFood{
  meal_id: 1,
  food_id: 2
  })
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.
