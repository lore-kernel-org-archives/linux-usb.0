Received: from CP3P284CU006.outbound.protection.outlook.com (mail-brazilsouthazon11022092.outbound.protection.outlook.com [40.107.203.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B17400973;
	Thu, 16 Jul 2026 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.203.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210417; cv=fail; b=WX2LYHX1UXSpRuwMTsPthMV/VCeyUX4v0oMBRISsREEqIOOBCxOYltvKC49YhQgmQ4R2JqkuZR0OtKyaVIjztJh/9mWlls0hgEJ12C868kJOh4CVLRbUvz5L8Ohly5HbFcgZE0gQo/wTgXNfBzcrQp2aZiA3vnGbCDMiH/DD3nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210417; c=relaxed/simple;
	bh=sROLPiQ3W2+tbWZpEodM7TL308q/q+1nCKUdKoL/avA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DJ2lb9f2O12LAxeiXJ+ed3HwmIYMpUJ4pcnu2Q8P9qRQPgO5Y0jzIWFNPcpmk3I+cbvnXOB6s9xEBodeR0pqZgxTh1D9Y8Oi5EBZykNhCg34BC4qfJe9rvbJCRwcw1QDPfExKen1fEIB1ccbMjEgUftZm1xBSvjLOmXGaEWUJb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br; spf=pass smtp.mailfrom=lumal21.com.br; dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b=Fo7lo2X8; arc=fail smtp.client-ip=40.107.203.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b="Fo7lo2X8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lG9tEFiEh5s2d6CHobL5vNiEbL569GBu3rCm9YkD3REMgI2YnFA9EWtUjyN0H4tIGYVcXnrf2ms2BZY8An0fmDfBu1/WPeHe4MK9HJoYfyX7zyJLcyfT7kg0dVqNxClOLN+gDZf91EC+zkdyNhdw68dJaRxyvATTjqTqiZqnQVGCDmLWFQOuPo/ens2XG+qJCxPlBDYHiIpyLihGDHWGyxXAsQJL4RzbR5RijVDyG4ePQkKkKe4rbojDyCKUv/T2AFzgzqlK09nSyNgcxsXz2Y7eF43ast0RaI3Xd/kd5ztjkdSqF7UjKbE/fnEpLkbiegMlpI5Hweh4Fpx+emNJ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RENbblpBIH6khdVZKJo9EtJk8FDrovns9rjx0lAhrP0=;
 b=X+BMAB321TFpeS3uM8ygPoQdfY92ZTSZkl8oDKxS7AXJUKw0R52GaJ4oWsy1F9wLdbulCYSsYasMuoTDE4k3R6yrEOHwV5x7FEAmgl8QBHXCRRhj4tl+aSPo+CELvpmiJK3lMC97gwneAlNQ3SN3eCEzTsTOImXL6uQiVRJj1h2Dhv60E0zTymBXNGBQG8+Uicssr7uR/mpHjP78AHq6ENJeJnUUoEZSVAnaLmKGCPdUsZUGsI11d6EnrdqU2js/hKCkNNsfyAEFqqPsQSyc2oqZaFgpFsZo3utRgpWefKt0Nxno/8F5egzNa1sDjnTEo4zq7nRsBwNuTiC6XC2Psg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lumal21.com.br; dmarc=pass action=none
 header.from=lumal21.com.br; dkim=pass header.d=lumal21.com.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lumal21.com.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RENbblpBIH6khdVZKJo9EtJk8FDrovns9rjx0lAhrP0=;
 b=Fo7lo2X80dBX0s5Nm9WOy98ajpuMkxqQ326BZ4oWsXq4djBz3NS6FQm2N/YyFpUMJccSopDDVoU/xoKYo/EAJGQiH5JIH8xncacF+DwJfY6JsiGiQ8JRMyXxFC4Ba2fOlwk6P+783JyKXbChF2UWHEY0jiH5+L/ljZ4r+Ef8X1ixfnJomfj7OtelYwG2S51mjiz0S8aOBMddOVZhArkmBsbdYb5NFYznuWhSF7drcJK0rUk0uckTj/+CUzxpdCzKZtFK7MmMx8qsZKNeeMlkWxy7ZgPc/GPaEqJgh8lmU4CzUF+vWrbVxP636csWrVIPVP59un2R6O3MuSe5Qy9YEw==
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2aa::9)
 by CP9P284MB4054.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:374::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:00:09 +0000
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600]) by CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:00:09 +0000
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
Subject: [PATCH v2 2/2] usb: musb: gadget: fix MUSB_DEVCTL race condition in
 set_vbus
