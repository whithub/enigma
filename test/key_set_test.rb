gem 'minitest'        #'~> 5.2'
require 'minitest/autorun'
require_relative '../lib/key_set'

class KeySetTest < MiniTest::Test

  def test_it_exists
    assert KeySet
  end

  # def test_it_takes_a_given_key
  #
  # end

  def test_it_generates_a_new_random_key_if_one_is_not_provided
    key = KeySet.new
    key.generate
    assert_equal 4, key.offsets.length
    key.offsets.each do |o|
      assert o.is_a?(Fixnum)
    end
  end

  def test_it_parses_key_string_into_offsets
    assert_equal [41, 15, 52, 21], KeySet.new("41521").offsets
  end

  # def test_generated_key_is_five_digits
  #   key = Key.new
  #   assert_equal 5, key.generate_key.length
  # end
  # #
  # # def test_rotations_array_starts_off_empty
  # #   assert_equal 0, Key.new
  # #
  # #   # key = Key.new
  # #   # assert_equal 0, key.rotations.count
  # # end
  #
  # def test_rotations_array_is_four
  #   key = Key.new
  #   key.generate_key
  #   assert_equal 4, key.rotations.length
  # end
  #
  # def test_first_two_digits_of_generated_key_are_the_A_rotation
  #   key = Key.new
  #   key.generate_key
  #   key.rotations
  #   assert_equal "a" => @rotations[0], key.key_hash
  # end
  #
  # def test_second_and_third_digits_of_generated_key_are_the_B_rotation
  #
  # end
  #
  # def test_third_and_fourth_digits_of_generated_key_are_the_C_rotation
  #
  # end
  #
  # def test_fourth_and_fifth_digits_of_generated_key_are_the_D_rotation
  #
  # end
end