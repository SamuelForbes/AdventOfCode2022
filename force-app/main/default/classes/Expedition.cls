/**
 * @author samuelf@nebulaconsulting.co.uk
 * @date 27/01/2023
 */

public without sharing class Expedition {

    private List<Elf> elves;

    public Expedition(String calorieInput){
        elves = new List<Elf>();
        parseCalorieInput(calorieInput);
    }

    private void parseCalorieInput(String calorieInput){
        List<String> inputPerElf = calorieInput.split('\n\n');

        for(String input : inputPerElf){
            List<String> foodItemCalories = input.split('\n');

            Elf elf = new Elf();
            for(String foodItem : foodItemCalories){
                elf.addFoodItem(Integer.valueOf(foodItem));
            }

            elves.add(elf);
        }
    }

    public Integer getHighestCalorieElf(){
        List<Elf> sortedElves = elves.clone();
        sortedElves.sort();

        Elf highestCalorieElf = sortedElves[0];
        System.debug('The elf with the highest calories is Elf ' + elves.indexOf(highestCalorieElf) + ' with ' + highestCalorieElf.foodItemCalorieTotal + ' calories');

        return elves.indexOf(highestCalorieElf);
    }

}