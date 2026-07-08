Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011011.outbound.protection.outlook.com [40.107.130.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36363221540;
	Wed,  8 Jul 2026 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783544072; cv=fail; b=oqK2/p9yPThxHBLHAhNRyCrwV8y0pxoQTkL00aqSqNomMhojAJZZxbgF/p/8hJ+LWb8VP7WL3rvAM3JzKCzgx0G0XAB3wRFO0AqSAj1UnGibC05P4vsHXnHiVViSq47JUiMVJ3fAbf6KsF9bbQATQcR3YG2qH19l4Loru5ujDAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783544072; c=relaxed/simple;
	bh=+o7hAL2uP3AOsbg2sdb5XJuS54psBGNd9i2gcBlc4BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ug7229KgrBeKLtZa8d9YEIpb8Q7EUA6pX4N50u0a21atPHvnB5gu1w5R+cLu9pI8RNi5EUrDVYW3NsMCbrAgi5v9Yxf7wWHdz4FqjR/W5EGY/oHtoP1AA5nXAMbpfS2nNB0PkAaE64NeLiODoS97xbiMZ4XPlOaEHgULfyHYIBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e+RALxUk; arc=fail smtp.client-ip=40.107.130.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e+RALxUk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tboGjilayQxrnQbtPq2qfOlglqnEVMTmmUj9T0unw7MtjAcDK2PGHHggdhdwGkaUNHy0ZbI4BBpbDbR8XV8FsXz51/pZHRrepoJnXlNZ8JtmZLJCRblfQpZUs2+O7nanORBJaNKlieDNU5TXjtycu+gGgih7Y/Yc74AnbrEz5V6oNEhHXjGOeEDWM8jo9JaprFPVZ/62XCg1s1ke35/m1cCq8fbKIjvBvfCW+yeZdAXfib4m1GYslP5FrCwabG9zxBH5Iwwvu8Dq0I0PmcsZGMsE1WV6zs/SRR7SoOH6+7x+OJRbdT+w7buDAdDoIEXALM0MstZb6bSwQuDygk+jxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLYQuECkyPAhV5czjVtHkk5gQQE+eR93pF6VTnv2mOo=;
 b=TspK4slI2gJ0Dyf5/Q6Veudw2e9jQ6QHhbGpLy1E4LoIBF0hW4XYzOSr6WHBNL5iTTeZ8JHWd6WT9tdKPJlAlw9pxeTFXeXwF0DEqzeAWr0p7ky/JUlXMND0/2j1SD9tWikwz36C85XXa4VOww7CJuE1D5DNaLZcv1XC+jFS1Zm2a3jgMxxa1aHMurZP1ZnggrfBmqgPZDwDO4jjPAlglEuptiRJ+FdC2lUSCXDVdZMbjFpmrreuPuiRvgyNAi1LrJmYAx+kzQHMxgE5te0ySWpGGE8+PCgVWpY6swRX8cpxhbUdgj4VZp39wzTnM1iO3AntBERNunBAJX99wbXUkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLYQuECkyPAhV5czjVtHkk5gQQE+eR93pF6VTnv2mOo=;
 b=e+RALxUkc3dnc57fruhYqN9E471CgHGrNkJuzYfGx2VBYQW2bec6+Lu6WRc1b5tka/gWtPOTWRcPjdrIBrHG930BgzvJJtFzRkmAnU9WuveiPhNisMSC5ha0b85dMSXW9Kj1BDyUmxPFFJ0xqCmy95WwhGo3qW1vilJWUzIxSdzOCFGnPZZvpL9x1DSMjyHJp/l52Oqh3eg7LZ5onGWax6LRryCY/Om72hueo3CMk/bBQb2C52cK/ax8WQeps0zsdEtRckzekDk24M7oVKRjdyP0SlAs/qgqG6WNlZK0GMCKpfPS1L1SkovVGAyQGwSO1BF9FMvhLJtf5JzUdRLHMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8323.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 20:54:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:54:13 +0000
Date: Wed, 8 Jul 2026 15:54:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Xu Yang <xu.yang_2@oss.nxp.com>, kees@kernel.org,
	christophe.jaillet@wanadoo.fr, xu.yang_2@nxp.com,
	hataegu0826@gmail.com, balbi@ti.com, andrzej.p@samsung.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check
 after kstrndup()
Message-ID: <ak64635tgUj3MPEx@SMW015318>
References: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
 <2026070831-peso-aluminum-df0c@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026070831-peso-aluminum-df0c@gregkh>
X-ClientProxiedBy: PH0PR07CA0076.namprd07.prod.outlook.com
 (2603:10b6:510:f::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 441775da-0d1c-4ad4-f807-08dedd3310c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	eANsyPF+EtkOMPVCZEoT+/o2t8AOsbdd86MiAgPQk1gyYEhHAHmcapgTiyCZfbXtlhotttuzS0vI7YvOoi/LdySKhkVl2wHrz5fZrOM/mNooayFrSDE096JdsVHQbPLvyCPJp00t7WsnWzHKFQ4Bh6kf6phgXNqOm6qbH7iMGJ83WSOCTw70jdhLa62Y5JqnH3GjaKBm7PeG883Za0agnYbxObwg3gz/JvSB3xEbYOfSycMWhW3kXn0G8W3sMWafL4wxVWSePpb/ulLr5DdQNJwbc82IAPqNdGeGKu+HlxGJBzuBcLwfkay4VrjWMHBh7MrIOvOlBJ4ttkKbhpqmbloEpkMhGGIVhjn1TZoiYqLEjjALjhd0gIT5S4zgMx7IJo1wt/erJHFOcU3SChxtVzBvqyd9cd/6JVHMcsyN8EQZ9vbZvBBAksEG59N88r9KrsS95Zb1XXC5E26KPiaOg307o6uPOmuTz0PWLgQzQRA7MAsWhmP7eiCwJCruF1QImX0drb028PfrwV6XWVUnKsHh49divK7U45gApz/rfeEs4Qfv6thi9xlBDhgOaRMQ4OyJWmMSxf2HnpHi08FD8TiwBk3/x3R5iqFkcM1wajcSiErrpKValRZQEhtzN0ZIuav20k2XHE6mNX2bUI7AG329fJtKP/9K9ziadbKgfKQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkdoN1FEUVNva2hydCtaaitYVVEyQncwc2xRYlU0UnlJbSs3ZlRpVFRudWVx?=
 =?utf-8?B?QmI3M0I3emlGSFdTRStoRDgxOWJqMDRnQWVoTkxjMFVoczBjNVloeGhQVWFG?=
 =?utf-8?B?QURydGptQzYwSm1DWXpqSDFsbHpRMEJyS1kvNlQyWDZXbUFOMmk2VmlsaVBx?=
 =?utf-8?B?N3NkOWVRZTRMUWh5KzdHNmkzUm0rUlQ4bTk2enVIRkE1Z0laY20raFhaTGl3?=
 =?utf-8?B?M2diSGJ1TXdCWjcxK0MrQ25sekF4SXpUUE1UZ0JkTDYyWHAvWXJoRE9Lelhz?=
 =?utf-8?B?NkE5RTRHMTJUUXdFY21yTFNUakZNL3VUY2NRNVFKMnllajRlMVhtKzJ2MC9L?=
 =?utf-8?B?dWdOZFFHV3FHQjF5WTg5KzFidXdKSFY2NlBMdTZoZ051MXI4MVpOb3VPRkx2?=
 =?utf-8?B?VkE3MkN5MUx6Z1dHSm9aY2NIYUE4REF6L0Nma1E1TUMycHpsdHVwOXM4V3VF?=
 =?utf-8?B?MVhHQVAwY3hMc2VvMGlNNXlaVTlGb29TVWJBQ2RjbCtOTEgrTGcxMXNIQnpZ?=
 =?utf-8?B?SStJYTREaXVrNStXeVltVERKQWI0bFFEdEducVc4eW1BcVRoV1I0dUw3OTRv?=
 =?utf-8?B?NFRabFBhdVBMRDUyZGhveWsvbmVRRm9Vekt6clVIVk43dHlyNUUzM2R4VzN2?=
 =?utf-8?B?MjY2OXM2c1JnM0dzaDlITUNpZWdWY2p6U2lKZ1hLL0R5Y2NUQ2N5ZjBvMTBn?=
 =?utf-8?B?NXlCaXdRSzlEaGJuNThsR2ovWlNITHc0ZFg5Q0I3eWZNNUY5aHZoMVBPdFJL?=
 =?utf-8?B?WWRUYUIzT3pJenE1SThDNjJzU3FveVRVdjlYYXlhMmtNV09vb2JxeXdtOFNh?=
 =?utf-8?B?OS93cy9aY21hOStCeHNTTEszK0Z0MDczRXg4ZDZIcmVzYzF3aWh0cjBJS3U1?=
 =?utf-8?B?eFBGcWlvOE9IQUhJOWt4d1p2bUNsL2RlelhVY2JwL21qMjRxVDRIMWd6K2Vi?=
 =?utf-8?B?OFJpYjVDa3JSQlJObE1WQWVTYzBqN2NEK0VGRnN5VGVVeFhLZ0pHWjhBbHJs?=
 =?utf-8?B?Sktzb0MzY3M2MlZmeEFDbVJvZzBmdElRSTZydDFaK3RpWXZLc0VUK1pnQVhS?=
 =?utf-8?B?VnZoSjJTTnc1YjJxMWpraERUMFc0Z1BMK3U1a05wcUxzd04wQys0YVF4UlUv?=
 =?utf-8?B?VzdwMHZzR1BkcFBmUDRSNEptYmIvR0taOFNJL1lyZExzK2VHeXVOQ2NnNk0r?=
 =?utf-8?B?YXl5bnNTUnNqWGVRRkVSaUVNVWluUW5WMHR4WExad2orOWZRRXd1aWR2b2VB?=
 =?utf-8?B?YlJtem91SkkybXNYa0RBYXVqKzRDeElCSGZBUGh6Q3RSZHJhbUlaNk1oRWQ2?=
 =?utf-8?B?anhBS1RuVWlZN1Y1ajZCVmNqVHYrN1BBZHIxbDIxeHFjRGwwVXhVcGRNOWYw?=
 =?utf-8?B?WDdnbHY4ekRSSUdXUkh3RlBVc2VBQlIvcHJ6V2N0MW9BTkx0Z3pPRGplQWJY?=
 =?utf-8?B?STdwb0EydzhWVE1Dc0lFN01KSERnVFdQN05aaFR5OTZOb0xhbzJuQkRmeElX?=
 =?utf-8?B?OVVhRGp4NlprRW9hNlhkczdUa1FPWnp1dnhTelJLaXc0TVF4eDJ6Z1ppMjBP?=
 =?utf-8?B?QmxReWVpcndSbThRSUJtUmcyUGhWaEZXZ1FPMmcxM2xEd1dxL1pCZXZmME5R?=
 =?utf-8?B?MGtRUlNzeUU5aHB5aUw4ZndNbUo4aUFvMmhkM0FRN0RYT3ZMTVN0TFJvQ0dh?=
 =?utf-8?B?UkJXTVcvTnRlQXNQend0dEF4L240eVl2WTNTSlRrVmFQMGFYSkdxQ0Jtb1Ay?=
 =?utf-8?B?WVFPbWg2eGNMNmdYc1hjd2xEdVhNNk1JazhSMW8xWFlJa0dwcGlnem5UR1NM?=
 =?utf-8?B?MGNiQzhPclpCRlZQUExYV2U5ajVUREJLUGJWdHQ4MXJQODM5bzQxeDVGdWYy?=
 =?utf-8?B?TDQ2YUhrV0ZFa2R0dnE5YXRBQlg0THhFYWRoSnloWjFiZ0JzdVNGZWIzcnhZ?=
 =?utf-8?B?WE9JZjBkeGVONk5CUFRpYlQrQkR4MitkZEs3c0NBdG9QWm16MzdvQ1V3QVRI?=
 =?utf-8?B?TUFXZGFoWVhEK2N0SklhY21OckxnZTJ1VmZXQjZzMWx5SWRFNnUzNGxHSmNi?=
 =?utf-8?B?dE1Ga01lS3hzR25tKzNrZm04eVJZcFVybmJYZ2VMVFd5NjJxZjJFblFlaElY?=
 =?utf-8?B?a0hsYWZWM2RidlY4a1l3ZzVyR0dmOW5mQ3Y2MlVydkh5UlQ4RnZPczZNclp1?=
 =?utf-8?B?U055Qnl1K20wZEQybVZ5anZoUzV3ejk1RGx0ajFGQVV1OEVWVHo0WVIzNUUv?=
 =?utf-8?B?a1RSZ1B1WUhJOHdFdUZvWjlUYUV2L3VYUlF3Z3l2bFRHcUNXNnEzajkyY3Fp?=
 =?utf-8?B?TUFlMWdqYXVIa2U5RWtOQ0xVY0psTXB4YlBrdm1Wai8vTmg2bjdZMm1PUmt1?=
 =?utf-8?Q?1yKVLTCspOvNs2lD4pPKUCbiwrw/JT+TGFoQp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441775da-0d1c-4ad4-f807-08dedd3310c8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:54:13.1884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wm0fIiKyBwsSK+PgiXt3IuL8NDaa4U3YKOeA0zztHiUOWkS3bdZxpgcEkVcMT9LvkplzjrlbSfY/Be/CwATILIcBj7SWa/MUdVdTmPuq+3vhVtes5mqjHB4EE75tesoN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8323

On Wed, Jul 08, 2026 at 05:05:03PM +0200, Greg KH wrote:
> On Thu, Jun 25, 2026 at 07:31:54PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > kstrndup() returns NULL on allocation failure. The condition was
> > checking 'if (tmp)' to detect failure, but this is inverted — it
> > would treat a successful allocation as an error and return -ENOMEM
> > while leaking the string, and proceed with a NULL pointer on failure.
> >
> > Fix by changing the condition to 'if (!tmp)'.
> >
> > Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-sonnet-4-6
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> > index 5d201a2e30e7..e9f2632ce785 100644
> > --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> > +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> > @@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
> >  		goto end;						\
> >  									\
> >  	tmp = kstrndup(page, len, GFP_KERNEL);				\
> > -	if (tmp) {							\
> > +	if (!tmp) {							\
> >  		ret = -ENOMEM;						\
> >  		goto end;						\
> >  	}								\
> > --
> > 2.34.1
> >
> >
>
> So this has never worked?  How has no one ever noticed that in the
> decade this has been in the kernel?  Does that mean that no one uses
> this file/driver and we can just remove it?

I think just no one use sys interface to change name.

Frank

>
> thanks,
>
> greg k-h
>
