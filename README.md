# c-header-hierarchy.pl
A rather simple perl script to build a tree of all header dependencies (personal use)

# Example

```sh
[I] ⋊> ~/D/r/serenity on master ⨯ show_c_deps.pl AK/Base64.cpp                                                            02:18:25
AK/Base64.cpp
     => AK/Array.h
         => AK/Iterator.h
             => AK/Forward.h
                 => AK/Types.h
                     => AK/IterationDecision.h
                     => AK/Platform.h
                     => AK/StdLibExtras.h
                         => AK/StdLibExtraDetails.h
                         => AK/Assertions.h
                         => utility
         => AK/Span.h
             => AK/TypedTransfer.h
                 => AK/Traits.h
                     => AK/BitCast.h
                     => AK/Concepts.h
                     => AK/HashFunctions.h
                     => AK/StringHash.h
                     => string.h
     => AK/Base64.h
         => AK/ByteBuffer.h
             => AK/Error.h
                 => AK/StringView.h
                     => AK/Checked.h
                         => AK/NumericLimits.h
                     => AK/Optional.h
                         => AK/kmalloc.h
                     => AK/StringUtils.h
                 => AK/Try.h
                 => AK/Variant.h
                     => AK/TypeList.h
         => AK/String.h
             => AK/Format.h
                 => AK/CheckedFormatString.h
                     => AK/AllOf.h
                         => AK/Find.h
                     => AK/AnyOf.h
                 => AK/FixedPoint.h
                     => AK/IntegralMath.h
                         => AK/BuiltinWrappers.h
             => AK/RefPtr.h
                 => AK/Atomic.h
                 => AK/NonnullRefPtr.h
             => AK/Stream.h
                 => AK/Endian.h
             => AK/StringBuilder.h
                 => stdarg.h
             => AK/StringImpl.h
                 => AK/Badge.h
                 => AK/RefCounted.h
                     => AK/Noncopyable.h
     => AK/CharacterTypes.h
     => AK/Vector.h
         => AK/ReverseIterator.h
         => initializer_list
```
