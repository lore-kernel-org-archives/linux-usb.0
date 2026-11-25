Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795581504;
	b=EXzaPuh/7QQ1CfSLAxS3DxdW19W+6zSWU64HSkhzixT8aaw3w8CPbyerNKKZvZayL4VF
	 S8eDxGkWJ4z6o31lzTpIabpapT16uVuuS1mZpeJYVnWP4LTFZSFVNJdlzr7805uydDt3C
	 ZQPkXRdvlCPlzp3A/qSmdgmzULY6SeRHa1a0yRXmpIL/SNNOnLJobQ7q/wk5OlKCN36K1
	 QAlZUuXDLG3zDL6ubIdYc5tGCaGys6kzE2FsM/FA/VjGeRtO+Q6bcUI4N52FCokttA7d9
	 HNkEwDK9nkCCCLzWYDUXMvf352DtsPvuO+OeN3nQ7BPptjpAOJX8mlOdQa8NJEbMeww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581504;
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
	bh=k3R/i0bBzhQ29hM8QkKfuq42LOHH+EwyuNTFYrHipw8=;
	b=uHTPonQGYEuo/NF+ovPu9MoqNYkmsxG4puPO11qYRByDIP2e1HZPDCuR8cWjl5SVbPg5
	 3ov4ySkdU4nEP5iQVZK77Ucin4F2ICCmUO/LTe5evmzYRCDxZ4kC6roJ3nOLkmbtqN/Lc
	 6uVOzvDsTCByFTqBRHVZE4gdDdOHJrhgnolh+/ItwQ+XA7or79do2zMTKNTXNDWjYGk38
	 LS9E11sDbN0jAi5knqHE/MfynJ5BJRU5CUjPGbmSBDtqQHkono3C5Ds3gUS2j+g8lGPnT
	 wMj5Yd2ZlvIrJssBE53/V0Rl8vM1SvVB5noONQO+oJxtQRn81oB4rGNV8fzYFo+dJFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VEL0FUkc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.61
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1F1606A31E;
	Wed, 25 Nov 2026 04:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A1F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VEL0FUkc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+Bh1a+areJLDERi3ci0B37b2xcBD795Rh+/URSiOUeWT6ibRh7wojWx5QWoTxA96s+6OhDFLDwBDN+fbFfYTirBKpPhpwmJfFMLRX7MVuuHzZESaDB4yLsxB0opOlsiqMaeclgXc2lnMgeMYQIViSf7jMVmigsRB+24+fkyX/ATZBbFsLsAkG8JEzG7AZe4YznNtHM4NfUjb1FV/VMqxoKZ5Rw6HYCg1qII1WWjZnEZL1EnkYLROf94p/vQTtKsHpVgw3/as6tOwsMa/LyN67UuuuSgQ9XNHoQXWvP9b2jqddBb/8IaZeEePlniaFMsMD1uAg2bobpmj/QHqHm7Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3R/i0bBzhQ29hM8QkKfuq42LOHH+EwyuNTFYrHipw8=;
 b=pWLlBO9Nlc3xKksrQdhntlVXC8JLTnZmEVpk/h/G2/wOFB+Zz3+ChKuLsvYWQ3y11cWu4icAEhDpAfWM5hSOrCHPO18jsAto49V4bU1/S9ZHxC0hrqzY84DSC63LuZSdMzEkXSFovSiBF0xtObJvfm519hGZFMQz9a9/ziDNlohoiLA/yUF6Z8qcdaqEsXJfCnbjQThca64gfr7rhzMs4xxst+3faQLAi/ZlmjWCJPVvvac4psvuOxd95zNTRaVEd05mXxlWS3KgALjJIPXvPFTi6szuI+UI+hF7t4fknCmjTwx5kavtTp8sdwTvwaW7BifPouSJlTrD/w6AT/OwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3R/i0bBzhQ29hM8QkKfuq42LOHH+EwyuNTFYrHipw8=;
 b=VEL0FUkcwbEMMWCXQKRWcITrX3swKsnMPRhfMft3aemoygIV6ElLuVnvfuOobnNKfC8kcrXiIWcb9Sd3MzCS2OLG0IHCrb6uLa24yTL6RZUSKZfmHT11uwwFDZfe9OKDJLYh16nRM4ek+k+Ad9g7ETWrwfTdZMi24eySouEqHJrFJZfa9z92C766qRJCqDGRW8FLVB9Un0keKlrj0tFK1u51r2FtVuJvVzbwQUnhVusp6RsqJqaLme7OmZ6Z7gDzOAV4aq6wZAJFfYI2QlgJVMttRC3p03CeCF7cr1LKXtPdbGL2y46k5c50gk7td3BqhqGy55DO0u0LAAUFqzKG2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PA4PR04MB7550.eurprd04.prod.outlook.com (2603:10a6:102:f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 04:38:18 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 04:38:18 +0000
Date: Wed, 25 Nov 2026 12:35:09 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH 1/2] usb: dwc3: wait for the port to leave RxDetect
 before xHCI reset
