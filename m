Received: from CP3P284CU006.outbound.protection.outlook.com (mail-brazilsouthazon11022092.outbound.protection.outlook.com [40.107.203.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F103BCD11;
	Thu, 16 Jul 2026 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.203.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210415; cv=fail; b=jwBCJCm1ntfZJlczKI9ANkpvcPZP5CZe/E9AqMA2JKFobvhX8/lCuWqCJ1e47yIi3j7Vi0U21HrCtTqErjIzNj9FSh7MkprPBhfN1ai95h+onV3gU1sy0I+00Z+/9/YE9WY8EFWPy0I6V1WQ748xVFs0P53ZudI/g/EjrGibYZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210415; c=relaxed/simple;
	bh=SXE6gS5BSfJTKH3JKIEpq3Kb+Rc0z/KJQzaeeRWj8Yc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MzdsKkzeksnUw7td/rYanf2xrPtsSy9Fze2xpb39VbMNMUTC0p1ycTLTyabw1XHBEcGWJ5Qp/elSIByx217gsE8d0bECSR/+ZhIFPvxZLhpyuwoOKoX5/zLCxfh80UvtdYp8OJh0GI5gJUIuZNpFynFAVwFLe+b7u98y4PDLeIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br; spf=pass smtp.mailfrom=lumal21.com.br; dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b=Frz3u7uB; arc=fail smtp.client-ip=40.107.203.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b="Frz3u7uB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8npf2bfika740T6ztr/81+IGEPZTUf/SegwDUrrkOgHdEGJCq1BGvFW7hEzNzwPjTcAiiJdA02OPgtcb+fEtWmGYMzcqMafQEpNxAO/zAeD66n1laboBhfaD41M3vNbl7Jpac60KNl81gR9ep5xnXjT9vTd6HBtmeexS5w9nWpoh9+6W/v0Ppd9pkqUgPOYG+uSnGlbGjiGA9QaCTlSt6VvhAVEBWXQa10Ys0H2U/9+bRpUIKUdJvaUJCcSf9xkck/SNECmN23kHNN9iSI8ODQVQyHFi75rgNtpYlgJONubGN9tFoi0L7MT6IVGctr7qI4UWd4J4UMNsuwDoZ2O5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Msikg2i3GqQ2RJsJEqVOmNhwTxWdPgJJpA6KMLv0cE=;
 b=eV+QwBpWwwzf8qFved3ITi84JO9f1m68A1lYOIsXaV5guNnTp2OvyPNV1uzfHuf9smP/UjRYn4pq+oI7M8xA6xKgM2ejm1d1rLVtGVx2tcr51jXSiGWGIuNRV2ddOVrejIJ7+OJeC7F+W0uPHbs7NwUESiVbJM5xD35kpaI4Vf3F/NeJELYbkBfAbPzThJyixDOR6l+02ScLFqSbqTSTMIlVCWt3gVHxW6TYCrPC61JT3q2LoMNoJI2TVGklvOcgumO23SrtVZnQZfLpezDnjQVSDiT+HCNeueSPkPPiwprcshasxs4N3FN8QPZT+2qAo8CwdSzjI6nvbBxWLDarJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lumal21.com.br; dmarc=pass action=none
 header.from=lumal21.com.br; dkim=pass header.d=lumal21.com.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lumal21.com.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Msikg2i3GqQ2RJsJEqVOmNhwTxWdPgJJpA6KMLv0cE=;
 b=Frz3u7uBDYOynxT/unXVR1I1FUJgJvUX6pvvVWk48e9w057s1XbgOX8A4BVmP6kTlpVs30pha7l2mNdtEbmNlbGg800fJwOvg5PUVTHA1lUs7ouCKTO28giuaH7d0CcfZp4SXqeW1yXBFrsMI6YntRs7lmYCW1ceKQk0Jdz4p7ZZjr1drHTPp5vnHdcoUy/0zlA4rIYnEHHWyDOARj7N7opmfVOB0e72WHaipt4dnLkBc7CusKI9fngUW7zAjFTXxnfrYFquAEzHkYPz/ahwsi8WCrZ6q6IGGH5s8+RyyUZfKAL+vzFHHkvTP+Ui2aBqzXB6o9ccKq6IT/K+7dKsLA==
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2aa::9)
 by CP9P284MB4054.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:374::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:00:05 +0000
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600]) by CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:00:05 +0000
From: Lucas Martins Alves <lucas.alves@lumal21.com.br>
To: "b-liu@ti.com" <b-liu@ti.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lucas.alves@autotrac.com.br"
	<lucas.alves@autotrac.com.br>, Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Lucas Martins Alves <lucas.alves@autotrac.com.br>
