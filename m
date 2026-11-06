Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793953112;
	b=x+odyASCe8abaSwKW00nwJ+r4W4Q9DJf2VqyWviWdrTaBVJTdwYV/JBynCHvapPfO5gf
	 A/Atxv0/2CuJJRt3WceJZTqnzDouqNDK68w3uKB+raABes970+FNqHwe9toZoT0vPSs6/
	 2y2+JhTXBQiTScNMkMNHfhPiTmms4i9Dn5cH7t6ecLwuFD/UPRC3ljbHVy1vWmIiztJJp
	 ZDkRZwCzNJjaHM4p0GXk67kdCiSN4HbHBcVBp7NE9a/PPm1HMhCZDjokryrLYEEgq5Kn3
	 Cz2D0XUM7BNndXc9lVRtMiFWtky4gkH9H7NqcaSIwKHuwGfk2JJoO73T4rdZYknxwSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953112;
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
	bh=OQxpTAoyjLh02UA3I5HA5HJYwKmyxefCRNjJ3lfygxs=;
	b=vArCa5XYPCHvPNfSFzyi41bzL0KEiaSgNRw7/B154YpBNtRbeN1RhDXrXUj0lwZxp617
	 y+pIqUH4pKfoL5X2kW2q9WIK2vkWH4fk4E8kJejRlIquC0j8NU+aN0AHMtS8Zl4rlKRkM
	 yN+z9sjPOfdo7aVusZbxekd86FD9la/xefu0k6+qFfE7AYmA9/9/z6SjonL5KItHUc/4l
	 wKazzkX1N3jzAQuFBzrJggRhjF7OvrdqbdqXIH0rtleUyJnTiQuaDU168kmgpNC+4Lvgf
	 lxKRUAKmTjTuLEAymHJohbo00SHgXZfrhWfry4WVHsoiYb6VyTnhffpu8dz2A77+h/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ULZxnZAm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.39
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68135606A32C
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 08:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68135606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ULZxnZAm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfyyQtWekN6N6EEeMkfRHZg5TfNvqZ9+lD0CGkU1wisvavXEUFGXX6lREASE2A13y52xgTEZB08wIPSj6mSNp0wghZjIzKFGDW9UnSQ8vplwDokXvHpfDz5ElP9UtBidb8OxYquCj+TNXiAzCLB8gvHAtofUHT+dxm5/cVDk7rTzQFyFPvwTnqGXrY1x6lxsAX+YFC6UpTZmyNwCJGxbSTQPO8Ki0sDHendfD1vJPw9JSqTH6x4Wfcs9Dis0gItxYziLucZ2lTEX09anMvHqFatvFO5QOqNa8pZFZCIAoYglPETHUarrUC/BTkbq642jza9HZAE58m0oZRWUqUCMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQxpTAoyjLh02UA3I5HA5HJYwKmyxefCRNjJ3lfygxs=;
 b=thVZ/PZsQLQJqGfWxzpUQITU+P81m2Zt0gefCOB2Ql8vl4giX2X9ve0AVqHWpk1TuV3rnOxcxDk3zHRi3Gf09Vwrzb7L+2j41fVe6Hrv5T9+tDdXuptnqhVLK1Rmwd8m/04K90smewyJ6teC3Ft+xohGTYrGUjCwHCJpdisTk7MyTywwpSUfluCd4DHNhfRAAGkt7lLiRDRy5kPIB/qN5L94XIR82AXEq986fZurmi69VsQgLV4eUyItXSh8NBT26L1Er5J9Q+aV/8Tp2B/Hh/AcUEHI6aQHDXWmG1VrZmfSxn3Cestb0Owdp0ZG3eNAn5jDbWsPBEDpXHw0yWpisw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQxpTAoyjLh02UA3I5HA5HJYwKmyxefCRNjJ3lfygxs=;
 b=ULZxnZAmUrESazqnf6bfZ7AF2qBmNhQQFaPXujujXX7ih57OY+QTFvaHG8r27mVIUwXVgHhicQLkGVCuMFBxOyppxjsX/LIO7EWd86rnHqWMTnqCOjlq7gAUjQ4MApnZFKURn3FkOkoJ2dRBXRA8fVMdBAZfQP9PmY9NSCMcPjV/lPikojAFd0x+4bjR8s8ys+wzAMvgZ0YHrMUc/yTIhI17qM/xmtjaSn9XTlkEPZay2CCD9umr9FQYJeX9t4j8y+GFasNdFLVF5jLKJV3yMWKnRk1LesQho6ZpjMFqhSnD1YziwUHUHCMJoWyH6zoDQJMkCVu343UdIPAw+K2ukA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB8511.eurprd04.prod.outlook.com (2603:10a6:102:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 08:18:28 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 08:18:28 +0000
Date: Fri, 6 Nov 2026 16:15:29 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	stable <stable@kernel.org>
Subject: Re: [PATCH 1/5] xhci: keep port link_inactive and connected flags in
 sync when polled
Message-ID: <ulbdj22eo6rexjcplytktrmvdvfpw3sdpyvtc6guamwgm2spcn@qdycxbz2pr7a>
References: <20261105175106.241182-1-mathias.nyman@linux.intel.com>
 <20261105175106.241182-2-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105175106.241182-2-mathias.nyman@linux.intel.com>
X-ClientProxiedBy: AM8P189CA0004.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: e13f2859-54e7-4a3d-d955-08df3bde894e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|261022075727099003|261026121527099003|261102123227099003|261022105027099003|261026140227099003|11063799006|4143699003|261028144727099003|261009223027099003|56012099006|261021121427099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	IQwjqgDnvFnAvR/M8H+kidf8wIEbiU0ZRI9MDuA5NbtPCaRel1RT1TtPXoLdE3stJOlqFYUwUIw5dTMqikw4tA02rKaQATAhD8FT+vcKU5MlrTfY2RgmDxrKL9j6wIE6F8UErqWSw7/vZ9A1/5lu9Rv2aBwhWAy4RbKmXi+06szbqXlswzNFvdQCMBJbW3iH+HmYAKWarE9qgJphnrol6/eMR/aHkehEms90ZI75niwYBERX3WFGDMFPzn28xgNFhlSW+0UdXHMLEyLt7Lvy5H/vS6hDA3AuzjxH+7ELN6NlYNmFHZEZ4hzt2W029fRaY0aSqXpeidVym6hpcRu2PIZYuV3qLDE4mwUNlzK6GxvXFhofmf3Jgn2HLb9c6/zFxO/Eq5vxQMvoP/FEyTY02M3w0c88PYDGgN6POHw+epub9hMCTGyo62jdUqpNSJ2rFpKVtP/LXdxlQv4V1hHcbOCprzEBexcB0obZ5Y5Nz1vmSCSC6AFgGOoAGo8uU8VhdiixJUxjXr417Kook6Z+w8xdDfQpucHeQc8hV3re+5FZipJPYP1aTinSQbn07ViJXOwhFc7Vlz4M58UrsdCdURIViYpJEm1kjOrdC/JXurRlsLSusPdLKpKpTMFGAyfx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(261022075727099003)(261026121527099003)(261102123227099003)(261022105027099003)(261026140227099003)(11063799006)(4143699003)(261028144727099003)(261009223027099003)(56012099006)(261021121427099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zMoqDWIRKVxBt7D9ncgbjbcyeNywNIDVwdp7d+vJEpXcLQypUvwXP8Zs2Yqu?=
 =?us-ascii?Q?VZZZBLQkAo3WdYruicj0nx/5DJRgsv4gpCNBcpcNcUCspyzYxU/1/KP09IBb?=
 =?us-ascii?Q?FKgeBAE6Ul6/vFoKuWxwqi6gfn1YjkvKMS7EJkXIHHI87ra3yPsPfVgjn+Z8?=
 =?us-ascii?Q?MbtV9LWw5kRYLIMM35WKzATwonFVcRa0XWh986RGmqhSr2IRyZtuSw8+zXx+?=
 =?us-ascii?Q?dQFOmIA3vcxx+XnwmlGeRWNWG6yX27E0eSPoSwKalzAxIyfURxVT1YvAeS93?=
 =?us-ascii?Q?oJoSbYkXUd2EtzGIOoa2weNhWDNpH4DJ5Ub+8TZzsMAJhCQC7Kl+RXkjMLzF?=
 =?us-ascii?Q?HJX1mt43nuwHHEGKvhVOZnnnTxApxuXMMkT0jKsrc1DmMZV7mNsaNwmIaawM?=
 =?us-ascii?Q?rt3Z/IGDD54x0ZqFMKcy1iw0qFMGH+ItAD24r5kwPK8UmJPqeJj2JkkRkk9m?=
 =?us-ascii?Q?wsVF2oGL5tSfVBS7aiIDv/78qL7jZTfv2XsvojgUvMu2JqEU7aSfsgnBHuu/?=
 =?us-ascii?Q?xnZefVPECCfLiNmOzUycE6P68Lw6Yw6xUSCaatDvWxPD2aWJCvTS55/xBDXT?=
 =?us-ascii?Q?ONMf2tcMh5bt4V1YsmV97yIzuNI3xKIieRhw8cf+03otIYGlpRt64oRheieY?=
 =?us-ascii?Q?evJ1d0wuTzxZtqdHWP5gcwEO8lcbafboQpVHMTRK8zxxXMRkopQli0mkZDG3?=
 =?us-ascii?Q?mBjnizhHCqy1ypO3k7ytD6nPEFPrlI3FWjSEn1H84eVWQ74GUkYI+pIlqJli?=
 =?us-ascii?Q?nWLiQZDAgVR76DhIZAopRZF1Msepx+VyLXhv6KnObxI9E5bZGmD0JSadJAvo?=
 =?us-ascii?Q?YzgwtqM7CpkWCVKQz6sIJ4d5QJ5GBBY200BW/CTBpel9GNT8OYaplJ1Cwiae?=
 =?us-ascii?Q?rdhPIv8B+VEKSp7dAH5evi3SJsIZDXeEUPJGFhO3xYclcp6oRRmrnD/vfDnX?=
 =?us-ascii?Q?yY1SOrESVl0/8wRqpVpzJxmrg5KSGCZ6n9fPgswktcExCFQgdl8DVPdxTbG1?=
 =?us-ascii?Q?a6CxTmBBKGB7ls9+xdjawpzsCj/OVGXKPQKYPmCVdQyFl8HbOwYmtiG6piRy?=
 =?us-ascii?Q?/IFr10wNjScJ+d2ZsGDjCyoBYoGdWiKmqKRIxv+1DjTp4lf/IuOLCjcPA4dQ?=
 =?us-ascii?Q?G4550L1c532jMfe2S1HJKMIrd8HPxsDKWkYdKvpuLLPnrH+VBG5GaiazUusK?=
 =?us-ascii?Q?MHW3AbOmeirFcq+m9kb7iwGezCHjJXzxDwxGHcPHjbRvt4Hx4vVf4IO4RcdH?=
 =?us-ascii?Q?pCTI0ZYaoi+CxuDGd/NX4a3S3wL2oP3E1XFo+YawmloigdfClKkBgKFGxoyl?=
 =?us-ascii?Q?54rNByx0Ky3N4sO/SfuzNsuDjOKQ+3LRY0Brz3dy9JOvHKKbrUtsCfeM4kYz?=
 =?us-ascii?Q?0ZEkYjPIzBMnudpWh3nhr4PugxNVibOu1B0YJZ5XLm5Q3zv+KGLXbdSC/VlM?=
 =?us-ascii?Q?1tGXrUBWkkGW743KjWrGNiX2Ux3TwNWDRqctA4gd+UdwiE+YJV4vo3rcj+Te?=
 =?us-ascii?Q?ec8H9vrfVHOOme4iNOrF6w3pLNpg3Dac+VeXHsobVe3x6K9rVTdOkWQ++nkt?=
 =?us-ascii?Q?pM5k8tbAIR3cbAgEaOcHom8I0Gtq8OKFl54UErmFQ0/7Bzwk7Ysp8tdPPCgy?=
 =?us-ascii?Q?SVHvL4GSZn5H1XE/7s6VJMRGnaAfD2gDu6iTcStIIwUpMcac5CferEZXHeXr?=
 =?us-ascii?Q?uRgks08sSEu1DzNc4bwhPeNLymxDVDo1DXTUxkQqvSQ1xWfx3hzuSYNVKzDL?=
 =?us-ascii?Q?IzxeNXb3ZvSN4Mezp3FPlzaI0QCCnOalcqC6NiuqpOK5nL4cZqZ4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13f2859-54e7-4a3d-d955-08df3bde894e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 08:18:28.4048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WM4QJwdt+KiC41DwTD0p6l/K/kW6gP4bCF4GAaA6VX+DMPyO2jIeARG7s5/+TmyQoMb9brNugmjuYmZB08mr0Eoqw8N9VIFU6PDlqUZTEekYXd7sNgtdnmtJV978u7B9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8511

On Thu, Nov 05, 2026 at 07:51:02PM +0200, Mathias Nyman wrote:
> Update port 'link_inactive' and 'connected' flags even if xHC isn't
> generating port change events.
> 
> xHC only generates port change events on port changes after old port
> change bits are cleared. Hub driver is often kept up to date
> by polling the port status.
> 
> Sashiko reported a possible case where all port changes after a port
> reset take place before hub driver clears the reset change bit.
> This way the port can end up connected and fully running with link
> in u0 without a port event clearing the 'link_inactive' or setting
> the 'connected' flags.
> 
> A protocol STALL in this state would set EP_DROP_PENDING, and
> prevent all future URBs for the endpoint.
> 
> Fix this by also updating the flags during get_port_status(), when
> hub driver is polling the port state.

I have encountered this issue as well. During system resume, the port link
state transitions to Inactive, causing a PLC event. However, neither the
xHCI driver nor the hub clears the PLC bit. The hub cannot process the
event either, since usb_hub_wq does not start running until it is thawed.
As a result, any subsequent link state changes do not generate new events
until the root hub port warm reset is completed. During this period, the
USB device attached to the root hub may be treated as disconnected because
all control transfers continuously fail.

This patch works for me.

Tested-by: Xu Yang <xu.yang_2@nxp.com>

Thanks,
Xu Yang

> 
> Fixes: 6895dbdc19d9 ("xhci: give back TDs and clean up ep0 after disconnect")
> Link: https://lore.kernel.org/linux-usb/sashiko-outbox-190046@kernel.org/
> Cc: stable <stable@kernel.org>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci-hub.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 470bafe1802b..55430b673f1e 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -1166,6 +1166,12 @@ static u32 xhci_get_port_status(struct usb_hcd *hcd, struct xhci_bus_state *bus_
>  	if (portsc & PORT_RESET)
>  		status |= USB_PORT_STAT_RESET;
>  
> +	/* track connect and link error status when hub is polling */
> +	if (!(portsc & PORT_RESET)) {
> +		port->link_inactive = (portsc & PORT_PLS_MASK) == XDEV_INACTIVE;
> +		port->connected = !!(portsc & PORT_CONNECT);
> +	}
> +
>  	/* USB2 and USB3 specific bits, including Port Link State */
>  	if (hcd->speed >= HCD_USB3)
>  		xhci_get_usb3_port_status(port, &status, portsc);
> -- 
> 2.43.0
> 
