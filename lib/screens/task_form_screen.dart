import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/task.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? task;

  const TaskFormScreen({super.key, this.task});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _notesController = TextEditingController();
  
  String _selectedPriority = 'Medium';
  String _selectedStatus = 'Pending';
  String _selectedCategory = 'General';
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  String? _selectedFieldId;
  String? _selectedCropId;
  bool _reminderEnabled = false;
  int _reminderHours = 24;

  final List<String> _priorities = ['Low', 'Medium', 'High'];
  final List<String> _statuses = ['Pending', 'In Progress', 'Completed'];
  final List<String> _categories = [
    'General', 'Planting', 'Watering', 'Fertilizing', 
    'Pest Control', 'Harvesting', 'Maintenance', 'Other'
  ];

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    if (widget.task != null) {
      final task = widget.task!;
      _titleController.text = task.title;
      _descriptionController.text = task.description;
      _notesController.text = task.notes ?? '';
      _selectedPriority = task.priority;
      _selectedStatus = task.status;
      _selectedCategory = task.category;
      _selectedDate = task.dueDate;
      _selectedFieldId = task.fieldId;
      _selectedCropId = task.cropId;
      _reminderEnabled = task.reminderEnabled;
      _reminderHours = task.reminderHours;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _buildForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          Expanded(
            child: Text(
              widget.task == null ? 'Add New Task' : 'Edit Task',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          if (widget.task != null)
            IconButton(
              onPressed: _deleteTask,
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Task Details'),
                const SizedBox(height: 16),
                
                // Title Field
                _buildTextField(
                  controller: _titleController,
                  label: 'Task Title',
                  hint: 'Enter task title',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task title';
                    }
                    if (value.length < 3) {
                      return 'Title must be at least 3 characters long';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 16),
                
                // Description Field
                _buildTextField(
                  controller: _descriptionController,
                  label: 'Description',
                  hint: 'Enter task description',
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task description';
                    }
                    return null;
                  },
                ),
                
                const SizedBox(height: 20),
                
                // Category and Priority Row
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdownField(
                        'Category',
                        _selectedCategory,
                        _categories,
                        Icons.category,
                        (value) => setState(() => _selectedCategory = value!),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDropdownField(
                        'Priority',
                        _selectedPriority,
                        _priorities,
                        Icons.priority_high,
                        (value) => setState(() => _selectedPriority = value!),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Status and Due Date Row
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdownField(
                        'Status',
                        _selectedStatus,
                        _statuses,
                        Icons.flag,
                        (value) => setState(() => _selectedStatus = value!),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDateField(),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                _buildSectionTitle('Assignment'),
                const SizedBox(height: 16),
                
                // Field Assignment
                _buildDropdownField(
                  'Assign to Field (Optional)',
                  _selectedFieldId,
                  ['None', ...provider.fields.map((f) => f.id)],
                  Icons.landscape,
                  (value) {
                    setState(() {
                      _selectedFieldId = value == 'None' ? null : value;
                      if (_selectedFieldId == null) {
                        _selectedCropId = null;
                      }
                    });
                  },
                  displayText: (value) {
                    if (value == null || value == 'None') return 'No field assigned';
                    final field = provider.fields.firstWhere((f) => f.id == value);
                    return field.name;
                  },
                ),
                
                const SizedBox(height: 16),
                
                // Crop Assignment (only if field is selected)
                if (_selectedFieldId != null)
                  _buildDropdownField(
                    'Assign to Crop (Optional)',
                    _selectedCropId,
                    ['None', ...provider.crops
                        .where((c) => c.fieldId == _selectedFieldId)
                        .map((c) => c.id)],
                    Icons.agriculture,
                    (value) => setState(() => _selectedCropId = value == 'None' ? null : value),
                    displayText: (value) {
                      if (value == null || value == 'None') return 'No crop assigned';
                      final crop = provider.crops.firstWhere((c) => c.id == value);
                      return crop.name;
                    },
                  ),
                
                const SizedBox(height: 20),
                
                _buildSectionTitle('Reminders'),
                const SizedBox(height: 16),
                
                // Reminder Settings
                _buildReminderSettings(),
                
                const SizedBox(height: 20),
                
                // Notes Field
                _buildSectionTitle('Additional Notes'),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _notesController,
                  label: 'Notes (Optional)',
                  hint: 'Add any additional notes...',
                  maxLines: 4,
                ),
                
                const SizedBox(height: 30),
                
                // Action Buttons
                _buildActionButtons(provider),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF2E7D32),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2E7D32)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2E7D32), width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  Widget _buildDropdownField(
    String label,
    String? value,
    List<String> items,
    IconData icon,
    void Function(String?) onChanged, {
    String Function(String?)? displayText,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF2E7D32)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2E7D32)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2E7D32), width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(displayText?.call(item) ?? item),
        );
      }).toList(),
    );
  }

  Widget _buildDateField() {
    return InkWell(
      onTap: _selectDate,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF2E7D32)),
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[50],
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color: Color(0xFF2E7D32)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Due Date',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2E7D32),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReminderSettings() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[50],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.notifications, color: Color(0xFF2E7D32)),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Enable Reminder',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Switch(
                value: _reminderEnabled,
                onChanged: (value) => setState(() => _reminderEnabled = value),
                activeColor: const Color(0xFF2E7D32),
              ),
            ],
          ),
          if (_reminderEnabled) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Remind me'),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: _reminderHours,
                    onChanged: (value) => setState(() => _reminderHours = value!),
                    items: const [
                      DropdownMenuItem(value: 1, child: Text('1 hour before')),
                      DropdownMenuItem(value: 6, child: Text('6 hours before')),
                      DropdownMenuItem(value: 24, child: Text('1 day before')),
                      DropdownMenuItem(value: 48, child: Text('2 days before')),
                      DropdownMenuItem(value: 168, child: Text('1 week before')),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActionButtons(AppProvider provider) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: provider.isLoading ? null : _saveTask,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: provider.isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                    widget.task == null ? 'Create Task' : 'Update Task',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF2E7D32),
              side: const BorderSide(color: Color(0xFF2E7D32)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2E7D32),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  void _saveTask() async {
    if (!_formKey.currentState!.validate()) return;

    final provider = context.read<AppProvider>();
    
    try {
      final task = Task(
        id: widget.task?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        category: _selectedCategory,
        priority: _selectedPriority,
        status: _selectedStatus,
        dueDate: _selectedDate,
        fieldId: _selectedFieldId,
        cropId: _selectedCropId,
        reminderEnabled: _reminderEnabled,
        reminderHours: _reminderHours,
        notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        createdAt: widget.task?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (widget.task == null) {
        await provider.createTask(task);
      } else {
        await provider.updateTask(task);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.task == null 
                  ? 'Task created successfully!' 
                  : 'Task updated successfully!',
            ),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _deleteTask() {
    if (widget.task == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              try {
                await context.read<AppProvider>().deleteTask(widget.task!.id);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Task deleted successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context, true);
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error deleting task: ${e.toString()}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
