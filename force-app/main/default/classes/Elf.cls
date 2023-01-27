/**
 * @author samuelf@nebulaconsulting.co.uk
 * @date 27/01/2023
 */

public without sharing class Elf implements Comparable {

    private List<FoodItem> itemsCarried;
    public Integer foodItemCalorieTotal {
        get {
            return foodItemCalorieTotal;
        }
        private set;
    }

    public Elf() {
        itemsCarried = new List<FoodItem>();
        foodItemCalorieTotal = 0;
    }

    public void addFoodItem(Integer calories) {
        itemsCarried.add(new FoodItem(calories));
        foodItemCalorieTotal += calories;
    }

    private inherited sharing class AccumulateCalories implements nebc.AccumulatorFunction {

        public Object nextValue(Object valueSoFar, Object thisValue) {
            FoodItem foodItem = (FoodItem) thisValue;
            return ((Integer) valueSoFar) + foodItem.calories;
        }
    }

    public Integer compareTo(Object param1) {
        Elf otherElf = (Elf) param1;
        return otherElf.foodItemCalorieTotal - this.foodItemCalorieTotal;
    }
}