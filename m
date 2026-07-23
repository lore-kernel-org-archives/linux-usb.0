Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AD2D5436;
	Thu, 23 Jul 2026 03:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784779186; cv=fail; b=Xsf1HJdiptY2qRdd32Vd2Rm7UXoeqbpqr0HbzZM/4AleABCbX4ZELK7lcuhp1y8vQa+CTKET9yQMhzKCd+3lO5cVszizdW164TpRGuF/yKBAsuv6dooM5zikyY9mWWYCJhdIkvNSdwBOlc//Ct+F0bCL/lKQQLqI/Eem+e8e72M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784779186; c=relaxed/simple;
	bh=/ZwM2NwDUTJdO1vTq5pqTJeNnWVUa7ETpim96I9ud4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oOsztrggyFc3VeCUBjJxuf+7wXvvrffRV4XSDxkEsrvl+e9xRuQPeSMoBu6NLGxeNxHoMdClow5IM1nayRTNS6sB6nltVdcAbNP6utdAjcsbGEVqFy4V8jjwgyeIt3Jdqrb4x6lDxORVMSL3UuBFC0MQfea+DSyciTzHJpietGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RuF6CKQG; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RuF6CKQG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jqy9xBZcfcO4Dr7HV3y0oMDZLX0u8Xpihm844h8SebMztMRJKKlLmY5tJme1eZqVtw5ggmmI1FptpT4J90gnNdEt5T8cx/swUKfZ01rM822wT04BYr8ArA4OH0Q3Lb78NxrFHpkWykKUAcA3kKvTEJMFd7T3oTDX90GpZJZ2Q1cH2Ojc5H7KmtA/O9c78LS0+ddg68EH9uLYatJnN61baGrONyo9bhdg8IB1zwc02WOW/GjBGdV3c/kfiQXeldDPfC6ONKcdF0J7OaTDJ2vy0dqZvWT3i9/+Vep78WAy3qmDWT37jkxIM6dxpJsUiKvsER1uKCk2sPWbWFqA/y7ORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ayynh2e5lNAPLFHK73u3sJe52xw06CNaiHJUhCMyiA=;
 b=mXsbcQIM/KQi8jGB4Z1gbo4SXIb8ZQo1rXBpbkM9tnvoaxDdfUdfe7TLY/NeEeoxNvFvxCOsu3I4hYDros5FZT8Tlu0hEoK3oOJqnadpvFRBv3UVLtbzI5b9XwOuqV1ZqmbUzX5MHchUibAMTuEM2w0C8OjFLk4VdLiUri8VBM64VQaOkDExHBD4vha3kXfrx9iIi8+M0VMwEll+Bagx4SqGxvdpExg13iEPvTfSss+b5pwyIK+r+JZ2jVaCk9cx9iB7N+cMbvLzvV/fXaCfZ3eDyNumXjxQT9AEG12OJF3Zg2znECBb3BOM8VjFUCs7+KZ37JBfHLNd0eC8t5/6Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ayynh2e5lNAPLFHK73u3sJe52xw06CNaiHJUhCMyiA=;
 b=RuF6CKQGsNwQVi8Oajbd2qFOI9wNGbDFAnJKNddIJNG+ytLdnr3yMUC4eiPVA4r0dmvrrx32yzuaqTjdWwkiiRW1y1h1P/fM+OOKbUHxWoaRp4/eKDvVXlzw/6q+hZoY3aRaEh1khDRmZohSeXJQjoXcp84HNJ1X8G/iMpH3kYXA5JjxRQJ/n2cl9wWPTAxyEP7W4j6KV5rHOUcmnFDFaKQbeskihNH8KEEWl9VcADEwLrXooIE+bRfV1LOGvNZI0+UpTdq09cGnoRdPp6f+iY49NnIidr9wuequnGMXOvPCdHN2SBykOZ4+tbbt8IpK9/cur4bpD08YUhe9B/yguw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PA2PR04MB10122.eurprd04.prod.outlook.com (2603:10a6:102:40a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 03:59:37 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 03:59:37 +0000
Date: Thu, 23 Jul 2026 11:58:10 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpci: pass correct rx_type to
 tcpm_pd_receive()
Message-ID: <2wrbuxzoe6qj4hqv63u5a7vlg3xtgurbkajg2se2y5utxhdevr@gyzlaljgbntq>
References: <20260703063247.2521524-1-xu.yang_2@oss.nxp.com>
 <CAPTae5+6-NYoP7NQGDJN62AFnGSGW-8vaA1Jdny9V8meeDifQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPTae5+6-NYoP7NQGDJN62AFnGSGW-8vaA1Jdny9V8meeDifQA@mail.gmail.com>
X-ClientProxiedBy: AS4P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::12) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PA2PR04MB10122:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8364cd-4a0c-4a3f-ea50-08dee86ed046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|19092799006|1800799024|22082099003|18002099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Rs5g2WjssG1EqgTrB/XP4Ko6kU2jxB0hV/HX2HJvOXiVHNANYFQF0OClabaXDQNECNWXxXD1cImi5AkR9Z9/pdbCu3fTvHs68w4kgmAzFH8zvSil+/5/JrYSSZYzt2eF8Xl4ei92CrZ7TYTr4lDLqO0JtxHoSkTcXfZ6YX7329aQLaGnTECzteyU95hD3dD+eRAKsZuQrudR98/xQXS5tyF4sUYQE2iBGtCcejhG+yCGzn6csg8uVdH10ePoy3fnQtdy+rW8FePL3sFhE8huBg9zixvy6i/kmmrd4BFrFkcS+hqetckn02I5spSEG+R3kpGibm4D28EnUIOtOLmNXhd7CFtv3dK6IN4xbew2ql2KIFdMwxJVC/dcnsZHGW3sH0snVRix2aiaoffpq3l2Xn8eymRuWcH5ZqjDpnYUjvilkCbqRkpnMPH0Sd0ro7BLcJ5xkxIC8nEEY0Gi6odZxJacUXX9xwFK3nmtH2EcLnk29FNh6Lvutoc4qeyDY8Hi+pAT0iH+/e3F/WaCR77d7HnocmV3nRrOv3YkLv5ilTZTev0F5zilPJbD5Rwh2aQvigavYljOwYTa0gOdPgnDvxf/5sTybc3HkwpGPPBjwzJkpt/4TxF9HDhrlF/TVSN8hrKiX/cI/QDgstQuYis8j+/Jlyn8fJ3W3q6xmjNn4AE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlZjTG1tdmlPWjNTVjN2M2hiQ3A0c2JMaEdtbkc2ci82MHhlcU5mQktLbDNp?=
 =?utf-8?B?T1hHNURZd0laY2pocjlPQzZMNzJxTXZVSjdGQlRlOXhNY2JZclA3eUR3SFgr?=
 =?utf-8?B?LzgyWERvYzRVTXQ5NlpQZTVETFB0Tjk5bXhZdVVTTng4THUvdkZGanpmMUpi?=
 =?utf-8?B?U21HT1FxMEszdFcrbjlDQmd1WDZ0TTJQWCtVc1EvVjZVWHIvSFNFVjQrMXYr?=
 =?utf-8?B?eitWbkZURXZ6R016aDd6NWVXTEIzRnFJU0FOODZFa2RKZ0FpTVVTUWRVRCtR?=
 =?utf-8?B?ZnZwcDVINzVxRHcyZ3pITW1FV2pjaHhZdzJxaENJdTIwUGxCQWlPd3JHUWNW?=
 =?utf-8?B?QmFRUnpGSFExT3pobUZTUTV1aVIzcGpnMWkvdDh3SndCRUhjeFB5NERoTHJ3?=
 =?utf-8?B?Z1R6a0ZrTVQ3cEpZUStUd09mQU5XS1U4aTNpSXl3aXZiYmdyOG1ZUkEydkhU?=
 =?utf-8?B?bUN0TTZ6bzMrMTB5K2pXNUxMT0Z0Rzk5ODBnbHdHOTdUd1pCbmFsWXZTZjZD?=
 =?utf-8?B?Rm1VMUtNTHRIc2Zid3hMcDBOdFEyMzhReVVUc0IrdmE4MDg4bEhHUTIrRU15?=
 =?utf-8?B?d3YvMTZpencxMllORHhaczdLd0NoTEJCaXU4NHI4VEc4UCtJUHdmY0x5TzZE?=
 =?utf-8?B?WWZUK2pseTJ1V3BOTm1mZHJmMGtYNHAxWkpaYVBDNC9jQlcrdG5BTndBclNw?=
 =?utf-8?B?cTRyZ1JxT0t0ZkRZMmQ4aGt3UG5YQUl1R3dacmsyQ3UzVmYxb2NTZWwyNStY?=
 =?utf-8?B?dEtoMDcvRzZ0akE4MXFrODlPdG4rNDR1UHhpSS9VZE84QWRkM2toUS9CZXJM?=
 =?utf-8?B?blpwSkN6Z2NKeGNlekVNR1RDMXM0VDhkN0RBRXFwamszQkRTekdIdW12MmQ3?=
 =?utf-8?B?a29STDN1aE9Wa0FoKzFOYVhLSG1GYkxNNytscjgwN2Nmb3lBaXlwc0phS0ww?=
 =?utf-8?B?T3NVbWpJSDlGV1NZbllrWnJNQkVERnhKc0NWWmVVMTFuL2M0OHdTZlhOWEdS?=
 =?utf-8?B?VWMzd1Y2c2pZUXNCS1NqYytkdGt0VlhSV2xGbytMVlpxa0UwcTJ5TGtRVk43?=
 =?utf-8?B?RmZtWUlhNmhvYTJNWUJQS3dLeExVcnRCYjlQOHlWbS9xT25lQTFRTldJSlVN?=
 =?utf-8?B?OUhERzhTSUpkL093Q1JyUkV3eUt1SkcwYmdKRnUvNjFvS0ZRMDZLV3l3Qnpr?=
 =?utf-8?B?cHJqazBqM0c2eEtqZm1wa0FqTG1GUnYrUG5mT3pRN2szQjJZa2RhYURsZHFZ?=
 =?utf-8?B?WGZZMlBJajVmK1oxRUtVUWJVd1NremdXeFc4ZXk2Qzc2WkNnMWdublRKbG5i?=
 =?utf-8?B?QmxLWldpSko2VjhvaVNxT0MyUzZ1UkJIZjB1SUJSNHFqN0s4RGlzOFFQMC9R?=
 =?utf-8?B?WENoeHNPNURmU1hKb0YrcUVQTUVTS21wOE1rWkpKbER5ZENBOGNZblJ2L3l6?=
 =?utf-8?B?MFAvZU5qcDJsY2hoMUd3aXM5RVVpdUZzdGI0NnFpaDdrK001R1E4VTRSb1Bl?=
 =?utf-8?B?RXQ0QWQxZjMzazNjMXlaNjgvaFpUZlVDeHBIYXdVUHpqTjNLVy9yaTFkc1hr?=
 =?utf-8?B?Vk5FRm16anR6cFBFcUgybW8xWUJBZkxoalR0MVZ1Mm1lKzFOSkxsenNwYnA0?=
 =?utf-8?B?a2t1VDFGMy84R25DT1RRT3lJVnpxdStCYXhvdVBNdSt1bVBYN1NFZFRvLzBy?=
 =?utf-8?B?ZW9xNWF4TW0vbXNRZC9HUks1VXZRajJlaDBTYm1iMnY3eGRiUXBmbjFDeTZu?=
 =?utf-8?B?bEhhdXlTU2I1WloxbXQxVzNuUHErZkhxTkhBZXMzZFc0N2VLNWxnTEE2R3NE?=
 =?utf-8?B?dnBKTkhjK2hBdERxOGdweXJnWld3cDRPL3plaGJYMDVuVkVPNnoxU2VKK2lU?=
 =?utf-8?B?TkNJM1QwUzh5d0FFRVJOWjhOME1xMUZrakI2ZW9NbzQwMDNqVENMQ3RhL3Fu?=
 =?utf-8?B?VDczME1ja1J2QlhnZkd3c3FvQ2NLenQzMkIxTXJlN2t1eW1RM3JIMmZjKy81?=
 =?utf-8?B?Z3pTODJ0cWZDUE9NcnpNMjhUY1I5YzFTUU5ML2duSkpRcHBGTmNXYi82Zmps?=
 =?utf-8?B?dUZUQ3dSaFkxVDBWZnFadG9TZ0J1a3lHYW84MVI5d3c3ZzA2RWhCb21FTXNr?=
 =?utf-8?B?bjlLVE1QbWdmWFVHcHNWbWZJWkl0NGVjMWc5SlJUWXA5UE5TNmQvdXpFTmZq?=
 =?utf-8?B?MGhNdENkMmtPaUdPQkgyUzMyaGxEeElTNUc1OFMrbk95dW51eE5QZENRb3Fy?=
 =?utf-8?B?MnE3NzZZOGk0STM1YUttZkk3QXpOc2lQVytSSEN1UGIwQVNOM25xcXVlS0Rt?=
 =?utf-8?B?V250aTJpUDZSb2YyWlJVdUV2REhPS0hWdlVTUUl1dHM3d2Q0TmtxM0RiWDhy?=
 =?utf-8?Q?R07l8Y+oWKviIpfK5Ub5ZJxc7d4ts5ZNR0q3C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8364cd-4a0c-4a3f-ea50-08dee86ed046
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 03:59:37.3460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1drX2tUNxJQTPtxyQDC0uTLu0+FiJdxuAFCmd3PItSyoJnw5FUqoC4IvpCf0M6FW8Y9/DbsUY+esk8vQ4E16TBG7XcGm9Gxw7UNE23ZJCtflgZLGMbaLKH23bLhobFZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10122

