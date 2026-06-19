Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D04527467F;
	Fri, 19 Jun 2026 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781880681; cv=fail; b=Atje/UrKiGb9zGT09lblAnX9lkffP9aQoyNa4Tjus7jvAkvoLbBczNo9X0eFCuSPJ2TSDC95XrFPsDhep4hXD3ibukMO0+804qc/rwMBY1apu5Up215BdFxazdJvtI+1pDh4PoQiFg/d+aJItgbE8AepgpbiTjd2OelghFuT4U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781880681; c=relaxed/simple;
	bh=WvHnleNWDDPZ0d99BMKa3i//Vrgh01ZbCdDDTISBsYw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WfRUIKajPTnZFWKxEIvse7lADLPcWcnMy3j7O4yPhYcKOOSn5qyI0fIyohkMPvb4VT505yGZF3FLxltlo9njymND8fdtPFXcwjn5h78jBPfrwe9Ss6hn7Pae8RkaNfwvGBnaZ1kLCp5U7hYkssR1vsV9hv5l69mpIUWjPpOgwyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkvlv5Cf; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkvlv5Cf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781880680; x=1813416680;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WvHnleNWDDPZ0d99BMKa3i//Vrgh01ZbCdDDTISBsYw=;
  b=bkvlv5CfEwATib/DB5m/DgjwnJ6/EGQWDwBMYU3ioOZMUz3gcfXZ1qvX
   fhtf1oeApCPsUkbDgDY0CvfToO8ahLW8n13D+4Y/4Ocuuap77iD0F45uo
   5CxSFJK6ZvdgOR4VDKMJtYAmVQAYkU59fSF4NGjgg1QgnQEYLjNhIikyN
   9kEvayUQ7JSZxqJv+hbTiWH0q23exI1nyElj+nAJEE+YIJgHi9P4Ew6l6
   vB3L81eAsIqCZIM+rl20Ij5p2yww0uJu5C/qs7CS4pgkLfNZTRE1znHt9
   Ficy60YrsNy1IhDR+XAqNeX1G8dejSIjm1g1msizssreWzrEF0mkBuCcn
   A==;
X-CSE-ConnectionGUID: yhyYtF8NQeK5aIBAb86LWw==
X-CSE-MsgGUID: Pvcc2MUzRD6cYMtN6jG37A==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="93325643"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="93325643"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 07:51:19 -0700
X-CSE-ConnectionGUID: hHXQhqcdSiy1Bg5krxdXLw==
X-CSE-MsgGUID: Q34UnRjOS/aOIMLEmukwIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; 
   d="scan'208";a="246302708"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 07:51:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 07:51:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 07:51:17 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.24) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 07:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEuyk59/LVDxKq8NGnvTpgy12cow/ZeAZ/T6xLbBLREr0oY9rnqunwrOudE+XUI8T4WrIjjcMJTIjn3ouHy/BPFlF9ey7V+KZyCF0vXyUZmopcr+2lCHipy2G+Gcdn4/o71NKOCll2RGy6guIwDYjM4a51v4wxpR3gMpGOEhsZEFMIbKrjBIEgbNuSsERqRFFQBMgfMpxirEq+kwFy0EVCc6rbyG3ZTSe9MS27pzJiMllLw70do5NAHp4lkETXDKZnIzOzzyOgfLaVLWP1vvk4gkuAILp+8SQO0NtV+TYFRqBTpIeWU93vozEH/4b2qjsh3Pb7JifyZsCoGMxCqk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq/7Tp9OF6dZcxxPH7geu0YyL+zhCswgCuk6Kw1GVgQ=;
 b=cLDbA9OJzn94zB+hxrDKjEv+cAPB6oGjLMohgQo4a4xL0Q98e5PBxoWIGsngVe+9PrMJjCM1AksiG7VuDHr84sQJ9Hnf06OnanraRYSchGxPsVy6e6v7bfg7I/7Ug0Tnn/DR4Fpzx0T04WvTiB40fgvjpSYsNngEGkubyxEic7DBywPqrdb3QngGJFteI4Tz6zx8OmmW5sxWJ7xpbdifquu2OuMCNhSPloKipwZNlqqDn5YNHffZYhSBW9a13LDT6rZU6osdsFPQEODiyQigQXeyQqiqoaIvHI+BnAHzw8xh97RJuxmhd9/2qUqkmG5BtcpkTv6gQ3auN9v8dZTiGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Fri, 19 Jun
 2026 14:51:13 +0000
