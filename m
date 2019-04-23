Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5148C10F03
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 15:06:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76D72206BA
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 15:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="sn87QXSN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbfDWPG4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 11:06:56 -0400
Received: from mail-eopbgr1410114.outbound.protection.outlook.com ([40.107.141.114]:30296
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727673AbfDWPG4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Apr 2019 11:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oJH+4oyiZbDY9z20wBzKFb35/kFSzoWBhw3QfS3jsI=;
 b=sn87QXSNihYuVuiaa62ETqHew7JRF1ycGQ8GQ4UVsWCMWD9fLJkp64EU1xdx0VlQkrPbaP5FoIem1FEt52g44HkE9cKBFvMgJMr5V9PDKCdKhq3Ev/XeI5a50tUVxUQTAqY9E+/vJIExKpgLSgC8pjMlzFkxndtv/4Lk0I+ETo8=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4661.jpnprd01.prod.outlook.com (20.179.181.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.14; Tue, 23 Apr 2019 15:06:49 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1813.017; Tue, 23 Apr 2019
 15:06:49 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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
Thread-Index: AQHU9DkRMINJdSoeck6dgd5isJEyu6ZJD9eAgABlx+CAAClUgIAAQ/sg
Date:   Tue, 23 Apr 2019 15:06:49 +0000
Message-ID:
 <OSBPR01MB21035E6C1BCB59C8CE49B3B5B8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1555407487-35394-1-git-send-email-biju.das@bp.renesas.com>
 <1555407487-35394-5-git-send-email-biju.das@bp.renesas.com>
 <OSBPR01MB17335B483D7585AB1F27B61DD8230@OSBPR01MB1733.jpnprd01.prod.outlook.com>
 <OSBPR01MB21037040E074CBC79E3E780EB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <OSBPR01MB1733A56D1362592022C8EFFAD8230@OSBPR01MB1733.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB1733A56D1362592022C8EFFAD8230@OSBPR01MB1733.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d9f016f-dc37-4ecd-7574-08d6c7fd4fd1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:OSBPR01MB4661;
x-ms-traffictypediagnostic: OSBPR01MB4661:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB4661F956EAB52EDBD13539F7B8230@OSBPR01MB4661.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0016DEFF96
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(136003)(39860400002)(376002)(366004)(189003)(199004)(51914003)(446003)(11346002)(54906003)(476003)(14444005)(33656002)(256004)(99286004)(316002)(486006)(9686003)(44832011)(3846002)(6862004)(93886005)(86362001)(6246003)(2906002)(52536014)(6116002)(5660300002)(6506007)(53936002)(102836004)(55016002)(6306002)(76176011)(186003)(26005)(8676002)(8936002)(7696005)(25786009)(71190400001)(81166006)(71200400001)(81156014)(66066001)(74316002)(14454004)(64756008)(66946007)(7736002)(73956011)(66446008)(66476007)(229853002)(76116006)(66556008)(68736007)(97736004)(478600001)(6436002)(305945005)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4661;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kS0ygpLhBy8GUm2tlYaJtuUPgWeZNCLh2hWHOc/erhpkCXbwqaevE3MtQ2VDglKl6/eAJHWxNSxX1FKytp+RdVAOAsfCHtgwk0gRf+GN/Iqcc4XNwBMP5lWNoitZWFpqMRt2j2nU75gJE+kTof6KcKyDwt4tkP40ScrKOmFF9lBjkQ6Gj8Rc2CtlA1mpF2CtVr9XlXxs2rqOJHOXuTuWjSfE2glzWzMza4AfRDkSctaPiAtQ/3vyPYiQFMuMRo+r05/TCct8T59leZBZCjKGAhq2w4jLb4GLUJjprOeC5DyiQx9WvAqw4krR22bAux2/OkJTnB/pB8fZdd2jShH3eMzEhrEJ77FOSc/y9isrftspAr5jcr2S5EAiXeu/ektTzlN/QxyYZgvqH2pSijW0VeKWH7251IW96D+BEfS75VA=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9f016f-dc37-4ecd-7574-08d6c7fd4fd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2019 15:06:49.8473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4661
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190423150649.anB1u93zf-wLBH3ZLLOO2PoSJuqrs5uG4LeWzt1iLGM@z>

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH V4 4/7] usb: gadget: udc: renesas_usb3: Use
> usb_role_switch framework
>=20
> Hi Biju-san,
>=20
> > From: Biju Das, Sent: Tuesday, April 23, 2019 6:08 PM
> >
> > Hi Shimoda-San,
> >
> > Thanks for the feedback.
> >
> > > Subject: RE: [PATCH V4 4/7] usb: gadget: udc: renesas_usb3: Use
> > > usb_role_switch framework
> > >
> > > Hi Biju-san,
> > >
> > > Thank you for the patch!
> > >
> > > > From: Biju Das, Sent: Tuesday, April 16, 2019 6:38 PM
> > > >
> > > > RZ/G2E cat874 board is capable of detecting cable connect and
> > > > disconnect events. Add support for renesas_usb3 to receive connect
> > > > and disconnect events and support dual-role switch using
> > > > usb-role-switch
> > > framework.
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > ---
> > > >  V3-->V4
> > > >    * No Change
> > > >  V2-->V3
> > > >    * Incorporated Shimoda-san's review comment
> > > >      (https://patchwork.kernel.org/patch/10852507/)
> > > >    * Used renesas,usb-role-switch property for differentiating USB
> > > >      role switch associated with Type-C port controller driver.
> > > >  V1-->V2
> > > >    * Driver uses usb role clas for handling dual role switch and ha=
ndling
> > > >      connect/disconnect events instead of extcon.
> > > <snip>
> > >
> > > > +static void usb3_check_vbus(struct renesas_usb3 *usb3) {
> > > > +	if (usb3->workaround_for_vbus) {
> > > > +		if (usb3->usb_role_switch_property) {
> > > > +			if (usb3->connection_state =3D=3D USB_ROLE_DEVICE) {
> > > > +				usb3_mode_config(usb3, false, false);
> > >
> > > I should have pointed it out the previous version though, why does
> > > this
> > > usb3_mode_config() calling need?
> > > My guess is:
> > >  - renesas_usb3_start() calls renesas_usb3_init_controller().
> > >  -- renesas_usb3_init_controller() calls usb3_check_id() and then
> > > usb_check_vbus().
> > >  --- usb_check_id() calls usb3_mode_config(usb3, true, true) and
> > > then the HW acts as host mode.
> > >  ----> So, you'd like the HW to acts as peripheral mode when the
> > > connection_state is USB_ROLE_DEVICE,
> > >        you added that the usb3_check_vbus() calls
> > > usb3_mode_config(usb3, false, false).
> > >
> > > Is my guess correct? If so, I'd like to add such code into
> > > usb3_check_id() like
> > > below:
> >
> > Yes, it is almost correct. The scenario I am trying is
> >
> > [1] USB type C  cable connected to a Host Machine(TI chip identifies
> > as Device connection. But we haven't installed Gadget module for
> > Device operation)
> >
> > [2] After that trying to install gadget module. In this case,  it
> > calls usb_check_id() as mentioned above and configure it as Host mode.
>=20
> Thank you for the explanation.
>=20
> > > 	if ((usb3->extcon_host && !usb3->forced_b_device) ||
> > > 	    (usb3->usb_role_switch_property &&
> > > 	     usb3->connection_state =3D=3D USB_ROLE_HOST))
> > > 		usb3_mode_config(usb3, true, true);
> > > 	else
> > > 		usb3_mode_config(usb3, false, false);
> > >
> > > What do you think?
> >
> > Since as per [1], usb3->extcon_host=3D1 and !usb3->forced_b_device =3D=
=3D1
> > ,  The above code always enter into Host Mode configuration.
>=20
> Oops. Thank you for the pointed it out.
>=20
> > To make it work,  I need to update  " usb3->forced_b_device" based on
> > connection_state from TI chip. So the new code look like
>=20
> Since the forced_b_device is related to debug purpose (controlled by
> debugfs), I don't want to use the value for type-c.
>=20
> > 1) There is no change in usb_check_id() call.
> >
> > if (usb3->extcon_host && !usb3->forced_b_device)
> >     usb3_mode_config(usb3, true, true);
> >    else
> >     usb3_mode_config(usb3, false, false);
> >
> > 2) Update "usb3->forced_b_device" variable  based on connection_state.
> >
> > @@ -2370,6 +2376,7 @@ static void handle_ext_role_switch_states(struct
> device *dev,
> >                 usb3_vbus_out(usb3, false);
> >                 break;
> >         case USB_ROLE_DEVICE:
> > +               usb3->forced_b_device =3D true;
> >                 if (usb3->connection_state =3D=3D USB_ROLE_NONE) {
> >                         usb3->connection_state =3D USB_ROLE_DEVICE;
> >                         usb3_set_mode(usb3, false); @@ -2384,6 +2391,7
> > @@ static void handle_ext_role_switch_states(struct device *dev,
> >                 usb3_vbus_out(usb3, false);
> >                 break;
> >         case USB_ROLE_HOST:
> > +               usb3->forced_b_device =3D false;
> >
> > Can you please confirm are you ok with this changes? Or do you prefer t=
he
> previous one?
>=20
> I'd like to change usb3_check_id() somehow.
> How about the following conditions? In type-c environment, since usb3-
> >usb_role_switch_property is true, it should be OK for it.
>=20
> 	if ((!usb3->usb_role_switch_property &&
> 	     usb3->extcon_host && !usb3->forced_b_device) ||
> 	    (usb3->usb_role_switch_property &&
> 	     usb3->connection_state =3D=3D USB_ROLE_HOST))
> 		usb3_mode_config(usb3, true, true);
> 	else
> 		usb3_mode_config(usb3, false, false);
>=20

OK. I will send V5 with this changes.

Regards,
Biju