Message-ID: <edd44rlzbofuaxxczhh4d3jx2knwpaaxat6mx5zz37vyxl2ucl@5tjovqane2uc>
References: <20261106111943.2868733-1-xu.yang_2@oss.nxp.com>
 <20261106111943.2868733-2-xu.yang_2@oss.nxp.com>
 <awYspGsimvWjR4JY@vbox>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awYspGsimvWjR4JY@vbox>
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To PAXPR04MB9422.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PA4PR04MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0a75c3-611f-4f19-cdad-08df4aaded85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|261022105027099003|261026121527099003|10067099003|261026140227099003|261022075727099003|261028144727099003|261021123027099003|261102123227099003|261021121427099003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	vsOc/EX2XWWmE+Qw8Jer+rzBQxztAzCn8XTo4lETNMvlDWyBbD1/bK4QTg3vRU4Q1wKGUimDH8tEOMHBYy5/jDoSNvrxAAo5PHKDF03HNwMfNaHfRh2QRc0ctjXKrIpdBRTz+kcV5BOicxqr/B/d/DcX3FXUwveLhSIxwPh46WF4cHZyEdJw///5Z/f4SSxl2ZHmYKZjtUxUQQHJTTGUDUZUrXhbrDHu8ErwJmQTxh8C90/0m0Xo/Wcpj3RcDW87DyOyS4cQJabPgQjIYVZ7cCI2bqUvyTQRtGyOl8bRHMs8UUZ8OK2Hn9+8UeBD3CPpY4S4Q6Y04ttwwIgLZSCP36cyLMCyR2WdR4shmDUb/HM47dpqV1CXkPrlYHF0SI8AaFGKIBniToE8BQZ2EAZncgJac4G4pV4LzaDL6lXrvapLspp99/Nt/5NzWKpi+SzVZPKmee6VdZb2X4Yq8kO86l5H05yiF8lScMwRDWr/jsleZzhv6cREZ1O/umZ0z4ASOrCm9Bq4w1ejlQqlFEjb//0Y9VB6/nyZFUEwEbyfl3idkA3jUSv+01KHH7NAkTpGArrSh4AbUAELEEMxaqwG8+HmmgbLAF3HnX4k/JxK2OQcCnhNFYtCU706iF6KIG2Jrv+i2V4rOWuQvYtFWAiZ3eUBKZeWk3suqiY7oTZ7S0c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(261022105027099003)(261026121527099003)(10067099003)(261026140227099003)(261022075727099003)(261028144727099003)(261021123027099003)(261102123227099003)(261021121427099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bAAe6HHsHxRl6TFbcniNWv/7ruymz/6NF+mdThO+DxiwF/V9ifHJVtXm8UcN?=
 =?us-ascii?Q?84/OucLUX9A4x0qN6PyZCdgFTQSDncrjWiAqNtqichGeIxwXmhFnW/GwkiWs?=
 =?us-ascii?Q?oQ7NDNb+J59fcnwxjKII10pdwCZYy1tUyjU1VE0aAMHY20MsSrfeDUyZsbxe?=
 =?us-ascii?Q?bC3h9UDr91rpUFkDX1e6ft/tivVVzsEVo3LU1tWglt7e7dS+2U0CdplrSjA2?=
 =?us-ascii?Q?ntwJRJBUK+JERvMLeh8JLRTX+3ojK1Bq8Mtpxcitr6wxdX0kDcK79rpVYHVP?=
 =?us-ascii?Q?01Ep3i++G8kvM3TpBZbTZtRvUaM65RHrwJ127xyfU41tiXovjbLk87vA8/rS?=
 =?us-ascii?Q?a6IpuXK0xYr9JOxzea5v38yi1ZeopJfn+RLWN5CXcJQIk0xudgjFh1Vv9hDx?=
 =?us-ascii?Q?5nQPEN6yeVQwa0mYLO7bM0xf5CvhL3W2cP7CsJoQXKKytsIoq5UzmhsN0pXm?=
 =?us-ascii?Q?/z27GG1TrdbxfHHAuCf7vkgB0NMf9y28/tKc6GhHHmIzKNJwpWDU/QvKSPX0?=
 =?us-ascii?Q?9UbvgeAJXZmOOly6rHWsU1OamE+9F7j8IXOUof0cx/RJENakLdyJp0CyBF48?=
 =?us-ascii?Q?j8/yecKF8QajG+NwzYBc8Y7tWMqtIDz1A2DUiYiMQoKn2a8XP0xbOAZEEIBr?=
 =?us-ascii?Q?BFreaE2d0Osnw2tG60gm2fB8eUK3bbF2mJl5NO61HuaUmt/w0vJs5u64LGUu?=
 =?us-ascii?Q?jEX586RwsCtx0onDtFWhig84a54Ienq6YI0PkHMwsUoM04vxUlNliZ46qJi6?=
 =?us-ascii?Q?ZLHA/yxJNJenG7cKdANhBTyAfaI62DJnZKP0qF1Ad7SwXm4QXrzw/hd11oTt?=
 =?us-ascii?Q?7yYU10RcPqCEwZqtFYPziuEOb9pg3lezVMYJ5G0FsmPo3BFONmqdCktA1UBU?=
 =?us-ascii?Q?AMK6wPI7xIPkB/xdOf7SB3CVyc3vVlxn83Jb+D1FUg5qVDsMAWAnMTM5QEF4?=
 =?us-ascii?Q?joniA2G0foYeTgcNaP0bZ4Grkb1Hg/3gpGU0kmD+ELNejo0WcZUcWFkBx6zg?=
 =?us-ascii?Q?wdnVbjzyAOAfGzeuFJFD7GZsmjfVzJvgsTaPbdgipNGpLKEcbBRq7PWejFBa?=
 =?us-ascii?Q?3/M3krw0i/a1RTFXTYH2OyZ+X/XzPGNAF8YaO7nkyWVnxhFt81Q9/CWCTGoZ?=
 =?us-ascii?Q?0gNbczdoUfYhKQZzcwBYHMZpaGTN96DdEfnFziGUPHkUMgc0kTFEgVm8+daH?=
 =?us-ascii?Q?A4OrSx+5FoL5g8CkpIJxweE5zP5G3g/wXQgWUnY8ne8thsHTd9nGtI63wkKH?=
 =?us-ascii?Q?Ccepneu9u2R0poEfbxxzZ1tvlYmj/+1hRFAEg/9ZjKfKcsl/D5U39kR1vZCt?=
 =?us-ascii?Q?lTyuNljAWUXs74v5lod94b6Xk2i67YP4nlXCxABpigB8bUBozepLo3T6CGrt?=
 =?us-ascii?Q?W3k9t0lUbnHLnbtPwPduPurVCs906Xomm74j0Q6H4S31B7409O2T1hJbJurR?=
 =?us-ascii?Q?CATmvRDYOvpoEE/Hi6JG5C66dEufbkLRPni2kWuMQidM2dU/1zKx2mBT6RQW?=
 =?us-ascii?Q?PbLUmf/UWPTx5r46ZasZhbo6UFPfdVcFYxuc8ZKccgi2NnRpCKLsA8TME1bx?=
 =?us-ascii?Q?Cu6gFnB3e1wVRQLGGCsq55bg9YPeiwEbyFqJgmLW61X1+Cc78ySlUH4+mtUy?=
 =?us-ascii?Q?jlE4uDSz18m24neSR+6kgoaDJO34mNm0+kVQvJVsmIdNZ08l/zT/rolbZuIQ?=
 =?us-ascii?Q?9ecv/VejXuGn+3yfeJQMDyVb9HjiAiyqLblOtyE9sjzxB/sjmqMrizmIaYSm?=
 =?us-ascii?Q?74XI9Zu2mP6IBnaPu1CKixEDcduAfzTasBEbOsC9VogHo2uyJukX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0a75c3-611f-4f19-cdad-08df4aaded85
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 04:38:18.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgfEhWaVQYiyUX0ItqG/ZyDAieeAq98NYh4wkzLnB2YieYjybLRosB+5hN5zzPVxwKIK6J5CfIWogXf5dl645F4ToqDIC9LRTtyHuiZMIt7gK25tfhSop9hdfNssMCbN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7550

