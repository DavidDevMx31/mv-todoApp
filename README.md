# MV-ToDo App for iOS

## Overview

This ToDo app allows you to manage and organize your daily tasks. You can add, edit, and delete tasks and mark them as completed.

The project is developed using SwiftUI following the MV pattern. The data is stored in memory and not persists between launches.

## Installation

1. Clone the repository: `git clone https://github.com/DavidDevMx31/mv-todoApp`
2. Open the project in Xcode.
3. Launch the simulator or connect your device.
4. Run the app.

## Usage

### Adding a task

https://github.com/DavidDevMx31/mv-todoApp/assets/67614342/cb0e1d7c-e26b-4508-aa8b-78df81ef9820

1. Launch the app
2. Tap on + icon
3. Add task data

### Delete task

https://github.com/DavidDevMx31/mv-todoApp/assets/67614342/36d6b295-65f9-4965-8fda-7307d82c78b3

1. Swipe left the row you would like to delete.
2. Tap on the trash icon.

### Mark task as done

https://github.com/DavidDevMx31/mv-todoApp/assets/67614342/0250ec3b-4e5a-44e1-b4c2-043fa9aca919

Marking a task as done can be performed in two ways:

1. Swipe left on the desired task.
2. Tap on the check icon ✅.

Or:
1. Full swipe left on the task you would like to mark as done.

### Edit list name

https://github.com/DavidDevMx31/mv-todoApp/assets/67614342/0801b40f-4cdf-45e2-93e9-a760fef3efd4

1. Tap on the pencil icon on the navigation bar.
2. Enter the new name for the list (it cannot be empty).

### Clear list

https://github.com/DavidDevMx31/mv-todoApp/assets/67614342/3da2d249-28f8-40df-9585-f35a21d009bd

1. Tap on the pencil icon on the navigation bar.
2. Tap on the 'Vaciar lista' option.
3. The app will show an alert asking for confirmation.
4. Tap 'Vaciar'.
   
## Documentation

The project structure follows the MV pattern. This is not the official name of the pattern; some refer to it as the State Pattern, while others call it the Model-View Pattern.

Although using the MVVM (Model-View-ViewModel) pattern has been recommended since the introduction of SwiftUI, it is common to feel that implementing projects under this paradigm adds unnecessary complexity. The MV pattern draws inspiration from principles used in other declarative paradigm platforms, such as React and Flutter, which have greater maturity, having appeared years before SwiftUI.

This pattern is based on the following fundamental concepts:
1. **Views are also view-models in SwiftUI**:
Due to SwiftUI views' built-in binding, they can also function as view models; therefore, it is not necessary to add extra complexity by introducing a view model for each view.
2. **Models are structs (value types)**:
Models are defined as structs, which offer inherent benefits of immutability and efficient data handling.
3. **Access to models through ObservableObject**:
Access to models is exclusively done through an ObservableObject. This serves as the gateway to information, ensuring that the information is always in a valid and consistent state. The name given to this gateway varies; some call it Store, while others use Aggregate Root or Aggregate Model.

The fundamental idea of this pattern is that the user will perform actions that generate changes or mutations in the app's state. Changes in the app's state will prompt the UI to update to reflect the most recent state of the information.

Here is a brief description of each component in the MV pattern:

- **Model (Model)**: Represents the data.
- **View (View)**: Displays the user interface and manages interaction.
- **Aggregate Root**: Encapsulates and protects the internal state of the information. As the business logic becomes more complex, we might need to split it into many Aggregate Roots, to preserve the Separation of Concerns principle. Then, we can use them together to achieve the desired functionality.

## Technologies
- SwiftUI
- Swift

## Requirements
- Minimum deploy target: iOS 16.2

## License

This repository is under the MIT license agreement. Check [LICENSE](LICENSE) for further information.

## To-do
- Add on disk storage to persist data between launches.
- Add unit tests.
- Add end-to-end tests.
- Allow to edit task data.

## Inspiration

This implementation is based on the concepts from the MV Design Pattern in iOS - Build SwiftUI Apps Apple's Way course by Mohammad Azam. You can find the course at this [link](https://www.udemy.com/share/109yMo3@Ep4Nq6ydrVww-yT9Hs9JZpS8HzBldzGi0ukOknQ2taKnxlhgO1DhGrHh4T8ayhp4/).

For further information, you can also check this [blog post](https://azamsharp.com/2022/08/09/intro-to-mv-state-pattern.html).
