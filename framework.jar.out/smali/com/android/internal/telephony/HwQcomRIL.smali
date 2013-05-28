.class public Lcom/android/internal/telephony/HwQcomRIL;
.super Lcom/android/internal/telephony/QualcommSharedRIL;
.source "HwQcomRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# static fields
.field public static final SEND_SMS_TIMEOUT_IN_MS:J = 0x7530L


# instance fields
.field RILJ_LOGD:Z

.field RILJ_LOGV:Z

.field private final RIL_INT_RADIO_OFF:I

.field private final RIL_INT_RADIO_ON:I

.field private final RIL_INT_RADIO_ON_NG:I

.field private final RIL_INT_RADIO_UNAVALIABLE:I

.field private mIsSendingSMS:Z

.field private mSMSLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .registers 7
    .parameter "context"
    .parameter "networkMode"
    .parameter "cdmaSubscription"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 60
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/QualcommSharedRIL;-><init>(Landroid/content/Context;II)V

    .line 47
    iput-boolean v1, p0, Lcom/android/internal/telephony/HwQcomRIL;->RILJ_LOGV:Z

    .line 48
    iput-boolean v1, p0, Lcom/android/internal/telephony/HwQcomRIL;->RILJ_LOGD:Z

    .line 50
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/HwQcomRIL;->mSMSLock:Ljava/lang/Object;

    .line 51
    iput-boolean v2, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIsSendingSMS:Z

    .line 54
    iput v2, p0, Lcom/android/internal/telephony/HwQcomRIL;->RIL_INT_RADIO_OFF:I

    .line 55
    iput v1, p0, Lcom/android/internal/telephony/HwQcomRIL;->RIL_INT_RADIO_UNAVALIABLE:I

    .line 56
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/telephony/HwQcomRIL;->RIL_INT_RADIO_ON:I

    .line 57
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/internal/telephony/HwQcomRIL;->RIL_INT_RADIO_ON_NG:I

    .line 61
    const/4 v0, 0x4

    iput v0, p0, Lcom/android/internal/telephony/HwQcomRIL;->mQANElements:I

    .line 62
    return-void
.end method

