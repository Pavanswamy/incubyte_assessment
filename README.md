# String Calculator - Ruby on Rails

A simple yet powerful string calculator implemented as a Rails application. This project showcases the use of Ruby's string manipulation and Rails' controller actions to perform basic arithmetic operations on strings formatted numbers.

## Features

- **Basic Arithmetic:** Add numbers provided as strings, separated by commas or newlines.
- **Custom Delimiters:** Supports custom delimiters as defined in the input string.
- **Error Handling:** Detects and reports errors for negative numbers in the input.
- **Empty Input:** Returns zero for empty or null inputs.

## Installation

1. **Clone the repository:**

   ```bash
   git clone git@github.com:Pavanswamy/incubyte_assessment.git
   cd incubyte_assessment
   ```

2. **Setup the environment:**

   - Install Ruby (version in `.ruby-version` if specified or check `Gemfile`).
   - Install Rails:
     ```bash
     gem install rails
     ```
   - Install dependencies:
     ```bash
     bundle install
     ```

3. **Database Setup (if applicable):**

   ```bash
   rails db:setup
   ```

4. **Run the server:**
   ```bash
   rails server
   ```

## Usage

- **Access the Calculator:** Navigate to `http://localhost:3000` in your web browser.

- **Perform Calculations:**

  - **Simple Sum:** Enter numbers separated by commas or newlines, e.g., `1,2\n3` or `1,2`.
  - **Custom Delimiter:** Use the format `//[delimiter]\n[numbers]` to define your own delimiter, e.g., `//;\n1;2;3`.

- **Error Messages:** If you input negative numbers, an error message will be displayed.

## API

- **GET /:** Shows the index page where you can perform calculations.
- **POST /calculate:** Process the calculation from user input.

## Testing

To run the tests:

```bash
rails test test/controllers/string_calculators_controller_test.rb
rails test test/services/string_calculator_test.rb
```

The test suite covers:

- Basic addition functionality
- Error handling for negative numbers
- Custom delimiter recognition
- Handling of various input formats
