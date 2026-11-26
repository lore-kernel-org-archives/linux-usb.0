Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795682126;
	b=srJTrYT0cIoX7FK/m5S5bKf/UmJ54p9TVLUNt7ZZ6kU1tEQwlJy8kH9f1G0i4OMgP0eF
	 /wkXFDIdmjD4iZweCKGjIE3mTJvfXqLgDQ8jkL8MT6z9vSe/Un51CV3KLWkGwUOd1r5fl
	 5JbixNDSGx5Wph1coXv6KtRnlLcWmUpxLf/MEV/7PF5qTRAvs17FMtBN1hVhIPcmblCt6
	 ZxkRGRU2aozOddXqa+UDv2nbUx4XmhO8CHPUQG+fA0nHPGt7nByFDksdnRS7EIqeHsrlq
	 ZZnxh5zSGGbftKvChwclN86Wh14fWUhG4GzdaiEeYfOn9/2hpcrbTj2P89H7o3LnxoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682126;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+ecS5e32+Gze/5jbWynpzciRPtFM/Bf6pLZbcBF0Lww=;
	b=kZSdPoGA0zu6xVL8KSzxQTFmFm96p0Mo8nnA9uKRujgzKuX3DrW4zLZ+hwNyff6ReeBc
	 vk5qiHFacJFZ2ZdN/dsSZZpHok1woFo+hvn5bvhuAoLEh8M5BX8gxWXrw2v1wTQEkKyuO
	 86Z1u01WVifEvPA+xxg5qdj90bNYWzwSJItRJfDOD8Q8V4JvIiTanFvu1H+r8hmi8rE9n
	 UMe+UyGSq8wzsR3jhTKd8J+QN7mALpZPQfV7U1pGiQgueyF+Wn/W4XG7bETYaKyY47QIi
	 819lce1UavRfMbbUYkuDNWfk11AlQCgAhxmWI1wfHN3i8epuUsRjNNEzhuHO/AcICng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rK9X8SH7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.63
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386FE606A31E;
	Thu, 26 Nov 2026 08:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rK9X8SH7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pLmkcvrHASX0NfgDmge0ai1/E2GNkPNvGd6fjxUIZ9cjLIg6mTDyD0JlWVr9r5HBUTvmvwVGSEYDG6k/V1V0T8BtiJD3n/oOPSvc0m10i/ZL9K1TxvBbyW4de2+yPXBWfCZfeSv9jGjudW3CuNQjsQduyg7Yi/DeQmpvoKQR9qWGlHmPAFS9g2dCkvNoYeiponNHAjgukVM+Z1+9KOTNY84/7xFTTAHl1KDsfhEZevAhlPCyzvKpZyCCC8Hg5CVC37xZ0eOo6Xgj+3shXKYUVjGzdxsKKDVLfQ6sZWhzStEObST8TMPU5ZR1Ubnf4gkZzvB+sHh0kviF/PMiZ0zq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ecS5e32+Gze/5jbWynpzciRPtFM/Bf6pLZbcBF0Lww=;
 b=ekZp2zJhp2uhkrIzDucnKWecxmi+heIh/1ELRJgN47bw+avTlnchR2/HHutOyi90ZzdF0scFl8XjqAEr3TAwG2PnNPLejSGTv9YbI5E691vIl1vPXILMhoCUMPm0XLPn8g6GtVLb40a+8lyO/StX89bnApJLChbSSbgWXwOi6VbGdLcCCTO7WLNCo7pMeEaR9Sq5WYPgo+5x4xIjWj/z7yytzI/sRpI3V8byzYxPeDJsCxKdPdfIEefir/PocktHEB+mXygaxK8OU68g1T41biV+j635J6j3wl+7qNfiqmDPewhG1Vdwq/+UEH3pGm9GInL7dfo9fyo9LJq/dZwTQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ecS5e32+Gze/5jbWynpzciRPtFM/Bf6pLZbcBF0Lww=;
 b=rK9X8SH76Sh3BriIBcL4moPHrCIo8gGObHzV/MnUoD9iMTrlX7ZgIatSuyIC0QAQSdI7LhV/F9tydvKuFeiPIJaFgW5dF4kjnoz6OxqJUiKAJ/3Wb4OIQiT8PKtEszNmwJ0OfPOaHG5bPZeI3iVNNPNEGoh75V1mZQxlFILGWh7gPO7m+LZgqMbwLgzRSsFSgftZjHfwBYu0cz919znTCv0LxkTJexX92RsSaqZLGWRxZfA2PZ9lYPtxrKu46q2s9sWJ+SoxUksmMVviQG6DraPWtb0lbzoyMiXZICJRElwol/dgi1OtCl8UPLokzejggN0Ehtmb0Tfs2lKs24cbdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB9022.eurprd04.prod.outlook.com (2603:10a6:102:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 08:35:23 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 08:35:23 +0000
Date: Thu, 26 Nov 2026 16:32:15 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jun.li@nxp.com
Subject: Re: [PATCH] MAINTAINERS: Make Xu Yang the ChipIdea USB maintainer
Message-ID: <iksgeqy53mhnbjmv2wgtcpufu2qunivlvrnuqnempp3ldktoqg@kdcqp7ncnc6r>
References: <20261126072437.4037678-1-peter.chen@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126072437.4037678-1-peter.chen@kernel.org>
X-ClientProxiedBy: AM0P309CA0001.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::35) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: f356e6aa-ba3d-4a3f-e4a2-08df4b983684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|366016|10067099003|56012099006|261028144727099003|261021121427099003|261102123227099003|261022075727099003|261022105027099003|261026140227099003|261021123027099003|261026121527099003|261009223027099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	O0omYV3X5HTSCyCh/2UctT6Mj3r848GqA0W38DPDObv2cmKEvq+l8vtnh8pJZ9iQqCk3VUaOKKE8Azg5Qrc+IeunF3MbdbNSiGYxFsWKTRPrCakSQDMcau4NfWp/VEgCa8pj8PWiBK38Pzx0o8HeKlkn/D9ZyhUoV2Ww6wd2Rjn+/7lZodNQKGHqkGyyVMixuXLrtq+qUefnfNbnbR8RA5CZVg+pxH1eRTgVLiG+uLcT9kXeuOWi5lUDzzLKMzwK6qqjutyc/tBQzGfUvVZSnikFjrh8TlMWnVIFBDsn7f9JypdBkLsj10U15LDu2PkBkKyT54IFVCDXEKyJc7VW6taJPc4Eee/zVMg56smgdgdgsk81gTcKovBnfRsgCkwboqhvFlQZJfxAWOyRlvz/saORZf79hjD/Pkes3YDS2Nzt+aFRVH2RPSBpRBs2+tX0LimRXTz1dV6sg1kAvwXswRJdKMX6RMKhz5gcZy3+NI+ORwIJZPCV2GELCF+WEKbjWJgRra4EMDbdfTXBuquv9L9m59t8Mmkr2I1NpTXk1F5k3gxlnqKVf+aXKOTPr+mHyKmnkn3m3Cg7oBGJzLaQEI//lG9JQw3GKFa/j7b0uf64gKG8W2ahyBURlA1nGCJT2mn5JuVxmVaO0G2iW4djAisRXpWkD4QZvv7+ztFzxSQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(366016)(10067099003)(56012099006)(261028144727099003)(261021121427099003)(261102123227099003)(261022075727099003)(261022105027099003)(261026140227099003)(261021123027099003)(261026121527099003)(261009223027099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OGLXWr69GmZyyv2eMMKkIV65T5tiWeMmQXqeUruy+d0wX6/UQPAuyURWIqxY?=
 =?us-ascii?Q?kE8x/b5LGTyWZd/oki6Ejprzo+rtOkjREtty8t+4ipB0ffN86PgRJTl0Xpku?=
 =?us-ascii?Q?oHHuy0QeWQBgVQl7hs5QIhrIFpEK8pHrtEat2UVKA8FhRoQHRYlqpWkIxD+z?=
 =?us-ascii?Q?7OIgCxz4VCpzKWMPFGYCQjVJF7k3rVXoctf0fVj+hBBBwQl2XS28oFq3a4vB?=
 =?us-ascii?Q?14VkwMWycMH1V0YYne25Kpg8ReT2I/18b5oNf3sWoR9DFaq2tTXERMViUFEv?=
 =?us-ascii?Q?3Dd8wwV400orqY33MnDTGuNlE46OumVRDQMFlq/EJIKp4JweYSU40MtUNcgU?=
 =?us-ascii?Q?a+zlfmXy6VhvW5gEIEihTRnNXouDiPrFccjnzpQLA2L/2JloNMtokchUeoC6?=
 =?us-ascii?Q?cDBY578sW08Yj/BsBA/I4A7VBgazorYPpB+BbwtVbs8gQMM1lL57dKmtXOBQ?=
 =?us-ascii?Q?DILSv76dGGHxgaRxnGmf+5QN54ehAyYouofxU9ig/PkhuybjDArKs9H4rjPa?=
 =?us-ascii?Q?49hGCapJourARY5ISpx14vSXMeE5oCfpAEvTDkYew40K6kjwJWl1+gPDlsdu?=
 =?us-ascii?Q?WNJs4ceddsPfhMSpPk8AjlaI0iR56Lo0x6jdfyj7L2oBMSdCvIhZiG0EQoq4?=
 =?us-ascii?Q?+z3aeoKbCJZRhoMphAoej6qkrQCW4Yx8w52NM6EEblMEAnYV5OYbdURZJy/r?=
 =?us-ascii?Q?O9iz7Th6RPBCsl12d9xdoxOobvWhQvkVWNWtWjIRDUEwtIHFCWIOKewx+uH9?=
 =?us-ascii?Q?BZcsKGxwmwtoy0JXkjJaRysaHpBBGU1mza3ZVXvNThKgS51hOv6Y1Iau1q6m?=
 =?us-ascii?Q?SE0VkEnh5GfqtdG9BPm70PoXTTct9Td6mEpZaQaO1EoCvzozjW56JCMxaB5R?=
 =?us-ascii?Q?1oAcuymRqj1suN6vfpruV0Yd6fBKaeQ/m5EfQNhA3OgIY4W1TMjCghHtk9OC?=
 =?us-ascii?Q?kCy6Z4BA+r01rpT8MdI7ij02vMAS1rjqedzRBvPPTQlV8DHnQwp6gid+yXCH?=
 =?us-ascii?Q?bz6xhZc77FUaD7S7ZBWv8xgAmuysqrQVibSU5zIZnnyqGtYUWruMTslpa1aD?=
 =?us-ascii?Q?D5zMmHjjY5liKjIyD7W3a6O+EvgHZArmmphTSSCEU9eBc7yN1E/TMHnK/fDT?=
 =?us-ascii?Q?83biythNNIPXYcoQMEGjP5LqNL2F6Z5WL5Z4KEqAz8hJXYICElI6Vg996ech?=
 =?us-ascii?Q?jiLRp2eOBfcvU0N2VRRj8ak028XnviAqwaIiXDaA9lVWu6DwNnr7JvUlyCVV?=
 =?us-ascii?Q?diZkk4iilLY8eqXIok9lM5MSbmm78kqVDaQQgZTPLdO30n8aJisKUUcCm9Kw?=
 =?us-ascii?Q?M+4W0K7rhhWw/+pS+8G5jMNlkypwyd8hDB1Ekej0LjEo8lSQ1UW8AoDMjwwJ?=
 =?us-ascii?Q?tTDpLhZ0Mg2AE/RP+Ac7swuOQbCndKTtB9Yd8GmnEIIVJL+nANhCd+7HTgIh?=
 =?us-ascii?Q?spPpVl2ggxHuhpOhzaleWQ2pXpqVQO1JVATXh9IdZMzUrSDOVRscyoeL7TWj?=
 =?us-ascii?Q?whj5fbV0v419RyI3x1cfiX2zlYSuAaVzkRpFnr7Uhl9Js0wczXO9EZ2eHaxv?=
 =?us-ascii?Q?n0DcHOpfBEOVxxnZjPzOZ0+4v+OJ95xvmIRmfbLAOgYU2oL0AfXy/Wr/qGyo?=
 =?us-ascii?Q?AQEMGQwM9XL5uZDJeOx5RWt5WdXA+ryS3RGDNewaXpd+Rwhhw+CciQzxFR5y?=
 =?us-ascii?Q?GnvlrsXcyTG16VTkA6dJ2SxjchTiEE4aFi0ODtKBcEJgEMf0izv8D/pAwhK+?=
 =?us-ascii?Q?DH5stnJVL7/AapyhFapYUns21538qGGn/A04lfil58UBnPbvqfBu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f356e6aa-ba3d-4a3f-e4a2-08df4b983684
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 08:35:23.5785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbVuqbHSS6CUL9ZdTXq0mhB3eyANGO9J7OYZBF2x5MI05NIsr4RoLFCLByEAnm4ZpCn4sBClz2WzzLwuKD/C1NsqjK3L5DHdTwtn6NeotjWHrPWswbhb+vo+iuNj9/cm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9022

