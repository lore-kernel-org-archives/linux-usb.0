Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF40C10F0E
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 07:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E1D520833
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 07:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LMpsI7NV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="wki7thKM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbfDOH6y (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 03:58:54 -0400
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]:56992 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfDOH6y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 03:58:54 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id 9434110C2A47;
        Mon, 15 Apr 2019 00:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1555315133; bh=YaX9I1Av+AzYSmHWebZ3CcqRtzBOMZ62OruGTRpooY4=;
        h=From:To:CC:Subject:Date:References:From;
        b=LMpsI7NViAbBZy6lV3ky0ReHbXy3NS8X8j/C8boznGHHh0OA4kEPq5WJom+k7ob5P
         gwpuTTx+qfke71ue09I71LxhCv9eSZGr+FvpuXzc8En1tM387dZvZ7IAaiHU9jcXhZ
         X8Y8VNU2y40DPK0X97YNjYy+0jKLOLRFsKdz5N3HJ2KhraKk4zglkU6QmxwGKIxF9i
         wphI73ta2A+GWslfTGh9qmGd9zSWHEHE2UBOCNnNWrwQ0v7on7uwY5E7uClV3YBcfC
         EHvtnHNPYlwDI1ACKm4iIxcTdUjssBSYGX1dPQnyR96qkzfDderbIY4PtidhDetNsa
         bPvovyeOuyMVg==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id D9096A00A8;
        Mon, 15 Apr 2019 07:58:52 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 15 Apr 2019 00:58:52 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 15 Apr 2019 00:58:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbuEnb+urs8AkayMvUrzlRzMNICsgb+hDP4ELNjJ/VQ=;
 b=wki7thKMGyLpDNse3Ed9liTYa9sViiZiZPEFMZkpRaNu4ISYi5POjBedGfk5fz9gxBJ1pCh9fiMDU3XqojtO6BBYeAoD9dGzr6rJ/brki0ErKgy9v1S4861azddmKgjUWZQBG/K2mVbls9vHW7GRfFnYitxMqzJXL78CG9b+Cg8=
