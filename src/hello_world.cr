require "./erl_nif"

def func(name, arity, &block : ErlNif::Nifenv, LibC::Int, ErlNif::NifTerm* -> ErlNif::NifTerm)
  ErlNif::FuncT.new(
    name: name,
    arity: arity,
    fptr: block
  )
end

fun nif_init : ErlNif::EntryT*
  GC.init
  LibCrystalMain.__crystal_main(0, Pointer(Pointer(UInt8)).null)

  # TODO cannot remove this call?? -> segfault
  ErlNif::FuncT.new(
    name: "dummy",
    arity: 0,
    fptr: ->(env : ErlNif::Nifenv, argc : LibC::Int, argv : ErlNif::NifTerm*) {
      argv[0]
    }
  )

  hello_func = func("from_crystal", 0) do |env, argc, argv|
    string = "Hi from Crystal"
    ErlNif.make_string(env, string, ErlNif::Nifcharencoding::NifLatin1)
  end

  echo_func = func("echo", 1) do |env, argc, argv|
    argv[0]
  end

  dummy = ->(env : ErlNif::Nifenv, argc : LibC::Int, argv : ErlNif::NifTerm*) {
    argv[0]
  }

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
