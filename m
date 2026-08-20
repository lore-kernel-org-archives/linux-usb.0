Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010012.outbound.protection.outlook.com [52.101.193.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F11637755C;
	Thu, 20 Aug 2026 04:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787200613; cv=fail; b=WrtUzrNzn9KiND7L509XltfhXCaF9e6LHwlOME43GaF1mlNDuJduKZKuQy/SBi7B+pD3N885cJp1mYUOCiMcpNhr4YEq40FUOve6atDYky0rrNh1kK7cRk3RVmqxBq06xU5+eSbpQaGATtDKiXDkf7AqJkc3G7bVvAWX2OrHaMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787200613; c=relaxed/simple;
	bh=xpxR5S7cvxFKLKp8sNJnEOgW08OF3/CakXy9iHSpG1A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QWGq/iCAKOcETkeTXIc9tyMaFVv4c35ATkc5bfiVSlEGk0jvlc4WIW1VYxKULzYH2ihXVlG0iNNM5CApZinViswtTP6sLt/0GsFXcFgJyhHuqEZ/bMidB3MMW1X6eZSFf4iSZHd9PJa+Iv+aHEsydpBBNX02HvcgOdjXrdGjLz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=llTKQ+qN; arc=fail smtp.client-ip=52.101.193.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="llTKQ+qN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apr0FhScJlspBQxKuqfZPp7qORfhoK0NOOLxOY05sEeRdaLQNr3YpihuBmHmXz5BYb4d6uFBaLuLfXfOlMC+jhvafIQ5mP+QRGwL+F8FxQaSFOxdcCcBULuTkfEtAwlSXjS8ncytQ/JYmiMFP3eHrv/CDNRyo/ljK++wFQ9uoVZ0sigZI09nV0OYRoxOduD4jkt3oPVCcvfr4lbElMKiQVBc6LAJ36jlIrZ6L8ILGZQrc1N/X7UTji2468vI5RVQH9NRTpvu5Hm3wWDwCYwPKoX/umP3ycU99Z/cU9t2COBVLnYt9oe00poi1SIonqnShN/la9SwYwesH5JJHmqjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKZl9sXhXh2iasBGj1iJ9LReYDT685RUHoXq+PdU72k=;
 b=abb9GD3DoDUjaTlj8Yxl/g/Kc5C8x9cA6Xv7/S3q760IeMqfBSUZlFYo65E+kTThq9zLwLtMWkMP9h/W2v/mlfxTZcu8EvUhoo+XYpIEdevtTTK/FJA8lFkOgmbDZnOsX7TDG1C5wMRMzuyhkK9W4PMOn+ospEB7M3o5ZeMhUIDNJ5Bps+XT/pxrhqyCHFhTjnivPNxGhzw3vOam+0t9K1+oYNZSEbb+zk6XRTh2JAeHEeqyuWT6bx4DpPzMxBXz5fL+0++Q5qdgivaweHFWUvNsJu9PRJTAIpH/caZxtMB3TQgYlKGRrCJ5jqwkn156InCi5y/cONBjNIKbXrxOpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKZl9sXhXh2iasBGj1iJ9LReYDT685RUHoXq+PdU72k=;
 b=llTKQ+qNpTFamIitaeaG07wWAC/+je5O7+lN/FgA4ixFYHM5iEYHILgl4bE+TV4IRjaJAPOB3VT7lNMplXWQHsDLAQoylW+FnH+dCGc0/UDohKUkjSfJwRtpYKBNuVmdsqLyP3Vo87tBmdVnR1HCPeRWJrBtuDHgAqkRQBYU2fw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21)
 by BN5PR12MB9538.namprd12.prod.outlook.com (2603:10b6:408:2ac::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 04:36:49 +0000
Received: from CH3PR12MB8284.namprd12.prod.outlook.com
 ([fe80::1bc1:88b1:7cf7:87aa]) by CH3PR12MB8284.namprd12.prod.outlook.com
 ([fe80::1bc1:88b1:7cf7:87aa%4]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 04:36:48 +0000
Message-ID: <50a39638-cd08-4de0-ab13-f985e27228a0@amd.com>
Date: Thu, 20 Aug 2026 10:06:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci-pci: Add AMD 600 series to xhci-pci-prom21
To: Stephen Horvath <s.horvath@outlook.com.au>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jihong Min <hurryman2212@gmail.com>
References: <20260818-xhci-pci-prom21-v1-1-6584857e654d@outlook.com.au>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20260818-xhci-pci-prom21-v1-1-6584857e654d@outlook.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0208.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::13) To CH3PR12MB8284.namprd12.prod.outlook.com
 (2603:10b6:610:12e::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8284:EE_|BN5PR12MB9538:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e721b70-b94f-49bf-8c2c-08defe74a5bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	W7KX0e6cYAx8+MCEbpe74hesz6BI82h2hMQcDrWdeIT+YPVKKywoW7d3g5Yc+CW8bVALfE/HPJH5JsLCW8LuHoUB2vQjK/TTPXsZcrqZCPRmBqxmzpJmuD92Bha3WrureFOICe9VDhksZvtoYqzUimparw0XHApBAlFwZcEqxAfC9uea704HWuwIB2U9ykMF0rOVUqZQCCbnw6Oco/0UP1b1Q4oRJVNF3jNSMOVFbSUT5x2pPi2O+QQ7XJzG6gcjf+y+pwYt1t5Q8uLGECJjujr7zhcTcIIMP8krWoHcYWcTHOjMrPsoaqOSnUyV0GOK1Nlmwxqw5W9iPp94FVw7xtLCx3Uz2xJx3U8CaMxZ2xhotV8oAbFGneszaK3/OFa99pluN2gW+D1mgi/S6xRb/2XzgGSQPJ05JquctEgiR/axR3wN1K3XbXy0jTsezvqX0nmw7+jU2QixkQGiy+7s5amKQmzOpWufEV9Js82V2HXhY+goooAV64MKTKt6t4sijlNBxXUPhQe6TyfwMw2PlOimTPXyunNYL6UhItpeR5ZuQKce5LQRApRE30053Z93wurBBYP2RBVwqBXxWtK2x6U7Dt8Ar+0KMjlYwFpKWEIpRcWay1lIuccUkRblkJqb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8284.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUhTQlllZnRMT29jU2FVTkJTUnJIZEYxK2lOTXRxcU5pUWgxekMyR2VmOXZ1?=
 =?utf-8?B?a3krNmV6b3RkcjNMNVBMK0hETkFRaXUrVC9DOGVrTjBFL2tvOU5VVklqY2tq?=
 =?utf-8?B?S3dzMUlGMVEwemJ3WG10aGQ0aWRmQmsyWlVjUnRQbWJ2RlNLMzFWMElxaWRQ?=
 =?utf-8?B?b2lVTGJoekJRUlplL1dZaVhIdlhzaDNvVHhQdUQ2aDEzWDFTbDlFcmNKMlUz?=
 =?utf-8?B?Vk9JWkhvcy9jd1VIb3kwcEEwOGVvYytiUmNYUzB2MEZRVFMrVXhMNzNmc1VH?=
 =?utf-8?B?TWVYbmM0TStwa0llejlUK2ZmRmpaeFNNZzdwdi90cythK0FoUDg1SkdpM3pr?=
 =?utf-8?B?TUxNTEZTRld0K2NaU3F4ZEZkanprK3l3SUZwcHc2RE5kalozdGNnNzZoakE2?=
 =?utf-8?B?b3A5c2NLYkdIUGJrMmtQUjJOL0FVaVF2NlNKb2ZkRUpncldRSHFDbXh0YzJw?=
 =?utf-8?B?aEZodGpzT3AzaWEySGJnZjlrYWl5ZGhDYVV3VDVNSXY1aDdkbHhYL2ZnTFhI?=
 =?utf-8?B?V0I4U0lQUi8zTUJRSXljWGsxTGt6M3A1aDRaU1FkU2dQdTRQOHdsNmlmRWxh?=
 =?utf-8?B?NGJqb2xoSnl4VkFSbFZiaE4ycTBwUDhFNmVNL2JtbEMvOHlhbmNMcVpxOHds?=
 =?utf-8?B?bzBvYnJjRC9waE53SHhhZzlBS1IwbDRYM1BEaWc2NEVpbDlYVldlWVpVMGpF?=
 =?utf-8?B?SXZPckhtWHQ3eFlkRGwxallsTjFPdytWYU5uYTY0cmdkSTgvWmRPclpLVCtT?=
 =?utf-8?B?WkVLenVmREEvQStOT0tmbDNvN1hEbW1pK0YvdTJsSnNlYTRVUEtkdnFpWU9G?=
 =?utf-8?B?c1pESjVnWDBLdEdUL1EySUZUQktPcStwQ3g0dTJ4aHN1MTc2c1NNbE03bjB1?=
 =?utf-8?B?UjVueXpPczRZVG9TQ0s2TjdMT0MyMHpBbWlYMkdGS21qTFNCMGYvcVU0NDJ5?=
 =?utf-8?B?cDE3RFVGem5WaFBIbW9YVFBvVTdyNXIzUkNqZXN6QW5QdGd4UWp6OVFnZmE1?=
 =?utf-8?B?MzBTcVB4aHBsWjc2dHRUSEkzYlUxenNRWXVxVzRuRGZWUnFDU1VCTWE4dWFr?=
 =?utf-8?B?V21QTlBkZ3FaaVdGaGNkNmUyTDkwTEhWb053VHgzR0U5OFNBeFRCQkhHK0I0?=
 =?utf-8?B?UUxZaGYrdHVCcFpZZHNvcmROTGxrL2tkcmdCOGhIUEhlQ2dWSDVCbGZadldz?=
 =?utf-8?B?K0JocWNzVU8zSC9ENzl3aWlCZHZxSHdMYmpYdXlwVkRhR21penFXcmxGV0NK?=
 =?utf-8?B?cmk5cEhsRzZtWFlWNm5VRjM3Q2FMajh2UUNsVjB5dWxSUVhGMTRLMS8xN2V3?=
 =?utf-8?B?VkwwUkhjUUlqQWN2SEVjSm1FQjc3SkMxQm9jdXZVd0RHaGsvZjg0S21oVmxN?=
 =?utf-8?B?YUFMRDg4cjdFTDBzNnJWTUR5SmJoKy9YeU04TUlrZFRLaS90cUxBUEZFbit2?=
 =?utf-8?B?em5YZ3NqVUdKbFNUZGtNN0NkUG5JUHRkTWlpUFNxajJSTUZSWVRmdUp6SElO?=
 =?utf-8?B?Ri9UQ241SEJ6ZTAxeElGUUErZ215SHhrUjM1Qmc3N3ZYMkk3bDJadTkrcG81?=
 =?utf-8?B?NG1BdVd2aHIwSGFoU1FQajUyOExaNU1PemhsQ2xlekJTVExHK1NRUWJOQzNT?=
 =?utf-8?B?cXo5c2JPMHd2ZnM3NERTcEllQ1plOXg3ZDZFN0E2RmZFTDFaYjlJV0d0SzVV?=
 =?utf-8?B?MXFISkFlY29IekU0a3BoaWxvVEE4QUs0OWQ2TyswQno5cHdTd0NFaTJCUEl0?=
 =?utf-8?B?Y3hxU0RDSzdkbVdRdW02dndyVXRZcklQZy9YOUtZM2hwa1Z6dkZiWDZvbmZN?=
 =?utf-8?B?NzQrN29OeUZLQllCaVEvYXB4YXJFSnNrZVd5ZHl2SUlzOHNiV1RreE9HYWo5?=
 =?utf-8?B?YU5lMm1vNFlqeFd0ZkpwWHRTVUZOcXQ4NStad2FNY1NXQnA5cTRxQUtNY3ky?=
 =?utf-8?B?Qzd0K2NuczNFN0hXS0ZacWpYL2lMNXNUcFNkWEJNVTdpTFFLb0NEWVJMYzdi?=
 =?utf-8?B?N0RVa2xSemVneEUwQkZyNkRmZ21XWEZTREVUTHpkRkoyUERuZnRtUm96d1cv?=
 =?utf-8?B?dTdIN2J5UTY1UkJNZlNDa1RUYmtOWW0raFZQZFBOUkJ6TjdGYklaNkowSEIr?=
 =?utf-8?B?ZHlMd01TTkVYdGk3ZDhFQ2FyTDNkSEJlQkRGU2xPbEoxRnU5dm5lZGsxTWRz?=
 =?utf-8?B?MVZHUGZPNmVRdlhDeEh6Y0VzcjdYYTIrbnQxRVUvTW43VVliYTJHU0lMd0Zl?=
 =?utf-8?B?YjBka2ZPdVZKS284MG1qajlTZERMbkFjZFhIQnFoYVBxOXVMU1Z6MzNsUnAz?=
 =?utf-8?B?Q1oyL0FBM2xYWmd1YVVkR3M1NnZxSVhtL1lqaXJxbGFBNm1DNTZPZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e721b70-b94f-49bf-8c2c-08defe74a5bb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 04:36:48.5366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjZJcR0f2+W7eOZ1s+Tu/ohHznL0IcdxpThNlPQv78shprDUxQzMtMZztI33G09GIRUk02u7Lb2KSkS1B/VMTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9538



On 18-08-2026 11:05, Stephen Horvath wrote:
> It seems the xhci-pci-prom21 module only has IDs for the 800 series
> chipsets. However, this also seems to work for my X670 board, so I have
> added its DID (`0x43f7`) to the list.
> 
> `1022:43f7` also seems to be the only DID for the 600 series, on the PCI
> ID database (https://pci-ids.ucw.cz/read/PC/1022/43f7).
> 
> Cc: Jihong Min <hurryman2212@gmail.com>
> Signed-off-by: Stephen Horvath <s.horvath@outlook.com.au>

Looks good to me. But you may add 0x43FA/0x43F9 they belong X620/X665 models respectively.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks,
Shyam

> ---
>  drivers/usb/host/xhci-pci-prom21.c | 1 +
>  drivers/usb/host/xhci-pci.c        | 1 +
>  drivers/usb/host/xhci-pci.h        | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci-prom21.c b/drivers/usb/host/xhci-pci-prom21.c
> index 6486f4a09345..b41faa87f4eb 100644
> --- a/drivers/usb/host/xhci-pci-prom21.c
> +++ b/drivers/usb/host/xhci-pci-prom21.c
> @@ -111,6 +111,7 @@ static void prom21_xhci_remove(struct pci_dev *dev)
>  }
>  
>  static const struct pci_device_id pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43F7) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD) },
>  	{ /* end: all zeroes */ }
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index a8889081ae82..de132025d8a6 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -701,6 +701,7 @@ static const struct pci_device_id pci_ids_renesas[] = {
>  
>  /* handled by xhci-pci-prom21 if enabled */
>  static const struct pci_device_id pci_ids_prom21[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43F7) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD) },
>  	{ /* end: all zeroes */ }
> diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
> index 11f435f94322..26a9edfcaceb 100644
> --- a/drivers/usb/host/xhci-pci.h
> +++ b/drivers/usb/host/xhci-pci.h
> @@ -4,6 +4,7 @@
>  #ifndef XHCI_PCI_H
>  #define XHCI_PCI_H
>  
> +#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43F7	0x43f7
>  #define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC	0x43fc
>  #define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD	0x43fd
>  
> 
> ---
> base-commit: bdab5605259ba5d6ff927c1a85cc83eb3ecfdacc
> change-id: 20260818-xhci-pci-prom21-ceb025d484a8
> 
> Best regards,
> --  
> Stephen Horvath <s.horvath@outlook.com.au>
> 