Received: from SN1PR12MB2431.namprd12.prod.outlook.com (52.132.195.146) by
 SN1PR12MB2352.namprd12.prod.outlook.com (52.132.194.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.19; Mon, 15 Apr 2019 07:58:50 +0000
Received: from SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a]) by SN1PR12MB2431.namprd12.prod.outlook.com
 ([fe80::5ca6:ee5f:1147:df5a%4]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 07:58:50 +0000
From:   Artur Petrosyan <arthur.petrosyan@synopsys.com>
To:     Jules Maselbas <jmaselbas@kalray.eu>,
        Artur Petrosyan <arthur.petrosyan@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <john.youn@synopsys.com>
Subject: Re: [PATCH 03/14] usb: dwc2: Fix wakeup detected and session request
 interrupt handlers.
Thread-Topic: [PATCH 03/14] usb: dwc2: Fix wakeup detected and session request
 interrupt handlers.
Thread-Index: AQHU8TUTrNB2kRZJNkiYNB9jBPLdtw==
Date:   Mon, 15 Apr 2019 07:58:50 +0000
Message-ID:
 <SN1PR12MB24312BEEBE4CDE8196D117BAA72B0@SN1PR12MB2431.namprd12.prod.outlook.com>
References: <cover.1555075927.git.arturp@synopsys.com>
 <8f99e3ceb45ede4526363bd9b44d417a6b6ff5cd.1555075928.git.arturp@synopsys.com>
 <20190412142044.e3lojhrhpwe3d7pe@tellis.lin.mbt.kalray.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=arturp@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab8d9109-cd1f-481d-7298-08d6c17832a0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:SN1PR12MB2352;
x-ms-traffictypediagnostic: SN1PR12MB2352:
x-microsoft-antispam-prvs: <SN1PR12MB235299352CD5BAC43FDC6A4AA72B0@SN1PR12MB2352.namprd12.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(39830400003)(376002)(136003)(346002)(199004)(189003)(86362001)(186003)(106356001)(53546011)(102836004)(26005)(76176011)(105586002)(486006)(25786009)(97736004)(446003)(14454004)(7696005)(74316002)(5660300002)(476003)(6506007)(478600001)(6246003)(2906002)(107886003)(8936002)(81166006)(81156014)(8676002)(53936002)(66066001)(9686003)(52536014)(6436002)(6116002)(3846002)(54906003)(7736002)(305945005)(33656002)(4326008)(68736007)(229853002)(71190400001)(14444005)(71200400001)(256004)(316002)(99286004)(55016002)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:SN1PR12MB2352;H:SN1PR12MB2431.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1v31rCjIyHJwd+ABGnuQiAVcpyj0MbzimYExPmGG6VTFdX7z94HwxwmMksHRxnjl3TZaM2nB9LwbkJtcvthXBrtf2W9fhjekiO7J18BEq4Innp2+VK7VgAX1s02+Yf8ck3pqQIkbyZzcgYptIW3DEEk+Xx0Ei0QPJPLuBq1lmWbzu0NyROQ4raT/HMxFdoWHdVjc2GXcVqmoyaSaxuCFwHm6HWBkoSJgFkwwfbIJYtHUpWaqJBXFH6tQmsxuRGUhbUPKLQoqgedPm/T9CL82fTvdtsE/Ry8qc6+rn4G87462fMzYIjw0doxv5F0Tg0Il108GKMcGVqFMJAwRFBnBLC1a8Wb2wxMl+YrbJHGnQgbTGu+GmbwmYC2N+UocQyRR28NtZhvP/FgH2j9w5hcKs1VYyDPnKT24UMlNdrQmUHQ=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8d9109-cd1f-481d-7298-08d6c17832a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 07:58:50.8285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2352
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415075850.dfon6cvLKR61M6rqasJljFolFFstzGapGdOpKJXNnuk@z>

Hi Jules,=0A=
=0A=
On 4/12/2019 18:21, Jules Maselbas wrote:=0A=
> Hi Artur,=0A=
> =0A=
> On Fri, Apr 12, 2019 at 01:38:56PM +0000, Artur Petrosyan wrote:=0A=
>> In host mode port power must be turned on when wakeup=0A=
>> detected or session request interrupt is detected.=0A=
>> Because, otherwise core wouldn't exit form partial=0A=
>> power down.=0A=
>>=0A=
>> - Turned on the port power by setting HPRT0_PWR bit.=0A=
>>=0A=
>> - Called dwc2_hcd_connect() function after enabling=0A=
>>    the power of the port.=0A=
>>=0A=
>> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>=0A=
>> ---=0A=
>>   drivers/usb/dwc2/core_intr.c | 24 +++++++++++++++++++++---=0A=
>>   1 file changed, 21 insertions(+), 3 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c=
=0A=
>> index 19ae2595f1c3..ce523fd2b1b4 100644=0A=
>> --- a/drivers/usb/dwc2/core_intr.c=0A=
>> +++ b/drivers/usb/dwc2/core_intr.c=0A=
>> @@ -312,6 +312,7 @@ static void dwc2_handle_conn_id_status_change_intr(s=
truct dwc2_hsotg *hsotg)=0A=
>>   static void dwc2_handle_session_req_intr(struct dwc2_hsotg *hsotg)=0A=
>>   {=0A=
>>   	int ret;=0A=
>> +	u32 hprt0;=0A=
>>   =0A=
>>   	/* Clear interrupt */=0A=
>>   	dwc2_writel(hsotg, GINTSTS_SESSREQINT, GINTSTS);=0A=
>> @@ -320,7 +321,8 @@ static void dwc2_handle_session_req_intr(struct dwc2=
_hsotg *hsotg)=0A=
>>   		hsotg->lx_state);=0A=
>>   =0A=
>>   	if (dwc2_is_device_mode(hsotg)) {=0A=
>> -		if (hsotg->lx_state =3D=3D DWC2_L2) {=0A=
>> +		if (hsotg->lx_state =3D=3D DWC2_L2 &&=0A=
>> +		    hsotg->params.power_down =3D=3D 1) {=0A=
> I think you can replace 1 with DWC2_POWER_DOWN_PARAM_PARTIAL.=0A=
=0A=
Thank you for the review. Yeah, you are right it should be updated.=0A=
=0A=
> =0A=
> [snip]=0A=
> =0A=
> ---=0A=
> Best,=0A=
> Jules=0A=
> =0A=
> =0A=
=0A=
