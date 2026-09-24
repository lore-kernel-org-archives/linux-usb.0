Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020108.outbound.protection.outlook.com [52.101.201.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCFB3E0081
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234301; cv=fail; b=BSim2o/A81+Bjxf1R73FBnJPS1yCfXH7SwNVGWDtw2MYgXPKEttS0DOGuDZl5wNJkjawn9xgQBDj+lDacOeQlq3Dm0m2qMaceEziKrU1e/Rgfj/qkAoSiOPR9bx103/ROG7GNh77/RSZ07mD4+Rv0soyE9f4yyBdIUE8JBvsEhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234301; c=relaxed/simple;
	bh=4PEMo8supsy4rjFv/KJmZUg6QBFWFqWnAQVRpCDhjLg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PmqXkl1bAcxtPHJXyhLqEgQ/rQ3t6fqxaSAB/UmTCJdGSrLaaLT+dhLHk2kWslTHe/YY1UmFVzUkOIhgOHhAgJofXEq8Cb6a4YT3nakmBoDJ0wosOPXEFcxxKwaZmRASvWktMs4muoQFmffvphSrDOikr2P3+dNNhbcMzVU+rUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org; spf=pass smtp.mailfrom=lieber.org; dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b=FDHEB2WB; arc=fail smtp.client-ip=52.101.201.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lieber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b="FDHEB2WB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=et5V4/P8K4MKajgPfUZ1FxGiZi2ABxcVkO2IRHQ60IymSGKRNee/2Du866OGYSBKMCmX667gbUa0s8lP7P5a1bqFflrSbGwOtwpX83r4gytTgusvKPC3dQdMq332k+qnQxGPV++Ho8icuSp2rgJwIHWzskQCQT6/+O8DtogpoVhsOoE0aRg/izxGeou9jSLhhPPH6E0lVDcZQY0Y1t+DqZ6YxY+kYqfBdIz7N4lfVz9QGwAN79ZtSV51KaIuq1wTUvIbUntcZIAt6cazPFa3/2WDoMNYEh9JKocrijPPlpqLO+89Y04yBxsZm+MMxAMu2F8eboSYxwKbVtZ2W3G2ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mW1zbwKvb36kL8qcNIk2/5ukMVzC09Ycm+SpfJljGSI=;
 b=EV2/f0TH/3yWBB91wLx6lUZhPMcxAUdXyl1gsCjQDpCMJPavjHL1uwmenGdTv27bUGwhrwWRdNu5eCq+jcVEA8dl39SDjbFhIHgvUoeVX3Xgo2g43sT4NzAbeU7AUlgrhx3hFUxVlIVBuoFy/u2qmntuW29a01pqh3Y3yoCyvgaVOw1aGhnQaBheWui26WzMSgUK5w7NgFW1Rj27StT8QwNzQzM0BMTiGX7Rz79vCzdKwWwl1ouVq/nyWMIUUweTbmU8c73aKlzLPQQIv2ZU1qXZVSRGv6jsPwIg/C1my0rS0DtYGJQmC0T00MQbIKl2TU1g9QGOoSEOKWjp7V/SlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lieber.org; dmarc=pass action=none header.from=lieber.org;
 dkim=pass header.d=lieber.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lieber.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mW1zbwKvb36kL8qcNIk2/5ukMVzC09Ycm+SpfJljGSI=;
 b=FDHEB2WBHkTuh9/nr/Tn2Ox317feEzdpXd5QyqORf37Kvq+yYwLhYfAq7/72lKyfaAiw9HEKUfssUw+WCnLq3Ztj3IdNS0laopOne0NUBHwaDH/9+YlKjrE3epx86DmjkP7gydduGiB4ufwDvlqsIP0/cbH0C4PqEiHqMmdJLxzZRCeJBLs5oyCG82D7fKEiHL6G81MKuD7FQjk03lS+RYjdrA0pwTSPbExK3BOv2iqsZkkWzDfDgDVOa9l5WAjesGUOlKqb6yYNdqd/tpEFiKRq8a2Uy4yZ1A/HF0E6T+C3vNcAVjvH1Sf4LrJcGCsPZLyprt1y3yx/QafAiYFMxQ==
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com (2603:10b6:a03:37d::17)
 by SA1PR15MB5138.namprd15.prod.outlook.com (2603:10b6:806:232::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Thu, 24 Sep
 2026 07:18:14 +0000
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61]) by SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 07:18:14 +0000
From: Kurt Lieber <kurt@lieber.org>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"westeri@kernel.org" <westeri@kernel.org>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>
Subject: [BUG] thunderbolt: Anker Prime TB5 (1ea:83b5) reconnect-loops on
 Meteor Lake (8086:7ec3) unless clx=0
