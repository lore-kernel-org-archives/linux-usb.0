Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBAA3EC805;
	Thu, 30 Jul 2026 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403802; cv=fail; b=oUA7Iw3rPrRgQsaS2atYjxvvcelnwtFmF5m2YLxlHrfZTSBdX8wnZ3PY0eLDdFHU6I4g+n0LwJ6ZE4umqy0nZN4qVOAx0EjWk35bMCc5P2gEerIcUNXbC/cD4RYo4TCNRomSqO5gOHLDH4z+3ah/6LwzmGd9c0gYQudyryHMT2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403802; c=relaxed/simple;
	bh=DoppucL6OWGxxfXQ3H5ita8DdUW+yX5R/3fp4qKHlDM=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=X0q3IwbzemrszlV5+ebKK00+07+eLt1eAnW8yjpyWvIXRRiBXvBGSuacrIaWHhA7zRw47Lgz9ms5HGBTwEgzVC9Df8vRci76YWjF5JyVIf8XSGxixS0oY7hlr5Zvzg15fJmVpiaOXHebzua+PChyrnUC2g9tkS5qS9Z68Wfhev4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=C1LKOtE7; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="C1LKOtE7"
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9TDwR3675721;
	Thu, 30 Jul 2026 02:29:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=EZFfaNW79EMZ8vBo3pvb86
	qTi2st7qD4n8MXjhs8mFM=; b=C1LKOtE7VUjZ7GseKQAxcDtb0Q/ipXneMP+P3v
	LfIbiULRmrdI0Q8potXQ81r8z+JL0M6b2wiUPwhamkOWLmyFT2bXq+f2sLYnkdEJ
	Qq3LbC+EbFlo5YvEsjYfdVGqdCU4jHcM+qRsfhAXhVnKqX1KNCWYt7tW3rBD7Azx
	Kh26Dv3ggswodsxTNtFnVx6JKA1WSvmUIna4BXlVOEW27aLBA6N9dnqv93FQqe/I
	C200hDuFTb6vGRXjAufj1xgY8xNMD1kEiaj4PMvKVI7M1pju/2nt3cPdLfDec3rc
	HbfM4vmLD8Duw9ZVgn/8T7EfWHZvvcu8oObXcX/c+6NVu85w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012045.outbound.protection.outlook.com [40.107.200.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fr2t6r2pk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 02:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LljpTZlYzPZIw93lp1cBpzuipOYwp56babdTlpvl9fd9kYhT3YpAHwZrOeoiW1quLpPZcMgoxrJ7oVXHWwxWaEaYhA3Cs9aUk2dtPeElIKWBVdbyswWzgggAX25q5VH14uzsHGvpy3UMZXNXgIa+6uJ5R2/wnNilbXjuSuhwmHtDFFxnn43uvjh/LBvJBuy7nTmmuavyKxVate4cnca7e4h7zN+TKE/b9lQbpo9fRBzZeEKpca/Km+XqdhcQfb2ds/WZ55LSRTHFSvpwRDyUUgtkCTEhPY6FJAzWGTF1BJQ4IUijaZwled5/k9T4PEFOyOybtwNMp0t5z860/8KXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZFfaNW79EMZ8vBo3pvb86qTi2st7qD4n8MXjhs8mFM=;
 b=WMeRFYG4unSrCtoJtN8gaaCjItsSFTADfDJWF6+iD2hZofgE+mqsZ3N6ZChl7M75kh4UrtqkTGnajE2uWazIFlqpuwEkSwC7U5duAZummIv2rkeT1V+i3YZXa1UVUfE5l22n2Agh5jT1CL7V2v6FpzSXMtfWt6Rhexq/NAHOyn1IUBqgnqYKbo0GA8e3UxYpZkwhFZ8FgGFOJhBlIJTRF0vF6cn6Ho1oc+WtOqnUE8tv2r0aNeZvaQI7bbX/ZILAedOcWpJ3whZiEHVuDclobEW3Hq6ZFOvbXfRFujwNR+Bg13araaoe7dJ1WC9dXIJ3NixR0BmyW87Hv+98y/L5lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20)
 by MN2PR11MB4584.namprd11.prod.outlook.com (2603:10b6:208:264::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 09:27:40 +0000
Received: from DM4PR11MB8157.namprd11.prod.outlook.com
 ([fe80::c801:fbdd:4e88:e291]) by DM4PR11MB8157.namprd11.prod.outlook.com
 ([fe80::c801:fbdd:4e88:e291%3]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 09:27:39 +0000
Content-Type: multipart/mixed; boundary="------------R7xfkopEfXAIj0C9KOdRXI6Z"
Message-ID: <16e0db6c-a8b8-48f2-9164-c248664d053c@windriver.com>
Date: Thu, 30 Jul 2026 17:27:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: f_mass_storage: reject relative paths to fix
 sb_writers deadlock
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, kyungmin.park@samsung.com,
        andrzej.p@samsung.com, balbi@ti.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729103245.3744500-1-Xue.Lei@windriver.com>
 <d1cd4b2b-6389-40af-8637-1d3fa46c2491@rowland.harvard.edu>
Content-Language: en-US
From: "Lei, Xue" <Xue.Lei@windriver.com>
In-Reply-To: <d1cd4b2b-6389-40af-8637-1d3fa46c2491@rowland.harvard.edu>
X-ClientProxiedBy: SEWP216CA0062.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::16) To DM4PR11MB8157.namprd11.prod.outlook.com
 (2603:10b6:8:187::20)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB8157:EE_|MN2PR11MB4584:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1d3dbe-6fdc-48ef-e0c8-08deee1cccab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|6049299003|23010399003|366016|42112799006|1800799024|6133799003|4053099003|18002099003|22082099003|56012099006|4143699003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	HQuPOM5F4Xk33wdB0EvE0Mib3Lxo+pM11yXoMQG66sXG/8lbClnIo+39y8oIB3mLmU/r4+PIXliYQZOwqMERSCbfrBBhi5qQzvONZ8nxv2KsjmWL1ECSSHDtqEn0G9Ze7xFW+GnEE4/9dCnhDGVYwWcjV5Pl9s+W2shV2VdDqwpdzUtmp58EkhZ1r2i7i2wMjAf+T0c7nEW0OLrZjJeYzyZ9N+15y/itV8jNTIid/vRKRQyZW2zxdHKTovvgjFMG1IlHSrVj7wt2M5S8uGQR+8NY13Yrv/UtCBk5isVKkztaU1J03OLBBw6KEe6ZljZHPdrUTX40yqWpBbB+3qvpTlZHF+ET9MlMKvXwQVF3tDDCzcGTaMGWnNIt1FTjR7YiZw5+WHxQdJXPSdaMV/ICESmvb8M54iw3QRxIRyQtYf7DPz5cnLRh+9N0RfpkEZjExgfbIX1CBk++19qmNsq+6GGpbT+B4RwdB8HcLyv/F0aNSoZs9apR4FMHWhO/paTu1FyEITmysVTdLbCXou45XanKhT/HVU+bl0Y27bE9LnbqEPkMedDCkmQ/izVe9bLXF9qyHwGIAi4aSchBJyzqR5Ie2tw8g8sdtW+af4a3l0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB8157.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(6049299003)(23010399003)(366016)(42112799006)(1800799024)(6133799003)(4053099003)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3BzNEhjYWNyU28xKzgzS3pub0I4bmxFaGt2N3J6bk43VkRqcWlDWk02Ylp4?=
 =?utf-8?B?R1UwU2tDYmRwQTVuVHRUNEdhWUtTSy93ZlpWWU9RaElzd1pmMzcvNzFvbVBE?=
 =?utf-8?B?WGEzSTRZNFo4MFlCcmFLYXFjZG5RTTBFWk1JQmIzbm9ITWwvRUFxUkNJaWZN?=
 =?utf-8?B?dG9tbkV4ejRDaEdqQVh6R3VUK3lhck1hT3pyVFh1QWxxVUlzZlEyQlNVNk9o?=
 =?utf-8?B?alB0SS8rK3RGNUhoSlNNaTFpVlp5SFd6aFg4Wmtody95aTF3UlBiNzBqZXZ5?=
 =?utf-8?B?SURNSVQ3NjRPdUZMZ2h4dFJFL3FRT0RYdkdpSGxkakZGQU51cFJJbTJ6RzJ2?=
 =?utf-8?B?Z1gremZjS1lleXVjNmJaNGRXUE5WQmt0aEl5K09FRXFHaFIwUDlXaG9rOXlu?=
 =?utf-8?B?VWo4UEhBK0FlUFh2UkI5K3NiVllEbmthYTRIUDlYd1c4QlEyVHpVSkl0Nktq?=
 =?utf-8?B?SVUyRXlTbFk3RzMwMmpVZVZTUU1heUhxQ0ZjV2pjWXR4U0NOSXlmQUFhKzFQ?=
 =?utf-8?B?T3Qyd3kvLzFCNmVGbjRBdHdMQUl1cnpOUk8zWThiYTlrRWtQZnRsNkFXTWFt?=
 =?utf-8?B?eVlwTTM1TG5JakU0ZVpzRDZnQ0dLZzJsVlFPY3ltbHhvOVhwWS9WampYdXph?=
 =?utf-8?B?UE85a0V3WFVtZ0JKNzlCOU95T2R6ZzUvTGExeDVCejA4R0x3UTF2a000UXF1?=
 =?utf-8?B?QVFlUk11ZWhqUjlHa2ZQMy8wdzl5ekw5V1NGRzI1Z0xONzRYb0xuaHBoRVRj?=
 =?utf-8?B?YnE0T09sb0FBN2d0SGlOR2tZTVdodHNsRWZiSHRlUHRpRUxvUXo0OUdQU3hM?=
 =?utf-8?B?ZURSZHNYcWpIb3RCTU40YWRnSEZ1MTF2ZmVva0ZsUnVJNFZoRmRTTjFIN1RD?=
 =?utf-8?B?SUkreEc2TE1jdUovTitqZ0tqNGdycXVGKy9HZVhYRlF4RGNxL0lDaTlBTjFO?=
 =?utf-8?B?ZnVnWGtXd3Jid3hQRkIrZXdzUXFKUFU4R2xXb0lxbFovWlZaL1cvZ0JQQTFx?=
 =?utf-8?B?YUdDZlFSYjVQRXpQZTVQeU5TKzVkdTd5K2F6aktvaVhFK0NuVmtXWmpieTND?=
 =?utf-8?B?eFpaWmg1NEkwZks5a255b3Nyak93UWlyanUrMGxkSEQ0REEvKzBubmlwSDB4?=
 =?utf-8?B?cHlRM00wSGZkVVpITHk4eTNVVU1tV2VQOUtIYUZobWpNSU02ZEJaUW1HbjRF?=
 =?utf-8?B?MzUwaUpabkl5cUs1WUdkS3QrajZiQU54OUtkNFR1WEtWcVRyT2ZxZldNZ1NY?=
 =?utf-8?B?Q0VPdzdlL29KeWpZTWZ2bTJ5dkNrTUdsWlVjWWRpR0lDU3dQOHNSWk0zMU92?=
 =?utf-8?B?ZzA2b1lrTzhPTHZ5Q25GYVZ3TEYxd2xKVys5d0wzc2gzTkFlMmtRUkdjeDlm?=
 =?utf-8?B?VkVTVUtUMGFHOFJwR2orczVNaE95Z1JlTUN3bVZHbmZRQnZBSEcxQ2djbEsw?=
 =?utf-8?B?anBnK3BjSWRyT1FKblFaTEgwcXc5RGx4dXU1b3RvVUV5YWQrWE0zMUxMYW1x?=
 =?utf-8?B?aTZEVngrOXVsVnl2eFBpL2FaQmhVRzhNd3ZKTnVBZVpab2dRRzhJeFhubGV5?=
 =?utf-8?B?a1FhaWhMOWQ1L2oxbkFxUmViUDJseTMyN3ZEYmk0UWxVM1VwREFIMFg0RDV6?=
 =?utf-8?B?Rk02MnQvcVpVNWZzRW42V0FVT0ExVjdpSExHWTB4YnY0Zk1DQnJRWWtuTjk3?=
 =?utf-8?B?QVlnNGYxZXExQzQ1dFJrTXZvZmZKYzgxSWdNY1FMZER3ZE11cFpkSStFS3la?=
 =?utf-8?B?a1RjRFlRR1dnRmtUUXpFOWZPUmY4WGRDNXVzNzlNK0pyRVdJa1NSd2hrM3hC?=
 =?utf-8?B?ci93UDdaNzd6VWYySlFFSUo5VytmV2w2QUZsMkZsVzhtWVJVZ1dpZWxlTXF3?=
 =?utf-8?B?bTRCYlJsYk5mZVQxZy9TbC8wREx2eEdCQ1dTZ3VaSUZxaWs3WDJMand2bkZk?=
 =?utf-8?B?ODhyTE5uUDN6YTFsMk91TDNzeTE2QXlQUlRyYmg4Y2NaT1MyOGJDZU5qMUZH?=
 =?utf-8?B?Z082eGwvemRic2dpRUl1aGN6MGV4bHdyc3U4S05pbEk1Nmx2bEVQR1VHNDFr?=
 =?utf-8?B?cGJMeCtrL1llaWU0ZHZQQ0hGdnlZZVNiMlZhK1VGaDMzVXcvQ294dkFsVzFw?=
 =?utf-8?B?ckFyNTlsVGdZYzl5ZzRmbkFvT2RhSHNWTzhMbC81cm9ubktERW1wS1R4RG5k?=
 =?utf-8?B?b2dRWVh0Q2tlTEV1Qko1UTQwNEtaMy9IOEJFSVhERkR3T2IzL3FNckpTUUtK?=
 =?utf-8?B?bzBIRmxiM3kwQU9ZS0w2K2FCamJrQmREZ2V0UzdEbjFSN3BMUUlDcjRNdElC?=
 =?utf-8?B?OEdSNTM5T3o0RHFWUkhmVWIwN0NNd2NqRDJyUjF3MHVaNFUxdG9hdz09?=
X-Exchange-RoutingPolicyChecked:
	UN7uoqbaT3UA45o6DAWxwTKuvGFYN9HZHzxSgGQMAMLmwtvc+SbLrqjyJTZX4EcsV7pTjsvXbPWYG3ICVlU+kJF/0nsvAD447qBdeT+Bkbm35Cfvx/Ipn0x1dTI9fVUuPeT6gW8qyN6P1RVYwi9YYLVOQnHp9285gxzyIsax/MB2F9jVqv1b34dLFcE94gEHQjNpBRRowk8SvmHF1tYil4SUMp3qjJXOeicy81OPdfTVXpjv2Gnsewp/jg+LaYAn26SBrZZfLaHjZAKAw0CMdKhPQ6EO5IgN2aLKlZEIdPKRXeEfoVN3L2s5QC6n2JPsnlJ+WEyT1QRRzFLvGHi6NA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1d3dbe-6fdc-48ef-e0c8-08deee1cccab
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:27:39.6932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NoG9sNneXGX5w8Qrr8Jy+Q0NjfuiEj8U1tmOIAa7PwmLRpCnkW7iAFVfOOobHv2S5ANa9ekSQgfm0/DeJnXag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4584
X-Proofpoint-ORIG-GUID: iQbrpNVbsKphjlT5XuWhdjmU-GQEwgU9
X-Authority-Analysis: v=2.4 cv=bY9bluPB c=1 sm=1 tr=0 ts=6a6b197d cx=c_pps
 a=HkOkC5mvV7OaefGfpXsf6A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=edf1wS77AAAA:8
 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8 a=aLllMQoaZm5tio56W8gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Gr7Oi63AWUoiObhNj6YA:9 a=B2y7HmGcmWMA:10
 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX6QulZzmqrFhO
 Fnj9+EzQtNKhrUlQYW7QWk0OXAIanFmTJl8fg8W5TRf3eqaVm/78RjeWUl9VNlZSVGlnIIesy+D
 j34DTmYAphO7cxK/feFFihHYe71mGl1cljUjqmGUlCO5Ii09KD6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX5cGEX53Vu2og
 Yms8uN5Yf/l+WghCnkEPHzEIYpNsV7VNymKNPmiwlGKPoLPlPgKWjhbZ+RAawN/MThigJNvmLSb
 FnZDWtgZZsIQvXLYxIxZ/D95dh6zX3j2c65ZTK+A6GWbduOT69dS0BYofVaBKUDpXan9hjxY2qt
 6+BTDeZC8goKFSTnLo8sw+Rvxz5zIoZioXMdfFkI8m99bx5EuL3hoztYMdw6KX09bMfURXXvKEY
 28kVT0bdJT8pWsdKm9xCVCwJ5j9I+tZeV/YIgYy52pX9XVMkTgnqXKKjPu1NE/jmibGM3yW3Ory
 zBVyIqGtXOFEBjuQMZZrwsY6Y8UC+crFuemmZximvKBdykXYrrOBHoSyAooJFWdvcBakfj3kO75
 1UFzwjGL8n9yGd1rzb57wI7MlaZSMgkK4Vb/MoyZQKf/pkFoUV2NFOK8FHU+Xn3wLsqlBHKLHyd
 kN9N/kDFJcHg8asiUNA==
X-Proofpoint-GUID: iQbrpNVbsKphjlT5XuWhdjmU-GQEwgU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1011 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

--------------R7xfkopEfXAIj0C9KOdRXI6Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

That's good questions.

 > What happens if the user gives an absolute path that just happens to 
be below the configfs mount point?

For example: echo "/sys/kernel/config/usb_gadget/g1/idVendor" > lun.0/file
This path starts with /, so it passes the buf[0] != '/' check introduced 
by the patch.
The path then enters fsg_lun_open() → 
filp_open("/sys/kernel/config/...", O_RDWR). During path resolution, the 
VFS traverses into the configfs mount, and
open_last_lookups() calls mnt_want_write() on the configfs vfsmount 
because O_RDWR is set. This triggers sb_start_write() on the same 
configfs superblock
whose sb_writers is already held by the outer vfs_write() → 
file_start_write().
This is the same deadlock scenario

 > What happens if the user gives a relative path of the form "../filename"?

For example: echo "../some_file" > lun.0/file
The first character of "../some_file" is ., which is not /. The patch 
rejects it immediately with -EINVAL before fsg_lun_open() is ever called.
This case is fully handled by the patch. No deadlock, no file open 
attempt — clean rejection.


How about the patch 
0001-usb-gadget-f_mass_storage-defer-filp_open-to-workque.patch?

The deadlock fundamentally occurs because filp_open() executes in the 
same task context that holds sb_writers on the configfs superblock. Any 
path-based
validation approach (rejecting relative paths, checking the target 
superblock after kern_path(), etc.) is inherently a heuristic — it tries 
to predict
which paths would lead to the recursive lock acquisition and reject them 
upfront.

And this patch eliminates the problem at its root: by moving 
fsg_lun_open() to a worker thread, filp_open() runs in a context that 
simply does not
hold sb_writers on any superblock. The recursive acquisition becomes 
impossible regardless of what path the user provides — relative, 
absolute, pointing to
configfs, or anywhere else. There is no need for path validation 
heuristics or filesystem-type checks.

The trade-off is one additional context switch per file attribute write, 
which is negligible given that this is a configuration-time operation 
(not a data
path), and fsg_lun_open() already performs blocking I/O (opening and 
validating a backing file).


BestRegards,

Xue Lei



On 7/29/26 22:12, Alan Stern wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, Jul 29, 2026 at 06:32:45PM +0800, Xue Lei wrote:
>> A deadlock can occur when writing a relative path to the mass_storage
>> lun file attribute while the process's CWD is on the same configfs
>> mount:
>>
>>    write(configfs_fd, "relative_path", ...)
>>      -> vfs_write()
>>        -> file_start_write()          -- acquires sb_writers (configfs sb)
>>          -> configfs_write_iter()
>>            -> fsg_store_file()
>>              -> fsg_lun_open()
>>                -> filp_open("relative_path", O_RDWR, ...)
>>                  -> path_openat()
>>                    -> open_last_lookups()
>>                      -> mnt_want_write() -- tries to acquire same sb_writers
>>                         *** DEADLOCK ***
>>
>> This happens because filp_open() resolves relative paths against the
>> task's CWD. If the CWD is on the same configfs superblock, path_openat()
>> calls mnt_want_write() which calls sb_start_write() on the same
>> superblock, causing a recursive lock acquisition that can deadlock
>> during filesystem freeze.
>>
>> Backing file paths for mass_storage LUNs should always be absolute
>> paths pointing to block devices or regular files. Reject relative
>> paths early in fsg_store_file() to prevent this deadlock.
> What happens if the user gives an absolute path that just happens to be
> below the configfs mount point?
>
> What happens if the user gives a relative path of the form
> "../filename"?
>
> Alan Stern
>
>> Reported-by: syzbot+4c9318af45f0bf2af153@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=4c9318af45f0bf2af153
>> Fixes: ef0aa4b92cf1 ("usb: gadget: f_mass_storage: add configfs support")
>> Signed-off-by: Xue Lei <Xue.Lei@windriver.com>
>> ---
>>   drivers/usb/gadget/function/storage_common.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/storage_common.c b/drivers/usb/gadget/function/storage_common.c
>> index 75831f2c7abe..d45c7a34df99 100644
>> --- a/drivers/usb/gadget/function/storage_common.c
>> +++ b/drivers/usb/gadget/function/storage_common.c
>> @@ -448,6 +448,12 @@ ssize_t fsg_store_file(struct fsg_lun *curlun, struct rw_semaphore *filesem,
>>        if (count > 0 && buf[count-1] == '\n')
>>                ((char *) buf)[count-1] = 0;            /* Ugh! */
>>
>> +     /* Reject relative paths to prevent sb_writers deadlock when
>> +      * CWD is on the same filesystem (e.g., configfs).
>> +      */
>> +     if (count > 0 && buf[0] && buf[0] != '/')
>> +             return -EINVAL;
>> +
>>        /* Load new medium */
>>        down_write(filesem);
>>        if (count > 0 && buf[0]) {
>> --
>> 2.49.1
>>
>>
--------------R7xfkopEfXAIj0C9KOdRXI6Z
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-gadget-f_mass_storage-defer-filp_open-to-workque.patch"
Content-Disposition: attachment;
 filename*0="0001-usb-gadget-f_mass_storage-defer-filp_open-to-workque.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAxMTJhMjUyY2JhN2UyNzg5YWU5YWFiMGQ0NWQ1YzQ3MjJmMzAwYjk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBYdWUgTGVpIDxYdWUuTGVpQHdpbmRyaXZlci5jb20+CkRhdGU6
IFRodSwgMzAgSnVsIDIwMjYgMTY6NDU6MzYgKzA4MDAKU3ViamVjdDogW1BBVENIXSB1c2I6IGdh
ZGdldDogZl9tYXNzX3N0b3JhZ2U6IGRlZmVyIGZpbHBfb3BlbiB0byB3b3JrcXVldWUgdG8KIHBy
ZXZlbnQgc2Jfd3JpdGVycyBkZWFkbG9jawoKV2hlbiB0aGUgbWFzc19zdG9yYWdlIGZ1bmN0aW9u
IGlzIGNvbmZpZ3VyZWQgdmlhIGNvbmZpZ2ZzLCB3cml0aW5nIGEKYmFja2luZyBmaWxlIHBhdGgg
dG8gdGhlICJmaWxlIiBhdHRyaWJ1dGUgaW52b2tlcyBmc2dfbHVuX29wZW4oKSAtPgpmaWxwX29w
ZW4oKSB3aXRoaW4gdGhlIGNvbnRleHQgb2YgdmZzX3dyaXRlKCkgb24gdGhlIGNvbmZpZ2ZzCmF0
dHJpYnV0ZSBmaWxlLiAgdmZzX3dyaXRlKCkgaG9sZHMgc2Jfd3JpdGVycyBvbiB0aGUgY29uZmln
ZnMKc3VwZXJibG9jayB2aWEgZmlsZV9zdGFydF93cml0ZSgpLiAgSWYgdGhlIHBhdGggZ2l2ZW4g
dG8gZmlscF9vcGVuKCkKcmVzb2x2ZXMgb24gdGhlIHNhbWUgY29uZmlnZnMgc3VwZXJibG9jayAo
ZWl0aGVyIHZpYSBhIHJlbGF0aXZlIHBhdGgKd2hlbiBDV0QgaXMgb24gY29uZmlnZnMsIG9yIGFu
IGFic29sdXRlIHBhdGggcG9pbnRpbmcgaW50byBjb25maWdmcyksCm1udF93YW50X3dyaXRlKCkg
aW5zaWRlIHBhdGhfb3BlbmF0KCkgYXR0ZW1wdHMgdG8gcmVjdXJzaXZlbHkgYWNxdWlyZQp0aGUg
c2FtZSBzYl93cml0ZXJzLCBjcmVhdGluZyBhIGRlYWRsb2NrIG9wcG9ydHVuaXR5OgoKICBDUFUw
ICh3cml0ZSBwYXRoKSAgICAgICAgICAgIENQVTEgKGZyZWV6ZSBwYXRoKQogIC0tLS0tLS0tLS0t
LS0tLS0gICAgICAgICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tCiAgc2Jfc3RhcnRfd3JpdGUoKSAg
W29rXQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnJlZXplX3N1cGVyKCkKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGVyY3B1X2Rvd25fd3JpdGUoKSBbYmxvY2tzXQog
IHNiX3N0YXJ0X3dyaXRlKCkgIFtibG9ja3NdCiAgICAgICAgICAtLT4gbXV0dWFsIGRlYWRsb2Nr
CgpUaGUga2V5IGluc2lnaHQgaXMgdGhhdCB0aGUgZGVhZGxvY2sgb2NjdXJzIGJlY2F1c2UgZmls
cF9vcGVuKCkgcnVucwppbiB0aGUgc2FtZSB0YXNrIGNvbnRleHQgdGhhdCBob2xkcyBzYl93cml0
ZXJzLiAgSWYgd2UgbW92ZSB0aGUKZmlscF9vcGVuKCkgY2FsbCB0byBhIGRpZmZlcmVudCBjb250
ZXh0IHRoYXQgZG9lcyBOT1QgaG9sZCBzYl93cml0ZXJzLAp0aGUgZGVhZGxvY2sgaXMgaW1wb3Nz
aWJsZSByZWdhcmRsZXNzIG9mIHdoYXQgcGF0aCBpcyBwcm92aWRlZC4KCkZpeCB0aGlzIGJ5IGRl
ZmVycmluZyB0aGUgZnNnX2x1bl9vcGVuKCkgY2FsbCB0byBhIHN5c3RlbSB3b3JrcXVldWUKdmlh
IHNjaGVkdWxlX3dvcmsoKSArIHdhaXRfZm9yX2NvbXBsZXRpb24oKS4gIFRoZSB3b3JrZXIgdGhy
ZWFkIGRvZXMKbm90IGhvbGQgYW55IHNiX3dyaXRlcnMgbG9jaywgc28gZmlscF9vcGVuKCkgY2Fu
IHNhZmVseSBhY3F1aXJlCnNiX3dyaXRlcnMgb24gYW55IHN1cGVyYmxvY2sgd2l0aG91dCBjYXVz
aW5nIHJlY3Vyc2lvbi4gIFRoZSBvcmlnaW5hbApjYWxsZXIgd2FpdHMgc3luY2hyb25vdXNseSBm
b3IgdGhlIHJlc3VsdCwgcHJlc2VydmluZyB0aGUgZXhpc3RpbmcKc3luY2hyb25vdXMgc3RvcmUo
KSBzZW1hbnRpY3MgZXhwZWN0ZWQgYnkgY29uZmlnZnMuCgpUaGlzIGFwcHJvYWNoIGlzIGNvbXBy
ZWhlbnNpdmU6IGl0IGhhbmRsZXMgcmVsYXRpdmUgcGF0aHMsIGFic29sdXRlCnBhdGhzIGludG8g
Y29uZmlnZnMsIGFuZCBhbnkgZnV0dXJlIHNjZW5hcmlvcyB3aGVyZSB0aGUgZmlsZXN5c3RlbQp0
b3BvbG9neSBtaWdodCBjcmVhdGUgc2ltaWxhciBzYl93cml0ZXJzIGNvbmZsaWN0cyAtLSB3aXRo
b3V0IG5lZWRpbmcKcGF0aCB2YWxpZGF0aW9uIGhldXJpc3RpY3MuCgpSZXBvcnRlZC1ieTogc3l6
Ym90KzRjOTMxOGFmNDVmMGJmMmFmMTUzQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KQ2xvc2Vz
OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9NGM5MzE4YWY0NWYwYmYy
YWYxNTMKRml4ZXM6IGVmMGFhNGI5MmNmMSAoInVzYjogZ2FkZ2V0OiBmX21hc3Nfc3RvcmFnZTog
YWRkIGNvbmZpZ2ZzIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBYdWUgTGVpIDxYdWUuTGVpQHdp
bmRyaXZlci5jb20+Ci0tLQogZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3N0b3JhZ2VfY29t
bW9uLmMgfCA0OSArKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDQ3IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0
L2Z1bmN0aW9uL3N0b3JhZ2VfY29tbW9uLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24v
c3RvcmFnZV9jb21tb24uYwppbmRleCA3NTgzMWYyYzdhYmUuLmMzMzU5MTMyNjA4NiAxMDA2NDQK
LS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3N0b3JhZ2VfY29tbW9uLmMKKysrIGIv
ZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL3N0b3JhZ2VfY29tbW9uLmMKQEAgLTIxLDkgKzIx
LDExIEBACiAKICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9ibGtk
ZXYuaD4KKyNpbmNsdWRlIDxsaW51eC9jb21wbGV0aW9uLmg+CiAjaW5jbHVkZSA8bGludXgvZmls
ZS5oPgogI2luY2x1ZGUgPGxpbnV4L2ZzLmg+CiAjaW5jbHVkZSA8bGludXgva3N0cnRveC5oPgor
I2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5oPgogI2luY2x1ZGUgPGxpbnV4L3VzYi9jb21wb3Np
dGUuaD4KIAogI2luY2x1ZGUgInN0b3JhZ2VfY29tbW9uLmgiCkBAIC0xNzYsNiArMTc4LDQ5IEBA
IHZvaWQgZnNnX2x1bl9jbG9zZShzdHJ1Y3QgZnNnX2x1biAqY3VybHVuKQogfQogRVhQT1JUX1NZ
TUJPTF9HUEwoZnNnX2x1bl9jbG9zZSk7CiAKKy8qCisgKiBXaGVuIGZzZ19sdW5fb3BlbigpIGlz
IGNhbGxlZCBmcm9tIGEgY29uZmlnZnMgc3RvcmUgaGFuZGxlciwgdGhlIGNhbGxpbmcKKyAqIHRh
c2sgaG9sZHMgc2Jfd3JpdGVycyBvbiB0aGUgY29uZmlnZnMgc3VwZXJibG9jayAodmlhIHZmc193
cml0ZSgpIC0+CisgKiBmaWxlX3N0YXJ0X3dyaXRlKCkpLiAgSWYgZmlscF9vcGVuKCkgaW5zaWRl
IGZzZ19sdW5fb3BlbigpIHJlc29sdmVzIHRoZQorICogcGF0aCB0byB0aGUgc2FtZSBzdXBlcmJs
b2NrLCBtbnRfd2FudF93cml0ZSgpIGluIHBhdGhfb3BlbmF0KCkgYXR0ZW1wdHMKKyAqIHRvIHJl
LWFjcXVpcmUgc2Jfd3JpdGVycywgd2hpY2ggZGVhZGxvY2tzIGFnYWluc3QgY29uY3VycmVudCBm
cmVlemVfc3VwZXIoKS4KKyAqCisgKiBEZWZlcnJpbmcgZnNnX2x1bl9vcGVuKCkgdG8gYSB3b3Jr
cXVldWUgd29ya2VyIGVuc3VyZXMgZmlscF9vcGVuKCkgcnVucyBpbgorICogYSBjb250ZXh0IHRo
YXQgZG9lcyBub3QgaG9sZCBhbnkgc2Jfd3JpdGVycywgZWxpbWluYXRpbmcgdGhlIGRlYWRsb2Nr
CisgKiByZWdhcmRsZXNzIG9mIHRoZSBwYXRoIHByb3ZpZGVkLgorICovCitzdHJ1Y3QgZnNnX2x1
bl9vcGVuX3dvcmsgeworCXN0cnVjdCB3b3JrX3N0cnVjdAl3b3JrOworCXN0cnVjdCBjb21wbGV0
aW9uCWRvbmU7CisJc3RydWN0IGZzZ19sdW4JCSpjdXJsdW47CisJY29uc3QgY2hhcgkJKmZpbGVu
YW1lOworCWludAkJCXJlc3VsdDsKK307CisKK3N0YXRpYyB2b2lkIGZzZ19sdW5fb3Blbl93b3Jr
X2ZuKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKK3sKKwlzdHJ1Y3QgZnNnX2x1bl9vcGVuX3dv
cmsgKm93ID0KKwkJY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBmc2dfbHVuX29wZW5fd29yaywg
d29yayk7CisKKwlvdy0+cmVzdWx0ID0gZnNnX2x1bl9vcGVuKG93LT5jdXJsdW4sIG93LT5maWxl
bmFtZSk7CisJY29tcGxldGUoJm93LT5kb25lKTsKK30KKworc3RhdGljIGludCBmc2dfbHVuX29w
ZW5fZGVmZXJyZWQoc3RydWN0IGZzZ19sdW4gKmN1cmx1biwgY29uc3QgY2hhciAqZmlsZW5hbWUp
Cit7CisJc3RydWN0IGZzZ19sdW5fb3Blbl93b3JrIG93OworCisJSU5JVF9XT1JLX09OU1RBQ0so
Jm93LndvcmssIGZzZ19sdW5fb3Blbl93b3JrX2ZuKTsKKwlpbml0X2NvbXBsZXRpb24oJm93LmRv
bmUpOworCW93LmN1cmx1biA9IGN1cmx1bjsKKwlvdy5maWxlbmFtZSA9IGZpbGVuYW1lOworCW93
LnJlc3VsdCA9IC1FVElNRURPVVQ7CisJc2NoZWR1bGVfd29yaygmb3cud29yayk7CisJd2FpdF9m
b3JfY29tcGxldGlvbigmb3cuZG9uZSk7CisJZGVzdHJveV93b3JrX29uX3N0YWNrKCZvdy53b3Jr
KTsKKwlyZXR1cm4gb3cucmVzdWx0OworfQorCiBpbnQgZnNnX2x1bl9vcGVuKHN0cnVjdCBmc2df
bHVuICpjdXJsdW4sIGNvbnN0IGNoYXIgKmZpbGVuYW1lKQogewogCWludAkJCQlybzsKQEAgLTQ1
MSw4ICs0OTYsOCBAQCBzc2l6ZV90IGZzZ19zdG9yZV9maWxlKHN0cnVjdCBmc2dfbHVuICpjdXJs
dW4sIHN0cnVjdCByd19zZW1hcGhvcmUgKmZpbGVzZW0sCiAJLyogTG9hZCBuZXcgbWVkaXVtICov
CiAJZG93bl93cml0ZShmaWxlc2VtKTsKIAlpZiAoY291bnQgPiAwICYmIGJ1ZlswXSkgewotCQkv
KiBmc2dfbHVuX29wZW4oKSB3aWxsIGNsb3NlIGV4aXN0aW5nIGZpbGUgaWYgYW55LiAqLwotCQly
YyA9IGZzZ19sdW5fb3BlbihjdXJsdW4sIGJ1Zik7CisJCS8qIERlZmVyIHRvIHdvcmtxdWV1ZSB0
byBhdm9pZCBzYl93cml0ZXJzIGRlYWRsb2NrLiAqLworCQlyYyA9IGZzZ19sdW5fb3Blbl9kZWZl
cnJlZChjdXJsdW4sIGJ1Zik7CiAJCWlmIChyYyA9PSAwKQogCQkJY3VybHVuLT51bml0X2F0dGVu
dGlvbl9kYXRhID0KIAkJCQkJU1NfTk9UX1JFQURZX1RPX1JFQURZX1RSQU5TSVRJT047Ci0tIAoy
LjQ5LjEKCg==

--------------R7xfkopEfXAIj0C9KOdRXI6Z--
