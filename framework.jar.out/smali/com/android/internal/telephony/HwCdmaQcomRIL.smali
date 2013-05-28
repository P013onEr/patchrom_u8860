.class public Lcom/android/internal/telephony/HwCdmaQcomRIL;
.super Lcom/android/internal/telephony/HwQcomRIL;
.source "HwCdmaQcomRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# static fields
.field public static final SEND_SMS_TIMEOUT_IN_MS:J = 0x7530L


# instance fields
.field RILJ_LOGD:Z

.field RILJ_LOGV:Z

.field private mIsSendingSMS:Z

.field private mSMSLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .registers 5
    .parameter "context"
    .parameter "networkMode"
    .parameter "cdmaSubscription"

    .prologue
    const/4 v0, 0x1

    .line 61
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/HwQcomRIL;-><init>(Landroid/content/Context;II)V

    .line 54
    iput-boolean v0, p0, Lcom/android/internal/telephony/HwCdmaQcomRIL;->RILJ_LOGV:Z

    .line 55
    iput-boolean v0, p0, Lcom/android/internal/telephony/HwCdmaQcomRIL;->RILJ_LOGD:Z

    .line 56
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/HwCdmaQcomRIL;->mSMSLock:Ljava/lang/Object;

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/HwCdmaQcomRIL;->mIsSendingSMS:Z

    .line 62
    return-void
.end method


# virtual methods
.method protected notifyRegistrantsCdmaInfoRec(Lcom/android/internal/telephony/cdma/CdmaInformationRecords;)V
    .registers 8
    .parameter "infoRec"

    .prologue
    const/16 v5, 0x403

    .line 167
    const/16 v0, 0x403

    .line 169
    .local v0, response:I
    iget-object v2, p1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords;->record:Ljava/lang/Object;

    instance-of v2, v2, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;

    if-eqz v2, :cond_53

    .line 170
    iget-object v1, p1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords;->record:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;

    .line 171
    .local v1, sir:Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;
    if-eqz v1, :cond_53

    iget-boolean v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->isPresent:Z

    if-eqz v2, :cond_53

    iget v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->signalType:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_53

    iget v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->alertPitch:I

    if-nez v2, :cond_53

    iget v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->signal:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_53

    .line 177
    const-string v2, "RILJ"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Dropping \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v5}, Lcom/android/internal/telephony/HwCdmaQcomRIL;->responseToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v5, v1}, Lcom/android/internal/telephony/HwCdmaQcomRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\" to prevent \"ring of death\" bug."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    .end local v1           #sir:Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;
    :goto_52
    return-void

    .line 184
    :cond_53
    invoke-super {p0, p1}, Lcom/android/internal/telephony/HwQcomRIL;->notifyRegistrantsCdmaInfoRec(Lcom/android/internal/telephony/cdma/CdmaInformationRecords;)V

    goto :goto_52
.end method

.method protected responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 4
    .parameter "p"

    .prologue
    .line 191
    iget-object v1, p0, Lcom/android/internal/telephony/HwCdmaQcomRIL;->mSMSLock:Ljava/lang/Object;

    monitor-enter v1

    .line 192
    const/4 v0, 0x0

    :try_start_4
    iput-boolean v0, p0, Lcom/android/internal/telephony/HwCdmaQcomRIL;->mIsSendingSMS:Z

    .line 193
    iget-object v0, p0, Lcom/android/internal/telephony/HwCdmaQcomRIL;->mSMSLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 194
    monitor-exit v1
    :try_end_c
    .catchall {:try_start_4 .. :try_end_c} :catchall_11

    .line 196
    invoke-super {p0, p1}, Lcom/android/internal/telephony/HwQcomRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 194
    :catchall_11
    move-exception v0

    :try_start_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    throw v0
.end method

.method protected responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 10
    .parameter "p"

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x7

    const/4 v5, -0x1

    .line 107
    const/16 v1, 0xc

    .line 110
    .local v1, numInts:I
    new-array v2, v1, [I

    .line 111
    .local v2, response:[I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_9
    if-ge v0, v1, :cond_14

    .line 112
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    aput v3, v2, v0

    .line 111
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 115
    :cond_14
    aget v3, v2, v6

    const/16 v4, 0x63

    if-ne v3, v4, :cond_2b

    .line 119
    aput v5, v2, v6

    .line 120
    aput v5, v2, v7

    .line 121
    const/16 v3, 0x9

    aput v5, v2, v3

    .line 122
    const/16 v3, 0xa

    aput v5, v2, v3

    .line 123
    const/16 v3, 0xb

    aput v5, v2, v3

    .line 127
    :goto_2a
    return-object v2

    .line 125
    :cond_2b
    aget v3, v2, v7

    mul-int/lit8 v3, v3, -0x1

    aput v3, v2, v7

    goto :goto_2a
.end method

.method public sendCdmaSms([BLandroid/os/Message;)V
    .registers 15
    .parameter "pdu"
    .parameter "result"

    .prologue
    const-wide/16 v10, 0x0

    .line 70
    iget-object v5, p0, Lcom/android/internal/telephony/HwCdmaQcomRIL;->mSMSLock:Ljava/lang/Object;

    monitor-enter v5

    .line 71
    :try_start_5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    const-wide/16 v8, 0x7530

    add-long v0, v6, v8

    .line 72
    .local v0, timeoutTime:J
    const-wide/16 v2, 0x7530

    .line 73
    .local v2, waitTimeLeft:J
    :goto_f
    iget-boolean v4, p0, Lcom/android/internal/telephony/HwCdmaQcomRIL;->mIsSendingSMS:Z

    if-eqz v4, :cond_2b

    cmp-long v4, v2, v10

    if-lez v4, :cond_2b

    .line 74
    const-string v4, "RILJ"

    const-string/jumbo v6, "sendCdmaSms() waiting for response of previous CDMA_SEND_SMS"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1f
    .catchall {:try_start_5 .. :try_end_1f} :catchall_3f

    .line 76
    :try_start_1f
    iget-object v4, p0, Lcom/android/internal/telephony/HwCdmaQcomRIL;->mSMSLock:Ljava/lang/Object;

    invoke-virtual {v4, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_24
    .catchall {:try_start_1f .. :try_end_24} :catchall_3f
    .catch Ljava/lang/InterruptedException; {:try_start_1f .. :try_end_24} :catch_42

    .line 80
    :goto_24
    :try_start_24
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long v2, v0, v6

    goto :goto_f

    .line 82
    :cond_2b
    cmp-long v4, v2, v10

    if-gtz v4, :cond_37

    .line 83
    const-string v4, "RILJ"

    const-string/jumbo v6, "sendCdmaSms() timed out waiting for response of previous CDMA_SEND_SMS"

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    :cond_37
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/android/internal/telephony/HwCdmaQcomRIL;->mIsSendingSMS:Z

    .line 86
    monitor-exit v5
    :try_end_3b
    .catchall {:try_start_24 .. :try_end_3b} :catchall_3f

    .line 88
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/HwQcomRIL;->sendCdmaSms([BLandroid/os/Message;)V

    .line 89
    return-void

    .line 86
    .end local v0           #timeoutTime:J
    .end local v2           #waitTimeLeft:J
    :catchall_3f
    move-exception v4

    :try_start_40
    monitor-exit v5
    :try_end_41
    .catchall {:try_start_40 .. :try_end_41} :catchall_3f

    throw v4

    .line 77
    .restart local v0       #timeoutTime:J
    .restart local v2       #waitTimeLeft:J
    :catch_42
    move-exception v4

    goto :goto_24
.end method
