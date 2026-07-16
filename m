Received: from CP4P284CU005.outbound.protection.outlook.com (mail-brazilsouthazon11021086.outbound.protection.outlook.com [40.107.202.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C930430CDE;
	Thu, 16 Jul 2026 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.202.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784221562; cv=fail; b=ruNh+QgiREMFKDOruA9bIdbgZWtxeWxlAXvarjBbSXCEj/3LiKLQs4kVPBaQZQVwW1xgIBB6Eemg1YxOxytgtoRjlwIFl9jkEF8y5LS4RNgCUoPcaLjbEx285V180jW/6Qm+2gQYnjB4KKb3UsagCXbIEOI/wRwDQVDhIVI7WWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784221562; c=relaxed/simple;
	bh=yFdaec7OR1ViY45TtMHDvhvm5dNcKxZPnKpZeKGK1u4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LxMP0vCkIdd4qGKmRd3T79rV1mPCJRNF4IzQMEiwwSBDADIHbNlrCYQtaN2k2kby19sOaxwP0NBIEezw5iTgMzgwGQiNMO0QruNWru4BUQDkLQ9Z4iJnJQODFi0ax0HlelvZTNPv4JTRkapqmc9nJifQ6KBM26Vpyum4PagxOEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br; spf=pass smtp.mailfrom=lumal21.com.br; dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b=Ex/Qu+Ea; arc=fail smtp.client-ip=40.107.202.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b="Ex/Qu+Ea"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgMTgYQt327uYptJ+8fLfi4qv3Y2LyOluMOZdSnxS2wtAaIAONzqlkyZE6wypJoQ6oWXpE4ys24CKtaehE91Bg2AdS32C8MQZl7EtOv/qnteFeRhgJGxOxH0iyNKxyaRESY/ikUea7qkr6+D7oFpxzYwx1OSJHEEMUFW9kAB6bPbvBD/obS8/TEePBA3EjJfvrs3yXqI8lwxQTCfnlA6pDTsSSgfmWaS28jN8Z2nRBJX9sQlSfprJx6M9HdRQ0sF0I+tbqMTcl3S3lchUlmmvxUKfPJJt268KmfyU607mIEjQYAt5O08e32lwj0oheuos+V2SNhJCOppJTsWebljcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/IvJUwhfhldNVxbbpbmts1enFAaJNzsfd59cr0Gh5g=;
 b=kJcVvZlQVexSfxijfNXqKTDFs6QyXSmY6UbjFnJm3dUGQixT7VZovrE6N0PKvpv7VLB4ZRqXTGmk4A9EE9ShrnIXTd5VKMKqLwOPqqfv4+DBYnwxqiMPU/PP9JuWEFlp9xfuty1gBhd8V9Q7gn2OhXAn50HvPXvQN79M0HruSV9iR0kOtPVQKgSjtKX2E3RVjMa7XOwzIJB7dbUiJKXDrIr8maW/HwKOePglNUFJ8PY3Z8Ez60sYl1yEG6jkNWFlQ6UM6bxjJ+wUoIj2ij26gKdW0PXbIN4oT29t0AK61tvKBFAzIRiFupx/Zf+jt+IjUkfn5ndoJIbIcZZ20M5pZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lumal21.com.br; dmarc=pass action=none
 header.from=lumal21.com.br; dkim=pass header.d=lumal21.com.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lumal21.com.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/IvJUwhfhldNVxbbpbmts1enFAaJNzsfd59cr0Gh5g=;
 b=Ex/Qu+EaVaL1Gm3F3fF4RAmGRZ6kVzcof9ALLTU9eQQM//V4lM45MRI29avBcWt6ik8+KGal7cB7kXo/618nnmVrHrAsGfuyIKGM2rTjwPcMDoe3x3xgdiSO1l/cdn6jVuZf3DDMD93eiYijXdi2qaw7nSk0b9VESJ5dj2xKOtTobsdLGeGwhenFcgRH0vH6BNZnLfAGlxyHQjLCuk3OpqdIwjFwATWw29vwYowb/MUlpIU2tTpOgpwoawqKJRGziKIZbXiU5caj+dK6jjKtPj6lkOLuTn2tpb/O29a6R7fIEt1jP1wTuzZi8hBRDwtnxMm4x1FPWm8dHl6TZTFZDQ==
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2aa::9)
 by CP5P284MB1711.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 17:05:54 +0000
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600]) by CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 17:05:54 +0000
From: Lucas Martins Alves <lucas.alves@lumal21.com.br>
To: "b-liu@ti.com" <b-liu@ti.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Lucas Martins Alves
	<lucas.alves@lumal21.com.br>, Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Lucas Martins Alves <lucas.alves@lumal21.com.br>
