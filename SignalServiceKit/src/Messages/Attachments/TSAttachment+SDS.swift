//
//  Copyright (c) 2019 Open Whisper Systems. All rights reserved.
//

import Foundation
import GRDB
import SignalCoreKit

// NOTE: This file is generated by /Scripts/sds_codegen/sds_generate.py.
// Do not manually edit it, instead run `sds_codegen.sh`.

// MARK: - Record

public struct AttachmentRecord: SDSRecord {
    public var tableMetadata: SDSTableMetadata {
        return TSAttachmentSerializer.table
    }

    public static let databaseTableName: String = TSAttachmentSerializer.table.tableName

    public var id: Int64?

    // This defines all of the columns used in the table
    // where this model (and any subclasses) are persisted.
    public let recordType: SDSRecordType
    public let uniqueId: String

    // Base class properties
    public let albumMessageId: String?
    public let attachmentSchemaVersion: UInt
    public let attachmentType: TSAttachmentType
    public let byteCount: UInt32
    public let caption: String?
    public let contentType: String
    public let encryptionKey: Data?
    public let isDownloaded: Bool
    public let serverId: UInt64
    public let sourceFilename: String?

    // Subclass properties
    public let cachedAudioDurationSeconds: Double?
    public let cachedImageHeight: Double?
    public let cachedImageWidth: Double?
    public let creationTimestamp: Double?
    public let digest: Data?
    public let isUploaded: Bool?
    public let isValidImageCached: Bool?
    public let isValidVideoCached: Bool?
    public let lazyRestoreFragmentId: String?
    public let localRelativeFilePath: String?
    public let mediaSize: Data?
    public let mostRecentFailureLocalizedText: String?
    public let pointerType: TSAttachmentPointerType?
    public let shouldAlwaysPad: Bool?
    public let state: TSAttachmentPointerState?

    public enum CodingKeys: String, CodingKey, ColumnExpression, CaseIterable {
        case id
        case recordType
        case uniqueId
        case albumMessageId
        case attachmentSchemaVersion
        case attachmentType
        case byteCount
        case caption
        case contentType
        case encryptionKey
        case isDownloaded
        case serverId
        case sourceFilename
        case cachedAudioDurationSeconds
        case cachedImageHeight
        case cachedImageWidth
        case creationTimestamp
        case digest
        case isUploaded
        case isValidImageCached
        case isValidVideoCached
        case lazyRestoreFragmentId
        case localRelativeFilePath
        case mediaSize
        case mostRecentFailureLocalizedText
        case pointerType
        case shouldAlwaysPad
        case state
    }

    public static func columnName(_ column: AttachmentRecord.CodingKeys, fullyQualified: Bool = false) -> String {
        return fullyQualified ? "\(databaseTableName).\(column.rawValue)" : column.rawValue
    }
}

// MARK: - Row Initializer

public extension AttachmentRecord {
    static var databaseSelection: [SQLSelectable] {
        return CodingKeys.allCases
    }

    init(row: Row) {
        id = row[0]
        recordType = row[1]
        uniqueId = row[2]
        albumMessageId = row[3]
        attachmentSchemaVersion = row[4]
        attachmentType = row[5]
        byteCount = row[6]
        caption = row[7]
        contentType = row[8]
        encryptionKey = row[9]
        isDownloaded = row[10]
        serverId = row[11]
        sourceFilename = row[12]
        cachedAudioDurationSeconds = row[13]
        cachedImageHeight = row[14]
        cachedImageWidth = row[15]
        creationTimestamp = row[16]
        digest = row[17]
        isUploaded = row[18]
        isValidImageCached = row[19]
        isValidVideoCached = row[20]
        lazyRestoreFragmentId = row[21]
        localRelativeFilePath = row[22]
        mediaSize = row[23]
        mostRecentFailureLocalizedText = row[24]
        pointerType = row[25]
        shouldAlwaysPad = row[26]
        state = row[27]
    }
}

// MARK: - StringInterpolation

public extension String.StringInterpolation {
    mutating func appendInterpolation(attachmentColumn column: AttachmentRecord.CodingKeys) {
        appendLiteral(AttachmentRecord.columnName(column))
    }
    mutating func appendInterpolation(attachmentColumnFullyQualified column: AttachmentRecord.CodingKeys) {
        appendLiteral(AttachmentRecord.columnName(column, fullyQualified: true))
    }
}

