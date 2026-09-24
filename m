Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11021100.outbound.protection.outlook.com [52.101.62.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4B53630AE
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 13:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256818; cv=fail; b=cGJVrsC6lTIkh3SK/deVTjs+lybSbrWkq3+9y/fvPrQGfzSv2MhfBuFh3YS0eEhyRpeG/sotcZIEWt9RbO55ccP3PSIreZKZD8P/MYNFLNErmd6oVc652BY2UGP8UTymWK02+veprlpRi8OF2uwYTQf0UMTh6290J3itq0RFwlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256818; c=relaxed/simple;
	bh=njkBEJ48SXmRxZDIDtFnpLfDVCbrG4XQaNGLOoFLP/M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iJ6z0g8dxrx0cRg5t4SU9ospg//o/hjTJgRjk1OUkHyLz3tDkqRi/kbSCuAFqryAY2C0aixD+wMsgXZgdl8SmKLlRABWulU9KIEDalQ6Fpe9ky8G5yqHcmO+Ezb4OQPyrz+XP/FM/uj0ZpCkuZH8/rtFwwRqJ/apZLHUzxUvyNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org; spf=pass smtp.mailfrom=lieber.org; dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b=g5rwvKCw; arc=fail smtp.client-ip=52.101.62.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lieber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b="g5rwvKCw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUAglGSRw5R/J8Ml5SYzgBDBslJbM4TD5QQEUXJ3U45o9xiloCDZk7KkgfvPPR8OrspAiIkHUHuB3Z9EZyg51agpXaAZqCv5bcuXlirAlNAK45PGWfn23Z6VusXuijCnMWtuNZekusdKcNIeXQYpCLotReBgbfwxB1VWlIX61Vwh08VfDZZJMWpcoVDUehc9VPJsB3tQ8VISCTa8ieatpZO8TcS4afL6h4xYFMKMntA7hnb4nPhgbr5PgI4frKjGribFh5DaHUXGWETPOvKSJ2eZ7q0MotJw/gLfHAmO4mAtLM8z9ZLT+xGJst8Qxj81dDSKd+tCQfZA1lEfEIRPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWUQiFcjjfmyYjXHW/5/nLzlBO43EN7xFQrheDu28TI=;
 b=zNyA63XD2YXmHejBgUKKZOo1LZDMyE9vqydQMNx3hhvXJ0zvNtROR0t1ebt8A5x3jnXABAioJpn5WAoYWqb/W98w8YAUTvS3ETHlGJbhDB9U978eee7DWah5CULdTls3ndOQDpGid8JKOT0Zy8GRgvZxicYkLiMm89abeYFbt8d68Wm2zIwTMAAFMj4VgJFigJe6/0vaGH46q/7fYp1lpa2rZwK6ORCYdXF7h3BJCoM6xw4ufF7c0zpI5IXeQqZvfbAMqaM4YLifBwnNzxx82ycts0RH70KNdrX94PuSPm/g530NnluquuvNEE59wr3H7WYfw7fMf+UIkOLokWn7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lieber.org; dmarc=pass action=none header.from=lieber.org;
 dkim=pass header.d=lieber.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lieber.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eWUQiFcjjfmyYjXHW/5/nLzlBO43EN7xFQrheDu28TI=;
 b=g5rwvKCw2TbZ9Me96iec1xZFMc9PHgTWOr1YHsLhGKP/afARCo5bd6bnz8NC40uKS5lHe8Tl6vZ4n6HvVRWojv2PmJRZdrA6JuoiQITvAw1MQYU8Fy6J+aEXQTkjLyUhOW7fA8Xm6vwe+iAJXcz9H9ImJppg/wq7ANb3DvuR2Z82VPSExrTCVLzIOCTpZc+HsPaRvw0/ca7L+2wXG9cXfxKUXHdNljwsiakPgiwntvUlyaDDb7mNG6P4C47MR6f2TEb4cGbuyPt7wZoDiwDLqbZ79mLhQTKRSQ7mHVQF6CH4ioR39gneRngm0h3qo4EDEnANTALvFho2N81z3vfqyQ==
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com (2603:10b6:a03:37d::17)
 by PH0PR15MB4541.namprd15.prod.outlook.com (2603:10b6:510:86::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 13:33:02 +0000
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61]) by SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 13:33:02 +0000
From: Kurt Lieber <kurt@lieber.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>, "westeri@kernel.org"
	<westeri@kernel.org>, "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Thread-Topic: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Thread-Index: AQHdTB/xumZMHV37HU+Dgj/1DHc0GbbdsEKAgAAJSrU=