Subject: [PATCH v4] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Thread-Topic: [PATCH v4] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Thread-Index: AQHdFUVcqZIYQ+C0l0SydeDFTweaiA==
Date: Thu, 16 Jul 2026 17:05:54 +0000
Message-ID: <20260716170551.566933-1-lucas.alves@lumal21.com.br>
References: <20260716142516.510574-1-lucas.alves@lumal21.com.br>
In-Reply-To: <20260716142516.510574-1-lucas.alves@lumal21.com.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.53.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lumal21.com.br;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CP4P284MB2402:EE_|CP5P284MB1711:EE_
x-ms-office365-filtering-correlation-id: 3a840231-5eff-4da2-5e3e-08dee35c7f3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|11063799006|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 EvHQjsFF0ujx5QoRQiObAG92ZCdk68ak5lLpYyeUWsXsGOBm2HxuYLHXWlhlhVcx6u+jB3Nr0EIAr1FH9ttlcC7Gd0puBijSCXtfF7SBYA+hSZIfg8J4X2e5KkyCWy/a+QSaaZWufeYaG5fQupDXnLTUgyExnMGKk1ZWKIfs8MiyNbQg/yhTzUU1fDgggl+FXo7UnQYYfdnbCoaiFSFfelhZ+y4WjUtDUgGTO7HXhsPC2LYM1kGfccEIHDf5mgrANnq+K+Tvn5/BJa4svVmD3fkTKbeqq+nRVzz2lpFEypxTNzZmFLwOnUiA2ngQwYjmaiVBCY7o2CPNcHDfBS4do8XsFrfkREX2khUVvOJsZ1CnEwdTNMTGcl72TzebCjFnb2Y4ehx13hHjHGUVm/rBDrmZ9mu0Hs5398dKFa6jz18M1ZjpctdDTjzx6wQx+23s2Wmd6lXtRhgwaEN9B1WySb4uVF7zk6PuGNKeTKBl9C6iMc1OpBuSbEwd/P0iMuwIeSoj2lUv1r2rcGFN7xKG4GZQptQt0T7KlPuDBtk0MqqMmyV0R/gCOl0xAnbhfKp5Gdt/OKyv5gzbtUcNKmy7+t5bFLGAK6iVVjO18VXX2CtD6c1Mw9nQRmYrnxCJ0mbV/7EypKugrgOgq1c7ZYp2MSv46eeEl/tVJzemZ70GQjkfHDGifaakyskH1mzH7SxXSKE8M/u2HkmdOBgBDAOvmHJ453XqdIAX8w1fOjrVcUY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7r0DE5eQzg6862GvgZ5dbYsnsiP9UuiZPVQzOO+1LT86UXxlGb5wN7LK+E?=
 =?iso-8859-1?Q?feFM3BN4gSKXN6gq0FsMurSx3frlTnJBqatw9sloSV6cmUDlqrRlDS3zq7?=
 =?iso-8859-1?Q?PD7auPFcbqu1PTLFn6VsCnqqHMc4nX+w1+rfDXCSf0tXsgJ6pHjgX7c9Tu?=
 =?iso-8859-1?Q?cJdgiYayFbotX9c7LmUFA3LIEhwSCjzGVqgJcUBv5I+8+TKaucNjVPXaRC?=
 =?iso-8859-1?Q?m3JczCbpShm6QU4Cqyn3bCfj5ov1mqkPgNViugBfDKvGo3OintTZEdgWTi?=
 =?iso-8859-1?Q?Q5dau+IwXI6oXFw8/tyJIKS6OHKvzmkNCeVpnmALPeXYAu6ClaI3JiTJN0?=
 =?iso-8859-1?Q?NsWtnAmeB8e2i87ZNrcjkRzPHAsQ9FeXDrn0nBWXKj7JdAFoAhjC89iIQm?=
 =?iso-8859-1?Q?75rSFw1kOOl+OG/3D5/oRT0QWGF2ppUd73vesWPPYmiIPpo0attjbSHIPE?=
 =?iso-8859-1?Q?jgB++6x/uW/1ygfRVsEoSqvVibDTuMTUK+T4xFOnhqEhs/hq9lqLXdtley?=
 =?iso-8859-1?Q?RakD4SH1uuO3+Ok5t9oL954lBWXbDqfNIdzLu60pvSSURjTzvY25IHX55s?=
 =?iso-8859-1?Q?atz5h4PVyhdJPkACymUfZVfy5N9dwtFYbW9mycrFPFI/soOciNCmIWlR7j?=
 =?iso-8859-1?Q?5vChIJlHCCrJhN4TzQMlInZ7hfpInUiA/rj4QRF1YUjk82ZVdKRw40Fo22?=
 =?iso-8859-1?Q?qtdIFQLmp0N3fdeWDtGi4sbNn9TRI0wlISwTC8qJXL9Wt3EE2xgVpnRNGP?=
 =?iso-8859-1?Q?wTK9D5Ic9Iy5VpElCKgjFMhSnFfH96RQhAvTPgmx4lfUo7l76IUEA+DY8n?=
 =?iso-8859-1?Q?qtPWieBB8lXw4Anieh9477s1SXtyReMAXjctJHFNrPDDLlG5fhWe6x/z9g?=
 =?iso-8859-1?Q?czd/qq0E+b73uKRH9sA8DhwyBb4yRUdvxr7f0OooayL6aB2PSClnQW8O8z?=
 =?iso-8859-1?Q?xoAoztmtGRM2mjsIeNv6GiQKWPhZC04+KVQ/LziVUqiuoU/divzA63+3cK?=
 =?iso-8859-1?Q?5DYwyr+zUjicE1NjboUB6AmYdLQucGNHb59ZNoMG/vnWB74Bhdx1ALzJyk?=
 =?iso-8859-1?Q?aI7OuEobiqy3QoZ4tWlL+ZkRxBoqR2ej/DuT29iuO/9BzBi1dyrbzPDmFk?=
 =?iso-8859-1?Q?ddKqenH5kLOvxslk+/pflMgx/94b2uF3eE/npW17U8IVqXzW/EphR4V/lZ?=
 =?iso-8859-1?Q?iicYiLLKbT+65HaJ3GsCCzIGioLziNgSzsoz8mAAzNMoJE8SzqD9SAIAQy?=
 =?iso-8859-1?Q?UUAilwCvnMpGEWfBLl1bu1nD8qy/5C3Xw66l++LdqCMffnPwkjBor8nMj5?=
 =?iso-8859-1?Q?SiuDvhH4LsGrVwNUew8mGLP5VbqkHcqRfaZBEGkqWwc3AXwXNwjWrE/APA?=
 =?iso-8859-1?Q?RxZGRi4vBb0EoOx9ZkqGB4PKjgOIXloyvTQnOBwDJ+vQ1rkfgOMkVDXTI3?=
 =?iso-8859-1?Q?/vQCUVhi9k8uCDIKcxH5v1zhxeHGjaIIUFcRcZEp6T7QK5ddFOJW5pr245?=
 =?iso-8859-1?Q?a45soF6I+345HHgwM6jmmXuvs36c7L5+JyzX2c+PJXQGg8n19TnTW0JJ2x?=
 =?iso-8859-1?Q?LYDdb4m5yPpdYOJbniZTiW/Xb7iMA2/dkYRp3KNL0ODBzcnj6dkCWu9zDr?=
 =?iso-8859-1?Q?tdEZngVcr5HMbt4NiyNO75MKy0Jc+9MJwJJPW/XuigABbDe/HyZrCFbJvL?=
 =?iso-8859-1?Q?Z1VroYbH3wrm1RQW5Q+qIkcIaMgGWcMMd0AaWdaq3q0j1BomGxIXnC9Ffh?=
 =?iso-8859-1?Q?29vlODtJ6Zhn/mFCWS5Ayx9E3Foo506UvjO4/ScoprbIrnnlTUuLWUaZ1x?=
 =?iso-8859-1?Q?D11rLmI7Qw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lumal21.com.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a840231-5eff-4da2-5e3e-08dee35c7f3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 17:05:54.4132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 99055dd4-6575-473d-944c-c3b1a5a6649e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vs1TQbpdcj39iMeRpe1Yz2tmk1t683Bwq5VfA0FaMEkKayBBuwxp/O1v/+BhXMjuxIy1yeEBJVme/0bfbsGa4q+t1xmuEhxOY0L8xK8aGpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP5P284MB1711

