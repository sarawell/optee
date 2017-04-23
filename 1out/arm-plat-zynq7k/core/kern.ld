OUTPUT_FORMAT(elf32-littlearm)
OUTPUT_ARCH(arm)
ENTRY(_start)
SECTIONS
{
 . = (0x3E000000);
 .text : {
  __text_start = .;
  KEEP(*(.text.boot.vectab1))
  KEEP(*(.text.boot.vectab2))
  KEEP(*(.text.boot))
  . = ALIGN(8);
  __initcall_start = .;
  KEEP(*(.initcall1))
  KEEP(*(.initcall2))
  KEEP(*(.initcall3))
  KEEP(*(.initcall4))
  __initcall_end = .;
  *(.text .text.*)
  *(.sram.text.glue_7* .gnu.linkonce.t.*)
  . = ALIGN(8);
  __text_end = .;
 }
 .rodata : ALIGN(8) {
  __rodata_start = .;
  *(.gnu.linkonce.r.*)
  *(.rodata .rodata.*)
  . = ALIGN(8);
  __start_ta_head_section = . ;
  KEEP(*(ta_head_section))
  __stop_ta_head_section = . ;
  . = ALIGN(8);
  __start_phys_mem_map_section = . ;
  KEEP(*(phys_mem_map_section))
  __end_phys_mem_map_section = . ;
  . = ALIGN(8);
  __rodata_end = .;
 }
 .interp : { *(.interp) }
 .hash : { *(.hash) }
 .dynsym : { *(.dynsym) }
 .dynstr : { *(.dynstr) }
 .rel.text : { *(.rel.text) *(.rel.gnu.linkonce.t*) }
 .rela.text : { *(.rela.text) *(.rela.gnu.linkonce.t*) }
 .rel.data : { *(.rel.data) *(.rel.gnu.linkonce.d*) }
 .rela.data : { *(.rela.data) *(.rela.gnu.linkonce.d*) }
 .rel.rodata : { *(.rel.rodata) *(.rel.gnu.linkonce.r*) }
 .rela.rodata : { *(.rela.rodata) *(.rela.gnu.linkonce.r*) }
 .rel.got : { *(.rel.got) }
 .rela.got : { *(.rela.got) }
 .rel.ctors : { *(.rel.ctors) }
 .rela.ctors : { *(.rela.ctors) }
 .rel.dtors : { *(.rel.dtors) }
 .rela.dtors : { *(.rela.dtors) }
 .rel.init : { *(.rel.init) }
 .rela.init : { *(.rela.init) }
 .rel.fini : { *(.rel.fini) }
 .rela.fini : { *(.rela.fini) }
 .rel.bss : { *(.rel.bss) }
 .rela.bss : { *(.rela.bss) }
 .rel.plt : { *(.rel.plt) }
 .rela.plt : { *(.rela.plt) }
 .init : { *(.init) } =0x9090
 .plt : { *(.plt) }
 .ARM.exidx : {
  __exidx_start = .;
  *(.ARM.exidx* .gnu.linkonce.armexidx.*)
  __exidx_end = .;
 }
 .ARM.extab : {
  __extab_start = .;
  *(.ARM.extab*)
  __extab_end = .;
 }
 .data : ALIGN(8) {
  __data_start_rom = .;
  __early_bss_start = .;
  *(.early_bss .early_bss.*)
  . = ALIGN(8);
  __early_bss_end = .;
  __data_start = .;
  *(.data .data.* .gnu.linkonce.d.*)
  . = ALIGN(8);
 }
 .ctors : ALIGN(8) {
  __ctor_list = .;
  KEEP(*(.ctors .ctors.* .init_array .init_array.*))
  __ctor_end = .;
 }
 .dtors : ALIGN(8) {
  __dtor_list = .;
  KEEP(*(.dtors .dtors.* .fini_array .fini_array.*))
  __dtor_end = .;
 }
 .got : { *(.got.plt) *(.got) }
 .dynamic : { *(.dynamic) }
 __data_end = .;
 .bss : ALIGN(8) {
  __bss_start = .;
  *(.bss .bss.*)
  *(.gnu.linkonce.b.*)
  *(COMMON)
  . = ALIGN(8);
  __bss_end = .;
 }
 .heap1 (NOLOAD) : {
  __heap1_start = .;
  . += 65536;
  . = ALIGN(16 * 1024);
  __heap1_end = .;
 }
 .nozi (NOLOAD) : ALIGN(16 * 1024) {
  __nozi_start = .;
  KEEP(*(.nozi .nozi.*))
  . = ALIGN(16);
  __nozi_end = .;
  __nozi_stack_start = .;
  KEEP(*(.nozi_stack))
  . = ALIGN(8);
  __nozi_stack_end = .;
 }
 __end = .;
 __init_size = __data_end - (0x3E000000);
 __init_mem_usage = __end - (0x3E000000);
 . = (0x3E000000) + (1024 * 1024);
 _end_of_ram = .;
 /DISCARD/ : {
  *(.comment .note .eh_frame)
  *(__keep_meta_vars*)
 }
}
