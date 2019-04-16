Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C2EC10F0E
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 00:45:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF78820830
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 00:45:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="rCHWYqUe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbfDPApR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 15 Apr 2019 20:45:17 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:18576 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfDPApR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Apr 2019 20:45:17 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cb525870000>; Mon, 15 Apr 2019 17:44:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 15 Apr 2019 17:45:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 15 Apr 2019 17:45:14 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Apr
 2019 00:45:14 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Apr
 2019 00:45:14 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.56) by
 HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 16 Apr 2019 00:45:14 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com (20.177.125.216) by
 BYAPR12MB2936.namprd12.prod.outlook.com (20.179.91.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Tue, 16 Apr 2019 00:45:12 +0000
Received: from BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::a1bb:f0d6:d9a5:64b6]) by BYAPR12MB2727.namprd12.prod.outlook.com
 ([fe80::a1bb:f0d6:d9a5:64b6%3]) with mapi id 15.20.1792.018; Tue, 16 Apr 2019
 00:45:12 +0000
From:   Ajay Gupta <ajayg@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2 6/7] usb: typec: displayport: Export probe and remove
 functions
Thread-Topic: [PATCH v2 6/7] usb: typec: displayport: Export probe and remove
 functions
Thread-Index: AQHU84Qq/LQDgP8PBUqt3x4BuJUBWqY981Bw
Date:   Tue, 16 Apr 2019 00:45:12 +0000
Message-ID:
 <BYAPR12MB272732E9F3A72FA0A59588ECDC240@BYAPR12MB2727.namprd12.prod.outlook.com>
References: <20190415120931.61328-1-heikki.krogerus@linux.intel.com>
 <20190415120931.61328-7-heikki.krogerus@linux.intel.com>
In-Reply-To: <20190415120931.61328-7-heikki.krogerus@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ajayg@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-04-16T00:45:10.5012854Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic;
 Sensitivity=Unrestricted
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ajayg@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 656c7ca9-cea8-47c6-91a4-08d6c204c8f7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:BYAPR12MB2936;
x-ms-traffictypediagnostic: BYAPR12MB2936:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB2936D029A98D10D6738EB474DC240@BYAPR12MB2936.namprd12.prod.outlook.com>
x-forefront-prvs: 000947967F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(376002)(346002)(136003)(39860400002)(199004)(189003)(13464003)(4326008)(53936002)(71200400001)(229853002)(26005)(71190400001)(476003)(86362001)(97736004)(3846002)(6116002)(102836004)(5660300002)(105586002)(53546011)(110136005)(316002)(186003)(11346002)(9686003)(6506007)(6436002)(478600001)(6306002)(6246003)(486006)(446003)(8936002)(76176011)(966005)(8676002)(81166006)(7696005)(68736007)(106356001)(33656002)(2906002)(52536014)(256004)(74316002)(7736002)(14444005)(99286004)(14454004)(25786009)(305945005)(66066001)(81156014)(55016002)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2936;H:BYAPR12MB2727.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: forF9skNOK3ay6RX33WJtWIxb1UpVs+3VPNZ1ARGkMMxQUQNv1/BvucEbC49UgQ7bWCJ1Ozp34OfOh9OPXFmQ1bqzDos4EffrsV8B7tLzTGnEXe+Ph9ysiKZsKjrxChx+aqy6HYcuOyznFJ6XHxybNB1UhNBRUWezPoJ0QwVzScamOjAch7PVXE9L5FQ5Y4x6go62E2Ev0tQx+C/PhX0xPWkyTZIVgyghqhi6/8QJhn7FGKABa96nU/Jj2Xkjr295Cw65x9MPLC/K8kgc8PDuvMFteBSjdKHFNL4dguIv35P+eQIygwwW2u1Dko7rizzi1p9kmyZJPIvY8GaORbpoJZJ/BRE2m2WPPVEqoc1KKibO+L+ykQblBlKXOKAflb+7+daIY7uCrK7YjHcFzwUs27V/aI1jJts9d2MlgPiXu4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 656c7ca9-cea8-47c6-91a4-08d6c204c8f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2019 00:45:12.5218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2936
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1555375495; bh=an6NuLPJsIdZHMGjTPvItntKIRnF/tIjiZzWOTNHLvo=;
        h=X-PGP-Universal:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
         Message-ID:References:In-Reply-To:Accept-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:msip_labels:authentication-results:
         x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
         x-ms-traffictypediagnostic:x-ms-exchange-purlcount:
         x-microsoft-antispam-prvs:x-forefront-prvs:
         x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=rCHWYqUeDvj4qKzeoqrO6g3JZp5UAMarNsJ8TISrwyL6Fy//zEhQ7taA0Hj8fFh3s
         qY/3nTd/8ZOKB3us99BZchtyXg0YFsg0hSDPvcCZFiCiY9lo9qzq5lKxZTgXXSziig
         xBwHaClaIAnc5z+t5nyMTIm3AsIL8EDvPUhP39sjgDeTuPg7vU/QdbENJkAOsUJnt0
         x+vP4GNtYsWP3DZiwT+NKn8GnU5h3ndHzNCsjAgBQhHDtLsOyBKKby2pxVII4vIevQ
         XnPxBj3Oyq6Zfqo4d4tQunBxccnf0o33YRF4arUdh7J9B5uEDUMlthdOKHNiL0xXpE
         kCpOZRRx3P89g==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416004512.b7zwbzVerIQhQT-msLBJ9kjLBts7OUFOVjzptRnaXsg@z>

