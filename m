Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAB325C804;
	Mon, 13 Jul 2026 02:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783908605; cv=fail; b=cZdbQj5M3Ai/uzrdasOsOyX0fPLkEai9VwjW+M72LmhivpUCUXDsa0L+6FUzEY9OdLnGGJMSBLHQwHALzz4UXk9II+0o+g8NP1jIxl4E7/UReNuVjIRti93/GW18k2FHUPIv+bXHvgAknciLPFSheShmI8/PcIJtYRewQp71B8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783908605; c=relaxed/simple;
	bh=khscYpa2xjRngKJWmQZnGehgPWOc2QqRLqiOeWr42as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=itR+BMx/0Re1tdKyPMyLH2QVS6H4+kvOi6bXzLgc8F/L1ExnHLwNwMprsVSGW0BjeNWDNTE3hlG7k5UhSgpccGd5FiFNhg0OIrQH+z3/sj2fwdLdZDUYp8+tPqR1CyKyZju8poivL47dp2EDS76GKIjZjDjlMNcD0XRMMWpeak8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hGbGDzS5; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hGbGDzS5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFoH2BsPZaLoG2DjPvIuD9S3XkSzd30oKJaurvBPbOHZU84aP47LoajzWJU7Ym4Wfxvqr8WjyHso/5u+/69uVCjfX+Fi8u8kwWPDj1nkvG7Dkf7sEcfclEevp4CF+4CoM0Im3PoireQzjZ+Mf6EtikDe2bqAaro1wGRpO5h3IdUsPFgbY27iyns2Tqs649KHxsR7WpbMr8d3SfSvloQ3Tht/D0J708+l8x/+uaBlSaDDOzSA+2z2mJC/m44cJKQeEI17GQLY2ubTSbbE1d9dzXEvlfcH/ndkQ6Xgk067jXsIKQyQzXVU0RayCfHqoO+s3lZJwROBBGhTXafFPfC01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+rS/E4WfMpsM4zJ1TLMAS+z2//zHgomGQ9fIZ/OD1w=;
 b=yycqBpwWxH1mvrr3sPGGLSzKahBHh0exODeEZXS0deQpKdMw5Jcb7zBIos2d0DGOSOeqpeq9m3GdM9Nmti7/PTaWS3SigdjhrzKFnrTbEH4Y4XD6VPEbAY+odFu7tufsqqlBUqezwDb5FOLddmY9t+utX6ONVYfxHasCezC7bEGciumI/RE8v9DuRjk/VISYNC7e8lFecuQ3rqn73AtjlmDKzwF74SP/kl/b4HWUAVTSoGDhylEFSJDauzAzVZBkCiVIxCmgXikV/THF1QidlkerKRsBoc5yybjPNvq+ATew7ZgF+we7vd2C3Y+kYK6n9+afwKyewgSNtBx0YE6sow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+rS/E4WfMpsM4zJ1TLMAS+z2//zHgomGQ9fIZ/OD1w=;
 b=hGbGDzS5w6J5qpnx4l3DA9RsVnMfswh6wcRh/dWcSHEWc+IHH3QgLiAiBgWGoc/Qovtyh1zmEOz0456LAtBP+8bb45zuT3gR9e56kB8eJ0Z/mSkb7vnTU6ia6sjE4x9pbgtHpnhxQwm4WgH8esE9Q4ejE4ubKdq2yHMN+vufTxf1z1miziTbbKaf0d2VjDc23Vmx/Q7GMpO0fUOIqwu5Fj51k8yBmd1Sih8cIo0m6ey0fCcUx0BXKmvzEwDtkgrJh/rA9gQeRq0a2v/cOrj8VgQ8z8HzBBLPV3WClYOw+asBrhviIWjOy9a+GjRw3DC2FOC8YSEKZqLpFmYiJuwTQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DUZPR04MB9725.eurprd04.prod.outlook.com (2603:10a6:10:4e0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Mon, 13 Jul
 2026 02:09:59 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 02:09:59 +0000
Date: Mon, 13 Jul 2026 10:08:36 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Frank Li <Frank.li@oss.nxp.com>, kees@kernel.org, 
	christophe.jaillet@wanadoo.fr, xu.yang_2@nxp.com, hataegu0826@gmail.com, balbi@ti.com, 
	andrzej.p@samsung.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check
 after kstrndup()
Message-ID: <4gzbxyclgkl35af23bds3vloroglsc6t47msjhodcmjctgnvz2@7hhdbnryu2qp>
References: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
 <2026070831-peso-aluminum-df0c@gregkh>
 <ak64635tgUj3MPEx@SMW015318>
 <2026070922-density-onto-3ce6@gregkh>
 <n7h2d72m2lqdnrtvlbztwrkfmmzsh2nbb77luwomxrcyrpimuk@fdlg44plusyw>
 <2026070908-semisweet-parabola-4a48@gregkh>
 <2026071019-parkway-captivate-086f@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026071019-parkway-captivate-086f@gregkh>
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DUZPR04MB9725:EE_
X-MS-Office365-Filtering-Correlation-Id: b26f4fe3-a98f-42cd-6520-08dee083d762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	23AnrUuUQoLNBZcCrKNXJ9p4wPhJnMPu4t5VHUTQUhqS026mW8osv245qAQyS3nluYda7BX1JCkvEJsvXfvILq4PQCGM8zCpXmuCso+JcaVpHOxjLJWzEXGk/Rp525vUQCyFq5BumYLIIYKKjQeDg8EOaOjcSdaL3eCLCwVjAVh41urZdz1SRlObLfI1rkPMFbZEzzIaCmc9GlxNBHawBk6l1ddzPlQ3sfQRqgtYED8vTTMZewauHKZLEuvc22uMkEHhR9rppL5ddgYzukbQPEBJrrI8v3isBl8OeiloULgo8/YC8rcpiBV3+428rYNfKxIiieMGywh1uHupNTkRUMw5+npWjN8dRdr7FOZlbsBx0Vm6W71M07ccWIIv/vwy0O4Zb1sQJvfEAbJ0qjDzL0tQXP57+zaJ4Kmr5hzUwPxHcaKtMeQ9K//IE1aEkF1sM7AH8885g7rp7s3lHa5T1ZZoC/egsskJbw9tmd12pH9//Cc7Z1r4AW5uNent1+zxAUs2aR+7bIOTMlB2ztL0shE9w7AOQKxeozXPFTZMOWcvexfzmKZVx/YsZu+sPHNRqRSro6ba3U36sYIXWEYppeZOPz4qwIdiRp0DCJ6CL3Ch9tt/4GBY6DipuSZz0TTqI+Rgfkv1lQJbfrMXrc9rkQsrNUrl1TQ9G3LNugdmvg4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnFxSnhGQkJVWUFlZ2hGS0RCdDVkZFowZE1UNDQ1UU84ZjUvTG80dGZGTlhD?=
 =?utf-8?B?UnpFVU8yS1A2SDRnM3RNZGdLN1hLOTdVR1VQVzBUeE9YaEtaOWF6STloT1VY?=
 =?utf-8?B?a1dSQ05pRkZEMW9UdUM2SWRTSS9mREE1eHY2ZW1PR2lpRXJrSVVmbUpxTU9s?=
 =?utf-8?B?TXlvSXhlWUtVbitESERZOWtrWTUwUG1LRFlWK2tlM0I2NXV5OCtKejRDc0hl?=
 =?utf-8?B?LzVnaGtlbDhMemdOL1QrdGVkZWNoOElwRDg0N1lNSFJSUU5sNTlpMDVsTmRM?=
 =?utf-8?B?MEc4Zm8zY3kzOEFwc0RHU3hTTlJseDNLTkt1NEZJSUdGamRuMkh3UTQzS1Bz?=
 =?utf-8?B?eXFkZ2VKQzNlWEhVMThjT0pTTHVkS0pTSW44MlRBRkJzQnRCSmtaVTQ5T0Ro?=
 =?utf-8?B?OUVad3ExVG5PUlFKVWFVNWwrcFhDR2x6elN0eG0zZzB0aXhqam13b3A3RDJk?=
 =?utf-8?B?RVQ1d21aMFlGOGwxaVoxNFFFMkFkVkNKM2FCV0wwdTUrQlU1d0N6aTVpMXNL?=
 =?utf-8?B?ZFo3bkVoNjR4MWhMTHhhdEpzN3ZBM28xN1Q5bUJIL2RFNTNQNXBBdUtBRUVE?=
 =?utf-8?B?aVFyN1o5L25Kd09TaldRbTA5OWNVVnFzcTBJUHNRekdkbTlHTFhidFBZTytm?=
 =?utf-8?B?K1NObXNjaXNNL1YvMU1nSTlrdC83Yy9YRHVoNVd6eWtvOTRiU09HTVpVMXl1?=
 =?utf-8?B?S3EzRWFCQ2VlQUNmaVYvQWRVUUgrbThFK01tM0swY3I4VEhjU2U0a1A4SEMw?=
 =?utf-8?B?Nk1DcXlUWk8vUzNFMnNuc1NFU0R4eDNqdDVZdmozVW13VEJKOXdnT0dMeDJx?=
 =?utf-8?B?WE1odWYycXhtSDRBU0YxNVcxbDlhN25Tc1JnRG0rNitvbG5LdnVwS3hvcFFi?=
 =?utf-8?B?TzkxUHNDTUVtczV2OWtrN0UvLzBJTGhSMzdGVUIvbFhBcExEWEJGNUovRHJS?=
 =?utf-8?B?VWdWZ3YrM1VUOEsvbHFoMWkyYnFPVDJ3R2d0VE1tVlZwRlhUcDl6cVo4OHM2?=
 =?utf-8?B?MEROUUE5SUUxcENyQmF3NVpHWmlLZEtSZ2EvYzduWXNyUk8weVhMME4vMGsv?=
 =?utf-8?B?ZHdqUkpzUEhwZUUxeHVsOUJqTUcraEhscmo0VnpkcmNITnJXbXlyZ0JNVEhr?=
 =?utf-8?B?N1R2c0Jmc3BNamNkR3RTSFlpWS9hZXp6ZGpGYmYyVGM2aThvSHV1eml4MEpz?=
 =?utf-8?B?dlc2M01wOE9oanB5dzMyNmhlRndZZU12VXI2ZDZWd2Z1RmdObk03ZUZOSzZ0?=
 =?utf-8?B?TWhEVDBBMHQ0MFRNdWlyZmQ0VzNkaXVmL0ZaSW54a1ptRUdWYlJaQlZFb0hR?=
 =?utf-8?B?QzkybHNKOVpNOXpjQys2VXRRTFk5UnJSVTNsQ0wycGoxVk16V2x3cXplaTc1?=
 =?utf-8?B?bzV2Q2dzSUdxbGFHTWNucnRXaWZDUHZIVTBzeG05WXNwTkdVN1J5SmpPODBC?=
 =?utf-8?B?UXIwMmo2TjROTDR2NDYwSE1abnlIODUwZ1V0S0NVOHhJb3dpRFdJaWJuOEgx?=
 =?utf-8?B?ay9FN0VuOFJ5WVUvbWVaSzU1bUlLcUVQWmU0dWpEdm9VaU9Hd3h3elJLbWdD?=
 =?utf-8?B?Z2w4ZnpwbFNkcWUzSHVPY2pwZndJMlVrU0FPaW5ObHlJZFFDeVV3S2JmZGp0?=
 =?utf-8?B?SjdROE5zTHFxcTZrT3lXUVJidTNvSlBTWXVhNUVUQlRyaGJHRDJRV3B4WGRH?=
 =?utf-8?B?RVVRNWROWXNraVpDd0lxMjErNDJ4ZXFxOVhaKzFDK0lRYXhKMVpHSEtXUkFv?=
 =?utf-8?B?K1YzeExZRHNielFMQVZGRkE5RG9ocGlGbzVkNVVYTFhSMEUydUhTRHdWTStw?=
 =?utf-8?B?dWp0SHRjSmg4YnRsZ2xsM0ZUZFRFVE1lbWpnbGtKcTVnYVlySFdkQXNhY0xM?=
 =?utf-8?B?WnBPNmZQZW9VV3RvR0d1UVUva1dwaFF0QlFFckxNODk0b3hqMUJIWENQalNS?=
 =?utf-8?B?QzBZYnpOQmNMUzUwUFB5Slh4b0VROTk2QkNzTHhSeHZPRFpTb3c0MkJLYUdI?=
 =?utf-8?B?YVUxS2lQY01HUS81bUxEUGpsQ0E5S20zbFkyMDArYTBtY3NjcEJxRjhuRS83?=
 =?utf-8?B?UWVhaWVLQmo3OWROUDljWVk1WEhHa2NhMCtBTlVQTTEveExZOWQ4R0JJdkRB?=
 =?utf-8?B?NFNuVGJFMWdNMlJJWnlLLytmdDYxdW0wRXpmeVNjdGdCVEJ3TkNFT0JONjQ0?=
 =?utf-8?B?WTVsTTU5ZFRFdWNLSWFmSldRVDdla0tIbllSYm5Bazgwd0hpUXJJRXdZR01a?=
 =?utf-8?B?WCtDTHlLYndNM3Z6bUlNei82cHNWREEycE5JVjNSQUVEUER0MDhOdHVLYm5q?=
 =?utf-8?B?SlowRURSd1B5bDJtY0g3bXBnaldoa1hmVFJaV0pyeUxUQjhtSU8yOTFmOUx4?=
 =?utf-8?Q?0on6wg3wsnOtuzR7SPjTWyN9VHMWmXTwANY6z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b26f4fe3-a98f-42cd-6520-08dee083d762
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 02:09:59.5451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMRP+SNANNwBi3qW1477Hrogd0h7kh74qCl5ok/ChI1pELJLMIU2agm7r7y2oU0D2H9v2Rq7bHzD4OlvW0Gi9BJEBNzxSnNdkBZRT+Q830PFscBzDrSBSMDtw0rGUIul
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9725

On Fri, Jul 10, 2026 at 02:58:02PM +0200, Greg KH wrote:
> On Thu, Jul 09, 2026 at 08:48:08AM +0200, Greg KH wrote:
> > On Thu, Jul 09, 2026 at 02:23:51PM +0800, Xu Yang wrote:
> > > On Thu, Jul 09, 2026 at 07:33:03AM +0200, Greg KH wrote:
> > > > On Wed, Jul 08, 2026 at 03:54:03PM -0500, Frank Li wrote:
> > > > > On Wed, Jul 08, 2026 at 05:05:03PM +0200, Greg KH wrote:
> > > > > > On Thu, Jun 25, 2026 at 07:31:54PM +0800, Xu Yang wrote:
> > > > > > > From: Xu Yang <xu.yang_2@nxp.com>
> > > > > > >
> > > > > > > kstrndup() returns NULL on allocation failure. The condition was
> > > > > > > checking 'if (tmp)' to detect failure, but this is inverted — it
> > > > > > > would treat a successful allocation as an error and return -ENOMEM
> > > > > > > while leaking the string, and proceed with a NULL pointer on failure.
> > > > > > >
> > > > > > > Fix by changing the condition to 'if (!tmp)'.
> > > > > > >
> > > > > > > Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
> > > > > > > Cc: stable@vger.kernel.org
> > > > > > > Assisted-by: Claude:claude-sonnet-4-6
> > > > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > > > > ---
> > > > > > >  drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > > > > index 5d201a2e30e7..e9f2632ce785 100644
> > > > > > > --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > > > > +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > > > > @@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
> > > > > > >  		goto end;						\
> > > > > > >  									\
> > > > > > >  	tmp = kstrndup(page, len, GFP_KERNEL);				\
> > > > > > > -	if (tmp) {							\
> > > > > > > +	if (!tmp) {							\
> > > > > > >  		ret = -ENOMEM;						\
> > > > > > >  		goto end;						\
> > > > > > >  	}								\
> > > > > > > --
> > > > > > > 2.34.1
> > > > > > >
> > > > > > >
> > > > > >
> > > > > > So this has never worked?  How has no one ever noticed that in the
> > > > > > decade this has been in the kernel?  Does that mean that no one uses
> > > > > > this file/driver and we can just remove it?
> > > > > 
> > > > > I think just no one use sys interface to change name.
> > > > 
> > > > So it can just be removed?  Please submit a patch to do that instead.
> > > > 
> > > > Ideally this whole file can be removed, does anyone still use it?
> > > 
> > > This legacy driver is still built in kernel in multi_v7_defconfig: 
> > > 
> > > ~/work/usb$ grep -nr CONFIG_USB_CONFIGFS_F_UAC1_LEGACY arch/*/configs/
> > > arch/arm/configs/multi_v7_defconfig:939:CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
> > 
> > defconfig doesn't mean much.  Perhaps look at some of the Android
> > configs?

It seems that Android also not uses this legacy driver.

> > 
> > > It seems we can't simply remove it. 
> > 
> > Why?
> > 
> > > BTW, do we have other ways to figure out if it can be removed?
> > 
> > Remove it and see who complains?  :)
> 
> Seriously, let's remove the ability to set the name as that has never
> worked.  If anyone wants it to work, they can make a new patch to add
> that feature as a new one.

OK, will do.

Thanks,
Xu Yang
