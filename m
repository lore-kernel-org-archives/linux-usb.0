Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795681789;
	b=AGn9aQbbvHdK3OJIbW0zw7Kd7AN5NCS9pyBIYsLyWmIFCQDRLqi3KUub1WufQv850YOd
	 AlX9WVKSFXHSvSmbyUJ50zYcPRuihymHj83Igdu/kU3bN1Mjh+x6tqUaiIkaBxD/vAerk
	 iaHID0e4ib7tJ9V1pEjzgnb/LABOZUj1uKhOudWkTQURU7iEmr1tonfpF1ft6mCz9ssJd
	 gb628i4L9CAFmi2V40z29WinXfzATiQtgIaPb+KXiWlHI0Nkn6ZmE/pqvAyD0HhAfTsZ+
	 yYo45xdQqAu/qFaGIY5li26J9gIOqMo0+nKEBK1Xwwxg/c2pdOqYt3T1gmuu2O97Zdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681789;
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
	bh=0/lRFC4nM/TnjsTW1KqKxTghCQZd/0+EkDaIrw/8IK0=;
	b=0RxDbI3HkQ1dlyxTiiJmT7hEVFd98eGoTZFs6O5HqJpQ24VM12pqY9+C6UvvjdQCHirc
	 fismBSe4aE5/yTJhNTxyWd4yga9WKpyyk1zuLaMKAJk6OCq1JsotqU4jdfIyV9+JWyMmm
	 RmPO5Juj5GbR54WrzkaHOZkDJYljg9wBBTncHhVDFN2TSNx20clRvWJa6MTIZYNkpw25p
	 VUW1Cl6Nv1LkX4KCRWwMCaDZtmyLZ/elcda12JvLCcAPDc00dcrjUL/SiQFs70rHvpP61
	 AArqP249Tg09x3vKOF9cIVXMEqP7Uhl3S8pyq7QDx09AGMge0b7KdG5tX2SNsPtuu1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ICmlWLB5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.36
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F74606A329;
	Thu, 26 Nov 2026 08:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F74606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ICmlWLB5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tn7/6amrdTwHrLkOlVicfdmFlc0UeuZeEa3gS5k2aRQCJy9ZeraWEFrF+7SOQHgYzWbHzvffZjQk3kKAUJ8jLmUY3u/BoMMbtu/DsUvRnr8stG/0oBBanM+zBDq5rx3E1yYlFxl2llIZVK6AbGfbo2oVG51ChUj3G0NgvQdHmxxZ7VqWfQmoTqGTdL4H8epzBd9l3MHqJISr+A7ffxksGeAwV/TRp8Gw5KN4eK9ssW16xDYLLHo5qirAjV4iMOHpIV9Y75TeNeHpuIZbJ3sKoBqIDZ0sDOQuuVPByk9Y2RM95vD0dVoKsAYDgZzjH5a/HH5FvwFctMq4soLlsU1rTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/lRFC4nM/TnjsTW1KqKxTghCQZd/0+EkDaIrw/8IK0=;
 b=xRUBg1Wj049YfWQQfc0H7OD3u1rFGWuqy/fvcNnpyVhMwAPh4YlGZxKBK1hk2Mk+Tcz+wfwKY65PERfbmP7bKzTfUvrDYTIv2XCnjipwvUOBFaSCpVFNm+CvjzUgkSrn2gG3Oiwd8qZQptk6ZIFevJ+HCrKaSxqSpqx9KOk41+YEDDJ8tGjMZKHmRbgXSx+LK6cUpLsU//fd/QCt7BqPoI6YQHFjZtqQrvWEYLqehabBet4nzHHJoLnMppuRFP/OveWm8sAnzdTwECIIHttDKXfoW9FesehfLvPeK+qiqsMkiRfyrwDX+IrfZUH0wyTKuuotNFr9CIdaup2/0NNRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/lRFC4nM/TnjsTW1KqKxTghCQZd/0+EkDaIrw/8IK0=;
 b=ICmlWLB5FS8RPhMUM1twoOIhLxSEcbrhqCj2QnYMmb/AULgDsel14D8jU5sCivOOBigGBCIjhb8tHI3Os4+zKyEwZIdbxSAZwePBGG074numLFKqfzhpWn5mjyOc16T+6N4x5UA+80gQPk05IqnJSp7rOq8dAH03Tecw4bqDnX3eJ3PL/Jm05tZeKH/S2rvTk1q8PJN7erf0goYNprMfkHlKz51xKabOCTg2sWU9e0iXqnCegvTU9VpPUHb5YQw9SHGoHd32UpSWzYnpQxEQLC6uYCFPZkVJrLOmf3B3epuwFKO3MP6OydVeJGvN/ax8pfcbPWFQBGchuw2opWrNyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 08:29:45 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 08:29:45 +0000
