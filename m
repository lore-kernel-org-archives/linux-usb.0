Received: from CP4P284CU005.outbound.protection.outlook.com (mail-brazilsouthazon11021084.outbound.protection.outlook.com [40.107.202.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C058429CDD;
	Thu, 16 Jul 2026 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.202.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211950; cv=fail; b=E6HzzZPYTfstZHqd6iInIEF8W4RLZzRxaATxuen8L7Dm12D0iEi/zGs6vg4Kdju8CteFNrAmteE/+8Ur9XThbjeqltSzFtZqOh3tQAM5wviT1t0XWlJFBlAGSQNEC4yZRc94EMVBSEcdfSffprPvB1Es9+V2DWI74b3X5bimKOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211950; c=relaxed/simple;
	bh=924Qlfet6g9D28tNT37XBjRHg3hmJ6rzcYsTGTpm6Hc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UmjJ/akjGMdth0o/jw5tnfNBaoB7Tu0L1eLTb75Hj6HPjNmv/SlzMZp5V4//aXdqqpItRDvWIwg8QNbZ8jxqQSyjTAW6aAtGqNzB53Lch8u8D0Tc6Es6u1C+i/xqQRyvbefZ2KUtOgPJXAOOLowVyX51bgdhvOhMw7VtSx8WwrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br; spf=pass smtp.mailfrom=lumal21.com.br; dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b=aX6G2DyL; arc=fail smtp.client-ip=40.107.202.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b="aX6G2DyL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCUTdboZ3fk5H69Vrf5GEwWiWJqlqoU/0+5xMM48e8bvFoFzBWzz915DungEUDzpDXjsKoKaq30JJMmw4RtOhvVzIViv4lRrWxPvlTu++U2eSZlwxdeYJLE07lfhxltlvbeKtoNuiTWet7sTnc/ZMPN3HusCC7eIGK0HdaWJZpDKU+ykIAm4/o3yY0VwX9BWKBr0fhCGJ5EoaYUEjKRGE6nsrg0o2iCCQ4/4P3i0OA5W+FnTwA3yl6e3AZq9SkeTC74Uvlmac4bAhB4P3DiRBqEClfhLDruT7MKVYZ6BkQV1jlnHZ5Glbut/niQSBqx/enpph+RjkEA30l1KkXaxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FxOBYFj3OnNc6bxdxgKq47pgjan4bvyr6d1Pywaafc=;
 b=pZHcHfV/tf1PDYgK8A5+sJ+arjv7Qm3jJcGhqF6V7EnMpBqnc6M0AswKD76YlhZBnZAx6JCHVXQE5alyP1+MGgGmuhVX5GHqzHSBgGhE0WybatPO/sJ2IwUJKLRa+BJGlu0Ab3IGvPF9Q04DjtgJ9krbiPG5uuO7Y3hxIhrX1IkQBPUFYNQ5IXebIp1skE8C2eQcOT79rVCH33CBGYvyFqN/zmqyAvVUqnMIVtqTNpNiJCoA1H9FY223wNpyBwGJLRc1+3OJqe14M7Y/kJqAm5BGanITSlRS/P43WF7vXLo9bU5+P1PEzjWzHApxfTGNNue2Tbmo6f06E0jdT3M45Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lumal21.com.br; dmarc=pass action=none
 header.from=lumal21.com.br; dkim=pass header.d=lumal21.com.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lumal21.com.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FxOBYFj3OnNc6bxdxgKq47pgjan4bvyr6d1Pywaafc=;
 b=aX6G2DyLmDDBBInXMMlEKS0RD6J8VDZ0mwkStgUYvcjMr1RSxiwwLb9rzeiVk56SbYodwrR95+qVM63oHFH5GSAZ5lcQqrUO68Yj2NeXixJyhSY6fO8bZxwB1iQvbQ1cDlTUbF0XJT8PxMnfcq4vQsiICt8k4iVtbndXFIbS4Ge6h3xnCvOqPPppl8pa7dmTZ0qsRzFCUPag6LyO2pgaIC4MB/Om6/1DE76opz2FVAeEjfKArTH4do8/YXCRgqS2H8aYmu8YoME3JsVveEazZ2s7kxKIXtPediLj/x4jxXXWaQpba5XoKYOW1UmcoYkaOgpT40/JLijD2QurLY7mcw==
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2aa::9)
 by RI1P284MB3505.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:15f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:25:46 +0000
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600]) by CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:25:46 +0000
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
Subject: [PATCH v3 2/2] usb: musb: gadget: fix MUSB_DEVCTL race condition in
 set_vbus
Thread-Topic: [PATCH v3 2/2] usb: musb: gadget: fix MUSB_DEVCTL race condition
 in set_vbus
