Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013044.outbound.protection.outlook.com [52.101.72.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C16252917;
	Mon, 17 Aug 2026 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786932805; cv=fail; b=mZyWntPB9L9EhmUn/MPoHO4YlgPNuJfe3Vy2rntB4an0u3BlqWGwueBTDOASuCniN20s3ZdLZQ5Oy5C8yCmFz+JO6mjBTYqCavVXBPHL4tPpdvlSapVzdLoRrAFY4jgtkqBeZCsBWQ4IBgENuSjlnhMA2l9sB+0aVPjxasLMNlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786932805; c=relaxed/simple;
	bh=qjzcagmOmZCHinauTZKBCgXJvcZATepU3Ks3SfvNbmE=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=NwDv+rq73iS50n+2c8mpycMrG3Azz6zUrZrdm5f5hL+T3uAnYqGPJFiaL+Hz2WHL8dl+KqkUZXW/QvVvOZw6EJvU0L4XbmseZaZTPbvfyLQM5VjLl5QQAm4so17ml1NpcEBV8r9VtERqU5Vp5yUbE9YxxsokFbo7EfWLIdBU4Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=U2YZsRds; arc=fail smtp.client-ip=52.101.72.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="U2YZsRds"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ij3Fasv9NKdQzFxYVU748BwpEWUaVu78Ak3KEayLfA0cUWJLDCoOZxyKm7rWm4XJMaBbtWxPDgCEMWpdB3oebCfL58HyXKRIte6jSLabD3Iur69enlh9SRy+au9JN/XAbExUl/Mxo0yhNo8Y691AIIukE3NgFefIoSFNeHrZ21mp4MFpakU2oppzsyq8UoZFDMK4zxFe7H/+ELEcIahCl77dYaG29OP/kjWDoyxuzZ8w05AQoQfSROjHuL3dmEuaKY3xcFqLJd11nVEqcXtoSGwd+KMDAy5wsNsONnIzqWkchD5xLR//JYST4PBmgZhzR89wMcjbUaossyHdoXh2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1hH8okU+i4nbPpG7mWBqwFNJU3S2Ip6srqe5FX7OaQ=;
 b=kVP0T0basKusYMIU2YS4D68faLe1z8VTeavZYg+un/LbJyX0VBHGrn9k1D4nljeAfYC9IkCidURA2g3CeN3/3gYF6Ls+X8B2gkq0ZYJ9Ivju1tGFuadxZRqGNuOlaBWwwRt56UgY0/Ac3DRzsJUkUCg2WSD1aBF1fHCQjGw7wPAmLmglaZLxbiEVfuK/1ZWBmixHlpt9m8QMaJZwEQfplZxtuO5hUoXepud3KJGvZedZmemloDDeuxv+eYo7zJdDARu1CUp+X9Z/vq04l/+ubY9Zkh6zgKL3jVPsM9ZcOcPt1NRAKKMZHNqvZf+A8oANvrCCvzpO2+PMAnu1wLHlXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1hH8okU+i4nbPpG7mWBqwFNJU3S2Ip6srqe5FX7OaQ=;
 b=U2YZsRdsg3CcbGQA7z//l5B08Bi2onll/5qP3jZITBCm7LpN7yLl+LFgpXS2ukmG4pQ2BgrPsKK/GWthtBUTbvtdd+2KLy9pnr2qUDBFmT0yVoJcJy/JwWpxC+XutON8/9EKeaPL2R6rPSZ2I5uUNCYdRT/TreSsjyduq2+ZfH3vx9XwLdmzQGo5hdyyz/vYp7FPwinMJu25bPNVvuQLq4fKLeeVWCvpcPVJcpchfI2+uZhYOeqi4d1WwvuNEiPuREqVNKQRkgxyAmJ2wrlBkomKzO9MYwiKjOcX4Of01jgFZHXmSqQFOsZsNgtU0tPqtxnoOVH5zoWBB7LBvqoxNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB12292.eurprd04.prod.outlook.com (2603:10a6:150:2c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 02:13:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 02:13:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 17 Aug 2026 10:11:07 +0800
Subject: [PATCH] usb: typec: mux: gpio-sbu-mux: fix SBU path not enabled on
 orientation change
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-typec-mux-v1-1-5e53c16744b3@nxp.com>
X-B4-Tracking: v=1; b=H4sIALptgmoC/yXMTQqAIBBA4avErBNUoqyrRIuyqSboB80oxLtnt
 fzg8TxYNIQWqsSDwZMsbWuESBPQU7uOyKiPBsllzpUo2HHvqNniLtZzFJkSstRcQex3gwNd36t
 uflvXzaiPdwAhPOCLBNxtAAAA
X-Change-ID: 20260817-typec-mux-d0e148129c08
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB12292:EE_
X-MS-Office365-Filtering-Correlation-Id: e73bd8b6-2012-4e6a-aa0c-08defc051bcf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|23010399003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ot3N5NSN3G6ZmxoDj6eWCZkn9ciJuzFQRDSbgCzLoZrHIDb+zX6qtVYXNAsF9Z2SEZUMOLk2hYToRbrXdcCAKDsoIfOlOJRW8FD1ys7VypnB0wknRq1oQ3eZ5t3jFcLiHhLcd1bB2R8OpokxTdE4A5H6Ww7e0Bxg3CSGBMy+1etfr8CN4n45PBCXczWfob54RU+yEOKbJSqmfzzaIhNqC0QdRkom2HnaNAfIsQNwB6DLGW0OfCbn/zcG0pWLLnlVACxO/b2B5u/GXXV/BEdNEHuOw4k5dgFEYmMwA/1fWpvsMDjUk0C1hYOM0LBaNLidPFU3sod8l4N1NomjZqII5WKneAKIOK9SW6Tuz0vvvVAyOccLEpUUK+TkyikmejBpKWRPqRqeJMSz5ViVa4Z3LH4bvF9YaEkWqdbIowoDeWy05g7lbYb8KmrJnejHECvDvwR9HD8u5PsuZ1TiADMBj4t64wOdDgJPJCZ3ZEYOOZs0+hJzrmnMZwC3pVxCaRlsvDt1D9Af2JoSkmgbxX3MGkeuwOWJgIsENqPL6twJYeYFC0CqdE/+118z2KZvCqdgxn70rD4Mc1m/0uMnr69VDzU8WTmdWihOFxbda5uTD906uvWP30IPzUE2L8teCYXMl2aCFTq4hlHn9kUeJJIQNocEcx+iwQdIvCfIQ7+csOE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3BEZjNqWDJHck5ZcXZCQkNjSHBvWENDU0NBZSs1Yzd4L2lGdVlqRHd1TWth?=
 =?utf-8?B?aVA3VzN2U2J0L3hWQkcyUU1pNjEvcVU5TWhoYmdFZFpOd25vS0QzbS9Md2lQ?=
 =?utf-8?B?c2src2ZVd1VTOU9JM2l1RlBCbmlhUDdjRjhEZ0QvU1E1N3ZTYVZrV2dRaE83?=
 =?utf-8?B?MzJwRHh0N2hMTHBIN0dwQzhmM3dHRVhqTXpER2FHeXl2ZW51VlY1RkNwanlS?=
 =?utf-8?B?RWxEWDlLOE9MT1NIR2RJa1k3LzhVL280cThPNHdkYkcyb0I3VHlmSlVHR0E3?=
 =?utf-8?B?dTNJZjZZTFdXMnpxem02eG1PNWRETmpGeGI1bWxhWkx1UnZqNzNIb0VsTkVU?=
 =?utf-8?B?dW9CaG9rSFpxQkY1cnJLUlJWNGRTc3VqQ0ltYTlFME9uaGUxVXM2UTNzZWov?=
 =?utf-8?B?OW03OTFPUURXekZiSlJoOTE0MFJmazNYNHJtbGV4czFaNCtXWmI3OFd2eCtK?=
 =?utf-8?B?a2t4WGVMenZ5MGpRTko1TDhPVnUvc1pkTW1BYkFEYkdlYk1oalBremZpbmpY?=
 =?utf-8?B?blRCY1krd243bG1xbnBISWwzQmltU0I1ajlleWs3V0VQSndDWnUvVEZyZkQ4?=
 =?utf-8?B?R0p3b1NPR3FTamd1dkNoTkhabjVnd2pEUUtOUTRWVUd3WWg2V1gxbUpmSFU2?=
 =?utf-8?B?WWNrbTd1a2hyTlFTZHB5SmMzMm1ZdHlQaGxNTUdMdDV5Q0ljSFZBc2ovM0ZQ?=
 =?utf-8?B?MFNmQ3grb2twTTIrbG10NmJ1Ui90LzEvbEdMaVVhVzE0aVJGbjN1eFNZZlNJ?=
 =?utf-8?B?TDlNbytWR2xvU3R5N3lKSFVCN3NvY01TK0FkSnM2RmVxdWMzb0tYMWZRdkwx?=
 =?utf-8?B?QWdOV1VvcmMzU0tLQTNXNU81N296aWZSOXBIQm1aejlnRFFLN2NoSzQwVzBC?=
 =?utf-8?B?dHFhOGZyNEpwYmFMUkhOaDZGaHhTUFJtd21IMXRZelVJUkwvcFh2VkRXY1Fp?=
 =?utf-8?B?MURLbWxLQ2VuL0JGa1Y3ZThJTjUvdVZkQTFCckJIWml1NXFMbUREcXFNZUNF?=
 =?utf-8?B?UTY1dDluV1lDdng2ZjhIa3B0aTJHMlRwUDR0bkVCSkk3ZnFVa2tmemdGaGo0?=
 =?utf-8?B?RjVvalJQcVZVaGtlQitSalRXUXJNZHRnUytodVl2S3VhZ095eGhmWFNOcUxM?=
 =?utf-8?B?WmxsR2h6K3lGdDVtQVd3S2JRdk1kV24vWTVRZXkrQUdXdFVuT3VTZGk1ek9O?=
 =?utf-8?B?bngxNUJ1WFpQdWpwakg5VWhGaFphYVFocUhsd09FM1F1aW1CbDhkanp5VjJB?=
 =?utf-8?B?OURKMjA1TVh5WStVajhpWUxsQnlyVXo4eUtidDZxQkM0RGxDOFZQM3BpYkc4?=
 =?utf-8?B?M0pTRjFwZjZRbSs4SHpuVUNrNTdSc21EbGpQVmErc2c1N3RWajkwQ0gwdDk4?=
 =?utf-8?B?bkZZWGVIMXlPWDRVd1pmSCtkYjlaWkgxOVF5WjUzQ2h1OUxmd0Q0bWZ2a0ha?=
 =?utf-8?B?Nk1vQ1gxUUozYnBMQkxBZmMrVHFva29lYnRTdHdtcngrckV1QytZdUJGQWNr?=
 =?utf-8?B?eE5JQ0c3cFlyWjZHV0ZIekU1RUlwa1N2MGt4QmppWWNlT1RpRTRRM3RoVThB?=
 =?utf-8?B?amt6YklpbHpnWGZLQmkyb0JrN0RvWHdMN2xaWngzOCtIbGZLQ1B5bno2NUI5?=
 =?utf-8?B?eENpeFdGQ2hFTThFUEVDOXl5UmlNY0crR0V3VzhEWnJUakpoZG9sY2w0eWxv?=
 =?utf-8?B?YlgwemtJQnN3SmtRS0VDSHhjWHozNy9NU3Vrd2Y0OHpGWkxjKzQvbS9oR2hr?=
 =?utf-8?B?dGtTVkFhZjJjL2ZuZmk5d1l4cmRlWm1YTWRtTmdDOUYzM2p5bmhPS3d4WWxC?=
 =?utf-8?B?OU8yZWtyU0NYenBuaENuREtYaEJQYWRLZGNyUHBwUGI1dUZiQ1ZqTDFjRlhD?=
 =?utf-8?B?cjJieHVwNHpJYWk5eTl4TEUrUEo5V0hmNG5LR2lRbjFETk5JcXZsMURuUCt1?=
 =?utf-8?B?OEYwTWltM2VBNEJMdjRTaWI3Q3pzMDFIaEZ5L1JqL1NzbHpER2N0ZncxNEVK?=
 =?utf-8?B?elNSRlhVTzIrWjBGZVo2ZHJZNUhLVDJWWUhDNFdMekRyWHd1R3R1M3lER1NB?=
 =?utf-8?B?R3BLc25PVUtNT3d4QXNmbHdlVi9ndDlTcEwyZkIyZXNzTVhacXlEYkdmRjV5?=
 =?utf-8?B?NjBUUWM0blpBY2pjOHpmQWhXNVFKUDVERXdkV1JGY25TVElUdWFhUURLdmc2?=
 =?utf-8?B?QUxCNzlsVkt5ZDJSbVluU1RHbTFzdklpenRmM3RlbVBUVlZ1ZkNEUDBMeUEz?=
 =?utf-8?B?eXdWUVQybEFKZExkNzRDVXBFWStReWJvMm9qNkR6RVNjc01YNit4ZHdBbXpB?=
 =?utf-8?B?QWlzR0t4QnFWYXhqaDZDZEp1S0VFellXVmJaTGJjYlcvWm9CVU16TEIxVTNO?=
 =?utf-8?Q?GukACW1C91TqeP84sGy4kkx0TVfdkaeMXObGM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e73bd8b6-2012-4e6a-aa0c-08defc051bcf
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 02:13:20.9480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oKMRw4/KcCuVzElP7tRJ441ejN72XiQ/jTnsCYAJpooeoBDqD1SCOUoMh+6IFurr6ZRnl4X+Khxuew1VQjgZ4Tip4vZiutfGYH8iURBUkaK4XglI7BeMCkkOkZDZdvn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12292

From: Peng Fan <peng.fan@nxp.com>

The swapped state is updated, but the mux is never enabled when
orientation is set to TYPEC_ORIENTATION_NORMAL or
TYPEC_ORIENTATION_REVERSE, which means the SBU mux enable GPIO would
never be asserted when a cable is plugged in with a known orientation,
leaving the SBU lines disconnected.

Fix by setting enabled=true in both NORMAL and REVERSE orientation
cases, mirroring the disable in TYPEC_ORIENTATION_NONE.

Fixes: 065ded319d39 ("usb: typec: mux: Introduce GPIO-based SBU mux")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/usb/typec/mux/gpio-sbu-mux.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
index 1834f1a2dd9d..4de7456794ad 100644
--- a/drivers/usb/typec/mux/gpio-sbu-mux.c
+++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
@@ -40,9 +40,11 @@ static int gpio_sbu_switch_set(struct typec_switch_dev *sw,
 		enabled = false;
 		break;
 	case TYPEC_ORIENTATION_NORMAL:
+		enabled = true;
 		swapped = false;
 		break;
 	case TYPEC_ORIENTATION_REVERSE:
+		enabled = true;
 		swapped = true;
 		break;
 	}

---
base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
change-id: 20260817-typec-mux-d0e148129c08

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

