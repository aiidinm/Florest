import 'package:florest/gen/assets.gen.dart';
import 'package:florest/model/data_models.dart';

List<PlantData> florestList = [
  PlantData(
    name: "Maku rela \nVera",
    about:
        "The Maku Aloe Vera is known for its medicinal gel, often used in skincare and minor burn treatments. Native to warm regions, it’s easy to grow with minimal watering and sunlight, making it suitable for home care.",
    price: 19.00,
    category: "Outdoor",
    image: Assets.image.plant3.path,
  ),
  PlantData(
    name: "Pontiatus \nEvo",
    about:
        "The rose is a beautiful and fragrant flower, often symbolizing love and romance. Available in many colors, each hue has a unique meaning—red for love, white for purity, and yellow for friendship. Roses are widely cherished in gardens and floral arrangements worldwide.",
    price: 21.50,
    category: "Indoor",
    image: Assets.image.plant2.path,
  ),
  PlantData(
    name: "sun \nFlowers",
    about:
        "The sunflower is a beautiful and unique plant, known for its yellow petals and dark seeds in the center. It has a special feature of turning towards the sun throughout the day, which helps it get more light. Besides its beauty, sunflower seeds are nutritious and widely used in the food and cosmetic industries.",
    price: 15.50,
    category: "Indoor",
    image: Assets.image.plant1.path,
  ),
];

List<String> categories = [
  'All',
  'Outdoor',
  'Indoor',
];
List<String> selectedCategories = [];
