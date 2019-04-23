Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05A6C282DD
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 11:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C03AD2175B
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 11:00:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="fTcG6U4u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfDWLAH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 07:00:07 -0400
Received: from mail-eopbgr1400122.outbound.protection.outlook.com ([40.107.140.122]:15343
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726150AbfDWLAH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Apr 2019 07:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GHJ9O1hcKIG69V8lnRWQ6s+MrrMpE09DofPMqOYeJxw=;
 b=fTcG6U4uFTVozYqtLGktpT1pNk4LGjLv3u4HTdOjZIdNKCiWiZfwCgFUD7EHTc5yA42FmC57q2/yNUFW5NHDGDAUGKgyn7+6comaqPYi+xB2N03P4BvjgaXnmEiIClOb2uY1uaqDldcTws+E/2RIKwRKbx2d6CaTTcy8t8lL00s=
Received: from OSBPR01MB1733.jpnprd01.prod.outlook.com (52.134.227.22) by
 OSBPR01MB3416.jpnprd01.prod.outlook.com (20.178.99.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 23 Apr 2019 11:00:01 +0000
Received: from OSBPR01MB1733.jpnprd01.prod.outlook.com
 ([fe80::902e:1148:6b6d:8280]) by OSBPR01MB1733.jpnprd01.prod.outlook.com
 ([fe80::902e:1148:6b6d:8280%3]) with mapi id 15.20.1813.017; Tue, 23 Apr 2019
 11:00:01 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH V4 4/7] usb: gadget: udc: renesas_usb3: Use
 usb_role_switch framework
Thread-Topic: [PATCH V4 4/7] usb: gadget: udc: renesas_usb3: Use
 usb_role_switch framework
Thread-Index: AQHU9DkRq+R3PL3OeUiWbh22/w5vtKZJDA1QgABziQCAABt+kA==
Date:   Tue, 23 Apr 2019 11:00:01 +0000
Message-ID:
 <OSBPR01MB1733A56D1362592022C8EFFAD8230@OSBPR01MB1733.jpnprd01.prod.outlook.com>
References: <1555407487-35394-1-git-send-email-biju.das@bp.renesas.com>
 <1555407487-35394-5-git-send-email-biju.das@bp.renesas.com>
 <OSBPR01MB17335B483D7585AB1F27B61DD8230@OSBPR01MB1733.jpnprd01.prod.outlook.com>
 <OSBPR01MB21037040E074CBC79E3E780EB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21037040E074CBC79E3E780EB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3417ac5-7577-41f4-d477-08d6c7dad589
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3416;
x-ms-traffictypediagnostic: OSBPR01MB3416:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB341689411C8A021AA0CC3A56D8230@OSBPR01MB3416.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0016DEFF96
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(376002)(396003)(346002)(39860400002)(366004)(136003)(51914003)(199004)(189003)(53936002)(6306002)(9686003)(4326008)(68736007)(25786009)(55016002)(86362001)(74316002)(478600001)(7736002)(6246003)(6862004)(305945005)(14454004)(66066001)(7696005)(76176011)(6506007)(99286004)(54906003)(52536014)(66476007)(3846002)(64756008)(229853002)(33656002)(6116002)(66446008)(66946007)(5660300002)(73956011)(66556008)(76116006)(81166006)(316002)(8936002)(81156014)(8676002)(93886005)(97736004)(71190400001)(71200400001)(186003)(256004)(486006)(6436002)(14444005)(102836004)(11346002)(2906002)(446003)(26005)(476003)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3416;H:OSBPR01MB1733.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RmMIpXtZHSEU7IQzjtwRYIjzruGG/LRUi5POF5xxwV2YvW8z+zqTJOaxk25dR987VHXg44zBHyd1ptIxfJMahPsfQopJqBbH1qF9AOTMbmjDJtCiTmaC+HNfuxddrqfD8ZpM/LL3bDgOzItkiMPaibrsVH/DKFAVPEQ/wlXZ2Bu8DUp2/+JCigetQQr6og8Ks5tDGtQStxKaee1TWwphgvtiK+IgYTfBrtyM6z9f7PwETnU9wpHEn/xnRrTQCVyAgyiXuf/q2H+JUSOePnft7AV3yFiG1r2EhWTmfIsjGQ/MyZtq2nQxIyzAerdoDwTJxmbQk+MasMi480G5cnD5mgQO5DaQ1P5mSpu1/KM/Wt7VxyJAdEyBuvTkaKX+45A4HLfnkXy7phQVv2ur+kWQhaMCG+Bh/1aiMzmuKJ68X4c=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3417ac5-7577-41f4-d477-08d6c7dad589
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2019 11:00:01.7230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3416
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190423110001.V97SgGwSJyNkCnm4iNdf3KQChy2sB9UcENf7v-1J_68@z>

Hi Biju-san,

> From: Biju Das, Sent: Tuesday, April 23, 2019 6:08 PM
>=20
> Hi Shimoda-San,
>=20
> Thanks for the feedback.
>=20
> > Subject: RE: [PATCH V4 4/7] usb: gadget: udc: renesas_usb3: Use
> > usb_role_switch framework
> >
> > Hi Biju-san,
> >
> > Thank you for the patch!
> >
> > > From: Biju Das, Sent: Tuesday, April 16, 2019 6:38 PM
> > >
> > > RZ/G2E cat874 board is capable of detecting cable connect and
> > > disconnect events. Add support for renesas_usb3 to receive connect an=
d
> > > disconnect events and support dual-role switch using usb-role-switch
> > framework.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > >  V3-->V4
> > >    * No Change
> > >  V2-->V3
> > >    * Incorporated Shimoda-san's review comment
> > >      (https://patchwork.kernel.org/patch/10852507/)
> > >    * Used renesas,usb-role-switch property for differentiating USB
> > >      role switch associated with Type-C port controller driver.
> > >  V1-->V2
> > >    * Driver uses usb role clas for handling dual role switch and hand=
ling
> > >      connect/disconnect events instead of extcon.
> > <snip>
> >
> > > +static void usb3_check_vbus(struct renesas_usb3 *usb3) {
> > > +	if (usb3->workaround_for_vbus) {
> > > +		if (usb3->usb_role_switch_property) {
> > > +			if (usb3->connection_state =3D=3D USB_ROLE_DEVICE) {
> > > +				usb3_mode_config(usb3, false, false);
> >
> > I should have pointed it out the previous version though, why does this
> > usb3_mode_config() calling need?
> > My guess is:
> >  - renesas_usb3_start() calls renesas_usb3_init_controller().
> >  -- renesas_usb3_init_controller() calls usb3_check_id() and then
> > usb_check_vbus().
> >  --- usb_check_id() calls usb3_mode_config(usb3, true, true) and then t=
he
> > HW acts as host mode.
> >  ----> So, you'd like the HW to acts as peripheral mode when the
> > connection_state is USB_ROLE_DEVICE,
> >        you added that the usb3_check_vbus() calls usb3_mode_config(usb3=
,
> > false, false).
> >
> > Is my guess correct? If so, I'd like to add such code into usb3_check_i=
d() like
> > below:
>=20
> Yes, it is almost correct. The scenario I am trying is
>=20
> [1] USB type C  cable connected to a Host Machine(TI chip identifies as D=
evice connection. But we haven't installed Gadget
> module for Device operation)
>=20
> [2] After that trying to install gadget module. In this case,  it calls u=
sb_check_id() as mentioned above
> and configure it as Host mode.

Thank you for the explanation.

> > 	if ((usb3->extcon_host && !usb3->forced_b_device) ||
> > 	    (usb3->usb_role_switch_property &&
> > 	     usb3->connection_state =3D=3D USB_ROLE_HOST))
> > 		usb3_mode_config(usb3, true, true);
> > 	else
> > 		usb3_mode_config(usb3, false, false);
> >
> > What do you think?
>=20
> Since as per [1], usb3->extcon_host=3D1 and !usb3->forced_b_device =3D=3D=
1  ,  The above code always enter into Host Mode
> configuration.

Oops. Thank you for the pointed it out.

> To make it work,  I need to update  " usb3->forced_b_device" based on con=
nection_state from TI chip. So the new code look
> like

Since the forced_b_device is related to debug purpose (controlled by debugf=
s), I don't want to use the value for type-c.

> 1) There is no change in usb_check_id() call.
>=20
> if (usb3->extcon_host && !usb3->forced_b_device)
>     usb3_mode_config(usb3, true, true);
>    else
>     usb3_mode_config(usb3, false, false);
>=20
> 2) Update "usb3->forced_b_device" variable  based on connection_state.
>=20
> @@ -2370,6 +2376,7 @@ static void handle_ext_role_switch_states(struct de=
vice *dev,
>                 usb3_vbus_out(usb3, false);
>                 break;
>         case USB_ROLE_DEVICE:
> +               usb3->forced_b_device =3D true;
>                 if (usb3->connection_state =3D=3D USB_ROLE_NONE) {
>                         usb3->connection_state =3D USB_ROLE_DEVICE;
>                         usb3_set_mode(usb3, false);
> @@ -2384,6 +2391,7 @@ static void handle_ext_role_switch_states(struct de=
vice *dev,
>                 usb3_vbus_out(usb3, false);
>                 break;
>         case USB_ROLE_HOST:
> +               usb3->forced_b_device =3D false;
>=20
> Can you please confirm are you ok with this changes? Or do you prefer the=
 previous one?

I'd like to change usb3_check_id() somehow.
How about the following conditions? In type-c environment,
since usb3->usb_role_switch_property is true, it should be OK for it.

	if ((!usb3->usb_role_switch_property &&
	     usb3->extcon_host && !usb3->forced_b_device) ||
	    (usb3->usb_role_switch_property &&
	     usb3->connection_state =3D=3D USB_ROLE_HOST))
		usb3_mode_config(usb3, true, true);
	else
		usb3_mode_config(usb3, false, false);

Best regards,
Yoshihiro Shimoda

> Note:-
>  I have done only sanity testing with this changes.
>=20
> Regards,
> Biju
>=20
>=20
>=20
>=20
>=20
>=20

