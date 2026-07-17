Received: from CP4P284CU005.outbound.protection.outlook.com (mail-brazilsouthazon11021129.outbound.protection.outlook.com [40.107.202.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E019F34EF0E;
	Fri, 17 Jul 2026 11:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.202.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286979; cv=fail; b=nJUcbxi0VoiAKDNZaYgePyUZgZ0QF1gRjCuU7fmX6soji6+IhliIE2lbsQOGzFNMKFbA1uEr1GyyNAme0Z0Xf8U3khFcxs3qPHz5VnoZcCVO9SthNCCh4WmMGC/qdbAuH0jscflsH/mdvtbITPiRc8Mg+MpWLjzMCYzBhFyVSgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286979; c=relaxed/simple;
	bh=xsf8XNI25XV40/cJz+0vi0F0rnRnE/6LW8FvK49ynEg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Y6LqKQLe6qJ/zMzCNFKzc5tc3Ir/EbkfO7LeQnyGs92/LJx7o54LcisuYT/aqX2JKEmkAQ/xVGu+XjLyJkCrRI/kx73RNOBsfve0luZGnmcL2xiu/KrwGMCIyKoet8TAUEXoZshVdgfkrEE1q1AmvEGBFSCQMP6JG2g3Z9zRtto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br; spf=pass smtp.mailfrom=lumal21.com.br; dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b=Nfe3xSRW; arc=fail smtp.client-ip=40.107.202.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b="Nfe3xSRW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFJfhvUKij6wX1FzyDr+fBIfoigZBmIgS6MMO0rNz7R5mkMFkwWMH4zFcyHtANqgWKZh+N6roztVRhWVQGK6J5Gq0KVAxLDMGhCUpbZrMGzgC9jqQcpsywt4ekNfB2MGcW7DbF4mzZiRgENBamrlApEhlJDaod8rRYTV05Wqac9KXTdd3imMP/H6GVjAiYskIAXHAavQqpbpppJS+tg9ToZaxV2h1qKL0uUKP+eiDONl6eYLNUervFnGfhncfKQfMhJiQw/eme6yWh0jmHzHUmhkacTg+BCHkVAQYffWTVSy1/gHT5llsDTjR7PFzOq411qr3wHcxYwvh3PFQ7xUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLzMVHQirfULWwvby+UPn94aftpWRt8r/EntlNY1X3I=;
 b=aTTxAIZsngpTXyF7NVvUgW2leTOaKNfI7UKtG/yEBTzxi9WDUSSEa1duBWLsvZLpYBaNmR/ajmBplDtI0beD4Pq5CX8oegXOrZhK0Hb1dI10Op4F9Bx3pTp+sxbhkgBdxVzV35Sol2JTDXLmb04PN0i8fo7ZYRJa8Jgg8M3/fANezvZArUEgfhoYMpJ4w6o3S6CygAQdBAdJQnKY+E3XJh/y3sYrxy0P20vBeTeq5njY+nQJOM2KmTQ9ayg7S6cwdYUuauUI4Ay9h1p6q0r+3vS5WQQu7LaJ/zXKcv/h6OsjnI0Uy+kkBNvyXVs60N1CoxXAtWq33qD8nfS3mLadrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lumal21.com.br; dmarc=pass action=none
 header.from=lumal21.com.br; dkim=pass header.d=lumal21.com.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lumal21.com.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLzMVHQirfULWwvby+UPn94aftpWRt8r/EntlNY1X3I=;
 b=Nfe3xSRWFIC+c850LwZxSfUXgVbNak/Cah9O9M/XghSe8MjNPmumSxMFkOFL72O/NbQE5dRufJTwm9XQuMwp5/S/dHiJHlly8/UqRG56xt2MYmjDj5hVW4Ay89LwDNf/uMQZUefF3ReAgV+3NO4SuAGg2UaAhXCYrAZh0dVBeGWDQV5lzP5vm9CnGvLoXNnnzMgo7bWag8SFAIdj7IEatUhULElkolFOf7neJzAYlv/ke/EY9TjYOiauBtaBbEDexHh+y2p2KhAGGCPIcc9r7JtKdkZsDwWuK8WF47z18ounuIzZaF7YoypPhXIbMA/pC0Kyx0CoxgyAkjY3+7k4Yg==
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2aa::9)
 by ROAP284MB2516.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:12f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 11:16:02 +0000
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600]) by CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 11:16:02 +0000
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
Subject: [PATCH v5] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Thread-Topic: [PATCH v5] usb: musb: dsps: implement vbus_status and set_vbus
 platform ops
