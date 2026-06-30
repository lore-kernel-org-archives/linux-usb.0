Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazolkn19013072.outbound.protection.outlook.com [52.103.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD743F9F5C
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819040; cv=fail; b=gMWkKnLlxOQS7As8rkLURu6ZgtZF+zjwOkAjqYagGjSbgw1KkwiGJdSizxtfF7hHSayAydgULnGy/5hCZvKwkscPhHADbbqbTEvDX8V5E0cEfJZdnbCjUBdNVL5fSBfJwwqZTwbmDw5isoO/iV7tTOV6ibR62dix1vi+09w/qsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819040; c=relaxed/simple;
	bh=VqBHipOGYRfzQxRtSGP53eDTSJcM6Zy6zH1oEjm2T3E=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=dZ0MiQO5c/wu0fSYSSmvsfqNha+4zLwg4/7/sdGbnL4kp1Z8kZkqZwOo8rhJwzp2a26q/LSZ/Ld7xY2Y5Z+cz4jbR9X8aoykQd4HEaEQ0j1hmz3Vcey/sfUjciIrWwZN/0589a3MZ0eV84lkyw3hLrGxb91CBv1cMx0hARzkiL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CkkSsa8d; arc=fail smtp.client-ip=52.103.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="CkkSsa8d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYugqVFrEm0iypLO5aP9h7JQsn/tZRidCrZOi8deCt1dLN+VYq4Fz0kCCajjMfB2FLyeshwqO2b9Fmon96Y3Kl/4zVTI6PlbYOIHMym3SH5alAE1coFb+8b3hUOJcdsrr1QonwyfprIWNumc+S+ismaJTE3Kgxn26BWn9R4VVlhOzSRGk3UrBqBrD7jYR3TaQbWGafxd4uQ2y6I4LBLKLGY9slLYJ7kcmhcgwiQdkO5v+id6dmND3nLUArLd7B/VtsA19n6yJ0vdc+XBsmBNTSs3u/VKVYO3zi8tV6NXqzjmklfdIN7x7Kti/bA39EFwWWXtI1ctczOWS1smMlkdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p35FENBhwalvARXgsBRpKPA+WNs+d3ftHTCoAw2ut8=;
 b=reN4kIklDaG9kZkcjLeplwzAslh+LUzcFOesbWjWKErSqjSM4+1NSF8+eUIPuiQR3muJ3W8CM6vss40mCoiitg/oQhfrJWbWXpG5Zuec/CT5yxsb32wVxjZ0CEfGzTnShwgbXz0hwft4CN07tZ2dgQaLQjGzg/rUDWtguzzt0pWckxuPvCvQPVrhjUI5PmygpGWNzw1gJKyQ9hhcfMOKY/pb/iNgMPiikw8RlD1KTdlg+uwDws7Khba+8wg7JDxhz0a16Q/pSEf+ecZXHz0aiXuZTb8SZgCYqb9lAKJQkUexsSkdv2129bnWYJM2T6lY6bD8xnaJjKIAmjoORjoePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1p35FENBhwalvARXgsBRpKPA+WNs+d3ftHTCoAw2ut8=;
 b=CkkSsa8d/oJJOYgBy+WOZk5eFTYTqPMv3e+h5Ix4dJtbaBRpuosCZkc+mwbpsgA/dvIbEp2HRhRG7CfPpYnYya87NK5IL930fJ9P5SrM5+xHr+9GMYqjxPKs9mee/OrAJLswT7YOEaDFOLpnyS25TWD5kwUSwYMJCZ2CcoVYitbAhVOZvhI/U6vqF+ttH69R/dZb7F7IPF3Sj8+PvgVo+RT4nR6VQGKLBPQcIPDZUleUuFs91wBjJnV29wnDKOZj8kbjMRK0Age5Rf5Ic4tl2EjBkBKoohbLZOiLyF7JswNCWXSVb12g0WVV5YeF8kWHgWTsPKhxVEE1n6zNPPbvqw==
Received: from KUZPR04MB8968.apcprd04.prod.outlook.com (2603:1096:d10:44::6)
 by TY0PR04MB6445.apcprd04.prod.outlook.com (2603:1096:400:278::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 11:30:36 +0000
Received: from KUZPR04MB8968.apcprd04.prod.outlook.com
 ([fe80::5eef:f449:1a9c:36e0]) by KUZPR04MB8968.apcprd04.prod.outlook.com
 ([fe80::5eef:f449:1a9c:36e0%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:30:36 +0000
Message-ID:
 <KUZPR04MB89683432655A607BE9A4838F85F72@KUZPR04MB8968.apcprd04.prod.outlook.com>
Date: Tue, 30 Jun 2026 19:30:31 +0800
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
From: DongliLiu <dongli.liu@outlook.com>
Subject: [PATCH] usb: typec: ucsi: Fix off-by-one in connector validation
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0118.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::14) To KUZPR04MB8968.apcprd04.prod.outlook.com
 (2603:1096:d10:44::6)
X-Microsoft-Original-Message-ID:
 <a90d8b21-9110-49b9-b901-df33e3e783b1@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB8968:EE_|TY0PR04MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: c35394e9-8edf-475f-6f30-08ded69b00ae
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5062599005|8060799015|39105399006|6090799003|23021999003|4040399003|20031999006|4140399003|15080799012|5072599009|19110799012|40105399003|3430499035|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enQ2cTFUMWFoZG9PRmp3WGFDc3oxdUMzam5zcnQ3K3lQUnlSVENGSnk4MzdS?=
 =?utf-8?B?NG9TNzB4czBWSnRVTEoreDFFRFQ5TWhZa1c5SWRVRGQxRitOU2FJMkM5M1Bh?=
 =?utf-8?B?WEg3VkNlWXhRdTExVUJRaDloSFNPa2hlQzdjZ3EySjJrSmk4VlU1R0dYV0xV?=
 =?utf-8?B?ajZGSmxKREZxeCtyeThtM3Zvb281N2xDcTF2WjlhYkMzMzF0QVhSVmZCa1hZ?=
 =?utf-8?B?aWlUS1lQSnhoRVQ0a05xUmVvTXRwRW96Z0YrWXRONk9wMjBvOXZ2Z0J4MWNM?=
 =?utf-8?B?NUU5R002MURMTGlwdjhvTTExdlJacUVjbjF1RDlxODRuRjdGSW95eXNxRDBT?=
 =?utf-8?B?em9zOWlDb0Ywb1d0YU81MXNQMkFBblBDeDlDQWpRYkp2OFRkeTB4SXZmM1VC?=
 =?utf-8?B?T3BibmcrWVZBVTBCMndJaG95MzlsSjVkL2RLRzJIMHZkR0ZxZDZEZUdHcy9u?=
 =?utf-8?B?ZEF2YjVMenp3TlJ0aS9HS0pmdStrNWd0MUFKZnVsbi9RTTIrSkpFY2lVcHdS?=
 =?utf-8?B?Mko3RXgySXpwZFpQWFo4STVpVHlFcGtEY0M2K2RCL3ZUWUx0Y0ozVTZBUG95?=
 =?utf-8?B?OS9seDg2VXhqam1DS2pDZ3lOZG1YeG9JV0tsZEpMT0d4Y0l2TWVQL0R2cnNu?=
 =?utf-8?B?Mkw0ZXFjNHhxL0dDdHBzLytPTllEVHFRcTlQa0plL1BmNWFhNkl5enNMZ0sr?=
 =?utf-8?B?bUgyRlMwTVpXelF0ak5Kdk4rM05DZlhDWCs2U2NxYW5RL0RNckFmMzE4UkFK?=
 =?utf-8?B?L1Y5MmNJNEhlMGtIMGpvUzdZdjRWM3JLc1VJZUJHRmJtZGR5NEZvWkF2VUg3?=
 =?utf-8?B?U29TcFR1VzFwZk90YzMzV0xmQit2UmYzcEMzdXQrTFVacHJIQlcrdWtjNVlv?=
 =?utf-8?B?R1RVeXZPRHFPZXNGR1ZDU2F2eDc1d0ZKMmFLeGpqcDdGUGRnOHhTT0J1ZUIr?=
 =?utf-8?B?NHdzeG9ZZzl0YWJUaUtFa0VUMDlXMjNYMlI5LzZWUlEzSDhHT3ZyRkhyWnEv?=
 =?utf-8?B?T085c2N6Q0dnV2h4cWp6VHRYMUJSOWMrb2tSYjNWLzdtN3hQeVE5aXBYQXVF?=
 =?utf-8?B?SjUxazMvS3g1a2VFcENmbE9PK3M1dzhFK0szOHVuTkE5bWlLWEFJSm10bzJR?=
 =?utf-8?B?TGtnNnR4L2tvNUxZc3krZ3B3WXhCMHI2bWV3Y1RBa3kraFp5akFPZ3RuTXlX?=
 =?utf-8?B?YU1CNnNZRXhtc1pCNXMwS1V1bFo1Sk81MnJQVCtQSFpZZkV5LzQrQVlSM1Z6?=
 =?utf-8?B?QXZTaFRXaEhYNGc0cG9GcFFlT25IUTBtRjFrQjh0aUNqbnBBTWgvaFFwYTha?=
 =?utf-8?B?YkdBQkNHK24vQ25PWHpnbElBNk01TmJ5YTBBR2NZUWhZRmt1OEhmQ201NC9D?=
 =?utf-8?B?UW0rR2Z4MGhNL0E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3dxUWRCUGhPR0pQTThIdngxc0RaT09VOFFsS1oxbzZjRHE5OW56YUJQWk12?=
 =?utf-8?B?TUZXbU0wMFNVYnZRNDNxYkJtWWUrTDVoSGM0cE0zdjd2M3dlS3JiQ2xXS2tS?=
 =?utf-8?B?a2dhak5zV3gybSswT2tkbW1Oa280Q3NWSk5EeE5KbFRyeFJqaUVrOW51VzZV?=
 =?utf-8?B?ZVAvS3lGV0VwYUZEZ3pMT0FjUng4ajVBQitUUzh0R0hPQkVTMmdjLzh3V1Zm?=
 =?utf-8?B?Wk5mSjBhNzV3U21tc0NyaXVPOU9YQThRYjI3N01hSHlWOVJmTWhVdTY5cW5s?=
 =?utf-8?B?NjNONXVwSk9uYjZkYTExdnBSQ3p1Z0ZOay8zVUcrR2xPaTN6K20vUjJrVWVh?=
 =?utf-8?B?UlEwbWVyUWRPTWY5MnBkTGVPSWZNalM5QWZ2cDJIT1d6dHdadnM0WlhQZ2Fl?=
 =?utf-8?B?K3VwT0tWL3RhWjkxTGwzOGRXRWtTQWRtQS9sRkNPMWNPSE9LYS9MYUc0MTVP?=
 =?utf-8?B?TVIyK2dlSXZIVW1FYytlYmVNVHpZMHNUUnNmTGpuOWpNTkF5UlFiT3NaSEM0?=
 =?utf-8?B?QTJ2QUhhbkRFRzlmWFVSSmFhWElRWHlYUzJwWC9FZE1ZeHNQMmhJSXhEdFZQ?=
 =?utf-8?B?eUgyUnJ0Sk5SOWRaYksrd2NNYzc5cEdiSk5KMWRqRDlwbGpKQkRwZVRzRlQ2?=
 =?utf-8?B?eTFKTzg0ZUw2cHUyK2l6eTNXaFVvMEJLbW9GVEdOQXozYUw3WFdNYWROQXZx?=
 =?utf-8?B?SkxOMkJIdHpZYzNCdzJjc0FKYlhpRC9VVVpIUGN6bWxmU3F6eEdLMnBnMXhy?=
 =?utf-8?B?NEdrTlQwU2ZxRXJjcC9IY01rZTNCUHZzNjlqcndiR1FYSjNxdktGdEQ3S1Vm?=
 =?utf-8?B?NXd3eUxyNjkrQWlvU3ZJWlBLSHVZU3RHa2pmZ2kwSDFvMkdwTHB4Ykt5ajd2?=
 =?utf-8?B?RlVMRnFuUGNWTzJWODRKT2lsb2tuRDd3T0xVUWlMS2tTV2JDUUtLQ2ZwT1M5?=
 =?utf-8?B?YnJQVlRPNUpkRHFnTWRDQm9uSTA4RUV1S2M4ZFhSaEhvUGZOVno5SmlmR2Jj?=
 =?utf-8?B?VFlyd3BsNkVnR3U4TkhrMnNqVVJxZTJYN09ua0tlN2t5VFpyUTJpV2V3enFw?=
 =?utf-8?B?TDBTR3pUM2I3WUp4eThiLzNQUURnd1BMN2VaV1BORFhuR3k2V2RTN3BoNTBu?=
 =?utf-8?B?NUNmZCtGeWxIZXQzd0wwQ3lQTzlkbkQwTGdYdDNRZnloY3dFYnJwS1dpVHBa?=
 =?utf-8?B?YmFjcnU4aHYyUHV6NkV0ZHhqcnZKVHJCZGY0VUZvTjZUTjNESHROSTJaS0lo?=
 =?utf-8?B?V0RRTFZMc1lZQkM5c08zUWo1WFZJMDladWZyeFFVemg4ekFPb0hsNllSRjBu?=
 =?utf-8?B?WHh6TlRNUGZ5V2dlRXV4NjQwNmFIVjFzc053N2JrRjRuZDMybXdNaTJOS2s2?=
 =?utf-8?B?ZWwxalFJOXJwUDcyeE1xM2x0QVNwTE5HMzBITUtBNm0zODdsQmxwSWFxZ1Mr?=
 =?utf-8?B?M2Iya2hSYWRiNTB4dU9Xa1Y0T290aUhnandYZW93VUdYMU03ZEFUOXpERm9K?=
 =?utf-8?B?eGF3SGVLQXBlc3FNeDJEcjlmdExpeld4anFRRE9CQXBsNHZOb2xLZ3BuK1lk?=
 =?utf-8?B?bUhyQVAxVDVERi9DMzMwY3ovRDE1SDVUTzJxRmJ2WTZCVG5CT29KbVVPdTdG?=
 =?utf-8?B?dHIrT0kwT3JNSmYybllPeFFzM1NVUmpKQ1MrbWxhajVaSTk1U3VUU3QvTU5Y?=
 =?utf-8?B?eVZqVXNYTElXVFJMcjByRDRpQ21LWGlSZW1ISlBBREV6Z29WZE1jSy9jQ0dE?=
 =?utf-8?B?QXZ4UnRiY1NhOUZ4NEYvRE9Semtnczc4dGMxSEpKZmcwZldEWlRyR1hHMUJp?=
 =?utf-8?B?dlJxekdhWlNzOThMekRVQmw5V0h3QVBtWmVXOUltS05MMG5HM0pEdXlxQ29Q?=
 =?utf-8?B?VEZBTmdGalJqUmR0S05MTkNTVmdTazVpNCtVd3dsN0FraDNOaDliUC9WSXRs?=
 =?utf-8?Q?MBhoWBd4paexJyqw6/sWXORGuswSo6g0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35394e9-8edf-475f-6f30-08ded69b00ae
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB8968.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:30:35.8554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6445

From: DongliLiu <dongli.liu@outlook.com>
Date: Mon, 30 Jun 2026 19:30:00 +0800
Subject: [PATCH] usb: typec: ucsi: Fix off-by-one in connector validation

UCSI_CCI_CONNECTOR() returns a 1-based connector index, while
num_connectors represents the total count of connectors. Using '<='
allows num_connectors itself as a valid index, which is off-by-one
since valid indices are 0 to num_connectors-1.

Change the comparison from '<=' to '<' to correctly reject the
out-of-bounds case.

Signed-off-by: DongliLiu <dongli.liu@outlook.com>
---
  drivers/usb/typec/ucsi/ucsi.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index xxxxxxx..yyyyyyy 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -xxx,yyy @@@ static void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
      ...

-    if (UCSI_CCI_CONNECTOR(cci) <= ucsi->cap.num_connectors)
+    if (UCSI_CCI_CONNECTOR(cci) < ucsi->cap.num_connectors)
          ...
-- 
2.40.0