Subject: [PATCH v2 1/2] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Thread-Topic: [PATCH v2 1/2] usb: musb: dsps: implement vbus_status and
 set_vbus platform ops
Thread-Index: AQHdFStnhC5YPYFnrkOFgUMSgzF+oA==
Date: Thu, 16 Jul 2026 14:00:05 +0000
Message-ID: <20260716135957.474145-1-lucas.alves@lumal21.com.br>
References: <20260716121922.404506-1-lucas.alves@lumal21.com.br>
In-Reply-To: <20260716121922.404506-1-lucas.alves@lumal21.com.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.53.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lumal21.com.br;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CP4P284MB2402:EE_|CP9P284MB4054:EE_
x-ms-office365-filtering-correlation-id: f7be5a8c-aa80-4eac-ae0e-08dee34289e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|11063799006|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 t8EmSgPW1VXsZokJwip2UoZFmSmZmCXYfrGJbivZh0y+HLkXvES0Kb7oZEMAFNjIHym4fsyDrZ8TXhOUS+qwfzHviULtpDwWe5dr2x2m53sZkpv2T9UNvfQHywy/Bf77ybT/uE+O481vByTDVnBILutfpbybjf3kYbGkFusNG/XrkB/Zr6YYS6nx43om0KBG9vstcP5IL7NLov4xm2SwR0FQDCY2//e0kDLPjMIZWHGx6Z6H60dVtSm2jRFr0Pp57u98rkhy6qGqfh06B5GJ4vsC6m/kGAPd0ULJO4k2CzrsqqMOSfCDYupt9k6oRjnnAPRTuY7Z8C34BVhZp8n4O/EKY4uSY/6SRyKKNeHgH4VQbqCjm6dVURZBLCJ78ehr4NSyd6eq5GumKdvr5FDY2hOTlNTHYoLHtHLlmLnNAhK+IKibgHN0kP03jsjRJCw3aZeO13jP8Sen/q4nwh+HmLyg1q+/uWPuPIgM2D3RBjrFmW+ILbExx5scNCyl8ISGkVHdAM2krZq3BtzQBr0G6VaqiFvR8aqccAkRruLxVbefwARS+y4+61KwdkmcZ1ptrBdqj3nXmB82KjjqmvAJqA7wNKWkBy6Kq8RlM3NfStRLelB2fwxbC2CSZSCRdEftE/0IwGZantMpsALZ76/I4W83eZe85nk0y20Zqd7+8ehymZRvb7b6Mm8DnX62BVk5dcS0vvrwzGyluB9pOSrKlw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DTuI0iOXTAOSEdzyGeHWbI8ILVaFevl7X5/wnRMmFzU39UJt4eiHIRsHrf?=
 =?iso-8859-1?Q?IifJdYCSEwpBZbu2cUX1m9ajm8g8GiERu9WLFJCoonuXOy8IA5G5VV0UPh?=
 =?iso-8859-1?Q?Itw7Bb7xTpfBeRgibya4o1mZN3VEFPDeMJTwxBpTRjOuvs7YEKSRBrbeAx?=
 =?iso-8859-1?Q?E3AcNLhYbnDpemfXq7z8iNAwGm1hkwTw/39EsXZsdpu2DMchld1qN7/XCt?=
 =?iso-8859-1?Q?odEyO51CdgC7ZfckK0zutriS0mpIiTJjPSapRHan5jBD0tO79dAMT2+86S?=
 =?iso-8859-1?Q?PFZ0rjZeNcwkCn50MBb5DQ4ay5hiWUn7ZW/ei6pwlTJaZzXyZhouK63i+B?=
 =?iso-8859-1?Q?bhfvKQLV4GyFABtR7I4SazfRpDn7kdPlTJlhOkybNUfhdvcbTYPPTli4tc?=
 =?iso-8859-1?Q?5fxsqMABedBHiyb4OOIXktK4y1bS/+KWkgeWQUtI45hnBzAe2Y18wMDjwJ?=
 =?iso-8859-1?Q?h38yiI3lqZK7Ksunxn/ZgpmETFWcjbUC8R0e6Sai3Lu1zK9dVKs0yUjW+E?=
 =?iso-8859-1?Q?dxa5mMK+P3BOyU7vauEvtcBbS+u+m5BeIQhBpzzbbB64no6QOMhhXBxAmV?=
 =?iso-8859-1?Q?2PyTD7p4l2Igs4KB3Io8GALBzMzDd4aJN31QsKe3VjVTmoE8K2uPLRsulA?=
 =?iso-8859-1?Q?Toi8Dx/LOldc3QkUE1hIrcanVQaRQY6OgZL3Z5T128gyI2RrLS+IMz6VBH?=
 =?iso-8859-1?Q?J4R5PEZh5WNnLuq3W6LmTHM/p5IlG4XE4fQlAP7lmiYs6haYfu3Mflu88R?=
 =?iso-8859-1?Q?U+nmnKzz2/5V9Vv5vBUDVW6a5Nld17rAjvHNaTQfqJb1WKj+NviMEfFxkU?=
 =?iso-8859-1?Q?T665EnDYxzTh/NmpDxcrS4oidoLPMIqHG8zVVSqa5PeN71qxiVKb3EfVA7?=
 =?iso-8859-1?Q?F/WfvsCl2WoPfZy6LhFLqPiFoXXcgqq9pGesTVEnoEhey2ekXUkHYp+DpS?=
 =?iso-8859-1?Q?wxxiMxv3nTiGMxIrg8YoKFSV66LrFEjgaEGy6ncQ41cCVXpA/0abE0FBSd?=
 =?iso-8859-1?Q?NTTM+DpPsbMRJ4IWNvnaXoUVsP3MOCSyJPg/0m+cFFGnsDW4pnOk+hYXGj?=
 =?iso-8859-1?Q?Hx0WqJHpngpEIB9m+ZG8Is8CAQ1REUISOKnZKmBgZH1GOBbV6e6SWbvJYK?=
 =?iso-8859-1?Q?awz9is0GJWDfrawbx808bBLQktGETJI/6RLI8mZrDRQSFWUrQntaFt4xUy?=
 =?iso-8859-1?Q?KtXAK41+IFgDeSR9reqpMS5i/GsFKweTGaVHfmIBO4go1AqKBI6l0SPzFL?=
 =?iso-8859-1?Q?JgJ8iEEZhn9lLc8JppHGbq8JYYbpZyIfxWGTC44sV7Oy85FjE7z+x2P5tt?=
 =?iso-8859-1?Q?NnbZ2EZNuJpQAAbfwdJhqrsw6pVkCkmGlY391N+6fM59etYUcT6kqrrfBt?=
 =?iso-8859-1?Q?bmJSDfYAu25ARYZj8t+XzCdO9RaymF0mhcHcAwF3cODixPzXOAYzyMg0Y+?=
 =?iso-8859-1?Q?DrWqBI4C/6xxF1KwTKiC3JzzD03GZZLf+rWNpiSWFbXmqqOENaTmTNrXIY?=
 =?iso-8859-1?Q?iGOMBA2oZBoKnnTIyCOiErx3riFZdfm/9tFqe5dUDSZoWs5Nm81a0yd3Dz?=
 =?iso-8859-1?Q?pU0AMRa5yFKy9FHEl5lWQHomiZdOBxZrVXh3RXSHCU3/7NNU8GacSSDAKA?=
 =?iso-8859-1?Q?CXsyPP/pfzrAmVx2PTHF7413hKNWc41R10S4M7g6z6mqiGtlxUBHr5jqFn?=
 =?iso-8859-1?Q?msDEvU+qjHT7qvP3/CtE+C9hqJxGk/qlqHpoox5uHnpbIfR9R9w5qztBRC?=
 =?iso-8859-1?Q?uqBjgIf/2yeXN9trG5j49ZUI8XIZna+EiTF75K2/6ewF4T4AcLVWvhD6Ey?=
 =?iso-8859-1?Q?JkyiRjp2qQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f7be5a8c-aa80-4eac-ae0e-08dee34289e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 14:00:05.3779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 99055dd4-6575-473d-944c-c3b1a5a6649e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3LbQDpTNo0Gpsfb2wy9pJ3xGifEyYq+r9bLV0EJFL0grPPYQkneLSbvV14D5GqLdAJgen5GrklOU8ET7d7+MZ9hEn9RHnsanLXUMlTejgAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP9P284MB4054

