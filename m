Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3614EC10F13
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 00:53:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D42BF2070D
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 00:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="VlPC7B98"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfDOAxv (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 14 Apr 2019 20:53:51 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:51736 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfDOAxv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Apr 2019 20:53:51 -0400
X-IronPort-AV: E=Sophos;i="5.60,351,1549954800"; 
   d="scan'208";a="31490727"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 14 Apr 2019 17:53:50 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Sun, 14 Apr 2019 17:53:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JRkJDmwxAf9dl/RoolstbjLymcgHPGePyEJQxvmPbI=;
 b=VlPC7B98r9pO1BJ8cdtgraZ0Nita0OtfScFWvLUUzfp25Ckpy8weCfnD+tTJ46vCa2l3WLYpvlgBbbxJcnjHQN06DbTDrJVJrrXjy+AqDjni+EgMk5mWNQoHN9IrRrsNKJdd8MbVck/UbNLYM1mokzxC+Iq5E3w6vI7/qR+uD6s=
Received: from BN6PR1101MB2130.namprd11.prod.outlook.com (10.174.239.148) by
 BN6PR1101MB2067.namprd11.prod.outlook.com (10.174.116.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.14; Mon, 15 Apr 2019 00:53:45 +0000
Received: from BN6PR1101MB2130.namprd11.prod.outlook.com
 ([fe80::4d14:ae52:3fbe:ecad]) by BN6PR1101MB2130.namprd11.prod.outlook.com
 ([fe80::4d14:ae52:3fbe:ecad%3]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 00:53:44 +0000
From:   <Woojung.Huh@microchip.com>
To:     <lukas@wunner.de>, <minas.harutyunyan@synopsys.com>
CC:     <stefan.wahren@i2se.com>, <Jisheng.Zhang@synaptics.com>,
        <linux-usb@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>, <dianders@chromium.org>
Subject: RE: lan78xx: About 8000 usb interrupts per second when idle
Thread-Topic: lan78xx: About 8000 usb interrupts per second when idle
Thread-Index: AQHU7qSwlqzwNY+L7EGLGG3twUFv5aYzj9UAgAiIW4CAAFVMoA==
Date:   Mon, 15 Apr 2019 00:53:44 +0000
Message-ID: <BN6PR1101MB2130B32786121E5558B6B083E72B0@BN6PR1101MB2130.namprd11.prod.outlook.com>
References: <20190408143443.335f7e93@xhacker.debian>
 <002929b7-9a0d-6d92-4e03-18a6748c6708@i2se.com>
 <20190408160551.03911b27@xhacker.debian>
 <20190409144655.753d3bd9@xhacker.debian>
 <3cda1098-e0ad-42ac-af96-c85eba480556@i2se.com>
 <BN6PR1201MB008219D0CF1CB7CF7F802008A72D0@BN6PR1201MB0082.namprd12.prod.outlook.com>
 <20190414194623.afp3fanjuq72ctln@wunner.de>
In-Reply-To: <20190414194623.afp3fanjuq72ctln@wunner.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Woojung.Huh@microchip.com; 
x-originating-ip: [67.81.18.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4241d86b-cf76-4e02-b120-08d6c13ccfe8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BN6PR1101MB2067;
x-ms-traffictypediagnostic: BN6PR1101MB2067:
x-microsoft-antispam-prvs: <BN6PR1101MB206705EDC293B3A3B33E3B6BE72B0@BN6PR1101MB2067.namprd11.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(366004)(136003)(346002)(39850400004)(189003)(199004)(33656002)(6506007)(186003)(102836004)(26005)(7736002)(2906002)(6116002)(66066001)(76176011)(7696005)(106356001)(72206003)(105586002)(99286004)(478600001)(476003)(74316002)(305945005)(25786009)(3846002)(316002)(52536014)(446003)(11346002)(54906003)(110136005)(14454004)(486006)(5660300002)(68736007)(8676002)(6436002)(55016002)(4744005)(9686003)(6246003)(8936002)(81166006)(53936002)(81156014)(86362001)(229853002)(93886005)(71190400001)(71200400001)(256004)(14444005)(97736004)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR1101MB2067;H:BN6PR1101MB2130.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2byBSocnCXvOPXGsr2vjpBimTfbmJxeYc1hz0RS7ExiRPruatterGN5Q8ZMkhAWVo/KFGymlMGdAK8Z8kLZ4mbPlFC9WksObpTkaSgHFePGQzMi0ts8kydpFXA7L+fu4U19vxgVDDC8b5bWtSQArTrfeRQ4zM7nUxfThx5CnaNBx2rTPU5SoaqDHc8TVJG4QWMDnQmUxQmRkmcL+Y6Ow2fkWWB4mqMmgYDSrBtUa/NLCeyRMaKeSyFy4mTBhLQfiJzfFBZj/QFAKWMDyo+5tXpjrNmpnd7w6vyxhfsvEpfoUQaXHkyYxW0iRdWKm6eeNhBe+M4dBlwTCX4p6qhNcMBmkv6c0/+HmwuuCfma8faVtZhpPymyHMLCMqhzksCJBx9Cr0CDVy3IBC641y/QqRMuzefZe5q86SnHcS8m7T2A=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4241d86b-cf76-4e02-b120-08d6c13ccfe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 00:53:44.7663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2067
X-OriginatorOrg: microchip.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Lukas & Minas,

> On Tue, Apr 09, 2019 at 09:28:16AM +0000, Minas Harutyunyan wrote:
> > Am 09.04.19 um 08:54 schrieb Jisheng Zhang:
> > > The second one: 8000 usb interrupts per second when idle.
> > > This is abnormal. any idea? Is it due to the lan78xx?
> >
> > dwc2 in host mode enable SOF interrupts if any periodic EP are in use.
> > So, 8000 interrupts per second is expectant behavior.
>=20
> The dwc_otg driver patched into the Raspberry Pi Foundation's
> kernel seems to make do with much fewer interrupts and much
> lower CPU load.  How does it do that and how could dwc2 be
> made to do the same?  Would it be possible for you to provide
> me with documentation on the chip?  The Synopsis website
> requires registration for downloads and registration requires
> a Synopsis customer ID.
Thanks for update information.
Can you share your info with us?

Regards,
Woojung

