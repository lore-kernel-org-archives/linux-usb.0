Received: from CP5P284CU019.outbound.protection.outlook.com (mail-brazilsouthazon11020122.outbound.protection.outlook.com [52.101.197.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3B9390228;
	Fri, 17 Jul 2026 19:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.197.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784317505; cv=fail; b=t3c9EPciSKHtLaTHw+aAtlDP71eMC5b7XHfRjoCKIbAjSSEIFEzOLklx0DR6BOMvSNGQ1fN+1YG0iVclt8cDqDYOUwV+VTO4yCe5EgKBO9eC2yAoYh44PybO0qOUPhdqevLMn8JezjbvkhLGdaOprOFz6shMxO2hv7bNA0wQooY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784317505; c=relaxed/simple;
	bh=C3Ypnglo6mULQcWcEEw4S39sgNiiJBW1KAdbEIN8Ces=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oyCSmfBSNRYsLi8vQGeZIm9k5QATfkJY2sdPjhMWPlheBQ7IWY/y1ddHIoeOggBWk1JFEvVf8BdK0S78Mpp2/fnXk43mRpbMAAvFVOwFFxJFaT/f8AKY2Gx5NB0ufhF5aBmTBFE0zsR9SplYbq6Nkz6rGTGF5ERcVoHCWVbGMEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br; spf=pass smtp.mailfrom=lumal21.com.br; dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b=kDHREEZp; arc=fail smtp.client-ip=52.101.197.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b="kDHREEZp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isf7QFqND6aDv5tjFMjdP73mku7fwFbnBPXxk238KRUCXi9IEthiPi7jBQdtMFUUs5TpmsyHEJzD5DCethiqZzKZXB6S8RT4lDL4Q71OTSBW6RI50TeE+88fz+HBIpduIRFMqos2hVwHWaRo3gxSkicGcFmuRc/vp3EX2dNd+lSBWs/ZodTXDgJbcJxn/W8rWekfDcpoBHPMH73RHwwv/hdtI4WQRlYwu90Vb5opcCm2iFxjBNcTAX3nzPPIAw0CWE6r9zblnAHUqcPxijGtsoniSzJ0wc0CXra3kQ3R0RbSVLls4ty/XBCJnjjEahFKw/PSwMn3IJTB/zdOXhBoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNbqj93ZsSXItRCrJ2pBo1ARd9Rfhg+m96KM99hgi/s=;
 b=u1UI1qI+Z/jntV3I0VEk72GnWDwAntjqKP5hrbw16u14hVQ8LkfAlP2d4t6/PLMzRDWYZwQ4DXGsNzNFspIN/vyNrvPiGOLiR8k3bfiE0dlQiJGT4PVHlwgPy0lchb3CtgEQXK3EJ4HhiqAWE+SmFHKMY0FRYPWO5JKLITExhrmd16JB8OOR6ZHkOVfTZdfUNTMMiVsMTLbi5S2ds6AhsGZERMdQ2vwPo9nOId8TIzpqBhPJI03Xz42+GnA6WJiNewQXCnDd2AexV3k6KGHcGLFELvOfj5VtA/BFS9HMpbPjAh1ZF4lsD97viyzFTqjUZbEv1LXNr0Jmgw0B/ExsAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lumal21.com.br; dmarc=pass action=none
 header.from=lumal21.com.br; dkim=pass header.d=lumal21.com.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lumal21.com.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNbqj93ZsSXItRCrJ2pBo1ARd9Rfhg+m96KM99hgi/s=;
 b=kDHREEZpvMh+XtYsm/5B1jr+kUJspqzkjiS/RMvL8GaIUNA/VdJvOo1ptJ1QC2P+cd/xBREzyer6Eelk3+RWlNuodqHhYl+UM7wOFiMUqxY1Indsu6bxtMCouTEL+spakZS3iPXIwtzqIMtmr3fgSH4vBiZyvezv8cJHnStkTdz5DgrpK+lvQynnAjjopUQ5h1W8KXrQAeNrpLWqRbLmLOWpiP+kqGSgXtL1Ww1mIFaYn/JSeX0vMZAcXtqPOHU4RrpA/auKWaV3VXK2XR+kIHZuVO1Yf0/pfiQqjoDs0yn+iJYfsBVSrRF52VVxHe7jpJIv93laIWtprSVe4O0Pug==
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2aa::9)
 by CP9P284MB3906.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:374::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 19:44:54 +0000
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600]) by CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 19:44:54 +0000
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
Subject: [PATCH v6] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Thread-Topic: [PATCH v6] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Thread-Index: AQHdFiS9fuGiYGxbt0WKFqXu/DNGig==
Date: Fri, 17 Jul 2026 19:44:53 +0000
Message-ID: <20260717194449.317520-1-lucas.alves@lumal21.com.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.53.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lumal21.com.br;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CP4P284MB2402:EE_|CP9P284MB3906:EE_
x-ms-office365-filtering-correlation-id: 9edbe184-6b10-4743-61ac-08dee43bdfba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|11063799006|56012099006|10067099003|18002099003;
x-microsoft-antispam-message-info:
 qQJ2/5fVoL3nSDG6lojgea3OK6n+rsYD6YLIg37toHnLDxOhzso5UCuGCo6VSOc4KCYApCIgEfFvDzQkdogL8ii7zlFjJUhB59aydCtHsCzO/+RhjMqvMbt6NWCKuEEQhArsJtzCMNdTE4njnzvmI9bAEFAb239Uct5a81uYGYzvCAsSSC3cHCu6sPIw3lBgFe3HXy0RgmJglfgZPESzkmk71wSPjTViW8c8ixHHM47IcBlbRBUsdHBQKE3Ss81sDajeVxkb90zbvvgFyoTa0j7M7bXLsoEjECpMGGfupq8Q8EycoNe34dNaGSxg+4mVxd2fadsQGdhM9cXxzcRolFGQnjLE7RMLVUJNz5C0NnHn3qgRK0s2u/LefZsX6xw3a9QXwuPeV8L83dLd9tmW1lCOumQw9Z05meFqjhln9lQ8l4cE8Ip5IMKQ3SJI7P4TEKviQ6L3DqIV8FwtxVUkERD2/+4UICMEr23WO9QXvut66TTf+ErjQhlxdPBYe75nBaanUGCy0eIbsvi4CZKR89pyK8tFifPGWxPJ1aF+E4rPhXCAcsDlyW/3a8yu6Kzopqj2vDVtErKkqWjbRR0QOwmpRVgla9ztXTIx11ekJxET7mh3ZSu+CcOaC/RbsRI7dnPZCVeol1154TTiT2E0V5u7JR3TBG/ir4Vrexrs1w5Wh1s2dgbe4m+t4lTukg8e/jBIDKaAYxfQyj1J9om88m2T61KtXuxg1kHg+0eqkGo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UA01zSCwzJTpbPH67cXEu5+lqh2VdOkkQ4EragEe3Uk6l/ySVcm66RDvsr?=
 =?iso-8859-1?Q?q35oP8/2N9O8lLp3jFYCXD7nnGz2kmo8vSCqMzpu/ysTljW41adb60DXLw?=
 =?iso-8859-1?Q?653NohVkMgAtYRIMTMX0wuy5Qf5FQJ7GxuzOWrkQ5utlbHvOTZRIWeWkA+?=
 =?iso-8859-1?Q?PeZTwh0S77l11P4bNWgyiw+etyV3ggCNifXoUWMXaXcqRFtu6clshQresl?=
 =?iso-8859-1?Q?DVHJgi3LrgBWs/1g8mOacP2C6kH2itm4iOGz7IFwAaBJTGQKuuxpFw5YCH?=
 =?iso-8859-1?Q?a03FqBQN5ph95uQ7cL6Q77Z6AMPf+HVhSyZwirRNUmF2ZKS4cnr3xgnB8B?=
 =?iso-8859-1?Q?duXCWia5bYAo3PtnWqB10jNjwaWt/guFF9BCgAbFECaX5F3ty/N5Jf0JBU?=
 =?iso-8859-1?Q?cqW9RvEijqQKxxqGzUKJl/AEf7bx9wJ57gD2naXTm3RPotfo4k6TVCb0nM?=
 =?iso-8859-1?Q?FvOA/u/DvHuC5Qo1wB7ZurdS1FMogKFVaqFhPgpiRXcDxk9ZGS0Imj/nht?=
 =?iso-8859-1?Q?0D6gXucOIQ6OEOyvohJ3UMddxGGlYNJdi2lvs7cyPO7aJ9ADGGZ5eXjEM8?=
 =?iso-8859-1?Q?nKEK5Hpa/0LWoOwlGXGF8XBUk7AdewtBLy/E7ZON6WEefnvhdA6b4Al3MX?=
 =?iso-8859-1?Q?SdPMOhye3y84rnACaA+HD/z4OQqhpfvKL24VkFIA3KZ1ZMdXfixSwgEFel?=
 =?iso-8859-1?Q?VOWYRdVqZzpmTf6s2GvzRJo+0luDEL7mSIz5nVLwouOmqRGWjMPvkaoRNJ?=
 =?iso-8859-1?Q?xa/8Ej5kLdbdzTL4PWAJA4wxZhOylr8w/B3fewyXk478lsKOlMlYo1PV8M?=
 =?iso-8859-1?Q?4k4O5MJOaza2NaT8GA7IWgkSVUti4jXYfiw01VUOk/t/vQVXqUSTH4SLj3?=
 =?iso-8859-1?Q?Xx79uhl59YgkGObcHHqQNmflFPP4r4U5CCOeUFMbwmwpYmkiR67QcsVSW+?=
 =?iso-8859-1?Q?pL3J7yva8YgEPGzNKOv9MpKD/OaD38bXZMFha7I/A6/aAfmOISuIUnyBZH?=
 =?iso-8859-1?Q?PhXk39IRJGx1nhx39EpYZfwvva3YXruzDgIuGHwbfZLhnW6BE+kGL6/iIc?=
 =?iso-8859-1?Q?TiHLV1NbBEk+hPeS8k+wPnOMiaqTa0vw9Sd+EkxenYhqWw1v7+Xtme4kf0?=
 =?iso-8859-1?Q?jLbPHEE2yZCWeeBGdDPoDf2C2ZCQxsjjR8L7pCzLvjDTbtWC70VXazqlCf?=
 =?iso-8859-1?Q?dtwqyE3q5dr7atM+QzhMn0mgrF7JKKf0fqf17+Jgp6mi6NCL99jGnmJmQZ?=
 =?iso-8859-1?Q?4bUFbYZh3rx2ol0KoKkYnKfJOKXciGSsyfkG6gFYxzyti3n7aF4KRTtmtK?=
 =?iso-8859-1?Q?HZpEvoGGd4ejkn2BVs22Rc3O6UbhHSsgfEBJSVc/xbbsfbeS+k9dZINdBm?=
 =?iso-8859-1?Q?PT0b2f9LHl4wRIDqqp/XHy1RiykB0SG6/cOYrEkpC3x99vajCx/hSfSp8+?=
 =?iso-8859-1?Q?+vvMGytmDSGmKTGs9mIzEDZftqvxqkJtp0fC7pTX7j9TMng1OifbXNeGsW?=
 =?iso-8859-1?Q?7M3FegDs94AKbrndtlTLKrJRPFDGIg0hErSfTl3tnAt82DqH5DhVpBPAcO?=
 =?iso-8859-1?Q?6+kIsTR0fgBdfPjrVKWdVufiOo27qziyKJGkecOTAlSF2arN/HprnNdOH2?=
 =?iso-8859-1?Q?LORpA2QvSBRJKeSJEtydu8b1Bxs3ptlNgNUhJwL89FRrmtFMwm8lx8/5+d?=
 =?iso-8859-1?Q?H49gD37/dsBIDM80p7CEI4xkGCNunHKKZiMt4tL+wmGHTvch49PEQQZiZp?=
 =?iso-8859-1?Q?fsFChzzPFXiplrg7rhGoZ0FL+tDDuD6/cQD994LAmC8aWAN56BhFIKr/GY?=
 =?iso-8859-1?Q?ZxmU7WcE6g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edbe184-6b10-4743-61ac-08dee43bdfba
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 19:44:54.0564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 99055dd4-6575-473d-944c-c3b1a5a6649e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4+NteJyRHcjXcpngv3hCk/01Vc8Mu5xOIVmQzbn2KSo1tLs5pXUF23UFlIFlreQoF9NM/FXHAcAbPB0O5BKvbCSO3nQwxeahyTD3UXyV54g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP9P284MB3906

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
- Remove the unintended musb context changes introduced in the first patch.=
=0A=
v2 -> v3:=0A=
- Corrects the text in the patch description.=0A=
v3 -> v4:=0A=
- Remove improperly attached patch file.=0A=
v4 -> v5:=0A=
- Re-send patch v4 in a new thread.=0A=
v5 -> v6:=0A=
- Corrects the history of the patch that was removed in v5.=0A=
---=0A=
 drivers/usb/musb/musb_dsps.c | 25 +++++++++++++++++++++++++=0A=
 1 file changed, 25 insertions(+)=0A=
=0A=
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c=0A=
index e3935f18dd56..efd1f0dbb926 100644=0A=
--- a/drivers/usb/musb/musb_dsps.c=0A=
+++ b/drivers/usb/musb/musb_dsps.c=0A=
@@ -618,6 +618,29 @@ static int dsps_musb_recover(struct musb *musb)=0A=
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
+		musb_root_disconnect(musb);=0A=
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
@@ -702,6 +725,8 @@ static struct musb_platform_ops dsps_ops =3D {=0A=
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
