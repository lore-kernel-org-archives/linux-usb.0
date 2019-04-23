Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68962C10F14
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 09:07:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D05D20674
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 09:07:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="YdSKHoQg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfDWJHz (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Apr 2019 05:07:55 -0400
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:2417
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725888AbfDWJHz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Apr 2019 05:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xH1d4OQOunbiwWiecT3HgzERz0NxUmvR8rRGnWZe1b0=;
 b=YdSKHoQg9qkpi5gcCe47Bjx9xdc2aRimPe2issFx2zXJoT13/TrRR2TcFqMMdNLXpvug8kX1obbaJiUvPdZlfIpAhOG74GGBj2ohv6MB646H7sG5adGCPf0ELwiTHDlcs2S2XyJzuA90/sxQanAyKfASwF2P79M1wfqY+Aj7kv0=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4869.jpnprd01.prod.outlook.com (20.179.183.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Tue, 23 Apr 2019 09:07:46 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1813.017; Tue, 23 Apr 2019
 09:07:46 +0000
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
Thread-Index: AQHU9DkRMINJdSoeck6dgd5isJEyu6ZJD9eAgABlx+A=
Date:   Tue, 23 Apr 2019 09:07:46 +0000
Message-ID:
 <OSBPR01MB21037040E074CBC79E3E780EB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1555407487-35394-1-git-send-email-biju.das@bp.renesas.com>
 <1555407487-35394-5-git-send-email-biju.das@bp.renesas.com>
 <OSBPR01MB17335B483D7585AB1F27B61DD8230@OSBPR01MB1733.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB17335B483D7585AB1F27B61DD8230@OSBPR01MB1733.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a99a9021-8a09-4af5-09fa-08d6c7cb2707
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4869;
x-ms-traffictypediagnostic: OSBPR01MB4869:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB48692F1185E51F40B1F4DB17B8230@OSBPR01MB4869.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0016DEFF96
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39860400002)(346002)(396003)(376002)(51914003)(189003)(199004)(44832011)(186003)(14454004)(33656002)(68736007)(74316002)(8676002)(53936002)(81166006)(446003)(7736002)(6246003)(305945005)(486006)(52536014)(6306002)(476003)(11346002)(6116002)(3846002)(102836004)(55016002)(9686003)(81156014)(256004)(5660300002)(229853002)(6436002)(25786009)(4326008)(6862004)(14444005)(54906003)(478600001)(316002)(73956011)(66066001)(76116006)(99286004)(7696005)(71190400001)(76176011)(2906002)(6506007)(71200400001)(8936002)(64756008)(66446008)(66556008)(97736004)(66476007)(66946007)(86362001)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4869;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NIvRE0BzmkQ55u2E1QyF29HOIKbx6zHHns2huemTO19+J+dTgcBm4RqYhUWEl4CqxvwmR+xnkbwOJrTrTeo+IPXTXB6H7AAqIZisgPbmHhUA55K7YGqwjafg31dr/9eCMh6aUimq3pGW1M5wzmSrzD52QEXfGWZNRxG7LobZa4W0nI4b/KjNM4P4VboCk8BiLRnwLnEWH4gzBLsdWywBAPgm2nXD9hmxsngd4RXvZUbeoppoBH95DxNA4cTUf5v/Zh9/N1aTyX00rKIxd6cxY9zA3Z0lraqyd3MhAfvq9SCDCGKpeajkIzEPO394koSzXmklToj5llp8Mdh1WWTI2jLi2w2AjLkYleJ0rMUZf+n/qadCV7xfU+v6XxAwzNhPF18OKTyTAwtPVqK7dPU9/IFzmRHxFHwaP4lHOEkH9Ws=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99a9021-8a09-4af5-09fa-08d6c7cb2707
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2019 09:07:46.4913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4869
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190423090746.IAaig7jD96YhWNEtmCRcWZRRVMcxeuYV9T67_zaf0-Y@z>

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH V4 4/7] usb: gadget: udc: renesas_usb3: Use
> usb_role_switch framework
>=20
> Hi Biju-san,
>=20
> Thank you for the patch!
>=20
> > From: Biju Das, Sent: Tuesday, April 16, 2019 6:38 PM
> >
> > RZ/G2E cat874 board is capable of detecting cable connect and
> > disconnect events. Add support for renesas_usb3 to receive connect and
> > disconnect events and support dual-role switch using usb-role-switch
> framework.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  V3-->V4
> >    * No Change
> >  V2-->V3
> >    * Incorporated Shimoda-san's review comment
> >      (https://patchwork.kernel.org/patch/10852507/)
> >    * Used renesas,usb-role-switch property for differentiating USB
> >      role switch associated with Type-C port controller driver.
> >  V1-->V2
> >    * Driver uses usb role clas for handling dual role switch and handli=
ng
> >      connect/disconnect events instead of extcon.
> <snip>
>=20
> > +static void usb3_check_vbus(struct renesas_usb3 *usb3) {
> > +	if (usb3->workaround_for_vbus) {
> > +		if (usb3->usb_role_switch_property) {
> > +			if (usb3->connection_state =3D=3D USB_ROLE_DEVICE) {
> > +				usb3_mode_config(usb3, false, false);
>=20
> I should have pointed it out the previous version though, why does this
> usb3_mode_config() calling need?
> My guess is:
>  - renesas_usb3_start() calls renesas_usb3_init_controller().
>  -- renesas_usb3_init_controller() calls usb3_check_id() and then
> usb_check_vbus().
>  --- usb_check_id() calls usb3_mode_config(usb3, true, true) and then the
> HW acts as host mode.
>  ----> So, you'd like the HW to acts as peripheral mode when the
> connection_state is USB_ROLE_DEVICE,
>        you added that the usb3_check_vbus() calls usb3_mode_config(usb3,
> false, false).
>=20
> Is my guess correct? If so, I'd like to add such code into usb3_check_id(=
) like
> below:

Yes, it is almost correct. The scenario I am trying is

[1] USB type C  cable connected to a Host Machine(TI chip identifies as Dev=
ice connection. But we haven't installed Gadget module for Device operation=
)

[2] After that trying to install gadget module. In this case,  it calls usb=
_check_id() as mentioned above
and configure it as Host mode.

> 	if ((usb3->extcon_host && !usb3->forced_b_device) ||
> 	    (usb3->usb_role_switch_property &&
> 	     usb3->connection_state =3D=3D USB_ROLE_HOST))
> 		usb3_mode_config(usb3, true, true);
> 	else
> 		usb3_mode_config(usb3, false, false);
>=20
> What do you think?

Since as per [1], usb3->extcon_host=3D1 and !usb3->forced_b_device =3D=3D1 =
 ,  The above code always enter into Host Mode configuration.

To make it work,  I need to update  " usb3->forced_b_device" based on conne=
ction_state from TI chip. So the new code look like

1) There is no change in usb_check_id() call.

if (usb3->extcon_host && !usb3->forced_b_device)
    usb3_mode_config(usb3, true, true);
   else
    usb3_mode_config(usb3, false, false);

2) Update "usb3->forced_b_device" variable  based on connection_state.

@@ -2370,6 +2376,7 @@ static void handle_ext_role_switch_states(struct devi=
ce *dev,
                usb3_vbus_out(usb3, false);
                break;
        case USB_ROLE_DEVICE:
+               usb3->forced_b_device =3D true;
                if (usb3->connection_state =3D=3D USB_ROLE_NONE) {
                        usb3->connection_state =3D USB_ROLE_DEVICE;
                        usb3_set_mode(usb3, false);
@@ -2384,6 +2391,7 @@ static void handle_ext_role_switch_states(struct devi=
ce *dev,
                usb3_vbus_out(usb3, false);
                break;
        case USB_ROLE_HOST:
+               usb3->forced_b_device =3D false;

Can you please confirm are you ok with this changes? Or do you prefer the p=
revious one?

Note:-=20
 I have done only sanity testing with this changes.

Regards,
Biju







