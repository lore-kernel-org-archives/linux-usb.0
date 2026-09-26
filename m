Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022095.outbound.protection.outlook.com [52.101.53.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CBA41A928
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790422636; cv=fail; b=FgkJBuuMyW3NqcuWN+idV6qqruOflS2xe+Nrqrqb7bqlHrvYxKMjMgfb+L/Ca0S8ZoDnpvQca68pOS17UPdawYlnsM0ovsqwMHg6vSOV/S8rqfkCnnf0gz1+YkzTSF+Ed1tMH+Ky2wbyiq9Qqmg6zwAbOrSKhmByWHUDrAVZJyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790422636; c=relaxed/simple;
	bh=xj2tTdKrTFqDRxz8xw9igGvmo1OTrtFtyQAncN0XugA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uy+F85LaNQ5u5JWOh0hFYC0a/aH5snUgWAEV+bxh7vcfWEgRhWndC6fT/QLW1uAKuuVJmnxW7Qa4BE1ZUg96y7aC21Im2ywsqBPeoz06jJpu430akXPjwbQHba+X8d4SE3mI+maUrDWZNzxV0u2YUODpNP+H3h2cI0z6tJ//QgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org; spf=pass smtp.mailfrom=lieber.org; dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b=sH54XDdi; arc=fail smtp.client-ip=52.101.53.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lieber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b="sH54XDdi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADVLXz8sncuQsajrYOnwEWdfJX6eGpsdwCIVlbInFsg8UQv042SN2EMTVXkglenk6sbpSnE22polXvYXAYrfX9Cx28NLIwvJ85sER4VGz5Mr3BCajpjgXWxkEGyuYvfcm29G8xU5S9zxLKVtgsZmQQCgYKbA5dMg4D8AB1iQseHLHIViPQ2jiG+3jUa1FjcambXYC/QcHfO4nB/DzOpQ0Nc21DLOgCx4aF/4LlU1w7Lr9ROOKl7t2Sx3OnSby9KjiYPZ1q31e887l88N16pJXtmTdD5FzjN1MQTEpP/StkrHC9W1XOlAajqJuRmtE8Z9R9OazueBW9G1JB9KufDiTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBAK1rG9bOJAMo1sr/RMqvnVfp2RO7o3uR/9bwsz/RU=;
 b=sbbAlEx+jzaKzliREStj/M9EMcOyBFPr31MHpzLE8ZlvClPTkrOCbWBq8mAcbP3Duuy7aly93Yg2naOFUtJ7KKgi9nWEPoFv3zPuYfHa1FZynjfdeokJ0pgtz7MkQd0PTxGy81RocKbkBpVdG7ufnNPLu6acMV06JlzB+Ed8K7BzzPYSRfJBWPruQ3caPmw5EdtgrXeQq8JXPg9jBj9AhvfL0jopnPWDPU1BVE1THBlsbWKVo4BigoK/mhqqvKV123UDD+PPhcJJP018Qge1IfseiADHcVURz//Y+cVC54lfXlmNdkcCbAlbQT5AIej6RlL1IWiS1K3qcexBK4PtBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lieber.org; dmarc=pass action=none header.from=lieber.org;
 dkim=pass header.d=lieber.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lieber.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBAK1rG9bOJAMo1sr/RMqvnVfp2RO7o3uR/9bwsz/RU=;
 b=sH54XDdiTC9UjQze0JAQTEAzRUM1j6eIj1ysH905Y56vE1GpUr4EbKWnQEL+MndCXQQZ/0Vs0UAbxkQ7FJUThdK4oyNVk0ZOPiAq0ngc25uuZzi8FqY2VlEp6ajtXJRhXUt/6J3EoAykJRpKEeDAAHB622JeYUhiR7AwTPlNyEguA/F1adzlCXicfsaaP5RzdHSlAvY/XBDL+DuMGYRv6BT6KszB2af7C7+veSEU+F1eFUIjqYX7x/Z+n0Op9T2vRtqXkMt2iGssEf4J+38Se76sGAwoQTgLX+aYXye6hKa0Z+nh44ykYtTRqYxr6s7N8w/SclWBOcLGjSSqYiPVRQ==
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com (2603:10b6:a03:37d::17)
 by IA1PR15MB5896.namprd15.prod.outlook.com (2603:10b6:208:3fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 11:37:09 +0000
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61]) by SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61%5]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 11:37:09 +0000
From: Kurt Lieber <kurt@lieber.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>, "westeri@kernel.org"
	<westeri@kernel.org>, "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Thread-Topic: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Thread-Index:
 AQHdTB/xumZMHV37HU+Dgj/1DHc0GbbdsEKAgAAJSrWAABd8gIAAmJVSgABT9gCAAbNXB4AAOf2AgAAS+cI=