// MARK: - Deserialization

// TODO: Rework metadata to not include, for example, columns, column indices.
extension TSAttachment {
    // This method defines how to deserialize a model, given a
    // database row.  The recordType column is used to determine
    // the corresponding model class.
    class func fromRecord(_ record: AttachmentRecord) throws -> TSAttachment {

        guard let recordId = record.id else {
            throw SDSError.invalidValue
        }

        switch record.recordType {
        case .attachment:

            let uniqueId: String = record.uniqueId
            let albumMessageId: String? = record.albumMessageId
            let attachmentSchemaVersion: UInt = record.attachmentSchemaVersion
            let attachmentType: TSAttachmentType = record.attachmentType
            let byteCount: UInt32 = record.byteCount
            let caption: String? = record.caption
            let contentType: String = record.contentType
            let encryptionKey: Data? = SDSDeserialization.optionalData(record.encryptionKey, name: "encryptionKey")
            let isDownloaded: Bool = record.isDownloaded
            let serverId: UInt64 = record.serverId
            let sourceFilename: String? = record.sourceFilename

            return TSAttachment(uniqueId: uniqueId,
                                albumMessageId: albumMessageId,
                                attachmentSchemaVersion: attachmentSchemaVersion,
                                attachmentType: attachmentType,
                                byteCount: byteCount,
                                caption: caption,
                                contentType: contentType,
                                encryptionKey: encryptionKey,
                                isDownloaded: isDownloaded,
                                serverId: serverId,
                                sourceFilename: sourceFilename)

        case .attachmentPointer:

            let uniqueId: String = record.uniqueId
            let albumMessageId: String? = record.albumMessageId
            let attachmentSchemaVersion: UInt = record.attachmentSchemaVersion
            let attachmentType: TSAttachmentType = record.attachmentType
            let byteCount: UInt32 = record.byteCount
            let caption: String? = record.caption
            let contentType: String = record.contentType
            let encryptionKey: Data? = SDSDeserialization.optionalData(record.encryptionKey, name: "encryptionKey")
            let isDownloaded: Bool = record.isDownloaded
            let serverId: UInt64 = record.serverId
            let sourceFilename: String? = record.sourceFilename
            let digest: Data? = SDSDeserialization.optionalData(record.digest, name: "digest")
            let lazyRestoreFragmentId: String? = record.lazyRestoreFragmentId
            let mediaSizeSerialized: Data? = record.mediaSize
            let mediaSize: CGSize = try SDSDeserialization.unarchive(mediaSizeSerialized, name: "mediaSize")
            let mostRecentFailureLocalizedText: String? = record.mostRecentFailureLocalizedText
            guard let pointerType: TSAttachmentPointerType = record.pointerType else {
               throw SDSError.missingRequiredField
            }
            guard let state: TSAttachmentPointerState = record.state else {
               throw SDSError.missingRequiredField
            }

            return TSAttachmentPointer(uniqueId: uniqueId,
                                       albumMessageId: albumMessageId,
                                       attachmentSchemaVersion: attachmentSchemaVersion,
                                       attachmentType: attachmentType,
                                       byteCount: byteCount,
                                       caption: caption,
                                       contentType: contentType,
                                       encryptionKey: encryptionKey,
                                       isDownloaded: isDownloaded,
                                       serverId: serverId,
                                       sourceFilename: sourceFilename,
                                       digest: digest,
                                       lazyRestoreFragmentId: lazyRestoreFragmentId,
                                       mediaSize: mediaSize,
                                       mostRecentFailureLocalizedText: mostRecentFailureLocalizedText,
                                       pointerType: pointerType,
                                       state: state)

        case .attachmentStream:

            let uniqueId: String = record.uniqueId
            let albumMessageId: String? = record.albumMessageId
            let attachmentSchemaVersion: UInt = record.attachmentSchemaVersion
            let attachmentType: TSAttachmentType = record.attachmentType
            let byteCount: UInt32 = record.byteCount
            let caption: String? = record.caption
            let contentType: String = record.contentType
            let encryptionKey: Data? = SDSDeserialization.optionalData(record.encryptionKey, name: "encryptionKey")
            let isDownloaded: Bool = record.isDownloaded
            let serverId: UInt64 = record.serverId
            let sourceFilename: String? = record.sourceFilename
            let cachedAudioDurationSeconds: NSNumber? = SDSDeserialization.optionalNumericAsNSNumber(record.cachedAudioDurationSeconds, name: "cachedAudioDurationSeconds", conversion: { NSNumber(value: $0) })
            let cachedImageHeight: NSNumber? = SDSDeserialization.optionalNumericAsNSNumber(record.cachedImageHeight, name: "cachedImageHeight", conversion: { NSNumber(value: $0) })
            let cachedImageWidth: NSNumber? = SDSDeserialization.optionalNumericAsNSNumber(record.cachedImageWidth, name: "cachedImageWidth", conversion: { NSNumber(value: $0) })
            guard let creationTimestampInterval: Double = record.creationTimestamp else {
               throw SDSError.missingRequiredField
            }
            let creationTimestamp: Date = SDSDeserialization.requiredDoubleAsDate(creationTimestampInterval, name: "creationTimestamp")
            let digest: Data? = SDSDeserialization.optionalData(record.digest, name: "digest")
            let isUploaded: Bool = try SDSDeserialization.required(record.isUploaded, name: "isUploaded")
            let isValidImageCached: NSNumber? = SDSDeserialization.optionalNumericAsNSNumber(record.isValidImageCached, name: "isValidImageCached", conversion: { NSNumber(value: $0) })
            let isValidVideoCached: NSNumber? = SDSDeserialization.optionalNumericAsNSNumber(record.isValidVideoCached, name: "isValidVideoCached", conversion: { NSNumber(value: $0) })
            let localRelativeFilePath: String? = record.localRelativeFilePath
            let shouldAlwaysPad: Bool = try SDSDeserialization.required(record.shouldAlwaysPad, name: "shouldAlwaysPad")

            return TSAttachmentStream(uniqueId: uniqueId,
                                      albumMessageId: albumMessageId,
                                      attachmentSchemaVersion: attachmentSchemaVersion,
                                      attachmentType: attachmentType,
                                      byteCount: byteCount,
                                      caption: caption,
                                      contentType: contentType,
                                      encryptionKey: encryptionKey,
                                      isDownloaded: isDownloaded,
                                      serverId: serverId,
                                      sourceFilename: sourceFilename,
                                      cachedAudioDurationSeconds: cachedAudioDurationSeconds,
                                      cachedImageHeight: cachedImageHeight,
                                      cachedImageWidth: cachedImageWidth,
                                      creationTimestamp: creationTimestamp,
                                      digest: digest,
                                      isUploaded: isUploaded,
                                      isValidImageCached: isValidImageCached,
                                      isValidVideoCached: isValidVideoCached,
                                      localRelativeFilePath: localRelativeFilePath,
                                      shouldAlwaysPad: shouldAlwaysPad)

        default:
            owsFailDebug("Unexpected record type: \(record.recordType)")
            throw SDSError.invalidValue
        }
    }
}

