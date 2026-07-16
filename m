Received: from CP4P284CU005.outbound.protection.outlook.com (mail-brazilsouthazon11021084.outbound.protection.outlook.com [40.107.202.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC0305692;
	Thu, 16 Jul 2026 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.202.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211948; cv=fail; b=pn7caJSlLic8QX77QqYD1AdVovcaCRuEuqCBwbymofJrMz39GeeL/jnlOjhEyobPJu68vL7CxUeK07u/1xHWwP5c5l281F6RY0S428guiE3jcqADRQGE4mJ2yCjOicS4i1AdOvmqiRJLteREjEW6iGFkvgO5QSexRQFUIqmCA5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211948; c=relaxed/simple;
	bh=vLUjOMQKDuz9xs8irplIRVymVbt6VKW2q7g7YeevrIk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=eX2aKp8ZRFQRdtfyNsm07h1Eloyb100sP7qB4dV1k7nt5ftqOL8yNFGrY8nXqFv3VatA3jCsmFsWYVWWyxH4961zXdKfyQFVImKlZ/hLtcdKFKFODVNakWWkac3LCqrzmZ0Bx/QsJn9UCTCrn3X3N9sZewk/WyZX+XF/PJTmSIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br; spf=pass smtp.mailfrom=lumal21.com.br; dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b=RnZo5D3q; arc=fail smtp.client-ip=40.107.202.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b="RnZo5D3q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3geYGYQ28gM94brOTHVPJa9Tb+da7NXAjK0+bvXirHrl9xxPL8IszeZm0ra9hNHmnGdCrrpyxUnHAUOovmBwLqMjbAjxwgJvulD6nq3itBSulkGCObmXam2RYMzlYUUN5r3guaWI/LuRL/9ZwQmd3d84b5LO9R00vRLiKosmGy6DltFP+Qv3W+6YwQxaHGsr0rdJUc1+hGcC6NLRR0YEPNgkkCnOAxTkbvusI08TFpfjF0hcB+fovOppGlKElFt0zL8vjvfF76QspMWqq4OTTWu5ezumwdt7u2Dby4T++sYFcuICMbBqw3iTGEOGx0nnIB1QyqBpIz4dsaMfwPLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M09hIoay5+uSJDdI3yDEXAf8gtQJeTz49JpGzW+wff0=;
 b=UYp2sDBYLNRxb4BVa5byvo2FaIw6q1w664y7E5mFEbjEsxSufXL50+Gk0KGtE52mkmLM6vayDW1WXft7AaXNANJFrMj8zumxVrdtKaq7Snso172ugCuVGDeBtCU0ceYsmK9pvvpTN91VAmioO0F751zbeQlK+OrjmU64FZBvvN+FvcNhZq24ECO71NJKgtvQdLaIVyeElZoJrcuTtCvXcED54n5U0eMhR7f0LY3zr/V/YUwCUnPDhczpVUItABBRWuOeR5MO/rSfjV56XdR81jany+/Ivu+LjfRr0d3GCWxCxq4xS9nvpGEnP4ox9oBXMP2CTiMgH0F4gFbiXQtD0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lumal21.com.br; dmarc=pass action=none
 header.from=lumal21.com.br; dkim=pass header.d=lumal21.com.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lumal21.com.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M09hIoay5+uSJDdI3yDEXAf8gtQJeTz49JpGzW+wff0=;
 b=RnZo5D3qm7zupXRb8qgk+pKrC8IPXVUs0GSzM92FYwZdZ8k+rc/vbA1zKy0+TTYaK6REjblsT2bEVdBEACNELayf3bLjqOcAgPw0Opis9EmuuoZOTuYE41Q9H5jqzvYSyaSc/tJBgHAGS9+PYbGjOHWTXzNCzOxwVY5SN9QL8+i3/huXtzT8+bgiLVXxglPQpv5o2/b9inQiou7LbnPmppdXEmaBpmsMnqrcrQCPzhx2Nz19nDld2UOnYqavRSCnwkxzxTVYdcdCBshxRpwf3W0YLuoB5a0qzGpm2jB/0S6ceDjWCQNM+Dfzx0msKar31gz+4isnxLqxOrf4mmJplA==
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2aa::9)
 by RI1P284MB3505.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:15f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:25:40 +0000
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600]) by CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:25:40 +0000
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
Subject: [PATCH v3 1/2] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Thread-Topic: [PATCH v3 1/2] usb: musb: dsps: implement vbus_status and
 set_vbus platform ops
