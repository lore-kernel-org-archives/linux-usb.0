Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazolkn19011030.outbound.protection.outlook.com [52.103.13.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0C038422F
	for <linux-usb@vger.kernel.org>; Sun,  6 Sep 2026 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788696891; cv=fail; b=jk838+wrmHz6ASHccG8RUf4mj475Ie3RAae9/faRCuKU/Fi8SS8UL9wuVc8uIMIcsNC4m9XhQE+E7IHDyL1eB4K6yojmH1SpznKfIJR0nvNAKYBoLOgGuDdW9zbB+TH31rKRLTK7cJDF3quIH4QL+HNO9j3514XZdnUSBOSdsCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788696891; c=relaxed/simple;
	bh=8ndhZ1g+SkN4mHWLW5GXOZd/QZbckBAkM8ArdDwyxlE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=g8+mlzI81RUGfPvN3vt8J40Xyd8HilQsa1auwoFDqAvpo5okN4XhTaRTzffnpB8xWHt6q8HnH6uEI21fy0CXMWMAZhfMJ22zufLy9duFl5JKNySuevDN+Ht26Lm2mgoVqd+XY4zOcCJJgWfODG/Dh4B8I8v8gPgo8O2JgAO0qmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=bZa5t5Zz; arc=fail smtp.client-ip=52.103.13.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="bZa5t5Zz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsY6oz+5OquvLJWBj78YSUeMKU42Smul0zFYrV6gF5Qx/R4XJscLOQ/HmD8vlh65XzBWWowW3ZfGkLpN6YsaenxLE460qyqCN+e1dZv9EayMFRHzSvYaiSBFDoxbP83bm00i0K5cPhY7avdkn8T/MCrrFNtZIKFYEJC5auHlhvaYSmO+M13RlBZtozPuxQVPpVG6SSHLmZj/a32ORv2DiEo7zKCAVc+C/j9ar0seqgQjjl4AVSuaL/8Mg9sFMmpLq5GORxPSoyyKcRLo35uzh+cYocux9h10FJ7XarkHppZtGRaowoEptN5Epb0eG8pS+mqSyORUPuT3hnJK7JR9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ndhZ1g+SkN4mHWLW5GXOZd/QZbckBAkM8ArdDwyxlE=;
 b=myheomL0m/34ffR7rjJR+OPHHscXh/YS+/SKT/GRC5L2J2QNu22oRaRxod6AuvOTJpmJUBvYpzElKZ6+sbIWLM4LO0AmKExq/oG0rs+Jg3UhWwIrgpzTN41RExFeitaMn9/0K/3b8RJHOuGbQ9J+9H3XzO2PfHkGIQRq4vfIufd1NaB0DTjw+rwBHgMh3uxZcU6yAcIaMCA8sy7nDJI95ame6EQX0CybcpzN65fSg5Q3wEpNOd755ifFxoVLvb/k0eIZf3uORYKSSbWGJ49DmXMh//DwL0iyjh4iDk3Q787Ut8pMPpGp4JW5JbJvOiZZHHAj63bxi0a8rgsmS356EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ndhZ1g+SkN4mHWLW5GXOZd/QZbckBAkM8ArdDwyxlE=;
 b=bZa5t5ZzCOeu9tioWqprLrINzSr3htDvYqXYr+WFLWZZV/Q6dobOFoxwY5dg4Goj0edhztmhIrNd7Tr/Dt4+XQLikkxUty9p4ZMuVOZ4sj58UGdp3TjqwF2m68NRt4u4CbeDMWgyVZlJ1Z3iAuR0K64QYKj1Z3g5vcTjlLryACQlQ4EGIC2aTO4GNo+fM9xM7updU+DaQD992l+AUq4lxQXxd+NHPky4OGwzyhaOnt3JTf5+zqWLTrsMXDMKWrI3rjPa+X5+lXIVDzKoBx6MdQsaH56yETkBhjgzPzAfkOfA0nG0bvZF0+g1PlxnFjwcgF7V7x2PtP+UiWURVYwmcw==
Received: from CH3PR19MB031019.namprd19.prod.outlook.com
 (2603:10b6:610:34c::6) by SN7PR19MB4782.namprd19.prod.outlook.com
 (2603:10b6:806:109::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Sun, 6 Sep
 2026 12:14:47 +0000
Received: from CH3PR19MB031019.namprd19.prod.outlook.com
 ([fe80::9386:4a86:e374:afe5]) by CH3PR19MB031019.namprd19.prod.outlook.com
 ([fe80::9386:4a86:e374:afe5%6]) with mapi id 15.21.0382.007; Sun, 6 Sep 2026
 12:14:47 +0000
From: Princeton Rice <princetonriceyhkg@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: zioozljxkunlyyszprpg
Thread-Topic: zioozljxkunlyyszprpg
Thread-Index: AQHdPflOb7NZjsm5/E+Lr/BvCd7JyA==
Date: Sun, 6 Sep 2026 12:14:47 +0000
Message-ID:
 <CH3PR19MB031019B15E186CBB3E890D95F9AAB32@CH3PR19MB031019.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR19MB031019:EE_|SN7PR19MB4782:EE_
x-ms-office365-filtering-correlation-id: 966c92a1-3a93-4ff2-45ab-08df0c10716f
x-microsoft-antispam:
 BCL:0;ARA:14566002|9112599006|2604031081799003|24071999003|38102599003|39105399006|4140399003|6050399003|8062599012|20031999006|19110799012|22081999006|8060799015|31061999003|8040799003|16045399007|14065499006|3412199025|440099028|3420499032|102099032|40105399003|11120399003|3430499035|2607281247196008|10035399007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?A9hZ1kX0+bFy/XlOZW1a/GbXnnlwSted7IFEiKDkOSBASZLszxQUtJ9oJFiI?=
 =?us-ascii?Q?rqe/C3h72dxILsAUSg34aGXDL+Y6IgDPMrLbQjnu5dfeZFHt5VJo4ngxQ7uB?=
 =?us-ascii?Q?4E9AtcDJ7QdF4snuwU1xCQR67Wv74coOv2WFXxKznzZ8iOBLo0nNQZChZLTk?=
 =?us-ascii?Q?LM8BS7j39wdymvLiHkHLa3Pf9w5EMJcV3rYr+9EwfQWXXh035O8hYH5oSiGS?=
 =?us-ascii?Q?JoZjOcFe2LVMuINHtASwT851b3bpwVVYuHJV/TxFac95+TIdV0/xCAKUK6cn?=
 =?us-ascii?Q?MztsdoPCuupKlLomY5RC022WnDrHcPdthWIN/LaXU0Fxzvdy4UI8VGRVgCxy?=
 =?us-ascii?Q?uR/N8j6IzvwubtNFESSPiqXJaJKByBHBXvHiL1KhRlah+W7NHuhMpidsYMfe?=
 =?us-ascii?Q?t5tI1whqUKIM6ZhGbFtJX3JztbcTvLCumzLomTxNilQLn7g937CCoyD1qBfC?=
 =?us-ascii?Q?ppwQxsG3cf17n0sbvm5U30YwqPWkc8j9ICiUeOJspTNf1N9LGnD8lNlKT0p+?=
 =?us-ascii?Q?ZfTsKH4JpcefaCFoBQSdjnVdxMAVud5mMTcnZq0MOTmV1bvLway8GDn6wtTr?=
 =?us-ascii?Q?KLtxseq5tGnP/g2x6xXU0L/sUOGNXqOwfqR9MlEw744nrB0pK7HGbw5LuJD4?=
 =?us-ascii?Q?1jpHw7mITzsxzmPMGfUlcYa8VC9/96JkyKu8s/+XBQYUEAUYwKpc7fp2Np88?=
 =?us-ascii?Q?u5DoSD1D4k795aiYYm7zH1yYYyn/KJkFnbzzShZqvEjF1XcpRrtOEDd7an3l?=
 =?us-ascii?Q?v7gBVlCt+O6rEQqsGBZDWKL5m9huSuBTBj7M6vLGdePflOqtTmry10DyYAE/?=
 =?us-ascii?Q?dXj75XV63ibv7P+9+XioGs8iL1L6uaQvp7UruaFeDHcZ60FaD9bPPMuTBGX+?=
 =?us-ascii?Q?A566UqEm63Mz/yQ7C1TxRhfZiwugAZNbxyv8X82i1MBf8e1Vi17yBWmfnV3X?=
 =?us-ascii?Q?LsnE3LUkWNlu3E6N2ze75Xq/lIVBLrXPFv4vCretRVp9faTJ4lYDYrgVZudk?=
 =?us-ascii?Q?9jgYxhpya8WZOt523g+1iIYRfeJdU7/xwkmO3MRMfYCJJ2aGpboc+RGnoI/I?=
 =?us-ascii?Q?cKy9pXRW1jqs2dxAjfxpBWPKTW1Jkqcf+0i3cNiCHTDvv6Rn+nGTwn48zhTu?=
 =?us-ascii?Q?FIa4s0O+8kpzqBSsCXeVEMMszW8mzzj46w=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1xAVo/Ri9l0f+2oZZjSoL6uaR2sagkiwLL4tI20AUEmtablbpO2sE3WJq4IM?=
 =?us-ascii?Q?4105ZEyOcV1L3FERllAdPWtNE5W6mwoPezeRk2w/x3vySFBoTmuD+QpAoTBb?=
 =?us-ascii?Q?FCLoK/Wmn3Q765vaSkCkWKW9Tt+AmU6ZoAR2RWxFINyG7C5lalvrIfsbV7Jq?=
 =?us-ascii?Q?rx0Mns3xNnHteIK5SjTU1cD0NIlO1eiklqyP+oxB5MgB3xS2Vx6EaCJDLl6A?=
 =?us-ascii?Q?ApdTWxKCXzEoveW22duYW2WP1NiMhs1WOHPbGV193EcZaw5mq1OEv/s8eUbA?=
 =?us-ascii?Q?FaQyKMosVe+ygPKDPUdWvAdO8ktCfYnaEcUJsxMcYm/k2IeSzdtAfDAtBLiV?=
 =?us-ascii?Q?5ZrjvFd0J1HZPCvkeyCYbcO9p6y95Q01Lw/FCgKOggXT4qCLhPs5UOdsQXkv?=
 =?us-ascii?Q?4c3mTp4tg6hcfR79BCknOZ3tMLEmOWZ3Bbi3VDAhY7l/rtBPZDYgUoUSIuPR?=
 =?us-ascii?Q?w798PoGQw9gWv9Ok1iwZgvo93C2asqPC/TYz5+oh/JPAX1OQIeprmB/pYLMF?=
 =?us-ascii?Q?1NSWWnNBLXiWxigH1qzgI+1xcy9xXMGndlznen3yxNUJRT61p+tJe2vrx9iG?=
 =?us-ascii?Q?nQEUNoFy7kcyUUfA4uDX9Z+C5KQEp+MfN8NHt/G9uW7x66Ek8T0fdJxC/jPg?=
 =?us-ascii?Q?ITjPSZuj4zAPy7OoGhFnBCZLb+9H6TPgd47mrcTF+of20SClfXpN+vt4b4DD?=
 =?us-ascii?Q?iK+9ZbyIHB9xhpBL3CgtEFJLWy7c4GJnjXPte9JB4MGCEBW/6CN093Eg4sRu?=
 =?us-ascii?Q?HftUsrjss9czqLgGiyt6F0INx534srHZbib4VpsUFn8jkmkTqlY7qLbeByr0?=
 =?us-ascii?Q?+pIQBc9+2f9R6wdn+6b5TTAm2Y8mQkzoDEFJkU5BL9tF07pS1uhPXKOWZXKk?=
 =?us-ascii?Q?mpgr1rCHtwBxwcwPdhIlEHgykmmbScRUTljXF1ygKSSRgZzbaC61MgNUZQIf?=
 =?us-ascii?Q?XKeIkVppQFt6xIria9p0Nit5fSGjSWR1bbNw/eaWu0wfCohGfdmkcZKNFHJY?=
 =?us-ascii?Q?iSohVCsGqF7IPqgN2bGsfqT5UnhaKirtcr1qyq4ELL3Vc0tAYdB7iBb24pUI?=
 =?us-ascii?Q?ge4o0oYl/EoURWrViaYvpuxLQnlXidLKEX/fpEnTL3JuimXuV4yQXf0oR0BI?=
 =?us-ascii?Q?Uwlnkv7aT0FoGCZL+5/2/zu038dQKapeM60D65Y9ocL5xnMCf2HXgkm6HT4b?=
 =?us-ascii?Q?3NGhZ6JEJQuDlxVYMTSvNY5WXHMJHcE1KMCQ5u/2eXK4K8eCZypoiV+CCXf4?=
 =?us-ascii?Q?nw5FHuh42X8EIPPlWHSRA9RKFpCevDCRZgM5fDhBwTnV2MUyqnwT8VD0ILqC?=
 =?us-ascii?Q?2VfdQqJKd43MUQT/m7G5mrDHwVg0N8tBk/kaqNDXxsgVezdonIaEYjmNaJrK?=
 =?us-ascii?Q?8ijDN8QAdK71gHTv6Ogt0rIpbgh1oS6uZLxco2vvJIHXIAaYjg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR19MB031019.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 966c92a1-3a93-4ff2-45ab-08df0c10716f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2026 12:14:47.1925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4782

iekkhnj----real...news=0A=
http://207.148.90.61=0A=
fwamiayejkztkn=0A=
alive time~2026/9/11=0A=
http://----hwdrdhsrrfsarils=0A=
45.---cslyhokucitxezwxdkuz=0A=
77.---lzegcjmde=0A=
40.---oapixbaxcimkzsntwfy=0A=
60---pqwrsnmdtaspc=0A=
zogudq=0A=