From: Lucas Martins Alves <lucas.alves@autotrac.com.br>=0A=
=0A=
The DSPS glue layer (used on TI AM335x SoCs) was missing implementations=0A=
for the vbus_status and set_vbus platform ops defined in struct=0A=
musb_platform_ops.=0A=
=0A=
Add dsps_musb_vbus_status() to report VBUS presence by reading the VBUS=0A=
field of MUSB_DEVCTL, and dsps_musb_set_vbus() to drive the SESSION bit=0A=
on MUSB_DEVCTL, enabling or disabling the USB session. When disabling,=0A=
musb_root_disconnect() is called to properly tear down any active host=0A=
connection before clearing the session bit.=0A=
=0A=
Register both callbacks in dsps_ops to allow the MUSB core to control=0A=
VBUS on AM335x-based platforms. This enables the USB core to perform a=0A=
VBUS power cycle as a recovery mechanism when a USB error condition is=0A=
detected, and also allows userspace to control VBUS state via the=0A=
standard USB sysfs interface.=0A=
=0A=
Signed-off-by: Lucas Martins Alves <lucas.alves@autotrac.com.br>=0A=
---=0A=
 drivers/usb/musb/musb_dsps.c | 30 ++++++++++++++++++++++++++++++=0A=
 1 file changed, 30 insertions(+)=0A=