Thread-Topic: [PATCH v2 2/2] usb: musb: gadget: fix MUSB_DEVCTL race condition
 in set_vbus
Thread-Index: AQHdFStpcQHvigBb+U6qWJ+LplhGOw==
Date: Thu, 16 Jul 2026 14:00:09 +0000
Message-ID: <20260716135957.474145-2-lucas.alves@lumal21.com.br>
References: <20260716121922.404506-1-lucas.alves@lumal21.com.br>
 <20260716135957.474145-1-lucas.alves@lumal21.com.br>
In-Reply-To: <20260716135957.474145-1-lucas.alves@lumal21.com.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.53.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lumal21.com.br;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CP4P284MB2402:EE_|CP9P284MB4054:EE_
x-ms-office365-filtering-correlation-id: e0a2ec9f-ab32-4f4f-f916-08dee3428c36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|38070700021|6133799003|5023799004|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 YmC0gbNrvHmuxK+Rl57xcFlQ+ds7c3vs5K0jihJKp++O6nPlIfWdsWVHnMXKpf0VZkHqC1BJ8ul88UxVM3ggQo0y1LRzX6EQMLq3nj0Slx0f1dprkTlzca4np4qJSjmn+3rY4lE6bHpq8q1jSo/pwS0qKzLBMmMxUqkjGlSXJX3Giz/4Lwq6xsj4mdrV7i3z7E46opcUavpdYRx9vWUBrg3Sa39RQv20CvI7za3kQQesc9kg9SMQk/gpZZs2wZd+XPcwE2hHWMa0B3jh9OK50pe6bq6JjTq0GDa78PJDfbrQHRZCcDyO0ix8pvX8IUSo34o+uV3ZOeg3GgAmjrOaxN55+XNdfbFdz4W+6FJRw+uPZ1BZj6ZS4n0q9s8Y3a45UYHl9HW/BisuqdFQdEJgSbHLoQzzWRZLG9b3lwSJ8X9MofdNYShGt4z5q1h/t2oVFkj11EWBQQlXza8XsFJzAmBXPmA0dcj6R9/NuLfsC9c9L+JGgtqTzrtrDY9uyEqFcX0tJyQEaLxfU7VcvcidAfM00WkmfxnW/B568u4c8MfaJRMAHh0RmcOqs2ORq9kLKGThu8E1R3Rq30VZ5JiYndR6A/MfbAbwcLJ8p069sdrUA6/GgzjSzlat979df/q47Ji9d9cMUH6Hqth1ALjoLQfxLz6Lq4p+8gC9AwvTaCGZLe1NXjjWZxy75Jh8Gy7XaNtplcXCxWnUaXn7sWHDGpLh83awJYv0cR1Rqv27a6U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(6133799003)(5023799004)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kJnWQOPWzN9DC2FKHA82acLGyEznZ32hKtyPyJYH7XFMJXXgY1d1iBeUN4?=
 =?iso-8859-1?Q?vtzC5pDYqxz8OtgQ/kAnfbGuwn6oGEP0fBPqlapB+yihhsGBvZzrxYQ49d?=
 =?iso-8859-1?Q?9knIF0ty6g8yBRqU6/5ZMEMaqoSrXa2jZ6oB/AQlX4a5UPdaYC4+BH8cLv?=
 =?iso-8859-1?Q?ddRJl3fpw6bZPCEz3Po8y6r7KmNxosH3rzG/vq9tJNKbM2mR8oqXlN+3pT?=
 =?iso-8859-1?Q?A+juroFNPrNte7zvkHZ7zvXv7vA3TTQNspDKPMHSH9wFiC78KsSTRdqRdQ?=
 =?iso-8859-1?Q?QImohA3mldyp/nFN3Z75lRpAIQYP8LPuEStz7XjSMAXeVi7+szryf3qAvE?=
 =?iso-8859-1?Q?6hdxS3+sJ1WxlAin0s3azCNx0Cibn50U2yCnNsftRJLduaqVpqCJ2jy8hL?=
 =?iso-8859-1?Q?bkxtnEN2LF6lzwyVwxiofO63pTvuA+XXFDKWNFWihoEgNmB0XC6cSOQHWC?=
 =?iso-8859-1?Q?Gq7xAg2TbKkasVkm0oxyGuTPa1FpHa1i9duSH8nf3YqRFejowc7j1WBzjk?=
 =?iso-8859-1?Q?9xDH36pR9in6sg2jg+t+XfRPNxuvLnQb3m5vR+A5qwT64jSzGZCn0X876s?=
 =?iso-8859-1?Q?ERqgMgBSSUITjPZoBBU1rMX83mf3AADerx1wLiVZCNRI9G6kbp/kzehSH9?=
 =?iso-8859-1?Q?YDSCejIWOrl6NYA+U6pdKYVOJD02iylqo+vSEONW3aC7qkeo86TtnwNFy/?=
 =?iso-8859-1?Q?W/5bPsO7HfV/IzbwaCsq9402AOjJbbs4IlV2INjGASJ6m5FpdjhzBBSlmj?=
 =?iso-8859-1?Q?NuMN6qZk6I34d/t99Uhwy9rRRT69/pISANFr+tmHFQlJOW2pg3r4X3BxpW?=
 =?iso-8859-1?Q?HEhMQMHLlQBgxZgzjNc9EDPsUwGsxEctldP2mbbOJV5rai7YFKAkMlE4PH?=
 =?iso-8859-1?Q?W5rsUsxXuaI2hu4z2k5PTWDvOGUmcGf7m+x0oCmnCxbQ6UMmLnNv78LUAw?=
 =?iso-8859-1?Q?L9bcl+r/wga5tu+8J2BNOvSZXivtna54WfCNmpxazwkyr8OmnR+2SDaHFL?=
 =?iso-8859-1?Q?X/OT6TJOnoHQDsWm/O7QV5pSwknv6RdpgMO8+JL1XQMB/fKj6T046XYOkh?=
 =?iso-8859-1?Q?/ONRuojfNYz6myXrT8bOpPT/QUBKtMykk7REPNnboBvGQfApyEFxiYNXZq?=
 =?iso-8859-1?Q?k+Kexme1TP68VARemGELn7roezVtfozcI8b9ZXXyMBKyobRD6loPj6QeU1?=
 =?iso-8859-1?Q?DTD+3sTZ4cFO24pNhZQ6/6UhMUAQ/9sVQYzX/mGQvktQQ3AOzhQ5lLUs30?=
 =?iso-8859-1?Q?YV1IMrDRq580WK3X1LcPKV23a7qt19u93STSJGnwDVWbW1xj4slmF0kzpz?=
 =?iso-8859-1?Q?nNreHyRP31daar0nri2jd+LGaUw1p9pEEDV8+HPde/Dyj078dfa+UJl0Br?=
 =?iso-8859-1?Q?O0wM8qNYksuOgA44T0vURTi1EG29B9s3Us8y4Z8f7GZPN5Y60+6q62fDr/?=
 =?iso-8859-1?Q?FbPFxuYMWrn/3IlAqdOU/BVOMqro0UwCsocfSX1v0rLsYJpBfYJPPx7I3l?=
 =?iso-8859-1?Q?ULPviHRqVs7tG3AsLS0Z5LcnvPCQnUEhGI8+3vDtZSYvknIqd6O9VHvSh7?=
 =?iso-8859-1?Q?Sn25sk0sQOr9qdhhzeeDZpzu6YBHj3lx1JiOmj1ybbL96Wy5EbpxkU7i9V?=
 =?iso-8859-1?Q?nz4HD4e2iuQpK6LHO9G39wOlB3J61hJy6qtakV70pgHNc7S91yj7s5cLCx?=
 =?iso-8859-1?Q?JzWM+rpuHBl3rAMagsVuAGG7gkpqzAMudfuPvzKZQFtFF9xgeS5Ls9AA84?=
 =?iso-8859-1?Q?hUTsSkIR+T/JAPkddTMpux1DO58PMFjcWsrr91dBzvFMVbWZdaU7t0YdCI?=
 =?iso-8859-1?Q?Mq9FT71e2w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a2ec9f-ab32-4f4f-f916-08dee3428c36
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 14:00:09.2912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 99055dd4-6575-473d-944c-c3b1a5a6649e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a2YDAnShvUkNBZ0MEon9WsENPMrUiU6i7FoPcjMvTlnZ2k8y3+BGdJhpQnE66eddN6fUNQZ/N1YdF4hKyFcedTLao+zS40O0SbSvPN2nnHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP9P284MB4054

From: Lucas Martins Alves <lucas.alves@autotrac.com.br>=0A=
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
Signed-off-by: Lucas Martins Alves <lucas.alves@autotrac.com.br>=0A=
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
