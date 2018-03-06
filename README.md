# button-code-challenge

### Usage
See below to run test suite
1. In terminal you can enter `irb` to bring up a ruby shell to test the output. You should have Ruby installed, 2.3 or above if possible.
1. You can enter `require './expression_evaluator.rb'` and you should see `true`
1. Call the method `ExpressionEvaluator.parse(string)`

### Tests
1. `ruby expression_evaluator_test.rb` to run in root
1. Tests written in `expression_evaluator_test.rb`
1. Add more to satisfy other test cases

## Approach

Hi guys, here's my Button Software Eng. Intern Code Challenge Submission

[Button Challenge][https://www.usebutton.com/developers/2018-eng-intern-coding-challenge/]

At first glance the challenge seemed relatively straight forward. After mulling it over for a while, I realized that, no it was pretty tricky and there's a ton of different approaches you could take to arrive at a solution.

Here's a few things that were assumed along the way:

* Order of operations must be followed, therefore addition needs to happen before subtraction
* so `- 1 - 2 3` would actually be written as `-1 +( 2 - 3 )`
* `- 1 + 3 3` would be written as `-1 +( 3 + 3 )` and so on

So with this, a pattern emerged. If the operator was `-` then the next number in the string was negative but ONLY IF that number was followed by an operator. If it was followed by a number, then that number was then negative, but the number preceeding it was still positive.

We can see than in the second example where `- 1 - 2 3` would be written as `-1 +( 2 - 3 )`. The first `1` is then negative but the following `2` is positive because it is preceded by a `-` and followed by a `3`.

My brute force implementation looked like this:

```ruby
def self.parse(string)
    sum = 0
    char_array = string.split
    char_array.each_with_index do |char, i|
      sum += char.to_i
      next unless char == '-' && char_array[i + 2]
      if char_array[i + 2].to_i == 0
        char_array[i + 1] = char + char_array[i + 1]
      else
        char_array[i + 2] = char + char_array[i + 2]
      end
    end
    sum
    end
end
```

As you can see it's pretty verbose so I tried a little something different thinking that since it's a pattern, Regex would be able to help pick that out rather easily.

I ended up using a regex implementation to parse "complex" expressions("- 2 4") vs "simple" expressions("- 3", "+ 2 3") and then added those two sums together as a return value. See expression_evaluator.rb for the most recent and look at the history for changes made.

Anyway, I would be super curious to see the other approaches because I'm sure there's a more efficient way. Stay tuned for a JavaScript implementation. I want to see if It will change my approach to the problem at all.