// MARK: - SDSModel

extension TSAttachment: SDSModel {
    public var serializer: SDSSerializer {
        // Any subclass can be cast to it's superclass,
        // so the order of this switch statement matters.
        // We need to do a "depth first" search by type.
        switch self {
        case let model as TSAttachmentStream:
            assert(type(of: model) == TSAttachmentStream.self)
            return TSAttachmentStreamSerializer(model: model)
        case let model as TSAttachmentPointer:
            assert(type(of: model) == TSAttachmentPointer.self)
            return TSAttachmentPointerSerializer(model: model)
        default:
            return TSAttachmentSerializer(model: self)
        }
    }

    public func asRecord() throws -> SDSRecord {
        return try serializer.asRecord()
    }

    public var sdsTableName: String {
        return AttachmentRecord.databaseTableName
    }

    public static var table: SDSTableMetadata {
        return TSAttachmentSerializer.table
    }
}

// MARK: - Table Metadata

extension TSAttachmentSerializer {

    // This defines all of the columns used in the table
    // where this model (and any subclasses) are persisted.
    static let idColumn = SDSColumnMetadata(columnName: "id", columnType: .primaryKey, columnIndex: 0)
    static let recordTypeColumn = SDSColumnMetadata(columnName: "recordType", columnType: .int64, columnIndex: 1)
    static let uniqueIdColumn = SDSColumnMetadata(columnName: "uniqueId", columnType: .unicodeString, isUnique: true, columnIndex: 2)
    // Base class properties
    static let albumMessageIdColumn = SDSColumnMetadata(columnName: "albumMessageId", columnType: .unicodeString, isOptional: true, columnIndex: 3)
    static let attachmentSchemaVersionColumn = SDSColumnMetadata(columnName: "attachmentSchemaVersion", columnType: .int64, columnIndex: 4)
    static let attachmentTypeColumn = SDSColumnMetadata(columnName: "attachmentType", columnType: .int, columnIndex: 5)
    static let byteCountColumn = SDSColumnMetadata(columnName: "byteCount", columnType: .int64, columnIndex: 6)
    static let captionColumn = SDSColumnMetadata(columnName: "caption", columnType: .unicodeString, isOptional: true, columnIndex: 7)
    static let contentTypeColumn = SDSColumnMetadata(columnName: "contentType", columnType: .unicodeString, columnIndex: 8)
    static let encryptionKeyColumn = SDSColumnMetadata(columnName: "encryptionKey", columnType: .blob, isOptional: true, columnIndex: 9)
    static let isDownloadedColumn = SDSColumnMetadata(columnName: "isDownloaded", columnType: .int, columnIndex: 10)
    static let serverIdColumn = SDSColumnMetadata(columnName: "serverId", columnType: .int64, columnIndex: 11)
    static let sourceFilenameColumn = SDSColumnMetadata(columnName: "sourceFilename", columnType: .unicodeString, isOptional: true, columnIndex: 12)
    // Subclass properties
    static let cachedAudioDurationSecondsColumn = SDSColumnMetadata(columnName: "cachedAudioDurationSeconds", columnType: .double, isOptional: true, columnIndex: 13)
    static let cachedImageHeightColumn = SDSColumnMetadata(columnName: "cachedImageHeight", columnType: .double, isOptional: true, columnIndex: 14)
    static let cachedImageWidthColumn = SDSColumnMetadata(columnName: "cachedImageWidth", columnType: .double, isOptional: true, columnIndex: 15)
    static let creationTimestampColumn = SDSColumnMetadata(columnName: "creationTimestamp", columnType: .double, isOptional: true, columnIndex: 16)
    static let digestColumn = SDSColumnMetadata(columnName: "digest", columnType: .blob, isOptional: true, columnIndex: 17)
    static let isUploadedColumn = SDSColumnMetadata(columnName: "isUploaded", columnType: .int, isOptional: true, columnIndex: 18)
    static let isValidImageCachedColumn = SDSColumnMetadata(columnName: "isValidImageCached", columnType: .int, isOptional: true, columnIndex: 19)
    static let isValidVideoCachedColumn = SDSColumnMetadata(columnName: "isValidVideoCached", columnType: .int, isOptional: true, columnIndex: 20)
    static let lazyRestoreFragmentIdColumn = SDSColumnMetadata(columnName: "lazyRestoreFragmentId", columnType: .unicodeString, isOptional: true, columnIndex: 21)
    static let localRelativeFilePathColumn = SDSColumnMetadata(columnName: "localRelativeFilePath", columnType: .unicodeString, isOptional: true, columnIndex: 22)
    static let mediaSizeColumn = SDSColumnMetadata(columnName: "mediaSize", columnType: .blob, isOptional: true, columnIndex: 23)
    static let mostRecentFailureLocalizedTextColumn = SDSColumnMetadata(columnName: "mostRecentFailureLocalizedText", columnType: .unicodeString, isOptional: true, columnIndex: 24)
    static let pointerTypeColumn = SDSColumnMetadata(columnName: "pointerType", columnType: .int, isOptional: true, columnIndex: 25)
    static let shouldAlwaysPadColumn = SDSColumnMetadata(columnName: "shouldAlwaysPad", columnType: .int, isOptional: true, columnIndex: 26)
    static let stateColumn = SDSColumnMetadata(columnName: "state", columnType: .int, isOptional: true, columnIndex: 27)

