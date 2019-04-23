Return-Path: <SRS0=tIEv=SZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7BBC282CE
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 02:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D88020811
	for <linux-usb@archiver.kernel.org>; Tue, 23 Apr 2019 02:27:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="HkWrgX1n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730715AbfDWC14 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 22 Apr 2019 22:27:56 -0400
Received: from mail-eopbgr1400118.outbound.protection.outlook.com ([40.107.140.118]:53375
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729504AbfDWC14 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Apr 2019 22:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZiJ73PjuHdyEwns0hWDSdEG296rM5kmeOUX6rdX0HI=;
 b=HkWrgX1nmEXWQTbbW/0z21ao1ldTDIrKMzvDWm6yZek9YPhB6KJPcPRFHLT1hLbGPok7FamqImKTcHTn1T13vQbZoCWW7i4b4HB7okVv9QSqYSE/bVuYG2dYqVDracxFiA/SZoCFHMJA7IQyQw8s3nv3sVBLkSQNK5sEQlHLC3w=
Received: from OSBPR01MB1733.jpnprd01.prod.outlook.com (52.134.227.22) by
 OSBPR01MB3960.jpnprd01.prod.outlook.com (20.178.98.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 23 Apr 2019 02:27:49 +0000
Received: from OSBPR01MB1733.jpnprd01.prod.outlook.com
 ([fe80::902e:1148:6b6d:8280]) by OSBPR01MB1733.jpnprd01.prod.outlook.com
 ([fe80::902e:1148:6b6d:8280%3]) with mapi id 15.20.1813.017; Tue, 23 Apr 2019
 02:27:49 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Thread-Index: AQHU9DkRq+R3PL3OeUiWbh22/w5vtKZJDA1Q
Date:   Tue, 23 Apr 2019 02:27:49 +0000
Message-ID:
 <OSBPR01MB17335B483D7585AB1F27B61DD8230@OSBPR01MB1733.jpnprd01.prod.outlook.com>
References: <1555407487-35394-1-git-send-email-biju.das@bp.renesas.com>
 <1555407487-35394-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1555407487-35394-5-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8702cc6-2695-4a82-607c-08d6c79347ba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB3960;
x-ms-traffictypediagnostic: OSBPR01MB3960:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB3960DACC78F27347C6310A3DD8230@OSBPR01MB3960.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0016DEFF96
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(366004)(136003)(346002)(396003)(199004)(189003)(76116006)(66946007)(5660300002)(73956011)(81166006)(81156014)(8936002)(316002)(8676002)(52536014)(54906003)(99286004)(7696005)(6506007)(76176011)(6116002)(66446008)(33656002)(229853002)(64756008)(3846002)(66476007)(66556008)(102836004)(486006)(256004)(6436002)(476003)(26005)(2906002)(11346002)(446003)(97736004)(71200400001)(71190400001)(186003)(9686003)(86362001)(6306002)(25786009)(55016002)(53936002)(4326008)(68736007)(66066001)(478600001)(6246003)(7736002)(74316002)(14454004)(6862004)(305945005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3960;H:OSBPR01MB1733.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TjwyuuOvz9wZ9n1OzqMqgJAut3BTsLsn78Lq4ZDrf5YT7u3GsNLXBRaTvbBNnqhuCTIr1Zi1hZEzWCCkAd2o0B4DxsrueQHC/BnhAHu6dZ+GmIM1cuqN/N1j5xrBYjD98k8lhiIZV337SMlzZ6a/m5/b1EJ0qZjG0Y3dHqfKXUk7YOlRAzlHA9AwJpwj216hf71KaCRTXMVcGX4G45ZQqbz6VnpJgokA5GfHcv1uKoBFJoAzOYzRQMEFCfxb4LFiv48B1iaQYsXVk+dpg6YPtbnAet/2iIubCKiQjuZYpmnxYhqNR8jKeN9w46fQAVJaRxDcvcJArW1nHw0g3RClgyGcLRFs/nwqF98jcorz3BGVciPp525gxpZ0PHfAaoLe3qlF+ZSYzxh8r+Fz5YobLa3jpmQ/zajiL08AjprpclY=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8702cc6-2695-4a82-607c-08d6c79347ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2019 02:27:49.5149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3960
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190423022749.OmRxpGfjXnQQ_fVtDnltJOMTxb7Uyd2-vZdP3s6mkyw@z>

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Tuesday, April 16, 2019 6:38 PM
>=20
> RZ/G2E cat874 board is capable of detecting cable connect and disconnect
> events. Add support for renesas_usb3 to receive connect and disconnect
> events and support dual-role switch using usb-role-switch framework.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V3-->V4
>    * No Change
>  V2-->V3
>    * Incorporated Shimoda-san's review comment
>      (https://patchwork.kernel.org/patch/10852507/)
>    * Used renesas,usb-role-switch property for differentiating USB
>      role switch associated with Type-C port controller driver.
>  V1-->V2
>    * Driver uses usb role clas for handling dual role switch and handling
>      connect/disconnect events instead of extcon.
<snip>

> +static void usb3_check_vbus(struct renesas_usb3 *usb3)
> +{
> +	if (usb3->workaround_for_vbus) {
> +		if (usb3->usb_role_switch_property) {
> +			if (usb3->connection_state =3D=3D USB_ROLE_DEVICE) {
> +				usb3_mode_config(usb3, false, false);

I should have pointed it out the previous version though,
why does this usb3_mode_config() calling need?
My guess is:
 - renesas_usb3_start() calls renesas_usb3_init_controller().
 -- renesas_usb3_init_controller() calls usb3_check_id() and then usb_check=
_vbus().
 --- usb_check_id() calls usb3_mode_config(usb3, true, true) and then the H=
W acts as host mode.
 ----> So, you'd like the HW to acts as peripheral mode when the connection=
_state is USB_ROLE_DEVICE,
       you added that the usb3_check_vbus() calls usb3_mode_config(usb3, fa=
lse, false).

Is my guess correct? If so, I'd like to add such code into usb3_check_id() =
like below:

	if ((usb3->extcon_host && !usb3->forced_b_device) ||
	    (usb3->usb_role_switch_property &&
	     usb3->connection_state =3D=3D USB_ROLE_HOST))
		usb3_mode_config(usb3, true, true);
	else
		usb3_mode_config(usb3, false, false);

What do you think?

Best regards,
Yoshihiro Shimoda