Thread-Index: AQHdFd2muFT56iiGvECUL3jT1LvEsA==
Date: Fri, 17 Jul 2026 11:16:02 +0000
Message-ID: <20260717111547.6946-1-lucas.alves@lumal21.com.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.53.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lumal21.com.br;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CP4P284MB2402:EE_|ROAP284MB2516:EE_
x-ms-office365-filtering-correlation-id: 70b89b81-138f-4a95-2035-08dee3f4c956
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|18002099003|11063799006|56012099006|10067099003;
x-microsoft-antispam-message-info:
 HKYVFGCb2PwgQFsdBt46GPOI3CVlukSsWGqLV4Bia9M3qUur4vp4Qb9+PcXZl41OvdoVPn8rHSiT01PUZK6H1NZD1TOQuAginxM/kw+R/pzFhdD3R+hUPS4HOr8tduJdizzligJ+im6zZs6AwRqh7DyyA65jIZfdB7GsjHcKk1F1H6dm2ZkKNw5EzIqd/qZh0VG1W8DaPp8SrMekfrTcuBiaGRZsqbr2FwpLSdROvE3spt8jerEzUbwu3yvnGpVQpsuRhrO42ygishPo9JJ18PkAnBwbZZ3KI3L2mLiNWgcVfyRtbEL8Gy2v8YKdKbDLWSAsqtngFvWkh1Pa5ZcxgVDALQgo4vcDM3isnsXRx4sAxMYF2djLJG3jtWXuMIXnRN8nufpsr6Qq3sad0zoKyNdNOKJccBpTG4c4Vls1JO8u2OfJp+FtyBgMSELD7c5vfAXEqMy5yE2RxyfWyTOZG7txngyVX/x/pk5WrqQaSoWgAn18V8DEhwgB0lmoobEab2yF9W0ZtGk8/oeDUTbROtqN+M93xQWZyYza29KsIrxD/bciLVlaZGpM+jWZS1or9XBa/wzjI2FWMHp2lbQdplcqg7miHmczLWwYwA5pIERLPc4eU7uNhcbgpeHwT1cTG8ede0rieiZcrIMPo0VvvE0Bqyj6PPVrU8MRdWZf9MzC1JGZH0eAPVU1hSyjDpLU9iTgpQhSJyv4scUXnzB3fMpiyOz0myeg+n1zwh9mJiw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?m42mtcM/8qezj07yCYcaSmJGNnwfPJ0kPqdgKSLCLy9TVg/1cpOkuyv1un?=
 =?iso-8859-1?Q?wFSZD+sj3UE9e2gAhfFdocFkDmQWJWOlivozuJ/43iM8NX2yjiWmJwuE2V?=
 =?iso-8859-1?Q?fcF3eOXDg1TBgCxqq1Pqsk8aD6v7Wp9WbZlMYoDsih8RXN/cefJam+RO3p?=
 =?iso-8859-1?Q?zd3e5yg5vup9VHdqNvirt3egQnBFukUcuJCS8U/aT+oqD+eTKsXbo8BTnz?=
 =?iso-8859-1?Q?rsUosjqMmdDQMt2fnVyrR2Mjdz9wEWTdOO4sSvWMMgCD8lhCfkZgHeINJV?=
 =?iso-8859-1?Q?jgK1RrGyw9kxFKVonIBLG4tG98kvtGp5Us3/AbYUBr5OSKk0NqkPgPkA6D?=
 =?iso-8859-1?Q?2a37HxHkzjQ756ivA9gj7UkZ0mfW4fPNgubTUeeZLdM/PEsR3QF4CKLPmD?=
 =?iso-8859-1?Q?6c4e4olM6L+jQVbp5WSBz6bJflznnVFG6tcA937a6RfPBwCZykW4LuGIfT?=
 =?iso-8859-1?Q?Y4MVNnsx/zrtmYAxeoufLQzYDNw2S0D1r6QN2yUHNSEweGIykoGC1pVcgB?=
 =?iso-8859-1?Q?CG1eFnNmP8CX9w+FnXJ257gY2GnJVhqUTlpQrL510Cw3N3nuL/iPxRxVjQ?=
 =?iso-8859-1?Q?+zBXE4NLtqhysod3WCRWsvobj/JcyDp68Er5tUTnDi5n0vGNLlBkyg9e/+?=
 =?iso-8859-1?Q?QREp74D7RtelCbSvFZyPALIfrT3hEW20n57W8kVMXuPcmGsudNfMgIH3Tt?=
 =?iso-8859-1?Q?EJp4pZDxTFaQBShZpGfhuTMpwzoe7L5DGVF6H7aWMzX3OeqD8/WdUJuDb+?=
 =?iso-8859-1?Q?uEQ/Kr9ZQD9+fw6de92BnQvNRk9cHmHu6UIvALNXTI9A3zkUbeVB6ACYBW?=
 =?iso-8859-1?Q?4JppAs2LaP+CZsaDWkEymmpNgJZPEV7QPC6i5rKG2Bc+tPa1YV+1TG/Xqj?=
 =?iso-8859-1?Q?rmaFihNFjI7UGimaT6GfFTVkRb256/hrQbIK82+V/vZ12kynD8N4ecQwtY?=
 =?iso-8859-1?Q?Fo5k8S6Mjg/V65r5u5YKhS6jbKMi49RooCObOQCHk6Z/px+Yap7/XGOXsL?=
 =?iso-8859-1?Q?xFkx+wD1JiwggZtTA/Jw2Ens9SfENrg1JLNunG7G0YkrGwp5ICi3hPCq3v?=
 =?iso-8859-1?Q?r1hBH5aGcDY1deyOIVPwxFVtFPGYSbse8h4fNv+9vMHHXBr2b1Sb74/RXo?=
 =?iso-8859-1?Q?w4Umwp0TrJyuvxAFF2SI8DdkYYro0ZjU4/fGgNE7jYHeT5bxK/3/CRPSlI?=
 =?iso-8859-1?Q?GM2k3EO+XOxBngUjwFgQXy95dIS7/uHPwhblF8pc0o6q7ANYA5uJJXIAyQ?=
 =?iso-8859-1?Q?BsoMHhHCSibC2Lv3eRTQQRya9U+GbwZeAW/RQEQVQoS7eGSgxkstdGJVnc?=
 =?iso-8859-1?Q?pXShyE3mQj2469c6U5P1jItJSEc4xy6a+xxV4Y3hBjbvpHWrWsDKZ4OqHT?=
 =?iso-8859-1?Q?Z4Vl7qRk4Y4VQXDeC/mfuBJe9/fdMFFgKrUse04Xn5/U+cP6nICewuFyuO?=
 =?iso-8859-1?Q?6f1JvdS4l75tojJATUC11VQFmeltJ5B/GyNu6gTlIOX9oJk7X1E9VAotYO?=
 =?iso-8859-1?Q?8EQICJfkd3AHxZyFLKxdmOlrIf5nLYS22lm9IExJHBLKYBxaC1UCovz/Yj?=
 =?iso-8859-1?Q?MjZz/74PIqIRFSEKOsD4289JDjgrr/bINSBRuGauwtsqp9AJuCo6w8zdI8?=
 =?iso-8859-1?Q?DyJvf9+OPslh3AMIDHPAHgYY3ZLHgx73dGyRWMWPSYqmw/Td4BFAK1yThh?=
 =?iso-8859-1?Q?ZBbTy61/BKpDwp7TdnK1TC4aQk8agJzzwh50ZKk/C6xz8lUzuSgtfYeryF?=
 =?iso-8859-1?Q?l3lMJ2fTGw7fuepv7mjxTXLyUmPCqtIRj55p7u2kEMZugrs/EUIlEB+ZmI?=
 =?iso-8859-1?Q?W1ml5uuG7w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b89b81-138f-4a95-2035-08dee3f4c956
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 11:16:02.2381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 99055dd4-6575-473d-944c-c3b1a5a6649e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VUSQT4hMbm7hMcQoHHEDmB3rr8/0Oq3caskhRJFfNg6/e84b9SCqQBrj2GUTZYKZVRoeTo3651yPyuUKSQFXXNTvlq5jD1W65Y8mXuUSLYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ROAP284MB2516

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
