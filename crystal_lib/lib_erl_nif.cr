@[Include(
  "erl_nif.h",
  prefix: %w[enif_ ERL_NIF_ Erl],
  remove_prefix: true
)]
lib LibErlNif
end
