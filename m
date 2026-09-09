Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023094.outbound.protection.outlook.com [52.101.72.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCD84F4732
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955593; cv=fail; b=rBSMb+pk252Ga254V1T06axcQFXYACOadk946IEOqutof05DNYn3dhtFkhh0lG8Us//uXCK2kQINoTV01CAUS2W6gEnpWBw2g7Xqbgln9Iga6/rfLJQTCLlG3qKQviU66uladjWqsU4/i4SV6+EzpojaSd/OJlplMV4idP+uIZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955593; c=relaxed/simple;
	bh=XdL0zhWpRnkDIVpRnis0vSIJoZc6lLcODoRoTlam8Jg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CzNCP/t0ryw/PHfqcOmQfOvB9DTk2SInrq8Qoe+0eo2f5+lMOUVH6EWKA3bcu/XXB0vWMUp+6FGmPG9G9X8BwhiOsLDrAkIC+hOmFCqew7uLAaIfwU94be7PjQKEs+T9EOP9R+a7an2n8oRPam4ZwubR1vhBCfNk2/OCoq6/YYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gofore.com; spf=pass smtp.mailfrom=gofore.com; dkim=pass (1024-bit key) header.d=gofore.com header.i=@gofore.com header.b=R2lhgLMy; arc=fail smtp.client-ip=52.101.72.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gofore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gofore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gofore.com header.i=@gofore.com header.b="R2lhgLMy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1YjH59P37AwW23/wtuX5roCE5aS3q8fthvyrj8l2udaByKo8GcDIPhmU+ncj9wE3NyWVEgCiEwSRRv8Vdw+8M9gv0PGXLc1aZGcUrfOGzHZMqJFpkDy9sR134M8bUmenMqasP4xgnxxwF6NP1cuXA3USZ2v+8Y7XH6UDjK4DUMOtB58Ci50EzSv92QA9vwLcfK4r7eZWOE99GbrIVTiVTJzUqvM5mLeAH8BwqF1M6cyS6AYYZmZUnXev36xTgjEaH4cqqbKSmLyoO9vCvs3EixU3vJU4BzV93DAIeMf36+F/8nO2m4y6bLSY84WhTmMvOVH/7OmKSVojqOTjdZ/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wU+PfFlTnucwm3OK+tEBMK7hd0Yt2eMMQBP0A8NCW8=;
 b=KG4819SBTcrQu/Gtm+QdoEJ04waA9X8VAg0dcw8mbSVESVGt3lRBhHz5LFJeGM9Nw6ZfEEeHnLCLLqU3qLPGGhXzmWWmLObcegdpxtTJicxK5V0nFTYuD0e5tB/WvwYGIgTP7YzllWTFColE5MaKDHxkjfXbKKKrIuIA3ngcbXgEMEcF5+DYbsnlH2mtv4NGDTcyec0n1XBiApsozqz3rqEaScCTwuMg5IB7nuJ2G0AqCErpVB/Q4VXnvftWdeOlBvMDb2pdlJv1JaKva0U7yBlpz7cEPfNQyZFJ1zu6kVydIH37n+b+AryTv8aNwdXqOOIc/lBxDvGDX6kcyWx2fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gofore.com; dmarc=pass action=none header.from=gofore.com;
 dkim=pass header.d=gofore.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gofore.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wU+PfFlTnucwm3OK+tEBMK7hd0Yt2eMMQBP0A8NCW8=;
 b=R2lhgLMyYAMq3w+iuA4KiZakD3dQ70JUijMwAoLznUM9PWd4hUsz095g2jDQNExCZf6UTv0syvxDviieruT5W0YN6p/RRdSKzRC3Jcfatpo/vYIjKDoLqPicCdqOxb0QJ18ZhWq+5LGgBVC/8JYWDYXZUZpWMYXMJCUCsQd+hd0=
Received: from GV2PR05MB10593.eurprd05.prod.outlook.com (2603:10a6:150:d6::7)
 by DU4PR05MB12678.eurprd05.prod.outlook.com (2603:10a6:10:639::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 12:06:24 +0000
Received: from GV2PR05MB10593.eurprd05.prod.outlook.com
 ([fe80::ed4c:d85b:4bc3:fd2c]) by GV2PR05MB10593.eurprd05.prod.outlook.com
 ([fe80::ed4c:d85b:4bc3:fd2c%4]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 12:06:24 +0000
From: Markus Mikonsaari <markus.mikonsaari@gofore.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "valentina.manea.m@gmail.com" <valentina.manea.m@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "i@zenithal.me" <i@zenithal.me>
Subject: [PATCH v2] usbip: fix number_of_packets for non-iso transfers
Thread-Topic: [PATCH v2] usbip: fix number_of_packets for non-iso transfers
Thread-Index: AQHdQFOiL9PDJodKokaAmdpCo121mg==
Date: Wed, 9 Sep 2026 12:06:24 +0000
Message-ID:
 <GV2PR05MB1059367FCD72A27E51B29D03E98B02@GV2PR05MB10593.eurprd05.prod.outlook.com>
References:
 <GV2PR05MB10593A82388157FCA3397879898B02@GV2PR05MB10593.eurprd05.prod.outlook.com>
 <2026090926-blunt-lushness-1012@gregkh>
In-Reply-To: <2026090926-blunt-lushness-1012@gregkh>
Accept-Language: en-US, en-FI
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gofore.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR05MB10593:EE_|DU4PR05MB12678:EE_
x-ms-office365-filtering-correlation-id: 125912fd-a00d-43e7-e943-08df0e6ac4c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|3023799007|18002099003|22082099003|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 EnyLtq6/uWznievZWdwXt/+0IK1pB1NaKBhukX846tWdh7sDZEvrGKzlxelNC4kk2bwa8pB8XuRAUkqQsBDIPbbSo1Ia53dv6O3SsvytAn9/Nyl94cOScerBUQp8Y/pK3uKx4J4fAMLVGj05ncAeHQjzjQVu2m7BQrMItMkU4b8LncXvBilzlnrFEjRynDb8dvYLB8VgKAWf7bsmUVIHt7X7UvOG0C0dGsfl+ZW2069OrVDm/eG1sHh8JvKCZwBSTz4JJvovz0f15bqLFz7Yb+vRcMr7UlySd03PAQ0ZuV+ODA8Ie9+ZwHgyNHwFTAiwQoFB3zpwvZ7R80ovkOaO0mX3SnrjcYKDcW9X+Qwv/SnaGIJ+euTBq76rYMusGQAZdd4ZlqN5mPvzgd0oeRe9oVKaQ5VXPISV7V90Ccn/kvWPd5p8nA9dNCF1Bn09/d0SPCJwqGUG54j3aR0X4fIQnKFkqKF3VQBDPo98TRXzqOlgJJlihTjCwDTfFqZZaUO4OCQG02OcqQOvGHNAOEzCPhrf2ocaDZgwBgRYXR5l+G9h4OrPo4lgQgRUN+8izdkb2OiNxWqDRqEQ+ZDjy1XaOyJ+XwjScPrFowH1tjEajSnRcXA+VwjYOxmcvG148j8/xvpk7r8HcK7dH9bgfGoVkcA6VApY5l/lZ6NJ6DE3ofW/iiQnDCWCDIZJqXYLo4UZKA/OoGFNU0s17Yxxki7QRBJzjqaGm+PjhCMZpbyX4gk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR05MB10593.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gkuXO69AWl6VJh3CGNH+j//K1aSPEOgRWQmqd0NYh52qDGX5fTYTg6/yoh?=
 =?iso-8859-1?Q?bYArStKtG5Lar2VWXaObimG31lDi594PmMe9Hs27lJAcsjGN5WKnbbh8kt?=
 =?iso-8859-1?Q?9pByHsxeYfGl0fG5n8g6jLjuHI1qZoziqWRfbrQnxz9cGhF5b76NyKs/Et?=
 =?iso-8859-1?Q?yjZZYDLmTCE1Yqee4+ieK6mwPxhO2mW3iiagAgW8FgiwEnCjONPnSytbLu?=
 =?iso-8859-1?Q?GwOy+h1WUj/fmnbgJRivAbhNPzCufhIXEGPlvvq2Zl2rVviIk4m5UzWzBN?=
 =?iso-8859-1?Q?omXj7pc+MgjlV5CTKfneocwlWl9YDzLrmegyHFFo/qtsAoSIWyOhogMPU6?=
 =?iso-8859-1?Q?anFr+BjkIQkCaGYUQ4TqSHy0d+DI+fd9SdPEyHSt3PqP/rduEHX773ogGf?=
 =?iso-8859-1?Q?q3Ned8IjS5le3ZUZKRTMSvJSkME4hYXT6Itxbg8uIdCtN0VLmEHVtFEZIM?=
 =?iso-8859-1?Q?cQieDsVvfvk7+BKR2THBEd3NjxNZ0mW06Kp/84i6Xu13khvoeDH0AYVhWe?=
 =?iso-8859-1?Q?vgDz1NVAG4wqrlxKHz8UI86YOH2aO6FV6bJ82fivT6rGb2Efu5HmrwVM/Q?=
 =?iso-8859-1?Q?xiBuK7/Ak6qaVzrIAw2Ib1oT6rgvO3N0+gDq7iLcba6FxKyFcpjznXb8TM?=
 =?iso-8859-1?Q?14S/R4ZiQd/T4nGQAlpCsCJ9K3tQ1O+p/jTX1nXMrLBKRWiCS3aULmMn2W?=
 =?iso-8859-1?Q?gx70pqz42VzlLBYnWFomEkA28ZH56LFQdxmPlXt4clsx98Xxd2K40ymljO?=
 =?iso-8859-1?Q?D/fS6PiBcmJrzK6aeCui3a/wu3MTZ62xsER5qX2NYtOLCXyNBlFTaH4lTd?=
 =?iso-8859-1?Q?8fRfzKtf9wuzuS92ty8Yvm0FlrXjDG9Inb/vQoevfHgqpRXeqk3iU5sj91?=
 =?iso-8859-1?Q?Cv5SyJlMMP9LFY9u00PDXYqSN+XXvTW0m/ZgY0ObUfR9mG/SScNEJrWQ3x?=
 =?iso-8859-1?Q?b7kEbmi3cx6SEQq1sVdbGVLigb1qmGpNw7aJOfQaJ20I5ndyEAJpYyD1YS?=
 =?iso-8859-1?Q?UJN79rcrdBCFHqWA0bZlPqK3jik5f2IcAcMEk6M/g7+ieNj2jl5fAJU4pA?=
 =?iso-8859-1?Q?hbH5cbRGFB7pI8srLwOxwwI1E+dGC8kFAZimHGYF5NRawh90jXZERcpN4w?=
 =?iso-8859-1?Q?LDl5OZF4b/Qigh0wtm44FIPTTB9dHE28gn43zaYUFfSndMu3kwEaVQFcFn?=
 =?iso-8859-1?Q?t+5eRoeiLXVTShoMWAg/qmC9CSvqYJxvNag6fKTDGbQQspK+hUC1cGs6oB?=
 =?iso-8859-1?Q?g1/NZR2EmuUN8rVkuzjfLAUhL8sSoLtKZc45n13+8JxlIrWkQNTUfu+cy+?=
 =?iso-8859-1?Q?xTn/84jkfxqfTJFjo+QZ3pYm+LMio7z4s0hJsuQIa4/BWgle3126rpB3oA?=
 =?iso-8859-1?Q?JPqqY24Tve4mX+8ZvYOZsiQyoczJPhGfVgHALhtBdRt7B5ghINZ5jpXuTM?=
 =?iso-8859-1?Q?8iUn47ft/nLuHUG2DcizOH1bVWwZRd2sNUWqHmrU6pM4EtglOR/fapXyGs?=
 =?iso-8859-1?Q?ygo0Sq8FghNO8z1KrxKzD428gjMgKEDoaN8vCVmONfd+Vw2qtzH40CrTuX?=
 =?iso-8859-1?Q?z8g8QZ913mxB/0nDg15enOjAWSxsp8Jrqw4dxp2RtrXbRMw0HgLrLRTGN9?=
 =?iso-8859-1?Q?WCvmLiLwcWwAYNLJ313dvB6pImR1po/7JYWinEcn1zgJXyRIpFjjP38yrs?=
 =?iso-8859-1?Q?n8gstOs2dDvKxK1J1pDu6D8hEVYTfa0UXtJZqJ4bf6po0ds1B50wUID2ND?=
 =?iso-8859-1?Q?SpxggG7y8jhnWFwMIme0QVKMP3mkVD+f2NDEkisGsYPjWvzVc9iIQ+7rog?=
 =?iso-8859-1?Q?ajsG27/Qtg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: gofore.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR05MB10593.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125912fd-a00d-43e7-e943-08df0e6ac4c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 12:06:24.0503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b4e036d-f94b-4209-8f07-6860b3641366
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s0EibD5TujcXHSUy3Wr7vWftr3LHjTwgjFf5kAfXHFuSfWNNNzpZs3svnGuS3v5lKirgekKqY8mWj4hTZmmscEiPqV1ACdWp2mkRCd2dln8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR05MB12678

In the USB/IP protocol, number_of_packets is set to 0xffffffff (-1)=0A=
by sender when the transfer is not isochronous.=0A=
usbip_pack_pdu() copies this value into urb->number_of_packets.=0A=
=0A=
A host controller driver may compute the iso_frame_desc size directly=0A=
from number_of_packets without independently validating it against =0A=
the pipe type which produces an undersized allocation.=0A=
For example on a Raspberry Pi, the dwc_otg driver panics with a =0A=
slab-out-of-bounds write in dwc_otg_hcd_urb_alloc() during a =0A=
USB/IP attach involving a non-isochronous transfer.=0A=
=0A=
Correct the number_of_packets to the value the urb was actually=0A=
allocated for immediately after usbip_pack_pdu() overwrites it.=0A=
=0A=
Assisted-by: LLM=0A=
Signed-off-by: Markus Mikonsaari <markus.mikonsaari@gofore.com>=0A=
---=0A=
v2: =0A=
  - Moved fix and comment into a static helper=0A=
  - Shortened summary=0A=
  - Added Assisted-by tag=0A=
=0A=
 drivers/usb/usbip/stub_rx.c | 16 ++++++++++++++++=0A=
 1 file changed, 16 insertions(+)=0A=
=0A=
diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c=0A=
index 1e9ae578810d..d592fd8edd87 100644=0A=
--- a/drivers/usb/usbip/stub_rx.c=0A=
+++ b/drivers/usb/usbip/stub_rx.c=0A=
@@ -461,6 +461,20 @@ static int stub_recv_xbuff(struct usbip_device *ud, st=
ruct stub_priv *priv)=0A=
 	return ret;=0A=
 }=0A=
 =0A=
+/*=0A=
+ * number_of_packets is set to -1 by the USB/IP sender when the transfer=
=0A=
+ * is not isochronous.=0A=
+ * usbip_pack_pdu() copies this value into urb->number_of_packets.=0A=
+ * Leaving the number_of_packets at -1 can lead to=0A=
+ * downstream consumers of this urb (e.g. host-controller drivers)=0A=
+ * to allocate negative iso_frame_desc storage.=0A=
+ * Set it to what the urb was actually allocated for.=0A=
+ */=0A=
+static inline void stub_fixup_urb_number_of_packets(struct urb *urb, int n=
p)=0A=
+{=0A=
+	urb->number_of_packets =3D np;=0A=
+}=0A=
+=0A=
 static void stub_recv_cmd_submit(struct stub_device *sdev,=0A=
 				 struct usbip_header *pdu)=0A=
 {=0A=
@@ -567,6 +581,7 @@ static void stub_recv_cmd_submit(struct stub_device *sd=
ev,=0A=
 		}=0A=
 =0A=
 		usbip_pack_pdu(pdu, priv->urbs[0], USBIP_CMD_SUBMIT, 0);=0A=
+		stub_fixup_urb_number_of_packets(priv->urbs[0], np);=0A=
 	} else {=0A=
 		for_each_sg(sgl, sg, nents, i) {=0A=
 			priv->urbs[i] =3D usb_alloc_urb(0, GFP_KERNEL);=0A=
@@ -579,6 +594,7 @@ static void stub_recv_cmd_submit(struct stub_device *sd=
ev,=0A=
 			usbip_pack_pdu(pdu, priv->urbs[i], USBIP_CMD_SUBMIT, 0);=0A=
 			priv->urbs[i]->transfer_buffer =3D sg_virt(sg);=0A=
 			priv->urbs[i]->transfer_buffer_length =3D sg->length;=0A=
+			stub_fixup_urb_number_of_packets(priv->urbs[i], 0);=0A=
 		}=0A=
 		priv->sgl =3D sgl;=0A=
 	}=0A=
-- =0A=
2.55.0=0A=
=0A=