    // TODO: We should decide on a naming convention for
    //       tables that store models.
    public static let table = SDSTableMetadata(collection: TSAttachment.collection(),
                                               tableName: "model_TSAttachment",
                                               columns: [
        idColumn,
        recordTypeColumn,
        uniqueIdColumn,
        albumMessageIdColumn,
        attachmentSchemaVersionColumn,
        attachmentTypeColumn,
        byteCountColumn,
        captionColumn,
        contentTypeColumn,
        encryptionKeyColumn,
        isDownloadedColumn,
        serverIdColumn,
        sourceFilenameColumn,
        cachedAudioDurationSecondsColumn,
        cachedImageHeightColumn,
        cachedImageWidthColumn,
        creationTimestampColumn,
        digestColumn,
        isUploadedColumn,
        isValidImageCachedColumn,
        isValidVideoCachedColumn,
        lazyRestoreFragmentIdColumn,
        localRelativeFilePathColumn,
        mediaSizeColumn,
        mostRecentFailureLocalizedTextColumn,
        pointerTypeColumn,
        shouldAlwaysPadColumn,
        stateColumn
        ])
}

// MARK: - Save/Remove/Update

@objc
public extension TSAttachment {
    func anyInsert(transaction: SDSAnyWriteTransaction) {
        sdsSave(saveMode: .insert, transaction: transaction)
    }

