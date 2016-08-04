require "./erl_nif"

fun nif_init : ErlNif::EntryT*
  GC.init
  LibCrystalMain.__crystal_main(0, Pointer(Pointer(UInt8)).null)

  from_crystal = ->(env : ErlNif::Nifenv, argc : LibC::Int, argv : ErlNif::NifTerm*) {
    string = "Hi from Crystal"
    ErlNif.make_string(env, string, ErlNif::Nifcharencoding::NifLatin1)
  }

  hello_func = ErlNif::FuncT.new(
    name: "from_crystal",
    arity: 0,
    fptr: from_crystal
  )

  funcs = [
    hello_func
  ]

  load = ->(env : ErlNif::Nifenv, priv : Void**, load_info : ErlNif::NifTerm) {
    p "LOAD"
    0
  }

  reload = ->(env : ErlNif::Nifenv, priv : Void**, load_info : ErlNif::NifTerm) {
    p "RELOAD"
    0
  }

  upgrade = ->(env : ErlNif::Nifenv, priv : Void**, old_priv : Void**, load_info : ErlNif::NifTerm) {
    p "UPGRADE"
    0
  }

  unload = ->(env : ErlNif::Nifenv, priv : Void*) {
    p "UNLOAD"
  }

  entry = ErlNif::EntryT.new(
    major: ErlNif::NIF_MAJOR_VERSION,
    minor: ErlNif::NIF_MINOR_VERSION,
    name: "Elixir.HelloWorld",
    num_of_funcs: funcs.size,
    funcs: funcs,
    reload: reload,
    upgrade: upgrade,
    unload: unload,
    vm_variant: "beam.vanilla",
    options: ErlNif::NIF_DIRTY_NIF_OPTION
  )

  pointerof(entry)
end