Date: Sat, 26 Sep 2026 11:37:09 +0000
Message-ID:
 <SJ0PR15MB46961EF9154F8795B63E66C7A38F2@SJ0PR15MB4696.namprd15.prod.outlook.com>
References: <20260924073514.GM106095@black.igk.intel.com>
 <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924101046.GN106095@black.igk.intel.com>
 <SJ0PR15MB46960A6F15BCA58C0726C908A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924125729.GP106095@black.igk.intel.com>
 <SJ0PR15MB469651A447568D8E66757EB1A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924145447.GR106095@black.igk.intel.com>
 <SJ0PR15MB4696FC97236D81E59D40E142A3802@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260925050124.GT106095@black.igk.intel.com>
 <SJ0PR15MB46968FAE6C8D0A6A250C5ACBA38F2@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260926102705.GD106095@black.igk.intel.com>
In-Reply-To: <20260926102705.GD106095@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lieber.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR15MB4696:EE_|IA1PR15MB5896:EE_
x-ms-office365-filtering-correlation-id: e38cde08-7a3e-4102-d992-08df1bc27ff2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10070799003|38070700021|6133799003|3023799007|10067099003|56012099006|4143699003|7055299009|18002099003|22082099003|55112099003;
x-microsoft-antispam-message-info:
 aBxdZrYsJbGolawgtWg0b9SmKi8VCW15ep2Uir3RzPfQlN5UpdIVMlansElaizVtPhg4LLgAoER9nb2fLfhSKP95YYNSR5SBk0+/1PvBSX8c50KOKNXG4JP12w+r6rSXXSvf/AF9tEYHr2LAg9neXmVspX6qVwzHf2TCp6RQ9wVQ5CSmeRRXyXa9M8oOkZJ3dKsAuxk6ECVQlYNNURIdiCFcGwtvavXndIqT5qneCtsADtsTCzQAZaSoJyePRW3LrQbAxCEzu8jsQ3ZMkt+TymVOmpso+LuNBUANe61VNKjBs8fI+zC5oxETZSqqu79iBME5xSriiQ1F8pKkEWlRm+FX+ZLwczGj6HYrwiiLKMa7JWUh5h4w9vwVrZRhL1zyq4gvfoeDIGW2Jhm1jadqDniJnC+ILJuTAviWBeHW4kMHDMqBwwa6drpS/Xsu2zJ9Om5U313YZGf/jltS0oNVw3PeebTigJyNGRYk6UW1yjmLzPNfRaxpX7v60TLOcih/ufQzt4S3ru4+wyOckh+GUVKUii4Z0mXV5TcYwidAjVUx14WKkLYQjIRXhMKHySbbMWX7GZf5Ga/p/PXNcV3BrYQXCF4pXLGkh9cyf/nglf9MwS/q//Fl5hhDVjbXTrtHqc6Qfxf+hWlR7kg6sz3ZbKk7aFfoPYTglMAhFA4swraljvao9DKnnrNqWpxCcWQQQ1UvxqH5IPyYcqu4+O+OpUqZuE1tabM/uOGrM01WgdM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4696.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10070799003)(38070700021)(6133799003)(3023799007)(10067099003)(56012099006)(4143699003)(7055299009)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Vx/mnA8Lr3/js1iR++Q5PjCWRwSaTpuql7vD524qzjBTtOWFguagG4pFXy?=
 =?iso-8859-1?Q?WyhS/634NhSYTH5vfOdgpNHI9ugr2hIUsBba8gdJ8BObNZ6+VnTMOeV3F+?=
 =?iso-8859-1?Q?yZvczMkV7UIhCkXDVK4bav6eTkJ+CK8xuOnB2YCmvvI/ISm7OIiSfxP727?=
 =?iso-8859-1?Q?CHMA1KyS2uXizYF9Nd4sZ0i27YqFWsa7LTQtxXuUayvzGwr1Vqk38BO/fN?=
 =?iso-8859-1?Q?lwL1dAHSacN1IZVvp9fHOydXjxyK/56b7Tl35IDbIADMUA+VlvNXzbLcEk?=
 =?iso-8859-1?Q?mw9L4ki2trX3iplqHVLqwUYaQcjDmk2nbHSz1GGCuFqV0ndaaOLrK3vWyP?=
 =?iso-8859-1?Q?Wt+0pnJ3yRbH80jcBukpOIW/ueyYwbLL1UMtKnkUjG6qlWrl9LpsUrq+9a?=
 =?iso-8859-1?Q?xBICeSkSVgqmuH27pcuzpYF0tUsyfJ2gniv6J1SdqnukMGBrREUsVKPix3?=
 =?iso-8859-1?Q?M6Eewn8aFBF3lc6RpW2a9bBCVjYV5xXbiIg66VN+11sTEZEaSRxNb+v1xq?=
 =?iso-8859-1?Q?elXMVTnaZ52EGaG3S9SX0b8IaymdgyRYAUGqOT10+eASQ4Fc0QKh8Xu2VK?=
 =?iso-8859-1?Q?kgur6MAtndpsLAWuJphOMkb3l/z+nq01XqPRkh9o5pb+ZANc4vBksFQK98?=
 =?iso-8859-1?Q?PpgukBdlGYEjUE1uEjYpXMK+nBYehcIX/nSywSkIcgmnmcuRK4UZ2MnIo5?=
 =?iso-8859-1?Q?0xrd7HYeix/w9gjJQJmqlCD9m/S9+YYodoiXOa+0bILep0iONjSKfFB1XM?=
 =?iso-8859-1?Q?/QdLrmLCj10a5P3HzG9yIKY1aOINMl87K8UZMZNFTNzaIp2pk1BMvzomsW?=
 =?iso-8859-1?Q?yq4e5nRqX5j/ahlW6uTfHTqYd5PnSvxcDReP0JyzhJvEziu2Q+bOWwUzq9?=
 =?iso-8859-1?Q?i1h2UBIM8koKctYCgvY4OJmILCMvtUR7V6XLN3V2BBbLiIoO+bMitK/z/p?=
 =?iso-8859-1?Q?X6Jl2XbJR+s2iyYAFhIUSxib94AN2v/p30/dsYln3YaCIL9GhG3hHqAOxf?=
 =?iso-8859-1?Q?8k5ZpcR0V3+QkIyf04RT3jJUSKgNQguvHN6nn9w1QEm6JO69A9X+4yD8VC?=
 =?iso-8859-1?Q?10ZvFF0mMrxPRjbXROvl5dh7Qy1lsb2/PzCTlPjJCvqCreQM9EPe6OWkrx?=
 =?iso-8859-1?Q?PHpE9TsuA0GR3A5nZpCQag5KfLWWxRj11cDYiZQR2b1Xr/qvo/8H1PrV8Z?=
 =?iso-8859-1?Q?qmhYBVC+KxZBjtYGWnnjeGtyvjC5Oi1/pGZF2ewbcVtSY35EjNWiVt3BVk?=
 =?iso-8859-1?Q?kGydUx21g5tugHs3ooRY9oQZGruq8kRDcSBo+PMsIKCVycbwB3qLq8Ta7i?=
 =?iso-8859-1?Q?ySMroZIU6M3Xd1PjCE7aeyDbv1VPoGlNenDIyClmNHsH/ous0lP/lqhysX?=
 =?iso-8859-1?Q?g/VnTA1WChWNIwEdJf8mHv3ZCZA84/32LDNpTDauWgZEz5zpBvA4D7EXuj?=
 =?iso-8859-1?Q?xS5xEIs9gV4Rp4si2V2AwgS0LgWk/T2ynBRgVHca2zq36nMoZtAWAu80+p?=
 =?iso-8859-1?Q?irSq4ystUv2RG0QmQGwdtU/eTsjD1RCN3YMJBTUF5X7gTnumA63dhan1eu?=
 =?iso-8859-1?Q?pmLfsDitmxpHiQ8Xm09tEDSCKziLSrlpkIyCM93O7WFpahmR23rbO8/oF6?=
 =?iso-8859-1?Q?0bosdf3N6MHRSn/fCnX611vhXV2DE+v3nwMVontpT2+Mu/c3qI6mK2/K6Q?=
 =?iso-8859-1?Q?uLfBRI1noB/2ts7DtLjfybCp0iG2n46fJIMEpx5wwSsROcVGwpgPI8Vtbw?=
 =?iso-8859-1?Q?N/PWU9CfhYyJshJmfItYseYKEtT3KJ+HVZrO79HnZVUtz6IFhx3VkUdWDh?=
 =?iso-8859-1?Q?thlNYGqsj/meajgLCFO6HdAaAhAIKv4o++xHHfcnIzQOHtiCJYRP?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e38cde08-7a3e-4102-d992-08df1bc27ff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2026 11:37:09.3768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 213667ce-a7c7-4f7f-ac87-9abccbddaa2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ozzs/OgLphxme+dseFlNRLXg+18YBshScxfTKKDOZeeVO6rFId+hBEDazPn+f2tp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR15MB5896