On Mon, Jul 20, 2026 at 04:09:59AM -0700, Badhri Jagan Sridharan wrote:
> On Thu, Jul 2, 2026 at 11:29 PM Xu Yang <xu.yang_2@oss.nxp.com> wrote:
> >
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > Previously, tcpci_irq() always passed TCPC_TX_SOP as the receive type
> > to tcpm_pd_receive(), ignoring the actual frame type reported by the
> > TCPC_RX_BUF_FRAME_TYPE register.
> >
> > Read TCPC_RX_BUF_FRAME_TYPE after receiving a PD message and map it to
> > the appropriate tcpm_transmit_type:
> >   - TCPC_RX_BUF_FRAME_TYPE_SOP1 -> TCPC_TX_SOP_PRIME
> >   - TCPC_RX_BUF_FRAME_TYPE_SOP  -> TCPC_TX_SOP (default)
> >
> > This allows TCPM to correctly distinguish SOP from SOP' messages, which
> > is required for proper cable plug communication during PD negotiation.
> >
> 
> Can you add "Fixes:" as well ?

OK. I will add below fix tag because only SOP was supported before: 
Fixes: fb7ff25ae433 ("usb: typec: tcpm: add discover identity support for SOP'")

> 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> > index 7ac7000b2d13..c19413f41bcb 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -748,7 +748,8 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >
> >         if (status & TCPC_ALERT_RX_STATUS) {
> >                 struct pd_message msg;
> > -               unsigned int cnt, payload_cnt;
> > +               unsigned int cnt, type, payload_cnt;
> > +               enum tcpm_transmit_type rx_type;
> >                 u16 header;
> >
> >                 regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> > @@ -763,6 +764,17 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >                 else
> >                         payload_cnt = 0;
> >
> > +               regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &type);
> 
> 
> If regmap_read() fails, type would be uninitialized containing random
> values from the stack, can you make the code to handle that ?

