require "./erl_nif"

fun nif_init : ErlNif::EntryT*
  GC.init
  LibCrystalMain.__crystal_main(0, Pointer(Pointer(UInt8)).null)

  from_crystal = ->(env : ErlNif::Nifenv, argc : LibC::Int, argv : ErlNif::NifTerm*) {
    string = "Hi from Crystal"
    ErlNif.make_string(env, string, ErlNif::Nifcharencoding::NifLatin1)
  }

  echo_crystal = ->(env : ErlNif::Nifenv, argc : LibC::Int, argv : ErlNif::NifTerm*) {
    argv[0]
  }

  hello_func = ErlNif::FuncT.new(
    name: "from_crystal",
    arity: 0,
    fptr: from_crystal
  )

  echo_func = ErlNif::FuncT.new(
    name: "echo",
    arity: 1,
    fptr: echo_crystal
  )

  funcs = [
    hello_func,
    echo_func
  ]

  entry = ErlNif::EntryT.new(
    major: ErlNif::NIF_MAJOR_VERSION,
    minor: ErlNif::NIF_MINOR_VERSION,
    name: "Elixir.HelloWorld",
    num_of_funcs: funcs.size,
    funcs: funcs,
    vm_variant: "beam.vanilla",
    options: ErlNif::NIF_DIRTY_NIF_OPTION
  )

  pointerof(entry)
end
