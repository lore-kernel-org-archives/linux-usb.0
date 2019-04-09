Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF35C282DA
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 10:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A20E2133D
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 10:39:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="OL7bUYfk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfDIKjY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 06:39:24 -0400
Received: from mail-eopbgr1410123.outbound.protection.outlook.com ([40.107.141.123]:13440
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726112AbfDIKjY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Apr 2019 06:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adwS9+62MsWvKmLNksNIb8imhBv55I5SFALwX7vgFPc=;
 b=OL7bUYfk/K0CJ/ppzvieBdGuowLOMwNclrVGuah0Z6VbqU53718lpW3+MDYeCCR1mbd3A/78kS+2ffFjGM4XTr2pdttl06U+yUEEipCQVLZ3O2qH3K/ylmg++7/pxUsdN5376/661UhzCKsCREUZQ/+gbYz562uq3pCMh9hlwWc=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB4160.jpnprd01.prod.outlook.com (20.178.140.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Tue, 9 Apr 2019 10:39:20 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 10:39:20 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 03/12] dt-bindings: usb: ehci-r8a77470 devicetree binding
 document
Thread-Topic: [PATCH 03/12] dt-bindings: usb: ehci-r8a77470 devicetree binding
 document
Thread-Index: AQHU6IrgGCxBVePEz0GJdBThUmjJKKYurKOAgATORICAADSMkA==
Date:   Tue, 9 Apr 2019 10:39:19 +0000
Message-ID:
 <TYAPR01MB4271F4407213CCC5469E1B8BD82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
 <1554123232-58942-4-git-send-email-biju.das@bp.renesas.com>
 <5ca841e1.1c69fb81.20175.d3d6@mx.google.com>
 <OSBPR01MB210356D078E426189767D1EDB82D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB210356D078E426189767D1EDB82D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cef0ed7c-b6a0-4924-c88e-08d6bcd79f94
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4160;
x-ms-traffictypediagnostic: TYAPR01MB4160:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB416020DB0CB9E78186520224D82D0@TYAPR01MB4160.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(366004)(136003)(376002)(346002)(189003)(199004)(51914003)(229853002)(7736002)(76176011)(102836004)(14454004)(6306002)(6246003)(186003)(26005)(55016002)(25786009)(2171002)(6436002)(4326008)(486006)(6506007)(53936002)(476003)(11346002)(446003)(966005)(7696005)(110136005)(305945005)(316002)(8936002)(9686003)(4744005)(86362001)(3846002)(6116002)(2906002)(54906003)(33656002)(99286004)(52536014)(68736007)(5660300002)(105586002)(74316002)(106356001)(71190400001)(71200400001)(93886005)(256004)(97736004)(66066001)(81156014)(81166006)(8676002)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4160;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4RW+3OGTL1Rl+MJLuhzuvrYpil7PgFOIkUYdYyUGDINV3GPHVeBmqGTgh7jLIyaWh4v1oUUwEwRwvNBCH4gtliImV7yqLH93KivlkiLiJnQM5+sZd5RS0fw+ra5eYwsPpJBqT4PdwU+A+765zaj2fCDo6SicY/8bW+F1gTwpt7oC3R39aszA1bdA0Rvh8QBzYG7Dm9GhtOA5lJY9aV7el0jIEz4iOpS2GUIfYW86b5nce2TfPap9vlid1hcCNp3i5SJLh5Dc7fU03xT3Z1nI8cDmaOonrfLtQLnv6nxcp88NHXK0J+cMIfcMoQbztZLY7Ug2M+rin+xLnL5qjV3Eb4iB1MUnKC9kxIuOQmLIR5/DLE083oSzL8EyjSdbJlrNFImSwSruD4DYKLCWLE2t9tUt6cdhT6RGpT5sfg98Vjc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef0ed7c-b6a0-4924-c88e-08d6bcd79f94
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 10:39:19.8881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4160
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190409103919.BuQx-nvVAec8opi0mfJur2CDCx9nbGo33lPrU1CT2-Q@z>

Hi Biju-san,

> From: Biju Das, Sent: Tuesday, April 9, 2019 4:30 PM
>=20
> Hi Rob,
>=20
> Thanks for the review.  I guess we need to drop this patch, if the soluti=
on proposed by Shimoda-San is acceptable by everyone.
> The same result can be achieved without using this driver. I have posted =
V3 based on this. please see the link below.
>=20
> https://patchwork.kernel.org/patch/10883263/
>=20
> ehci-r8a77479 driver =3D generic ehci driver + phy initialization code of=
 rcar-gen3-usb2 driver.

I accept v3 based patches (for now I checked patch 1 to 4 only though).

Best regards,
Yoshihiro Shimoda

