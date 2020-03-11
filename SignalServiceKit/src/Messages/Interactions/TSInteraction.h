//
//  Copyright (c) 2020 Open Whisper Systems. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class SDSAnyReadTransaction;
@class TSThread;

typedef NS_ENUM(NSInteger, OWSInteractionType) {
    OWSInteractionType_Unknown,
    OWSInteractionType_IncomingMessage,
    OWSInteractionType_OutgoingMessage,
    OWSInteractionType_Error,
    OWSInteractionType_Call,
    OWSInteractionType_Info,
    OWSInteractionType_TypingIndicator,
    OWSInteractionType_ThreadDetails,
    OWSInteractionType_Offer,
    OWSInteractionType_UnreadIndicator,
    OWSInteractionType_DateHeader
};

NSString *NSStringFromOWSInteractionType(OWSInteractionType value);

@protocol OWSPreviewText <NSObject>

- (NSString *)previewTextWithTransaction:(SDSAnyReadTransaction *)transaction NS_SWIFT_NAME(previewText(transaction:));

@end

#pragma mark -

@interface TSInteraction : BaseModel

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithUniqueId:(NSString *)uniqueId timestamp:(uint64_t)timestamp inThread:(TSThread *)thread;

- (instancetype)initWithUniqueId:(NSString *)uniqueId
                       timestamp:(uint64_t)timestamp
             receivedAtTimestamp:(uint64_t)receivedAtTimestamp
                        inThread:(TSThread *)thread;

- (instancetype)initInteractionWithTimestamp:(uint64_t)timestamp inThread:(TSThread *)thread;

// --- CODE GENERATION MARKER

// This snippet is generated by /Scripts/sds_codegen/sds_generate.py. Do not manually edit it, instead run `sds_codegen.sh`.

// clang-format off

- (instancetype)initWithGrdbId:(int64_t)grdbId
                      uniqueId:(NSString *)uniqueId
             receivedAtTimestamp:(uint64_t)receivedAtTimestamp
                          sortId:(uint64_t)sortId
                       timestamp:(uint64_t)timestamp
                  uniqueThreadId:(NSString *)uniqueThreadId
NS_SWIFT_NAME(init(grdbId:uniqueId:receivedAtTimestamp:sortId:timestamp:uniqueThreadId:));

// clang-format on

// --- CODE GENERATION MARKER

@property (nonatomic, readonly) NSString *uniqueThreadId;

@property (nonatomic, readonly) uint64_t timestamp;
@property (nonatomic, readonly) uint64_t sortId;
@property (nonatomic, readonly) uint64_t receivedAtTimestamp;

// This property is used to flag interactions that
// require special handling in the conversation view.
@property (nonatomic, readonly) BOOL isSpecialMessage;

- (NSDate *)receivedAtDate;

- (OWSInteractionType)interactionType;

@property (nonatomic, readonly) TSThread *threadWithSneakyTransaction;

- (TSThread *)threadWithTransaction:(SDSAnyReadTransaction *)transaction NS_SWIFT_NAME(thread(transaction:));

#pragma mark Utility Method

// POST GRDB TODO: Remove this method.
+ (NSArray<TSInteraction *> *)ydb_interactionsWithTimestamp:(uint64_t)timestamp
                                                    ofClass:(Class)clazz
                                            withTransaction:(YapDatabaseReadTransaction *)transaction;


// POST GRDB TODO: Remove this method.
+ (NSArray<TSInteraction *> *)ydb_interactionsWithTimestamp:(uint64_t)timestamp
                                                     filter:(BOOL (^_Nonnull)(TSInteraction *))filter
                                            withTransaction:(YapDatabaseReadTransaction *)transaction;

- (uint64_t)timestampForLegacySorting;
- (NSComparisonResult)compareForSorting:(TSInteraction *)other;

// "Dynamic" interactions are not messages or static events (like
// info messages, error messages, etc.).  They are interactions
// created, updated and deleted by the views.
//
// These include block offers, "add to contact" offers,
// unseen message indicators, etc.
- (BOOL)isDynamicInteraction;

// NOTE: This is only for use by a legacy migration.
- (void)ydb_saveNextSortIdWithTransaction:(YapDatabaseReadWriteTransaction *)transaction
    NS_SWIFT_NAME(ydb_saveNextSortId(transaction:));

// NOTE: This is only for use by the YDB-to-GRDB legacy migration.
- (void)replaceSortId:(uint64_t)sortId;

@end

NS_ASSUME_NONNULL_END
