require 'minitest/autorun'
require_relative './expression_evaluator'

class ExpressionEvaluatorTest < Minitest::Test
    def test_parses_neg_number
        assert_equal -2, ExpressionEvaluator.parse('- 2')
    end

    def test_parses_easy_expression
        assert_equal 5, ExpressionEvaluator.parse('+ 2 3')
    end

    def test_parses_nested_expression
        assert_equal 6, ExpressionEvaluator.parse('+ 1 + 2 3')
    end

    def test_parses_negative_expression
        assert_equal 6, ExpressionEvaluator.parse('- 9 3')
    end

    def test_parses_mixed_nested_expression
        assert_equal 7, ExpressionEvaluator.parse('- 2 + 6 3')
    end

    def test_parses_negative_nested_expression
        assert_equal -1, ExpressionEvaluator.parse('- 6 - 9 4')
    end

    def test_parses_large_nested_expression
        assert_equal 800, ExpressionEvaluator.parse('- 60 - 900 40')
    end

    def test_parses_larger_nested_expression
        assert_equal 900, ExpressionEvaluator.parse('- 60 - 900 40 + 100 - 50 50')
    end

    def test_parses_long_nested_expression
        assert_equal 15, ExpressionEvaluator.parse('+ 8 - 9 6 + 1 - 4 1')
    end

    def test_parses_long_nested_alt_expression
        assert_equal 12, ExpressionEvaluator.parse('- 7 6 + 1 1 - 4 1 + 4 2')
    end

    def test_parses_super_long_nested_expression
        assert_equal -1, ExpressionEvaluator.parse('- 5 - 3 1 + 1 + 4 1 - 1 + 1 1 - 1 - 2 6')
    end    
end