Received: from MW4PR11MB6885.namprd11.prod.outlook.com
 ([fe80::d102:cd89:8e82:ba0b]) by MW4PR11MB6885.namprd11.prod.outlook.com
 ([fe80::d102:cd89:8e82:ba0b%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 14:51:13 +0000
From: "M, Madhu" <madhu.m@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"Katiyar, Pooja" <pooja.katiyar@intel.com>, "akuchynski@chromium.org"
	<akuchynski@chromium.org>, "jthies@google.com" <jthies@google.com>,
	"johan@kernel.org" <johan@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] usb: typec: ucsi: Pass full DP config payload in
 SET_NEW_CAM for DP alt mode
Thread-Topic: [PATCH v1] usb: typec: ucsi: Pass full DP config payload in
 SET_NEW_CAM for DP alt mode
Thread-Index: AQHc//igZZgVvCqJYkSty8DMKaK9gLZF8wgAgAACyrA=
Date: Fri, 19 Jun 2026 14:51:12 +0000
Message-ID: <MW4PR11MB6885E01E818827E2DB5F78F8F9E22@MW4PR11MB6885.namprd11.prod.outlook.com>
References: <20260619150329.3524162-1-madhu.m@intel.com>
 <2026061938-daylong-diffusion-c491@gregkh>
In-Reply-To: <2026061938-daylong-diffusion-c491@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6885:EE_|DM4PR11MB7303:EE_
x-ms-office365-filtering-correlation-id: 3ae27ebb-c1ef-4768-b8eb-08dece123523
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|3023799007|22082099003|18002099003|11063799006|6133799003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: F5xkUpfJwXqPlIvRHMcGOAGauBsdFRSAOsmVGaoTRyQCeOqcs0mdOUL5RFo60sfnZD/7cwAKNADibnsVCuoNEJc6oTVLQJL6mLDstdmPb/0hz6Vl0Go2Q8IF8wOmPIKn06uL0iEnqcjpORoQJMlctnog0ktgrL4GMfatomsrjt/QQ25BM1kp60ZRzPMthKo9CvtRMgFrRi1gZvN/cF7eRuYLmEYVJWepBLTk9+Iq4NwxPAQNiWIyHyqaHhyfdasI0bQO7necHfaKhMR+Hnk5g+GZpZz7juIUAD9Mu+WGNceoFrz1Rr7F65chCa2btqpG3DhEOMG5VfU2BAOPKSM0DE7Cn66XJ4iPzbhMwO1MwvNTwlN5qC0VwQFs1CL42Zb8PypT3vvj3RSIkvl8oOi8ljdMl2ShyF+wy2LGeMxzzlD6xjmw6iszxp9LgolkLVDEhtR0aaeFgpe4M5yw5NTQ00GY1AikndDTIlcKrolZ9pT4OkZv1Og8XK87ooDYhXnJJOd6teODdeIuIv30HJmnvzmtG4l+B/A+/p01DNRLDbghAyYgNYhfZs9h691LC8uGfjoUQxg6xnuAOkgDKY9QIwd8zfQO7vQbDp3/qyMtFexEVN15f8kU2GIF9v7bvPhbjHGAvQfavezpQyGSjCIKJeX05U2i1cUBU0z98PM+4f6OnuJZ1P6zQ4XeXdRxti4wqOxLW2HbwhbI4kA577z0TuKkXlV31RmP77MxB1Smais=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB6885.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(3023799007)(22082099003)(18002099003)(11063799006)(6133799003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Yoq6CVYvX8jGL0LkAeUuuz3DCcK+J0Uu2gtuDe8sjIfgCgP412Z8mMMP4mI1?=
 =?us-ascii?Q?stgfFy+c4CuBqWuJiLJ3FrUXQ1yMz6QiyJyfwXjLC/7cWQVMymXkdoQauwDu?=
 =?us-ascii?Q?AM0V9gO1QYZJZJTUFNo0x7jBozZFAkcNnhqRvRQAe9yoauvEVZ1mPSdRFUFF?=
 =?us-ascii?Q?iXAPQAPtmS2hY59Q8hZ96xRD/lZ1a98HdYSPlfVLfOrVo2Yisv9p3Pv7QYlQ?=
 =?us-ascii?Q?DW4cVHhTSP5SOKs7RG2/feIufNrYKBiwq/6Rum+LH3MDTPVfNSJlf6cK9fXW?=
 =?us-ascii?Q?CvVJLEeMUVf56zdSrFyWoLtkKj7302eMiVsDdYNXnIHwHmDnJIYN9ZQ5GACN?=
 =?us-ascii?Q?HbtQ4Fgnt/VgESI0Wj6IezA0O1b88ndy/pC187Kbe+bqo0Qopq10ajeTrs1w?=
 =?us-ascii?Q?wp5lOa9ukDN8JANLlT6hf7hLNT1PbPR2vq8yllVq+7OzdFT9sXx4AjTdjyMM?=
 =?us-ascii?Q?dGAvJ9y7zxw3pzkYVpEtOFRcpjUeCZP9x0d1DaQCzWHTgXzCzNq2EWpCXZwk?=
 =?us-ascii?Q?5ZQEPGhvq4X7pRTJ5EA/CnGXqiuaazokuN6OZIonMnVlFG82fuizCYCbQHoF?=
 =?us-ascii?Q?QV/fPz31Pwz5rj38fZhbfFRQ8tniPvqMxkmjAZJvV8IlWKIVoNwZhHWxy6tj?=
 =?us-ascii?Q?tE/bz8RcsGdGU5bwU3fP3I5SKLl4Thmv74tX3JD0ey4RhF2Kmk2a/Cv4fUfC?=
 =?us-ascii?Q?VmjpYd1k+SpcYzcYSbO5Ow8Ocy6KsncSPGfDOCTDQ26kfXs4FOW0QCXE9OkK?=
 =?us-ascii?Q?CeHcPrsf/nfQ//rwNcrIOYwOG3H0HUC1tcmb1mMZiR0sCBW7lNVY+Qf0Uzqm?=
 =?us-ascii?Q?mgujanXiMLc0yJLfPahukNBX6ihM9bhYQTAbzW09sopJlXDRw4615SHUUoJM?=
 =?us-ascii?Q?Y4LlO0yy+U+tUsgk50GTxd16M8w0iwwBkvqZQRNrcwXnre7TTi4GgO5GrSOA?=
 =?us-ascii?Q?+JM0XnqA1DWCAcw+airvDUlxU5iuTD+ApUf0fq5nv3wzb8HiiepWdz1TGhbc?=
 =?us-ascii?Q?5/r7pYhXfyJNXHw1QqwsD4qxs5vOzHPBU9wfgtwYi66lvALfzPwF+sHqMYG+?=
 =?us-ascii?Q?2wflphq9A6fQ86srJfj1hvUApl1WRBJjL94liCHO8zEcuK+1zH1dG+cKXBjA?=
 =?us-ascii?Q?0GRi4AvxxP3IYchsPe/IzPZAs4kxMxPvBDLI+2wcwJVyDgoo3UNhTI1phSd/?=
 =?us-ascii?Q?mcHLp4IkNmK2BtLjyGchbX/zDNlPp1koVVJ9EY95Cml4V/icSa+hRzvXMlCx?=
 =?us-ascii?Q?/2yKntDEPkiQ+Joq2peLmNFOjU2DZY0FyqvdpnygaKFkx5t5W44MhHLIHI0W?=
 =?us-ascii?Q?y2etbvXl8UTb61YEh/R8RCQrsmKhJpb3VSKj7eNPeG9BOn0kUVGkvKZyljE9?=
 =?us-ascii?Q?GBgqwKevqJHBDEtzPnYfFL955Oqd50/nDnFHO/q+mrvSQY2yxM9kqF4cTpFe?=
 =?us-ascii?Q?R7r1BSeMxJjC7iY7g0Mgl1uAr8BDWSc8rBaPQg8dYIdazRQw0c/XV+o457ht?=
 =?us-ascii?Q?HG62RvDYYN2ufMslZrtb3aukedlXw0GiSUGVnmbIDQrkbzQkT2pFMK84rO2J?=
 =?us-ascii?Q?gmjE+RzKAYYR4mMA1v5It6CF0QsbAir6pfXkwk4118iMTV2WQqWqCYbSva0x?=
 =?us-ascii?Q?w0UrP0RCq2QBDEKg6yx7biY74OCUKkXSduC/8vF+iMTkfFTeZEDAaEEmORAI?=
 =?us-ascii?Q?UyP4g0OFCF7fx86Dvf/UOSSwtSBlLmWH8GuLAwjz6GNVFVee?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CSPPmXG2BafoZGXv3RgSlp1yPBHZz2PTTFRj5XhQQq8rwafAk3m2EQgZmOn368WkNmCIF6cmmAYCvvcm+FGdHH4I7yRMo53IqPB7zUcxyrfT/imPich5I+1Z9E+tOKhj/sIR+u/yDMjZXZ6pAkqBTbcESHRTVBMrh51i79jU2JoQRz0KC+YR616T00UVxRPIqHE62IapQ5iKGQyAZ8i7bXzsAiBDA0dvxBtjVmz/1QoaelWW66rBImfkCMUibfAWWqzNUaT/2hdNIaD6lDoUATngMrC4/41UWvphracYadkJ1lDR4gNmFii4g1EStlovwz4TAPKUZ3iJP1iHNzZ7rQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6885.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae27ebb-c1ef-4768-b8eb-08dece123523
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 14:51:12.8827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vAk0DsEsZ9vC6HSsia9bVBl+a4KhJpOg8+MGm1Rz8h1p69hZ16UGEsbMSRRFxZmpnRn64iWfJLpAWsNeplgirg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-OriginatorOrg: intel.com

You're right, it should. The bug was introduced in af8622f6a585, which has
been around since v5.2, so I'll add:

Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode")
Cc: stable@vger.kernel.org

I'll send a v2 with these tags added.

Thanks,
Madhu M

-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>=20
Sent: 19 June 2026 20:10
To: M, Madhu <madhu.m@intel.com>
Cc: heikki.krogerus@linux.intel.com; Katiyar, Pooja <pooja.katiyar@intel.co=
m>; akuchynski@chromium.org; jthies@google.com; johan@kernel.org; linux-usb=
@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: ucsi: Pass full DP config payload in SE=
T_NEW_CAM for DP alt mode

On Fri, Jun 19, 2026 at 08:33:29PM +0530, madhu.m@intel.com wrote:
> From: Madhu M <madhu.m@intel.com>
>=20
> In the UCSI Specification Revision 3.1 RC1, bits 32-63 of the=20
> SET_NEW_CAM command hold the 32-bit Alternate Mode Specific (AMSpecific) =
field.
>=20
> For DisplayPort Alternate Mode, this field must contain the full=20
> 32-bit DisplayPort configuration VDO payload that the OPM wants the=20
> connector to operate in, rather than just the pin assignment value.
> This AMSpecific value follows the DisplayPort Configurations defined=20
> in the DisplayPort Alt Mode on USB Type-C Specification v2.1a, Table=20
> 5-13: SOP DisplayPort Configurations.
>=20
> Signed-off-by: Madhu M <madhu.m@intel.com>
> Reviewed-by: Jameson Thies <jthies@google.com>
> Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/displayport.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/displayport.c=20
> b/drivers/usb/typec/ucsi/displayport.c
> index 67a0991a7b76..2e3d7c734d9f 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -185,13 +185,12 @@ static int ucsi_displayport_status_update(struct=20
> ucsi_dp *dp)
> =20
>  static int ucsi_displayport_configure(struct ucsi_dp *dp)  {
> -	u32 pins =3D DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
>  	u64 command;
> =20
>  	if (!dp->override)
>  		return 0;
> =20
> -	command =3D UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset, pins);
> +	command =3D UCSI_CMD_SET_NEW_CAM(dp->con->num, 1, dp->offset,=20
> +dp->data.conf);
> =20
>  	return ucsi_send_command(dp->con->ucsi, command, NULL, 0);  }
> --
> 2.34.1
>=20
>=20

SHouldn't this have a Fixes: and cc: stable tag?

thanks,

greg k-h