Thread-Topic: [BUG] thunderbolt: Anker Prime TB5 (1ea:83b5) reconnect-loops on
 Meteor Lake (8086:7ec3) unless clx=0
Thread-Index: AQHdS/NMrSCJQlCFmUOBcxIkZ8Sh4A==
Date: Thu, 24 Sep 2026 07:18:14 +0000
Message-ID:
 <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lieber.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR15MB4696:EE_|SA1PR15MB5138:EE_
x-ms-office365-filtering-correlation-id: 45e0979c-9cdb-4e61-6ca5-08df1a0bff7a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|18002099003|55112099003|3023799007|7055299009|10067099003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 Yep1JiW0xZSb414n0bWvKO5G/P9DjY1+zhBxDtiMeGVoAkBkgUGk+k/X0QZZTKOiomBVseEm7UNyXmHiRajjPx7fX8fMQdxwwlpDiNfkJ0BWGVAd7AeE+X10v6WALvcVZimWFTUZApFJGEevRtUUDZtnkBg32R9C51OqIPB89+21RpmAxlcLvm/XelWx3RgoL3ZFyLiz0S1F8uXQz0XaZsBym8aCiAdP1KQkN40KK6X94VJNe1yF5raQFyk9uRXM4a/7xAUsvpbRZJvw8/pYQqUWFTwFJ5wqYAY7qkkbxnwobRBSKo1uNe0OVCjjNVHwfy0AVmvaYT0EFwkAICN0r3hH7hry+2DUa+HCPAf4UTpgHOJLD+SFNpn5v/kFpQcqy8sUUop9yMPqwRVIAqRinwgjUfXtXKwXZjM+oobXxymCI6Uh1UhMCzHPOUueMAtlvKRn2NefmDeU7gLvcd+2Y48+XaKPfCtMCVGnz0G/KkD5KgC4cbfb84aSl1zW80lbzmWXzDIvIs1WsO8YRJfLwRM4LcG/J84/L4znn8RC7DqBcz5/DHfJ648JvBAhRgHvwekDCrn2NV/nsN/TjNsLdAMFv56iuB31PnNI2KXF4DucGVtqOnNAFz+gX8h2O9tK1VMYlq1g+4KvWl6GC9ZByrO7JHMQ3Gv/Bxj5SfeQi8kqg2RX3xKsOzTONBUVZ3kcWHKKlVGkdevUy8nMUmkznxxVhF4PvsJVl8Weq4nPR+KysM42fnpNMio5BWE0xokb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4696.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(18002099003)(55112099003)(3023799007)(7055299009)(10067099003)(38070700021)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?49in2tmEhnIEOBu5S7EeUc29gt9Wu1BV2AlEvKKzojYd5hX+UZQVegJ3Fc?=
 =?iso-8859-1?Q?CcCuqs/m/zJzvUDLZyjD2Z1Yr4/QpyVy6dn8lcH6XMFwFLHERFyZkK8fzC?=
 =?iso-8859-1?Q?LpUkXIejspvd5+qbs5etOjvx+Sq5s8OTjsBPoGhPFIS6PEzuTN2YwA8p7d?=
 =?iso-8859-1?Q?wWI+2uChoS+3QIRkGmibFPhQC8QZff3/lP7F7AwjTu2v3kS3rWVtODGZSg?=
 =?iso-8859-1?Q?bBS1i1F06T0dNTx2axCWqy0J+7BGxtj7sE5OK59n0Ixoal+rEgRaF978PP?=
 =?iso-8859-1?Q?DmdCQp0fLxZJeft3wAzo2pXM5kMrUzlA5WqIHf1LIwctHQh2ZKrDDB5wgp?=
 =?iso-8859-1?Q?4iOACFJ4+PBtOv8DECsMSQRMw+szkR6WGiQuGHBLvA14B7dHrx9BNZvsOd?=
 =?iso-8859-1?Q?2T2Zf/fJemYRtFqKW+Iup1fVkOpEPbh7IjfVQB/KTiE64kUQ4YbXdLnivq?=
 =?iso-8859-1?Q?fJVD6MYAtwaL+4VcVlYojxzkHNWe5Gfmtr3hQvxU9tYRghOem5ShQczUUQ?=
 =?iso-8859-1?Q?Zy56NGlVVFtTVWQHogHoR9WOYRxqYpjmB5H0WLp9gtVpAlNckG5gUZhNOB?=
 =?iso-8859-1?Q?7Muw9S55Sseq8nRqYlSdh3Q7yBlcjdl4wCfLEm8F4zc6g5m7PA2m6n/WhD?=
 =?iso-8859-1?Q?zQ2NvIOcBhwZwRf4S5Eg8sMW7ORbuKfpa02ua388xkJxQZLsH8cemy59Lj?=
 =?iso-8859-1?Q?XYptQchU2aERFzIKcRssI64Hd96MoYg4lPv/fuqmS32+UqR5ur8aHsgatv?=
 =?iso-8859-1?Q?tPd1n13+18F+TBsPGQFxCccehPxwZie1caXTE7AqS2dsy3rjFT8F/pHq8c?=
 =?iso-8859-1?Q?5HDZqkNnbh3Ls6ttZft/+CDfkVBwXY3MrEHByLFQr16TBR4iPetWwEnwhd?=
 =?iso-8859-1?Q?6VQ5GdD44pyRbO3CHKAiCmQgU07D7MN/jO6h8Ozom/CkxfQQa4TVYqmn3a?=
 =?iso-8859-1?Q?bpG+addcj2L7J0ga9zBKjYMTzoi8650tv6w19taZMxvXkWEc5cTwThKkGO?=
 =?iso-8859-1?Q?AHS9m5X5an/+UkWag8BpmiN3HBfQ25ugy6trlqqNkKUozLsLvVepeflcA0?=
 =?iso-8859-1?Q?/3srI8dvw1EI5SB6CZ/SK1juyN70lzvcTp7gIEOpbJc1Tr/J2tT/HhAWDE?=
 =?iso-8859-1?Q?gqAp83PFKYqIM2e/McB/YwoC/t6jxr1Q0O+HMHrvsGX3jWCWX0bKLdoSgM?=
 =?iso-8859-1?Q?HF+hbSAZ9GwQk4u/UCZYqu+uQIdWdZVNV69k0pXy236DmgZqo9MF7tiNPE?=
 =?iso-8859-1?Q?VdKG78zsW5d+J6seeF8wtG/sJLYYLNpaUfs6pdd6d62fkdn/d4BvYtBcTL?=
 =?iso-8859-1?Q?EaQ9yksb3QuSDjj2MmUiJM6JBMg+mhKiU9BJoTArfeABhozySBcms4smy6?=
 =?iso-8859-1?Q?VWvqa/CYJ0xmCv1pOEKuwD4KztNOHMFjiWgPleNFazEbjGQ81RPAtcqW41?=
 =?iso-8859-1?Q?AyglhmxWem63RYSZkdJcAP7QSB7d7mLRSddDel+g8wi0t1YDvp0CywKyg2?=
 =?iso-8859-1?Q?K/U9rMTqrqM57rE0A0Iox7HFF2uq/r5IZTqHktdNQg9qb14NZqHIqwy3Jc?=
 =?iso-8859-1?Q?Ycm8rXyyxHN2kJINwEsQaBhUsxMkpnuSrc4KJSZt4iVOV9DYBiMWUI2rPO?=
 =?iso-8859-1?Q?7HxYp5cQfR94ufYfZePOATBh4SA3t0Ajk4uwbd015+jMZtq7KgPKp7ID+G?=
 =?iso-8859-1?Q?g3YBypv6veH3t/3oydoUT4TSWujGEBJPqOB573I0iRkJR8X3W2ARFgteae?=
 =?iso-8859-1?Q?3zszNH01JDrbpw82DRPZ1NNKdK6XENiqy03ImKNXsQjY19BH2Vk4HOEJF/?=
 =?iso-8859-1?Q?LcOomTnhaVC+lUfCrXzcMr7DeJwApc6Hg1//AhL26y8AiAawEDDe?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lieber.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4696.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e0979c-9cdb-4e61-6ca5-08df1a0bff7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 07:18:14.3045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 213667ce-a7c7-4f7f-ac87-9abccbddaa2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VzAZr19e70YnrRBK1W9/741Osn02m5LYRb8tC7oidBumodPA9lGGG7aqZLLsPt35
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR15MB5138

