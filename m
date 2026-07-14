Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AB7380FF2;
	Tue, 14 Jul 2026 02:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783997200; cv=fail; b=Q365EOferGQIyhgfKDEv4oURXTfNgbvDTBRkJK6HtIeiqNngUnpSUWeAIEfh4Zo7EcyyMo/pBOxk0YCn3OFbQH+upa44O9W3EyPwExb1VIOqNfjy1L4eCi5O69gxz2ge3iBFsS6rWfz70jov21/7HogXaqLuNLXFlQhIay3TsJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783997200; c=relaxed/simple;
	bh=27seNhqdssG1DbDY+qqxLwyMxlJQrFQ9QwA9rTL6WX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uLJtKfnHgiWJpJppV03ZxnX+V0XAFpshgBtkgdTlwM2iPZ63J0XxZ4P8iZUcGT21y1ZIa3AXqUaMBQILJYa6MdN94OpeBOBoqNSF7yjJNAAA59XI4xL0/ihNZx1hTGyRMmPbUjo2uG7S0OsCdfmZWiDPudJkAkxM0ff7GWU9H6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cNCIYWYV; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cNCIYWYV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xqho83xneOXadvnOHw4vu+iZoyUpwgTr1iTFcyCQm6U4N3/la/kcYlgrG2vVLDAVt+nGqh9aqLM4G9TmUYF8sWXRdbSWNOXRBIQ9kSBS0lTJTO4znAkbfvYJAGyyUz/YPCrYBYj41BbsgU+POLArXHv9IcJ0EQwIQEVe06NgIcSgDD7smV/7J1VfM02yf+JrVzz9qOMnYXGPNqTmrgTCcOboFjzYR7bh3irIHUHEG33ykeBtqgedZgxMxYIvUFKfGzoj7TKV8xT3Oef52W8jjql1EPKqBabkl7gMGkJHBfu3A5z0VbkW+3ti9iOUE79tijFyTKXb8QbnGhnCDHzkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zm6AQSY6UaagEEB4F+EW2c963ObR7YbWCyOPO8/HKls=;
 b=GTq9+TvC0Kb5XPtx6q1i/Hak+ynz5k7UgtaCPy2rpZF9KHivbl6bGFDgv6et1HRgUmXtluyUUSLp74RdKoHDSDokdI7fnsg3DLYfBrumUVpF78nJSiY1RVp9e/bWRiIFoNBYHwIhooBRVgwz70GhYye5VaIi3gTN6IgDPrwHcJYLiPY7MUJpOKapGrMq+ftD7zgfCNz09TqIDgPjv95qu5q5ttVplNTtHx0XnVRIqAdm0Q9hnsVSekAzd2pLzPxnga2TR2EiENZQLsv6GDDSHSMVYKOMrVC8fgrw68GZi9V/zMyxidjtcoJGKWE0A0PoSMPKHN0HHbLMo4wzEOFe+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zm6AQSY6UaagEEB4F+EW2c963ObR7YbWCyOPO8/HKls=;
 b=cNCIYWYVmNiIhruOW8F5PvsAWMlu5FnHO3GRA/M2mw1GxP3UrRadlxJ3Jxuq1xAvlvC0lZmBm0YRcG497uDO+Mb+c4joO4qwOwoS7lkPf58cTofd1wlr7vs6J41sYHRGcnF3HJwBzsZMoEHwQ0m0aAPsKAGY43r2IqcNmgNj7LagLxArwfdOMf412u6tvnzvvPyou5SLrXsDbe4PkOY33/pe9Y5a8rCSCz/p3ymMtTitzqtzKgNKrYk6nVmwz9Cyx1MxzdSeASzfDn2RHEwVAoperqt4LKK5ZEdACGAqcrwD9Zf81k8LTTbsvPMt/Gd03hIro/U/CnYt67dnbCRpZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS5PR04MB11324.eurprd04.prod.outlook.com (2603:10a6:20b:6c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 02:46:33 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 02:46:33 +0000
Date: Tue, 14 Jul 2026 10:45:09 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: imx: fix missing ret assignment for
 dev_err_probe
Message-ID: <ntljvolmfjjuk7hl7me6u5ivlyiccngwkafl6vnu6wqqyqqegu@owlrxulwiliz>
References: <20260710070834.2744357-1-xu.yang_2@oss.nxp.com>
 <alERxOPGEM6jr4eL@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alERxOPGEM6jr4eL@SMW015318>
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS5PR04MB11324:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b3bee1-d8e9-40e9-6eae-08dee1521d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|18002099003|22082099003|4143699003|11063799006|56012099006|27256017;
X-Microsoft-Antispam-Message-Info:
	LQGqyHOuI39QqtlfDFZNDIkuoXjq1pMsL3yg/oVPu4GpNXnOt8aU6dZg5j3k8hg3X8d2QIfq2Nbasst7DVKxCaS5MUuKVS3h6awtPo9Q06vdnZDFQ8EtxBEXEsEaD03x9xXQqtzsj/ej6lguzQQi7DwrSWAdz+SKa2QW3Fh9k6Fybe1XBwxCOPjep110Njz5KbZFk6DF6cHVZG30qRvduRPZoX0vn55dYIpMs0s8Kj5eGi3TOcbyS74Ro5LfyKXiwGneuIBMzXFQS4tI7fHBfXMZzid4vtD71RRCWqXuhn0siq4+3aRAoOpHOJx4UFjlUlhSF6CdhaR/4YAoSRqqQLfiOs0SIIAxlefjxA4rDIVtHbxE0ySrEvVOkFm8RfWlI4MSwsqpAfHX3XAYf5h4kfl4eEUxjVyLS14AxHOEUls+js3sRO9xqMef/LL5AHGzYAdnwg9nJJbB8VHLSclULoCEYUKBtilDxNO6dmV7a6XurDGFHfVGXtPxuFwiz+j9fU6NI6KwplDHhohuYiHtJarjrRwGTAcNo7OTbI5FkOD2KhEVHafoRTvDDpv+19JNaoU+DbArn4zh2FVCo0oqXUybOXwCM3yzIS5SqHRLoNNNJxH4J1HWZBCKGB2yHcNeWoG56u4MOECj/G5jBRCwhT/blAx5qY8zgAQ06KuQCx3sqR7MVZ47f3yMezAVxIKUTKl4eq1ZCyyp3O6wzKmn9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o1tr/WtoQDlNTKkdeQNVL2EONAid954OdB81vSRwtuuyJmXIBA2ux5r5YENq?=
 =?us-ascii?Q?fQV/nHIGerAaPH84hqZG6ur32N50zdFTGz+lWGC4fuNx+fORVJnLh2XpullD?=
 =?us-ascii?Q?4qI2B6DLhSXtndim3WCIZP5SMlEYQbtMP9uPI4aQFFEzXG7GGXx2bIEEMP5R?=
 =?us-ascii?Q?5DBI1jjQpqS2sAORCBNWCWY/RNs0/mKnxnO1ut5Bc8lNYhIPlb41ol9NvJmN?=
 =?us-ascii?Q?Qmy7M3oAibO23/3vZhXGeZfwVe40wnFyhoOC30ytatz0LNBSTLc4M1Wjy2uv?=
 =?us-ascii?Q?CCsDAnHGvxBgAarVF8UFBcl+nRAb4fs1wgMG36z5UbTo8UK/ccPjDXhV45ZP?=
 =?us-ascii?Q?ZIfeu9edXxK0nkhaiMwtamHlTSBKu0U1FnLo+sG8cbl4rndFVrFoTOIBxwuJ?=
 =?us-ascii?Q?lFtPX7crsMb644M69VLtH0ZZ/X1N2BAfW3oeqzcaKXD4TVNQAMP2rFQJPEqV?=
 =?us-ascii?Q?vjiMM1GDM+ywYk3CAcDymp5bOFEz0ZNyMp2yrzrBCm7DhAk0QE38enNxpWuM?=
 =?us-ascii?Q?c17zRMxN7N+o7XTf1Ci+kab+LytKlzTmeQo2/ka/qtlNq8nh6L83PjNq8rrW?=
 =?us-ascii?Q?b4n4e8Gfaky1cVSDq3tqJEtBA9aWwXdPw1uu7N52zaH1avkCkref1OrQ8U8X?=
 =?us-ascii?Q?tPsycIBrLFyWdwvhI0uW5jyIM3fyPcSBEwQT3nSHQ9YohIiJDMX8a7RRdIWg?=
 =?us-ascii?Q?gDJSWruDJ1KLsMiykh82SSZPVEEOpSRAJyO0SlGM1P5vU5sy6XnStCtVwJjB?=
 =?us-ascii?Q?dLYszAX9qaAByzlrIVOlDXot0VF7fwZ6jtRrUPaXHxeukfEIuXNOjqz39ZXC?=
 =?us-ascii?Q?gq7vcXn2q+OMXwJn8F2t8IAs4A1WGmB/lNavnAZRhbFNLP+dQCJJcJZni9HV?=
 =?us-ascii?Q?4jOySWHb5abhYjUYiPOblt1BgpHWuEiX+A3yyobG6tOL8KbzvbFmywg7RPw8?=
 =?us-ascii?Q?m2QzTPtN1g6D/vbnV+j7QCXUO56qGanDPnCCGQiUOnK4A92m7kHctOgT6c5X?=
 =?us-ascii?Q?LSUsaBiP7GohTTOqedXU14PaDhCKJBV1F5CdKh8MXfpY9pBRrxBm+iWyxutU?=
 =?us-ascii?Q?B+O21psSoYaZsJH9F3vyxIQSaYViDmChNth4rIm+jxdsJFe6nQa40VJjt3Ke?=
 =?us-ascii?Q?bIK0jfgJYwLzrj1DvfMjURYAHs6keiQDe3LJWbPrEIpAjIZt2m3qUsZw/bPn?=
 =?us-ascii?Q?Ri781nfH3uQMOvaF5u03cFDJQi2QhYa9Zp5eQsjs7cxTQOnTLaKixPOg6uNC?=
 =?us-ascii?Q?XPT0xs7+36ShAuJunW8mKMDqFfHon8CE0fwvzBcJCBs2VCdoj9nfnBV960DK?=
 =?us-ascii?Q?Jpg/Y8ZlQAevl5CvWjuE8CPo9CEdC+Y4VYUhRPU0fGeF7kkHf4bQYY2tV//a?=
 =?us-ascii?Q?bG/OPHTN30fR0S6O6jJAuB65KZh1zNx1uo46bPMctDTwv2RehLloI13Wc29e?=
 =?us-ascii?Q?upQClApEl/bDmn3/tmW6iX5NbMTLuyVcfLjQGyTCuEBgtZnrPlGBnaA8awC6?=
 =?us-ascii?Q?oQtWGhSAbp9ENMkGGbVoyfbOrpGJjJ4Q5x4AAW7yLCg8vvBHZ2BNWja1q51w?=
 =?us-ascii?Q?bu4TJE8Q04WxFNB63JeIiHnu9RV2YCkdAuH46fFpHBczljh3u6NFaIrueOuD?=
 =?us-ascii?Q?7j7EXP2pLz8oCTDcUu0tW8bhNSF/XnbcNuAQWpzQNpvjIsIVFses1o9DIouS?=
 =?us-ascii?Q?ppcctQ/JjxvIWLK5cnOTJF1J5ctfVworf8rnl/dEpFSAPGCsfzNFVJvvttcY?=
 =?us-ascii?Q?SnIzzQi7raGLslgP0cwuQ52vrpaa2/9LdUu2S2iy/u2qYqAgKrVv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b3bee1-d8e9-40e9-6eae-08dee1521d50
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 02:46:33.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3wUNSbARiOQSMZzk0m6YZ+b6jCk5qUYfkI9bOdYYvmeLmMc3SSL9b160pRe+SWsCADH3W7dUxnYm4OAZpPCbim66tiTnFa/cHwPO/2ApgY7Go8vkQsX4vaEiOOksUc1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11324

On Fri, Jul 10, 2026 at 10:37:40AM -0500, Frank Li wrote:
> On Fri, Jul 10, 2026 at 03:08:34PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > Assign the return value of dev_err_probe() to ret so that the correct
> > error code is propagated when goto err_clk is taken.
> >
> > Fixes: 2e9762f45efb ("usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for wakeup interrupt name")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Closes: https://lore.kernel.org/r/202607031656.FR3Xrved-lkp@intel.com/
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> > index 56d2ba824a0b..282314eea7fc 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -528,7 +528,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
> >  	if (data->wakeup_irq > 0) {
> >  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
> >  		if (!irq_name) {
> > -			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> > +			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> 
> Generally, -ENOMEM needn't print message,
> 
> 	just ret = -ENOMEM;

OK. I see it has already been picked. I will pay attention next time.

Thanks,
Xu Yang
