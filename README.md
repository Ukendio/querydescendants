Type safe version of querydescendants using luau's user defined type functions.
Requires the new solver to be enabled with the correct fflags.

Parses blocks to ensure that properties are valid for the selected instances and gives proper error messages when it is not the case. It also gives a strongly typed path for the ancestors defined using preceding operators.

<img width="1241" height="317" alt="image" src="https://github.com/user-attachments/assets/3291b764-492b-4684-813c-bdd684ee119c" />

API will be kept deliberately barebones and purposeful. You can build upon this
using any functions you want but changes to the interface will not accepted.
