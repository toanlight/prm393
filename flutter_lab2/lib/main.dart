import 'dart:async';

// --- Exercise 4: Intro to OOP ---
class Car {
  String brand;
  int speed;

  // Constructor
  Car(this.brand, this.speed);

  // Named Constructor
  Car.electric(this.brand, this.speed) {
    print("--- Initializing an electric car: $brand ---");
  }

  void displayInfo() {
    print("Car Brand: $brand, Speed: $speed km/h");
  }
}

// Inheritance
class ElectricCar extends Car {
  int batteryLevel;

  ElectricCar(String brand, int speed, this.batteryLevel) : super(brand, speed);

  @override
  void displayInfo() {
    print("Electric Car - Brand: $brand, Speed: $speed km/h, Battery: $batteryLevel%");
  }
}

// --- Exercise 3: Functions ---
// Hàm thường
int calculateRepairCost(int hours, int rate) {
  return hours * rate;
}

// Arrow function
double calculateVAT(double amount) => amount * 0.1;

// --- Exercise 5: Async & Streams ---
// Async/Await
Future<String> repairCar() async {
  print("Repairing car in progress...");
  await Future.delayed(const Duration(seconds: 3)); // Mô phỏng sửa xe mất 3 giây
  return "Status: Car repair completed!";
}

// Stream
Stream<int> carStream() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

void main() async {
  // --- Exercise 1: Basic Syntax & Data Types ---
  print("========== EXERCISE 1: BASIC SYNTAX ==========");
  String garageName = "Smart Garage";
  int totalCars = 5;
  double avgRepairCost = 250.5;
  bool isOpen = true;

  print("Garage Name: $garageName");
  print("Total Cars: $totalCars");
  print("Average Repair Cost: $avgRepairCost");
  print("Garage Open: $isOpen");

  // --- Exercise 2: Collections & Operators ---
  print("\n========== EXERCISE 2: COLLECTIONS & OPERATORS ==========");
  // List
  List<String> carNames = ["Toyota", "BMW", "Tesla"];
  carNames.add("Honda");
  carNames.remove("BMW");
  print("Car List: $carNames");
  print("Car at index 1: ${carNames[1]}");

  // Set
  Set<String> fuelTypes = {"Gasoline", "Electric", "Hybrid"};
  fuelTypes.add("Gasoline"); // Thêm trùng để check duplicate
  print("Fuel Types (Set): $fuelTypes");

  // Map
  Map<String, int> repairCosts = {
    "Toyota": 200,
    "BMW": 500,
    "Tesla": 100
  };
  print("Repair Costs (Map): $repairCosts");

  // Operators
  int baseCost = 100 + 50;
  int discount = 20;
  int total = baseCost - discount; // 130
  bool isExpensive = total > 120 ? true : false;
  print("Total: $total, Is Expensive: $isExpensive");
  print("Logic Check (total > 100 AND open): ${total > 100 && isOpen}");

  // --- Exercise 3: Control Flow & Functions ---
  print("\n========== EXERCISE 3: CONTROL FLOW & FUNCTIONS ==========");
  // if/else
  int score = 9;
  String rating = "";
  if (score >= 8) {
    rating = "Excellent";
  } else if (score >= 5) {
    rating = "Good";
  } else {
    rating = "Poor";
  }
  print("Garage Rating: $rating");

  // switch-case
  int day = 1;
  switch (day) {
    case 1: print("Today is Monday - Garage is busy."); break;
    case 2: print("Today is Tuesday."); break;
    default: print("Working day.");
  }

  // Loops
  print("--- Iterating cars using for loop ---");
  for (int i = 0; i < carNames.length; i++) {
    print("Car $i: ${carNames[i]}");
  }

  print("--- Iterating cars using for-in ---");
  for (var car in carNames) {
    print("Brand: $car");
  }

  print("--- Iterating cars using forEach ---");
  carNames.forEach((name) => print("Processing: $name"));

  // Functions usage
  int hourlyCost = calculateRepairCost(4, 60);
  print("Repair cost for 4h at 60/h: $hourlyCost");
  print("VAT for this cost: ${calculateVAT(hourlyCost.toDouble())}");

  // --- Exercise 4: Intro to OOP ---
  print("\n========== EXERCISE 4: INTRO TO OOP ==========");
  Car genericCar = Car("Toyota Corolla", 120);
  genericCar.displayInfo();

  ElectricCar myTesla = ElectricCar("Tesla Model 3", 180, 85);
  myTesla.displayInfo();

  // Named constructor
  Car electricVin = Car.electric("VinFast VF8", 160);
  electricVin.displayInfo();

  // --- Exercise 5: Async, Future, Null Safety & Streams ---
  print("\n========== EXERCISE 5: ASYNC, NULL SAFETY & STREAMS ==========");
  // Null Safety
  String? ownerName;
  print("Owner (??): ${ownerName ?? "Unknown Owner"}");
  ownerName = "Nguyen Van A";
  print("Owner (after assign): $ownerName");

  // Async/Await
  print("Initiating repair process...");
  String result = await repairCar();
  print(result);

  // Stream
  print("Starting Stream: Monitoring cars arriving at garage...");
  await for (int carCount in carStream()) {
    print("Car arrived: $carCount");
  }

  print("\n--- SMART GARAGE SYSTEM SHUTDOWN ---");
}