.method private setRadioStateFromRILInt(I)V
    .registers 8
    .parameter "stateCode"

    .prologue
    const/4 v4, 0x0

    .line 200
    sparse-switch p1, :sswitch_data_56

    .line 226
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unrecognized RIL_RadioState: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 202
    :sswitch_1d
    sget-object v2, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_OFF:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    .line 203
    .local v2, radioState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    iget-object v3, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIccHandler:Lcom/android/internal/telephony/QualcommSharedRIL$IccHandler;

    if-eqz v3, :cond_27

    .line 204
    iput-object v4, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIccThread:Landroid/os/HandlerThread;

    .line 205
    iput-object v4, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIccHandler:Lcom/android/internal/telephony/QualcommSharedRIL$IccHandler;

    .line 229
    :cond_27
    :goto_27
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/HwQcomRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    .line 230
    return-void

    .line 209
    .end local v2           #radioState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    :sswitch_2b
    sget-object v2, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_UNAVAILABLE:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    .line 210
    .restart local v2       #radioState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    goto :goto_27

    .line 213
    .end local v2           #radioState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    :sswitch_2e
    iget-object v3, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIccHandler:Lcom/android/internal/telephony/QualcommSharedRIL$IccHandler;

    if-nez v3, :cond_52

    .line 214
    new-instance v0, Landroid/os/HandlerThread;

    const-string v3, "IccHandler"

    invoke-direct {v0, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 215
    .local v0, handlerThread:Landroid/os/HandlerThread;
    iput-object v0, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIccThread:Landroid/os/HandlerThread;

    .line 217
    iget-object v3, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIccThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->start()V

    .line 219
    iget-object v3, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIccThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    .line 220
    .local v1, looper:Landroid/os/Looper;
    new-instance v3, Lcom/android/internal/telephony/QualcommSharedRIL$IccHandler;

    invoke-direct {v3, p0, p0, v1}, Lcom/android/internal/telephony/QualcommSharedRIL$IccHandler;-><init>(Lcom/android/internal/telephony/QualcommSharedRIL;Lcom/android/internal/telephony/RIL;Landroid/os/Looper;)V

    iput-object v3, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIccHandler:Lcom/android/internal/telephony/QualcommSharedRIL$IccHandler;

    .line 221
    iget-object v3, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIccHandler:Lcom/android/internal/telephony/QualcommSharedRIL$IccHandler;

    invoke-virtual {v3}, Lcom/android/internal/telephony/QualcommSharedRIL$IccHandler;->run()V

    .line 223
    .end local v0           #handlerThread:Landroid/os/HandlerThread;
    .end local v1           #looper:Landroid/os/Looper;
    :cond_52
    sget-object v2, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_ON:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    .line 224
    .restart local v2       #radioState:Lcom/android/internal/telephony/CommandsInterface$RadioState;
    goto :goto_27

    .line 200
    nop

    :sswitch_data_56
    .sparse-switch
        0x0 -> :sswitch_1d
        0x1 -> :sswitch_2b
        0x2 -> :sswitch_2e
        0xa -> :sswitch_2e
    .end sparse-switch
.end method


# virtual methods
.method protected processUnsolicited(Landroid/os/Parcel;)V
    .registers 9
    .parameter "p"

    .prologue
    const/4 v6, 0x0

    .line 126
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 127
    .local v0, dataPosition:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 129
    .local v1, response:I
    sparse-switch v1, :sswitch_data_52

    .line 139
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 142
    invoke-super {p0, p1}, Lcom/android/internal/telephony/QualcommSharedRIL;->processUnsolicited(Landroid/os/Parcel;)V

    .line 165
    :cond_12
    :goto_12
    :sswitch_12
    return-void

    .line 130
    :sswitch_13
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/HwQcomRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .line 146
    .local v2, ret:Ljava/lang/Object;
    :goto_17
    sparse-switch v1, :sswitch_data_6c

    goto :goto_12

    .line 148
    :sswitch_1b
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 149
    .local v3, state:I
    invoke-direct {p0, v3}, Lcom/android/internal/telephony/HwQcomRIL;->setRadioStateFromRILInt(I)V

    goto :goto_12

    .line 131
    .end local v2           #ret:Ljava/lang/Object;
    .end local v3           #state:I
    :sswitch_23
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/HwQcomRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2       #ret:Ljava/lang/Object;
    goto :goto_17

    .line 132
    .end local v2           #ret:Ljava/lang/Object;
    :sswitch_28
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/HwQcomRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2       #ret:Ljava/lang/Object;
    goto :goto_17

    .line 133
    .end local v2           #ret:Ljava/lang/Object;
    :sswitch_2d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/HwQcomRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2       #ret:Ljava/lang/Object;
    goto :goto_17

    .line 134
    .end local v2           #ret:Ljava/lang/Object;
    :sswitch_32
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/HwQcomRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2       #ret:Ljava/lang/Object;
    goto :goto_17

    .line 135
    .end local v2           #ret:Ljava/lang/Object;
    :sswitch_37
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/HwQcomRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    .restart local v2       #ret:Ljava/lang/Object;
    goto :goto_17

    .line 155
    :sswitch_3c
    iget-boolean v4, p0, Lcom/android/internal/telephony/HwQcomRIL;->RILJ_LOGD:Z

    if-eqz v4, :cond_43

    invoke-virtual {p0, v1, v2}, Lcom/android/internal/telephony/HwQcomRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 157
    :cond_43
    iget-object v4, p0, Lcom/android/internal/telephony/HwQcomRIL;->mExitEmergencyCallbackModeRegistrants:Landroid/os/RegistrantList;

    if-eqz v4, :cond_12

    .line 158
    iget-object v4, p0, Lcom/android/internal/telephony/HwQcomRIL;->mExitEmergencyCallbackModeRegistrants:Landroid/os/RegistrantList;

    new-instance v5, Landroid/os/AsyncResult;

    invoke-direct {v5, v6, v6, v6}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v4, v5}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto :goto_12

    .line 129
    :sswitch_data_52
    .sparse-switch
        0x3e8 -> :sswitch_13
        0x40a -> :sswitch_23
        0x40b -> :sswitch_28
        0x40c -> :sswitch_2d
        0x40d -> :sswitch_32
        0x40e -> :sswitch_37
    .end sparse-switch

    .line 146
    :sswitch_data_6c
    .sparse-switch
        0x3e8 -> :sswitch_1b
        0x40b -> :sswitch_12
        0x40c -> :sswitch_12
        0x40d -> :sswitch_3c
    .end sparse-switch
