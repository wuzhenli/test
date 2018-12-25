struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

/* @end */

#pragma clang assume_nonnull end

// @interface TestBlockStructViewController ()


// @property (copy, nonatomic) dispatch_block_t block;
// @property (copy, nonatomic) dispatch_block_t blockVariable;;

/* @end */


// @implementation TestBlockStructViewController


static void _I_TestBlockStructViewController_viewDidLoad(TestBlockStructViewController * self, SEL _cmd) {
    ((void (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("TestBlockStructViewController"))}, sel_registerName("viewDidLoad"));

}


struct __Block_byref_intBlock_0 {
  void *__isa;
__Block_byref_intBlock_0 *__forwarding;
 int __flags;
 int __size;
 int intBlock;
};
/*
 int intTemp = 144;
 
 self.block = ^{
    NSLog(@"this is block capture normal int:%d", intTemp);
 };
 
 (void (*)()) &__TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_0
 (
    (void *)__TestBlockStructViewController__testBlockCaptureStackVariable_block_func_0, //
     &__TestBlockStructViewController__testBlockCaptureStackVariable_block_desc_0_DATA, // desc
     intTemp // intTemp
 )
 
 */
//         fileName                         function name            方法里的第一个block
struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_0 {
  struct __block_impl impl;
  struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_desc_0* Desc;
  int intTemp;
    
  __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_0
    (
     void *fp,
     struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_desc_0 *desc,
     int _intTemp,
     int flags=0) : intTemp(_intTemp) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};

/// 第一个 block 的 方法实现
static void __TestBlockStructViewController__testBlockCaptureStackVariable_block_func_0 (struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_0 *__cself) {
  int intTemp = __cself->intTemp; // bound by copy

        NSLog((NSString *)&__NSConstantStringImpl__var_folders_fq_0xg0m16d4vdcxmvknssvd_h40000gn_T_TestBlockStructViewController_b0dd0b_mi_0, intTemp);
    }

static struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_desc_0 {
  size_t reserved;
  size_t Block_size;
} __TestBlockStructViewController__testBlockCaptureStackVariable_block_desc_0_DATA = { 0, sizeof(struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_0)};

struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_1 {
  struct __block_impl impl;
  struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_desc_1* Desc;
  __Block_byref_intBlock_0 *intBlock; // by ref
  __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_1(void *fp, struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_desc_1 *desc, __Block_byref_intBlock_0 *_intBlock, int flags=0) : intBlock(_intBlock->__forwarding) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
static void __TestBlockStructViewController__testBlockCaptureStackVariable_block_func_1(struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_1 *__cself) {
  __Block_byref_intBlock_0 *intBlock = __cself->intBlock; // bound by ref

        NSLog((NSString *)&__NSConstantStringImpl__var_folders_fq_0xg0m16d4vdcxmvknssvd_h40000gn_T_TestBlockStructViewController_b0dd0b_mi_1, (intBlock->__forwarding->intBlock));
    }
static void __TestBlockStructViewController__testBlockCaptureStackVariable_block_copy_1(struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_1*dst, struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_1*src) {_Block_object_assign((void*)&dst->intBlock, (void*)src->intBlock, 8/*BLOCK_FIELD_IS_BYREF*/);}

static void __TestBlockStructViewController__testBlockCaptureStackVariable_block_dispose_1(struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_1*src) {_Block_object_dispose((void*)src->intBlock, 8/*BLOCK_FIELD_IS_BYREF*/);}

static struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_desc_1 {
  size_t reserved;
  size_t Block_size;
  void (*copy)(struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_1*, struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_1*);
  void (*dispose)(struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_1*);
} __TestBlockStructViewController__testBlockCaptureStackVariable_block_desc_1_DATA = { 0, sizeof(struct __TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_1), __TestBlockStructViewController__testBlockCaptureStackVariable_block_copy_1, __TestBlockStructViewController__testBlockCaptureStackVariable_block_dispose_1};
/*
- (void)testBlockCaptureStackVariable {
    int intTemp = 144;
    
    self.block = ^{
        NSLog(@"this is block capture normal int:%d", intTemp);
    };
    
    __block int intBlock = 122;
    
    self.blockVariable = ^{
        NSLog(@"this is block capture block int:%d", intBlock);
    };
}  */
static void _I_TestBlockStructViewController_testBlockCaptureStackVariable(TestBlockStructViewController * self, SEL _cmd) {
    int intTemp = 144;

    (   (void (*)(id, SEL, dispatch_block_t))    (void *)objc_msgSend        )
    (
     (id)self,
     sel_registerName("setBlock:"),
        (
         (void (*)()) &__TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_0
            (
             (void *)__TestBlockStructViewController__testBlockCaptureStackVariable_block_func_0, &__TestBlockStructViewController__testBlockCaptureStackVariable_block_desc_0_DATA, intTemp
            )
        )
     );

    /// __block int intBlock = 122;
    __attribute__((__blocks__(byref)))  __Block_byref_intBlock_0  intBlock = {(void*)0,(__Block_byref_intBlock_0 *)&intBlock, 0, sizeof(__Block_byref_intBlock_0), 122};

    ((void (*)(id, SEL, dispatch_block_t))(void *)objc_msgSend)
    (
     (id)self,
     sel_registerName("setBlockVariable:"),
     (
      (void (*)())   &__TestBlockStructViewController__testBlockCaptureStackVariable_block_impl_1
        (
         (void *)__TestBlockStructViewController__testBlockCaptureStackVariable_block_func_1, &__TestBlockStructViewController__testBlockCaptureStackVariable_block_desc_1_DATA, (__Block_byref_intBlock_0 *)&intBlock, 570425344
        )
     )
    );
}

static void(* _I_TestBlockStructViewController_block(TestBlockStructViewController * self, SEL _cmd) )(){ return (*(__strong dispatch_block_t *)((char *)self + OBJC_IVAR_$_TestBlockStructViewController$_block)); }
extern "C" __declspec(dllimport) void objc_setProperty (id, SEL, long, id, bool, bool);

static void _I_TestBlockStructViewController_setBlock_(TestBlockStructViewController * self, SEL _cmd, dispatch_block_t block) { objc_setProperty (self, _cmd, __OFFSETOFIVAR__(struct TestBlockStructViewController, _block), (id)block, 0, 1); }

static void(* _I_TestBlockStructViewController_blockVariable(TestBlockStructViewController * self, SEL _cmd) )(){ return (*(__strong dispatch_block_t *)((char *)self + OBJC_IVAR_$_TestBlockStructViewController$_blockVariable)); }
static void _I_TestBlockStructViewController_setBlockVariable_(TestBlockStructViewController * self, SEL _cmd, dispatch_block_t blockVariable) { objc_setProperty (self, _cmd, __OFFSETOFIVAR__(struct TestBlockStructViewController, _blockVariable), (id)blockVariable, 0, 1); }
// @end

struct _prop_t {
	const char *name;
	const char *attributes;
};

struct _protocol_t;

struct _objc_method {
	struct objc_selector * _cmd;
	const char *method_type;
	void  *_imp;
};

struct _protocol_t {
	void * isa;  // NULL
	const char *protocol_name;
	const struct _protocol_list_t * protocol_list; // super protocols
	const struct method_list_t *instance_methods;
	const struct method_list_t *class_methods;
	const struct method_list_t *optionalInstanceMethods;
	const struct method_list_t *optionalClassMethods;
	const struct _prop_list_t * properties;
	const unsigned int size;  // sizeof(struct _protocol_t)
	const unsigned int flags;  // = 0
	const char ** extendedMethodTypes;
};

struct _ivar_t {
	unsigned long int *offset;  // pointer to ivar offset location
	const char *name;
	const char *type;
	unsigned int alignment;
	unsigned int  size;
};

struct _class_ro_t {
	unsigned int flags;
	unsigned int instanceStart;
	unsigned int instanceSize;
	unsigned int reserved;
	const unsigned char *ivarLayout;
	const char *name;
	const struct _method_list_t *baseMethods;
	const struct _objc_protocol_list *baseProtocols;
	const struct _ivar_list_t *ivars;
	const unsigned char *weakIvarLayout;
	const struct _prop_list_t *properties;
};

struct _class_t {
	struct _class_t *isa;
	struct _class_t *superclass;
	void *cache;
	void *vtable;
	struct _class_ro_t *ro;
};

struct _category_t {
	const char *name;
	struct _class_t *cls;
	const struct _method_list_t *instance_methods;
	const struct _method_list_t *class_methods;
	const struct _protocol_list_t *protocols;
	const struct _prop_list_t *properties;
};
extern "C" __declspec(dllimport) struct objc_cache _objc_empty_cache;
#pragma warning(disable:4273)

extern "C" unsigned long int OBJC_IVAR_$_TestBlockStructViewController$_block __attribute__ ((used, section ("__DATA,__objc_ivar"))) = __OFFSETOFIVAR__(struct TestBlockStructViewController, _block);
extern "C" unsigned long int OBJC_IVAR_$_TestBlockStructViewController$_blockVariable __attribute__ ((used, section ("__DATA,__objc_ivar"))) = __OFFSETOFIVAR__(struct TestBlockStructViewController, _blockVariable);

static struct /*_ivar_list_t*/ {
	unsigned int entsize;  // sizeof(struct _prop_t)
	unsigned int count;
	struct _ivar_t ivar_list[2];
} _OBJC_$_INSTANCE_VARIABLES_TestBlockStructViewController __attribute__ ((used, section ("__DATA,__objc_const"))) = {
	sizeof(_ivar_t),
	2,
	{{(unsigned long int *)&OBJC_IVAR_$_TestBlockStructViewController$_block, "_block", "@?", 3, 8},
	 {(unsigned long int *)&OBJC_IVAR_$_TestBlockStructViewController$_blockVariable, "_blockVariable", "@?", 3, 8}}
};

static struct /*_method_list_t*/ {
	unsigned int entsize;  // sizeof(struct _objc_method)
	unsigned int method_count;
	struct _objc_method method_list[6];
} _OBJC_$_INSTANCE_METHODS_TestBlockStructViewController __attribute__ ((used, section ("__DATA,__objc_const"))) = {
	sizeof(_objc_method),
	6,
	{{(struct objc_selector *)"viewDidLoad", "v16@0:8", (void *)_I_TestBlockStructViewController_viewDidLoad},
	{(struct objc_selector *)"testBlockCaptureStackVariable", "v16@0:8", (void *)_I_TestBlockStructViewController_testBlockCaptureStackVariable},
	{(struct objc_selector *)"block", "@?16@0:8", (void *)_I_TestBlockStructViewController_block},
	{(struct objc_selector *)"setBlock:", "v24@0:8@?16", (void *)_I_TestBlockStructViewController_setBlock_},
	{(struct objc_selector *)"blockVariable", "@?16@0:8", (void *)_I_TestBlockStructViewController_blockVariable},
	{(struct objc_selector *)"setBlockVariable:", "v24@0:8@?16", (void *)_I_TestBlockStructViewController_setBlockVariable_}}
};

static struct _class_ro_t _OBJC_METACLASS_RO_$_TestBlockStructViewController __attribute__ ((used, section ("__DATA,__objc_const"))) = {
	1, sizeof(struct _class_t), sizeof(struct _class_t), 
	(unsigned int)0, 
	0, 
	"TestBlockStructViewController",
	0, 
	0, 
	0, 
	0, 
	0, 
};
