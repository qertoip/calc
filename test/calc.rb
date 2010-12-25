require File.expand_path( "../../lib/calc", __FILE__ )
require 'test/unit'

class CalcTest < Test::Unit::TestCase

  # .evaluate()

  def test_evaluate_returns_correct_value_when_given_valid_expression
    assert_equal( 2, Calc.evaluate( "1+1" ) )
    assert_equal( 6, Calc.evaluate( " 3  *  2 " ) )
    assert_equal( 10, Calc.evaluate( "5 * ( 1 + 1 )" ) )
    assert_equal( 25, Calc.evaluate( "5 ** ( 1 + 1 )" ) )
    assert_equal( 0, Calc.evaluate( "5 ** ( 1 + 1 ) / 5 - 5" ) )
    assert_in_delta( 0.5, Calc.evaluate( "1.0/2" ), 0.0000001 )
  end

  def test_evaluate_returns_nil_when_given_nil
    assert_nil( Calc.evaluate( nil ) )
  end

  def test_evaluate_returns_expression_verbatim_when_given_blank_expression
    blank_expression = " \r  \n "
    assert_equal( blank_expression, Calc.evaluate( blank_expression ) )
    assert_equal( "", Calc.evaluate( "" ) )
  end

  def test_evaluate_returns_expression_verbatim_when_given_invalid_expression
    invalid_expression_1 = "2//3"
    assert_equal( invalid_expression_1, Calc.evaluate( invalid_expression_1 ) )
    invalid_expression_2 = "2 * (5 + 4"
    assert_equal( invalid_expression_2, Calc.evaluate( invalid_expression_2 ) )
  end

  def test_evaluate_is_code_injection_proof
    payload_1 = "raise 'evil'"
    assert_nothing_raised do
      Calc.evaluate( payload_1 )
    end

    payload_2 = "binding"
    assert_equal( "binding", Calc.evaluate( payload_2 ) )  # returned verbatim - not evaled

    payload_3 = "__FILE__"
    assert_equal( "__FILE__", Calc.evaluate( payload_3 ) )
  end

end