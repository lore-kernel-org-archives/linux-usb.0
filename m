Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021114.outbound.protection.outlook.com [52.101.57.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBE443A7F7
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 07:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236636; cv=fail; b=bRH8UveDCHeo4KUAWedLhIlfsYb0kcmw3GBwNd7yoYlwBqEPCz1jSNqNXo0jSkejrFNtrRZpvdZu79J4ZlaMIf4qrmu56xkhQu0ND/SoRmy7snbbMc3C9o2m8WpWnd3EB5EYNhyoBduQY6qsPy0GLsYTjAGAGGyCwnvUODNxP/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236636; c=relaxed/simple;
	bh=Of96yY3MZCMx5VEoycuNrRmw8hsoOi6enSWgZFy6R7M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lysT2Zct1leBlhDMQggANiXONzvH983V/vLiWgIN4n+BZpNVCnv83+x4hfswTdrduB0WG7vwFBkcQlcjuQHTdajIUxzEzMmWfDmoBOfm8hXsIU7Z35JMl5Tw6YTBmJVCrbc9pVFL93KHshc+iOzJjdfxDINaI6flMn4JkTShp5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org; spf=pass smtp.mailfrom=lieber.org; dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b=Wpbp80N6; arc=fail smtp.client-ip=52.101.57.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lieber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b="Wpbp80N6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xc8EcAWvnVzZvowKsYC4zVWEZ2f0a35tgjU7pgovd6bUdp7Z0NjPmpGl+PYCCStr/TJakFamRW31yuj3NLxvDuLcYlSuTNEZM4OTEAk1eK+c1V4SPcm2bGhP81IwqWnX/ng6dWoIdLQUnL9aJfeE1iR/fwMdNjMdkSFfHXwrBtakk3cKu3abwITBN7LjlNktl179+HX10huBw94s5hWQAoBW1sfw8LJxPkuqhy59M1CeIw4TnIqWpmXo7OXPNkrCP4xKWHO35wW35Tk8nO8so9wyWkZGmBhSJ9EwxUJi92nZsSYnECFV1n7eNrW5FBYDAAOCfI/oV6pkPCoHiJisYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89Mz1kMDikCY8PvzsYWvrFVi9MX+9WZeN+HKwborF6g=;
 b=U7L2m7nWnILShVK703PMi1mwDhdWIx/tdyWmK5/67vKjFYNzi4bl0yQZjloNXJ3eeeefojfBdHNFGYI64GNo8zpAXWkcSrVmYa1kVsWENFRmWsDnveFcCBLODwVV14TdtB48BENCL1sfe4zJTGVIAuQPDOYgKc0EHUkFdvx43mbLsV1b3HoURABBpnRIW0B+iFumG9BS5BkB/xk7NUA+4bpeK3oKZjRbHMM9q4I9T0uw9VbO8hyEQnnlkMSoGL2D1EP5Jm11L3Cexwl/b19h3+lF2xG0wcv5ZQk2U8BhRmGIEekoBDs/QFV4XLZv5XGbOZtIe2o+QCbgzbcUqKZq5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lieber.org; dmarc=pass action=none header.from=lieber.org;
 dkim=pass header.d=lieber.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lieber.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89Mz1kMDikCY8PvzsYWvrFVi9MX+9WZeN+HKwborF6g=;
 b=Wpbp80N6irj73iBnAojWOhAHR+gRtgVwImKevNuBFmWwNYhlyKza74zZyemYIQ3e0D7aXIbr+plUfMlRgSScWSqkBRDJYq7hquf/gZ2pR53F9jlkSmWIXPF05abs4zZhaSeAf90lM2d8dr+Gb/SEfLM6LCTSsC9dElInnMAT6IHHt3fN8jJt3uZG0pugEv1N4aljgGfmaZn2DuSTABdTIe2PWemxLXoDv227x67DKRyemN49hddJsxSjBfGS/OGvz3owU/OJLn5GV48EmDpkz5itNMVOjvp0+lFUI74auQ/klfEtUe9X948D2cgN6tcIxnEdrqQwilyafYcPxkXSVQ==
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com (2603:10b6:a03:37d::17)
 by SA0PR15MB3999.namprd15.prod.outlook.com (2603:10b6:806:83::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 07:57:10 +0000
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61]) by SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 07:57:10 +0000
From: Kurt Lieber <kurt@lieber.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>, "westeri@kernel.org"
	<westeri@kernel.org>, "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [BUG] thunderbolt: Anker Prime TB5 (1ea:83b5) reconnect-loops on
 Meteor Lake (8086:7ec3) unless clx=0
