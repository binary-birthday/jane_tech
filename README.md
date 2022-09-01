# Code Challenge for Jane Technologies

## Design decisions

After reading the instructions for this coding challenge, I decided to use one of the languages preferred by Jane.
I narrowed my choice to two options, JavaScript and Ruby.

In favor of JavaScript was that I have more experience with JavaScript than I do with Ruby. In Ruby's favor was it's ergonmics. Ergonomics won out.

After makiung that decision I decided on using Ruby 3.1.2 and writing my solution in the object oriented programming style.

In planning my approach to this problem I first broke the instructions down into psuedo code. Which, with the exception of the input and File IO code in main.rb, then became methods in my League class in league.rb.

I then broke up each method into smaller methods so that each became simpler to reason about, refactor and debug. The guardrails from the Ruby Style Guide enforced by Rubocop were a big help here.

I implemented a basic test using MiniTest to make certain that my implemented solution was outputting the expected output given the sample input provided.

## Instructions

This program is written in Ruby. You will require ruby on your local machine to run this code.
The Ruby version I used for development was 3.1.2

To run the program, in your terminal type:

` ruby main.rb`

This will prompt you to enter the name and path of the .txt file containing the league results you wish the program to process.
If the file is in the same directory as main.rb there is no need to provide the file path.

The program will process your file and output to your terminal using stdout the weekly Matchday top three standings for your league results.

To run the test, in your terminal type:

`ruby test_output.rb`