Thread-Index: AQHdFS79MU08ZO7Ank6oJgFHIOVwfg==
Date: Thu, 16 Jul 2026 14:25:45 +0000
Message-ID: <20260716142516.510574-2-lucas.alves@lumal21.com.br>
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
x-ms-traffictypediagnostic: CP4P284MB2402:EE_|RI1P284MB3505:EE_
x-ms-office365-filtering-correlation-id: a76ebac9-a63f-4e95-ea5a-08dee3462038
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|6133799003|5023799004|11063799006|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 f7NAIpVpzg7F6TzyKmbCU4pRqWnCJ1H+M/9h1xT5dWrsm9tY/dF/blAoeECA8xIUWQMFk3x2FHro5ioqQUEbI7naW5wVAeqcj7mnLaLW9pVqV4bQlZ/jPuuKSfsiJQd5q6LT+UJJ7EylrzNTyRq13k/xkv3gfrxCAqV865ggdlGub4oGTQ3DZOEnJvb9k1/idVvk9qwILww6kboxNUVSTu1SxlbtaQF5dr7BfOgR7CL/8OeUmGYBpXWVa4OepyxZK8dh/E4ILG12GSgTD3ahNuhDVxYeEUQ96B4z3LN89INNWw3Rn+fknv4GurXHJqsUiQutue9PTHBS8vmuHhKjEYCW6yNvp7MISur2vSXOvdW+9/PEvgK0Pyj61smKndD1/Srvzv5RqYeFgu0gYAG00mZCzXnGZsdwvIirTaBhFNp97GDk0piR12ymaVHmKtBGhV1OINr1IYF7ptXfl7xf/GiDipQVv+VftUxB5ji4onEr0RL95jkWouxmnBCPgHn5Ayhzk8Iv4l5k729UMK87UDPdprrYWPAQnsFaDmHnqxq0k3AtGX/C1yawZKF3VK2PWkPbRIWxp3xhqOsZDN8Y3ALt3NNL20C41p2ostXad2RCuGY96m6z6ku17+5vpPiXqStsJ3bo/PgVUIu4/PNc2rSt7hOaBdZqEvl0ITseEKSt29mwKn7Gx/+uCgY/pAWNno4zvBjRelAaFFqjrPFQclD8nvjPRyM85CES1pfiICU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(6133799003)(5023799004)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9/wPJztelbXbwpBNAtUGZqg/iJbBpgZWt1d9cSnVJ6m+ATiJd6Y/ZPZJcH?=
 =?iso-8859-1?Q?HhbTf4G8HE1O8c5iNFCWw9e7DIxylvuGgzNTAJ2sWllftS866oW7Bw7X1q?=
 =?iso-8859-1?Q?Lp+P+O6TWQYp9iiIO4bgAHv/qfIFwP61FpKOBzWkdPFTRXt0QprgrkZV0i?=
 =?iso-8859-1?Q?tkOHduT7AcmxsxEgtyEUKcfAA8f3khIVGcORSwzm3C6ax8Dne3p6bEQkYv?=
 =?iso-8859-1?Q?3TUVN6alfaBnct5Jf+o2fyqbmd/Q8Bzo5haH5uQkkg24QJ9fMwoqXOGC1U?=
 =?iso-8859-1?Q?O9sARchBX/yDBPLy4EvL3m4v/DklRU53m84XgHEZD5+RezvSWYOgOlyceM?=
 =?iso-8859-1?Q?dskjObkGbJP5WFKqTOlfFn0cpJ4V7rD1TBJcOKpvWc9kIMATpBdW9tlWL0?=
 =?iso-8859-1?Q?YMcyEgAQ2LSb7YpGf9KkhrakGRceZK+JWdqNgF22Nqil6jo/17CCQ0IdEs?=
 =?iso-8859-1?Q?X9kXijdsNHtdpwVDxfVOVjKUf7oKPalS9nmbINtMOH8pC2uGzW0aUQwBje?=
 =?iso-8859-1?Q?VYO1USubYnoWQMxsoPvddp4jJY/uy0nmT+sIp+mMDAfpKOkukxvZaGEYNf?=
 =?iso-8859-1?Q?fIdJ7YKPdRBEBXQUsKCC36FDnO3Ir1znre2eUVJW2MLCXjlZkN8qYPBEM0?=
 =?iso-8859-1?Q?jdqJi7nvaakKfQTJ7hrG+EeyaERti/V4KI0rC1yyfhykkbgo8d0DOKtGdv?=
 =?iso-8859-1?Q?l3cEJuEJaP+O9cneICFXhrxEGs0ZPNmhtePiP2h760BCM/MnNztcVjHH5C?=
 =?iso-8859-1?Q?QrWV1DJFK4e7f7teKQP51PMHITwU6MKEqLf7RZCa3jVobcS5c0znMDOsUi?=
 =?iso-8859-1?Q?GE+Lgss7nQcPVRkIKfe8SRCgnnNyxTvi0ykELzJG+j2htR6l2BrfF/S71H?=
 =?iso-8859-1?Q?L7UuVAAvT0uQ3bEePPnM6nRewSsWK/MF5nYwtZCwrE7V9PIoQpowkwncMa?=
 =?iso-8859-1?Q?sT4T6JHSw9pbbCOp+xM5hgemQcZkWUsCJH3FrGBy9WBKpJno+BfBd8joFE?=
 =?iso-8859-1?Q?1/f2JiUggtasqGK1apbWhA00um7MalEaFS0MuDcnUN4+RzGFA/9PmTpx7L?=
 =?iso-8859-1?Q?ehviBuzdGzWX5wv+x3o7TAx0CT6UQLemw5gRTBNZtoLamDR8RCzU4xeZCI?=
 =?iso-8859-1?Q?5gg39PM/l9Jujh0XyziM96nKza9B6MfI2doxPG32gAS0+2BDfc8ZfaO+R4?=
 =?iso-8859-1?Q?rfl5D9bSqKhtLbB+lWFL2yOwjf55xn78JaL644iTIqv0wzYuVbtgRrVqem?=
 =?iso-8859-1?Q?9QAloh186xJrYOB9LhrWC6zJBW6uFHA3vKql9LyocB00OdGE7ZVzQ5cOo+?=
 =?iso-8859-1?Q?CrWSdjwXOKOUke+jcJtIXbXhN1mAJ4GaRz13mxA82gJL9Je8Y8hHdI5xDy?=
 =?iso-8859-1?Q?tVfOIrtF7ipC1W6Tk9aIttoFg3rloM/rObpM7+C4Rmo0d7t06Kr+e0eiTu?=
 =?iso-8859-1?Q?nn5A97rhKXJa2yoWvsicZDg44Ee2kkIAP8YWn106UBu1kTb5fE42zoa4xC?=
 =?iso-8859-1?Q?gjhwSNtbtBEHOpOZ+6Yyj2DaPljBCbJRoN/gaXOfbcREMz7zP9eyjrTO3w?=
 =?iso-8859-1?Q?xUiTid/3bdNHp1BlwgZcWnSPoMdazGFUqwQzUDdvp+NyiImxHoXgtVEhI5?=
 =?iso-8859-1?Q?dQ2ga4eK3mvW7O8B7Mpg2WL7YgQh/YN3pseainXPaTIQAD6fdoW6I3AEDJ?=
 =?iso-8859-1?Q?i3R0m2cmk1EZwyJRg87+1LaiuCULjPQhR4wpTCUog3rqLftD+se3ABf0te?=
 =?iso-8859-1?Q?TKRaCLPlRCrRYOPXEU7Gpq1qNx2iHpsvdGkfSpv5G9IyF2XiGB98yC8WBd?=
 =?iso-8859-1?Q?tiz9VtIBxA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a76ebac9-a63f-4e95-ea5a-08dee3462038
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 14:25:46.0408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 99055dd4-6575-473d-944c-c3b1a5a6649e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NVYhv+O+xaGOlUIOyc8LDQZWHRKNQASSzFlW28HBNdyaGVEDwqjT4gqnlmNGFjoa6nnxmFUdbdLKgZUiMQxSf+XfJD7eZnvNsLKvZX0DudY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: RI1P284MB3505