.end method

.method protected responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 11
    .parameter "p"

    .prologue
    .line 69
    new-instance v5, Lcom/android/internal/telephony/IccCardStatus;

    invoke-direct {v5}, Lcom/android/internal/telephony/IccCardStatus;-><init>()V

    .line 70
    .local v5, status:Lcom/android/internal/telephony/IccCardStatus;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/IccCardStatus;->setCardState(I)V

    .line 71
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/IccCardStatus;->setUniversalPinState(I)V

    .line 72
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/IccCardStatus;->setGsmUmtsSubscriptionAppIndex(I)V

    .line 73
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/IccCardStatus;->setCdmaSubscriptionAppIndex(I)V

    .line 74
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/IccCardStatus;->setImsSubscriptionAppIndex(I)V

    .line 76
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 78
    .local v4, numApplications:I
    const/16 v6, 0x8

    if-le v4, v6, :cond_32

    .line 79
    const/16 v4, 0x8

    .line 81
    :cond_32
    invoke-virtual {v5, v4}, Lcom/android/internal/telephony/IccCardStatus;->setNumApplications(I)V

    .line 83
    const/4 v3, 0x0

    .local v3, i:I
    :goto_36
    if-ge v3, v4, :cond_87

    .line 84
    new-instance v2, Lcom/android/internal/telephony/IccCardApplication;

    invoke-direct {v2}, Lcom/android/internal/telephony/IccCardApplication;-><init>()V

    .line 85
    .local v2, ca:Lcom/android/internal/telephony/IccCardApplication;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/android/internal/telephony/IccCardApplication;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/IccCardApplication$AppType;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->app_type:Lcom/android/internal/telephony/IccCardApplication$AppType;

    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/android/internal/telephony/IccCardApplication;->AppStateFromRILInt(I)Lcom/android/internal/telephony/IccCardApplication$AppState;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->app_state:Lcom/android/internal/telephony/IccCardApplication$AppState;

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/android/internal/telephony/IccCardApplication;->PersoSubstateFromRILInt(I)Lcom/android/internal/telephony/IccCardApplication$PersoSubState;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->perso_substate:Lcom/android/internal/telephony/IccCardApplication$PersoSubState;

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->aid:Ljava/lang/String;

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->app_label:Ljava/lang/String;

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    iput v6, v2, Lcom/android/internal/telephony/IccCardApplication;->pin1_replaced:I

    .line 91
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/android/internal/telephony/IccCardApplication;->PinStateFromRILInt(I)Lcom/android/internal/telephony/IccCardStatus$PinState;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->pin1:Lcom/android/internal/telephony/IccCardStatus$PinState;

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v2, v6}, Lcom/android/internal/telephony/IccCardApplication;->PinStateFromRILInt(I)Lcom/android/internal/telephony/IccCardStatus$PinState;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/IccCardApplication;->pin2:Lcom/android/internal/telephony/IccCardStatus$PinState;

    .line 93
    invoke-virtual {v5, v2}, Lcom/android/internal/telephony/IccCardStatus;->addApplication(Lcom/android/internal/telephony/IccCardApplication;)V

    .line 83
    add-int/lit8 v3, v3, 0x1

    goto :goto_36

    .line 95
    .end local v2           #ca:Lcom/android/internal/telephony/IccCardApplication;
    :cond_87
    const-string/jumbo v6, "skipCdma"

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/HwQcomRIL;->needsOldRilFeature(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_f3

    .line 96
    const/4 v0, -0x1

    .line 97
    .local v0, appIndex:I
    iget v6, p0, Lcom/android/internal/telephony/HwQcomRIL;->mPhoneType:I

    const/4 v7, 0x2

    if-ne v6, v7, :cond_f4

    iget-boolean v6, p0, Lcom/android/internal/telephony/HwQcomRIL;->skipCdmaSubcription:Z

    if-nez v6, :cond_f4

    .line 98
    invoke-virtual {v5}, Lcom/android/internal/telephony/IccCardStatus;->getCdmaSubscriptionAppIndex()I

    move-result v0

    .line 99
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "This is a CDMA PHONE "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    :goto_b6
    if-lez v4, :cond_f3

    .line 106
    invoke-virtual {v5, v0}, Lcom/android/internal/telephony/IccCardStatus;->getApplication(I)Lcom/android/internal/telephony/IccCardApplication;

    move-result-object v1

    .line 107
    .local v1, application:Lcom/android/internal/telephony/IccCardApplication;
    iget-object v6, v1, Lcom/android/internal/telephony/IccCardApplication;->aid:Ljava/lang/String;

    iput-object v6, p0, Lcom/android/internal/telephony/HwQcomRIL;->mAid:Ljava/lang/String;

    .line 108
    iget-object v6, v1, Lcom/android/internal/telephony/IccCardApplication;->app_type:Lcom/android/internal/telephony/IccCardApplication$AppType;

    sget-object v7, Lcom/android/internal/telephony/IccCardApplication$AppType;->APPTYPE_USIM:Lcom/android/internal/telephony/IccCardApplication$AppType;

    if-ne v6, v7, :cond_111

    const/4 v6, 0x1

    :goto_c7
    iput-boolean v6, p0, Lcom/android/internal/telephony/HwQcomRIL;->mUSIM:Z

    .line 110
    iget v6, p0, Lcom/android/internal/telephony/HwQcomRIL;->mPreferredNetworkType:I

    iput v6, p0, Lcom/android/internal/telephony/HwQcomRIL;->mSetPreferredNetworkType:I

    .line 112
    iget-object v6, p0, Lcom/android/internal/telephony/HwQcomRIL;->mAid:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_d9

    .line 113
    const-string v6, ""

    iput-object v6, p0, Lcom/android/internal/telephony/HwQcomRIL;->mAid:Ljava/lang/String;

    .line 114
    :cond_d9
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "mAid "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/telephony/HwQcomRIL;->mAid:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .end local v0           #appIndex:I
    .end local v1           #application:Lcom/android/internal/telephony/IccCardApplication;
    :cond_f3
    return-object v5

    .line 101
    .restart local v0       #appIndex:I
    :cond_f4
    invoke-virtual {v5}, Lcom/android/internal/telephony/IccCardStatus;->getGsmUmtsSubscriptionAppIndex()I

    move-result v0

    .line 102
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "This is a GSM PHONE "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_b6

    .line 108
    .restart local v1       #application:Lcom/android/internal/telephony/IccCardApplication;
    :cond_111
    const/4 v6, 0x0

    goto :goto_c7
.end method

.method protected responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 4
    .parameter "p"

    .prologue
    .line 251
    iget-object v1, p0, Lcom/android/internal/telephony/HwQcomRIL;->mSMSLock:Ljava/lang/Object;

    monitor-enter v1

    .line 252
    const/4 v0, 0x0

    :try_start_4
    iput-boolean v0, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIsSendingSMS:Z

    .line 253
    iget-object v0, p0, Lcom/android/internal/telephony/HwQcomRIL;->mSMSLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 254
    monitor-exit v1
    :try_end_c
    .catchall {:try_start_4 .. :try_end_c} :catchall_11

    .line 256
    invoke-super {p0, p1}, Lcom/android/internal/telephony/QualcommSharedRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 254
    :catchall_11
    move-exception v0

    :try_start_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_11

    throw v0
.end method

.method public sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .registers 16
    .parameter "smscPDU"
    .parameter "pdu"
    .parameter "result"

    .prologue
    const-wide/16 v10, 0x0

    .line 173
    iget-object v5, p0, Lcom/android/internal/telephony/HwQcomRIL;->mSMSLock:Ljava/lang/Object;

    monitor-enter v5

    .line 174
    :try_start_5
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    const-wide/16 v8, 0x7530

    add-long v0, v6, v8

    .line 175
    .local v0, timeoutTime:J
    const-wide/16 v2, 0x7530

    .line 176
    .local v2, waitTimeLeft:J
    :goto_f
    iget-boolean v4, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIsSendingSMS:Z

    if-eqz v4, :cond_2b

    cmp-long v4, v2, v10

    if-lez v4, :cond_2b

    .line 177
    const-string v4, "RILJ"

    const-string/jumbo v6, "sendSMS() waiting for response of previous SEND_SMS"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1f
    .catchall {:try_start_5 .. :try_end_1f} :catchall_3f

    .line 179
    :try_start_1f
    iget-object v4, p0, Lcom/android/internal/telephony/HwQcomRIL;->mSMSLock:Ljava/lang/Object;

    invoke-virtual {v4, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_24
    .catchall {:try_start_1f .. :try_end_24} :catchall_3f
    .catch Ljava/lang/InterruptedException; {:try_start_1f .. :try_end_24} :catch_42

    .line 183
    :goto_24
    :try_start_24
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long v2, v0, v6

    goto :goto_f

    .line 185
    :cond_2b
    cmp-long v4, v2, v10

    if-gtz v4, :cond_37

    .line 186
    const-string v4, "RILJ"

    const-string/jumbo v6, "sendSms() timed out waiting for response of previous CDMA_SEND_SMS"

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    :cond_37
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/android/internal/telephony/HwQcomRIL;->mIsSendingSMS:Z

    .line 189
    monitor-exit v5
    :try_end_3b
    .catchall {:try_start_24 .. :try_end_3b} :catchall_3f

    .line 191
    invoke-super {p0, p1, p2, p3}, Lcom/android/internal/telephony/QualcommSharedRIL;->sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 192
    return-void

    .line 189
    .end local v0           #timeoutTime:J
    .end local v2           #waitTimeLeft:J
    :catchall_3f
    move-exception v4

    :try_start_40
    monitor-exit v5
    :try_end_41
    .catchall {:try_start_40 .. :try_end_41} :catchall_3f

    throw v4

    .line 180
    .restart local v0       #timeoutTime:J
    .restart local v2       #waitTimeLeft:J
    :catch_42
    move-exception v4

    goto :goto_24
.end method

.method public setNetworkSelectionModeManual(Ljava/lang/String;Landroid/os/Message;)V
    .registers 6
    .parameter "operatorNumeric"
    .parameter "response"

    .prologue
    .line 235
    const/16 v1, 0x2f

    invoke-static {v1, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 239
    .local v0, rr:Lcom/android/internal/telephony/RILRequest;
    iget-boolean v1, p0, Lcom/android/internal/telephony/HwQcomRIL;->RILJ_LOGD:Z

    if-eqz v1, :cond_38

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/HwQcomRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/HwQcomRIL;->riljLog(Ljava/lang/String;)V

    .line 242
    :cond_38
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 244
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/HwQcomRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 245
    return-void
.end method