Thread-Index: AQHdFS76n5wvWdD4kk6SK1SwhCqY2g==
Date: Thu, 16 Jul 2026 14:25:40 +0000
Message-ID: <20260716142516.510574-1-lucas.alves@lumal21.com.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.53.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lumal21.com.br;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CP4P284MB2402:EE_|RI1P284MB3505:EE_
x-ms-office365-filtering-correlation-id: 254d42aa-f11d-4d56-6aad-08dee3461ce6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|11063799006|10067099003|56012099006|18002099003;
x-microsoft-antispam-message-info:
 pf3TehyrQMouq1wl/DJ2rwBEWnxc4gYhknAfvwFDDbPAya0wCmzygW9xr28F4bP0QAuHsuPbPbEXeOjBJX5w4rOM5xQLR5UffTS6tSXTM0VU9ByAYsXLyZNuqblzfjfvydzSs8k6LEwgWFXq6P0qm8aWxBrcBeZCibESt9lKg6Gd0cBIbw0bVCEW0oXu3BZmymlzH2XXFfyZ39XUzmmB0iBy5x37Fx+RI80Y5ZLvC3k2PSAXlwpSwhYOoDRRvNYvxkSYOvTykiXHGUjchD0JyCiQviwKVKnAEEBvPRk3I2HuHJwdJuSCon+GaLFex8NMDLexbXPUITx89NhRNVUUjyQOSPvozsEdbSWxKjJzCkj+7y9ESU5nIUSD/r9SrxuU6ftBzxSOTHbwysNoUbRdrt/AGhXRyWABO2g3jNEnQBIjUyoIaVbMVxdE5oaL4DMcx2biTcO731wF7dmQp4xfxGyCpRv8BDv7/GOPyRk1d9pzX/GfDZ5sd5AnVpfMFBv0DXZyQ5qP8lNd5bHsdInvNl/k1ode4zFwMESJi22IRw2ZHfZFPyF6szA5DpMiT/JAqqbLFs70WpwQ87jQhR85bhzHtE3MMlcrZ2ZnL8Z8Y+MqhxyX420vYMgxLoaqdG8IJdenS+CNMv34lRRffvrJruV5/bZhzJdNfpbXE5evYwfIdZzfPUsAc7P3YoTpPjnLPAY4BB4jzTVp9lTYm+65smf4dmkxgbH49RApTgM2XTw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TD4jam2f0LCeGhpMCEPJOQmmFfIxXl/9X10Ww3a7cxjmgJ3sEH+vEUXvuq?=
 =?iso-8859-1?Q?8jXjjV6/EwhKidyCmL8szRhUDnKShgwWNu/nHUyNWAX0dVrdNRX7tNEfln?=
 =?iso-8859-1?Q?qODwk10ID8iScFDpXuiZR/2uRcoOnzziPDf9DFK74RoCe5o7cHBxQt0ffP?=
 =?iso-8859-1?Q?LSwm6uoFeePOs8pvw/L+l2X9KgfMPwCKGXhWL4l59Nsm/t31isf9wtI+kZ?=
 =?iso-8859-1?Q?+ZWcu6H5iVyvEdGe80SLbv3uh7ulRJygvT1PYl3s+SuYt3yepxhxeOOY9A?=
 =?iso-8859-1?Q?tB/dBVmCaSuyraTG/jHLctp1tDAUnxU+USIbTVxYIH0oJIW5ppjAivHeau?=
 =?iso-8859-1?Q?B3Sc//Ae7hlxQro/Uc9GFbM4VDzGSXaSkDSR3tO91SyFz6hCatRf1WNZcL?=
 =?iso-8859-1?Q?xS4QLD0ntJstMNzSxErbDjGHQAMtxgcOJ0hYw+FLg1Wn5HIBgPoeCItUpK?=
 =?iso-8859-1?Q?k8Dxe2oWB4XJ6aBDZ8FNfG5sQFElT3phX+hkjBjobm0FxGlzEyn2lFboo2?=
 =?iso-8859-1?Q?AqpwCKnJeRGKWKfo0Mxr+gIipEpUlMbXnL93+FBv/Du6jqB8Uc8peFQnbP?=
 =?iso-8859-1?Q?rrWILxb+FqAAuwB9ezt0JCC+y66XZ1WLWi7j+/q9oIud6lWE0EWQmZmmT2?=
 =?iso-8859-1?Q?XKffED5qwwRObSkrPvAvI5YqJvxuVzc8C290Kdr5TIYsPvpYRrSrJlj/s5?=
 =?iso-8859-1?Q?I1R60vsUJQAe+fJNfUwBiIbEnz3EiNy6oqpqvuxYNVJRGadmnJRrglkkQy?=
 =?iso-8859-1?Q?rVPOFymgWLfXLLJAtSbQjgDmQhMiK/eAcpWWND6SgdwPrj6LbWoGZ8V4ud?=
 =?iso-8859-1?Q?3LJJpBQfcu3r2CtWSklEfkKLtDmzG/jKc2+vxFEq/4NMo+l7EY+WDSa9Mf?=
 =?iso-8859-1?Q?H23LqplnsPG+mYvICfUaaIKQJCYY9D+55w6hB2dOZXg9FwGsKKG7KU+D6Y?=
 =?iso-8859-1?Q?fyTuteaBY6RC2x7Ty/nBLUSVTwWQmrz/3oio4brI2fQCPlP10dvnAX+EjO?=
 =?iso-8859-1?Q?ax0eKG8QmuJ+IUO5lJxq+ze9irPAsnMGxJuDMxGwj+KlZlViwi52WaU4qN?=
 =?iso-8859-1?Q?O6v2Goc8UcwVRDlPCF5iXgFFH/tU3J3UwFOeE4h/rhpgo4TkozZNN7aDgZ?=
 =?iso-8859-1?Q?Yfn0BQzJXF4uWA2RQp6Ndo0O8bgT/v1Nb56CkQTiGGObkVatjSl38Ahalh?=
 =?iso-8859-1?Q?FRzhIaUsgfO4csp4QmxGOQuLT6Ul4+VvOESdnlSr7G+K9AEL7ME0KX/sTa?=
 =?iso-8859-1?Q?283OxDhqik4LQLk1NPL393Ktek6Nr4nUTsatt6CoapR0VsJdOWe3mAQTc8?=
 =?iso-8859-1?Q?GzQVgYjpwsl7hJUZ1VehVoQPRric6adBkvbH/n+qIKm271wu/H72MVUuXe?=
 =?iso-8859-1?Q?JBEfmFIQmixjVOKeEn/BA4YBuff0LeA7/eXO4D/gLWXHfa9HnIGlbuEF3T?=
 =?iso-8859-1?Q?iTooTkOnox4DSCF8IWwfjTqW8M10IkDZ8yyW25wZtDx1CWXY+RahWxS66Q?=
 =?iso-8859-1?Q?ET+dkj7wSxpxAeOyU7E/23uiYTeUGzSchDHsSAem9rCThSr6BsFZgpLqWk?=
 =?iso-8859-1?Q?U10Q1gA9fMKscqXrGxb74r8yBObs8qUU1gL4yy/J5cpFCG8uQqoMu6erfB?=
 =?iso-8859-1?Q?ueR4dznqNWduYtoC6I1o1kxi8FPBzOMTWWsiXaYhbb/9WtvE6mGXpoBwpP?=
 =?iso-8859-1?Q?YgcJjBW8wZT3V80/nRqLqEWOXtusRNTHxI2NryclkDpJt3G2uiSnOpfsCj?=
 =?iso-8859-1?Q?xVCF8jZ+72x3D5RINMGFgM/4JvPonBFUtInL7dnvXyIowz9JPlHIhMReJM?=
 =?iso-8859-1?Q?dtv005vNiw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 254d42aa-f11d-4d56-6aad-08dee3461ce6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 14:25:40.4765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 99055dd4-6575-473d-944c-c3b1a5a6649e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZ+5bMWbbzOvtEKL91WawueRk0Bdgve+KqG+YXM9YWfKg6CnD8BsCToXpe0cegR6LR0qVUMMZqRbMuOkrpsBAIyhVD1zkLP786s4kFKDk0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: RI1P284MB3505

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
 drivers/usb/musb/musb_dsps.c | 30 ++++++++++++++++++++++++++++++=0A=
 1 file changed, 30 insertions(+)=0A=
=0A=
diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c=0A=
index e3935f18dd56..e3dc2b6dc9b0 100644=0A=
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
