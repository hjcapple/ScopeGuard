//
//  TestC.c
//  ScopeGuard-test
//
//  Created by HJC on 16/6/5.
//  Copyright © 2016年 HJC. All rights reserved.
//

#include "CFScopeRelease.h"
#include "ScopeGuard.h"
#include "TestObjc.h"

static CGContextRef CreateBitmapRGBA8Context(void* bytes, size_t width, size_t height)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CF_SCOPE_RELEASE(colorSpace);

    return CGBitmapContextCreate((void*)bytes,
                                 width,
                                 height,
                                 8,
                                 width * 4,
                                 colorSpace,
                                 (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
}

CG_EXTERN void test_objc()
{
    size_t width = 100;
    size_t height = 100;

    void* bytes = malloc(width * height * 4);
    ON_SCOPE_EXIT
    {
        free(bytes);
    };

    CGContextRef context = CreateBitmapRGBA8Context(bytes, width, height);
    CF_SCOPE_RELEASE(context);
}