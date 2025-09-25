import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('MMM d, y');

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // The Text Controller is better for managing more text field as it Auto by Fluter
  final _titleController = TextEditingController();
  final _amountCountroller = TextEditingController();

  // Dispose the TextEditingController to freeup space in memory
  @override
  void dispose() {
    _titleController.dispose();
    _amountCountroller.dispose();
    super.dispose();
  }

  /*
  #This is the first Approach to manage key stroke
  var _enteredTitle = "";

  // This is to store input typed by the user
  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }

*/
  DateTime? _selectedDate;
  // Creating the date picker
  void _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        DateTime.now().year - 1,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime.now(),
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  Category? _selectedCategory; //To store selected Categories

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: 'Title',
              counterText: '',
              hintText: "e.g. Groceries, Transport, etc.",
            ),
          ),

          // For the Amount and Date
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // to ensure everything is center aligned
            children: [
              Expanded(
                child: TextField(
                  controller: _amountCountroller,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                    hintText: "e.g. 100",
                    counterText: '', // hides the word counter
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(width: 16),
              // Adding Logic to the date field
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : formatter.format(_selectedDate!),
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<Category>(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem<Category>(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                // This will check b4 adding the cats
                hint: Text(
                  _selectedCategory == null
                      ? "Select Category"
                      : _selectedCategory!.name,
                ),
              ),
              // the btn to save all expenses
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountCountroller.text);
                },
                child: Text("Save Expense"),
              ),
              // Btn to close and return to the main app
              ElevatedButton(
                onPressed: () {
                  // This will close the drawer and return the context of the initial class
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
