Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013069.outbound.protection.outlook.com [52.101.127.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEBD3EA962;
	Mon, 27 Jul 2026 10:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148085; cv=fail; b=MLyMcFwinkqrGGelFgiklNHHZGfDAH7Nu6cz5aR7xeWhDXMQFqWVEL/qAtII7PH+k/+pPVPkBFpVpt5jsZsBiz+BzDJcENpG/AygZBc01mgJ95scU5ByI1EdRg9uowhoVtmwL6iPxn5UR8rzXOE3+BZR+xqVvd76sI4LmhYNKEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148085; c=relaxed/simple;
	bh=aB4h2X4AWJ+xlIeqWzctuJc44Jxocuc5fQzCjXoieRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k+w1YP5Tp/pnVEXY8DLSjqBxOs6P6xA8MNueKmOXcxDd/Xibj416kJPyGYGPwjQZZz2cz+7zM/xxTFs2x9xXgZVHwDev8bqlSn49HPSfs1zXqXMSm1a44r4OIdxpJUGYH28A93WjIY8wXiLEZ/PKGCFmpzihJeDmEPKe3UKcPxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=fqxxBK8K; arc=fail smtp.client-ip=52.101.127.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="fqxxBK8K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Il3RsuB0XDNJsCiH13mBPSX0073jY3TFHqTzPHS2KPRt8Gwh/oJKvA/dIhKCnggIR3dsfwFAaBEQt6oVp1Hu9yC3BjiqAo9jTnqGqfqYoScYBWXPACJb4q1kInG659JdXaUCfhp6gvrZV136dZ5LbssVBgXvlvM/pPUpfHO3HDmzZ9vYlNc00P4YxzRf8k77WNDoxuyUD8LXib/J1eh2sFgopSIUYpi+ZnEFINUuSGPDnXT76CUHo4CebpSvydG8Fn5K/w2sQ271mZCGBx3UL0ocbc4d2L65dgJHAys2Jgtmak7DbCn/19S/H426cMCHQG1iMrb7kLLGxoFrdEhuAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRpuM1veradlbWl0EV4bznQ+j6TOIEzII2WWL7yDcEQ=;
 b=uhnCsHVxT/5mQlznlzDEd9bZ1xsOQnwZBhgUkV4fB3KWG2AByeyutEV1DdTmiW+JrV0ydQNkXXdO7COOJZsHh4AgRWkRjfM4sD0IcBPB3bqBfJgp5C2jU18/ZhW76XF9RPwe51t8i7AxTj8Woq6qLGTIHV52+L6RjRZDKgUNLu0yGDf6YHOYuu4/WxV7lZlJAcFAgeZF+fRIeshAzME66k0c73JY0fcg6o0QRu/iJL85U151CwKxlNJGmXMycXWBrhBTG6rPGeqtqWELIRwHZJ+gmXQ8Qj5mX9WUkocbPo1Up4cPptZ2ExIe5oX22oy9IXfd/XbX/5HbHN6UPCMG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRpuM1veradlbWl0EV4bznQ+j6TOIEzII2WWL7yDcEQ=;
 b=fqxxBK8KDyR3TfWsoE8Z8aJG4OOZo9hEmtYDUToDPW3jpTHAovtcuctdTWdY0mIxmEQ8aN3jByovBzIlha+slFoLZQllyDNwXh3cfBItNp/vYJ06OaAzM3N9H+6hshqAEJOZKRO8/3WVhBU8YZtWwWz0oJvtg4FQr4ODlZTq+vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TY2PPF92D7F20FA.apcprd01.prod.exchangelabs.com
 (2603:1096:408::3b7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 10:27:53 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 10:27:53 +0000
Date: Mon, 27 Jul 2026 18:27:43 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com, Epson.Chiang@moxa.com
Subject: Re: [PATCH v2 1/4] USB: serial: mxuport: clean up firmware version
 handling
Message-ID: <amcyn2CmU5ThICTd@moxa-ThinkCentre-M90t>
References: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
 <20260623080138.166398-3-crescentcy.hsieh@moxa.com>
 <al-DXpI52HuWBNwG@hovoldconsulting.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al-DXpI52HuWBNwG@hovoldconsulting.com>
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TY2PPF92D7F20FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e900e6-5e74-4f95-3ab5-08deebc9b764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|56012099006|4143699003|10067099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	GamPfxO0C3Ag00KylY/eHSmIVl8Wfrs3PHWr+KL1Ug6jxU5H54o1HHWacGDJAk4ttN6lswLPLeOchSn5ZWhrI2RHaBwEDreYI2lTzI/1WBbpS//syQxnEmroHnRWAXWBffX05K1AeInTyMbekKsxAY1NN3agkVaOl9hndwgxHV33o5g7l6FGioRkGOq0gfMg00VF9FZqRdkI10cekKMyMrJDfj6hEycje2liLvh8G3MergPLrUyDIfNJsDt6e07CAqFWjTLtxU6PWMyLCC700jr7MnzVOv/OhtggFeN/HI1nPahs2tWzrejSYUAz+hiyfZZmydU5w9lWNhS3KZq+A5Kd6vP4jdOXnsX6oEnux34p+dWdmQKKXbKHekqwhFU7/M3Kzu0blThFxSYUWcGobj9Sh4wZJgMn00zGdiKTYnwwTjnJuVFs2NM60hVLq1wVUobVFMJYN+kAKte8NbYfr1WMWqX21Y0IF7kG+nXKJH9v1p/I8IF4KMjQgVjGjVkrs5UFGOSy+vkbkFj9QiCaaA9WqwFic0ckGDvENFH2jxjDwRMC+5+kspPgNBgWrv+CgOfWo8Tp2o7m+UtuVXNMiql82M3QYfLwFT/WXEBNpDrV0hyozslsdboJdnu7fE40TmpXDOqYzDSiWgKmaN9Dxh6Ggc3jkAYefkAOyNQ9UOEOwwnI3mQwwbvOC9zG2aGX/Y/zKXEgRdH1rWCR6aAEFB8OgJHobUW0czMw7bacBI8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6UxwbK6ica2YpybKhK57/bXTHz7Db1ssSolJKH1l0zQMLCo3PtSQoQVju4kb?=
 =?us-ascii?Q?gPVRvzqjGNt351FdozC+tctD2z9oaf3JhZ52YBdTCnididGEL7EA1f/pmF6H?=
 =?us-ascii?Q?KZlRYrSq58h8xgmWC3aDb/2PwaTK95dT72sm6qH/rIrjapae4lNHuEUU9Sbe?=
 =?us-ascii?Q?vnHWnK+b/BgA5QsjqdMjDhpMBm8h7tB3Rfoq+vUP+yVF6bA9EcEgW3HLhNp1?=
 =?us-ascii?Q?jZXkQDrS546wfDgLdNreuzJO+qLAgETu+ZdrkUJaw19ao0pKXx8I9iDByLdC?=
 =?us-ascii?Q?bfR5xwEa6Epby90/BlfPbHOzEHk2kXuFRz5CpkCVBLfkzolyHS0sr9JUcJzY?=
 =?us-ascii?Q?VMKB92NrMIXsFRNPvbfkuBceGu4kvoZhRcKA/2lIXiGQMOCgUk2ZS813Zjy6?=
 =?us-ascii?Q?wzYivDgNyrHEynGpF0+AQ3OO+uoJ7zuXsQxFx91A5guXBEZcDzvIdyByjDn9?=
 =?us-ascii?Q?+5++23FhHzKWqCPDR6lESgtVNuHnapf2FlXNRrQrffEgtTk7kDtjbmhdCUk0?=
 =?us-ascii?Q?y8cO5bMZwh2xabZqJ17K8/YoQwfOtMvFopFS6g7WwN9w9VevGRu/qZPZqfDf?=
 =?us-ascii?Q?ayERhApqZzMAbk4y0/MmUTm7nId+Yy4a2iha8aLHec537ISZietOrlgACFSP?=
 =?us-ascii?Q?uBZF1l8rd4YxGlje7t0zFfUHaVuWZaE/bvD3wHy/1AjOa1I18cSnzUM7WYxU?=
 =?us-ascii?Q?78YuwMSR1LmP+hgCTsvdfa7WvlI7+WEaZIeGBF3/55MMARauo2jOrSkyBak6?=
 =?us-ascii?Q?bnU1cdrkMWjKYMuBgvubvni/d3/V5pglHK2nAsnFRmqdzjTd6kkfFfttd9OM?=
 =?us-ascii?Q?tgtrqGyHE1BeynLdjjRtkbtmjVSKUwZjlv65SM9ywn3BlJFee1xj0U1lks1d?=
 =?us-ascii?Q?XZ79AtnRrXUO2gtH9e7Vg+r3AaFixGl23rkTud809LQhE1gKYiJHp86St1+a?=
 =?us-ascii?Q?Pzm6dFrbOeVWt3kVw8XKq+fRDakFkgMK7vh1/0s0Vwt16I93kAeNlj80o8yJ?=
 =?us-ascii?Q?/RuudAn3VMNqcY5It/akId9i9sNfjAPDKhx1JrkkzExWokFHcVGx82vlyd+Z?=
 =?us-ascii?Q?rn/beOTpIB5ltk1fGQG0d8X9x6LwtOnZvqrsORtAnqsCjkLFTpp173XyDThy?=
 =?us-ascii?Q?J2Ip1hh4j03SgTmzwcJgPp8F31FbroIsCj5jsencNTeKKXLhIyltJ+o39HxP?=
 =?us-ascii?Q?ZoVQRVbrW7u4LnOKSWpX9yAkSEBMZ37LdMnQLtUjWpBItKW0h6psoIiUkHSx?=
 =?us-ascii?Q?+6CWF2QlTEsUECRKTxMxqV91KEJDwWqUyK8S6W7KOdsFzPQqQo975GJXQfas?=
 =?us-ascii?Q?3OfB2teFscvQWdHEGtlYfnhCN57o34BeJcySCUQrou5x270PwKxltGcN55Zx?=
 =?us-ascii?Q?RQiR7Kzhl+ROppljxpohvYRbRjJhYcH8TyQd0SVf2DVjwDv0gFZZpi/KzXLy?=
 =?us-ascii?Q?WEFosbvxXp4BuJ/sA9/E8e79MgoFA7TX/xXcJXGe7Wj52l0ghDGtBWiJkS46?=
 =?us-ascii?Q?pp+WZP45E8bg2Ts9Eq3K+KIyb1zVD62390n6OG/N26kD4iPBQu+mMOG8fc5X?=
 =?us-ascii?Q?2KFHlVjDe08DTNDmizUfDnxUKA6HMVEw65aK517qbcLJuidnV9HPHyxUwLuF?=
 =?us-ascii?Q?JLsqpz1us3CWYh9yxuffbgsAIU7in4pK30suxVS76D3Vk0hNqO7i434CVMX9?=
 =?us-ascii?Q?568YIk8yDtQm8D+CgLZ7heA3wLmqw9SV2rC7MNX8rcEwgKjAWNfbPAmcQNvc?=
 =?us-ascii?Q?deUTm3XxUy4M0pblfEiBSZZt4N9M4og=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e900e6-5e74-4f95-3ab5-08deebc9b764
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 10:27:53.4347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOPorsiNmqXx0VZX/hJsGXqj9q9QB6pPCE2r/QxGHXfdQAX3yDrX3yP3vo2MoxjvrDNHbtHCMBmistJI6s+juHuzoSEO7IXJenLfHPkwYLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF92D7F20FA

On Tue, Jul 21, 2026 at 04:34:06PM +0200, Johan Hovold wrote:
> On Tue, Jun 23, 2026 at 04:01:36PM +0800, Crescent Hsieh wrote:
> 
> Thanks for the v2. You seem to have addressed all my comments on v1 of
> the series, which is unfortunately not as common as I wish it were. :)

Thanks for your review comments as well. I'm glad to hear that. I just
want to get things right and keep the code clean, even if it takes some
time. :)

