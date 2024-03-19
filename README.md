This app just demonstrates what I think is a bug.
If you put buttons in a ForEach inside an HStack inside a form, and you don't format them, then all buttons behave as one.

3/18/2024
Update!
This is not a bug, but a feature.
The solution is to modify the buttons with .buttonStyle(.plain)
Read more about it on this [Dev Post](https://dev.to/montyharper/swiftui-row-of-buttons-acting-as-one-43lk).
