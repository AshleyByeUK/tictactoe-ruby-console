require 'stringio'

module ConsoleClient
  class MockIO
    attr_reader :exit_called, :gets_count

    def init(*inputs)
      @inputs = inputs.flatten
      @io = StringIO.new
      @gets_count = 0
      @exit_called = false
    end

    def gets(*args)
      @io = StringIO.new(@inputs[@gets_count].to_s)
      @gets_count += 1
      @io.gets
    end

    def puts(*args)
      @io.puts
    end

    def print(*args)
      @io.puts
    end

    def system(*args)
    end

    def exit(*args)
      @exit_called = true
      Kernel.exit
    end
  end
end