On Wed, Nov 25, 2026 at 01:03:08AM +0000, Thinh Nguyen wrote:
> On Fri, Nov 06, 2026, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> > 
> > When the host controller loses power during system suspend, the port
> > state is not retained. After power is restored, the port starts in the
> > Disconnected (RxDetect) state instead of its previous Enabled (U3)
> > state.
> > 
> > After the controller is switched back to host mode, testing on an i.MX8/9
> > SoC shows that it takes about 2 ms for the port to leave RxDetect and
> > enter Polling. If xHCI is reset while the port is still in RxDetect, the
> > port does not issue a Warm Reset.
> > 
> > This prevents the link from recovering because the USB3 device may
> > still be in U3. Once the port enters Polling, it sends LFPS.Polling, but
> > the device does not respond as expected. After three Polling attempts,
> > each taking about 360 ms (tPollingLFPSTimeout), the controller reports
> > the device as disconnected.
> > 
> > If xHCI is reset after the port has entered Polling, the port issues a
> > Warm Reset and the link recovers quickly after the device responds.
> > 
> > Add a 2 ms delay through the xHCI resume quirk before resetting xHCI.
> > This allows the port to leave RxDetect so that a Warm Reset can be
> > issued, avoiding an unnecessary device disconnect during system
> > resume.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/dwc3/host.c | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> > index c5674161b2b0..465c170df12c 100644
> > --- a/drivers/usb/dwc3/host.c
> > +++ b/drivers/usb/dwc3/host.c
> > @@ -78,8 +78,29 @@ static void dwc3_xhci_plat_start(struct usb_hcd *hcd)
> >  	dwc3_enable_susphy(dwc, true);
> >  }
> >  
> > +static int dwc3_xhci_resume_quirk(struct usb_hcd *hcd)
> > +{
> > +	struct platform_device *pdev;
> > +	struct dwc3 *dwc;
> > +
> > +	pdev = to_platform_device(hcd->self.controller);
> > +	dwc = dev_get_drvdata(pdev->dev.parent);
> > +
> > +	if (dwc->needs_full_reinit) {
> 
> The core is also re-initialized on system resume when wakeup is disabled
> (see dwc3_resume_common()). Shouldn't this be like below:
> 
> 	if (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)

OK.

> 
> > +		/*
> > +		 * The port needs some time to leave RxDetect after host mode
> > +		 * is restored. Delay the xHCI reset until the port can enter
> > +		 * Polling, allowing a Warm Reset to recover the USB3 link.
> > +		 */
> > +		usleep_range(2000, 2500);
> 
> Can we add a comment that this value is tested with i.MX8/9 rather than
> a common value for all platforms?

Sure, will do.

Thanks,
Xu Yang
