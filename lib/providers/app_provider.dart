import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../models/field_model.dart';
import '../models/crop_model.dart';
import '../models/expense_model.dart';
import '../models/inventory_model.dart';
import '../models/task_model.dart';

class AppProvider with ChangeNotifier {
  UserModel? _currentUser;
  List<FieldModel> _fields = [];
  List<CropModel> _crops = [];
  List<ExpenseModel> _expenses = [];
  List<InventoryModel> _inventory = [];
  List<TaskModel> _tasks = [];
  
  bool _isLoading = false;
  String? _error;

  // Getters
  UserModel? get currentUser => _currentUser;
  List<FieldModel> get fields => _fields;
  List<CropModel> get crops => _crops;
  List<ExpenseModel> get expenses => _expenses;
  List<InventoryModel> get inventory => _inventory;
  List<TaskModel> get tasks => _tasks;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // User management
  void setCurrentUser(UserModel? user) {
    _currentUser = user;
    notifyListeners();
  }

  // Loading state
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  // Error handling
  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  // Fields management
  void setFields(List<FieldModel> fields) {
    _fields = fields;
    notifyListeners();
  }

  void addField(FieldModel field) {
    _fields.add(field);
    notifyListeners();
  }

  void updateField(FieldModel field) {
    final index = _fields.indexWhere((f) => f.id == field.id);
    if (index != -1) {
      _fields[index] = field;
      notifyListeners();
    }
  }

  void removeField(String fieldId) {
    _fields.removeWhere((f) => f.id == fieldId);
    notifyListeners();
  }

  // Crops management
  void setCrops(List<CropModel> crops) {
    _crops = crops;
    notifyListeners();
  }

  void addCrop(CropModel crop) {
    _crops.add(crop);
    notifyListeners();
  }

  void updateCrop(CropModel crop) {
    final index = _crops.indexWhere((c) => c.id == crop.id);
    if (index != -1) {
      _crops[index] = crop;
      notifyListeners();
    }
  }

  void removeCrop(String cropId) {
    _crops.removeWhere((c) => c.id == cropId);
    notifyListeners();
  }

  // Expenses management
  void setExpenses(List<ExpenseModel> expenses) {
    _expenses = expenses;
    notifyListeners();
  }

  void addExpense(ExpenseModel expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void updateExpense(ExpenseModel expense) {
    final index = _expenses.indexWhere((e) => e.id == expense.id);
    if (index != -1) {
      _expenses[index] = expense;
      notifyListeners();
    }
  }

  void removeExpense(String expenseId) {
    _expenses.removeWhere((e) => e.id == expenseId);
    notifyListeners();
  }

  // Inventory management
  void setInventory(List<InventoryModel> inventory) {
    _inventory = inventory;
    notifyListeners();
  }

  void addInventoryItem(InventoryModel item) {
    _inventory.add(item);
    notifyListeners();
  }

  void updateInventoryItem(InventoryModel item) {
    final index = _inventory.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _inventory[index] = item;
      notifyListeners();
    }
  }

  void removeInventoryItem(String itemId) {
    _inventory.removeWhere((i) => i.id == itemId);
    notifyListeners();
  }

  // Tasks management
  void setTasks(List<TaskModel> tasks) {
    _tasks = tasks;
    notifyListeners();
  }

  void addTask(TaskModel task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(TaskModel task) {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      notifyListeners();
    }
  }

  void removeTask(String taskId) {
    _tasks.removeWhere((t) => t.id == taskId);
    notifyListeners();
  }

  // Analytics
  double get totalExpenses => _expenses.fold(0, (sum, e) => sum + e.amount);
  int get totalFields => _fields.length;
  int get activeCrops => _crops.length;
  int get lowStockItems => _inventory.where((i) => i.stock <= i.reorderLevel).length;
  int get pendingTasks => _tasks.where((t) => t.status == 'pending').length;
}
