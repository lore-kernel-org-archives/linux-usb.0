Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11343EEAE1;
	Tue,  4 Aug 2026 22:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785882158; cv=fail; b=bXvQJw1u8CI7lBXelih/gwfJR3BEd82bWc48Xe+FvoY8Tvl2JDRCCRTNrNE2b0cRlzNaTb/Io6fOB9HzJrnWDBwmh+CAIm73An/dVh+3hIo4cLXgJ8J7z2P6PdimPmn/75X4Uk5cL55up579m1htgo+iENJayWjmcB/brntFbfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785882158; c=relaxed/simple;
	bh=r2NTa/jtbT7kISPFSaDUxhEXTVeYJYHrFw+4VDn55R0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VCLabDE3avv3zFnYyN9t/ed247TxZTJgnyAH9f6MWr/q/tvw+UQXAf7BVlK57GeJvJX5FaelquOeKvSYg0N6AEwa77kCOuHTNYLUnmC+ivGloyAZuzpQSlhM50qecEWriLJoGAvO2f5JmsNl17B0gexBHOP+kduwQqPJziHi3Hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dBxIhEKY; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=I8++vJjm; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FtDzIZ4M reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dBxIhEKY";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I8++vJjm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FtDzIZ4M"
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JpXrv1535178;
	Tue, 4 Aug 2026 15:22:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=r2NTa/jtbT7kISPFSaDUxhEXTVeYJYHrFw+4VDn55R0=; b=
	dBxIhEKYsnCKDoyDO63aZsPerXacNlWma+7UXWOsvH1pX4z18I90p3WN9NZZzWSS
	KoWDRn2k3yo3xAFDrNZcUOr3Cf7thJ/6oXtwMr8Qsd7x+rxadKfPOlZTdMH4zvYC
	sKnYuJyk/2SRD9wGipmkirixD3P+CD6UVb2z6ZhOMpFZi5mgjAwrUjwtH+IzMl7Q
	kaB/LuYbAtgLx9SC5R5WVfdv1mvOHfLOApfIhtyHhSAQ9TMdKvUQrPvcTYaI6MIX
	WrNR4+0+Gb/OeNE1cmfUjcHzO6rIqlAXxwA1nbyaqMVH6tqoaEBFW0ldXqIwIg5g
	5KJLhHGLir1GbBDnmkGJNg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4fuey35tpq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 15:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1785882147; bh=r2NTa/jtbT7kISPFSaDUxhEXTVeYJYHrFw+4VDn55R0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=I8++vJjmi3guuSnMdTDIoKDjZvKhtjzfzDtVznsmDxbQBKchdLQNHidZuSAEGe3aJ
	 IkRcjwZIjb+Kd+W97W7rgMXnM2DBx3AFryPsvqI99weK9Lf8XYba9vNjcrhAjHXIBr
	 dTqpVWsc/OvUcfmeuL5kUm64HF4kF0NBvK+3zDLaNPhsZhUCO3aXJ8sK6qOVlkd0Bu
	 23DuuRXwFExHz3OCtx4wumX3GKfY0lJAOqcD0JiCrgpx0DD2FrHJiLVw1OhitGwBtH
	 C32nYJa+7d07j4nv1BSY+YNUXWudNfepoCeDCBReU7UL0Z9C5VM7v6A8Aa8RaBipec
	 cSokac8Eqgwng==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 656F24064B;
	Tue,  4 Aug 2026 22:22:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E2B54A0072;
	Tue,  4 Aug 2026 22:22:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=FtDzIZ4M;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00106.outbound.protection.outlook.com [40.93.4.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A88B62200BA;
	Tue,  4 Aug 2026 22:22:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NciNOV1ai42DjgiLb9EwfUc2pvWNMrJzr5LN6JsyKrRuroNvGWYrNRDEH91/aF5y+ZWNZujij2ER6g3GlOiZ+mLS0K8nwpQBZWcuYNh8BVN9v1qKEvvqRZawhJnphrLgycySTaP6NOyIS5hePUOsZk4ADwYcxFix2/b/0NZIkJmeX6f9jgBQz2tqQ1JDpP+rAdYD5Bj6vhyNhNWMhhrPWtDSOzwozDpzyA7e/2S1T6QOveQVDKaOzi0ncku+ywIkgTqR55wDGyz5sqMBC3dBHNAGlClRLmnP4fvwCIwAYxXiKDETHdH5BN96d+5psCH94MzpMWY5xXFcEeff4w+oAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2NTa/jtbT7kISPFSaDUxhEXTVeYJYHrFw+4VDn55R0=;
 b=feORZOiRa4q7sXddnKjbdhToBPgRdpOWZU0j2GCYEHDhsupMwUyl0NS9Daal7h3vigQa5bgwpRja3dd1UhVdq935eOppGQ32Lxkb3NSwAaOYgYEGwgw+dMMSOW8QfmCaI9FlLb21SazyFzQlT29DITqb/JYUS8XOVFMi/Usc2QHQD7ygsP+7/K+WNxOLePzGEpEnPNqHAYtMG2hdTKXSJwhlUi10PkRZ6fX2++sbpmYqLEHdF5c1nX7qx2B7IaXyCTHyPX5PFbql51L8dwYsamrQHD2mcymHob5rncVoZ60tpTYEGyzPDl4/fw+sMyhdL87cBID0OjOx7pkMcATPVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2NTa/jtbT7kISPFSaDUxhEXTVeYJYHrFw+4VDn55R0=;
 b=FtDzIZ4M6SfyFEf1PXhCwy+/QWxKO6TS5ZClWwkHLlX1NT++wO+CG0XD9tIEt8dUP3rjLC/QGdkHIDBVmNuDiXn6nuBRmpjBf9C89TJ88mEMi5Ca50v/BvFfhx+UGf+TD2SUa+yV74nNe2W4FjjC3bdKBNZKiRJv1UKQhqphhx4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DS4PR12MB999077.namprd12.prod.outlook.com (2603:10b6:8:2f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 22:22:20 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 22:22:20 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Thread-Topic: [PATCH v5 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Thread-Index: AQHdGo+OtO3eh7CzF0GOXQEldLsQKLaAR7GAgA5CnIA=
Date: Tue, 4 Aug 2026 22:22:20 +0000
Message-ID: <anJhN9-4dOtDqncs@vbox>
References:
 <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-2-f32ea6c1a318@oss.qualcomm.com>
 <5zgabwyhxu65hacpr53cwktwe4npu2ndzgvt3uulja5lejnmi4@bj4uxp5wlb7l>
In-Reply-To: <5zgabwyhxu65hacpr53cwktwe4npu2ndzgvt3uulja5lejnmi4@bj4uxp5wlb7l>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DS4PR12MB999077:EE_
x-ms-office365-filtering-correlation-id: 16f78c66-9040-4e7f-a113-08def276d984
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|3023799007|22082099003|18002099003|4143699003|11063799006|56012099006|38070700021|10067099003;
x-microsoft-antispam-message-info:
 npyoJHwPscZwLuWXYq7R/WDyQk0VQ5hQGlZ5DefPUoiVDnphBuGhxo4AI5PLae3sMxMo60RhRYpWECd6ETL+yeVpUstbjUXf6tQGXboapusseFlXVFdmc7OwuD9ubNTduPYzNlRwhZI5amH9WMgZs+aYMc4bRxrT4MN2sOrrIIqBwniKfn5QdDanPsVbumhnSxYohydtARqvqprl3N20eH3elSEyVrz0TeNoqzYykBdT8YR4auZ9cnJWVUm+Y9HnbqtY0szp0750WuGjzJk/KUgw7+2VfAyslvZbon8+YZigXqY9ttNfXQpRTa8Upjtib71Mk20Nsnm1T2cLv92TvVgW4biOYddh+iduxVQWbUIiK11U1iqnVMBEKEl3fEa5/JP1Cdwqoit7Ldr/ERm5f7RpBquSnE6JSzsH/U6iuwjOyzqeuxvYTbuS1plMiLfxiReceAE5Fc1BaBfChtyi36W9qd5DGCC/4kuMdq6wkHF5E7TGrOPP/hR4XyPZiB3Vku4tRMBvj010EO77Vym2yNEgOMgRvmCUiorMWivOL8fh+P6MtNPPrKdutpxY8f9uSdQCUCW/u8vcnTNJepzMus0cxsN52K+vokoZRSkxtOks7DPKgKA2w2sqexAFKmux6b4zGMVFB5azQ6ta+oYwopQ82tPHAPZ3pc9dfMnEZgK6V1MiqEqzRbrs5loklMYT673ujATM+/jUnBamehl9ruqL8RU4Xh2mxpX2Hhdm20E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SkE4cXFFaDVaM3l5cGd6d1FNOGVQeVVxRFN0cjl3WHVZcE1GeTJJdDBFRHM1?=
 =?utf-8?B?L2tnemthNHFJK2VUNlZxaUQrQ2d5TDdHdzZHaGhGQlpuZlJBdDRkT2JtZWRj?=
 =?utf-8?B?bk0vMlVFNXJXSFRYcFhqcHN3aGNmc2tiMlpXZUZVUXJDRThTbHdnQzI1OXYz?=
 =?utf-8?B?MUZ6ZHBvZExKSlBjUW11eXVucVdRd2hWUWRyS1gxbkdtaEVkdzkyck9iemRC?=
 =?utf-8?B?anVFMXhrTVliTllXSjhNM1AzYkllMC9FWGhUTWZDNTRGeHQvSWw5eE9CY0Nw?=
 =?utf-8?B?WFlLU0FoN0c3UThTZTlaODdDeHFLbnFGenZEVTJtL0V4UXZIUllCT3ZUY2h1?=
 =?utf-8?B?Y0NHWlRLQ3NzK3BLWE5JbU95eVNUV1ZqWmZhUDlGanF3Y01ueE1ZMW1DOFl2?=
 =?utf-8?B?QjQvZ3RSR01IRFNjSUtoc2FrWWVNakc5N3pxK0M0eHZqVGNpajNkT0cvdmxa?=
 =?utf-8?B?THRzbGIzYXhmQ3RBenhqQWprbFRiSTlmMG9URUtEY3E5aTBqQzJrNTZUdW92?=
 =?utf-8?B?czFvbXJ4MWFyMEVpRlBNa1hxdVlmbDVGUWVnMGFaMm1zSDNNOVRETy9iak90?=
 =?utf-8?B?WnlJTHpFcXE5bXBZa3pLWHNkN1J1am40Z09lbHhSUXFsSHFNYlptUDdiMmJY?=
 =?utf-8?B?a0x1dzZqMkE1dStaWVRyRU43UWlhcmJmd3c3c2hjRDZBWjh0bkpkQ25lRW5P?=
 =?utf-8?B?UXE3Szg0SXpnZXc2VHBWUTN3eGdBQno5YXQ5d0p2c3A3cUJNNDBvN2lPU25i?=
 =?utf-8?B?bWpBdXBEWDhWbE1EZGZWT0o4bWZyUkQ5bTRaV0NIcEhVc3ZodklxTnNFeWpp?=
 =?utf-8?B?aWREOTlSRGJ2R3N3aVkxRDVMUVU3K2VXUmc1SGtIZmhrVFJhTnMxYU5aYkNZ?=
 =?utf-8?B?YkFMUXNTa2Q4YXQ4S3pnSGNhZWd6NnBXTW1WdURPMFcrWTFlUlY4VjJ0N1N3?=
 =?utf-8?B?TEVuQjExM2l4ZEpzeHYyWjdyUENNQ3JDcE0vL3ZvVnV5NkdPcVkycC9CcVJW?=
 =?utf-8?B?ajlZQzZJWnoydjN6VkZGSFRRclo5cVFXRUFEYXlDTTNvTWMvM2ZHNnF4WWl2?=
 =?utf-8?B?alFHTnFWQnlSeDZySTNJcHliY0dtK3JWMU1BL1FWbnI5K3lWTDZZOGZIWnQy?=
 =?utf-8?B?VWJucko1Z0J5VXJBN0ZJS3Y5TVovcFZjREI4SlRWUTNLWFJrU2dIbThoeW9V?=
 =?utf-8?B?am1XclpKbGVROEM3OGMzS1p2b1o4S25Oc2dhQmRYZFdIRTUxejA1Y0VDSTA2?=
 =?utf-8?B?YkRaUGN4a3MrUFRWa0ZJY3V5R0dua3NsMmRML0puMVNnRDNoeGJheGo1N0hG?=
 =?utf-8?B?K3JzTGxwZmhBUUwrNi92K1k0eXdxVHIxeVZjMUhQZDR0T2VpNnh2T2F2K0JX?=
 =?utf-8?B?T200L0RWeDd5L2VqMXJFVnZrSFF6YzcxMTBNNFgxL3VCNTlJWFZCZkhFaVMy?=
 =?utf-8?B?ZFdRQVFBZHZIYWZQdERvcjBVRlBwSEpTek93L2h4NjFISkorTTN4dTZLamps?=
 =?utf-8?B?NDVMeTdkVGFrZGlHaXRJSHBrY0lRbHQ0eVM4dUMyemFWMkZoZmJtcVN0VHVy?=
 =?utf-8?B?bDJHOHpkbGVVUWhPQ3VPeVQxNUpvL0lxZDQ2L1FUSzZTcXBYNmFDV3VGUVBp?=
 =?utf-8?B?VUMzWEY3R1p4WjlBZDZ4UU9wWGZqK2t3a1RhaFNFVmtVOEdhd0NEVFM0cmtH?=
 =?utf-8?B?UUlTbXBvbkRORXNEamNUd2ZzbGhTUkQxS2xhZzRrWXo4bjBUdVpYMGhsTGZs?=
 =?utf-8?B?elYrUGN3Sm5pNm5PeTA4dXlVSEs4aXJVbE9oY2xwU2t5YTVpN0owMzA0ZXdB?=
 =?utf-8?B?SFBlYWFHMVVxMkJrdkYwMWJLbmVvWWZIcnpDRWJySTkveW43ZVJENjBCWG05?=
 =?utf-8?B?N2xDTkhEVDBBd3dCZCtQUUJLcWhvekVKclZMR0ZkTXFGblRjVFN5d3A5QUhQ?=
 =?utf-8?B?YWR3UjE3THlEdDNSZVNWMEVRRHNZYS8vSmlKcUZTNmJJWStkU3BNYWFWZjNy?=
 =?utf-8?B?TU1IeUV2c3pHa1JvR1ZzOEQ3Y3ZsTE1tU20zNTFJSzNQblNtdFlPZVp1SDJw?=
 =?utf-8?B?YVlNS09iYWRrUWNQZU91WFo0QTNtZllVbElIeEtiaGxaUXducnlPN251ZG9D?=
 =?utf-8?B?VjcxWVE4K1pia2twL1QvVkVEL0wweFVsKzNYNHVuMUg2VmZ1SDZNMk5hSXFW?=
 =?utf-8?B?dGt4YW9EQkU5TnFtdDA1MXBNUitUT2lrOXBXL0t4bm5DZDdBR1poeHY5eTlR?=
 =?utf-8?B?UFRtOHp4STBXZHFEeG4wTDN2V1hFdHhzMzJSa1FJSUFhbHd0emNSRlU1YS9j?=
 =?utf-8?B?eHNSdGZ6Qml1aUNWQ0dJVGZ5d3QvK2FlZ053UzlzdHFFaGNFRDBLQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92BBA13D87136B40BE02A58AA9320D46@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	j8t6s1ehy4zBcQpxg7zXIznGP4he12NN8myCd1TndRqihdG0o3RMHTRthacaBVq3UjbNjbvXYXwkZA3Bjs8lYQ19HR6rjzizNhT0IZFKHR3pVqVU4d/eK4zCWhsyMdmzw/ErMUSNikEFa//Y6K2xUn8qWQlLOYdylzSouPJ9WWRHDcOx4380pAFQbPOt8uB+ffVlGxXDWfAcViKM2B+E+RElBJs0wOn2S3EOjOu9i97DomfmJKwoRaVQw9m5AO39DRn8xgNShFHoQe02JOiyQCQ8ogjOTXoSKgxRHcj3ZnvC+1qAB0hnqHnVUoA0Ta3TIMKFCHJaCwy+txf/lqlE5A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2hQgO2xTwQG5Pd5+UFNTUeeIJn4kMxWKJ2qTehV8UbWkkQ1Yy2Tcw0cHeXTQACMgs2RiShCF8swKDvVzysLOZk1odOgtGEK0P7UClEQiOVUN85p3IBsUdD0iQrgOJLZl1/y/hCmPbjwrxr0x7VYCgnS0Nox1ZkH8A3xtVELFPmVuPiTUvYp9lp4XlgwYrkadYxI4F4CiTembc6N61AG26Ws+FOIQgr4KnhYzNjATazvYd9hFUs7kDxfMuYK5AI/Un6Rg+BrJUOMQ4ET/TB7O5ADQHE/VCTxmYU2yZG9iaEmfMBlo9ldkI08Zi/EddIJhICX31r3IT68GCmsj6jjerdjT65mr0CTVgllLanG5VFA0oxPaFqFECt229fjCXjgoQI9mX92bGqkPW4wf1jFuCW22VDTOy/y+nPZ8kTDDk4mvyMZa0I/nif1huh1nXn+BvZjpMMlMTe6vpNfqSz/wdtouXJmYinwRHAQ5pYrq8hI+85e/tnFA+bCbgHz1g+VwvMjoc2WiAnXTq3hZEUG4RISnDr/OLE5Xd2guJi1/ly8Ex1yq5yWIcd9/i3RKZFaoczpWNqd/kJsxw86SAWk1BKfYtJCoPXEIh492cdoN8FvYfRqZrB8wCfN87RpIL7qau8uAIKOuPaljtXIIPLh7Dw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f78c66-9040-4e7f-a113-08def276d984
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 22:22:20.2381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ynYpSuVvn+X2MOn8H+yY9+WWYyaWSThkWKecBcVhBi5N2ryLuXwtS/BkdfQxxd5pbaoW1IEuJkqN4MBoTPrWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999077
X-Proofpoint-GUID: GaUi7oDYjXY-tU2tIA6JfQI9ZkWappQm
X-Proofpoint-ORIG-GUID: GaUi7oDYjXY-tU2tIA6JfQI9ZkWappQm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE4MSBTYWx0ZWRfXz3Q0i6JJ8V62
 JlxKqXGJ01s6kp5wsZ/7G7s849lGBQ8Mg1JnS+4KNBVArD5Wcu4W27LiVY5GP+kYaIej/npn5nc
 UTc/B386RKAZU8njHbQw+2OLG16o9no=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE4MSBTYWx0ZWRfX6jIatTOT2O7u
 +RBUyWDvPffiLJkvLSyD31ExMkfkk9ya2YaN084j+Xw80nQ7UNWMS1pj22S59Jqe/mLFcaqv8DX
 3CNeSKjOXSAFF/3VFXD8cnAW60n1+cuQR401gJ39HWpMWZ+uwBYUONE5HvltAaTPYSErY0+zRdJ
 2p29NSaIZbQKRdRnanTJefznZ1X1BDf5vP9KRss4Wx3N6rU/EEEW/E7OBTDI0BDZvq+3KktUg6Z
 2ToQBGVInhkM3Akq8lWyJOxDpmelQkj/dWcSQ0nMmena7YhI7dsYB/lW072WAMfF8MRw8D2yNbI
 QV4YR0SKW4KQFSr3bbSF1gELm3M2D+cDmmtQVdE3mXLg93YDCM2nD7ijR+ge+9yp0izggFf3sqO
 JZ4KPB/cWYyt8LZpJsaCeQtHRcA9nXsbHPve46RVebU4ct8mjLLXZHM11CoON/P58aoXdK8igQ+
 D4p6SIJafmE/uQCYnLQ==
X-Authority-Analysis: v=2.4 cv=DvxmPm/+ c=1 sm=1 tr=0 ts=6a726624 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=EUspDBNiAAAA:8 a=zN5QJerk4Z3PnD9rnr4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2608040181

T24gU3VuLCBKdWwgMjYsIDIwMjYsIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+IE9uIFRodSwg
SnVsIDIzLCAyMDI2IGF0IDA0OjA5OjA1UE0gKzA1MzAsIEtyaXNobmEgS3VyYXBhdGkgd3JvdGU6
DQo+ID4gSW4gY2FzZXMgbGlrZSBVU0IgSGlnaC1zcGVlZCBwaHlzIHdoaWNoIGNhbiBiZSBlaXRo
ZXIgVVNCMiBvciBFVVNCMiwgaXQgaXMNCj4gPiByZXF1aXJlZCB0byBrbm93IHRoZSB0eXBlIG9m
IHBoeSAocmF0aGVyIHRoYW4gdGhlIG9wZXJhdGluZyBtb2RlKS4NCj4gDQo+IFdoeT8NCg0KUGVy
aGFwcyBLcmlzaG5hIHNob3VsZCBleHBhbmQgb24gdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2Uu
IFNlZSBwYXRjaA0KNS81IGZvciB0aGUgcmVhc29uLg0KDQo+IA0KPiA+IEFkZA0KPiA+IHN1cHBv
cnQgdG8gY2FjaGUgdGhlIFBIWV9UWVBFIGFuZCBhZGQgdGhlIGZvbGxvd2luZyBoZWxwZXJzOg0K
PiA+IA0KPiA+IC0gcGh5X3NldF90eXBlKCkgZm9yIHRoZSBwaHkgZHJpdmVycyAobGlrZSBtMzFf
ZXVzYjIgb3Igc25wcy1ldXNiMikgdG8NCj4gPiBkZWNsYXJlIHdoYXQgdHlwZSBvZiBQSFkgdGhl
eSBhcmUgKGluIHRoaXMgY2FzZSBQSFlfVFlQRV9FVVNCMikuDQo+IA0KPiBQSFkgdHlwZSBpcyB1
c3VhbGx5IGNvdmV5ZWQgdGhyb3VnaCB0aGUgUEhZIGNlbGxzIGluIERULiBXaHkgZG8geW91IG5l
ZWQNCj4gdG8gc2V0IGl0IGZyb20gdGhlIGRyaXZlcj8NCg0KUEhZX1RZUEVfKiB2aWEgcGh5IGNl
bGxzIGlzIHR5cGljYWxseSB1c2VkIGZvciBjb21ibyBQSFlzIGZvciBtdWx0aXBsZQ0KcHJvdG9j
b2xzIHdoZXJlIGNlbGwgYXJnIHNlbGVjdHMgdGhlIGxhbmUuIEluIHRoaXMgY2FzZSwgdGhlIGV1
c2IyIHBoeQ0KaXMgYSBzaW5nbGUgcHJvdG9jb2wgcGh5IHdpdGggI3BoeS1jZWxscyA9IDwwPi4g
QWRkaW5nIGEgY2VsbCBhcmcganVzdA0KZm9yIHRoZSB0eXBlIHdvdWxkIHJlcXVpcmUgdXBkYXRp
bmcgYWxsIHRoZSBldXNiMiBwaHkgYmluZGluZ3MgYW5kIGV2ZXJ5DQpkdHMgZmlsZSByZWZlcmVu
Y2luZyBpdC4gSW50cm9kdWNpbmcgYSBuZXcgaW50ZXJmYWNlIGFuZCBzZXR0aW5nIGl0IGZyb20N
CnRoZSBwaHkgZHJpdmVyIGlzIElNSE8gYSBjbGVhbmVyIGFwcHJvYWNoLg0KDQpCUiwNClRoaW5o
DQoNCj4gDQo+ID4gDQo+ID4gLSBwaHlfZ2V0X3R5cGUoKSBmb3IgdGhlIGNvbnN1bWVycyAobGlr
ZSBVU0IgY29udHJvbGxlcnMpIHRvIHF1ZXJ5IHRoZQ0KPiA+IHR5cGUgb2YgcGh5IGNvbm5lY3Rl
ZCB0byB0aGVtLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEtyaXNobmEgS3VyYXBhdGkgPGty
aXNobmEua3VyYXBhdGlAb3NzLnF1YWxjb21tLmNvbT4NCj4gPiAtLS0NCj4gPiAgaW5jbHVkZS9s
aW51eC9waHkvcGh5LmggfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykNCj4gPiANCj4gDQo+IC0tIA0KPiBXaXRoIGJl
c3Qgd2lzaGVzDQo+IERtaXRyeQ==
