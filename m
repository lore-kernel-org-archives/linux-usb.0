Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EF348C41A
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679229; cv=fail; b=FrqXyKvpbexJ8FFBVkq675PDViRauERyNp5ztXV+QTrj8uMik7ShuQpQyXOlzitNyVr5cyO4l7znR4XZOXt34THx2isCNCeqFXF8z2TxBCtZe2qAPn4oA5zWolDKDLrRh3+bcmzENM/2BQtmGFA0V8egs0YBnNguz/mbxIOzpOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679229; c=relaxed/simple;
	bh=hFWRW15vWCs6kr/EzwQn6e1kQ4DCXMEYv0UNSs/debI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KZSG5g02OPq8GoHxYYPiqYBXS1FvO8FsBXrFD8RfsPMNDkQOLORF9fkM23S9ski0KsUmFd46xUfogxyn9i7wRqf+drti+0s4eZV+qSbFe3fSW6bdr1F13Ljqa5/eRWiecIwRb2+CONSPsBeg757ynWtWrMl8ZNdYrAwZilU/+yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdL974ou; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdL974ou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787679225; x=1819215225;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=hFWRW15vWCs6kr/EzwQn6e1kQ4DCXMEYv0UNSs/debI=;
  b=fdL974ou8oblfyUxRcFVGhsMHJuozCF7VQPTqNGQKzp+U6VLKwHpAHKS
   FGOTiYRzXa5fX1KSFMvCE7aL6OXZsaTXGCGUXMfpEiMOi7fVokoYoPDcN
   4zAFvZvi+gYFNRZ3L9pM3qWditLbZxXyi2GnynWrwtoI5t4mdA5o/7dPQ
   deoPImbYYRkSRZ3qbRp45SavkmDWrFi6EqdaR/Y1rhP5wn8VU3xHu25AD
   G+8I7xeSgmVqdtzzxub504SE0tSEhHJEgeDq3JKUk0HPfMPXkmaoUj/PD
   s9CZ36CK1t4BB5iaP9tFsrlMyHLbRyUUUG1x8ma/BjWCm5ur8oPn77W7U
   Q==;
X-CSE-ConnectionGUID: hC1b4QXdTh2DDaipMPqrYA==
X-CSE-MsgGUID: l7R0poflSN6EONtr1IevHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="75691627"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="75691627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 10:33:43 -0700
X-CSE-ConnectionGUID: BN8hejIcRL2+sKVSngcL9g==
X-CSE-MsgGUID: uuFvyF03TF2mWcPAOBcVdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="290879242"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 10:33:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 10:33:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 10:33:42 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 10:33:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBSroycwJb4etiLnMNvofDd2UuqAR2ZVWF51fV5nBNh5NLZ5aZHucYhRAkTU5jZmuajntiYD0Fcr8JlkSY6PJWNvRKmpmr6mqjckofwNiSlFWG0RqMaBR3gak2da7S9ynxxtoc6QyfgI1zN1TLLQ5afWSip6mrnAsHO6uJ4e4CttRfvO3fovcjWYGNVOa4dJwPiWimRsEc0bT3ouNy/sD+E35G0CePlLQZRnnNwu3HD/6qWesoCWajlPc61ZFxq9fsPnphBKDzNivsyWxVUuTg4WUcEqQEqB3fGGX5i247ypYxKljOz5xlGAQ/lSK9Ye06z4yyHsQUlAPG9lPrSx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dl1j47/NjFOFBrkn1XftJdlOioY03Pyg2p2uhdoiMyU=;
 b=Ee6ZjC4iO21kvH+WmWRbSUvsUbEn5IonzATswDi/s33AjzmMBdloALs02cEHoRv0I8I4MXEo4Moq+uUQL4XAn9JqKDXQ6R7ks9wvoxfeNY04NymasxMl8am2Qx3Id4fZMrGuChCr/bH2Ta8K54KICIdxdohpZg9486JuPZmMPqM+ZX0dinBaqvFNOJeA6VyGJOLOqrrXchYqFMGyWjj3lublfWZ1EO3s9RqZ7+hHLVyiEGjz1IA2nhvDWlMXWMRRZPkc3jIJSFuoPMFRZBhUw2qA5iu9MaTahb4dBicHlG2MpQhmAAodacUGKi0IwQv45wIw5hi81wa9IQel0uchXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by SA1PR11MB8376.namprd11.prod.outlook.com (2603:10b6:806:389::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 17:33:30 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 17:33:30 +0000
Date: Tue, 25 Aug 2026 20:33:25 +0300
From: Imre Deak <imre.deak@intel.com>
To: Dennis Wang <wqingxmu@gmail.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>,
	<linux-usb@vger.kernel.org>
Subject: Re: thunderbolt: DP tunnel activation not retried when display NAKs
 while settling after link reset (Apple Studio Display XDR 2026 on Panther
 Lake)
Message-ID: <ao3R5VPIL24cGuCO@ideak-desk.lan>
Reply-To: <imre.deak@intel.com>
References: <CAOX-mXs0ZjpiLtviUDqHLrzWh2Dyz+Y9gZUcenW_yV4iQUa=7g@mail.gmail.com>
 <20260824100750.GC893316@black.igk.intel.com>
 <CAOX-mXtLXcdzGjSy12EsZ5H=AcgzROA0x38r9+Fv7ygH3iq5sQ@mail.gmail.com>
 <ao1hwzy7ksGU2PMa@ideak-desk.lan>
 <CAOX-mXsStmbAbsgfxA8wySPNU=9P2Kxh=Y+EYO=e9s60OKSsMw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOX-mXsStmbAbsgfxA8wySPNU=9P2Kxh=Y+EYO=e9s60OKSsMw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVZP280CA0013.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:272::17) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|SA1PR11MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d05ff6-a5bf-4a78-004c-08df02cefaaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|5023799004|10067099003|4143699003|6133799003|56012099006|18002099003|22082099003|18092099006;
