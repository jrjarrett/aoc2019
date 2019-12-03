input = [1,9,10,3,2,3,11,0,99,30,40,50]
counter = 1
[pc | memory] = Enum.chunk_every(input,4 * counter)
[opcode | rest] = pc
[op1 | rest] = rest
[op2 | rest] = rest
[memloc | rest] = rest
memspace = List.replace_at(input, memloc, Enum.at(input,op1) + Enum.at(input,op2))