Date: Thu, 26 Nov 2026 16:26:37 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: "Peter Chen (Qualcomm)" <peter.chen@kernel.org>
Cc: gregkh@linuxfoundation.org, alexander.shishkin@linux.intel.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, jun.li@nxp.com, 
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: chipidea: stop asynchronous work before destroying
 roles
Message-ID: <bh5cdyila62kqe6zrdiqefa6v7qwlxqg6tcwj465nrg4pujpnh@3ubnbgzycuxg>
References: <20261112092556.2747348-1-xu.yang_2@oss.nxp.com>
 <awfI3W8NDmuasHEE@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awfI3W8NDmuasHEE@hu-petche-lv.qualcomm.com>
X-ClientProxiedBy: AM6PR08CA0008.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::30) To PAXPR04MB9422.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS5PR04MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: 07cd5bcd-476d-4dfa-b09e-08df4b976cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|10067099003|56012099006|5023799004|11063799006|261021123027099003|261026140227099003|261022075727099003|261028144727099003|261022105027099003|261021121427099003|261026121527099003|261102130727099003|261102123227099003|261009223027099003|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	/pQ6nS0J3py+rHXqrzFvUcipEsekLTrA5k8vaXaYxqQ8idb7Q8I2VHeorK5HBi3a2vnfiMRkLujqqYRLjHBWpmJA4zBpNHGIq/tJGfFo2iIfG+elYx8UR0lYV9Ow9hUAcWmxxg+ORyEFVAseN4wgCuAvtJWRgsS4Fbxhymi4Wx9imMlSwMVeF/SMFbYgPfue9kgLWKZTk7yaNi9onR6b4K9MqBAK8vEjiHY86ALQhOk9pn+KZBcQA2ka9QKQleVICoFjYpH9wNeVGsZhkZQhF6ufPA+S5T9hO4XJy6wmlkd8CzxcoaPnYi7OxJ6qsYViW/LHkaJvCND7sJSZWghpcCp+7qdmgcrKa31O+ryAjXYl4VmvklmNbBIGnlAAzx0E0azG1OY0jh95mSfAMsm4gjeosWRXo2uqJeDJ6MzZLhMovqap48ToqOJuZshum+kG5IrcXQGbQbh71P3L2DaVtFuMwOZoZ7w85a99iK8e8W81g/W56E3jGHh9TiEyP5WiUK+Ca2kJdWCT5HlF9wjmXfsrNeOFv4NYrHCZQtkH6Oahl5UyggzW1zHYg7U2172Dh5UiQ9GproiGy828C9bAnef8cyRYi3MqrtuDbtrYlb9mx5u5MyjL2Z/zg914uVfESmaGWtbJO1F81vwQ5PvfJ5fOUCIW2AiUiPfrMHmQg0Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(10067099003)(56012099006)(5023799004)(11063799006)(261021123027099003)(261026140227099003)(261022075727099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026121527099003)(261102130727099003)(261102123227099003)(261009223027099003)(4143699003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ilWUOV9cmEwadO9xkad1mMxVWBGGtKwf4F5DDYJpSZSEpiSTQ5iG8hqc6snS?=
 =?us-ascii?Q?bFOqUoZJt4Jl64eaMCO1rOXbItm5Zxu8h4D9hqLkdVMyzGlbKcjY2s5DIIam?=
 =?us-ascii?Q?jZOaiFbtFkaQ+bsz7KgfsKvDyltlL09HPlLZxQACJ3wsOJmb2wOICHh4+9VK?=
 =?us-ascii?Q?O8Espav3/QE0InNINsPgSSwnxv3xmnJABYkMG38d6j4lu+ZmwQmOHjzdcB2F?=
 =?us-ascii?Q?FotK6Q3TrtoJh+FeQIR0ZtLFlJkq4itqB/Jfg1ygLGprlH3sjZpdqYviecFe?=
 =?us-ascii?Q?iG5HITSHrRhKcaBg/Fx9tVNJpjKpSEHPORiW/WF9yA+ZueoYm7AMHHHjUuYs?=
 =?us-ascii?Q?0dY6gDO7oHAF8gTU9PdBjpzETpY1XL674FU8sTDJ8wtdlvtAPXls5beBnM5+?=
 =?us-ascii?Q?JEpIUlOqhYzAg8l+VfhP5pxen5T9mMPNq4evacdHjhfpBEglXyaEka7vKtfh?=
 =?us-ascii?Q?730qU8jMqLNehAwUDjEsm5z1pmotguvVmf0u+3+rHrWyGgADDJOeujxRhBQX?=
 =?us-ascii?Q?KXvo511kVyBj5ZEjqtWxGteHBfIv7i5kqLoICs+gHe5KxqUu1UNMYddt/mBh?=
 =?us-ascii?Q?Nd8atYZL9ifUItGCZ68TD8UIacXX287JRWxyxh9XlGEPD8WaydkpWFOfOhhg?=
 =?us-ascii?Q?6H1QnbYDZshJLuhG/MuRofUgMASgcOlVrQBzoe5s3ppp5KXcHM0NccT2KVk3?=
 =?us-ascii?Q?RExtao6xMMSaOs05I67cSWZk4cSOJJXHm9IJ7Dr7Z1Ck3IUDMhu5r0E0Ojl/?=
 =?us-ascii?Q?/mGL+HhEdnihYQtBAISwE7mFgzw0zlSh0idVvJrCT3RxD/0dBaI24oEpb1wi?=
 =?us-ascii?Q?s7QX8pgMx/o4o2trBpK1rNenskedOql0VPrnhzrcsLWRDE9SDnitvSz2wsEP?=
 =?us-ascii?Q?uq4gVk+JPls7H33n++9YTEn5N4JjvjN8OQ3hZw5iZgq24FlNn8XsOdwKHDcm?=
 =?us-ascii?Q?A7F4sJV93I/Rmk7selozU95S7oHvYVhKYJPsSXwSVS5CYY5iHC36SAd7CBX2?=
 =?us-ascii?Q?MJHO9MeengLpuFA8r6VvDo+OPZ/ILZHJLqZkIpNprEZRI/oezRRcnWf4Oeo4?=
 =?us-ascii?Q?x/KyWk9OUvHoRznZD8zJnohinVwSCoyS9PW88ZJIT3yCyiwOOB3pdhVbNJY0?=
 =?us-ascii?Q?wRvivU8ypWFnLNliThQwAm+9CLZ0nj/N+DKDwvQskTO7Y1+Fpy/hxC8TX9ac?=
 =?us-ascii?Q?A7jeU7peiUvEpytNU82QCkm2tu+pg//kSfaCSNhg/taiIICadJqIYOZT9fMI?=
 =?us-ascii?Q?V8+iKxSwFefCbfjX4BGJxAPrddaebzKCw/5ZGJlkARVXtyFjlLDnGNaASIF1?=
 =?us-ascii?Q?sYzmvGxLinoPxPY8I+mIIWZ94gnXX+M9F3QHTRe/RtjVoW0G0HSRyoS0olpa?=
 =?us-ascii?Q?UsvAvF8G4dTeDrpZfONnhDpZU5YSnQipSoFVG8UzQua0m4WsSVGJ9MYwjfSo?=
 =?us-ascii?Q?TWAe1V9AQQydGW2aP3U0+j+FoTb6C1awo96vJATynpuemxba8CUyodYaP9Hw?=
 =?us-ascii?Q?afhFxNKw9WkjLQQzoq7c4or3aLkW8yVK3608M0sDl7AfBx979JHMLgiMEldO?=
 =?us-ascii?Q?s4PtU0nFkae+6/DoYmDzf2ny9qCSOm6x5GIMysyKEMYgceVgGQ5tgWnpkLbK?=
 =?us-ascii?Q?kfnSurLAOKgs8KyuoSiAQkMgQgW/FbB26pJGNqxWmNjKcHldWM7HoC8ATiUR?=
 =?us-ascii?Q?aAApfNlOqExkWxJhkEjiEUlirsaXcgx+NZ3XQLlohkCpF8lKB9c0FkkZobdR?=
 =?us-ascii?Q?08SjtH47r+nl+Boba/r4ahFWpIZnRnYK05t63gBUKLwRL8ji+Ng1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07cd5bcd-476d-4dfa-b09e-08df4b976cdb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 08:29:45.1748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ePvlMYeeROzU7xe7gJBMyLDXNXhd8Lk6PAVwHQ9Lxw1B/pCyaZ3RtkmX/hvopkX24Lz2S78/JuEJt2wV/4KCZe6xPPADqf6DxYBGua3AUzAbQNuuA5Mbb0mV2URq/N8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057

Hi Peter,

On Wed, Nov 25, 2026 at 09:51:25PM -0800, Peter Chen (Qualcomm) wrote:
> On 26-11-12 17:25:56, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> > 
> > Role teardown currently removes the gadget and host roles while OTG
> > interrupts, FSM processing and work items may still be active. Such
> > asynchronous processing can queue or execute role-switch operations
> > against partially destroyed roles. In particular, a gadget instance
> > may remain registered after the controller has been removed.
> > 
> > Disable power_lost_work before starting role teardown. During OTG
> > destruction, disable the IRQ and ci->work, clear canceled ID and
> > B-session-valid events, and remove the OTG FSM before destroying the
> > workqueue.
> > 
> > Finally, destroy the gadget and host roles only after the OTG machinery
> > has been stopped. This establishes a teardown order in which event
> > sources are quiesced before their target resources are released.
> > 
> > Fixes: cbec6bd55a45 ("usb: chipidea: move otg related things to otg file")
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> Do you need to Cc stable tree?

I worry the fix tag is a bit old, but this patch use a relative new disable_work_sync() API.
However, it seems still valid to cc stable in this case after I read the kernel doc.

Will add it in v2.

Thanks,
Xu Yang

> 
> Peter
> 
> > ---
> >  drivers/usb/chipidea/core.c |  5 +++--
> >  drivers/usb/chipidea/otg.c  | 17 +++++++++++++----
> >  2 files changed, 16 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index 3461dd763a6e..eb7b9c0746d8 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -942,10 +942,11 @@ EXPORT_SYMBOL_GPL(ci_hdrc_query_available_role);
> >  
> >  static inline void ci_role_destroy(struct ci_hdrc *ci)
> >  {
> > -	ci_hdrc_gadget_destroy(ci);
> > -	ci_hdrc_host_destroy(ci);
> > +	disable_work_sync(&ci->power_lost_work);
> >  	if (ci->is_otg && ci->roles[CI_ROLE_GADGET])
> >  		ci_hdrc_otg_destroy(ci);
> > +	ci_hdrc_gadget_destroy(ci);
> > +	ci_hdrc_host_destroy(ci);
> >  }
> >  
> >  static void ci_get_otg_capable(struct ci_hdrc *ci)
> > diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> > index 89a6a37815f0..8ac8969a45f0 100644
> > --- a/drivers/usb/chipidea/otg.c
> > +++ b/drivers/usb/chipidea/otg.c
> > @@ -272,12 +272,21 @@ int ci_hdrc_otg_init(struct ci_hdrc *ci)
> >   */
> >  void ci_hdrc_otg_destroy(struct ci_hdrc *ci)
> >  {
> > -	if (ci->wq)
> > -		destroy_workqueue(ci->wq);
> > +	disable_irq(ci->irq);
> > +	if (disable_work_sync(&ci->work)) {
> > +		ci->id_event = false;
> > +		ci->b_sess_valid_event = false;
> > +		/* Balance disable_irq_nosync() performed in ci_otg_queue_work() */
> > +		enable_irq(ci->irq);
> > +	}
> > +
> > +	if (ci_otg_is_fsm_mode(ci))
> > +		ci_hdrc_otg_fsm_remove(ci);
> >  
> >  	/* Disable all OTG irq and clear status */
> >  	hw_write_otgsc(ci, OTGSC_INT_EN_BITS | OTGSC_INT_STATUS_BITS,
> >  						OTGSC_INT_STATUS_BITS);
> > -	if (ci_otg_is_fsm_mode(ci))
> > -		ci_hdrc_otg_fsm_remove(ci);
> > +	if (ci->wq)
> > +		destroy_workqueue(ci->wq);
> > +	enable_irq(ci->irq);
> >  }
> > -- 
> > 2.34.1
> > 
> 
> -- 
> 
> Thanks,
> Peter Chen
