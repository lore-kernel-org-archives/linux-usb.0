Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A8F39A05C;
	Sat, 20 Jun 2026 15:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781970824; cv=fail; b=fZMiacEvgVMlivnGmRAISTCb6N4WQAZfrT3SLBmvdFVXuOyNHW68acOwHpf0jKcfakBYzqIBXXK1bRyCRn2523uCpOBnvQEYccLrf4woPKxCIaP7esfALQIceQNi9ZBs6pptNjNxAlHnzie59Ew+z69QWtrIC2FG9E7RAlOSgM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781970824; c=relaxed/simple;
	bh=89oUpjEBEpMLPyNRTJ1+ANpl+4MxYWBoq/yvXsXliWo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PWB+SH6cxCB/Uu6ceL5JEZdtjaEkiT5uhaQCKY8dYA9a1mAPVLOoudM7BC050d8Y9C8wxON1NBL9sSjeRCK3DSx1H+jGCo8Ten6U14IPWjoa+ioXuCLpwAxiFGugOtRLSE3v/Vj22yd3mU1XDPXDFkC+o5VNRgOVPbceg4Oh3EM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HBw9ybnC; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBw9ybnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781970822; x=1813506822;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=89oUpjEBEpMLPyNRTJ1+ANpl+4MxYWBoq/yvXsXliWo=;
  b=HBw9ybnCbaQiq2Qdl4xe536wOFLDgjZJ/kkEdnEzV8d2SvI5hinUovOi
   /xmHIKSbHaIaQjYirKfLk8erYkesbfoTkG4y3iwonqqZtZsYcLoUtMEQM
   T1XIeHMUSI2KqVXXDK5xd/hYAyS2Fc2GOJrlD1tfw3EdNCP6j0EZDCUru
   ZKIQ5dJhN9kJHOB9foewbsYKStwbpLsZqKz3nFqPJC5uC8++u9JWRt0q5
   Ay2o5I0qqJOarRi4qtVyue00XTW5P4XyfFNHNKUsrqODQqevTHoaC0DJv
   DiMug93RaOpVDnSl83R7DnTtHGcY/NLh/FdsYsn7TOozuRPjv07D9R5mZ
   g==;
X-CSE-ConnectionGUID: 9nW2pO28QIeTAUlyH64G6Q==
X-CSE-MsgGUID: jnUWNfXMRsyK38Tein+Zpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="82880643"
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; 
   d="scan'208";a="82880643"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2026 08:53:42 -0700
X-CSE-ConnectionGUID: CHQ5Xi5bTiqvUGwECOyQHQ==
X-CSE-MsgGUID: rkXvLFBrQJeUc2bqNiEYfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; 
   d="scan'208";a="248937206"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2026 08:53:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 08:53:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 20 Jun 2026 08:53:40 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 08:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pboo4FetjyCkzYIL3Rkc3CWS3zMrf/twHGy39Yp7oK5iji3i2lb2dvgJC5CuXI4GoaSso/JMEHhSUx97y5VDIJtSQzqcpBlwi4GhOmjb/zvS2TgyY7etof2H+2anDKCvgmiwXUWLIsYvrFwH1Gvws1CTgAXPgcpmUvVSlNxTws9lqkRlZDyYla1CjTK9VT7ROIFfKCgv8DmMJgWV5DHtx3TV9AaP/zQgORbXoG0l11JA5d1IQqHS9GS10Ier525YMWPL8IVd0GMygx3bcdnb9h/L2zK3nlgMGxEljbYXBpKEIsp6f5awjVKugdvilomXHn8TiXtKcPjSkpnm5G+U2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dykv00WNSJhEoibaf/jsOMeC7wS8PoQCuQqv4P+8Lpk=;
 b=nUPnlsApQ0KBoLB8YD9/mqh5Lva9D4dyjZmrfvUfHiTk10qowTn5tJbMQHZ6r2c3O6anSBwU+ZQntywMT5J9lyy/Nyqf4zjJwc//jkJ1S9zwZvaeEIYvPfpogPWJJzu+MJH/fjiWKf5FduMJZDeMGrhi+Sta4llUoAAhXSx9wcXpSIVbbgTIaGXQ/VFnn8zRGhmwOtaHwQ99ovDFMgyaGfCQgd5lZdeaUK9MlJdA8jHM2ys1o104+UmkVPRhOoNEdpoB72aUrMakgl9ynTO7blI45j+guH4r0ImtZsY5R4dcD/52Xx91ArTkxzD/yzP+IHeeNGLB9NYQu58NtLNe+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18)
 by LV0PR11MB9790.namprd11.prod.outlook.com (2603:10b6:408:385::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 15:53:38 +0000
Received: from MW4PR11MB6885.namprd11.prod.outlook.com
 ([fe80::d102:cd89:8e82:ba0b]) by MW4PR11MB6885.namprd11.prod.outlook.com
 ([fe80::d102:cd89:8e82:ba0b%5]) with mapi id 15.21.0113.015; Sat, 20 Jun 2026
 15:53:37 +0000
From: "M, Madhu" <madhu.m@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"akuchynski@chromium.org" <akuchynski@chromium.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] usb: typec: displayport: Reject DP Alt Mode VDO with
 no pin assignment for its capability
