Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022098.outbound.protection.outlook.com [52.101.126.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB663EE1D6;
	Tue, 21 Jul 2026 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619934; cv=fail; b=VyHgnK+qMzW8whf82dKxKCg1wUgf0E3r5W7iK4F2Ue257Gj8vBJablVxYZsqSNmVUz7UmB7t/gbxI39+oCFOzj0iuFo223RqFF81dqxHQ+ecHfdTuERR+WgFCSGfJ3K9XKqdtYRG0wPuAJmBzMEii9TAwKlBMX9thkY9kpoWb0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619934; c=relaxed/simple;
	bh=vnBCcQnuqmLo5wO4swWnIziwpwri1lkGSJwTu5vFwAo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=brWmEN1zpfwm5rjfUh3Kr2nL01dl8zxRCrVpnrAHcsBvXjv3GPpUmRc/FB6phMFxBy6kWz6sUe6FEHrLhFdQ/xESIqME9b9X9AbDt9G9jEAocQC9OA5zP7+V1W1d2NErMrR/8iBkGTgrq9V5wDYsnfDcZOz8q8mB47RMFVxLK/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=N9F1cs8M; arc=fail smtp.client-ip=52.101.126.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="N9F1cs8M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcTgf4U9A1vriHYrAuJk26FRPNJLcsgnm7jxMxx20vBvQ4bbiP9fKJ4Ijm4UfNPAmwYag7iDI/U3251USIElklByv1kroELb6gFn6sF4+Ez4aPwPEsX/8oYIC44YZYPeosmRjSVe4hbUouEiZrfkqcOYbOOlxrB2XNgiw6PNHMGG8hxtzpZHYKRfnggjOpWR+K+Uys4C9YcpmNzY9j0Tef83OgnkCaeYWpkFV1jnyHf5B8+ztBaGIvtGFM1Wc7bbSUYXd5Ik1t0u3Yo2pmNCgILPdzcnC1l16rWnNzVBkW/+SoOOHBvBa1+KH+Gxt59DIN40yjnWNHNVwBWIKdJbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQesDpFHSKzQAJ3Ewve6Zt7mvUbvXKeec5KhABT162A=;
 b=P6/FxfTRNVizXia3i5FkSD9cwQ5mvKwFm6UUC84mPEPi9zyWqe+BPgGpH0kfUysGL9d5gPGye4yB9ob5+Yi7u/XPpeqmPcHLLjhmQK16OkeWnKjY1oHT78FyNbd/X5Or+8SIHw6Ke0TFf83/OyHD9K/IaVtBgSd/jr6bJ1RW4GfhmXNS/flOkFhgNLOeEBLc6ICshEHoqrVazmT1OaRu1lQL+0q6dp+tcvwntOq94CRHqdnhQktGGCeymIeK6yEXNWWpJ5vSELDWphmBbp1Wonea/0PNIDv/qRWQMul7O9KQKsm7l4fhGQ/+3QX9QgCVRf/zu9QmptRWEMbZMQHpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQesDpFHSKzQAJ3Ewve6Zt7mvUbvXKeec5KhABT162A=;
 b=N9F1cs8MoG/CF8T/Qfqm+2oBs8KA2kK6CfB8EgSZZ59i7B72f6OFWe0xCH4xuJBptTokcNMVrcPAuzkBQjTW1dCe9seTl44QEqfuPFzoLeXkVuJHE5Qul/jpVRFQSRWck5l5SNMQcPA8h+KJFMzxSMTmh4a/jBV2qvE1oE7ObKBiyD4L4kHy+PXbbVlfEoYGAyKKhIP9gRH/wpftiFSZGOw596CHj6cVFdrS9O1e0SRh0HmtvqWjnzNV+v/Yqt9Thcs1EH6JeqgWbUdIrspaGm8TfrxkVqhFtQFMbxiKPa9GckkMubT/AfOn7PjZiJwNkBLL/w66/hxfo469N8scuQ==
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by SEZPR01MB5224.apcprd01.prod.exchangelabs.com
 (2603:1096:101:f0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 07:45:28 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 07:45:27 +0000
From: "Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG)"
	<naveen.reddy@ftdichip.com>
To: Johan Hovold <johan@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Arun Pappan
 (FTDI-SG)" <arun.pappan@ftdichip.com>
Subject: RE: [PATCH v3 1/2] USB: serial: ftdi_sio: retry transient errors on
 chip-side control transfers
Thread-Topic: [PATCH v3 1/2] USB: serial: ftdi_sio: retry transient errors on
 chip-side control transfers
Thread-Index: AQHdAubKKS0UXZPSZE+Uhf7q13BiCbZ3wKgAgAADPLA=
Date: Tue, 21 Jul 2026 07:45:27 +0000
Message-ID:
 <SG2PPFE985372F01672A7186A12CE06D727EFC22@SG2PPFE985372F0.apcprd01.prod.exchangelabs.com>
References: <cover.1782121274.git.naveen.reddy@ftdichip.com>
 <cover.1782201674.git.naveen.reddy@ftdichip.com>
 <37cc6844010da737aeae61e0248fb3e9ca5e35b0.1782201674.git.naveen.reddy@ftdichip.com>
 <al8gzIupMhXqWq9u@hovoldconsulting.com>
In-Reply-To: <al8gzIupMhXqWq9u@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PPFE985372F0:EE_|SEZPR01MB5224:EE_
x-ms-office365-filtering-correlation-id: 04bae619-8eef-40e9-1bcb-08dee6fc0823
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|4143699003|56012099006|38070700021|10067099003;
x-microsoft-antispam-message-info:
 3D364RCu5Hc64pOYRJXaqzN7lYpp20VvRjZ76x05EnHjA90ZwjdNnJYb6PZl5GtaRIuQDC3S+NWx8w9BT5Ugs7TMdMuCYJgoHHrULGNETAQZotmquSBKI+apN/N2/+wrKkBED+tzEoMoeNJR8AxlqxtOErxlK4cjlxJm43h6wJm/IiuFaWF1m7IYcLUrn+seGquha3Tr5uUik5kQDryG3Zw+cOt8jDlsRAtQX3ISbpjq76Zf2/XPXrlMO1BMpw0J4ZopKT75Of4rD2yFA+Z1JlyCfwcu5s9vmLVFw1DO9JUVdwdnkQLAmlU1JfNJLnYWncp/khMYzLs944GS98VZYwOQewELtwM1wF7FV3DaDEz6NeJT0JaIDJKRxgILHMa1wjC/tE/gz5XQf9cFN4qmvsSpkC7n1+TpyjJmdW77c+0Op3QxF+lztBn/sBzHDbpocwatvY8Kn7LrPeftpANW+bq/EZ/rjb7xEy+Y0xA6il9jOcEVKxoM30AwbJ1f/z/ej8rizae39TUZVtV9Og2c7nq4SNMtKwk4ulJ+fMJbt9c3b7OEIb2UGsgllVqYf52yz8/57n87yBaNrqBChkVDJSuSw2t/+H54111Q7Hp3I2JF7Ocpa40izbjmdU/ug5TIwYWMWf2ziCmcezTg3ZEiyr65o6XqCH9IDrE9Hr8NwWEE83aOYeZR614SFty9UM86fvNP4ygng3yYV6pTNQsdOSfJib7wtuU3fVmGnja5tBc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hfNJxIwJFEtyx57GIFbeeHsBt5gpEFidYGtlHQ97Mna8fIyV5ZMWqzIg6Ff9?=
 =?us-ascii?Q?MI3diXWH6hH2IuJilf/sd60No+t5cuLB3Q115tzkGTreJgfX83FQ3h5qT4KR?=
 =?us-ascii?Q?X+5OF77j7hG99400c5VV9eXs5w9MySQ6jkZQmNpgRF5VKo9cyuYdD7MUN5OQ?=
 =?us-ascii?Q?zVMcGTfKFLu13uPjjhNmhFQLTcohHfQ5yXKT23PwF8nmlMkP1QSH3KtEmpt3?=
 =?us-ascii?Q?dwqTV9udtmxvkcMQ1f1Yocuz3UJn/FikqISr0iMoXg6fWFADGkwmJ3GOf6Nn?=
 =?us-ascii?Q?0jDdyTGIxLTzUGXdjI24lRNh1xOG18EFU7eLtcFzHUYz3U02iv41+R8meKUz?=
 =?us-ascii?Q?yRGKibzgoVif6NnHpmySuRZwlVmVhCEpt7+iR26ZjbFDIBVNorS9Te+MYQKk?=
 =?us-ascii?Q?H1DwmCP0pzZI8Q1SvvpSlFvxRORx992qtV6PL4odhRnco/Cr68LM6zUFOdFg?=
 =?us-ascii?Q?Xzllk3rc6y192rbfr4HhWOa1GbUKezbbyAyNQuNqmRRTe39AF8qcJVmWTWRh?=
 =?us-ascii?Q?G6KfnD46896PUTIbDnz/waRZDUz6gFjhLB4O8GGCixrJdUqWqlUTo7b5lj6T?=
 =?us-ascii?Q?bskMNIGp9UQ0SYSPA15OMcwNFZGd+tVU96mFrmTZg1skQMHyoisMpfL1Dpur?=
 =?us-ascii?Q?w3tOWD8KLlWiTcLD10rFY3bOwWPodDRKN2tGUG4xEdF/Ul8lX2Iw8XOecYck?=
 =?us-ascii?Q?f8/R3KBWP+Z78tAzi3vqPADB3drxrDu0FY5o6SemzoXlJeU0WCLVbyFNVGSZ?=
 =?us-ascii?Q?PVHTndnsC99T9BdnejTrjEhpIxjlkIrm5jWQYEjyz+c7ihWS5ZdvToETpNkf?=
 =?us-ascii?Q?hlLoO5mGrlikIlXV2NEYxEavZ/A7lYilgZS15ts+XiVC098tBwO8brTKZ00q?=
 =?us-ascii?Q?YElR3Vy+L0O4NUgQjK1U5VMKZSG5os/8bv4kLBbm8oLJyxchScSaRvFDCTgc?=
 =?us-ascii?Q?Ul3yJ9pRtYHmPLx8mw3B9p/KsZ3ByfE4SS8ojkg5wxsjO8JHyEKg9UgqNFfQ?=
 =?us-ascii?Q?lx4fB8rQjWCKbPHo7QUGeGYYORWrfzSt1lACMhcFL4DWRt9qA+slJTFc88WJ?=
 =?us-ascii?Q?fw3e3x+7Us7pPUNt9K7napD9Mo8JTW4qqktD/U97qkq804s7tUPAnMdh5JLc?=
 =?us-ascii?Q?rIl3ZkwjKllOkynmlJcatHpabJ9uQQBAuVk81P1aDAub6dJUM6odui32XiCY?=
 =?us-ascii?Q?RDITm5wbTxyxNdDTVcK3ex/cpU9uBmPyFWOdr6Lwq4HC3osHvcJe371Goego?=
 =?us-ascii?Q?xsNOp/yetok+KReYc81YkrpmonzvEp2ATWSKdwzEjVyEaGyzmPaujZhDjI32?=
 =?us-ascii?Q?ojzGJb45wnx+g3eM6wtdXqM/uYJIiFL1Mz7a3T0uYEM9JOZzPi//axxW8OAr?=
 =?us-ascii?Q?RuB2Hr8z8lmqZ2vD88K93zdIOGzkdkLPJXw17HwNNrArVQ4OGbKqrzC2S/gL?=
 =?us-ascii?Q?oxLUTWvJC/OvljtWQPMENs+ldBGDksO/hobbUBsVtqg8YrvhLpYUKj2TiBGy?=
 =?us-ascii?Q?4NXldVJNIXTsegxtBOmcNKXs33Qj47K2lCtTwGlsAKAqkSbYeTLD4zvg72+s?=
 =?us-ascii?Q?X3j9Q7e4hGlE+0Yad+O41B+5mOXpGDkylLeHX+DNfcBvJsCFFZ5/Fjig8ibU?=
 =?us-ascii?Q?TBnfwls0cXegpaRAHmpNjib7VLdzQjYBL9K7ntllKk93rz7hx+DAZznwgbc9?=
 =?us-ascii?Q?evlUEG1sA+9eb1BVAu2cl/qBJvIfedGPsaH3VNMTv+sFYCctETPAlaNToAO9?=
 =?us-ascii?Q?N6Ug8HaLkg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04bae619-8eef-40e9-1bcb-08dee6fc0823
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2026 07:45:27.5795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NgEgrG6uN5sB1/fVQ1FjWe4szutZNe3B2woKAhT7NmTJstmuoczYToW0oJj8WDhAgeyzkGz899s3VkEWkTTiS17HCUZOfemADyS2sVtwJgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB5224

Hi Johan, =20

Understood. I will drop this patch. Thanks for the review. =20

Regards,
Navee

-----Original Message-----
From: Johan Hovold <johan@kernel.org>=20
Sent: Tuesday, 21 July 2026 3:34 pm
To: Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG) <naveen.reddy@ftdichip.c=
om>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-usb@vger.kernel.=
org; linux-kernel@vger.kernel.org; Arun Pappan (FTDI-SG) <arun.pappan@ftdic=
hip.com>
Subject: Re: [PATCH v3 1/2] USB: serial: ftdi_sio: retry transient errors o=
n chip-side control transfers

New Sender Alert! You don't often receive emails from this sender.

On Tue, Jun 23, 2026 at 04:03:20PM +0800, Chinna Mopurigari Naveen Kumar Re=
ddy wrote:
> usb_control_msg() can return -ETIMEDOUT, -EPIPE or -EPROTO on a
> functioning device when the host controller is momentarily unable to
> complete the transfer.  These are transient conditions that surface
> under heavy USB bus load -- for example when several high-baud FTDI
> channels share a busy host controller -- and a short retry generally
> succeeds.

As you described here in v1 of this patch you observed this with an
out-of-tree host controller driver where this is just one symptom.

So this falls in the same category of random function driver workarounds
for what are really host controller driver issues.

Just configure your latency timers before overloading the controller, or
have your userspace retry on errors.

Johan