    // This method is private; we should never use it directly.
    // Instead, use anyUpdate(transaction:block:), so that we
    // use the "update with" pattern.
    private func anyUpdate(transaction: SDSAnyWriteTransaction) {
        sdsSave(saveMode: .update, transaction: transaction)
    }

    @available(*, deprecated, message: "Use anyInsert() or anyUpdate() instead.")
    func anyUpsert(transaction: SDSAnyWriteTransaction) {
        let isInserting: Bool
        if TSAttachment.anyFetch(uniqueId: uniqueId, transaction: transaction) != nil {
            isInserting = false
        } else {
            isInserting = true
        }
        sdsSave(saveMode: isInserting ? .insert : .update, transaction: transaction)
    }

    // This method is used by "updateWith..." methods.
    //
    // This model may be updated from many threads. We don't want to save
    // our local copy (this instance) since it may be out of date.  We also
    // want to avoid re-saving a model that has been deleted.  Therefore, we
    // use "updateWith..." methods to:
    //
    // a) Update a property of this instance.
    // b) If a copy of this model exists in the database, load an up-to-date copy,
    //    and update and save that copy.
    // b) If a copy of this model _DOES NOT_ exist in the database, do _NOT_ save
    //    this local instance.
    //
    // After "updateWith...":
    //
    // a) Any copy of this model in the database will have been updated.
    // b) The local property on this instance will always have been updated.
    // c) Other properties on this instance may be out of date.
    //
    // All mutable properties of this class have been made read-only to
    // prevent accidentally modifying them directly.
    //
    // This isn't a perfect arrangement, but in practice this will prevent
    // data loss and will resolve all known issues.
    func anyUpdate(transaction: SDSAnyWriteTransaction, block: (TSAttachment) -> Void) {

        block(self)

        guard let dbCopy = type(of: self).anyFetch(uniqueId: uniqueId,
                                                   transaction: transaction) else {
            return
        }

        // Don't apply the block twice to the same instance.
        // It's at least unnecessary and actually wrong for some blocks.
        // e.g. `block: { $0 in $0.someField++ }`
        if dbCopy !== self {
            block(dbCopy)
        }

        dbCopy.anyUpdate(transaction: transaction)
    }

    func anyRemove(transaction: SDSAnyWriteTransaction) {
        sdsRemove(transaction: transaction)
    }

    func anyReload(transaction: SDSAnyReadTransaction) {
        anyReload(transaction: transaction, ignoreMissing: false)
    }

    func anyReload(transaction: SDSAnyReadTransaction, ignoreMissing: Bool) {
        guard let latestVersion = type(of: self).anyFetch(uniqueId: uniqueId, transaction: transaction) else {
            if !ignoreMissing {
                owsFailDebug("`latest` was unexpectedly nil")
            }
            return
        }

        setValuesForKeys(latestVersion.dictionaryValue)
    }
}

// MARK: - TSAttachmentCursor

@objc
public class TSAttachmentCursor: NSObject {
    private let cursor: RecordCursor<AttachmentRecord>?

    init(cursor: RecordCursor<AttachmentRecord>?) {
        self.cursor = cursor
    }

