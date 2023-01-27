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
        new nebc.LazyIterator(inputPerElf)
                .forEach(new CreateElvesWithFoodItems(elves));
    }

    public Integer getHighestCalorieElf(){
        List<Elf> sortedElves = elves.clone();
        sortedElves.sort();

        Elf highestCalorieElf = sortedElves[0];
        System.debug('The elf with the highest calories is Elf ' + elves.indexOf(highestCalorieElf) + ' with ' + highestCalorieElf.foodItemCalorieTotal + ' calories');

        return elves.indexOf(highestCalorieElf);
    }

    private inherited sharing class CreateElvesWithFoodItems implements nebc.VoidFunction {
        private List<Elf> elves;

        public CreateElvesWithFoodItems(List<Elf> elves) {
            this.elves = elves;
        }

        public void call(Object o) {
            String elfInput = (String) o;
            List<String> foodItemCalories = elfInput.split('\n');

            Elf elf = new Elf();
            for(String foodItem : foodItemCalories){
                elf.addFoodItem(Integer.valueOf(foodItem));
            }

            elves.add(elf);
        }
    }

}