Hi Peter,

On Wed, Nov 25, 2026 at 11:24:37PM -0800, Peter Chen wrote:
> Xu Yang has real ChipIdea hardware to test on and a lot of experience
> with the controller and driver. Make Xu Yang the maintainer of the
> ChipIdea USB driver, and move me to reviewer.
> 
> Also remove the T: entry. My git tree is no longer kept up to date, and
> ChipIdea patches will go through the USB tree.

Thank you for the trust and for all your work maintaining the ChipIdea driver.
I'm happy to take over the maintainer role.

Acked-by: Xu Yang <xu.yang_2@nxp.com>

Thanks,
Xu Yang

> 
> Signed-off-by: Peter Chen <peter.chen@kernel.org>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..5383f1070c81 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6281,10 +6281,10 @@ S:	Maintained
>  F:	Documentation/translations/zh_CN/
>  
>  CHIPIDEA USB HIGH SPEED DUAL ROLE CONTROLLER
> -M:	Peter Chen <peter.chen@kernel.org>
> +M:	Xu Yang <xu.yang_2@nxp.com>
> +R:	Peter Chen <peter.chen@kernel.org>
>  L:	linux-usb@vger.kernel.org
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git
>  F:	drivers/usb/chipidea/
>  
>  CHIPONE ICN8318 I2C TOUCHSCREEN DRIVER
> -- 
> 2.43.0
> 
