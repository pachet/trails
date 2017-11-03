
require 'test/unit'
require_relative '../../lib/activemodel/attribute-methods'

class TestAttributeMethods < Test::Unit::TestCase

	include ActiveModel::AttributeMethods

	attribute_method_affix prefix: 'foo_', suffix: '_baz'
	attribute_method_prefix 'prefix_'
	attribute_method_suffix '_suffix'

	define_attribute_methods :bar

	attr_accessor :bar

	def attributes
		{ 'bar' => @bar }
	end

	def test_attribute_method_affix
		foo_bar_baz
	end

	def test_attribute_method_prefix
		prefix_bar
	end

	def test_attribute_method_suffix
		bar_suffix
	end

	private

	def foo_attribute_baz attribute
		assert_equal attribute, :bar
	end

	def prefix_attribute attribute
		assert_equal attribute, :bar
	end

	def attribute_suffix attribute
		assert_equal attribute, :bar
	end

end
