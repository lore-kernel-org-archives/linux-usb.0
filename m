Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023120.outbound.protection.outlook.com [40.107.44.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F5E399890;
	Mon, 22 Jun 2026 09:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119160; cv=fail; b=UQfmBc1alpH8nJ9C2d6FdNmxmHXYpoNrdrk9oVQwueJV5KLSUYWgHokizMil/hSfbHVKd7xlc4qr874GbC0P8RY6kTwv0ku8NVfpSgak/pKN8KcacDltnyWp0vNxNhW/8dbv09B5BmkIrOKtZpAbuEIqjthQE51h7oW1jNpIRfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119160; c=relaxed/simple;
	bh=XvHAbzbsG3TqRD1ZQoaekebxN3Jz9F14UuIy44XsbVA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kDcqfUDMo/LfcEM5QEa2vyy9m/o9S3F0dEMVVUxGQW77+wjNJIOAuBPE/MhCQrusw56gKh8BNnkxBmIdbf/Z0JOH/DPdchzbe7hwWNJxGeRWJrPe+0JSyVIZaWUhc5UwcsjnSazNV8JDkCdlAOeVRHOwRr5tqbj/r0C/2A7AvyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com; spf=pass smtp.mailfrom=ftdichip.com; dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b=brBWl/nP; arc=fail smtp.client-ip=40.107.44.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ftdichip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ftdichip.com header.i=@ftdichip.com header.b="brBWl/nP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riXk/NRkUTdOar9oHErW3nbYOwBBzSapNBYw/umnf/nmpC0jse/kK0kkX1OPp5w4mrcuqnC4yxMqCIUIbhVL0W1BXL+m1iRoxbUL4/RS2CifubCTDxqd8g3FyLlL51qfmn3oB48zuVi9j0JlL8w/Ew2DKNaR1rUoF5YwSvlB/lw797LmVIkWF3raCdMlaGgxdUcCspViL1Y240fPn5cOKOsUmiI6kP8GVoOTv99iF4NavYwd+8EE3U4adPUV9Jz5W3wZ4hLUCFBc1VenMutgzAI2DZn/KyCpTthSD5aHSNp+JaxeA72PsRqQvNHdORnm6Si22UcGEbnzEW3Z78nufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPtTIQ6KToDIGvovEJLE55GBnndNmmtBZlXMWdpUET0=;
 b=sdAS0fSL0Pfj4mW5rrdDExMIcECWdXhaTaQOyeqWuHftsIAPH6cY6O3zdmgrLfIRgGMY3fQqPpAEmo1AfqUP9kZhv/vnGBDaLNUS3Gb57T7DnIFKaL+mJ0QJ4Y2bbFMWJshgGuGz22lbti6eoZ7Dw+xFkMg2aHzPiXGhhM4yssg8GMgrTvvPV/0lFcFZ//k2Jnc3F7niZtT+dIwxxHX8YmhRQaoXzLVXS8Llwu0o6PWGPSdVZGflAPxc+vQJWiPDlcmw0jF8FntKyMsAqgWuICp4eyc4pNsrNxbHGE3rTFJ2c+frBqZ3DjeVsqX7czR6UYdFgVgQHEBwQyMF7zB/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ftdichip.com; dmarc=pass action=none header.from=ftdichip.com;
 dkim=pass header.d=ftdichip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftdichip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPtTIQ6KToDIGvovEJLE55GBnndNmmtBZlXMWdpUET0=;
 b=brBWl/nPRkk+7p2jBoYnblbAvE405Tpg8RuGVJcHVgv+Bi30b33CjLm6mM6RSZplH/bdMPXIONvaxneRfsXTzi39E7opSMsu3NP+ptx6CkIlKMTGERz1CAcpCGmLy4oIJjMuSVUjO9EJJfWq767cZ2JjmwP8fTwElBG5OVnX1NjBCqo8c28nC0jSeepnA6hJHy7xuC5UWP+W7xNoebKNgK6xN4iCY77NzQTlzbLLyAQVJnmGL6GHlH5j8iZtX3xCBzcgml+b7y+XTWMdD+4IsbMNp0WWsxHtlb6wldW2k90kJiqzlai1GQLeRTPyAh0WWRPjmB/7E0mrCoh8mYQAXQ==
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 (2603:1096:f:fff6::45e) by KL1PR01MB4767.apcprd01.prod.exchangelabs.com
 (2603:1096:820:b9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 09:05:53 +0000
Received: from SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108]) by
 SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
 ([fe80::e65f:ac00:2342:9108%4]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 09:05:53 +0000
From: "Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG)"
	<naveen.reddy@ftdichip.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Johan Hovold <johan@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Arun Pappan (FTDI-SG)"
	<arun.pappan@ftdichip.com>
Subject: RE: [PATCH 1/6] USB: serial: ftdi_sio: add configurable inter-batch
 defer for read URBs
Thread-Topic: [PATCH 1/6] USB: serial: ftdi_sio: add configurable inter-batch
 defer for read URBs
Thread-Index: AQHdAhlPSBjjJ1ZFjUmtnEU1RKl6+bZKRKkAgAACk/A=
Date: Mon, 22 Jun 2026 09:05:53 +0000
Message-ID:
 <SG2PPFE985372F0DEC3C668B0C138E0684BEFEF2@SG2PPFE985372F0.apcprd01.prod.exchangelabs.com>
References: <cover.1781744946.git.naveen.reddy@ftdichip.com>
 <eb7093a47b77e9ef3ab55ada4c9591ae472da645.1781744946.git.naveen.reddy@ftdichip.com>
 <2026062250-sassy-hamper-025b@gregkh>
In-Reply-To: <2026062250-sassy-hamper-025b@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ftdichip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PPFE985372F0:EE_|KL1PR01MB4767:EE_
x-ms-office365-filtering-correlation-id: cc330173-1cca-4897-c175-08ded03d76b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|4143699003|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 +jySH6AbSNIrH95tCvcSjDajIufrPWCKsrkjgi90dJOeOcezzHqDOo2DYnAUXNLvkhjpZSgk3tz6aVW6TWZS6gzD+GZtB45D2cpynEkPtiAIVd8QjQ5LRYfIeUB6s+7Mo3LA7ugkYQn+17YNSHzNgPvSrO88tNXL+G0RAaWUNTKYQFOa4+mFZlumV566nSg5c6KcXYsoTBcgpjVlXtOkACvHguaVGqmXiUVAi4y1vkQAzhC2zY14rlRuax6WJd8aPAvT4egI/KK/1ywZRmqXv1X5k08E900orBqYp7VCfKaRiefUZ9WIyd0rxJJOWXOOt/qXp1h42j3RLm33K1Dg61V+vrSMgz1GdJifuatT8CVpaEi41pgxWIuP66sg20l43HnhOo95YByW6JPkBLhk02g8A58Z6koJNLP+TvFi7M6L3xd02QbXsd+uOurLuMgMSTFaKLD8gl64QkXIkQnCbK9AN9XSIPYFA5wGmXp7KATVaZEcBXPHogjN6TQYLMwT3RzXBOlO7ma2UxCJ/YAx9p298vvdE08shyv3609H7Ic6jqiEyF2l/8GHCZEaLuaZojp8rKiruqFRqRxMjDNRv+vVuN/eWJqDjHTGJqSqojlNIk52SvkFi/56c1YZ3dB3ijMqsTL1P+61Y7N6MDEAZkQ52y/Yz4he/VOhhGnvdpde63uBiGjHFCSO+qCLDzkTMCqcuDimQF9LWTCuG8sbv/5qF6DhKqiPGmO3XeQnnSA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PPFE985372F0.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SipFNppRWiyXUPGjZQi89xkakAvpHqGSda2NBU03sbrbqqs8oUyYsl6chrQ9?=
 =?us-ascii?Q?b7q+y9zfp5nlPVg7jZ9y8/Qwrm4EwEWmPe1HMwuZaA8t22ZrzwXYyI/DhlkG?=
 =?us-ascii?Q?m+9e5xoIv/z0MiYCSS/8vkNUg33BWV9x5y8ctUouP4ndidnptbL4JQyfBDj+?=
 =?us-ascii?Q?8s3a7t2omX7wbVQ9b0Tmatu7pAvS/TEgSSm5cLpkXAKt++ozQxK2oBPkvEBG?=
 =?us-ascii?Q?g9qyaygfOQ2sGDPsQapPVb5XbCdvFj89r0HKgnDhowYkvOyYrPaLsASDwjPx?=
 =?us-ascii?Q?1n6iVnD5UOA3T6QyO4ZWfzMTWqI6i7RLLhA4nKzGHkSsn5mpM1KIILvKE96k?=
 =?us-ascii?Q?PhmJ3mCYmq2SEy+NwUeOG8mQJxw9i1kFzqhJsHcMlaDLdQWuxB2YvGqDdqlW?=
 =?us-ascii?Q?bUIOHQyOtr7NYttPim7seKuXzp4u284nRtM/M41i/PIZaY8KKkg/qnjRwOTE?=
 =?us-ascii?Q?adz4VBqgLlsfyYsAQifW27eDh8QVtoY4lB3tr/tcc7MK3BQalP5spOTldSnN?=
 =?us-ascii?Q?06uviQ3loE0qG3SKSyQEr9Vq0iC5mHP03Ua+B0wUpOEHgvtMOBPMEyrlTMFF?=
 =?us-ascii?Q?9mTfbCzu25UH3KNl/mr2+dY9DxOZULxdMvWc5txiInR1wZPu13FR0zGIJlAg?=
 =?us-ascii?Q?3T7voCzKAJgPaF8D4rqADG3LuteZ7e7NYj+Z9V6SXylQ79HDJmQ9lxmgsijB?=
 =?us-ascii?Q?QXmMpcRV9vZ25zPCgpavTIGJ7lQgD63KnwX7nPUu5iXMJceI6VIdtd8UYe0r?=
 =?us-ascii?Q?quKDhbYAtpYuXBkuiAG84OIBW9f23qFcbWPmDQ58fkZkvRYFLsfteyVvPcLx?=
 =?us-ascii?Q?B4PrzP/Vcz45+o1m8u8uiyjljmdbI2UyVfVZUUdBtjcaKZoa0vl4bxkG3ucQ?=
 =?us-ascii?Q?yhH9D4CN5tf1fh3vPOsWXB1qEMB2QEJTlt3BSeHQNHdkvzpn+nQXoBFR2nUj?=
 =?us-ascii?Q?6i8nsjaMafftc7Mxw738+T3d0avJLlssNRkZwQxj44a8I83HW9EkD7R22Tz5?=
 =?us-ascii?Q?D26PEV0G0BTCtW0FKwIj4yG7xwwLC6RKsciGSTMru2UgcdJ8eKgdHltV+pDZ?=
 =?us-ascii?Q?qsPBCMVNHjh5h7WdWEtWONTAAIOhQVPaVFKmnk4VK9KJh8ngt50tC3kPMoht?=
 =?us-ascii?Q?XzGwnHRplNDCTnKM7YfWROI6PrreF1C0CQF84Itu+zY+P4yh6oJoR7mWW8RH?=
 =?us-ascii?Q?EBTqKCVIVNRp9RHp1hj2aTQtV0Vy72XK6ZaIP8aNGnkMqblPWz8/eRwvkCbG?=
 =?us-ascii?Q?fc1aJ6DjKd435LvK3s7JhI7o2Mq+UQKihlK7jqRVu10fUWAbZUQMKIN1EuHK?=
 =?us-ascii?Q?LKJxArhreaQXx7kz9eg/pichFUs56SbuGuNClC2LlqbGdP2AqbbidqVJyzPd?=
 =?us-ascii?Q?MoKp8QtH9l+x6e1wmc+CLJfeNLFh8r1uhXi922MrXxJN2oHYoAaYn+MLuJJG?=
 =?us-ascii?Q?Q8qJhGuMXm+9M9pwveGmh0XknsCPYxGWVa6fP1CkQAMGxOhHEP6kG/glpYNf?=
 =?us-ascii?Q?fuLQqrjPZVCS4fjMiw1GKbkzhyTxiUgnCLkasIHrrhPZWxU+vIiNdB/ynRM5?=
 =?us-ascii?Q?K98woY5Zn0rUOSG4s5EdgyRHA6so9RoXRuQiKChmMtnVMBB/UqkHGptATUmQ?=
 =?us-ascii?Q?+dclXZjIYWjDcpyeEi2UCW63xGYUpGQ5+6YL/77uMO0KlJOWCW0D/ljo+7Yk?=
 =?us-ascii?Q?g0bUPVVHjIk61aMlUSd0Em9ItGNLHSGns2Ag149jTV//iZG1sL6VjWBh1DsT?=
 =?us-ascii?Q?BdV/9ddd/w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ftdichip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PPFE985372F0.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc330173-1cca-4897-c175-08ded03d76b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 09:05:53.5824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c2456335-1328-47c5-82f2-1fe6783d7182
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y79/gw7SCaNJsQMhwArAbS4M1aPN7hgQEsQ45mSerDwR4ORfObupVfelcq8XteJcbtG5F1PlX49T6Lp/Neb3/86H2YySlyRE5sSkU3lLdDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB4767

Hi Greg,

On Mon, Jun 22, 2026 at 04:52:00PM +0000, Greg Kroah-Hartman wrote:
> This is not the 1990's, module parameters should not be used anymore...
> Why not just fix this at the root of the problem?

Thank you for the review, Greg.

You are right on both points.

On the module parameter: I will switch to sysfs if the per-driver approach
is accepted, or drop it entirely.

On the location: your core point is well-taken. The DMA channel starvation
is a BCM2835 DWC_OTG host controller deficiency, and the correct fix
belongs in the host controller driver, not in each USB device driver.
I will investigate fixing it there instead. If that is not feasible (the
BCM2835 DWC_OTG is a vendor tree that Broadcom/RPi maintain outside
mainline), I will report back before proposing any per-driver workaround.

I will drop patch 1 from the series for now and resubmit patches 2-6
independently, as those address ftdi_sio-specific issues (latency_timer
reliability, low_latency race, per-port sysfs attribute) that stand on
their own merits.

On the dev_dbg() nit: understood, I will remove __func__ in v2.

Thanks,
Naveen

-----Original Message-----
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>=20
Sent: Monday, 22 June 2026 4:52 pm
To: Chinna Mopurigari Naveen Kumar Reddy (FTDI-SG) <naveen.reddy@ftdichip.c=
om>
Cc: Johan Hovold <johan@kernel.org>; linux-usb@vger.kernel.org; linux-kerne=
l@vger.kernel.org; Arun Pappan (FTDI-SG) <arun.pappan@ftdichip.com>
Subject: Re: [PATCH 1/6] USB: serial: ftdi_sio: add configurable inter-batc=
h defer for read URBs

On Mon, Jun 22, 2026 at 03:38:34PM +0800, Chinna Mopurigari Naveen Kumar Re=
ddy wrote:
> +		if (res) {
> +			dev_dbg(&port->dev, "%s - submit failed: %d\n",
> +				__func__, res);

Minor nit, dev_dbg() already has the __func__ information in it, never dupl=
icate it again as that's just waste.

thanks,

greg k-h
