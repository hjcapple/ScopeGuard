//
//  main.cpp
//  ScopeGuard-test
//
//  Created by HJC on 16/6/5.
//  Copyright © 2016年 HJC. All rights reserved.
//

#include "ScopeGuard.h"
#include "TestObjc.h"
#include <iostream>

static void test_cpp() {
    void *p = malloc(1000);
    ON_SCOPE_EXIT {
        free(p);
    };
}

int main(int argc, const char *argv[]) {
    for (;;) {
        test_cpp();
        test_objc();
    }
    return 0;
}
