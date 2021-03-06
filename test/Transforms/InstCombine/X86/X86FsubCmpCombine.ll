; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

; The test checks the folding of cmp(sub(a,b),0) into cmp(a,b).

define i8 @sub_compare_foldingPD128_safe(<2 x double> %a, <2 x double> %b){
; CHECK-LABEL: @sub_compare_foldingPD128_safe(
; CHECK-NEXT:    [[SUB_SAFE:%.*]] = fsub <2 x double> [[A:%.*]], [[B:%.*]]
; CHECK-NEXT:    [[T0:%.*]] = call <2 x i1> @llvm.x86.avx512.mask.cmp.pd.128(<2 x double> [[SUB_SAFE]], <2 x double> zeroinitializer, i32 5)
; CHECK-NEXT:    [[T1:%.*]] = shufflevector <2 x i1> [[T0]], <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
; CHECK-NEXT:    [[T2:%.*]] = bitcast <8 x i1> [[T1]] to i8
; CHECK-NEXT:    ret i8 [[T2]]
;
  %sub.safe = fsub <2 x double> %a, %b
  %t0 = call <2 x i1> @llvm.x86.avx512.mask.cmp.pd.128(<2 x double> %sub.safe, <2 x double> zeroinitializer, i32 5)
  %t1 = shufflevector <2 x i1> %t0, <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
  %t2 = bitcast <8 x i1> %t1 to i8
  ret i8 %t2
}

define i8 @sub_compare_foldingPD128(<2 x double> %a, <2 x double> %b){
; CHECK-LABEL: @sub_compare_foldingPD128(
; CHECK-NEXT:    [[T0:%.*]] = call <2 x i1> @llvm.x86.avx512.mask.cmp.pd.128(<2 x double> [[A:%.*]], <2 x double> [[B:%.*]], i32 5)
; CHECK-NEXT:    [[T1:%.*]] = shufflevector <2 x i1> [[T0]], <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
; CHECK-NEXT:    [[T2:%.*]] = bitcast <8 x i1> [[T1]] to i8
; CHECK-NEXT:    ret i8 [[T2]]
;
  %sub.i = fsub ninf <2 x double> %a, %b
  %t0 = call <2 x i1> @llvm.x86.avx512.mask.cmp.pd.128(<2 x double> %sub.i, <2 x double> zeroinitializer, i32 5)
  %t1 = shufflevector <2 x i1> %t0, <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
  %t2 = bitcast <8 x i1> %t1 to i8
  ret i8 %t2
}

define i8 @sub_compare_foldingPD128_undef_elt(<2 x double> %a, <2 x double> %b){
; CHECK-LABEL: @sub_compare_foldingPD128_undef_elt(
; CHECK-NEXT:    [[T0:%.*]] = call <2 x i1> @llvm.x86.avx512.mask.cmp.pd.128(<2 x double> [[A:%.*]], <2 x double> [[B:%.*]], i32 5)
; CHECK-NEXT:    [[T1:%.*]] = shufflevector <2 x i1> [[T0]], <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
; CHECK-NEXT:    [[T2:%.*]] = bitcast <8 x i1> [[T1]] to i8
; CHECK-NEXT:    ret i8 [[T2]]
;
  %sub.i = fsub ninf <2 x double> %a, %b
  %t0 = call <2 x i1> @llvm.x86.avx512.mask.cmp.pd.128(<2 x double> %sub.i, <2 x double> <double 0.0, double undef>, i32 5)
  %t1 = shufflevector <2 x i1> %t0, <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
  %t2 = bitcast <8 x i1> %t1 to i8
  ret i8 %t2
}

define i8 @sub_compare_foldingPD256(<4 x double> %a, <4 x double> %b){
; CHECK-LABEL: @sub_compare_foldingPD256(
; CHECK-NEXT:    [[T0:%.*]] = call <4 x i1> @llvm.x86.avx512.mask.cmp.pd.256(<4 x double> [[A:%.*]], <4 x double> [[B:%.*]], i32 5)
; CHECK-NEXT:    [[T1:%.*]] = shufflevector <4 x i1> [[T0]], <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[T2:%.*]] = bitcast <8 x i1> [[T1]] to i8
; CHECK-NEXT:    ret i8 [[T2]]
;
  %sub.i1 = fsub ninf <4 x double> %a, %b
  %t0 = call <4 x i1> @llvm.x86.avx512.mask.cmp.pd.256(<4 x double> %sub.i1, <4 x double> zeroinitializer, i32 5)
  %t1 = shufflevector <4 x i1> %t0, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %t2 = bitcast <8 x i1> %t1 to i8
  ret i8 %t2
}

define i8 @sub_compare_foldingPD512(<8 x double> %a, <8 x double> %b){
; CHECK-LABEL: @sub_compare_foldingPD512(
; CHECK-NEXT:    [[T0:%.*]] = call <8 x i1> @llvm.x86.avx512.mask.cmp.pd.512(<8 x double> [[A:%.*]], <8 x double> [[B:%.*]], i32 11, i32 4)
; CHECK-NEXT:    [[T1:%.*]] = bitcast <8 x i1> [[T0]] to i8
; CHECK-NEXT:    ret i8 [[T1]]
;
  %sub.i2 = fsub ninf <8 x double> %a, %b
  %t0 = call <8 x i1> @llvm.x86.avx512.mask.cmp.pd.512(<8 x double> %sub.i2, <8 x double> zeroinitializer, i32 11, i32 4)
  %t1 = bitcast <8 x i1> %t0 to i8
  ret i8 %t1
}

define i8 @sub_compare_foldingPS128(<4 x float> %a, <4 x float> %b){
; CHECK-LABEL: @sub_compare_foldingPS128(
; CHECK-NEXT:    [[T0:%.*]] = call <4 x i1> @llvm.x86.avx512.mask.cmp.ps.128(<4 x float> [[A:%.*]], <4 x float> [[B:%.*]], i32 12)
; CHECK-NEXT:    [[T1:%.*]] = shufflevector <4 x i1> [[T0]], <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[T2:%.*]] = bitcast <8 x i1> [[T1]] to i8
; CHECK-NEXT:    ret i8 [[T2]]
;
  %sub.i3 = fsub ninf <4 x float> %a, %b
  %t0 = call <4 x i1> @llvm.x86.avx512.mask.cmp.ps.128(<4 x float> %sub.i3, <4 x float> zeroinitializer, i32 12)
  %t1 = shufflevector <4 x i1> %t0, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %t2 = bitcast <8 x i1> %t1 to i8
  ret i8 %t2
}

define i8 @sub_compare_foldingPS256(<8 x float> %a, <8 x float> %b){
; CHECK-LABEL: @sub_compare_foldingPS256(
; CHECK-NEXT:    [[T0:%.*]] = call <8 x i1> @llvm.x86.avx512.mask.cmp.ps.256(<8 x float> [[A:%.*]], <8 x float> [[B:%.*]], i32 5)
; CHECK-NEXT:    [[T1:%.*]] = bitcast <8 x i1> [[T0]] to i8
; CHECK-NEXT:    ret i8 [[T1]]
;
  %sub.i4 = fsub ninf <8 x float> %a, %b
  %t0 = call <8 x i1> @llvm.x86.avx512.mask.cmp.ps.256(<8 x float> %sub.i4, <8 x float> zeroinitializer, i32 5)
  %t1 = bitcast <8 x i1> %t0 to i8
  ret i8 %t1
}

define i16 @sub_compare_foldingPS512(<16 x float> %a, <16 x float> %b){
; CHECK-LABEL: @sub_compare_foldingPS512(
; CHECK-NEXT:    [[T0:%.*]] = call <16 x i1> @llvm.x86.avx512.mask.cmp.ps.512(<16 x float> [[A:%.*]], <16 x float> [[B:%.*]], i32 11, i32 4)
; CHECK-NEXT:    [[T1:%.*]] = bitcast <16 x i1> [[T0]] to i16
; CHECK-NEXT:    ret i16 [[T1]]
;
  %sub.i5 = fsub ninf <16 x float> %a, %b
  %t0 = call <16 x i1> @llvm.x86.avx512.mask.cmp.ps.512(<16 x float> %sub.i5, <16 x float> zeroinitializer, i32 11, i32 4)
  %t1 = bitcast <16 x i1> %t0 to i16
  ret i16 %t1
}

define i8 @sub_compare_folding_swapPD128(<2 x double> %a, <2 x double> %b){
; CHECK-LABEL: @sub_compare_folding_swapPD128(
; CHECK-NEXT:    [[T0:%.*]] = call <2 x i1> @llvm.x86.avx512.mask.cmp.pd.128(<2 x double> [[B:%.*]], <2 x double> [[A:%.*]], i32 5)
; CHECK-NEXT:    [[T1:%.*]] = shufflevector <2 x i1> [[T0]], <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
; CHECK-NEXT:    [[T2:%.*]] = bitcast <8 x i1> [[T1]] to i8
; CHECK-NEXT:    ret i8 [[T2]]
;
  %sub.i = fsub ninf <2 x double> %a, %b
  %t0 = call <2 x i1> @llvm.x86.avx512.mask.cmp.pd.128(<2 x double> zeroinitializer, <2 x double> %sub.i, i32 5)
  %t1 = shufflevector <2 x i1> %t0, <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
  %t2 = bitcast <8 x i1> %t1 to i8
  ret i8 %t2
}

define i8 @sub_compare_folding_swapPD256(<4 x double> %a, <4 x double> %b){
; CHECK-LABEL: @sub_compare_folding_swapPD256(
; CHECK-NEXT:    [[T0:%.*]] = call <4 x i1> @llvm.x86.avx512.mask.cmp.pd.256(<4 x double> [[B:%.*]], <4 x double> [[A:%.*]], i32 5)
; CHECK-NEXT:    [[T1:%.*]] = shufflevector <4 x i1> [[T0]], <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[T2:%.*]] = bitcast <8 x i1> [[T1]] to i8
; CHECK-NEXT:    ret i8 [[T2]]
;
  %sub.i = fsub ninf <4 x double> %a, %b
  %t0 = call <4 x i1> @llvm.x86.avx512.mask.cmp.pd.256(<4 x double> zeroinitializer, <4 x double> %sub.i, i32 5)
  %t1 = shufflevector <4 x i1> %t0, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %t2 = bitcast <8 x i1> %t1 to i8
  ret i8 %t2
}

define i8 @sub_compare_folding_swapPD256_undef(<4 x double> %a, <4 x double> %b) {
; CHECK-LABEL: @sub_compare_folding_swapPD256_undef(
; CHECK-NEXT:    [[TMP:%.*]] = call <4 x i1> @llvm.x86.avx512.mask.cmp.pd.256(<4 x double> undef, <4 x double> zeroinitializer, i32 5)
; CHECK-NEXT:    [[T0:%.*]] = shufflevector <4 x i1> [[TMP]], <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[T1:%.*]] = bitcast <8 x i1> [[T0]] to i8
; CHECK-NEXT:    ret i8 [[T1]]
;
  %sub.i1 = fsub ninf <4 x double> undef, undef
  %tmp = call <4 x i1> @llvm.x86.avx512.mask.cmp.pd.256(<4 x double> %sub.i1, <4 x double> zeroinitializer, i32 5)
  %t0 = shufflevector <4 x i1> %tmp, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %t1 = bitcast <8 x i1> %t0 to i8
  ret i8 %t1
}

define i8 @sub_compare_folding_swapPD512(<8 x double> %a, <8 x double> %b){
; CHECK-LABEL: @sub_compare_folding_swapPD512(
; CHECK-NEXT:    [[T0:%.*]] = call <8 x i1> @llvm.x86.avx512.mask.cmp.pd.512(<8 x double> [[B:%.*]], <8 x double> [[A:%.*]], i32 11, i32 4)
; CHECK-NEXT:    [[T1:%.*]] = bitcast <8 x i1> [[T0]] to i8
; CHECK-NEXT:    ret i8 [[T1]]
;
  %sub.i = fsub ninf <8 x double> %a, %b
  %t0 = call <8 x i1> @llvm.x86.avx512.mask.cmp.pd.512(<8 x double> zeroinitializer, <8 x double> %sub.i, i32 11, i32 4)
  %t1 = bitcast <8 x i1> %t0 to i8
  ret i8 %t1
}

define i8 @sub_compare_folding_swapPS128(<4 x float> %a, <4 x float> %b){
; CHECK-LABEL: @sub_compare_folding_swapPS128(
; CHECK-NEXT:    [[T0:%.*]] = call <4 x i1> @llvm.x86.avx512.mask.cmp.ps.128(<4 x float> [[B:%.*]], <4 x float> [[A:%.*]], i32 12)
; CHECK-NEXT:    [[T1:%.*]] = shufflevector <4 x i1> [[T0]], <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[T2:%.*]] = bitcast <8 x i1> [[T1]] to i8
; CHECK-NEXT:    ret i8 [[T2]]
;
  %sub.i = fsub ninf <4 x float> %a, %b
  %t0 = call <4 x i1> @llvm.x86.avx512.mask.cmp.ps.128(<4 x float> zeroinitializer, <4 x float> %sub.i, i32 12)
  %t1 = shufflevector <4 x i1> %t0, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %t2 = bitcast <8 x i1> %t1 to i8
  ret i8 %t2
}

define i8 @sub_compare_folding_swapPS256(<8 x float> %a, <8 x float> %b){
; CHECK-LABEL: @sub_compare_folding_swapPS256(
; CHECK-NEXT:    [[T0:%.*]] = call <8 x i1> @llvm.x86.avx512.mask.cmp.ps.256(<8 x float> [[B:%.*]], <8 x float> [[A:%.*]], i32 5)
; CHECK-NEXT:    [[T1:%.*]] = bitcast <8 x i1> [[T0]] to i8
; CHECK-NEXT:    ret i8 [[T1]]
;
  %sub.i = fsub ninf <8 x float> %a, %b
  %t0 = call <8 x i1> @llvm.x86.avx512.mask.cmp.ps.256(<8 x float> zeroinitializer, <8 x float> %sub.i, i32 5)
  %t1 = bitcast <8 x i1> %t0 to i8
  ret i8 %t1
}

define i16 @sub_compare_folding_swapPS512(<16 x float> %a, <16 x float> %b){
; CHECK-LABEL: @sub_compare_folding_swapPS512(
; CHECK-NEXT:    [[T0:%.*]] = call <16 x i1> @llvm.x86.avx512.mask.cmp.ps.512(<16 x float> [[B:%.*]], <16 x float> [[A:%.*]], i32 11, i32 4)
; CHECK-NEXT:    [[T1:%.*]] = bitcast <16 x i1> [[T0]] to i16
; CHECK-NEXT:    ret i16 [[T1]]
;
  %sub.i = fsub ninf <16 x float> %a, %b
  %t0 = call <16 x i1> @llvm.x86.avx512.mask.cmp.ps.512(<16 x float> zeroinitializer, <16 x float> %sub.i, i32 11, i32 4)
  %t1 = bitcast <16 x i1> %t0 to i16
  ret i16 %t1
}

declare <2 x i1> @llvm.x86.avx512.mask.cmp.pd.128(<2 x double>, <2 x double>, i32)
declare <4 x i1> @llvm.x86.avx512.mask.cmp.pd.256(<4 x double>, <4 x double>, i32)
declare <8 x i1> @llvm.x86.avx512.mask.cmp.pd.512(<8 x double>, <8 x double>, i32, i32)
declare <4 x i1> @llvm.x86.avx512.mask.cmp.ps.128(<4 x float>, <4 x float>, i32)
declare <8 x i1> @llvm.x86.avx512.mask.cmp.ps.256(<8 x float>, <8 x float>, i32)
declare <16 x i1> @llvm.x86.avx512.mask.cmp.ps.512(<16 x float>, <16 x float>, i32, i32)
