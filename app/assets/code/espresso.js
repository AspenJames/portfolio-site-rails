function makeCoffee() {
  console.log("Brewin up that tasty bevvie.");
  let coffee = CoffeeOrder.from_string(order);
  coffee = grindCoffee(coffee);
  const water = heatWater();
  const bev = brewCoffee(coffee, water);
  serve(bev);
}
