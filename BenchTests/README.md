# Bench App Tests

This directory contains the test suite for the Bench workout app. The tests are divided into two main categories:

## Unit Tests (BenchTests)

Located in `BenchTests.swift`, these tests cover the core functionality of the `WorkoutViewModel`:

- Initial state validation
- Workout flow (start, complete set)
- Timer functionality
- Summary generation
- State management

### Running Unit Tests

1. Open the project in Xcode
2. Select the "BenchTests" scheme
3. Press ⌘U or go to Product > Test

## UI Tests (BenchUITests)

Located in `BenchUITests.swift`, these tests verify the user interface and interaction flows:

- Complete workout flow
- Navigation between views
- Input validation
- Timer display
- App launch performance

### Running UI Tests

1. Open the project in Xcode
2. Select the "BenchUITests" scheme
3. Press ⌘U or go to Product > Test

## Test Coverage

The test suite covers:

- ✅ Workout initialization
- ✅ Set completion
- ✅ Rest timer functionality
- ✅ User input handling
- ✅ Navigation flows
- ✅ Performance metrics

## Adding New Tests

When adding new tests:

1. Unit tests: Add new test methods to `BenchTests.swift`
2. UI tests: Add new test methods to `BenchUITests.swift`
3. Follow the existing naming convention: `test[Feature][Scenario]()`
4. Include assertions for all critical functionality
5. Add appropriate comments explaining the test flow