From: Lucas Martins Alves <lucas.alves@lumal21.com.br>=0A=
=0A=
The DSPS glue layer (used on TI AM335x SoCs) was missing implementations=0A=
for the vbus_status and set_vbus platform ops defined in struct=0A=
musb_platform_ops.=0A=
=0A=
Add dsps_musb_vbus_status() to report VBUS presence by reading the VBUS=0A=
field of MUSB_DEVCTL, and dsps_musb_set_vbus() to drive the SESSION bit=0A=
on MUSB_DEVCTL, enabling or disabling the USB session.=0A=
=0A=
Register both callbacks in dsps_ops to allow the MUSB core to control=0A=
VBUS on AM335x-based platforms. This enables the USB core to perform a=0A=
VBUS power cycle as a recovery mechanism when a USB error condition is=0A=
detected, and also allows userspace to control VBUS state via the=0A=
standard USB sysfs interface.=0A=
=0A=
Signed-off-by: Lucas Martins Alves <lucas.alves@lumal21.com.br>=0A=
---=0A=
v1 -> v2:=0A=
- remove musb_root_disconnect() from set_vbus path=0A=
- adjust context->devctl copy/update handling=0A=
=0A=
v2 -> v3:=0A=
- fix patch description text=0A=
- fix devctl usage in set_vbus path=0A=
---=0A=
 drivers/usb/musb/musb_dsps.c | 32 ++++++++++++++++++++++++++++++++=0A=
 1 file changed, 32 insertions(+)=0A=