From: Lucas Martins Alves <lucas.alves@lumal21.com.br>=0A=
=0A=
During gadget initialization, musb_gadget_start() releases musb->lock,=0A=
enables interrupts via musb_start(), and then invokes=0A=
musb_platform_set_vbus(musb, 1) in a lockless context.=0A=
=0A=
If musb_interrupt() fires concurrently, it will take musb->lock and=0A=
modify MUSB_DEVCTL. Those changes could be silently overwritten when=0A=
the callback writes back the stale cached devctl value, causing state=0A=
corruption due to the unlocked read-modify-write race condition.=0A=
=0A=
Fix this by acquiring musb->lock before calling musb_platform_set_vbus()=0A=
in musb_gadget_start(). This ensures the register operation is atomic=0A=
with respect to concurrent interrupt handlers, preventing the RMW race=0A=
condition while avoiding deadlock scenarios where this function is called=
=0A=
from interrupt context (which already holds the lock).=0A=
=0A=
Signed-off-by: Lucas Martins Alves <lucas.alves@lumal21.com.br>=0A=
---=0A=
v2 -> v3=0A=
- No changes=0A=
---=0A=
 drivers/usb/musb/musb_gadget.c | 5 ++++-=0A=
 1 file changed, 4 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.=
c=0A=
index 016d3f3fc1e0..8eca252423e9 100644=0A=
--- a/drivers/usb/musb/musb_gadget.c=0A=
+++ b/drivers/usb/musb/musb_gadget.c=0A=
@@ -1857,8 +1857,11 @@ static int musb_gadget_start(struct usb_gadget *g,=
=0A=
 	 * handles power budgeting ... this way also=0A=
 	 * ensures HdrcStart is indirectly called.=0A=
 	 */=0A=
-	if (musb->xceiv && musb->xceiv->last_event =3D=3D USB_EVENT_ID)=0A=
+	if (musb->xceiv && musb->xceiv->last_event =3D=3D USB_EVENT_ID) {=0A=
+		spin_lock_irqsave(&musb->lock, flags);=0A=
 		musb_platform_set_vbus(musb, 1);=0A=
+		spin_unlock_irqrestore(&musb->lock, flags);=0A=
+	}=0A=
 =0A=
 	pm_runtime_put_autosuspend(musb->controller);=0A=
 =0A=
-- =0A=
2.53.0=0A=
=0A=