    public func next() throws -> TSAttachment? {
        guard let cursor = cursor else {
            return nil
        }
        guard let record = try cursor.next() else {
            return nil
        }
        return try TSAttachment.fromRecord(record)
    }

    public func all() throws -> [TSAttachment] {
        var result = [TSAttachment]()
        while true {
            guard let model = try next() else {
                break
            }
            result.append(model)
        }
        return result
    }
}

// MARK: - Obj-C Fetch

// TODO: We may eventually want to define some combination of:
//
// * fetchCursor, fetchOne, fetchAll, etc. (ala GRDB)
// * Optional "where clause" parameters for filtering.
// * Async flavors with completions.
//
// TODO: I've defined flavors that take a read transaction.
//       Or we might take a "connection" if we end up having that class.
@objc
public extension TSAttachment {
    class func grdbFetchCursor(transaction: GRDBReadTransaction) -> TSAttachmentCursor {
        let database = transaction.database
        do {
            let cursor = try AttachmentRecord.fetchCursor(database)
            return TSAttachmentCursor(cursor: cursor)
        } catch {
            owsFailDebug("Read failed: \(error)")
            return TSAttachmentCursor(cursor: nil)
        }
    }

    // Fetches a single model by "unique id".
    class func anyFetch(uniqueId: String,
                        transaction: SDSAnyReadTransaction) -> TSAttachment? {
        assert(uniqueId.count > 0)

        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            return TSAttachment.ydb_fetch(uniqueId: uniqueId, transaction: ydbTransaction)
        case .grdbRead(let grdbTransaction):
            let sql = "SELECT * FROM \(AttachmentRecord.databaseTableName) WHERE \(attachmentColumn: .uniqueId) = ?"
            return grdbFetchOne(sql: sql, arguments: [uniqueId], transaction: grdbTransaction)
        }
    }

    // Traverses all records.
    // Records are not visited in any particular order.
    class func anyEnumerate(transaction: SDSAnyReadTransaction,
                            block: @escaping (TSAttachment, UnsafeMutablePointer<ObjCBool>) -> Void) {
        anyEnumerate(transaction: transaction, batched: false, block: block)
    }

    // Traverses all records.
    // Records are not visited in any particular order.
    class func anyEnumerate(transaction: SDSAnyReadTransaction,
                            batched: Bool = false,
                            block: @escaping (TSAttachment, UnsafeMutablePointer<ObjCBool>) -> Void) {
        let batchSize = batched ? Batching.kDefaultBatchSize : 0
        anyEnumerate(transaction: transaction, batchSize: batchSize, block: block)
    }

    // Traverses all records.
    // Records are not visited in any particular order.
    //
    // If batchSize > 0, the enumeration is performed in autoreleased batches.
    class func anyEnumerate(transaction: SDSAnyReadTransaction,
                            batchSize: UInt,
                            block: @escaping (TSAttachment, UnsafeMutablePointer<ObjCBool>) -> Void) {
        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            TSAttachment.ydb_enumerateCollectionObjects(with: ydbTransaction) { (object, stop) in
                guard let value = object as? TSAttachment else {
                    owsFailDebug("unexpected object: \(type(of: object))")
                    return
                }
                block(value, stop)
            }
        case .grdbRead(let grdbTransaction):
            do {
                let cursor = TSAttachment.grdbFetchCursor(transaction: grdbTransaction)
                try Batching.loop(batchSize: batchSize,
                                  loopBlock: { stop in
                                      guard let value = try cursor.next() else {
                                        stop.pointee = true
                                        return
                                      }
                                      block(value, stop)
                })
            } catch let error {
                owsFailDebug("Couldn't fetch models: \(error)")
            }
        }
    }

    // Traverses all records' unique ids.
    // Records are not visited in any particular order.
    class func anyEnumerateUniqueIds(transaction: SDSAnyReadTransaction,
                                     block: @escaping (String, UnsafeMutablePointer<ObjCBool>) -> Void) {
        anyEnumerateUniqueIds(transaction: transaction, batched: false, block: block)
    }

    // Traverses all records' unique ids.
    // Records are not visited in any particular order.
    class func anyEnumerateUniqueIds(transaction: SDSAnyReadTransaction,
                                     batched: Bool = false,
                                     block: @escaping (String, UnsafeMutablePointer<ObjCBool>) -> Void) {
        let batchSize = batched ? Batching.kDefaultBatchSize : 0
        anyEnumerateUniqueIds(transaction: transaction, batchSize: batchSize, block: block)
    }

    // Traverses all records' unique ids.
    // Records are not visited in any particular order.
    //
    // If batchSize > 0, the enumeration is performed in autoreleased batches.
    class func anyEnumerateUniqueIds(transaction: SDSAnyReadTransaction,
                                     batchSize: UInt,
                                     block: @escaping (String, UnsafeMutablePointer<ObjCBool>) -> Void) {
        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            ydbTransaction.enumerateKeys(inCollection: TSAttachment.collection()) { (uniqueId, stop) in
                block(uniqueId, stop)
            }
        case .grdbRead(let grdbTransaction):
            grdbEnumerateUniqueIds(transaction: grdbTransaction,
                                   sql: """
                    SELECT \(attachmentColumn: .uniqueId)
                    FROM \(AttachmentRecord.databaseTableName)
                """,
                batchSize: batchSize,
                block: block)
        }
    }

    // Does not order the results.
    class func anyFetchAll(transaction: SDSAnyReadTransaction) -> [TSAttachment] {
        var result = [TSAttachment]()
        anyEnumerate(transaction: transaction) { (model, _) in
            result.append(model)
        }
        return result
    }

    // Does not order the results.
    class func anyAllUniqueIds(transaction: SDSAnyReadTransaction) -> [String] {
        var result = [String]()
        anyEnumerateUniqueIds(transaction: transaction) { (uniqueId, _) in
            result.append(uniqueId)
        }
        return result
    }

    class func anyCount(transaction: SDSAnyReadTransaction) -> UInt {
        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            return ydbTransaction.numberOfKeys(inCollection: TSAttachment.collection())
        case .grdbRead(let grdbTransaction):
            return AttachmentRecord.ows_fetchCount(grdbTransaction.database)
        }
    }

    // WARNING: Do not use this method for any models which do cleanup
    //          in their anyWillRemove(), anyDidRemove() methods.
    class func anyRemoveAllWithoutInstantation(transaction: SDSAnyWriteTransaction) {
        switch transaction.writeTransaction {
        case .yapWrite(let ydbTransaction):
            ydbTransaction.removeAllObjects(inCollection: TSAttachment.collection())
        case .grdbWrite(let grdbTransaction):
            do {
                try AttachmentRecord.deleteAll(grdbTransaction.database)
            } catch {
                owsFailDebug("deleteAll() failed: \(error)")
            }
        }

        if shouldBeIndexedForFTS {
            FullTextSearchFinder.allModelsWereRemoved(collection: collection(), transaction: transaction)
        }
    }

    class func anyRemoveAllWithInstantation(transaction: SDSAnyWriteTransaction) {
        // To avoid mutationDuringEnumerationException, we need
        // to remove the instances outside the enumeration.
        let uniqueIds = anyAllUniqueIds(transaction: transaction)

        var index: Int = 0
        do {
            try Batching.loop(batchSize: Batching.kDefaultBatchSize,
                              loopBlock: { stop in
                                  guard index < uniqueIds.count else {
                                    stop.pointee = true
                                    return
                                  }
                                  let uniqueId = uniqueIds[index]
                                  index = index + 1
                                  guard let instance = anyFetch(uniqueId: uniqueId, transaction: transaction) else {
                                      owsFailDebug("Missing instance.")
                                      return
                                  }
                                  instance.anyRemove(transaction: transaction)
            })
        } catch {
            owsFailDebug("Error: \(error)")
        }

        if shouldBeIndexedForFTS {
            FullTextSearchFinder.allModelsWereRemoved(collection: collection(), transaction: transaction)
        }
    }

    class func anyExists(uniqueId: String,
                        transaction: SDSAnyReadTransaction) -> Bool {
        assert(uniqueId.count > 0)

        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            return ydbTransaction.hasObject(forKey: uniqueId, inCollection: TSAttachment.collection())
        case .grdbRead(let grdbTransaction):
            let sql = "SELECT EXISTS ( SELECT 1 FROM \(AttachmentRecord.databaseTableName) WHERE \(attachmentColumn: .uniqueId) = ? )"
            let arguments: StatementArguments = [uniqueId]
            return try! Bool.fetchOne(grdbTransaction.database, sql: sql, arguments: arguments) ?? false
        }
    }
}

