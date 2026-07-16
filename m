Received: from CP4P284CU005.outbound.protection.outlook.com (mail-brazilsouthazon11021089.outbound.protection.outlook.com [40.107.202.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F56220ED;
	Thu, 16 Jul 2026 12:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.202.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784204389; cv=fail; b=LlfuQTnIHTZWHms5RE+wWhZf0aj4WP0OwhqMGBjxWcM9snpO5uGEZxxe8eTdw+cERMrB8wTveTaO4jPFnNAWphp6VeIqacXMuSua+UutG1K32KlW9ifbX8PQKzRBtMJmgB/jxOsvakB1sL6ihM0Aem3LJL9IjG8UGCUR8JemAn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784204389; c=relaxed/simple;
	bh=rGsQC95OClBDSqr5c2lDlvDk7b5d6cXR5YXCpYkPeDk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hyHNJKW6Bm0818GvFuCUIdeXQQdJfP5qbHxwmX+RSOAN85u8dMCwBd4mwR2fWPDu01Euil3UOpO79mtn9BmEYv2V9z0Pd05FVOpxVx1kkq+JKwBfW8fvbIFL2vAm0Mb745MsU9j0J7cjANCNC691lzwT3S9zCFT0QvXiohESrmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br; spf=pass smtp.mailfrom=lumal21.com.br; dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b=ge7qsc/t; arc=fail smtp.client-ip=40.107.202.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b="ge7qsc/t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eh2gi0ZaDdYD2Jy/JsSs2Z8sEpnIc2zuW+MnlLRd4zIrcKJZdFtIAOX5sYhVJ49qJ/g+zwjLzb+Tk3d7NS7eO1npKvhM84V+BU6V8qPSVrWoF8T3Ix5yJKhVOuaWJoQMATo2Z5JcIEmMfsSa0KBz/vIzmq6vKM0WvQ7bb/J/+M9v57uoIfqnZwlFAxybwTr24yh1ADofq27/MHbHpjAO5A+thuROxpBjCa7/bl++z4rNFEm7GxEk06R0HJjlYxDJpeuF4NjK8Ph8zGvVxMVO2+udBvrT30LPo4w9NyW//djpzR5XswtyD4ImXNfazs2LDBQTgimR0LVWhsyAPsMaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1gunf5rdRbwlZx4ty+nHWEr2o/DPi0hy9qIFFgd7Jw=;
 b=WPwEoQE9yBLaDjM+QIkagy/GxdE6kj3HAQA07YeCi8a4cUVB0YmwvN1L5n8nwKr9etqfrwfVzw/hz5MD/E9MrarMeZbJBvJeEkDjpbeo8OV+fAZyqDg2M2bECBrTFTBjDHFrwYLNh7dWWisCyLGpz7vuU8LN8PjbyTwRlx0EdcQBAXwlRN4hKL/i0V1VwTFAB0Xr/4VC5yeLThQ8IPU8EXfGpAT/AsowSOEMBHXy7cZvb9Lur6gA0qqjHlbvVWr8K7TtrAdGCLLm+i27BJ6daQ3x6GOUhiP5kSAKrx5Meenk30aHDBajaui4p69RfzJ0uZy3A4DA3f7P+jSUWm9dVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lumal21.com.br; dmarc=pass action=none
 header.from=lumal21.com.br; dkim=pass header.d=lumal21.com.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lumal21.com.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1gunf5rdRbwlZx4ty+nHWEr2o/DPi0hy9qIFFgd7Jw=;
 b=ge7qsc/tzIXiRBYdy2dI0bDFWU1dneSwxmLRV+iMC1LMf+Tu4OVw6AY7knpjDAqC/pv5hEHFXqhOFf9UBtzAhLrNvReCajTE0+JDkaEW5gfCm1Xgu/uKy0HUo2sT0tZBu/NHoCrpqDGx30loHvlBHNfUIETA6SaHXZuBFjAQGOr9qH08+0JO/ZLXqcUF71R6AjiyAPkuwDkDNLAIADQSLl2scIS3BeI4g15yEMt62MnMimOYIOMIyijrw9mysb9IFhjFImXV9Jy9bs//qAPx++w47zyUyVFpdIlpjdofOVNKtti1d8M/eMJgpEW5JHWA6OvkFqtdXnEIxiI8yrElPw==
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2aa::9)
 by CP4P284MB2455.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 12:19:37 +0000
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600]) by CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 12:19:37 +0000
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
Subject: [PATCH] usb: musb: dsps: implement vbus_status and set_vbus platform
 ops
