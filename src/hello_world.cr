require "./erl_nif"

fun nif_init : ErlNif::EntryT*
  GC.init
  LibCrystalMain.__crystal_main(0, Pointer(Pointer(UInt8)).null)

  entry = ErlNif::EntryT.new(
    major: ErlNif::NIF_MAJOR_VERSION,
    minor: ErlNif::NIF_MINOR_VERSION,
    name: "Elixir.HelloWorld",
    num_of_funcs: 0,
    funcs: [] of ErlNif::Niffunc,
    vm_variant: "beam.vanilla",
    options: ErlNif::NIF_DIRTY_NIF_OPTION
  )

  p entry.vm_variant

  pointerof(entry)
end