OK.

> 
> >
> > +               switch (type) {
> > +               case TCPC_RX_BUF_FRAME_TYPE_SOP1:
> > +                       rx_type = TCPC_TX_SOP_PRIME;
> > +                       break;
> > +               case TCPC_RX_BUF_FRAME_TYPE_SOP:
> 
> 
> TCPCI Spec Table 4-38 also defines SOP'' (SOP2 = 2), SOP_DBG' (3), and
> SOP_DBG'' (4). Since enum tcpm_transmit_type defines
> TCPC_TX_SOP_PRIME_PRIME, TCPC_TX_SOP_DEBUG_PRIME, and
> TCPC_TX_SOP_DEBUG_PRIME_PRIME, why not expand the switch statement  to
> handle SOP'' and Debug frame types as well to cover all cases ?

OK. I will expend the rx_sop_type arguments for future use, although they
are not supported in TCPM now.

> 
> 
> >
> > +               default:
> > +                       rx_type = TCPC_TX_SOP;
> > +                       break;
> > +               }
> >
> > +
> >                 tcpci_read16(tcpci, TCPC_RX_HDR, &header);
> >                 msg.header = cpu_to_le16(header);
> >
> > @@ -776,7 +788,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >                 /* Read complete, clear RX status alert bit */
> >                 tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
> >
> > -               tcpm_pd_receive(tcpci->port, &msg, TCPC_TX_SOP);
> > +               tcpm_pd_receive(tcpci->port, &msg, rx_type);
> 
> Please also check whether TCPC_RX_DETECT was actually programmed to
> receive the specific "rx_type" to begin with. Perhaps while
> programming TCPC_RX_DETECT the allowed received messages should be
> cached and cross checked here. This would prevent unsolicited messages
> from being passed to TCPM which poses a security risk.

OK, Make sense. Will improve it in v2.
Thanks for the suggestion!

Thanks,
Xu Yang