Thread-Topic: [PATCH] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Thread-Index: AQHdFR1e5DpmiN65lECL/+YSGv+lNw==
Date: Thu, 16 Jul 2026 12:19:37 +0000
Message-ID: <20260716121922.404506-1-lucas.alves@lumal21.com.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.53.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lumal21.com.br;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CP4P284MB2402:EE_|CP4P284MB2455:EE_
x-ms-office365-filtering-correlation-id: 3ba32519-3af6-4cab-3726-08dee3348114
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|11063799006|56012099006|10067099003|18002099003;
x-microsoft-antispam-message-info:
 jh4kIvh1ScHxTe6Ni5JJQCrbeKrIbMPshlWqntd+O0dMn/jOhrjQgNxQ2pWyDpaiNdyuXSmnMYdjMMtbSMEk53N6KeQVuosWgvVXQL/lbiXsY4tIlgDvY1xRvU+fnuAqXMWvALkxCadWhgFgQSpvQGd+H3PBqTyAIwIMMWiCuIyVcGTsu6MsvG8Sp26MWr8wg+RuB2PU0kw+LErtkJVHc5SXTRuiq0cMm48AUMu5TpDSxFPi3ZQDta4WJMcnsbSOmrZeh+McLbJCeVQXUHqvNrULi5TD4WUec1gCEOYFEJ/U54EBGcL4m+cYtZTtcLJqLf29htSQNaB8iLFMaFzYnAywq88G0ZSv67b/cmOPVpUj5GDmaMfhZ+4TyJGV2XMT7tHc+08uaJD/GpGtFbCo2dszBlO8lklRjEw/8t2L5DPT1teqfnr50E7BJyJMfBv/iT2Y8RPMvVPQ9R7EA5h1lWAmbZZ+4VhqrdOgzCXHYW6UBWp8rFRIVh8l/Z3yDQGSaK7PdcCbrpgLfFxDISJGA9QVzm/LItuRgvxvleWd3MgrRuC05mQRX+umm62em7tFEPmSLAfwEBmqlkepeKc5GSZfzgcPdQmAoYozYcRIUZ/JheIbY1LGr54K95UIqzC0//OLoL00+y0aVadtyeT0f1Z6mluaZmtOfCACf1cOMs/NBJW7TnUngKylSO8fcoXSyVShD8VnLzuPnJXvqazscQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mVfedZGAtnYZm0xf5/rQ40O6Q+9v+JleZ8cQmNmdho3Z6hmdUJMsYCXGPN?=
 =?iso-8859-1?Q?v5b/Yivlg2Yd7cRZQqwJksWROvlYdwB+UT17JAH78aXQnvlImRLowA9bO6?=
 =?iso-8859-1?Q?3PRfzFoevwDa+4WRLOKJvT4GRmKncRIi9O7/0UpZtfFOLB6W5huNbjhG9X?=
 =?iso-8859-1?Q?71z/ayH3swFLoepqIxEosku4yaMVYaafTfr/7JdXQl9Tz0xjNGKQgBMvJS?=
 =?iso-8859-1?Q?yXnTKnhbPk+ERScF/kLKl81gx0QDhDDswNpw2BDreBk8AW94b2Q0GMmNG3?=
 =?iso-8859-1?Q?7ZsdAVN24Ys18NsbzG6uBMo7VPChnDudbs15hTDt+/bfqXz2ImZLuhsG33?=
 =?iso-8859-1?Q?JVqtRblpB3yRmOh9CXDdt/H+heERLiToLB68/WmbAF6oN1aOpPn64GxQ6B?=
 =?iso-8859-1?Q?OJa16BBb0R9G4qCOE83Xbckw9r07PfDPIR0Bsi7JIjHEpoyzCfesJe3Lsc?=
 =?iso-8859-1?Q?r1TcWbUHgnZAHubVwRpNrLhENyyLNOQeourG6FNZYu0On9pjLyVsfz6U4G?=
 =?iso-8859-1?Q?7ljhfYNqOy1qlYVDJiNKX7EkiW7TyCG5SYmtfC8Cz86U6cteOpZJiTWK1n?=
 =?iso-8859-1?Q?z3GIBTwAKbSNxiQINN6+5HR4lfcsWnoEM68GIw3/Xgwqc5lnkVp/1zPS0Q?=
 =?iso-8859-1?Q?gAiWy9oh7bcNK5ZvQdtD+amRLOfO2oahK8JfegLPu6HsdKa5tURv1z3EbE?=
 =?iso-8859-1?Q?PopA9x+0dXQo+GPreWpHCskYE2gMxDe2XlFAih1THkQRaKXRAcAFs0bC86?=
 =?iso-8859-1?Q?VZPywJgurX4qPFcRKLHUeRmOGcdbKj+hs0hdeS+76EvomyR2CpP6XzM0VB?=
 =?iso-8859-1?Q?uHif2yzxXJrHas1ctOMmxbcIPruiKfNKARt4QQ9k6y3mCasktRX2XOBc30?=
 =?iso-8859-1?Q?QurjRqgcY7X14HUCOsv0eHzIvikwm9+qDVi7trz5Dfm2EL9HcBXi8umhif?=
 =?iso-8859-1?Q?sZG1+lmmxZ9R4A9QlU5fOh4h2Lv1C/xQDSkEX5GB7H7mKBGPmFnsJEEeq6?=
 =?iso-8859-1?Q?BYzA5eDIFie7PzlCrQ4IOkpjKKRpiCpcQ/3bglIcIiye8mQN9ti2yPxVCJ?=
 =?iso-8859-1?Q?2+oBt54YerDupu1WrG0EXulPPcYK0z0Dq0W5tUVFneTJAjgRiKKyAz8XjE?=
 =?iso-8859-1?Q?PRHhcQ4iJ1Zro3fS9xnHV+O50GJ3Vs9omkrU7PqcYLbcmm1nq8xDoU6z23?=
 =?iso-8859-1?Q?3vB3Z2vPRUNgXz7BA0sLvHzwxPHbsi0CMj9bvoSfZwabebwyCAVISXFpsk?=
 =?iso-8859-1?Q?ol0ezfYvGsF1DA0iYrr5pPF7KeON//Iwr5LpHP6LizyyDJEcBqBj9ky5GM?=
 =?iso-8859-1?Q?nQKB0+YGffA5iJbE5jCMQNUBZhumbei2pEAdc9tw0TKVIHGIZpFZi0Nsb/?=
 =?iso-8859-1?Q?ajw93PgZEnzlHOX2UDh6GJCiDcMfeVgY57FirXLxWj7xnMqHH3i8RlVQ/h?=
 =?iso-8859-1?Q?iDGYSoTxe4nddjpEEYpjTCoYI4GZok71IHYkQ+pYP2cH5e4gj1EP9G+T4e?=
 =?iso-8859-1?Q?ji9A3ZMXQEtGVcg+FEbWFYe+GyFErJUMTBZpv/FqWzhLOJiZREUg+DsEro?=
 =?iso-8859-1?Q?bMNcgYwH/l2Maiqdcr9862dGhB6YdTiv7KrcQQw2EkIEIP6IFrNKzd2f0l?=
 =?iso-8859-1?Q?4SB5+V0IXhZquL4yvbAuTaRoadGdkv3SIC7htN1FBUO4gzAiYtx3rpmpL8?=
 =?iso-8859-1?Q?GnI5GUgfZCO8jgVIWR/QH14zV63artgijN5JNAtmqVmQR2fgL8HgOWeRSi?=
 =?iso-8859-1?Q?1kR91DsZsaiHrV3mf4Xvw6nPgjzPvkf4ziAHuReE6ZS7vQ1UuhKGvZEFXK?=
 =?iso-8859-1?Q?QTZb0HtBNA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba32519-3af6-4cab-3726-08dee3348114
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 12:19:37.3192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 99055dd4-6575-473d-944c-c3b1a5a6649e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pWOs/dVeKDZqmGQasEEjaPOkKZmUA8wQHrk2Y1V9x9jKDFezb/Z/0tImN67fL/VYckyuKaVg5Eg0VpmGfdKtQ+zKUNNZOPgj62KiP4qVg8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP4P284MB2455

