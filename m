Return-Path: <SRS0=+Ncr=SL=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1A2C282CE
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 07:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CF1920880
	for <linux-usb@archiver.kernel.org>; Tue,  9 Apr 2019 07:29:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="PykysN6p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfDIH3q (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 9 Apr 2019 03:29:46 -0400
Received: from mail-eopbgr1400133.outbound.protection.outlook.com ([40.107.140.133]:42840
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726513AbfDIH3q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Apr 2019 03:29:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q57uVA8h1lmXl3c5FZRGQGoSz2A3gZKgDXuhecvtFPQ=;
 b=PykysN6p7gJpKo4ezib7TZROBqJ2UK3+gNOzvX010iaSxKZ49lIpBlY0o43rlDnulFOwW96GSjrvZSuJn0qa0r4UgKOuwesTQ+v8DoiRmK/M7/rcB0CtwPSMUM4argCJg5szAfsz5M9UH5eoSP2sAYyaaZe1IDC0A32uQxuaqsc=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB1542.jpnprd01.prod.outlook.com (52.134.225.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.19; Tue, 9 Apr 2019 07:29:42 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::f9a1:af9d:75cf:5fd5]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::f9a1:af9d:75cf:5fd5%5]) with mapi id 15.20.1771.019; Tue, 9 Apr 2019
 07:29:42 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
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
Thread-Index: AQHU6Irg9zv8M4WpLUmeCJfEfPkt8qYurKOAgATKtFA=
Date:   Tue, 9 Apr 2019 07:29:41 +0000
Message-ID:
 <OSBPR01MB210356D078E426189767D1EDB82D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
 <1554123232-58942-4-git-send-email-biju.das@bp.renesas.com>
 <5ca841e1.1c69fb81.20175.d3d6@mx.google.com>
In-Reply-To: <5ca841e1.1c69fb81.20175.d3d6@mx.google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 124ba529-af43-4f1b-c673-08d6bcbd21d2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB1542;
x-ms-traffictypediagnostic: OSBPR01MB1542:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB15422E268D0A3C2AC3A30C3CB82D0@OSBPR01MB1542.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(366004)(376002)(346002)(136003)(396003)(51914003)(189003)(199004)(86362001)(9686003)(102836004)(186003)(26005)(2906002)(106356001)(105586002)(5660300002)(316002)(66066001)(76176011)(4326008)(110136005)(54906003)(52536014)(6506007)(97736004)(476003)(486006)(68736007)(25786009)(71200400001)(71190400001)(7696005)(7736002)(6246003)(2171002)(6306002)(55016002)(53936002)(6436002)(4744005)(305945005)(74316002)(14454004)(966005)(99286004)(478600001)(256004)(446003)(11346002)(229853002)(81156014)(81166006)(8676002)(33656002)(8936002)(6116002)(3846002)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1542;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G4+yFyE7uuXR+Tq+CXMcMlWqhYiFxXTsU//tgdq97KDV3jonUG2ykbVjolTAH5x5WXbw6RP4KDEGbJPz0oKlGRinXgcUOY5qs3EtkRCRYEvnRGyulmgE8WB2eD0NmoxwTp8QbQ7kXSfddcg4yk+wKQV1BvgzpMQo6J3xL1+/PlxT8CMG5jSLlWMl3H4tGBgRQ3Hb/7BuPIpojldoIEyfgAin99c9Fe00xbQooCxIRfTDwoV1pqULtqRi0NmSrWEAM7m97qwiqli90e8vkhvhZQKsIZ5EmM10Nqumbc7HQB1usengQEWAGktoWznvNAG9VmCb9y/CGu1Kx8Ois3J7nd9EwWot34BU65aboW7XfkxdJuwXvixi44PAPXOah+R3H0AGgG7dy595Cw1aOH3W+vsuSomanlXZoB/+lxqwp6M=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124ba529-af43-4f1b-c673-08d6bcbd21d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 07:29:42.0004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1542
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190409072941.rgIgB2O6VQVwlXtnYn494rXhYI_zdgQ_ySA0on5ZFCQ@z>

Hi Rob,

Thanks for the review.  I guess we need to drop this patch, if the solution=
 proposed by Shimoda-San is acceptable by everyone.
The same result can be achieved without using this driver. I have posted V3=
 based on this. please see the link below.

https://patchwork.kernel.org/patch/10883263/

ehci-r8a77479 driver =3D generic ehci driver + phy initialization code of r=
car-gen3-usb2 driver.

Regards,
Biju

> Subject: Re: [PATCH 03/12] dt-bindings: usb: ehci-r8a77470 devicetree
> binding document
>=20
> On Mon,  1 Apr 2019 13:53:43 +0100, Biju Das wrote:
> > Add device tree binding document for Renesas r8a77470(a.k.a RZ/G1C)
> > on-chip EHCI controller driver.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > V1-->V2
> >   * New patch
> > ---
> >  .../devicetree/bindings/usb/ehci-r8a77470.txt      | 35
> ++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/usb/ehci-r8a77470.txt
> >
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>

