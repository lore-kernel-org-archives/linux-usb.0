Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022085.outbound.protection.outlook.com [52.101.66.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C3A488D92
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 08:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941393; cv=fail; b=FHJqIERghUhydOeIWPmpSXune5RejJYxQCJ3koER7w5+MbD7/LPcQR4KtHyEZ+KSKBXOvUNandgUK+EVG5JdGWcxYwNFFfaaoA6MZdp0hDtQPiR+auiMjsz2nxzUWNCqhDlmFJnlBggzT5/V25q6KESIrJcWhDFjcv8X66d6azw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941393; c=relaxed/simple;
	bh=srO4sIaiQuPCwGDkGvs7Z/5cpyVBgWufpiTuE/iXvb8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EFhZkX164tTYHf8tBJSGCNM+uQMNHQ1tkzbFZvS6mjM1XCCIOAYKkFfoRkgg5X61YYwjF2t3bjDnGrllK1RRVMsbM0UaYq7EPUK6EwTMVrDvt1fMXJkVavAtZzKZaqUkzNj8Ij+/HD/+N9ky0v/S56KCkmK8FCrkJxupQ5yu5f8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gofore.com; spf=pass smtp.mailfrom=gofore.com; dkim=pass (1024-bit key) header.d=gofore.com header.i=@gofore.com header.b=FpXT+rIF; arc=fail smtp.client-ip=52.101.66.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gofore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gofore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gofore.com header.i=@gofore.com header.b="FpXT+rIF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DP3ARG0fnsfCxwEs0W0XRSoa1le54ydEXZbKgc1rHhyHqpUpGMjhbCvUN+Y8ZNkcO6WDS967r+PVAPGoiaLXmSnOU4/SOMsb3hwSbVJpy1Og6IIL9MWN5qkq2+VLOdlXhQq7zhQTv0pKk6L1EKycSPvksV8NyqgJmNmjaj/osMVvBh2RelkoNmHIh3xwlAnn9HRoiKCUIefnaWFPIzsCNXcey0vUI+peGhl4hun7MUdmUTpCEDYBWZkf/LOoGoTx43fQV/xR7xj/W3yok16ycTJzybEei/Jv/ddiEUtrxLXb/UqCOaC9IgTg1vsq1lgjwj6vVIhjkduypUt4RxdM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAdNAEXug7uwnQY7rOUtxmtcAywzwj9GQ2Ze/D4IBQY=;
 b=WpAwRWj6NLgXhuQvChEUlVeXYGlUCrPHUBHk1kK1bh5MpTEtiUNZxmtJsXkcU1mdxN1w41Yh9qm1uA3T8SgHIMcmR2n/dlq4isO7Z9/6onsGRrNY8iLLvNp6xzGkdsuK3jxaxp1YlZR9nt/NacY/HWq6hTr3AuuMfHAcf1d5cBw4dQI7IxaWk2O1l4MudeTKJRdE94MKSEyTcbsIxFfFmBuwo6BSDzDM4K1g4I2Ih5/RIngIP3H+vqyMvJ7vhbLB3Y2q+v/F9E9rXCC4MgbpsIhLAG+C1w7zrxxWhen7gTnig+rz3X+APlDNllebhOv+/ky/tOGSWpnGAP1esBcWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gofore.com; dmarc=pass action=none header.from=gofore.com;
 dkim=pass header.d=gofore.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gofore.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAdNAEXug7uwnQY7rOUtxmtcAywzwj9GQ2Ze/D4IBQY=;
 b=FpXT+rIFf5+lEnsMwdQefVjziXgFxZl7E+ZEmlua5rxYlp1Ia8NBwToMSJg0pPg64OYI++qTbqhXi1aZ1p2pXMMhAIOp2IWGnOBu26dXDGBRduce+8YCmaFcPAWm2tEH68I9l19Le6yaCCxOuyAS5On90FC44lrl7LDwWZlyVtE=
Received: from GV2PR05MB10593.eurprd05.prod.outlook.com (2603:10a6:150:d6::7)
 by AM0PR05MB12120.eurprd05.prod.outlook.com (2603:10a6:20b:701::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 08:09:48 +0000
Received: from GV2PR05MB10593.eurprd05.prod.outlook.com
 ([fe80::ed4c:d85b:4bc3:fd2c]) by GV2PR05MB10593.eurprd05.prod.outlook.com
 ([fe80::ed4c:d85b:4bc3:fd2c%4]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 08:09:48 +0000
From: Markus Mikonsaari <markus.mikonsaari@gofore.com>
To: "valentina.manea.m@gmail.com" <valentina.manea.m@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "i@zenithal.me"
	<i@zenithal.me>
Subject: [PATCH] usbip: fix number_of_packets corruption for non-isochronous
  transfers
Thread-Topic: [PATCH] usbip: fix number_of_packets corruption for
 non-isochronous  transfers
Thread-Index: AQHdQDCvAnmVXBrYVUuyVg3MByeMDA==
Date: Wed, 9 Sep 2026 08:09:48 +0000
Message-ID:
 <GV2PR05MB10593A82388157FCA3397879898B02@GV2PR05MB10593.eurprd05.prod.outlook.com>
Accept-Language: en-US, en-FI
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gofore.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR05MB10593:EE_|AM0PR05MB12120:EE_
x-ms-office365-filtering-correlation-id: c12a3a39-25ad-4eba-be63-08df0e49b796
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|3023799007|10067099003|56012099006|18002099003;
x-microsoft-antispam-message-info:
 g9E74Ls+NmNzvoFfaTxdPAuqCBfHCdkIUnNRPyPj4fYcSz7S+WJ/6DvmYiOMbWjM8N2huJhiYcq5HElv47eQkszcMTdMNLaPxXNnBezNa3f0flxGwFM3ZBhnt139mvORjkpc8VW40wz94GkBr/894tGuzO4YsgC9P09s+/qi+PlLUMFKyCQZcgScF3HLVxeDkL+A1TXMgl9a3my6qASs/07j/VuSEPl01tzfGmy9ZM1TJa1OS3125tVeH3VRqVnxuegz4Sa5ejaceNfy0DQfd1Bs7X+/97UcIeIRYhrzJ/OIBiTPc+bt1LnvYNuVPEMhKfmdadRj0HVYvrSg+5kuWrevasImPjAoQnt3GPfd5vC1HREObY+AAOrfCf0BNSES4ak4wTTwsaTQ3IY+EEIGniS6jHtNa22DecyBl0bNpL2MK0oKMsHjC0KDK1OUI9Ack3vK82u0CHwUYVZutMoSpGG0pSQwPPA//MB6ZV+4KxdgbhmLDsFoEDCL8Yjuf8EfpTpkmz99YsOAiMLRIbV2c4DtYMO15J3Eq9ZUaV+8I3r9smg68y6Sc3mLa2hLhDrlt19syTTlsX/lSod0B2I18m2DNmwHpQhYEoRlw+qNDq+UmdztCrsvtkAxlOsZz3yibmRNO23nUcNLN6VFkJ2PFe0IpLWWe9KcRhbKTCRVOF6X9yKv8t5Rm4BGf8Bbh28Rn57kw151Be3v29rev7DdI2b9BSAvJasD/RCdFme6zjo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR05MB10593.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(3023799007)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cQKoUbAQUR8s4fd8tsvYaQQ9u8h7UCKd1T4V4NOm4/2Jt4J0UJworUlwac?=
 =?iso-8859-1?Q?NOUQYg3YsyIC7G1BEmDjfw2cOp9T6t9mXjSaSS41fmUoXIx5dnzJe/lpmO?=
 =?iso-8859-1?Q?2C7AvRmIiDT2Lh8cOJk3lRdB6r4e6YfBGM7qg0Soo0KUgQNZNNzb9sf7In?=
 =?iso-8859-1?Q?BrS5uUyiA6quaa7GWiR5GbG/d8Zk1s2hv8MhpjCEU1jzVC14EJhAn4Nu79?=
 =?iso-8859-1?Q?aYC7OoPZaUekq9p0dGjbk7a5Fcq81PvW/DWKSJPBXKbuODkXJSiDxXaEc6?=
 =?iso-8859-1?Q?xy67RVmXD+6tXe1JUy4LX8ihPkAx1/zVU+KWWnvLYh1J+Ax+e7QsLQoYpa?=
 =?iso-8859-1?Q?0t/RiNyQFkaGUpJYUrYLfKYU3upHTqyja9TV7xM0DvOwCp1GquCU2JiWvr?=
 =?iso-8859-1?Q?tFFevp/KCLEoNqUam0TcB4NRA4a9132sBo2F98r/LVocKwm8TIRIlrHTYk?=
 =?iso-8859-1?Q?9iRkiqVTfGrRnEnQ/98mIjlCiaaZ2zHc9Ru9yIaBZSW9toYnJCVmsNrEMv?=
 =?iso-8859-1?Q?I2s561NVYqVFzlYV39frRyGwvCTLFq53xkeNML5Dup+vAU70lWOK7AX1em?=
 =?iso-8859-1?Q?5rcDl2M+a4YKtGpCBdOQe3HpiPYdRJW9MN6G3koRe8KWi7LIvIhncG4FNb?=
 =?iso-8859-1?Q?2sm/vC8zda2U5PwgIdJtWubSxzKu8V4PbrzN2sHT+4n9VJCEvsf7wVgZS1?=
 =?iso-8859-1?Q?SS8KLY7fYi/eC9SyEW/G2YOVulJlGbmhNnGJMcis/qaqY3KoL+h6T9KQ+I?=
 =?iso-8859-1?Q?7dXZWBCqMIkY7xYqSAFsKHP9PnLjGSfoJxPm1qHC+/BuQDz4Olb3CxsxW9?=
 =?iso-8859-1?Q?26L7nvSfNK08Hw5HfBbkTJoiiu4TOYti4wzsCDAHpS1Pe9/2aUaNQ0uCJS?=
 =?iso-8859-1?Q?FV36W18DqUc8O5NLNrMAfYvFV6ERvzGGexiF9/hONio6l98EsoNXTnuYdu?=
 =?iso-8859-1?Q?qyINAPSjW6J8anA6h2cvaQlQJqLiEaMr5agW4WlGb8yxWmcuw39gMYJH9Y?=
 =?iso-8859-1?Q?hR7k8C/UhA4mqZLfMfzqe++bFMgZF+sklTp8yvDHEO8d6nJ8n6xHvO8pxA?=
 =?iso-8859-1?Q?PcwhYQKLHQBdhgO9rQt7xs0bVrvvQsPO9ME/OE4/DdHLPsp1kNbd7XVniJ?=
 =?iso-8859-1?Q?ql4qi1rAIhIo0kTqIlM/VO6JNRx5L648My6BPEo/VAhUvAtsHQOfffMRA4?=
 =?iso-8859-1?Q?kxRUeMSE800owZJdFrKPJ1zIDb16Jn3dZ7a5sD+QNlT353B+gcP1aHrDsg?=
 =?iso-8859-1?Q?Q2zF4CXDiWR/ykRTAWCRoSsr05bicd665XOHfpmRpsZrJCayOb6BHyK2db?=
 =?iso-8859-1?Q?JfxxRCvokpnN99sUDP1B4Y0IN8F3o4Gb2OFjDkBz4QT2nD3/1q/bNmlzAh?=
 =?iso-8859-1?Q?1XC7sccFpumySjLe2K+gLfVgU1z4cCN8v15eYqBUYPq9MfvHxZmSuzDjgt?=
 =?iso-8859-1?Q?IgCcIkWR6vcj0LcUn0Ir2BY/g4m2qoCXQStjB8MkePaJRj2nh6lurSLJwD?=
 =?iso-8859-1?Q?GjIIhi06WInTSpohXnvOKJ/m1HBHiLz2D8Db8/ULkjXdeO6t+K06fkSCy1?=
 =?iso-8859-1?Q?5vuJhiq1e8U6CwV52QjosZYnMGG25/yeCAvnVBHD7WEasfxSqFEm/9tIaC?=
 =?iso-8859-1?Q?YRHGOBXqN+HT85eRfjKDlw+uqrPLOGWI44VEDDF8n4oMr36Zk+WvvSRSe3?=
 =?iso-8859-1?Q?oVU7ydxkwvVcrTT22UsGdAbxYuFQvklQE1sYZ1wmgQ/f9Xq+FO/QQX45qQ?=
 =?iso-8859-1?Q?zjsdktHwXF7PkhIg6n9HG1H5zwgHOuY7KCQ4+LSI6TFJam9wooWdzdlILN?=
 =?iso-8859-1?Q?tO/yzOh4QQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c12a3a39-25ad-4eba-be63-08df0e49b796
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 08:09:48.4861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b4e036d-f94b-4209-8f07-6860b3641366
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1emulCNMY9GbbVkFafRtOBFC1X6XhVPHBT55wOJvksrnDfatnO4hbGsi3M3Fc1Tc7Tfjz+R851bKVl53CWb5BbGsQ7ESfV8z56WrSjArlik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB12120

In the USB/IP protocol, number_of_packets is set to 0xffffffff (-1)=0A=
by sender when the transfer is not isochronous.=0A=
usbip_pack_pdu() copies this wire value into urb->number_of_packets=0A=
unconditionally.=0A=
=0A=
A host controller driver may compute the iso_frame_desc memory requirements=
=0A=
directly from number_of_packets without independently validating it=0A=
against the pipe type which produces an undersized allocation.=0A=
On dwc_otg, this manifests as a slab-out-of-bounds write in=0A=
dwc_otg_hcd_urb_alloc() during a USB/IP attach involving a non-isochronous=
=0A=
transfer.=0A=
=0A=
Correct the number_of_packets to the value the urb was actually=0A=
allocated for immediately after usbip_pack_pdu() overwrites it.=0A=
=0A=
Signed-off-by: Markus Mikonsaari <markus.mikonsaari@gofore.com>=0A=
---=0A=
 drivers/usb/usbip/stub_rx.c | 13 +++++++++++++=0A=
 1 file changed, 13 insertions(+)=0A=
=0A=
diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c=0A=
index 1e9ae578810d..baf511024da2 100644=0A=
--- a/drivers/usb/usbip/stub_rx.c=0A=
+++ b/drivers/usb/usbip/stub_rx.c=0A=
@@ -567,6 +567,17 @@ static void stub_recv_cmd_submit(struct stub_device *s=
dev,=0A=
 		}=0A=
 =0A=
 		usbip_pack_pdu(pdu, priv->urbs[0], USBIP_CMD_SUBMIT, 0);=0A=
+		/*=0A=
+		 * number_of_packets is set to -1 by the sender when the transfer is=0A=
+		 * not isochronous.=0A=
+		 * usbip_pack_pdu() copies this wire value into urb->number_of_packets=
=0A=
+		 * unconditionally, instead of using the correct value in np which was=
=0A=
+		 * used to allocate the urb above. For a non-isochronous transfer this=
=0A=
+		 * leaves number_of_packets at -1 which downstream consumers of this urb=
=0A=
+		 * like host-controller drivers use to allocate iso_frame_desc storage.=
=0A=
+		 * Restore it to what the urb was actually allocated for.=0A=
+		 */=0A=
+		priv->urbs[0]->number_of_packets =3D np;=0A=
 	} else {=0A=
 		for_each_sg(sgl, sg, nents, i) {=0A=
 			priv->urbs[i] =3D usb_alloc_urb(0, GFP_KERNEL);=0A=
@@ -579,6 +590,8 @@ static void stub_recv_cmd_submit(struct stub_device *sd=
ev,=0A=
 			usbip_pack_pdu(pdu, priv->urbs[i], USBIP_CMD_SUBMIT, 0);=0A=
 			priv->urbs[i]->transfer_buffer =3D sg_virt(sg);=0A=
 			priv->urbs[i]->transfer_buffer_length =3D sg->length;=0A=
+			/* see comment about number_of_packets above */=0A=
+			priv->urbs[i]->number_of_packets =3D 0;=0A=
 		}=0A=
 		priv->sgl =3D sgl;=0A=
 	}=0A=
-- =0A=
2.55.0=0A=
=0A=