Hi -=0A=
=0A=
On Sat, Sep 26, 2026 at 10:27:14AM +0000, Mika Westerberg wrote:=0A=
=0A=
> This is the smoking gun! Thanks for taking the dump from the other side a=
s=0A=
> well. CM guide actually says we cannot enable CL states if this bit is no=
t=0A=
> set. Can you try the below patch (without clx=3D0)?=0A=
=0A=
The patch works here with thunderbolt.clx left at Y.=0A=
=0A=
linux-omarchy 7.2.5-4. I built your change into the 7.2.5=0A=
thunderbolt module (usb4_port_clx_supported requires both=0A=
PORT_CS_18_CPS and PORT_CS_18_CSC; the function tests mask=0A=
0x800400) and loaded that module with the clx=3D0 option not=0A=
applied. The Anker Prime (DROM 01ea:83b5, NVM 62.2) disconnected=0A=
when the old module unloaded, then came back once:=0A=
=0A=
  thunderbolt 0-3: new device found, vendor=3D0x1ea device=3D0x83b5=0A=
  thunderbolt 0-3: Anker Prime Docking Station (14-in-1, 8K, Thunderbolt 5)=
=0A=
=0A=
It stayed authorized at 40 Gb/s (2 x 20 Gb/s). For the next 15=0A=
seconds dmesg had no "TMU: failed to enable mode uni-directional,=0A=
LowRes: -107" and no further thunderbolt disconnect. The dock USB=0A=
devices enumerated and stayed.=0A=
=0A=
So the patch is successful, I believe.  Thank you for puzzling through it. =
 Let me know if there's anything else I can do on my end.  Cheers!=0A=
=0A=
Kurt=