Hi Heikki,

> -----Original Message-----
> From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org> O=
n
> Behalf Of Heikki Krogerus
> Sent: Monday, April 15, 2019 5:10 AM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Ajay Gupta <ajayg@nvidia.com>; linux-usb@vger.kernel.org
> Subject: [PATCH v2 6/7] usb: typec: displayport: Export probe and remove
> functions
>=20
> From: Ajay Gupta <ajayg@nvidia.com>
>=20
> VirtualLink standard extends the DisplayPort Alt Mode by utilizing also t=
he USB 2
> pins on the USB Type-C connector.
> It uses the same messages as DisplayPort, but not the DP SVID. At the tim=
e of
> writing, USB IF has not assigned a Standard ID (SID) for VirtualLink, so =
the
> manufacturers of VirtualLink adapters use their Vendor IDs as the SVID.
>=20
> Since the SVID specific communication is exactly the same as with Display=
Port
> alternate mode, there is no need to implement separate driver for Virtual=
Link.
> We'll handle the current VirtualLink adapters with probe drivers, and onc=
e there
> is SVID assigned for it, we add it to the displayport alt mode driver.
>=20
> To support probing drivers, exporting the probe and remove functions, and=
 also
> changing the DP_HEADER helper macro to use the SVID of the alternate mode
> device instead of the DisplayPort alt mode SVID.
>=20
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
Looks like you missed adding displayport.h file. It is available in origina=
l patch below,
 https://marc.info/?l=3Dlinux-usb&m=3D155492587224379&w=3D2=20


Thanks
> nvpublic
> diff --git a/drivers/usb/typec/altmodes/displayport.c
> b/drivers/usb/typec/altmodes/displayport.c
> index 1b2afeb1eeb6..4092248a5936 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -14,7 +14,7 @@
>  #include <linux/usb/pd_vdo.h>
>  #include <linux/usb/typec_dp.h>
>=20
> -#define DP_HEADER(cmd)			(VDO(USB_TYPEC_DP_SID, 1,
> cmd) | \
> +#define DP_HEADER(_dp, cmd)		(VDO((_dp)->alt->svid, 1, cmd) | \
>  					 VDO_OPOS(USB_TYPEC_DP_MODE))
>=20
>  enum {
> @@ -155,7 +155,7 @@ static int dp_altmode_configured(struct dp_altmode
> *dp)
>=20
>  static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)  {
> -	u32 header =3D DP_HEADER(DP_CMD_CONFIGURE);
> +	u32 header =3D DP_HEADER(dp, DP_CMD_CONFIGURE);
>  	int ret;
>=20
>  	ret =3D typec_altmode_notify(dp->alt, TYPEC_STATE_SAFE, &dp->data);
> @@ -193,7 +193,7 @@ static void dp_altmode_work(struct work_struct *work)
>  			dev_err(&dp->alt->dev, "failed to enter mode\n");
>  		break;
>  	case DP_STATE_UPDATE:
> -		header =3D DP_HEADER(DP_CMD_STATUS_UPDATE);
> +		header =3D DP_HEADER(dp, DP_CMD_STATUS_UPDATE);
>  		vdo =3D 1;
>  		ret =3D typec_altmode_vdm(dp->alt, header, &vdo, 2);
>  		if (ret)
> @@ -507,7 +507,7 @@ static const struct attribute_group dp_altmode_group =
=3D
> {
>  	.attrs =3D dp_altmode_attrs,
>  };
>=20
> -static int dp_altmode_probe(struct typec_altmode *alt)
> +int dp_altmode_probe(struct typec_altmode *alt)
>  {
>  	const struct typec_altmode *port =3D typec_altmode_get_partner(alt);
>  	struct dp_altmode *dp;
> @@ -545,14 +545,16 @@ static int dp_altmode_probe(struct typec_altmode
> *alt)
>=20
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(dp_altmode_probe);
>=20
> -static void dp_altmode_remove(struct typec_altmode *alt)
> +void dp_altmode_remove(struct typec_altmode *alt)
>  {
>  	struct dp_altmode *dp =3D typec_altmode_get_drvdata(alt);
>=20
>  	sysfs_remove_group(&alt->dev.kobj, &dp_altmode_group);
>  	cancel_work_sync(&dp->work);
>  }
> +EXPORT_SYMBOL_GPL(dp_altmode_remove);
>=20
>  static const struct typec_device_id dp_typec_id[] =3D {
>  	{ USB_TYPEC_DP_SID, USB_TYPEC_DP_MODE },
> --
> 2.20.1

