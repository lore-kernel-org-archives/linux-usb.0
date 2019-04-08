Return-Path: <SRS0=iu7A=SK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FC7C282DF
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 05:53:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA08920883
	for <linux-usb@archiver.kernel.org>; Mon,  8 Apr 2019 05:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="nTV33qsh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfDHFw7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 8 Apr 2019 01:52:59 -0400
Received: from mail-eopbgr1400135.outbound.protection.outlook.com ([40.107.140.135]:51492
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726068AbfDHFw7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Apr 2019 01:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Isbyz695f9quno7mSOUO0ogaIIKtwxEzbHyI3TcNRLM=;
 b=nTV33qsh0eZlHC/d7IVbvl/rYh/iQ62/TqA/IRPLT6Q62me/GKHSPLszOSJ3fk6/2MIOo/ukuK2+wzj1RIG7GhM/Z0lq4YiU9r2RNDs2Y+O3w1Me5Gg9dLzg1RmWm9WbXoo9csd52rMNAPBaVyw3i5TvVxzNsCuLeJRFjIjxioY=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB3310.jpnprd01.prod.outlook.com (20.178.136.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Mon, 8 Apr 2019 05:52:52 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Mon, 8 Apr 2019
 05:52:52 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
CC:     Arnd Bergmann <arnd@arndb.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH 1/4] usb: common: Consider only available nodes for
 dr_mode
Thread-Topic: [PATCH 1/4] usb: common: Consider only available nodes for
 dr_mode
Thread-Index: AQHU0B7eErGhE/vMCk28vL9eutYCg6YoS1aggAB/jACAABbzYIAAEYIAgAkHtGA=
Date:   Mon, 8 Apr 2019 05:52:52 +0000
Message-ID:
 <TYAPR01MB4271B55EEE25B5D5D4327ACCD82C0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB427119513E310A30792924E7D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
 <TY1PR01MB1770C3AF8E4E5386319FDCF9C0560@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <TYAPR01MB4271277BF22B6EAE0A6313D1D8560@TYAPR01MB4271.jpnprd01.prod.outlook.com>
 <TY1PR01MB1770D9F7ED790CF98FF2C7CFC0560@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770D9F7ED790CF98FF2C7CFC0560@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d17935b-bfb1-4206-d57d-08d6bbe6706b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB3310;
x-ms-traffictypediagnostic: TYAPR01MB3310:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TYAPR01MB331073895604AC4FB27FC46ED82C0@TYAPR01MB3310.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0001227049
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(376002)(366004)(396003)(136003)(199004)(43544003)(189003)(25786009)(6246003)(9686003)(52536014)(99286004)(68736007)(6306002)(6862004)(2906002)(4326008)(55016002)(53936002)(54906003)(478600001)(966005)(6116002)(229853002)(316002)(14454004)(6436002)(5660300002)(7696005)(3846002)(26005)(93886005)(7736002)(102836004)(305945005)(86362001)(53546011)(8936002)(97736004)(6506007)(106356001)(186003)(8676002)(81166006)(81156014)(11346002)(14444005)(476003)(71200400001)(66066001)(256004)(76176011)(486006)(71190400001)(446003)(74316002)(33656002)(105586002);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3310;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yCzXd3cjrECU7aVqg5jpRVrpGe1FNMFMX87n0bnaFSYvaFwkiA/5d5+q0eEdz5yWXnQJhCQkTDvxI3lh5B3TnHcKls2XV1n0892Bu7l7y8RUq5EI02PQs5hMP1pEZoPOpt9USZB1sVAST50JiSvlxk7woKCkUXOFWrW81Pihx4RqOoPztTWx3rTN/wBh2JD5EkeFG/GF1mcWFIx5PPYJquDrGBVS9GX7HH6vSBqcc0Gxu/pUM4s0ToARqMmcIkSLAqr/cJVXv4Nn8QcenC1tVfdEIAOMZHiZx9R6f7/H9EPkGGZpC3sXPAiM05JCUCK7zrMJfpv3oNsiReFNhDT1Ndq/KEdtjbEAHWNGwMkeVv8fV7fYZW5F0l0kwLwErMl891oTeuPVNZyYEWN5/13A0A8XlXR6Kpz/lg3pECL3Pu0=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d17935b-bfb1-4206-d57d-08d6bbe6706b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2019 05:52:52.0649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3310
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190408055252.FI1Hv-EQ52KtJxLASShl3nIJZFpB5xS2HJ3UR316IHk@z>

Hi Fabrizio-san,

> From: Fabrizio Castro, Sent: Tuesday, April 2, 2019 8:47 PM
>=20
> Hi Yoshihiro-san,
>=20
> Thank you for your feedback.
>=20
> > Hi Fabrizio-san,
> >
> > > From: Fabrizio Castro, Sent: Tuesday, April 2, 2019 6:22 PM
> > >
> > > Hi Yoshihiro-san,
> > >
> > > Thank you for your feedback.
> > >
> > > > From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > > Sent: 02 April 2019 02:54
> > > > Subject: RE: [PATCH 1/4] usb: common: Consider only available nodes=
 for dr_mode
> > > >
> > > > Hi Fabrizio-san,
> > > >
> > > > Thank you for the patch!
> > > >
> > > > > From: Fabrizio Castro, Sent: Friday, March 1, 2019 8:06 PM
> > > > >
> > > > > There are cases where multiple device tree nodes point to the
> > > > > same phy node by means of the "phys" property, but we should
> > > > > only consider those nodes that are marked as available rather
> > > > > than just any node.
> > > > >
> > > > > Fixes: 98bfb3946695 ("usb: of: add an api to get dr_mode by the p=
hy node")
> > > > > Cc: stable@vger.kernel.org # v4.4+
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > > ---
> > > >
> > > > I'm guessing this code needs for phy-rcar-gen3-usb2.c only because
> > > > the phy driver only gets the dr_mode from index 0 like below:
> > > >
> > > > 	channel->dr_mode =3D of_usb_get_dr_mode_by_phy(dev->of_node, 0);
> > > >
> > > > Yesterday, I submitted patches to get multiple indexes from control=
ler
> > > > device nodes:
> > > >
> > > > https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=
=3D99561
> > > >
> > > > So, would you check the phy patches can get the dr_mode without thi=
s changing common patch?
> > >
> > > I will go through your patch series, but I can't see why any driver w=
ould be interested
> > > in considering a disabled node for getting dr_mode, can you?
> > > Do you have a use case for this?
> >
> > This is not a use case though, the commit 98bfb3946695 is made by a TI =
engineer so that
> > I checked TI's dts/dtsi file on armv7 arch (am335x-boneblue.dts) a litt=
le and then
> > it has one usb controller node only. So, the commit didn't take care of=
 a disabled node, I guess.
> > However, as you know, on R-Car Gen3 and RZ/G2, they have multiple contr=
oller nodes. So,
> > one of the controller can be disabled.
>=20
> The real question is, are we going to need to read dr_mode from a disable=
d node?
> Because this patch gets in the way of that, but looking through the code =
and
> device trees it doesn't look like anybody needs that. I have tested this =
patch in isolation
> on a few R-Car platforms, and it all seemed good to me back when I submit=
ted the patch,
> but it would probably need thorough testing, and more testing from your s=
ide is more than
> welcome. Besides this point, of_usb_get_dr_mode_by_phy returns the dr_mod=
e value that
> matches the argument the first, which means what you get back from it dep=
ends from
> the order in which you specify the nodes within the device tree in case y=
ou have multiple
> nodes meeting the same requirements (from a of_usb_get_dr_mode_by_phy per=
spective),
> a.k.a. "luck".

Thank you very much for the detailed explanation. I agree with you. This AP=
I should not get
the dr_mode from a disabled node. For example, descriping the following dev=
ice nodes are nonsense:

&host {
	dr_mode =3D "peripheral";		// <--- here
	status =3D "disabled";
}

&peripheral {
	dr_mode =3D "peripheral";
	status =3D "okay";
}

> We should make sure there is only one node that can match our requirement=
 at any one
> time for this to work properly, and parsing only enabled nodes gets in th=
at direction,
> therefore I still think this patch is valid, and belongs to stable versio=
ns of the kernel
> as well.

I agree this patch is valid for both mainline and stable versions because a=
ll this API users
in v5.1-rc4 are called with the second argument -1 or 0 and then the behavi=
or should be
the same as before. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> After reading your comment on patch:
> "phy: renesas: rcar-gen3-usb2: No need to request IRQ for non-OTG"
>=20
> I can now see that patch "arm64: dts: renesas: r8a77995: draak: Remove hs=
usb node" is wrong
> for your case, and that we need to find a better solution for patch:
> "phy: renesas: rcar-gen3-usb2: No need to request IRQ for non-OTG"
>=20
> I am looking into your series now, I'll come back to you soon on the othe=
r patch.
>=20
> Thanks,
> Fab
>=20
> >
> > By the way, if we applied this patch, since the behavior will be change=
d at least,
> > so all of this api user have to test whether this code doesn't break or=
 not.
> >
> > Best regards,
> > Yoshihiro Shimoda
> >
> > > Thanks,
> > > Fab
> > >
> > > >
> > > > Best regards,
> > > > Yoshihiro Shimoda
> > > >
> > > > >  drivers/usb/common/common.c | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/drivers/usb/common/common.c b/drivers/usb/common/com=
mon.c
> > > > > index 48277bb..73c8e65 100644
> > > > > --- a/drivers/usb/common/common.c
> > > > > +++ b/drivers/usb/common/common.c
> > > > > @@ -145,6 +145,8 @@ enum usb_dr_mode of_usb_get_dr_mode_by_phy(st=
ruct device_node *np, int arg0)
> > > > >
> > > > >  	do {
> > > > >  		controller =3D of_find_node_with_property(controller, "phys");
> > > > > +		if (!of_device_is_available(controller))
> > > > > +			continue;
> > > > >  		index =3D 0;
> > > > >  		do {
> > > > >  			if (arg0 =3D=3D -1) {
> > > > > --
> > > > > 2.7.4