// MARK: - Swift Fetch

public extension TSAttachment {
    class func grdbFetchCursor(sql: String,
                               arguments: StatementArguments = StatementArguments(),
                               transaction: GRDBReadTransaction) -> TSAttachmentCursor {
        do {
            let sqlRequest = SQLRequest<Void>(sql: sql, arguments: arguments, cached: true)
            let cursor = try AttachmentRecord.fetchCursor(transaction.database, sqlRequest)
            return TSAttachmentCursor(cursor: cursor)
        } catch {
            Logger.error("sql: \(sql)")
            owsFailDebug("Read failed: \(error)")
            return TSAttachmentCursor(cursor: nil)
        }
    }

    class func grdbFetchOne(sql: String,
                            arguments: StatementArguments = StatementArguments(),
                            transaction: GRDBReadTransaction) -> TSAttachment? {
        assert(sql.count > 0)

        do {
            let sqlRequest = SQLRequest<Void>(sql: sql, arguments: arguments, cached: true)
            guard let record = try AttachmentRecord.fetchOne(transaction.database, sqlRequest) else {
                return nil
            }

            return try TSAttachment.fromRecord(record)
        } catch {
            owsFailDebug("error: \(error)")
            return nil
        }
    }
}

// MARK: - SDSSerializer

// The SDSSerializer protocol specifies how to insert and update the
// row that corresponds to this model.
class TSAttachmentSerializer: SDSSerializer {

