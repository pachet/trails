
module ActiveModel

	module AttributeMethods

		def self.included includer
			includer.extend ClassMethods
		end

		class Assigner

			ATTRIBUTE_KEY = "attribute"

			def initialize target
				@target = target
			end

			def affix hash
				affixes.push hash
			end

			def prefix string
				prefixes.push string
			end

			def suffix string
				suffixes.push string
			end

			def affixes
				settings :affix
			end

			def prefixes
				settings :prefix
			end

			def suffixes
				settings :suffix
			end

			def settings key
				@settings ||= Hash.new
				@settings[key] ||= Array.new
			end

			def assign attribute
				assign_affixes attribute
				assign_prefixes attribute
				assign_suffixes attribute
			end

			def assign_affixes attribute
				affixes.each do |affix|
					assign_affix affix, attribute
				end
			end

			def assign_affix affix, attribute
				prefix = affix[:prefix]
				suffix = affix[:suffix]
				generic_method = "#{prefix}#{ATTRIBUTE_KEY}#{suffix}"
				attribute_method = "#{prefix}#{attribute}#{suffix}"

				assign_method generic_method, attribute_method, attribute
			end

			def assign_prefixes attribute
				prefixes.each do |prefix|
					assign_prefix prefix, attribute
				end
			end

			def assign_prefix prefix, attribute
				generic_method = "#{prefix}#{ATTRIBUTE_KEY}"
				attribute_method = "#{prefix}#{attribute}"

				assign_method generic_method, attribute_method, attribute
			end

			def assign_suffixes attribute
				suffixes.each do |suffix|
					assign_suffix suffix, attribute
				end
			end

			def assign_suffix suffix, attribute
				generic_method = "#{ATTRIBUTE_KEY}#{suffix}"
				attribute_method = "#{attribute}#{suffix}"

				assign_method generic_method, attribute_method, attribute
			end

			def assign_method generic_method, attribute_method, attribute
				unless self.respond_to? generic_method then
					@target.send :define_method, generic_method do |attr|
						# Noop. This will be overridden as needed by
						# classes that implement this interface.
					end
				end

				@target.send :define_method, attribute_method do
					send generic_method, attribute
				end
			end

		end

		module ClassMethods

			def attribute_method_affix hash
				attribute_method_assigner.affix hash
			end

			def attribute_method_prefix prefix
				attribute_method_assigner.prefix prefix
			end

			def attribute_method_suffix suffix
				attribute_method_assigner.suffix suffix
			end

			def define_attribute_methods attribute
				attribute_method_assigner.assign attribute
			end

			def attribute_method_assigner
				@attribute_method_assigner ||= Assigner.new self
			end

		end

	end

end
