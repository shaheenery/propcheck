defmodule PropCheck.StackTypeTest do
  use ExUnit.Case
  use PropCheck
  alias PropCheck.Test.Stack

  # Generator for Stacks
  def stack(gen), do: list(gen)

  property "pop(push) = original" do
    forall [s, x] <- [stack(integer()), integer()] do
      {_y, t} = s |> Stack.push(x) |> Stack.pop
      s == t
    end
  end

  property "push make a stack bigger" do
    forall [s, x] <- [stack(integer()), integer()] do
      (Stack.size(s) + 1) == Stack.size(s |> Stack.push(x))
    end
  end

end