    private let model: TSAttachment
    public required init(model: TSAttachment) {
        self.model = model
    }

    // MARK: - Record

    func asRecord() throws -> SDSRecord {
        let id: Int64? = nil

        let recordType: SDSRecordType = .attachment
        let uniqueId: String = model.uniqueId

        // Base class properties
        let albumMessageId: String? = model.albumMessageId
        let attachmentSchemaVersion: UInt = model.attachmentSchemaVersion
        let attachmentType: TSAttachmentType = model.attachmentType
        let byteCount: UInt32 = model.byteCount
        let caption: String? = model.caption
        let contentType: String = model.contentType
        let encryptionKey: Data? = model.encryptionKey
        let isDownloaded: Bool = model.isDownloaded
        let serverId: UInt64 = model.serverId
        let sourceFilename: String? = model.sourceFilename

        // Subclass properties
        let cachedAudioDurationSeconds: Double? = nil
        let cachedImageHeight: Double? = nil
        let cachedImageWidth: Double? = nil
        let creationTimestamp: Double? = nil
        let digest: Data? = nil
        let isUploaded: Bool? = nil
        let isValidImageCached: Bool? = nil
        let isValidVideoCached: Bool? = nil
        let lazyRestoreFragmentId: String? = nil
        let localRelativeFilePath: String? = nil
        let mediaSize: Data? = nil
        let mostRecentFailureLocalizedText: String? = nil
        let pointerType: TSAttachmentPointerType? = nil
        let shouldAlwaysPad: Bool? = nil
        let state: TSAttachmentPointerState? = nil

        return AttachmentRecord(id: id, recordType: recordType, uniqueId: uniqueId, albumMessageId: albumMessageId, attachmentSchemaVersion: attachmentSchemaVersion, attachmentType: attachmentType, byteCount: byteCount, caption: caption, contentType: contentType, encryptionKey: encryptionKey, isDownloaded: isDownloaded, serverId: serverId, sourceFilename: sourceFilename, cachedAudioDurationSeconds: cachedAudioDurationSeconds, cachedImageHeight: cachedImageHeight, cachedImageWidth: cachedImageWidth, creationTimestamp: creationTimestamp, digest: digest, isUploaded: isUploaded, isValidImageCached: isValidImageCached, isValidVideoCached: isValidVideoCached, lazyRestoreFragmentId: lazyRestoreFragmentId, localRelativeFilePath: localRelativeFilePath, mediaSize: mediaSize, mostRecentFailureLocalizedText: mostRecentFailureLocalizedText, pointerType: pointerType, shouldAlwaysPad: shouldAlwaysPad, state: state)
    }
}