From: Lucas Martins Alves <lucas.alves@lumal21.com.br>=0A=
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
Signed-off-by: Lucas Martins Alves <lucas.alves@lumal21.com.br>=0A=
---=0A=
 drivers/usb/musb/musb_dsps.c | 27 +++++++++++++++++++++++++++=0A=
 1 file changed, 27 insertions(+)=0A=
=0A=
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c=0A=
index e3935f18dd56..e78b8c06f75d 100644=0A=
--- a/drivers/usb/musb/musb_dsps.c=0A=
+++ b/drivers/usb/musb/musb_dsps.c=0A=
@@ -618,6 +618,31 @@ static int dsps_musb_recover(struct musb *musb)=0A=
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
+		devctl |=3D MUSB_DEVCTL_SESSION;=0A=
+	} else {=0A=
+		musb_root_disconnect(musb);=0A=
+		musb->context.devctl &=3D ~MUSB_DEVCTL_SESSION;=0A=
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
@@ -702,6 +727,8 @@ static struct musb_platform_ops dsps_ops =3D {=0A=
 =0A=
 	.set_mode	=3D dsps_musb_set_mode,=0A=
 	.recover	=3D dsps_musb_recover,=0A=
+	.vbus_status	=3D dsps_musb_vbus_status,=0A=
+	.set_vbus	=3D dsps_musb_set_vbus,=0A=
 	.clear_ep_rxintr =3D dsps_musb_clear_ep_rxintr,=0A=
 };=0A=
 =0A=
-- =0A=
2.43.0=0A=
=0A=