Thread-Topic: [PATCH v2] usb: typec: displayport: Reject DP Alt Mode VDO with
 no pin assignment for its capability
Thread-Index: AQHdAATowEojBYcX7ka7HTcqUqbLHbZG5kwAgACzdxA=
Date: Sat, 20 Jun 2026 15:53:37 +0000
Message-ID: <MW4PR11MB6885A556EA4DF9D0033B7A8CF9E12@MW4PR11MB6885.namprd11.prod.outlook.com>
References: <20260619163109.3529666-1-madhu.m@intel.com>
 <2026062042-criteria-recycling-1d70@gregkh>
In-Reply-To: <2026062042-criteria-recycling-1d70@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB6885:EE_|LV0PR11MB9790:EE_
x-ms-office365-filtering-correlation-id: 6e8c5b88-df83-4c3a-cd64-08decee4175b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|38070700021|22082099003|4143699003|11063799006|56012099006|18002099003;
x-microsoft-antispam-message-info: 6hCqBkVmWBqQ6s6nN341PWBV+v+ou5Xa9A+V70tJosrU9wnhRdbxC/gSlvednbMeIrM00ZwnIouOZXqTKLStQGLWeJsVPxWvvhydh0fLkkuGGTe44qs3WByryGU6ZcGtw74g7QCyKadQNAu/mrZCOL6zDedDkOmrZpArk/aSp8GZ9+8u6YaPMxfhGUDlKRh+72Fk909uWvI1bWU/Y/qmt228Q9J99D4pKvqQZ2IhYhNprDLHvYro+RT08RQ1gFPvCDYqhMjPqJCUWe1n5NObI7ak4KjBcBFD0PfHTs3R0htcT9KEwCFtMjQY7mQY8iGgeqoa9TU09KE5O0g1IF++a3utCejUZJxxZQWGh8S4FcD+diAIZ7vvB8cyb3B+D7l7kheupwcKDzIbEl85uwVz1Sd47ZJ2fI8Zmhzud3Wav8hfBHkx3WYn6SZcuHzE9XaXv0zbpBQXE+4VfnS584VPAWY/nCqknud62vJFpsBRnuhgrtlse+K9dFFFxZOOUCjbGJiNchJDjXLmVU6kIegGOv435p6P3Eoqw4QIL4LeYQQXbUc0rLkorQn9bhyyTTrJuKzegZDI8j3K63GdzrQ/dPSsEOU4dqPS2XABfkf1c86EtX9UUmusaH80+ql6jnbCBtVGhrv/+AJJprZ27v1y3IBkAuBxtpGM0jcuLKaFf+8TRdAX3iMn2lu3emUjm0wEmn+kbGR/4m1DFP8NNFGb0uePL8ERu7WJuIxUxansKto=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB6885.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(38070700021)(22082099003)(4143699003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O1efvF2WT6uGkKIRAu8dXrQUPoow2Hsqs/uhxPhnOandvFWkCfkmCbNdghM6?=
 =?us-ascii?Q?ks6qL4zEoc8mWNWhOL5PSkRldDSttSl7hgNpT0TgBkWJPdg/1Bd6+UcMGlIY?=
 =?us-ascii?Q?DImcideUjV+BgAztywJQEqLQwInrt1O+EKUGFFsz3QMWQ7KY2thR5Aniz/lQ?=
 =?us-ascii?Q?a+V5L8ctp2pY2qM/wk1hFr2FEyL/JTgBAUYzb79a80XJmPbYBXaWxielMQ93?=
 =?us-ascii?Q?Wt/RaFNWRqKSY1cNojgf9HxFdhqDC6PX9M/VpxyelC/Ow7V+RfZhCBaMfjTH?=
 =?us-ascii?Q?+itmcOVebPCjr0oknNx3sonUqmoIJzGmQqAyQa1HlsPzXjEpxrtup2vrGCyQ?=
 =?us-ascii?Q?vIZtes6W1NzRHqysp/4th9gZxjwpeOWvizyT3zJYi4TKbduBMc0ZJ+IwPfbB?=
 =?us-ascii?Q?CckEs0V8c29wQhtk8PuQ7EL6/sLvLCagKQTjZmdEjfjEj9NKxkO+U2jWwCZY?=
 =?us-ascii?Q?Y2HpU/4WwBdbjmsz/3gVk/KkHYym1KKDj7wztnYAZV5D3xyAB1ymT0fwCbJh?=
 =?us-ascii?Q?rOi5Lv2DKdy1Vvc0ZV6p/bmS4EQKY2jIHNOCLWKAkU+J4uHpW6WD5AlU58/w?=
 =?us-ascii?Q?mB1vNjzVOvnArs8AW0qzShm7F+T8BDzfEG0AqT9I6P6yN7NmEKNBTNaB/Etj?=
 =?us-ascii?Q?BfJ6TpPvPDkzskHBc1ZRHp9GxwYf/5Wf4ZhQOmNeCoeK1JOuTPDRMWTYqpii?=
 =?us-ascii?Q?Tcql8semXLwZ3MfADW55dSmMvMPHuLZbyPzmk3tkRBBI688muN9U2sDHvADr?=
 =?us-ascii?Q?7YS2qQ0KTeFP2Gpm4iQWi5YOzt1tZE12UJzwBb+zniiFzb/kxfn3GiOg/UPb?=
 =?us-ascii?Q?kCNd4jGyGKQMfqVa5DEHasxZVC3XkmPrO0fZKC0OK/SKk6mpXmaerrSnYSq2?=
 =?us-ascii?Q?L03laOC6ip+SZkNe5TP7UYM51nEe2iPiatS7AhHAXnFw/hTKSbz0xO38Rzb8?=
 =?us-ascii?Q?KXMay5qkP3iT+BMpPyASkuUxubcehAXYl1uQqE9TkUBqw0LHq2p1vJlqEg/+?=
 =?us-ascii?Q?p9yfjsv9+UKk+l5oiN1Psqy0KPV+WYO9PVRfjK4OJns+ZvZtK8EU4Hv73BJb?=
 =?us-ascii?Q?H6877u+3i5ka7Yy8G4YBvJpr67XiVV8WP25hBTcRsAI1JCsDKcA0L2kqEKNC?=
 =?us-ascii?Q?wB0EUNE31xWcQErrk6onPJ+7g9a428tbYf8Hx5UOeptvCaOAQtuJbOozCI+l?=
 =?us-ascii?Q?28DmHukoJy1XtlfL+diqCOD6lPl8pIBVLMyOIt5UYXsJkmpSTFmWOFSupQX5?=
 =?us-ascii?Q?IMHdO2wFFUo3uSNh2QMJnyXXYXJbLB2y5SJtELTrNGyx1XjzQA2Bt5mRjrmb?=
 =?us-ascii?Q?ZCLPnlbCLgbUQ+BZjeZNyamtj7m0VjbXCyuOE95XrkjuxMU/W/CdOjflf5H8?=
 =?us-ascii?Q?tIDTgO2aC00mlS7mOE7v97K+4ejvJz+g9rSgWtToQnTNjz4cxHK6s9xBZTZn?=
 =?us-ascii?Q?qThsxxJakb3Co4Ivs23P1TJ/RU/MQkHN25WLL3hXsjXR4kW3tMcjFQrexGoI?=
 =?us-ascii?Q?0X9g4ubDYmUFY35FdezXIQPKYxDGVM7AchpMYvVx+qvpKfFHzLMfomYT+Xac?=
 =?us-ascii?Q?kWO8sWoT/hjuTskaSsCBxYwMIsjxZDqtjqMW2RK99Ya6PD9dzcVnsG4njlTZ?=
 =?us-ascii?Q?MUFDmIHmFJtXnKlmz9Yy9skvuKIytGnv1T9F6Gc68kRdhGnbmGFtRDtIehkv?=
 =?us-ascii?Q?FAhYuWnp5p08HLtbLleqQK0k2tYpf4aUD7+MRD8ystaZUs6l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: B9bwGFeJeV1CcXGSkkKRPjdEAUoUL/sdkcO5JCGdnYV+ZkCjS2Ug7R2vwzH1o6YXIT4WVVLdPAVXGk+zb8OkvxSK9T8QJNdKbK/u+KM54rVyPVP4H3YykSJ+K1eJX99/4gqoIsD/0WqrKunQAjvwArGFq5og4Q0dk7MtIIy7+PfWZdDaiWNXuHAh9vismr9FO3wLzpTiqokWEvhEmFnEjHJ8deW4JK6aqBY7+iZylzejsld9y/bSLLHTCY3zDp7+sBocRZeQnw7DKSABthWfj1Hr2hr57ufv9l9+/gVDc688nhSCNdExs0xY4SlB1QB1xSQ87xWcCeByGOJytVPupw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6885.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8c5b88-df83-4c3a-cd64-08decee4175b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2026 15:53:37.2665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WWSjnBIrndYuiaRe4HHIPAdc0VhsrF8oayPJGzIHJzrgyyAGol6ELWvhl9v4DMpJV9wTsnIyDDxOSfoR+1SzMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9790
X-OriginatorOrg: intel.com

Hi Greg,

Thanks for catching this. You're right that the changelog below the ---
line was missing.

For context: v1 was an internal review (with Heikki) and was never posted
to the list, so this v2 is effectively the first public submission - that's
why there was no prior version on lore to diff against.

I'll resend as v3 with a proper "Changes" section below the --- line
(per Documentation/process/submitting-patches.rst, "The canonical patch
format") summarizing what changed since the internal v1.

Sorry for the noise.

Thanks,
Madhu M

-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>=20
Sent: 20 June 2026 10:41
To: M, Madhu <madhu.m@intel.com>
Cc: heikki.krogerus@linux.intel.com; akuchynski@chromium.org; linux-usb@vge=
r.kernel.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: displayport: Reject DP Alt Mode VDO wit=
h no pin assignment for its capability

On Fri, Jun 19, 2026 at 10:01:09PM +0530, madhu.m@intel.com wrote:
> From: Madhu M <madhu.m@intel.com>
>=20
> Some docks/Type-C dongles expose a malformed DP Capabilities VDO: they=20
> claim a DFP_D (source) or UFP_D (sink) capability but leave the=20
> corresponding pin assignment field empty. Such a device can never have=20
> Alt Mode configured. Currently the driver still proceeds, which is=20
> misleading and offers no diagnostic.
>=20
> Per VESA DPAM v2.1a Section 5.4.1 (Table 5-6):
> Case 1 (receptacle): A DP Source device receptacle (DFP_D) declares=20
> its lane routing in the DP Source Pin field (Bits 15:8); a DP Sink=20
> device receptacle (UFP_D) declares its lanes in the DP Sink Pin field=20
> (Bits 23:16).
> Case 2 (direct-attach plug): A DP Sink device plug (UFP_D) declares=20
> its lane routing in the DP Source Pin field (Bits 15:8), and a DP=20
> Source device plug (DFP_D) declares its lanes in the DP Sink Pin field=20
> (Bits 23:16).
> In either case the field holds the supported pin assignment values=20
> (e.g. C/D/E); 00000000b means no pin assignment is supported for that=20
> capability.
>=20
> Reject such a DP Alt Mode VDO in dp_altmode_probe(): if the claimed=20
> capability has no matching pin assignments, fail probe with -ENODEV,=20
> releasing the SOP' plug reference on the error path.
>=20
> Signed-off-by: Madhu M <madhu.m@intel.com>
> Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/usb/typec/altmodes/displayport.c=20
> b/drivers/usb/typec/altmodes/displayport.c
> index 263a89c5f324..2a553cfcf61d 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -764,6 +764,7 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  	struct typec_altmode *plug =3D typec_altmode_get_plug(alt, TYPEC_PLUG_S=
OP_P);
>  	struct fwnode_handle *fwnode;
>  	struct dp_altmode *dp;
> +	u32 cap =3D DP_CAP_CAPABILITY(alt->vdo);
> =20
>  	/* Port can only be DFP_U. */
>  	if (typec_altmode_get_data_role(alt) !=3D TYPEC_HOST) @@ -778,6=20
> +779,18 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  		return -ENODEV;
>  	}
> =20
> +	/*
> +	 * Make sure the DisplayPort VDO is valid (VESA DPAM v2.1a, Section
> +	 * 5.4.1, Table 5-6, DP Capabilities VDO). A device exposing DP on a
> +	 * USB-C receptacle must advertise at least one pin assignment for the
> +	 * capability it claims, otherwise Alt Mode can never be configured.
> +	 */
> +	if ((cap =3D=3D DP_CAP_DFP_D && !DP_CAP_PIN_ASSIGN_DFP_D(alt->vdo)) ||
> +	    (cap =3D=3D DP_CAP_UFP_D && !DP_CAP_PIN_ASSIGN_UFP_D(alt->vdo))) {
> +		typec_altmode_put_plug(plug);
> +		return -ENODEV;
> +	}
> +
>  	dp =3D devm_kzalloc(&alt->dev, sizeof(*dp), GFP_KERNEL);
>  	if (!dp) {
>  		typec_altmode_put_plug(plug);
> --
> 2.34.1
>=20

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
