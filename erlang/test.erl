-module(test).
-export([start/0]).
-compile(export_all).


%Rectangle = {rectangle, 10, 5}.
%Circle = {circle, 2.4}.

main(_) -> main().

main() -> 
    io:format("Hello ����̸�~n").

start() ->
    Rectangle = {rectangle, 10, 5},
    Circle = {circle, 2.4},
    {Rectangle, Circle}.

func() -> "������".
