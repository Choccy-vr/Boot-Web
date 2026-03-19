---
title: How to enter in 32 bits mode
---

<Callout title="Disclaimer">This guide is meant for people with very little experience. This isn't telling you how exactly to make a bootloader, it is teaching you the concepts associated. If you follow along and have a curious mind, this will not just teach you how to make a bootloader, but extremely important concepts in osdev.</Callout>

<Callout title="Disclaimer">This guide is valid only for Intel architecture.</Callout>

# Part 1 - Basic concepts about CPU System Management Modes

CPUs have different operating modes, which can only be accessed progressively and according to certain criteria. Most modern Intel CPUs support a total of four modes, each with different features and characteristics.

The four modes are:
- Real Mode
- Protected Mode
- Virtual 8086 Mode
- Long Mode

Let's see in the details the four modes.

## The Real Mode
Real Mode is the first mode the CPU boots into.

It is a simple 16-bit mode with strong practical limitations, but it is also the only mode from which you can completely control every single CPU operation.

### Limitations
The limitations are:
- Less than 1 MB of RAM available.
- There isn't any memory protection or virtual memory.
- There aren't security mechanisms to protect against crash or malwares.
- The default CPU operand length is only 16 bits.
- The memory addressing modes provided are more restrictive than other CPU modes.
- Accessing more than 64k requires the use of segment registers that are difficult to work with.

### Advantages
The advantages are:
- We can use BIOS drivers to control devices and handle interrupts.
- We can use an advanced collection of low level API functions provided by the BIOS.
- Memory access is really faster.

### Code example
```asm
[ORG 0x7C00]
[BITS 16]

mov si, msg

print:
    mov ah, 0x0e
    mov al, [si]
    cmp al, 0
    je done
    int 0x10
    inc si
    jmp print

done:
    jmp $

msg:
    db "Hello World!", 0

times 510-($-$$) db 0
db 0x55, 0xAA
```

#### Explanation
This example prints "Hello World!" in Real Mode.
Let's see every row what it do.

```asm
[ORG 0x7C00]    ; Offset at 0x7C00, where the program starts
[BITS 16]       ; Explain that the code is in Real Mode (isn't required to made it works)
```

```asm
mov si, msg     ; Copy in the si register the address of the phrase
```

```asm
print:              ; Function print
    mov ah, 0x0e    ; Say to the CPU that you want to print a value
    mov al, [si]    ; Load in al the value saved in the address stored in si
    cmp al, 0       ; Compare al's value to 0, if true it means that the phrase is ended
    je done         ; je - Jump if Equal, jump to done if al == 0
    int 0x10        ; If here, the phrase isn't ended. Call the interrupt and print the char
    inc si          ; Add 1 to the address saved in si (pass to next char)
    jmp print       ; Jump to print
```

```asm
done:       ; Function done
    jmp $   ; Jump forever here -> while(true) {}
```

```asm
msg:                        ; Save the first address of the phrase in msg
    db "Hello World!", 0    ; Save the text "Hello World!" with a 0 at the end.
```

```asm
times 510-($-$$) db 0   ; Add 0 until the whole file is 510 byte of size
db 0x55, 0xAA           ; Add the last 2 bytes of end program
```

## The Protected Mode
Protected Mode is the main operating mode of modern Intel processors.

This mode, also called 32-bit mode, when enabled permit to unleash the real power of the CPU. However, it will prevent really low-level calls like BIOS interrupts.

### Limitations
The limitations are:
- Very complicated initial setup.
- No direct access to hardware from userspace.
- Complex virtual memory management.
- Debugging very difficult.
- Not compatible with Real Mode code.

### Advantages
The advantages are:
- Memory isolation and protection with segmentation and paging.
- Support for 3 Privilege Levels.
- Secure Multitasking Support.
- Kernel bug protection.

### Code example
```asm
[ORG 0x1000]
[BITS 16]

CODE_SEG equ codeDescriptor - GDTStart
DATA_SEG equ dataDescriptor - GDTStart

cli
lgdt [GDTDescriptor]

mov eax, cr0
or eax, 1
mov cr0, eax

jmp CODE_SEG:startProtectedMode
jmp $

align 8
GDTStart:
    nullDescriptor:
        dd 0
        dd 0

    codeDescriptor:
        dw 0xffff
        dw 0
        db 0

        db 0b10011010

        db 0b11001111

        db 0

    dataDescriptor:
        dw 0xffff
        dw 0
        db 0

        db 0b10010010

        db 0b11001111

        db 0
GDTEnd:

GDTDescriptor:
    dw GDTEnd - GDTStart - 1
    dd GDTStart

[BITS 32]
startProtectedMode:
    jmp $
```

#### Explanation
Okay, I know, it's scary, but don't let this get you down. This code took me months to write, but now I'll explain it to you in the simplest and most complete way possible.

This program enter in Protected Mode. Yes, it doesn't do anything else.
If you try to copy the entire code, compile it, and run it, it won't work because it's not designed to run in the first-stage bootloader. I ran it in the second stage of my bootloader, so I know it works perfectly. For more information on multi-stage bootloaders, I refer you to the dedicated guide.

Below is a very detailed explanation of the program.


<img src="/public/intelModesArchitecture.png">