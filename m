Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795577508;
	b=2Dj7au7ixOfTha5VFnA0GQ7jDP/Tx7cGdGUQ4R92TixJlSDcsdmzURwA6HsBmfXpfzR1
	 fshFrKc6CtfYo7TiXtzUTkxuJAWDF+apK79P7YasMGuMb0tkvMmaBqbY+eWSS9lpcaIPa
	 ET1D805M4zTV6GL+6oJ7JkfWuWYnOf4LBmLP+e0mA0DjXGOCE0GPvUCTW6COk7ead//yj
	 t1DNkE78J+uzPOv3jcY5HOALqIvX+QcRZjVii129KKIKmO2DNnvH6I0MOvvoeuUqbUzMp
	 y0Qw+r/3DWA10DzvhLkVffcol+05/aaVDD823RFihOn0TaPJW54MstmX+CP9wJF/BCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577508;
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
	bh=bmwY3nIGCCllI67XV28UsCCibLxttxXqSetRcXTHUL4=;
	b=J95A0vOgyf5Abd89iErh2YrqahyJYjCfvCpzAxu+wGh+PDCgy2xA12UD4eVCH1rqg/Rq
	 nM5RALche940malAvuLcCOMBCkpUpWNRc7DokFJ50NNlZIZOuTVKwsOc16EBGX+j8DkAw
	 V0CRthSj9D6TJ74jVImm/vXE/0Cvy7bkMk+HkZ7IryUsDlzPBo3DsbwGTAeLb/G+SXC2O
	 GdN1FL6X+speCIk3HjYg8YquDgt6WQaRWqEmpATt9ZBIb+x7lGN1iLYeN58sQhmlie3Iy
	 2SytT9uPltRiUWuGsAcNyBywigR++DTx5ul2N+asFspV/AOZUMj1VDbrTiKYiJRdXJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mcQWgRvu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.17
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F07606A327
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 03:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F07606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mcQWgRvu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtROya0CgwWahnMI2PQmckvGHUG6BB4rz+IRtqaEFgwOfdE1jthcfdP62n7jallFBP8uomSEQxycqtmuptGwM4amyGSNLF3U0v+69xDKnduav9XPpYjC/3trYyjX4XfNZTavp83uxQqw3ROfBw0szu8Y+ItBMZiGnoNvVvl4/A1hKFBQyfvKt4QqirIdZ/UaZmvCTk4k1Hbsx0pjyI0XTyJUnzI6Yk8thwdzp3fTlbip52nVtYhCExXncQfJQL0zdCXOdj5bSdWCNPg7VsRU/ydTpcFO2z+aNHwu7DnxUTGUZSkvJyTh+xDYHN1hvT/VGYRdRbPsYEBJyNTnycvyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmwY3nIGCCllI67XV28UsCCibLxttxXqSetRcXTHUL4=;
 b=cTABY3Ngc3nj0MySBYoo5pT5cCjg2jirVuY/G6UPIFK+fMovF1B3Rv92rb7Q77CFWFEV1Gg95Kz+j4P//UgaKw/Gi1q1lWyxxxItGvASOqakxwq6xfj1wJ2nUtyLyE3rjmnfitzVg8PzxAaf8UN1ucm85xiD6BZUaMENxoI3RDfYn6n9xRF12DsYgK8Oa05ntHkh3N08acZRdMN0RQT1ay01hrI7vHbS8J4XXOqQc1PfCKPvP5Bz6zuxty/jVBWBOXrQ9rc8Fs1e1WzwWtVqGMey9VS37sxXaDMIH58Fsz6TWAstqjDYSIM7WNhULJKyY81r5DZ2A4xqSwdxkeEHcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmwY3nIGCCllI67XV28UsCCibLxttxXqSetRcXTHUL4=;
 b=mcQWgRvu+zcd8xXJDwa++u+J43UHqL1x6LuzWW+sNY8E8gjaYFHtLQJO++CMRsolJC8GvAo2i0X3cy1sW3aYxzgBll1n9j7EZQCn0AoRfO9Pa65ctStRlxBfXtlIpq9f3hf8RqMW/YhL79LtvCQp9Pk2QkAYTznJbrP/lIDz2/yNoF0308NMaBT2JqhTYuiYwEkCSYluvCuU3/fRLm18uo8AzNyAzeMq5QQfHxP+rCTlDBMvVVinZ+rsAFi5H+EhWs1Hj/uQsi/xSru2WjaDEcjopOA3OhYu2fOC5QO5UzR9e2eqmDYMJW8FFGU0vC9hqPRHYPMyrdOC0F/NtaUvZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PA4PR04MB9486.eurprd04.prod.outlook.com (2603:10a6:102:2a3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 03:31:43 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 03:31:43 +0000
Date: Wed, 25 Nov 2026 11:28:34 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/3] usb: dwc3: Group glue-overridable properties in
 struct dwc3