=0A=
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c=0A=
index e3935f18dd56..aecb5c074c53 100644=0A=
--- a/drivers/usb/musb/musb_dsps.c=0A=
+++ b/drivers/usb/musb/musb_dsps.c=0A=
@@ -618,6 +618,36 @@ static int dsps_musb_recover(struct musb *musb)=0A=
 	return session_restart ? 0 : -EPIPE;=0A=
 }=0A=
 =0A=
+static int dsps_musb_vbus_status(struct musb *musb)=0A=
+{=0A=
+	u8 devctl =3D musb_readb(musb->mregs, MUSB_DEVCTL);=0A=
+=0A=
+	return (devctl & MUSB_DEVCTL_VBUS) =3D=3D MUSB_DEVCTL_VBUS;=0A=
+}=0A=
+=0A=
+static void dsps_musb_set_vbus(struct musb *musb, int is_on)=0A=
+{=0A=
+	u8 devctl;=0A=
+=0A=
+	devctl =3D musb_readb(musb->mregs, MUSB_DEVCTL);=0A=
+=0A=
+	if (is_on) {=0A=
+		devctl |=3D MUSB_DEVCTL_SESSION;=0A=
+	} else {=0A=
+		/* Since we drop the session to turn off vbus, the connection cannot sur=
vive */=0A=
+		if( musb->port1_status & USB_PORT_STAT_CONNECTION )=0A=
+			musb->port1_status |=3D (USB_PORT_STAT_C_CONNECTION << 16);=0A=
+		musb->port1_status &=3D ~( USB_PORT_STAT_CONNECTION |=0A=
+			                     USB_PORT_STAT_HIGH_SPEED |=0A=
+								 USB_PORT_STAT_LOW_SPEED );=0A=
+		devctl &=3D ~MUSB_DEVCTL_SESSION;=0A=
+		usb_hcd_poll_rh_status(musb->hcd);=0A=
+		musb->is_active =3D 0;=0A=
+	}=0A=
+=0A=
+	musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);=0A=
+}=0A=
+=0A=
 /* Similar to am35x, dm81xx support only 32-bit read operation */=0A=
 static void dsps_read_fifo32(struct musb_hw_ep *hw_ep, u16 len, u8 *dst)=
=0A=
 {=0A=
@@ -702,6 +732,8 @@ static struct musb_platform_ops dsps_ops =3D {=0A=
 =0A=
 	.set_mode	=3D dsps_musb_set_mode,=0A=
 	.recover	=3D dsps_musb_recover,=0A=
+	.vbus_status	=3D dsps_musb_vbus_status,=0A=
+	.set_vbus	=3D dsps_musb_set_vbus,=0A=
 	.clear_ep_rxintr =3D dsps_musb_clear_ep_rxintr,=0A=
 };=0A=
 =0A=
-- =0A=
2.53.0=0A=
=0A=
