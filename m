Return-Path: <SRS0=X9rV=SM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5DDC10F11
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 09:37:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF86A2083E
	for <linux-usb@archiver.kernel.org>; Wed, 10 Apr 2019 09:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.b="QADzL/tB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbfDJJh2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Apr 2019 05:37:28 -0400
Received: from mail-eopbgr790040.outbound.protection.outlook.com ([40.107.79.40]:51841
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728563AbfDJJh2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Apr 2019 05:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector1-synaptics-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mi9wuGBjyp14gcjOJP0D/Rb61q2nvExRFnBi8S0YZfI=;
 b=QADzL/tBlp2/7IOPzT3dlHse4YGqxzudDYVT7b4M6eERNS6S4wU8GUoA1x3L0h+gPzVOliP1kL+uY4oNwp1pfqrt+cUZJurNNolIEbpNmoEkKnYP5bg4vXe7XaTdaGvm8ogEnc713hsQ70DQSjmJQ1UhhAk79Ydo4+wd+UDPjZI=
Received: from BYAPR03MB4773.namprd03.prod.outlook.com (20.179.92.152) by
 BYAPR03MB3991.namprd03.prod.outlook.com (20.177.126.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.15; Wed, 10 Apr 2019 09:37:24 +0000
Received: from BYAPR03MB4773.namprd03.prod.outlook.com
 ([fe80::1a8:1bc4:174b:472b]) by BYAPR03MB4773.namprd03.prod.outlook.com
 ([fe80::1a8:1bc4:174b:472b%2]) with mapi id 15.20.1771.016; Wed, 10 Apr 2019
 09:37:24 +0000
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Minas Harutyunyan <minas.harutyunyan@synopsys.com>
CC:     Stefan Wahren <stefan.wahren@i2se.com>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Woojung Huh <woojung.huh@microchip.com>
Subject: Re: lan78xx: About 8000 usb interrupts per second when idle
Thread-Topic: lan78xx: About 8000 usb interrupts per second when idle
Thread-Index: AQHU7dY7/JvjjRMKJk2tb7ws1orH+KYzjorggAGVhoA=
Date:   Wed, 10 Apr 2019 09:37:24 +0000
Message-ID: <20190410172917.23cb7d0e@xhacker.debian>
References: <20190408143443.335f7e93@xhacker.debian>
        <002929b7-9a0d-6d92-4e03-18a6748c6708@i2se.com>
        <20190408160551.03911b27@xhacker.debian>
        <20190409144655.753d3bd9@xhacker.debian>
        <3cda1098-e0ad-42ac-af96-c85eba480556@i2se.com>
        <BN6PR1201MB008219D0CF1CB7CF7F802008A72D0@BN6PR1201MB0082.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR1201MB008219D0CF1CB7CF7F802008A72D0@BN6PR1201MB0082.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [124.74.246.114]
x-clientproxiedby: TYCPR01CA0087.jpnprd01.prod.outlook.com
 (2603:1096:405:3::27) To BYAPR03MB4773.namprd03.prod.outlook.com
 (2603:10b6:a03:134::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Jisheng.Zhang@synaptics.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51bdbe40-abfb-4ecf-18e2-08d6bd9822fe
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BYAPR03MB3991;
x-ms-traffictypediagnostic: BYAPR03MB3991:
x-microsoft-antispam-prvs: <BYAPR03MB399129DA04C54438A391FA77ED2E0@BYAPR03MB3991.namprd03.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39850400004)(396003)(346002)(376002)(199004)(189003)(386003)(6506007)(53936002)(478600001)(66066001)(14454004)(25786009)(7736002)(186003)(305945005)(102836004)(26005)(6436002)(68736007)(72206003)(6116002)(4326008)(97736004)(3846002)(6486002)(486006)(5660300002)(446003)(11346002)(6246003)(2906002)(476003)(93886005)(86362001)(106356001)(229853002)(105586002)(52116002)(71190400001)(6512007)(316002)(9686003)(8936002)(81166006)(8676002)(81156014)(6916009)(1076003)(256004)(99286004)(50226002)(71200400001)(76176011)(54906003)(39210200001);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB3991;H:BYAPR03MB4773.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CL/PxYDKg/lg1KSeZL4jxd4actSkzMJPJRpzauN9KtjaAiiVXiR16cXuLnigXBnndnuwWLqw7QelBqRTIPgr9Mgf207LGSTosAqqseQC1NYlmCpsK0Ob0d/0Vnvi47si2tkk3FRaU3d8KUQDp/s6Y5lh1e2ABEjdigEjQXuCzhIuYt5cGYCSMJL2kU+bDaOf5VnFi4zg+qkJYhdAYvuAm2e40IMALTGeCrPY3N0HWf8tdcoTH8q1LxlDO6cZrkScqqo+oN1+rABqEjpuIdEwI226B0WZesd0cv+VfysXz77/1Be43LI8X7WIBGWRQkTakFBrnVFtpFHnDS3I4MxTrGCLFVh2v/3l8x1lJ0+bxGGtitkXd0Y7navilu/TarrCOr/x0cIAW3q3eaDg8d7buJ2VBUdq1ADPeUr0Ot4G7/4=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <815A5D02BFA1D849BE4FC20BB647DA70@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bdbe40-abfb-4ecf-18e2-08d6bd9822fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 09:37:24.5644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3991
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 9 Apr 2019 09:28:16 +0000 Minas Harutyunyan wrote:


>=20
> Hi Stefan,
>=20
> > Hi Minas,
> >
> > Am 09.04.19 um 08:54 schrieb Jisheng Zhang: =20
> >> On Mon, 8 Apr 2019 16:05:51 +0800 Jisheng Zhang wrote:
> >> =20
> >>> Hi Stefan,
> >>>
> >>> On Mon, 8 Apr 2019 09:57:14 +0200 Stefan Wahren wrote:
> >>> =20
> >>>>
> >>>> Hi Jisheng,
> >>>>
> >>>>
> >>>> thanks for sending this patch.  I already reported this issue
> >>>> last year [1], but Microchip wasn't able to provide a fix.
> >>>>
> >>>> I will give it a try.
> >>>> =20
> >>>>> The second one: 8000 usb interrupts per second when idle.
> >>>>> This is abnormal. any idea? Is it due to the lan78xx? =20
> >>>> Does this downstream patch [2] improve your situation? =20
> >>> Thanks a lot. Will try the patch tonight. =20
> >> I tried this patch, it doesn't help. One more observation: if I
> >> ifconfig eth0 down, I can still get 8000 usb interrupts per second.
> >>  Not sure whether this is usb issue or not. =20
> >
> > Jisheng reports a lot of USB interrupts while the lan78xx driver on
> > Raspberry Pi 3B+ is in idle.
> >
> > Any suggestions to narrow this down? =20
>=20
> dwc2 in host mode enable SOF interrupts if any periodic EP are in use.
> So, 8000 interrupts per second is expectant behavior.

Makes sense. 8 microframes each 1ms, so 8*1000 =3D 8000 interrupts/s