Thread-Topic: [BUG] thunderbolt: Anker Prime TB5 (1ea:83b5) reconnect-loops on
 Meteor Lake (8086:7ec3) unless clx=0
Thread-Index: AQHdS/NMrSCJQlCFmUOBcxIkZ8Sh4LbdVpMAgAAFf0c=
Date: Thu, 24 Sep 2026 07:57:10 +0000
Message-ID:
 <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
References:
 <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924073514.GM106095@black.igk.intel.com>
In-Reply-To: <20260924073514.GM106095@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lieber.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR15MB4696:EE_|SA0PR15MB3999:EE_
x-ms-office365-filtering-correlation-id: d9565bc1-76f0-4253-bb71-08df1a117003
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|23010399003|6133799003|22082099003|55112099003|18002099003|3023799007|38070700021|56012099006|7055299009|10067099003|4143699003;
x-microsoft-antispam-message-info:
 z+zx9LKONuNpKzSp2q+l5sUEDoccZqNKIqSchZiHOOceOekBXCoJZeNcnykzEm+HDNWkSFVX0aNoBQGnf/VxY98OyQ5N443jtW97UKZQKlQXBJW88gfUOlI0/l4375LpacJo+WrQGRySYPoSl4BRZlDqmB7C78zZnC8tRSB+U9fMLKOuFFWAXMDrIT/3Ndpt2/vxPua52x9zbvtdPHdGE1uFLnTStoxBdu5MATT07bKqQCfsJskgcJ9jkKhU0arp8UfQobfOH3FfmZJmXCM+xxdfnjPB5ZIbyL4BpRjYIzlKniliZCtcU4FmGTCLDX1QB/uDb886qR4u4RyMj53wqjYiclKrPCB5LCgawxxKVDbnLwMb2P+zNUnpWmt0MQiLLpifoQo1HBXDPFpHIJXWDCAIv1aLGdgMYAcIVWNKG9ktaQTsfTW1dGHA3K33b+Z0oEatXS19Oh/9xXXnTghP3+mJ3TrYZVV/DSh231A6T+nVm4f8j9RCw8OsgZehoPEQOfkBqg0FXolNUmGTq+Vi5F0eBWHkT0WwhYor6TZCncAe/gRrm0VDXTFxMvBQ36ZL4vQkIGOjvxqYQ0YlreX/1TfjvxJbMVBaBgeqhNZBH0K2m36mP8vNIAz+kJ9yoYcWvlxyBXGNxU1JRgfQ+5xQvHTD2xvC8azyQTI+sMR733jG0ShB0Lpwq9GY3FDiZzrqsQjmVHiwmHnyrq48omzcKo1Nw8vZHfKf2RkQApWLZrMOO5PhzSQZQNJtcW1XVKtC
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4696.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(23010399003)(6133799003)(22082099003)(55112099003)(18002099003)(3023799007)(38070700021)(56012099006)(7055299009)(10067099003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oRlLMarDWOvunUkQDT3tqUSq34p6CusT+tll5tWbaWb+OL001tcrX4yH3w?=
 =?iso-8859-1?Q?c1g23ddAq2sZYaXfVY34WrFqonos1dV22gz29agI5fH4oBICgydeIAAPol?=
 =?iso-8859-1?Q?P2D//amHpI9TkqUrpEsnMxoPlDXat+4mDnJOmBP1LBTtV6U6w1Ec5xufB6?=
 =?iso-8859-1?Q?aw18UeH2cv7Bsbjf2lrI08fxj7SIEaHNAkUBBzmaz2Q7zIOzJWfyI/491g?=
 =?iso-8859-1?Q?rwDn/gnyYC8YwkVldG9IyiOB4s2ccGMyDqs56hzuZlaQlfcmzaebOTEeLU?=
 =?iso-8859-1?Q?1Am3P3FZ2pFkKQHls2EjcD+RFv2Y931+vvnDRmCwvk4lEZBBOZ3m5BfU0d?=
 =?iso-8859-1?Q?MtzoPSHhaQXd+WeYv59//6B+u+8+bq2PYoZI1b/hDZFOZQA5HUX8vpGNfm?=
 =?iso-8859-1?Q?anQe0qwu/ad5HYnw9VGtn95bgB4psUOZ0ZT0NQZEe/vB4EVt5BVbHgQpBl?=
 =?iso-8859-1?Q?sVUdxNbau+pd+Ewz5tbay+E4Uhwy9ddypcG2EqaG5vEMFRut9dwXjGJM4z?=
 =?iso-8859-1?Q?uudko5xeiVrS6brziE5BdH3ZG82G3SqrabS++/+afWC+moSYDaBeoIId1A?=
 =?iso-8859-1?Q?f6Tx4c3gG08dx+vsMxDgzaqpsVN6W6RQ36lfnRileGTGFuKzTbHRZEiM6O?=
 =?iso-8859-1?Q?qoAy///16a1bn0KcpVYBNDgH5UVxAoSygjkyNrdgJptUzB/JEJTBizkw0t?=
 =?iso-8859-1?Q?MKFaUNhtCN+dFxnwlGgJNB5xU5dFt/xtpbSz3dsl2XWO9vnq/yTWbWs1hF?=
 =?iso-8859-1?Q?7zF7v2QgHl54QDgSTItZ/tyNiBhrrGVPZguWzHZrpce180J2ENCCGWWU8g?=
 =?iso-8859-1?Q?uNvgQ8+uX/GC9KbybvWRpavS5IZAtL20wPeyHD7QdPnRrFq/wGaT8PaM2b?=
 =?iso-8859-1?Q?YPxD9yg+IGXHNL5FNU7k3vS1qSbldKAdqTX31TCnPiSOeDd5RfdwGZppV9?=
 =?iso-8859-1?Q?pddXbUCQIcvwkbs/mpPMrzlmDSXpXhtJV0McKt1hXMaNmQEj2NZOVyfJId?=
 =?iso-8859-1?Q?lvuMY5vs+i3TkLObWaXGCOad9mirPMv0rAAQHi+i1xtjbleoK+me3SXv9X?=
 =?iso-8859-1?Q?oEWP4WcDvgjK5QRmZRk0qSWKG0N2vwi5mTctFrYuDcqH3CuCyKSn4v7QQr?=
 =?iso-8859-1?Q?Jk35ThcDMrRqgiWB4Gzp8KmOCzp/3zf+cSJCDh2vCPIuujfXWy1R5XjLvT?=
 =?iso-8859-1?Q?JEK4PFRWGAIjF71Wye+Boh9TkLePrzI4FoEV3yO2zKay0FwgJmY0XIlpek?=
 =?iso-8859-1?Q?rDtU5NPQ7hnaMDMD6FPN0vM9KDrCRYFRPknLxQ6mzy9s1pMKLQIkZmD2b4?=
 =?iso-8859-1?Q?I4epeYndU+1G+V0+EfJQTXnt9WOYCElnFO0/RtheGWPEmKg7+Owqi/HX+N?=
 =?iso-8859-1?Q?ZBUvtXytmHWJzkvXsdFqw9L3ro5a5O6uyc2DGDrDrHr+djZQpvRFtWxi+R?=
 =?iso-8859-1?Q?fEWN5aXQ5Kv1X7jT405V/nZB/UK3fjUCoyXjjpZrC4f0G7yov4TGAugMVS?=
 =?iso-8859-1?Q?mlSGLcT27C0DLYLLv13+TSSK3Y9PkcnxePK+SH3YUB0ijJOQQJszVTJaCT?=
 =?iso-8859-1?Q?ceIhUUYL8jCpC5+naiFtfWlZncRHB81kbl1weWB5QxUxwHk4W1R9o+e1Zi?=
 =?iso-8859-1?Q?4bk3PySdoLA82TOlByE0CfAqMLhYDwY0lcvR/hFhEa8Ayt/QjBJTRZS9AS?=
 =?iso-8859-1?Q?hZNGLtY9RgwP4GbHaRlzKTY8JMZeD3F0+all9TQoDHDloQQ9NcpmCg4ug5?=
 =?iso-8859-1?Q?JcEiqoum075DAbuMcI3Jz9boNAy+fUbE49MDliUYyVCi8uVWVn935wsYxt?=
 =?iso-8859-1?Q?xqoLE4DY9KrA7AhLQ59bPxiJOKUJWt2fgu2Cj9sOkent/m2zU6zX?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d9565bc1-76f0-4253-bb71-08df1a117003
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 07:57:10.3869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 213667ce-a7c7-4f7f-ac87-9abccbddaa2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hoyQoRJx8FG4rMkMnIF/NqDZaiGpsO0DdjUluawO7ghHS/lAw/5jKJY0SJgCOKyG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR15MB3999

Hi Mika,=0A=
=0A=
On Thu, Sep 24, 2026 at 07:35:22AM +0000, Mika Westerberg wrote:=0A=
> Can you test with the dynamic debug enabled and provide full dmesg? Or=0A=
> alternatively run:=0A=
>=0A=
>   # tbdump -r 1 -a 1 -vv -N2 LANE_ADP_CS_0=0A=
>=0A=
> and provide the output. This needs to be done when the dock is connected=
=0A=
> (with clx=3D0 is okay). This should show if the dock claims to support CL=
=0A=
> states.=0A=
=0A=
The dock was connected and authorized. thunderbolt is loaded with clx=3D0=
=0A=
(/sys/module/thunderbolt/parameters/clx reads N). =0A=
=0A=
# tbdump -r 1 -a 1 -vv -N2 LANE_ADP_CS_0=0A=
0x0036 0x1cfe01c0 0b00011100 11111110 00000001 11000000 .... LANE_ADP_CS_0=
=0A=
  [00:07]       0xc0 Next Capability Pointer=0A=
  [08:15]        0x1 Capability ID=0A=
  [16:19]        0xe Supported Link Speeds=0A=
  [20:21]        0x3 Supported Link Widths (SLW)=0A=
  [22:23]        0x3 Gen 4 Asymmetric Support (G4AS)=0A=
  [26:26]        0x1 CL0s Support=0A=
  [27:27]        0x1 CL1 Support=0A=
  [28:28]        0x1 CL2 Support=0A=
0x0037 0x4824003e 0b01001000 00100100 00000000 00111110 H$.> LANE_ADP_CS_1=
=0A=
  [00:03]        0xe Target Link Speed -> Router shall attempt Gen 4 speed=
=0A=
  [04:05]        0x3 Target Link Width -> Establish a Symmetric Link=0A=
  [06:07]        0x0 Target Asymmetric Link -> Establish Symmetric Link=0A=
  [10:10]        0x0 CL0s Enable=0A=
  [11:11]        0x0 CL1 Enable=0A=
  [12:12]        0x0 CL2 Enable=0A=
  [14:14]        0x0 Lane Disable (LD)=0A=
  [15:15]        0x0 Lane Bonding (LB)=0A=
  [16:19]        0x4 Current Link Speed -> Gen 3=0A=
  [20:25]        0x2 Negotiated Link Width -> Symmetric Link (x2)=0A=
  [26:29]        0x2 Adapter State -> CL0=0A=
  [30:30]        0x1 PM Secondary (PMS)=0A=
=0A=
CL0s Support, CL1 Support, and CL2 Support are all set. The three enable=0A=
bits are clear and the adapter state is CL0, which matches clx=3D0.=0A=
=0A=
Please let me know if there's any additional information required.=0A=
=0A=
Kurt=0A=