Hi,=0A=
=0A=
The Anker Prime Thunderbolt 5 dock reconnect-loops on an LG Gram with Meteo=
r Lake unless the thunderbolt module is loaded with clx=3D0. With the defau=
lt (clx=3DY) the router is found, TMU setup fails with -ENOTCONN, the USB3 =
and DisplayPort tunnels are aborted, and the router is dropped. That repeat=
s about once a second, including from a cold plug at boot.=0A=
=0A=
Hardware:=0A=
  Laptop: LG Gram 17Z90S-H.ADB9U1, Intel Core Ultra 7 155H=0A=
  Host router: 0000:00:0d.3 Intel Core Ultra 200 Series Thunderbolt DMA1=0A=
               [8086:7ec3] (rev 10), subsystem [1854:051d]=0A=
  Dock: Anker Prime Docking Station (14-in-1, 8K, Thunderbolt 5)=0A=
        kernel: vendor=3D0x1ea device=3D0x83b5=0A=
        bolt uuid: 8ab48780-00ce-1da2-ffff-ffffffffffff=0A=
        negotiated link: 40 Gb/s =3D 2 lanes * 20 Gb/s (TB4 fallback)=0A=
  Retimer on the host port: vendor=3D0x8087 device=3D0xd9c=0A=
  External display behind the dock: LG ULTRAFINE, 3840x2160=0A=
