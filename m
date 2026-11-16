Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794813781;
	b=RDk23MohqREyp1ykWK7e6RFVXas2lpBPKTXYbAL7unJLRA+ivXYsRMaRkbhRhEefYzpV
	 bsBoFXBF4pzJXrHXFF+aGRtOuGG9RNUMNmOruLkvYNkw39irveqo7CT4SGcmut8i719W5
	 zmWZBhkXmJ8EvGq1dLu9rtOJ3b0Nm8IqaKsVgofdeVhggTXMD25GYRGMvBOO7rQ02Qvnn
	 yoEBGVBjZuDFP6fg2oy8i7q4vQrlly+B7XqpfcBC7AfJx4wDi4WJk7S40thMDm5GK1WLQ
	 rSoTNz3ygRj8Udifk6CiF7lxumz7HUxJUWY4ysIhsFiaV2uf6FqeXpGOeNy90y7gaWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813781;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-exchange-messagesentrepresentingtype:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yfgb5wq5Mso+0Pqp4+QpSHlNz57OfT0c+RIOAtKBXNI=;
	b=B4KJAjbcUWwoc+y1YlP+4u59HJcr7CY9s2GVcSlzyrrG8zYN+/RyQMLEd11ZmUDwtbuv
	 24A48zkfybmFbzB/MaibRBA6k1Mrtw0ZyeOqt5Sh7S1Pd4VSgJR3oW1e/qsOPUxgkD5OO
	 OXTaXubFbMDMZgQmHQFti9SCKQNCwunwwHD2s/Ah/cQlQ86tdMpig5nXRRN+Cd611anb3
	 Wg071noW1j57hAa/SNlt3J8eMOvx+/UjGnaXg/1okpoF7+R10BZRptHQniu9P8bSNuImP
	 k/AhwcR2hLm+IDnBKAY8zf14V0OBXmYImjsxl82nFhh1QF6y6gAlGtQloogR3g5+Y2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=MlTRhTMM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.25
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011025.outbound.protection.outlook.com [52.103.14.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605F8606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 605F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=MlTRhTMM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkqHHXdTAE3yqXAIgbCmw356DW9V7ZdP+m4mmOETVp4ds67SfIHRvIfp3QymYw5ok1oRlhtzuYmL+C3s1uver01acYpbLn1bOHOD/OlHUXsgYc3y0FPSc+A55R/4IFxrunJNmeQlKmFqpA3r1tjS/JCwdlHeyRP1viqRJhuBGF26cuIRmY7HIuNWb2OS8T9oTWGbpkJ8PzPUF3OyE0rGBzi0q35bk7DcNIh67AYsYyGHMeaGhx0X3tl5XJxY6G98X0SlWhPcfFqwEOnkTKG+EVXhH8vWwvJep+mvj4hclA23OtTw24+j2SD/7j8cgzWYzuafO9FmHYnW6+N9ZA4ZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfgb5wq5Mso+0Pqp4+QpSHlNz57OfT0c+RIOAtKBXNI=;
 b=xjsNWdhoS0Yp6zQ+n/JjD7P/iPdHt0rv3ftx6LGijL9GVTzutWn1eHPnDeRk1rzCguoiGIWia0lG99m81BQ1u6+7xFqkSy78kmVW+lESB6a5dse+cN7/rsQchfeYeF99l/+G50r+G6NXtp53iJHsYd2ugGJ6CIQ7aowt+8bqlkEoggDonDSm4QAKW715DA9FsCVbOIsglJZa/GobLbpRKjir+d4f/x0+bSj/zDl//s7DltzhG1GNNm3/ZRHgeY1IcpZWDCROQHThaG3UJAO5A9X6kfmqVjs9cqSAaRyKMt3ZXjXtfnuXHEnif3QaFf31cNvlEHt9EtpHTONmY/Fnew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfgb5wq5Mso+0Pqp4+QpSHlNz57OfT0c+RIOAtKBXNI=;
 b=MlTRhTMMWEyUdnzybdeisfdTn9tfmcaAk9xwGF13wXyfi1bDMlHTSdJORDSXJ+d0AJZBg2idevzjJpiyYRgks1+yBOtg4eVlTSFWYDnkTC8iWXmdXA7rcfiNmQgLk587fwAwlwTNb/U1MQ01MWipFyjyYypXTcU3TTZDBmjEqkemWbjzFJWzkiO+o8nCWrdpTAmRI8fMAnBKBYmHW8OKmLd7juwepryx3HojAAgUyGKWVU7HFGLOs1jfIkwvgSo0In3jZ6gfvKEUp3rr49QhQ+KGVqIdnnkCx05JeiRdsTIkVK1sbpXZopGeo0FDtsRbCWc/LisWo9TneHQ68gElsw==
Received: from LV2PR11MB370525.namprd11.prod.outlook.com
 (2603:10b6:408:422::19) by BN9PR11MB5275.namprd11.prod.outlook.com
 (2603:10b6:408:134::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 07:22:58 +0000
Received: from LV2PR11MB370525.namprd11.prod.outlook.com
 ([fe80::59c2:5a4b:ae31:944a]) by LV2PR11MB370525.namprd11.prod.outlook.com
 ([fe80::59c2:5a4b:ae31:944a%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 07:22:58 +0000
From: Miguel Ulloa <hanzox7@hotmail.com>
To: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
	"oneukum@suse.com" <oneukum@suse.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"hansg@kernel.org" <hansg@kernel.org>
Subject: [USB] ASUS 0b05:1932: UAS performance observations and cache sync
 errors on disconnect
Thread-Topic: [USB] ASUS 0b05:1932: UAS performance observations and cache
 sync errors on disconnect
Thread-Index: AQHddZhJBDUohrOpMUOMX9yZjfW66w==
Date: Mon, 16 Nov 2026 07:22:58 +0000
Message-ID:
 <LV2PR11MB370525AFE7C54D5793207BA767F27C2@LV2PR11MB370525.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB370525:EE_|BN9PR11MB5275:EE_
x-ms-office365-filtering-correlation-id: eea56ffd-2d34-4b2b-21b2-08df43b27103
x-microsoft-antispam:
 BCL:0;ARA:14566002|39105399006|4140399003|25010399006|12121999013|19110799012|8062599012|8060799015|24021099003|15080799012|15030799006|37011999003|22121099003|31061999003|40105399003|102099032|440099028|3412199025|26104999009;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?5p1VySt/wiPi9gxjy0GJWqfRn7XRr9prPFqByqyQ9yMK5TUlLKajiAws?=
 =?Windows-1252?Q?2fACG5RYlicX3FewzrJFkcUIvEiZnOaDkh059xQMy7fwp/s2xmLu7P/Z?=
 =?Windows-1252?Q?4Ezhju5q/HjWMV2wt9z+ub5v94YIZEZmH9rKytg/RbK+rtNULEzC03Zp?=
 =?Windows-1252?Q?g31LVdcw9izrfp5B75p1etPKbqh2413kTydTYa2P7cNRRsmHy4+Gnzoh?=
 =?Windows-1252?Q?JyJtRnTu3gQaahnOm8skbs7JeoDkcyXKq763QPrkPCRdK9DTOkRBYqs/?=
 =?Windows-1252?Q?QW5KT9GoDhV4JizSx1nRRBlw4c2Wt2rmgrFd4jFofZa8Uh3s4SISXCZ9?=
 =?Windows-1252?Q?oCLLJx8Bz8V7FP/+QCmMC8PoD2CdQc/cfvJaDYHTkymvYswB5tdi9oRi?=
 =?Windows-1252?Q?J8vZqV2y4drmg4wGloGWpG/lnylLZftKl+jMsRNkYjF5K0hvWs1Kcp1M?=
 =?Windows-1252?Q?IiTCZBa6q98HrhLyw/yVPAsV8O1yv34MNDZDBzafPL19MVwvGyRAACjU?=
 =?Windows-1252?Q?gsLv9KZjehbY2Bh1idV6ttmLt/5jiOEumJJH21bU6Y2aA/yiTMnhuD0u?=
 =?Windows-1252?Q?0cMovd64d0hYg8VgofzAfSLM1w+KI1Bt2r/dHBYnXQ5U3MvsN4QTFlE/?=
 =?Windows-1252?Q?cpmEwEg0z59iNt39Fki3Zp/og4mCmtS7qGP76U6PRhdG4U5Fi1g5HQko?=
 =?Windows-1252?Q?mGL9KD7Q5gg+1nVnNWgomnSqbPsVsOGa2afzbra0Ezic6nShOv2INzkX?=
 =?Windows-1252?Q?lAkpACwZXb/DROWm8ALPAHWUElmMeP+3g22ibJCr1p4KLqQWaII0Y8Me?=
 =?Windows-1252?Q?eKHBJ5E84CjnI65ZDIlfFSH6KITQtloUZzUhmVvbAXoS4GwGFpqr/9rr?=
 =?Windows-1252?Q?JLzVV+B9HPFxIg+tfeDnvm5rIwH37fzSJKLrjJgEZoSbB9LsXJyzB8vQ?=
 =?Windows-1252?Q?V3DEtmqjmjD0KxOH12Qd9Rx+h3Dbu7ESMqt+s5w8iXGYD9q/uTtRPN0S?=
 =?Windows-1252?Q?ScxOgEDpcQsV6NX6P17F40E3fNctTV/BmW7EzkmjFpLhl9qWAK8V3qKj?=
 =?Windows-1252?Q?2FwjXbV3izGzJVUL1ge1NTENKtW+dq9WBOFnmbbjVm/dmBcHtp4MtroL?=
 =?Windows-1252?Q?CHCIzMgYay1KZcS8BwnGdeBc?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?/aDsELLj5ajquhtBqqM9PuB2EdQFHaO8z5cB4RvSPffhcJmSCPN4QmPY?=
 =?Windows-1252?Q?Z8DSdHeQDNHgfMEAtbvPL3tdIvIkgdWccmhzgNhVDLFIMRNl2VcMCXZx?=
 =?Windows-1252?Q?zIRNcHJ/nEil4DNTi8HOIsdQGMK+mvShCZuFoVoeFue7q+CaPD/i/mYA?=
 =?Windows-1252?Q?pj9n4OuJGhgskUABVJFS4+tkV503Wu+GIGAh76l8kqCQkChma2pcTDCe?=
 =?Windows-1252?Q?UVb+deueJPQCrNxxMxWTOUlDXmrtwmdAMtfH/S7udQOSKRy7HRXUe2x9?=
 =?Windows-1252?Q?DgzSV+UeOF6p4q7bxToXZLkYfmanxXE3Td217fs+8eZ0KMj3rJVcOVMh?=
 =?Windows-1252?Q?BcGFc8MgbbBorT67XKi3xmKyr1OQNtash9MpK6L32rwcwWucw4nSzC2j?=
 =?Windows-1252?Q?KjZkor+nTnhieXbm1P1Z05EnnveGE5frqIN/28p1XZdIR9RPLL2fQ+5G?=
 =?Windows-1252?Q?JsPHETzWZ8qvfJ9oxKr0rT2/TJbYSBOC8C+eqHqE1LeEQtqH0t5/9kBB?=
 =?Windows-1252?Q?hKUPnOSiwITbrMcVa9LcMek4IoI+rmZ8TofLFAYoPLpFDbfm/t1iMzKO?=
 =?Windows-1252?Q?xQFAOZOTXlEede/BEKBCJ6PuGGMkzIfMokASCr72yYE4pnJEGbDu1j2f?=
 =?Windows-1252?Q?jHsgNH0Wocf60WAMKL9ma3Bjm2VKYjuHX987AOJWYDOyFS6nJSzkss/P?=
 =?Windows-1252?Q?7KuQGjLjdo5WLvKErkfKDYqgMVLugmbIxmvkIfBudWktoJodgnKsa29V?=
 =?Windows-1252?Q?DUMKife4x0v54QZ+PPRk4yvACrQZk5hYgtZGC4/Aka97ISghrI56++aN?=
 =?Windows-1252?Q?Q3ph4eTT/p1rnUaQgB63OuC81YUn990ntLsHB2u7mmyGhtVfaCBIKGUm?=
 =?Windows-1252?Q?wovAc1E3gpiRDTQrHylVOMfCzTzivUKeiVMAQ7KedK8h1jlaYaKMc/rQ?=
 =?Windows-1252?Q?gj2W9dQfUOF20BRnOrKkizb/cOkwMkj/DlGHP3B7lXs+bGtrt+w4ekgp?=
 =?Windows-1252?Q?S2xTVExk7yvzPLFFVqXqQ8YvnsdURVeZPbuSKKefFu9Qebg38GxE8R4N?=
 =?Windows-1252?Q?muyVstprw+3EyW/E/8PKqaZ+SqvCw+M8iJ8l9uP+sQWxXjxWDV/mXkGm?=
 =?Windows-1252?Q?WNY1K6jBKX2K6yypS7NRb9u6WQNEUat3J1ikV+CYFgkx8c+n13fuyfMs?=
 =?Windows-1252?Q?oU93eX0Ly5somnF4fuD9559oIQZQYSvm7gcVW6NTo26fek5DvpoUOZ5/?=
 =?Windows-1252?Q?7Iu2ty/sU3wOiQ1v4a1cKEm3bBoTit5TgYCZRg9jTf/xJf8yApRJIkdu?=
 =?Windows-1252?Q?dmss8b0jLo6gHjjkBvQ+PWjXOXC0Ems041DfvOunUJm7G064YWKKAkQj?=
 =?Windows-1252?Q?XV2+HLlQgkg+p8BAVsNlkIF6UbFzaSH6ZRJdHd3DhXbIn1l273ASJ33b?=
 =?Windows-1252?Q?Ap0fn6Vf02SPhqm33QkWrrjrfxX6xUN5f5QRVqjiicg=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-a6b68.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB370525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: eea56ffd-2d34-4b2b-21b2-08df43b27103
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 07:22:58.8805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5275

Hello,=0A=
=0A=
I would like to share some observations from testing two ASUS ROG Strix Ari=
on NVMe enclosures (USB VID:PID 0b05:1932) under Linux, particularly in rel=
ation to the existing US_FL_IGNORE_UAS quirk.=0A=
=0A=
My intention is to provide reproducible test results and a separate observa=
tion concerning UAS device shutdown behavior, in case either is useful to t=
he maintainers.=0A=
=0A=
Background=0A=
=0A=
The existing quirk was introduced in commit: c61feaee68b9735be06f162bc046c7=
f1959efb0c=0A=
usb: storage: Add ASUS 0x0b05:0x1932 to IGNORE_UAS=0A=
=0A=
The commit describes write throughput of approximately 20 MB/s under UAS, c=
ompared with more than 40 MB/s using USB mass-storage BOT, measured using G=
NOME Disks.=0A=
=0A=
I wanted to investigate whether this behavior could be reproduced with two =
Arion enclosures I own, using both fio and GNOME Disks.=0A=
=0A=
1. Test environment=0A=
=0A=
    Distribution: Fedora 44 Live USB=0A=
    Kernel: 6.19.10-300.fc44.x86_64=0A=
    Motherboard: ASUS ROG Strix B550-I Gaming=0A=
    CPU: AMD Ryzen 7 5800X=0A=
    USB host controller: xHCI, PCI 0000:02:00.0=0A=
    USB 2.0 test path: 1-7, 480 Mbps=0A=
    USB 3.x test path: 2-2, 10Gbps=0A=
    fio: 3.40=0A=
    lspci -nnk -s 02:00.0=0A=
    02:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 500 S=
eries Chipset USB 3.1 XHCI Controller [1022:43ee]=0A=
           Subsystem: ASMedia Technology Inc. ASM1042A USB 3.0 Host Control=
ler [1b21:1142]=0A=
           Kernel driver in use: xhci_hcd=0A=
           Kernel modules: xhci_pci=0A=
=0A=
Two devices were tested:=0A=
=0A=
Device A =97 ASUS ROG Strix Arion ESD-S1C=0A=
=0A=
    VID:PID: 0b05:1932=0A=
    bcdDevice: 0x0100=0A=
    Enclosure serial: T8D0NT000170=0A=
    SSD: Kingston NV1 250GB (KINGSTON SNVS250G)=0A=
    SSD firmware: S8H40103=0A=
=0A=
Device B =97 ASUS ROG Strix Arion ESD-S1CL=0A=
=0A=
    VID:PID: 0b05:1932=0A=
    bcdDevice: 0x0100=0A=
    Enclosure serial: LBD0MS001218=0A=
    SSD: Kingston NV3 500GB (KINGSTON SNV3S500G)=0A=
=0A=
Both devices expose BOT and UAS interface alternate settings. UAS successfu=
lly bound at both USB 2.0 and 10Gbps speeds.=0A=
The USB 2.0 tests used the same physical USB port and original ASUS cable f=
or both enclosures.=0A=
Transport selection was controlled through the runtime usb-storage.quirks p=
arameter:=0A=
=0A=
    BOT: 0b05:1932:u=0A=
    UAS: 0b05:1932:=0A=
=0A=
The device was reconnected after each transport change, and the actual driv=
er binding was verified before testing.=0A=
=0A=
2. Benchmark methodology and tooling=0A=
=0A=
For transparency, I used an AI assistant (ChatGPT) to help investigate the =
original kernel quirk, design the test methodology, generate the Python ben=
chmark harnesses, and analyze the collected results. The AI-assisted harnes=
ses served primarily to automate fio execution, enforce device-identity and=
 safety checks, capture logs, and maintain consistent test parameters. =0A=
=0A=
I executed the tests locally, confirmed the hardware configuration and tran=
sport bindings, and reviewed the resulting measurements and kernel messages=
. The complete harness source code, fio command lines, JSON results, and re=
levant logs have been preserved and are available for independent inspectio=
n. The fio tests used direct raw-block I/O against the two explicitly desig=
nated test SSDs, followed by CRC32C verification.=0A=
=0A=
Key parameters:=0A=
=0A=
    Offset: 16 GiB=0A=
    I/O engine: libaio=0A=
    Direct I/O enabled=0A=
    Queue depth: 1=0A=
    One job=0A=
    Block size: 64 KiB at USB 2.0; 128 KiB at 10Gbps=0A=
    end_fsync=3D1=0A=
    CRC32C verification enabled=0A=
=0A=
Before destructive operations, the harness checked enclosure identity, unde=
rlying SSD model and serial number, capacity, filesystem mounts, block-devi=
ce holders, USB topology, transfer limits, and active transport.=0A=
=0A=
The harness also required explicit authorization before each destructive te=
st series and automatically disarmed afterward.=0A=
=0A=
Kernel-log deltas and fio JSON output were retained for each trial.=0A=
=0A=
3. USB 2.0 fio results=0A=
=0A=
Three sustained 256 MiB trials were completed per transport, per enclosure.=
 Average throughput in MiB/s:=0A=
=0A=
ESD-S1C / NV1 / BOT / 38.52 (read) / 38.54 (write)=0A=
ESD-S1C / NV1 / UAS 37.59 (read) / 38.19 (write)=0A=
ESD-S1CL / NV3 / BOT / 39.24 (read) / 37.77 (write)=0A=
ESD-S1CL / NV3 / UAS / 38.10 (read) / 37.45 (write)=0A=
=0A=
All twelve trials completed with successful CRC32C verification, zero fio e=
rrors, and no new kernel messages during the measured workloads. BOT was sl=
ightly faster than UAS in these particular fio tests, but neither enclosure=
 exhibited the severe write-throughput regression described in the original=
 commit.=0A=
=0A=
4. USB 3.x fio results=0A=
=0A=
The ESD-S1C / Kingston NV1 was also tested at 10Gbps, using four 4 GiB tria=
ls per transport. Average throughput in MiB/s:=0A=
=0A=
BOT / 425.5 (write) / 422.0 (verified read)=0A=
UAS / 438.5 (write) / 529.7 (verified read)=0A=
=0A=
All eight trials passed verification without new kernel messages during the=
 measured workloads. Under these conditions, UAS provided approximately 25.=
5% higher read throughput. The write advantage was comparatively modest.=0A=
=0A=
5. GNOME Disks comparison=0A=
=0A=
Because the original quirk was motivated by GNOME Disks results, I also ran=
 its built-in benchmark on the ESD-S1CL / Kingston NV3 at USB 2.0 speed.=0A=
=0A=
Configuration:=0A=
=0A=
    100 transfer-rate samples=0A=
    10 MiB per sample=0A=
    Write benchmark enabled=0A=
    100 access-time samples=0A=
=0A=
Results in decimal MB/s:=0A=
=0A=
BOT / 42.9 (avg read) / 38.7 (avg write) / 0.19 ms (avg access time)=0A=
UAS / 44.7 (avg read) / 44.4 (avg write) / 0.19 ms (avg access time)=0A=
	=0A=
In this test, UAS write throughput was approximately 14.7% higher than BOT.=
 The throughput curves were stable across the sampled disk regions, without=
 apparent sustained drops. This comparison consists of one GNOME Disks run =
per transport, so the magnitude of the advantage should not be treated as s=
tatistically established. Nevertheless, the historical severe slowdown was =
not reproduced using the same benchmarking application.=0A=
=0A=
6. Separate observation: UAS cache synchronization during shutdown=0A=
=0A=
During testing, I observed repeated kernel messages of the following form w=
hen powering off the enclosures under UAS using udisksctl power-off:=0A=
=0A=
Synchronize Cache(10) failed: Result: hostbyte=3DDID_ERROR driverbyte=3DDRI=
VER_OK=0A=
=0A=
The behavior occurred on both enclosures, including USB 2.0 and 10Gbps conn=
ections.=0A=
=0A=
On the ESD-S1CL at USB 2.0 speed, I performed an additional controlled comp=
arison.=0A=
=0A=
First, I issued an explicit SCSI SYNCHRONIZE CACHE operation while the devi=
ce was operating normally:=0A=
=0A=
sg_sync /dev/disk/by-id/usb-ROG_ESD-S1CL_LBD0MS001218-0:0=0A=
=0A=
This returned exit status 0 without new kernel errors. However, a subsequen=
t udisksctl power-off under UAS again produced a synchronization failure.=
=0A=
=0A=
Relevant log excerpt:=0A=
=0A=
[12747.506653] sd 7:0:0:0: [sda] tag#4 uas_zap_pending 0 uas-tag 2 inflight=
: CMD=0A=
[12747.506660] sd 7:0:0:0: [sda] tag#4 CDB: Inquiry 12 00 00 00 24 00=0A=
[12747.530478] sd 7:0:0:0: [sda] Synchronizing SCSI cache=0A=
[12747.701182] sd 7:0:0:0: [sda] Synchronize Cache(10) failed: Result: host=
byte=3DDID_ERROR driverbyte=3DDRIVER_OK=0A=
[12748.272224] usb 1-7: USB disconnect, device number 10=0A=
=0A=
Another UAS shutdown showed the USB disconnect occurring before the failed =
cache synchronization. I then repeated the explicit sg_sync followed by udi=
sksctl power-off, using BOT on the same enclosure, cable and USB port. The =
resulting kernel log showed:=0A=
=0A=
[13086.039925] sd 7:0:0:0: [sda] Synchronizing SCSI cache=0A=
[13086.279074] usb 1-7: USB disconnect, device number 12=0A=
=0A=
No corresponding cache-synchronization error was reported under BOT in that=
 comparison.=0A=
These observations suggest a possible interaction between UAS device teardo=
wn and cache synchronization. However, I cannot determine whether the cause=
 lies in the bridge firmware, driver behavior, or device shutdown sequencin=
g. I have not observed evidence of data loss, and I do not want to imply th=
at these messages establish a data-integrity defect. Explicit synchronizati=
on while the device was operational succeeded.=0A=
=0A=
7. Scope and limitations=0A=
=0A=
The results are limited to two physical enclosures, two SSD models, the sta=
ted Linux kernel, and the specific USB host-controller configuration. Both =
enclosures advertise USB device revision 0x0100. The fio tests used queue d=
epth 1 and controlled block sizes; they do not exhaustively characterize ev=
ery UAS workload, command-queueing scenario, or long-term reliability condi=
tion. The GNOME Disks comparison was not replicated across multiple runs pe=
r transport. =0A=
=0A=
The cache-synchronization observations were associated with device shutdown=
 rather than failures during the sustained benchmark workloads. Their under=
lying cause remains undetermined. Consequently, these results should not be=
 interpreted as proof that the existing UAS quirk can safely be removed for=
 all devices sharing this VID:PID.=0A=
=0A=
8. Questions for maintainers=0A=
=0A=
I would appreciate any feedback on the following:=0A=
=0A=
1. Are these findings useful for evaluating the continued scope of the US_F=
L_IGNORE_UAS quirk for 0b05:1932?=0A=
2. Is the cache-synchronization failure during udisksctl power-off a known =
or expected consequence of UAS device teardown, or does it warrant further =
investigation?=0A=
3. Would any additional traces, kernel configurations, or more targeted tes=
ts help clarify either observation?=0A=
=0A=
I have preserved the complete benchmark results, fio JSON, command lines, k=
ernel logs, USB descriptors for both enclosures, SSD identification, GNOME =
Disks screenshots, the AI-assisted benchmark harness source code, and a rep=
roducibility manifest. I can provide the supporting files or perform additi=
onal tests if any of these observations warrant closer examination. I'm sha=
ring these findings for consideration and leave the interpretation and any =
potential changes entirely to the maintainers. Thank you for your time and =
for your work on Linux USB storage.=0A=
=0A=
Best regards,=0A=
________________________________________=0A=
Miguel Ulloa=0A=
=0A=
=0A=
