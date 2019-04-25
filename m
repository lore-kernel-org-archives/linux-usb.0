Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A6EC43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:01:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03A0A206BA
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:01:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="G8acgpQ1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="smnxbDTI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfDYOBE (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 10:01:04 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:35704 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726317AbfDYOBD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 10:01:03 -0400
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com [10.13.135.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 35EB6C09DF;
        Thu, 25 Apr 2019 14:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1556200865; bh=HXEJ9pIeR7cWh2eA5oHDdMg+CrTmHfu2CuK5RnhY7kA=;
        h=From:To:CC:Subject:Date:References:From;
        b=G8acgpQ1Sy6AtaBNdMjlDhesAvOOFLcpybbDs/x5anVaQIf6J1XJEUw7t/KHzbsUj
         USczYAQMx0P5JP70DEZGZuijuFuqEhFTX7suHt4cfQOi3lPV3UeKQOnerpFDX/XIxR
         Q7+pwyItM/u3uHI//79f5utHqje7FAioxYqpc0imDzE6S8x+gXpRDw60CMurrp17Sg
         FBBgurWkjvV0gbVQ6FDEyrPc1fnNUUAjHb39MPtQ3Qi9dFb/bUxiPKoophfFw2UaMi
         RsYPwgwpj99j+ZLUl/s8TI/gyYlQPnISfxHRqFX0hD36kRJUtWwFEQXwBKofNKxya9
         QxTicAxpNvFdQ==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id BDCF6A00B5;
        Thu, 25 Apr 2019 14:01:02 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 25 Apr 2019 07:01:02 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 25 Apr 2019 07:01:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0mHbMuU4+EoZ6GMfOYf5vvjSnlqLoJbE06KrS7hwGg=;
 b=smnxbDTIUzWz5AIQ+igfKwVy/AQh/Vx6z1+iPPhoZWBQF7M7cVbqwwAXEkkh81o8sAXCgYJ4zlxmtVUzT0GU0PCg4c2EOWgEvp6npPK84k1tPE30ONaOTBZTqM5MEugMOZ0DGl0DQDMfro05/6BlY84lSQ7vuGvAIvprjcQwuDo=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB0656.namprd12.prod.outlook.com (10.163.208.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.16; Thu, 25 Apr 2019 14:00:59 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::1982:4b45:2adf:9a1f%4]) with mapi id 15.20.1835.010; Thu, 25 Apr 2019
 14:00:59 +0000
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v1 00/14] usb: dwc2: Fix and improve power saving modes.
Thread-Topic: [PATCH v1 00/14] usb: dwc2: Fix and improve power saving modes.
Thread-Index: AQHU9qJP9TPmzBH3xU6dprNhQakiQw==
Date:   Thu, 25 Apr 2019 14:00:59 +0000
Message-ID: <SN1PR12MB2431EB450993E07730C3672FA73D0@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555672441.git.arturp@synopsys.com>
 <87k1fis1b5.fsf@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [84.53.141.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c4675bb-4008-4266-931d-08d6c986721d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:SN1PR12MB0656;
x-ms-traffictypediagnostic: SN1PR12MB0656:
x-microsoft-antispam-prvs: <SN1PR12MB0656DDA8198B518D0C6D5330A73D0@SN1PR12MB0656.namprd12.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(136003)(346002)(366004)(376002)(396003)(31014005)(199004)(189003)(5660300002)(316002)(52536014)(186003)(6506007)(110136005)(107886003)(33656002)(76176011)(53546011)(6246003)(446003)(68736007)(486006)(4326008)(97736004)(478600001)(229853002)(14454004)(25786009)(71190400001)(71200400001)(476003)(305945005)(9686003)(102836004)(6116002)(81156014)(14444005)(2501003)(7736002)(256004)(66946007)(26005)(8936002)(7696005)(3846002)(73956011)(66476007)(76116006)(91956017)(53936002)(8676002)(66446008)(64756008)(86362001)(66556008)(2906002)(6436002)(81166006)(66066001)(55016002)(74316002)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB0656;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q8ypzkiEXTOVnbcdTOzW0y8PXJGHtHCCVNzefOgsGWxOyD/eQuMX75UHnX0J8Ivbm0TiY+FXY3DjM6WOHN/tKtJPX9AYH2ISZSHdNbHJd5u5j9G2HKyoEh4Kudpo/5G+P6Qwj9ib+d8H1CJB2kFa3wKRfY9FoePm596dLusZERwvzYooxgNWPEbaeRKGau7XovFqeW/2A3hHPXqW2U+E9b09lk4wljS/lncd3uY0UuvfJ5ZqZdRs04mxHEqjRr5Ptdf/z9Lsggc2C+nvTukxb+3PJIMYfuAOlnbunbZ9G6vJSlz+H93UUcmwEIyJ7GC0LbVUqoKbRzzWKA77tdDb3vu9GTTDo0NYJC5i2uZKEV7obbyHMgk8GvGensHeJ9F12P0pkXNXGgyrj4kmkYUttUZ2ti10N8iZ3OslVP2H+Os=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4675bb-4008-4266-931d-08d6c986721d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 14:00:59.5014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0656
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
On 4/25/2019 16:43, Felipe Balbi wrote:=0A=
> Artur Petrosyan <Arthur.Petrosyan@synopsys.com> writes:=0A=
>> This patch set, fixes and improves partial power down and hibernation po=
wer=0A=
>> saving modes. Also, adds support for entering/exiting hibernation by=0A=
>> system issued suspend/resume.=0A=
>>=0A=
>> This series contains patches which were submitted to LKML. However, a pa=
rt=0A=
>> of those patches didn't reach to LKML because of local issue related to=
=0A=
>> smtp server.=0A=
>>=0A=
>> The patches which reached to LKML are:=0A=
>>=0A=
>> - usb: dwc2: Add part. power down exit from dwc2_conn_id_status_change()=
.=0A=
>> - usb: dwc2: Add port conn. sts. checking in _dwc2_hcd_resume() function=
.=0A=
>> - usb: dwc2: Fix suspend state in host mode for partial power down.=0A=
>> - usb: dwc2: Fix wakeup detected and session request interrupt handlers.=
=0A=
>> - usb: dwc2: Add descriptive debug messages for Partial Power Down mode.=
=0A=
>> - usb: dwc2: Fix dwc2_restore_device_registers() function.=0A=
>>=0A=
>> The patches which didn't reach to LKML are:=0A=
>>=0A=
>> - usb: dwc2: Add enter/exit hibernation from system issued suspend/resum=
e=0A=
>> - usb: dwc2: Clear GINTSTS_RESTOREDONE bit after restore is generated.=
=0A=
>> - usb: dwc2: Clear fifo_map when resetting core.=0A=
>> - usb: dwc2: Allow exiting hibernation from gpwrdn rst detect=0A=
>> - usb: dwc2: Fix hibernation between host and device modes.=0A=
>> - usb: dwc2: Update dwc2_handle_usb_suspend_intr function.=0A=
>> - usb: dwc2: Add default param to control power optimization.=0A=
>> - usb: dwc2: Reset DEVADDR after exiting gadget hibernation.=0A=
>>=0A=
>> Submitting all of the patches together in this version.=0A=
>>=0A=
>> Changes from V0:=0A=
>>   - Replaced 1 with DWC2_POWER_DOWN_PARAM_PARTIAL in commit=0A=
>>     "9eed02b9fe96 usb: dwc2: Fix wakeup detected and session request=0A=
>>     interrupt handlers.=0A=
>>=0A=
>>=0A=
>> Artur Petrosyan (14):=0A=
>>    usb: dwc2: Fix dwc2_restore_device_registers() function.=0A=
>>    usb: dwc2: Add descriptive debug messages for Partial Power Down mode=
.=0A=
>>    usb: dwc2: Fix wakeup detected and session request interrupt handlers=
.=0A=
>>    usb: dwc2: Fix suspend state in host mode for partial power down.=0A=
>>    usb: dwc2: Add port conn. sts. checking in _dwc2_hcd_resume()=0A=
>>      function.=0A=
>>    usb: dwc2: Add part. power down exit from=0A=
>>      dwc2_conn_id_status_change().=0A=
>>    usb: dwc2: Reset DEVADDR after exiting gadget hibernation.=0A=
>>    usb: dwc2: Add default param to control power optimization.=0A=
>>    usb: dwc2: Update dwc2_handle_usb_suspend_intr function.=0A=
>>    usb: dwc2: Fix hibernation between host and device modes.=0A=
>>    usb: dwc2: Allow exiting hibernation from gpwrdn rst detect=0A=
>>    usb: dwc2: Clear fifo_map when resetting core.=0A=
>>    usb: dwc2: Clear GINTSTS_RESTOREDONE bit after restore is generated.=
=0A=
>>    usb: dwc2: Add enter/exit hibernation from system issued=0A=
>>      suspend/resume=0A=
> =0A=
> patches don't apply.=0A=
> =0A=
=0A=
Do we need to wait for Minas's acknowledge or there is problem related =0A=
to the patches?=0A=
=0A=
-- =0A=
Regards,=0A=
Artur=0A=
