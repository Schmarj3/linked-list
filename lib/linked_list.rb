
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
    def initialize
      @head = nil # keep the head private. Not accessible outside this class
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def add_first(value)
      next_node = nil
      if @head.nil?
        @head = Node.new(value, next_node)
      else
        next_node = @head
        @head = Node.new(value, next_node)
      end
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      node = @head
      has_value = false

      until node.nil? || has_value == true
        has_value = true if node.data == value
        node = node.next
      end

      return has_value
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head.nil?
      node = @head
      max_value = -1 / 0.0

      while node
        max_value = node.data if node.data > max_value
        node = node.next
      end

      return max_value
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: ?
    # Space Complexity: ?
    def find_min
      return nil if @head.nil?
      node = @head
      min_value = 1 / 0.0

      while node
        min_value = node.data if node.data < min_value
        node = node.next
      end

      return min_value
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_first
      @head ? @head.data : nil
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n + 1) => O(n)
    # Space Complexity: O(1)
    def add_last(value)
      node = @head

      if @head.nil?
        @head = Node.new(value)
      else
        node = node.next until node.next.nil?
        node.next = Node.new(value)
      end
    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      node = @head
      length = 0

      while node
        node = node.next
        length += 1
      end

      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if @head.nil?

      node = @head
      count_index = 0

      until node.next.nil? || count_index == index
        node = node.next
        count_index += 1
      end

      return node.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      node = @head
      until node.nil?
        p node.data
        node = node.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      node = @head
      prev_node = nil
      new_next_node = nil

      if node.nil?
        return nil
      elsif node.data == value
        @head = @head.next
      else
        until node.nil?
          break if node.next.data == value
          node = node.next
        end
        prev_node = node
        prev_node.next = node.next.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def reverse
      node = @head
      new_list = nil
      add_first_node = nil

      while node
        add_first_node = node
        node = node.next
  
        if new_list.nil?
          add_first_node.next = nil
          new_list = add_first_node
        else
          add_first_node.next = new_list
          new_list = add_first_node
        end
      end
      @head = new_list
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_last
      node = @head
      if node.nil?
        return nil
      else
        until node.next.nil?
          node = node.next
        end
        return node.data
      end
    end
  
    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def find_middle_value
      raise NotImplementedError
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: ?
    # Space Complexity: ?
    def find_nth_from_end(n)
      raise NotImplementedError
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: ?
    # Space Complexity: ?
    def has_cycle
      raise NotImplementedError
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: ?
    # Space Complexity: ?
    def insert_ascending(value)
      raise NotImplementedError
    end

    # Helper method for tests
    # Creates a cycle in the linked list for testing purposes
    # Assumes the linked list has at least one node
    def create_cycle
      return if @head == nil # don't do anything if the linked list is empty

      # navigate to last node
      current = @head
      while current.next != nil
          current = current.next
      end

      current.next = @head # make the last node link to first node
    end
end

puts "*" * 20
puts "CREATE"
puts "*" * 20
list = LinkedList.new
list.add_first(9)
list.add_first(10)
list.add_first(4)
list.add_first(3)
list.add_first(2)
list.visit

# puts "*" * 20
# puts "DELETE 2"
# puts "*" * 20
# list.delete(2)
# list.visit

# puts "*" * 20
# puts "DELETE 10"
# puts "*" * 20
# list.delete(10)
# list.visit

# puts "*" * 20
# puts "DELETE 4"
# puts "*" * 20
# list.delete(4)
# list.visit


puts "*" * 20
puts "REVERSE"
puts "*" * 20
p list.reverse