X-Microsoft-Antispam-Message-Info: +u8Eko+Cs6dQIf97zp3cSqR2c8b4ooDaabpbTvgmpUK06Qx9oDx6evNtu3CIRX0VYWeZ6Sa44+AlTOvrhgbWJvTmLBQya/KE9rYn+sFJJl5N5pmV7p4Lb/QFjSPXLPxXW9YWOSUpMFw70RyJDKJhzatZ3WNNd0OVqOcqpxKayxcmvh8OuQYvxMkTjH0fyZzOle+tdaNxe+ztV6c5LzdMTKWcfylBs1OTc0Nk1gerSjSFMKU6CK5eNlAugY1cAcf7CdP/61rOr/xzKBBPTs6ucTfmjxJJocEeKgnmqVcnYflBO6AjGU9ovBUhDGcPE5XEQpj2SUlPfNOm1LERFL6vzghkhD8otmUAYge9fyj/9qKLkSV2EkC4TIuUlScHBDVJG9etsIPGJFBQ137aCJmS7ZrCHNPZH5JThZtbqqY6zbBVgsXqxBztCJCfMhJS6VkbZxcdI9i8WT4VfqIvwSSOacB5NlXyiv7SQuCCnrusYQn+CxnN4fYsgXq1eNSSCwzPJDTMxR39Oq1RhyDRbugSGeGEPF4H0GjhnqV5Y7ZOmiw6Y4H7H8ILXbxoaHmS1sWZ8NcyjDEsiR+BHUPy9k6f8PrCMR3Zkx2/KoYAssYvsketkpv1etPZmo8S7jx0eKFf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9273.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(5023799004)(10067099003)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003)(18092099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEpBalhpbFJFelNKQ0pyRUY1Z0RzY2x1TUx2aDBiOThOalZvRXA4QlZFQWxF?=
 =?utf-8?B?eUZ2bGl2NnI0eTRrcTdVck5GaGxRakVvVlk1SG1hZG9qMUxWa2JjNk9pWlI0?=
 =?utf-8?B?RDhueUZsV1lYN0d5aTRPei90Yi95VFBqajMyU1NSU1UvR0dIYlBLeExSUXVq?=
 =?utf-8?B?ZnlRQUpWNisyaENXZnVJc3VTWEVDRkFSL3BUQlpXNDVxL1ZkdWxpSTdvaXd1?=
 =?utf-8?B?TlQ1cDVoaldlQmw1ZWRUM1BSL21kb3ZUOHd0dzROMnlZd1ZER1VIMnBlSmk3?=
 =?utf-8?B?RGdLSVdJYTlTUkxiamJ0MGRVTUVaK1VESk4zZEd0ZzlBME1WcFNkRDVBMHlG?=
 =?utf-8?B?VllqajlyaEVnNFg1V3R6NnBpRFFWWHFTVE5kK2N0cVdZNWh6Y0FuK3dXMmZF?=
 =?utf-8?B?aUFyOElWaHB0K3ZWRlBDbDZiWXdYa1o5UkU4ZENyMkZwWE9ma3V0V2JoYnBD?=
 =?utf-8?B?S3Exb0E5eUNkSDQxemU2M1JVd0VBQjJuUk5ST2p0V05xemdLMjRKd0M4dmw5?=
 =?utf-8?B?bWNDVUZ6ZzFJc3UyUlYrOFMwT0xBYVZHdTNzTks2OWN0YTlldVlSdENXVFV3?=
 =?utf-8?B?bnoxWjYvSzNNTHFNZmFBWkZMU0gzUzYyem9BVGQva0JEazg2ZWRJeVMrYytj?=
 =?utf-8?B?UEJkSVBmSmRPRUw0Sm4vNGhZa09uV0xrYUxNbW1TdlZ6RHlDRWloU2laSWts?=
 =?utf-8?B?NTgwRjJEb0l0MUVac3Y5U1dnTHhlai9YUnE4NCsrN0tBVXoxK21WRTZzaEVE?=
 =?utf-8?B?RFQvOWE5WWVFRWRLWThmN1p4N1lOcWRCZnc0eGYvSEFiMlZVU1A4NTREdXNl?=
 =?utf-8?B?bXVWTWtDVzc1TU1vaUtLSk9CRkQvZGNMalIzWlpvbFhwRFArelFVNE5NK0N1?=
 =?utf-8?B?ZTFKeUpCWDB4OFRtL3lraVJZL3hTTm4rM1FKMFp1anVmd0IrVWdicENuWTU0?=
 =?utf-8?B?NmptdnV4bjR0Y2tleVNpd1drSWdDT0o2aE5TZ2trb0JrbkxFMlNsZ0JKNnlh?=
 =?utf-8?B?SmF0WmZ4RWJVRDZDR01zK1ZscEVBbTlUMXdHTUZjUk9UZEhjOGdWQWNFOXhS?=
 =?utf-8?B?TVNxT1p4SG43VFJzSkYxdWFKQk5UdmJoTmR4NUU2VjAzbUlDdkoxbmdSOHUr?=
 =?utf-8?B?eGxpTHk0a2JmcmwxUjNmNWxBZUpKUkZMYTI0cTI0SEJpNi9YeWxrU2hpUW93?=
 =?utf-8?B?WjVwWjFRYjFIQzJTZjdGM3M2MGd0T3RsNTlTR0JiaWx0ZWd4L05aV2ZzR08r?=
 =?utf-8?B?SzlLK2xERHlUa2hTMFowUVBXS29OTkJKSENOS3g5OHVMNGFzU0R2Vml0NVJi?=
 =?utf-8?B?a25PKzdQTWxReWQ2NlNLN1VLeG82TUZEVDBscWxaQVBCWnhJRE9RaUFkbWNK?=
 =?utf-8?B?dU9EWE1kVmxGYlprUDg1VkMrdGNZSGRndkNhL0JpZXJuVGY0TmJmWUNxYmlh?=
 =?utf-8?B?M0VBRU9ZYzJ2dC81N1hRY2gwYkgzRWwzQlhSeDlxa3RjeVFHVitZWis0YWp1?=
 =?utf-8?B?SFpUNm5KVm42ZTdZNnowUkdrb1BabkpJUEhvZThRL3hpalNRRzg0c0VvVkZy?=
 =?utf-8?B?Mm9BTG5BYlU2Um9ZTDUzRXlUY1dvd3dWS05yd3pvSXlnOGtGa09PUlA2MVEv?=
 =?utf-8?B?ZERWOGEyN3hOWm1HSXRQTWw2Y3ZzMU8wZ2RSenBieVRueTVwSkp3VTQ4R3B0?=
 =?utf-8?B?WjkwalpaQXRPbUFNV3FEeXljMUZTTFU5b1BHOTZ6WUJ4TlJ2MGo2TjBUdHgr?=
 =?utf-8?B?QUo4U09hSG5QZktnQU1haVcxOTRrWjVabVlvc0FFMENlY1V6VGhIbHFsTWZt?=
 =?utf-8?B?M3FtU3lqOUpnRnFRTFRJL2JqamIxNnZ1OHlZclpUQ2hONXNBeUhkcXZ5bSsz?=
 =?utf-8?B?U2x2c2Z6VTBCTTRVMDRZUjdpZFNFeHRjVzFLdzFMY3U0dW90Ny8vNnRyWmI3?=
 =?utf-8?B?S2kwQWdEUjh4alowcEY1S0xjY2pYbzZBSlFtcXRRd1pZcS9xdVcrcnRtSGhu?=
 =?utf-8?B?cU81ZU9nR2NTK2FWR3ZuWC9XR2p0SkhISTZNZzVaY3lJa1RsbGtqazVTMVlm?=
 =?utf-8?B?WTFvN2prRTE5d3VJb1Bla2JaNjFISVNpeVp2VkZkb2gzNWdGeWlGTXJkdGZV?=
 =?utf-8?B?SHd1TTZFVXIwR0E3aXZxVTVYSUx6bS90aVB1aGVZeEQyQ3pVcWdRK292b2F5?=
 =?utf-8?B?bFFkYzE2aUpuMVVxT0dYM0ZoZEdjUkVtbkkzN2lmNnQyUnNZeXUyaTRudFhy?=
 =?utf-8?B?czVieGZGK1FTc1R1aVNuWEtKRW9MU1cveFU4bjQ0MXFlWGZSL0F4RmNhUjRC?=
 =?utf-8?B?OGp4QzhYOHdoaFVMUTRrTFJ6b1NUYkxONHZEVEhGVDh4QzFsd0RwZz09?=
X-Exchange-RoutingPolicyChecked: HuEyNOtB0O1Hp75J3PNIammoQ7WnQ7oweGru44GU2gz+pAi2p5d9lkMVKUNn5QV3Hwi/6fZKFJ2oDibi0Pc3qb7mK7wKzxirYbqUwj95VZfofYoyu8CovH3ySsTFJYP3JazXhQ3zKkYaT2PDKsUqgXreehj3bt6VVWFqkVEzHwj+0au6SPFqEphEoxgWEzg9A8Ua3tZwScg+IBLtXT0v3O7HDh/Vq5O7HYYPpVcvizWt9iVvt696Im9f9GMpYRbsZruT6Xxw27UPWIwdn0/K+qU61yT12g10NwuEPE3k1h7P3sIXSrStNmz4k9yhcbxY0R2YYpejIbmGSbjVmp2xxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d05ff6-a5bf-4a78-004c-08df02cefaaf
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 17:33:30.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IyEPJkjF2WP+RxREDvN6+mYLWQ1oFGhHHEcf1cdcs9lIM64SmSGanC9nJzSIvvKxFkEgmleSNbrzLSBgU0kbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8376
X-OriginatorOrg: intel.com

On Tue, Aug 25, 2026 at 10:11:53PM +0800, Dennis Wang wrote:
> Hi Imre,
> 
> One clarification first: there is only one physical display - an Apple
> Studio Display XDR, a tiled 2x1 panel with two DP sinks, hence the two
> tunnels/connectors in the logs. The whole panel stays black from
> power-on until I type the LUKS passphrase blind; the compositor modeset
> after unlock is what first lights it. So it is not one display lighting
> up while another stays dark.
> 
> Tested xe.enable_fbc=0 on a cold boot with both sinks active: panel
> still black until the compositor modeset (~83s). In that boot I noticed
> Panel Replay enabled at 4.7s and disabled at 81.6s, bracketing the
> black window exactly, so I also tried xe.enable_panel_replay=0: still
> black (until ~123s that time).
> 
> What both logs show: the fbdev client's tiled two-pipe modeset
> completes without errors - links train at 5.4G x4, both tunnels get
> 17000 Mb/s allocated, transcoders enable (in the fbc=0 boot both pipes
> are up by 4.7s) - yet nothing ever appears on the panel. The first
> modeset that visibly lights it is the compositor's single-stream
> 5120x2880 DSC config after unlock.

Thanks. 

Not sure what could be wrong with the fbdev modeset, no obvious issues
in the logs around that.

The later compositor modeset config is a bit strange: one pipe is
enabled with a 5120x2880 mode and another pipe with a 2560x2880 mode, as
if the tile configuration would be ignored. Could you check what's the
compositor's idea of the monitors and modes and try to set a 2560x2880
mode (after booting with disabling both fbc and panel replay)?

I think it'd be easier to follow up on a ticket, could you please open
one at

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/new?type=Issue

and attach the log after setting the above 2560x2880 mode?

Could you also attach the log there when booting with video=DP-2:d?

> Consistent with that: booting with video=DP-2:d (second sink masked,
> single-stream from the start) is fully clean on every boot, LUKS prompt
> visible at ~4s.
> 
> Both dmesgs attached (timestamps rebuilt from
> _SOURCE_MONOTONIC_TIMESTAMP as before). Happy to test patches or more
> knobs.
> 
> Thanks,
> Dennis
> 
> Imre Deak <imre.deak@intel.com> 于2026年8月25日周二 17:35写道：
> >
> >
> > Hi Dennis,
> >
> > thanks for the logs.
> >
> > Could you confirm that the problem you see is:
> >
> > After boot-up with both displays connected, one of the display is blank
> > by 4.839037, while the other display lights up okay.
> >
> > By 47.768154 both displays light up correctly.
> >
> > I can't see any obvious issues related to tunneling, both tunnels are
> > detected and the BW allocations for them succeed as expected.
> >
> > Could you try if the same sequence without the other issue you mentioned
> > happening (DP tunnel activation failed) the blank screen problem
> > reproduces booting with: xe.enable_fbc=0 ?
> >
> > Thanks,
> > Imre
> >
> > On Tue, Aug 25, 2026 at 09:42:23AM +0800, Dennis Wang wrote:
> > > Hi Mika, Imre,
> > >
> > > Attached: cold boot dmesg with thunderbolt.dyndbg=+p + drm.debug=0x10e
> > > (timestamps rebuilt from _SOURCE_MONOTONIC_TIMESTAMP; root fs is LUKS
> > > so journald re-stamps initramfs kmsg).
> > >
> > > This boot hit the graphics-side flavor - tunnels healthy, screen black
> > > until the LUKS passphrase was typed blind at ~40 s:
> > >
> > >   1.8s   XDR found, Gen3 x2, both DP tunnels allocated, no errors
> > >   3.9s   second sink (0:10 <-> 3:12): repeated "DPRX read timeout"
> > >          (tiled 2x1 panel, two DP sinks)
> > >   3.96s  fastset rejected: crtc_hblank_start expected 3840, found 1920
> > >   11.3s  AUX_TC2 power well disabled - nothing lights the panel again
> > >          until the compositor modeset after unlock (~60 s)
> > >
> > > A control cold boot with video=DP-2:d (masking the second sink) is
> > > fully clean, panel lit at ~4 s, single-stream 5K120 DSC. The original
> > > "DP tunnel activation failed" flavor is intermittent - will send it
> > > with full debug when I catch it.
> > >
> > > Happy to test patches on this hardware.
> > >
> > > Thanks,
> > > Dennis Wang
> >
> >
> 
> 
> -- 
> Best Regards
> Dennis.Wang
> Zoom