> > @@ -970,8 +982,32 @@ static int mxuport_calc_num_ports(struct usb_serial *serial,
> >  	return num_ports;
> >  }
> >  
> > +static void mxuport_set_fw_version(struct mxuport_fw_version *version,
> > +				   u8 major, u8 minor, u8 build)
> 
> The naming is a bit unfortunate as this is not an inverse of
> mxuport_get_fw_version() but that should be ok.

Agreed. mxuport_get_fw_version() retrieves the firmware version from the
device, whereas this helper composes a local version representation from
its major, minor and build components. I will rename it to
mxuport_compose_fw_version().

> > +{
> > +	version->major = major;
> > +	version->minor = minor;
> > +	version->build = build;
> > +	version->value = (major << 16) | (minor << 8) | build;
> > +}
> > +
> > +static int mxuport_parse_fw_version(const struct firmware *fw,
> > +				    const u16 *offsets,
> > +				    struct mxuport_fw_version *version)
> > +{
> > +	if (fw->size <= offsets[0] || fw->size <= offsets[1] ||
> > +	    fw->size <= offsets[2])
> > +		return -EINVAL;
> 
> I just merged this sanity check:
> 
> 	https://lore.kernel.org/all/20260715084611.45995-1-pengpeng@iscas.ac.cn/
>
> so you may want to rebase on my usb-linus branch if there is a v3,
> otherwise I can fix it up.
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/log/?h=usb-linus

Okay, I will rebase v3 onto your usb-linus branch and resolve the
conflict before resubmitting.

---
Sincerely,
Crescent Hsieh