Message-ID: <fdlavwe72tsmgolrvja6g5rj7sucrsrmucduofm25g6sharr4w@ff4p5pgivsn3>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
 <5f9e2da1ed83ef3b640760b2ec2539481a59d65b.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f9e2da1ed83ef3b640760b2ec2539481a59d65b.1795559405.git.Thinh.Nguyen@synopsys.com>
X-ClientProxiedBy: SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PA4PR04MB9486:EE_
X-MS-Office365-Filtering-Correlation-Id: bbbb3afe-ed71-4435-0e2f-08df4aa49fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|261022105027099003|261026121527099003|10067099003|261026140227099003|261022075727099003|261028144727099003|261021123027099003|261102123227099003|261021121427099003|261009223027099003|3023799007|6133799003|10086099003|18002099003|22082099003|56012099006|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	e9e3glVXz99qo/OFoHEzgvJMh07DkbMNfXhNYRSGV5yzWiwAi0db4hI8AiWF+lS76rQV3yBhDcyZKeY5VPPvUGKXJ/BgwBntEupfS4jFP77I6M93NHMCIXR+dmeoMcUBpWbADbfmn1/tQNa5bKgyIUTAzkXLzqhMNwgGn+JwFUETMGHzMZEriTdMgz3r4BhxRgaGoWiz2J9JSyVfI7UVHaIySXawdVDAx+AW07CdSc/dGmpatZ+rzVeA571mxZjyZwIW3EVruMpZRhK6mC3pYYeGbD+0khDCD43818mcD5LW2rCY76C2S9S2n4CBJCbx+cfQrF8Yh6Vn5AseDniuZL2NOFaDkDMmrSpxeiuI9Ht3UDdYAcFW/UeiJn3cLoQz3TIT0Zs6raBnZwy+NDfYjZLDJUuV3lG/tsdQfQz1OK5FT+LzLtvNjrCUZBHINmkP+wyXvW2ppl1/hhRTUDaUqTMlNtApufTVi6FbT8iKoDV4BA87x1gTk0H814ZakXP9BDqAs5La0bwGtFymG8iptCTBwSYnGmkdEz8Z0VTP/Snk8Gs4560jo4bz+oDfhOdvsi8DrcJUno4EbRXiRii5oQdSqOcbk4r3Jw1mDwDo0ZW/vJ4t7ptCc0sin3M3J4X2xfxRssJ18LpH1elQg9G7e9H4obrXCmfz6JG8OfVkpkY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(261022105027099003)(261026121527099003)(10067099003)(261026140227099003)(261022075727099003)(261028144727099003)(261021123027099003)(261102123227099003)(261021121427099003)(261009223027099003)(3023799007)(6133799003)(10086099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RSsLErTo2La2W/rsSAfA4NpQj0rTMG0I0kk+uVmXbo+hUO/D/wvsgrKxy0i5?=
 =?us-ascii?Q?Ztu4sTQg+LyBKm8ny/Iuze0H6iJm61hFKtLOTkKi7I/ghUBXjmK03yAvi0/+?=
 =?us-ascii?Q?N0M3hoUiDMlpbjafh9ePmj4X1EEHN9txkrW/9eA2dTB/5pG7BvkWXHCuJ8yC?=
 =?us-ascii?Q?Hx0h2sNbz6+rHwSFmlJjroIf7BDDYyOIasMrpnbIK73VPN5jZkiBP5iKuEPE?=
 =?us-ascii?Q?iKVIOUfmfoJcmAtjONaJwJd64RbDS5amUVU4xEpGUuthUjwYVAETFryJnBEA?=
 =?us-ascii?Q?KhxH3SqRzI2h/3g+ihu8b4U8k8nYto/iWaSjr0NdeZgXO26rDADq0VEHUYbe?=
 =?us-ascii?Q?tS9Ssg92Un2SOLmHxVDsifNnn2snhNSXzluRuzgbu+5Bo/yrPjsdj5mDVVbn?=
 =?us-ascii?Q?x5dUDwACUV3E3ApN1RycfSVvXgLZLRg/3kEMcWQce0i0cCj6opE+A/UQM2f5?=
 =?us-ascii?Q?Lz2mnK/lgj+bhUwVDf/hoVFpBd0sjS/nHesx33dILb4NIVYf6B9MQrKtAOYf?=
 =?us-ascii?Q?Acdlep62VlguuWmd/1AkI96ywjYtsj3ydunsI43VcPf7yx4nzFjin2bFnx2X?=
 =?us-ascii?Q?gmImUpnJjdR1JofxhTzfE9/XaOSXdtGltRATQHfjnmoqzLlSqhi2dxLdlRD7?=
 =?us-ascii?Q?LhBtnZQFxq7LaoPsK2dGVhFfLhUPe3U20wCKQJ++xnHjKENHQPp2BvtSbKc6?=
 =?us-ascii?Q?iM844AxcqlLjauiQ3x/4iSofqr09onWgx8KwCESGuzoARKkrhpW/cQRBgp/Q?=
 =?us-ascii?Q?kxejKCwJ0NFmwhtItHxzwnpdCJZbAJHfA6X3pmX5O212Y4B/KFTeXEt9xi3k?=
 =?us-ascii?Q?GVcGF0bie+1W75SMbG+jDPJmtNgKrEDTYkz0zP4gb7lqbPZG8H9ZQBiA3OJG?=
 =?us-ascii?Q?/+ij4Zwgc+6/xSmTfjnimhUADa039LffoKMVnJ64FOOTOAvBSZErAGOCx+Kq?=
 =?us-ascii?Q?lIN9Mv+/xQpDs4fiLT/Hq6k/97iEvP4VT4F03Xcoe0NlgNsTq0s8P9g+7RZ2?=
 =?us-ascii?Q?gbz06S5vwEBFSVq6WoWRdtSC1KnYwGdse1hOsZL3xhfCZkf/BXld4h6apgVj?=
 =?us-ascii?Q?vB6zuoO3w6ZHWZbzynLZU94z9Nke5IGWjbAl6Etta2JbDdyuyDMfyVGlCBmu?=
 =?us-ascii?Q?HkPcBjb36lKd83yyas0wNeLgE9CrHODba11EHvMt1Qc8wskcNOSd4B7dlISb?=
 =?us-ascii?Q?VLeXb63jGE0/Gh2z7MuO6AnKDPJ44/3aOerk4nYkhUObq4MpI8jepQGLjSos?=
 =?us-ascii?Q?NJP4sF1ssEgcorm4WVMU4q+o59+XNkmxdzcDi51PH5MIYoWirILGc0e3zlN0?=
 =?us-ascii?Q?9wd5wEiXvLyIl7dHxrUi0WkcbNOsE7ONI3nIb3V2N7J0XZYFBPkDlhe/mr+4?=
 =?us-ascii?Q?0DSTxA/uctXRvOGblTg3/P4rhMqPqX1/XE1l/iR8J5ki49FrkDKggdOSLsY1?=
 =?us-ascii?Q?vHmqdLIXF0qmvHAhe0U4yKpTtnehmFKQlS99K92xV73XUMS0RM8BA+9RE0rS?=
 =?us-ascii?Q?1PPBMB8wAt7iGKgXXcbscZdg93N5gjZbMnC6j2ap0MozSE+DviyXSbaz619T?=
 =?us-ascii?Q?vyz2gl1aIA75PC9RFUFoTp4fD0gQChN1OCGzgu/SPgdaAv9psHwrGEIZUa1G?=
 =?us-ascii?Q?taoU26P7KzeSdhHsIRNA+h/YBeELet+T7JDBvWgQ3Oh54Qo+agcJ5PxqvdZR?=
 =?us-ascii?Q?Lgs0+w9Vmtt/a4F/cbmiHOgD8fpbiTnfTHncb8dqwRDqAc46h3wOvgGKK4yv?=
 =?us-ascii?Q?Pgwo6CgRhY/HSjyn+GKXguxouMM3T0kqOhyAfYpNar0kuL+AeDZf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbb3afe-ed71-4435-0e2f-08df4aa49fed
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 03:31:43.1247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tli8tXbre57j2imYUSm7td9LwGQow8AvVQIgy2uT+dc+H59VCJ9xY42OCrIiXVT1Xcpq7WNFeEGn4e+hfhb/S2t7uQuFIUYhN8Y/z0jZOet1C+1zCktgzmGVDEwfO6hW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9486

On Tue, Nov 24, 2026 at 10:59:19PM +0000, Thinh Nguyen wrote:
> struct dwc3_properties duplicates fields of struct dwc3, so every
> property a glue driver can set is defined twice.
> 
> Define struct dwc3_properties from the matching fields of struct dwc3
> with struct_group_tagged(), and move the remaining property fields into
> the group. Users of dwc->X and probe_data.properties.X are unchanged.
> 
> No functional change.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/dwc3/core.h | 163 ++++++++++++++++++++--------------------
>  drivers/usb/dwc3/glue.h |  11 ---
>  2 files changed, 83 insertions(+), 91 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index f635a9fbc151..d103a637a4f7 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1040,23 +1040,18 @@ struct dwc3_glue_ops {
>   * @reset: reset control
>   * @regs: base address for our registers
>   * @regs_size: address space size
> - * @fladj: frame length adjustment
> - * @ref_clk_per: reference clock period configuration
>   * @irq_gadget: peripheral controller's IRQ number
>   * @otg_irq: IRQ number for OTG IRQs
>   * @current_otg_role: current role of operation while using the OTG block
>   * @desired_otg_role: desired role of operation while using the OTG block
>   * @otg_restart_host: flag that OTG controller needs to restart host
>   * @u1u2: only used on revisions <1.83a for workaround
> - * @maximum_speed: maximum speed requested (mainly for testing purposes)
> - * @max_ssp_rate: SuperSpeed Plus maximum signaling rate and lane count
>   * @gadget_max_speed: maximum gadget speed requested
>   * @gadget_ssp_rate: Gadget driver's maximum supported SuperSpeed Plus signaling
>   *			rate and lane count.
>   * @ip: controller's ID
>   * @revision: controller's version of an IP
>   * @version_type: VERSIONTYPE register contents, a sub release of a revision
> - * @dr_mode: requested mode of operation
>   * @current_dr_role: current role of operation when in dual-role mode
>   * @desired_dr_role: desired role of operation when in dual-role mode
>   * @edev: extcon handle
> @@ -1098,6 +1093,25 @@ struct dwc3_glue_ops {
>   * @dbg_lsp_select: current debug lsp mux register selection
>   * @test_mode: true when we're entering a USB test mode
>   * @test_mode_nr: test feature selector
> + * @clear_stall_protocol: endpoint number that requires a delayed status phase
> + * @connected: true when we're connected to a host, false otherwise
> + * @softconnect: true when gadget connect is called, false when disconnect runs
> + * @delayed_status: true when gadget driver asks for delayed status
> + * @ep0_bounced: true when we used bounce buffer
> + * @ep0_expect_in: true when we expect a DATA IN transfer
> + * @is_fpga: true when we are using the FPGA board
> + * @pending_events: true when we have pending IRQs to be handled
> + * @pullups_connected: true when Run/Stop bit is set
> + * @setup_packet_pending: true when there's a Setup Packet in FIFO. Workaround
> + * @three_stage_setup: set if we perform a three phase setup
> + * @dr_mode: requested mode of operation
> + * @fladj: frame length adjustment
> + * @ref_clk_per: reference clock period configuration
> + * @maximum_speed: maximum speed requested (mainly for testing purposes)
> + * @max_ssp_rate: SuperSpeed Plus maximum signaling rate and lane count
> + * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
> + *		       DATWRREQINFO, and DESWRREQINFO value passed from
> + *		       glue driver.
>   * @lpm_nyet_threshold: LPM NYET response threshold
>   * @hird_threshold: HIRD threshold
>   * @rx_thr_num_pkt: USB receive packet count
> @@ -1109,26 +1123,15 @@ struct dwc3_glue_ops {
>   * @tx_thr_num_pkt_prd: periodic ESS transmit packet count
>   * @tx_max_burst_prd: max periodic ESS transmit burst size
>   * @tx_fifo_resize_max_num: max number of fifos allocated during txfifo resize
> - * @clear_stall_protocol: endpoint number that requires a delayed status phase
>   * @num_hc_interrupters: number of host controller interrupters
>   * @hsphy_interface: "utmi" or "ulpi"
> - * @connected: true when we're connected to a host, false otherwise
> - * @softconnect: true when gadget connect is called, false when disconnect runs
> - * @delayed_status: true when gadget driver asks for delayed status
> - * @ep0_bounced: true when we used bounce buffer
> - * @ep0_expect_in: true when we expect a DATA IN transfer
>   * @sysdev_is_parent: true when dwc3 device has a parent driver
>   * @has_lpm_erratum: true when core was configured with LPM Erratum. Note that
>   *			there's now way for software to detect this in runtime.
>   * @is_utmi_l1_suspend: the core asserts output signal
>   *	0	- utmi_sleep_n
>   *	1	- utmi_l1_suspend_n
> - * @is_fpga: true when we are using the FPGA board
> - * @pending_events: true when we have pending IRQs to be handled
>   * @do_fifo_resize: true when txfifo resizing is enabled for dwc3 endpoints
> - * @pullups_connected: true when Run/Stop bit is set
> - * @setup_packet_pending: true when there's a Setup Packet in FIFO. Workaround
> - * @three_stage_setup: set if we perform a three phase setup
>   * @dis_start_transfer_quirk: set if start_transfer failure SW workaround is
>   *			not needed for DWC_usb31 version 1.70a-ea06 and below
>   * @usb3_lpm_capable: set if hadrware supports Link Power Management
> @@ -1151,8 +1154,6 @@ struct dwc3_glue_ops {
>   * @dis_u1_entry_quirk: set if link entering into U1 state needs to be disabled.
>   * @dis_u2_entry_quirk: set if link entering into U2 state needs to be disabled.
>   * @dis_rxdet_inp3_quirk: set if we disable Rx.Detect in P3
> - * @async_callbacks: if set, indicate that async callbacks will be used.
> - *
>   * @dis_u2_freeclk_exists_quirk : set if we clear u2_freeclk_exists
>   *			in GUSB2PHYCFG, specify that USB2 PHY doesn't
>   *			provide a free-running PHY clock.
> @@ -1178,6 +1179,7 @@ struct dwc3_glue_ops {
>   *	3	- Reserved
>   * @dis_metastability_quirk: set to disable metastability quirk.
>   * @dis_split_quirk: set to disable split boundary.
> + * @async_callbacks: if set, indicate that async callbacks will be used.
>   * @enable_usb2_transceiver_delay: Set to insert a delay before the
>   *			assertion of the TxValid signal during a HS Chirp.
>   * @sys_wakeup: set if the device may do system wakeup.
> @@ -1193,9 +1195,6 @@ struct dwc3_glue_ops {
>   * @num_ep_resized: carries the current number endpoints which have had its tx
>   *		    fifo resized.
>   * @debug_root: root debugfs directory for this device to put its files in.
> - * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
> - *		       DATWRREQINFO, and DESWRREQINFO value passed from
> - *		       glue driver.
>   * @wakeup_pending_funcs: Indicates whether any interface has requested for
>   *			 function wakeup in bitmap format where bit position
>   *			 represents interface_id.
> @@ -1259,7 +1258,6 @@ struct dwc3 {
>  	void __iomem		*regs;
>  	size_t			regs_size;
>  
> -	enum usb_dr_mode	dr_mode;
>  	u32			current_dr_role;
>  	u32			desired_dr_role;
>  	struct extcon_dev	*edev;
> @@ -1276,17 +1274,13 @@ struct dwc3 {
>  
>  #define DWC3_CURRENT_UNSPECIFIED	UINT_MAX
>  
> -	u32			fladj;
> -	u32			ref_clk_per;
>  	u32			irq_gadget;
>  	u32			otg_irq;
>  	u32			current_otg_role;
>  	u32			desired_otg_role;
>  	bool			otg_restart_host;
>  	u32			u1u2;
> -	u32			maximum_speed;
>  	u32			gadget_max_speed;
> -	enum usb_ssp_rate	max_ssp_rate;
>  	enum usb_ssp_rate	gadget_ssp_rate;
>  
>  	u32			ip;
> @@ -1369,71 +1363,81 @@ struct dwc3 {
>  
>  	u8			test_mode;
>  	u8			test_mode_nr;
> -	u8			lpm_nyet_threshold;
> -	u8			hird_threshold;
> -	u8			rx_thr_num_pkt;
> -	u8			rx_max_burst;
> -	u8			tx_thr_num_pkt;
> -	u8			tx_max_burst;
> -	u8			rx_thr_num_pkt_prd;
> -	u8			rx_max_burst_prd;
> -	u8			tx_thr_num_pkt_prd;
> -	u8			tx_max_burst_prd;
> -	u8			tx_fifo_resize_max_num;
>  	u8			clear_stall_protocol;
> -	u16			num_hc_interrupters;
> -
> -	const char		*hsphy_interface;
>  
>  	unsigned		connected:1;
>  	unsigned		softconnect:1;
>  	unsigned		delayed_status:1;
>  	unsigned		ep0_bounced:1;
>  	unsigned		ep0_expect_in:1;
> -	unsigned		sysdev_is_parent:1;
> -	unsigned		has_lpm_erratum:1;
> -	unsigned		is_utmi_l1_suspend:1;
>  	unsigned		is_fpga:1;
>  	unsigned		pending_events:1;
> -	unsigned		do_fifo_resize:1;
>  	unsigned		pullups_connected:1;
>  	unsigned		setup_packet_pending:1;
>  	unsigned		three_stage_setup:1;
> -	unsigned		dis_start_transfer_quirk:1;
> -	unsigned		usb3_lpm_capable:1;
> -	unsigned		usb2_lpm_disable:1;
> -	unsigned		usb2_gadget_lpm_disable:1;
> -	unsigned		needs_full_reinit:1;
> -
> -	unsigned		disable_scramble_quirk:1;
> -	unsigned		u2exit_lfps_quirk:1;
> -	unsigned		u2ss_inp3_quirk:1;
> -	unsigned		req_p1p2p3_quirk:1;
> -	unsigned                del_p1p2p3_quirk:1;

> -^Iunsigned^I^Ireq_p1p2p3_quirk:1;$
> -^Iunsigned                del_p1p2p3_quirk:1;$

It looks like the whitespace is inconsistent here.

Thanks,
Xu Yang