=0A=
Software:=0A=
  Linux anarchy 7.2.5-3-omarchy #1 SMP PREEMPT_DYNAMIC Mon, 14 Sep 2026=0A=
  This is the Omarchy build of 7.2.5. modinfo reports clx as "allow low=0A=
  power states on the high-speed lanes (default: true)". The published=0A=
  linux-omarchy patch set does not touch drivers/thunderbolt/. bolt 0.9.11.=
=0A=
  thunderbolt.host_reset was Y. pcie_aspm=3Doff was not set.=0A=
=0A=
What happens with clx=3DY, dock already plugged in at boot:=0A=
=0A=
  thunderbolt 0-1: new device found, vendor=3D0x1ea device=3D0x83b5=0A=
  thunderbolt 0-1: Anker Prime Docking Station (14-in-1, 8K, Thunderbolt 5)=
=0A=
  thunderbolt 0-0:1.1: new retimer found, vendor=3D0x8087 device=3D0xd9c=0A=
  thunderbolt 0000:00:0d.3: 1: TMU: failed to enable mode uni-directional, =
LowRes: -107=0A=
  thunderbolt 0000:00:0d.3: 1: failed to enable TMU=0A=
  thunderbolt 0000:00:0d.3: 1: USB3 tunnel creation failed=0A=
  thunderbolt 0000:00:0d.3: 1:12: DP tunnel activation failed, aborting=0A=
  thunderbolt 0000:00:0d.3: 1:12: DP tunnel activation failed, aborting=0A=
  thunderbolt 0-0:1.1: retimer disconnected=0A=
  thunderbolt 0-1: device disconnected=0A=
=0A=
The same sequence then repeats. While bolt policy was iommu, boltd also log=
ged=0A=
"auto-auth: authorization failed: kernel error: write error: Input/output e=
rror"=0A=
and the kernel additionally logged "PCIe tunnel activation failed, aborting=
".=0A=
Setting the stored bolt policy to manual stopped those authorization attemp=
ts.=0A=
The TMU / USB3 / DP disconnect loop continued with the router left at=0A=
authorized=3D0.=0A=
=0A=
Workaround, same boot, no dock power cycle:=0A=
=0A=
  modprobe -r thunderbolt   (typec consumers unloaded first)=0A=
  modprobe thunderbolt clx=3D0=0A=
=0A=
After that, /sys/module/thunderbolt/parameters/clx reads N, the router stay=
s=0A=
connected, DP-1 comes up at 3840x2160, and the dock USB3 hub, keyboard, and=
=0A=
mouse enumerate. No further TMU or tunnel failures. Authorizing the router=
=0A=
with boltctl after that succeeded on the first try. host_reset was left at =
Y.=0A=
=0A=
This looks like the same class of failure as Launchpad 2165852 (AMD Rembran=
dt=0A=
plus a ThinkPad TB4 dock, Goshen Ridge 0108:2031), which also loops on=0A=
"failed to enable TMU" / "USB3 tunnel creation failed" unless thunderbolt.c=
lx=3D0.=0A=
The pair here is different: Meteor Lake host 8086:7ec3 and Anker router=0A=
1ea:83b5. QUIRK_NO_CLX already exists; this router does not hit it.=0A=
=0A=
I can retest with thunderbolt.dyndbg=3D+p or try a patch if that is useful.=
=0A=
=0A=
Thanks,=0A=
Kurt=0A=