Date: Thu, 24 Sep 2026 13:33:01 +0000
Message-ID:
 <SJ0PR15MB469651A447568D8E66757EB1A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
References:
 <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924073514.GM106095@black.igk.intel.com>
 <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924101046.GN106095@black.igk.intel.com>
 <SJ0PR15MB46960A6F15BCA58C0726C908A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924125729.GP106095@black.igk.intel.com>
In-Reply-To: <20260924125729.GP106095@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lieber.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR15MB4696:EE_|PH0PR15MB4541:EE_
x-ms-office365-filtering-correlation-id: 35beac90-4241-4eb9-69dc-08df1a405b2d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|23010399003|376014|10067099003|56012099006|18002099003|22082099003|55112099003|7055299009|4143699003|38070700021;
x-microsoft-antispam-message-info:
 AqEnfCXqNCo98Ja5GEaWtbtfd2hF+fvZ2uEzvVH5W72HvJEQ3KSqIyhvezQSiW7PysswrOFS6bD/5lTK38lTMxFIH+x5BiaueuGZKJStQoS6mdyEXl476J5mtfkly9cl23EXfX5jB3WyRW0Us4jUmauGIBZY6pfYCpRLKzuStLu1q8a/O5dlKsaLYSlWRFMwNpuW2BYM3pQNWvWTwxbZaYK2N91hJ8bQaiX0Nje3lNRfrXzTFDUZRwLHmREmkVYYfypa3Phzgta2uZbiaGc+yTaWo0yQOFlipAlqTbvV/bO4Gx1JJ4tT6KpQFEthSkTXfkXBtEu28OZVqtGSQ1rRgDp9e1d+a/+LVjQoRrcGaiQS+qJjoESXdSnjxBMLJV6SqAlaBPjDoou0ZlhC8lRsprh8xAYTh1NCjw1V4aWpHONtA7qFSKP09K7+M7BLiY1iQmgSliDnkyDx1JbeHBUsJL8IcWrr0i9nE/BD0xy7tb9fCzHXVKLzYQ/2Tp2DHU8YOiOVrmV4cTTqhAiyu5GZQot2+uXYXdYSVTScDC0JZhehi70oW3pbu59glr84LYhglCAUqfe6SIy0dw7kO4XTPWAa6FwPOqOpPLCBQ6AI1Gvd/9z/bEzN1RbVHQxq5guNJZYFSVj1vJeRY5ssbdFTPvoNQEkxfCrYJlXjfESebHZY/xWX89CVseaGLFYM1/Xp118MEEI5PrmXxy9BWbglIaCnMrC0pQG6BHfyM46PRmdrGeExJ3iOFULF+gIBO6Om
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4696.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(55112099003)(7055299009)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?BZEgzuvyJL3Eik2uP2/8BOz0i7jYeIJGcdba1743ydEyDD2Kvtm32k5cXJ?=
 =?iso-8859-1?Q?9MtcTQerf8iFEVcQyISTNQpIvfeBh2Pq4L3U3cQWD4NgSNxVf/eW3TvFKV?=
 =?iso-8859-1?Q?BWD1+JRBj1cF0OsS79A1bfRvK6bo82AVFy3co4wUIsy7PXwO8kU5mx/qzo?=
 =?iso-8859-1?Q?LACcD2TmNGKECZ3jp5qZ9wmSJNVg50Zsp5VaG9KhZbmk9xAI9gxxHYQZjs?=
 =?iso-8859-1?Q?DHnMHMTuLbb+13syr4quH0PXiSHcHI8yF6Osgywddk4tcjxYaOWN7Pt9GR?=
 =?iso-8859-1?Q?PMRtMN6Q6lT6YjzpQfCeL221xuW4sucttGyAT/RrWOc7+wdMisBxDYoAkx?=
 =?iso-8859-1?Q?0K/hIrmQ/epf1wWrJIcopdZyg9g6GeQL0ZSYWLVvoN0fhL0AUqMhMjXyhQ?=
 =?iso-8859-1?Q?uhdl//D6Vek944sI/1uu7f3L7m+RBsfgml97Rbuuq50iUmL9PH/xIVLifY?=
 =?iso-8859-1?Q?DfDhXv1YpE++Oa2EcSbbVu217qPiiDhCC3W4MebWeCO9fWo4xlJjiu7pcr?=
 =?iso-8859-1?Q?XrF2/sIq0lF8EL0lV7lK1EoJ3+MH7kHTqRy5d+Nfy3QGgdjL8BBXI7kkrD?=
 =?iso-8859-1?Q?zIP+yrHmc3r+gaIKZifH988S3FxbZL5VyQqtGdRlHZKwfcbTCa7u1QR/Fi?=
 =?iso-8859-1?Q?yB45+iVO79naGKD8p6x9f9uE5XIvvrUtF1NuZTR+qdxCTT5JAwbTzLH8dF?=
 =?iso-8859-1?Q?ee1YvyQkzOQXRgLUXmOgqPAjp+z3b1OK/XNEJQl/8d4vpbo4/NcvxwY/Ek?=
 =?iso-8859-1?Q?ifPjDps8SVuIqvJuyYh06QHPS1BHIHvsU4rFjlb33kqSR8fXVgTWMsBkxi?=
 =?iso-8859-1?Q?oSahm423dT9/qN+jmCeugJ0U62DYhzj78Vb1/Ea/2Vcbr+6A7tds6rmw6N?=
 =?iso-8859-1?Q?pi/fZEZ1Ej8UAxn2ne2n9+k+1oeu2HIZPCutTX/iSnXh1zs4IHTBbHNp6+?=
 =?iso-8859-1?Q?nbUQK92MKl9hjkc5deJJcMkJZ6gGTt7maTv3ltvL6RerKRpNt2SD7b0F33?=
 =?iso-8859-1?Q?lP48uOoDQfSkBvTdMlEQEZzildLKmdjo3sxl2fUH9DDUrPYMTSX5drBn5u?=
 =?iso-8859-1?Q?q+e/Lk3nGsOUKOTPcboyK7KCUVcfoE9Q9DsOamJS6XHxTUz3cHDTvsCbu1?=
 =?iso-8859-1?Q?MqmZpwIdBnAWVb7ZCKd3a28XwU9XJqUXpaOC9ihM18TICH2QU0dzVNTZKq?=
 =?iso-8859-1?Q?h7ADe5l6LSeNbY5bp2mwVDbwCJnH3WcrNelF+XRdrtFbv1WrA9COuOhYTJ?=
 =?iso-8859-1?Q?EKYbwdk2r/0n6ex2p5mEEMBv5PULmhQt2gWiQ9oMAdSRFly60OV0wO7f5k?=
 =?iso-8859-1?Q?spPvVDCW26Qfogcg/PuhGU85Fm1AYzJ/ALmuPSSfYLDI45LreF/+2YSnrv?=
 =?iso-8859-1?Q?EYAhkIfV+CSDXd8cRPya5kPQgRBQWmbagRnOejVvZ/voHi5PF/uQHeWuU0?=
 =?iso-8859-1?Q?X4JVLwSPowDX01I5XPHjVRnpkCd2oT6OzuwYDQtadkzIFlq6u7ca6PXgsm?=
 =?iso-8859-1?Q?jf8kV7e8qVwyPJzUsUZuZ1KmkQy0M50oXjx/6l19A/7x1RtnnBZ63hzlx4?=
 =?iso-8859-1?Q?lTyvYC0VBJyvPRP/z9vOPAbbcOrcuK1LTVYOo/46/2dwVVZ6klG5o/Olx+?=
 =?iso-8859-1?Q?DTIQb5T54TiqaHA9x6jLsbIZ1Qb6gKLt1EoyAWcJYmgy36OvfslV4PyEqK?=
 =?iso-8859-1?Q?klCGtC6fm2MmkUn3UMJ4O89/UBjJLYSZ5YqKuETjJwllgjc38UZ23S8lMc?=
 =?iso-8859-1?Q?CvLm3Tht0v6VssN/WxzxVDPKONE5o+Ij5E24y5lYLQ4aVIUfZLk+5ECCcs?=
 =?iso-8859-1?Q?y75kH9o7qACFIvucAVYJ6eGvPo6uzdN94bRSDRlHPScIAwE3BuDh?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lieber.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4696.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35beac90-4241-4eb9-69dc-08df1a405b2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 13:33:01.9594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 213667ce-a7c7-4f7f-ac87-9abccbddaa2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MhPKDz3roJeGDanaVcNzywzsYR809AID5vj4Peu0UHIO9bc/gFgCo7v1alhxp9L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4541

Hello - =0A=
=0A=
> Hmm, I missed that it's Barlow Ridge. That should definitely support CL=
=0A=
> states. I have one here and it for sure works.=0A=
>=0A=
> What's the NVM version can you check? It could be that some older ones ha=
ve =0A=
> issues.=0A=
=0A=
The dock router (route 0-1, DROM 01ea:83b5) reports:=0A=
=0A=
  /sys/bus/thunderbolt/devices/0-1/nvm_version=0A=
  62.2=0A=
=0A=
Read with the dock authorized and thunderbolt.clx=3D0.=0A=
=0A=
Kurt=