=0A=
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c=0A=
index e3935f18dd56..8e3ef32f615e 100644=0A=
--- a/drivers/usb/musb/musb_dsps.c=0A=
+++ b/drivers/usb/musb/musb_dsps.c=0A=
@@ -618,6 +618,34 @@ static int dsps_musb_recover(struct musb *musb)=0A=
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
+		musb->context.devctl |=3D MUSB_DEVCTL_SESSION;=0A=
+	} else {=0A=
+		/* Since we drop the session to turn off vbus, the connection cannot sur=
vive */=0A=
+		if( musb->port1_status & USB_PORT_STAT_CONNECTION )=0A=
+			musb->port1_status |=3D (USB_PORT_STAT_C_CONNECTION << 16);=0A=
+		musb->port1_status &=3D ~( USB_PORT_STAT_CONNECTION |=0A=
+			                     USB_PORT_STAT_HIGH_SPEED |=0A=
+								 USB_PORT_STAT_LOW_SPEED );=0A=
+		devctl &=3D ~MUSB_DEVCTL_SESSION;=0A=
+	}=0A=
+=0A=
+	musb_writeb(musb->mregs, MUSB_DEVCTL, devctl);=0A=
+}=0A=
+=0A=
 /* Similar to am35x, dm81xx support only 32-bit read operation */=0A=
 static void dsps_read_fifo32(struct musb_hw_ep *hw_ep, u16 len, u8 *dst)=
=0A=
 {=0A=
@@ -702,6 +730,8 @@ static struct musb_platform_ops dsps_ops =3D {=0A=
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
