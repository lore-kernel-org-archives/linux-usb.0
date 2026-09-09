Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020128.outbound.protection.outlook.com [52.101.69.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51936524AE1
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950297; cv=fail; b=YFvNnJ7g5roGWH5yTEYluhAsYGowfK5XNgDenJrt8chV58tQnwMcy25fTg4duBvvJitAFRhR9Eqn80Sn4OjXCVhRJd5tVVjEa1L93JJMER9HvEQpEsADsGpvDB3iPzGFiM4Oyz5CryKm5mM7MTIO/gj0peAJK3U/DjSnXpY75xk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950297; c=relaxed/simple;
	bh=d4DyUqj/o0g/7uHhr/vvSBm6MMNorLe459a8uGTztZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cac/iDxYBUZjXoLXXkT4+O57isYiJRk0NQ8YX1MeGUr/YozMRwvRoEsm5XCfgyrzX6zP6Lx9NvBnL4sJMRuq03vvW2yZ55zaMAfm2LiViJzed4ITBT+US+h6PN2U5+aW3P/klzQBEyWE6VMJ1i8xhUbXd5gjFuFdXCVaEyerqWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gofore.com; spf=pass smtp.mailfrom=gofore.com; dkim=pass (1024-bit key) header.d=gofore.com header.i=@gofore.com header.b=qmEDYacs; arc=fail smtp.client-ip=52.101.69.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gofore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gofore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gofore.com header.i=@gofore.com header.b="qmEDYacs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VR7gEDU10UhLrfxITVM5MLYBd4OUkoGWrd0FP3sAkkzkziKehZ9tDQu+G/912JGmcsKV4igE89me6dPkbP17C33BKp2SsBOjMyYL6z1VkXvNCCzjbZyj3HHpOcEnnq+RLQG2Xj0HMaq0vHBUj1aUZiU9SunFAgjfEaGu5g66r5HT5IFrOtw7QK7Xu3mRMAYMcPqcjFjSi4lb5HDGSshT43bFy4PoHMjDYx0LzdynUEigueXNpAu5lymnhtNrOfmmZqJUteMjJqv7GVFTsDw5s8AEoIZVUmfXXaEns4ursRToHWDFcgSuPr9ukOqeP0XudFbs3khewu4j5RRfdyjcZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osjUxWMkzxkwOgkNFRmlcuVQjXBt43HgY3wYSRLj6Ak=;
 b=BYqtk1K9AXqSTUakZFBRSJPa1T8uMXcSdSJCNuxCCUAbEKI+2mW1TTt+MHE3tJ5woDoccvjjztiDMzg0DBi21r3ZnXjld1jnfb+6Pl/Twz8rrKC0TzmnZTKf4sCUsklj8hoAbwqXftY8+4GQbIdSb+1gkRnwWtbw9peDIJD5PX+jpPy4Ffg/prcU56pLVLx0rrN+W6zHgNUj7FID+GxmR4qOkqclPxPH03HWacNQhIzvAY9cdPtrbHmU6xi4ljOmJqVjkBtAu0xGzh3ZRpZM73GX06iDmWaywG8jRtCPvSu2SX/n0XnIz61H+sFHicgmazJxuoZ12ivd6M+751ViYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gofore.com; dmarc=pass action=none header.from=gofore.com;
 dkim=pass header.d=gofore.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gofore.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osjUxWMkzxkwOgkNFRmlcuVQjXBt43HgY3wYSRLj6Ak=;
 b=qmEDYacs1EIoCYukOTshlGDMtFJElpV86Z50l4duVVL3hRp/SdoWw/NMDZcTsguQJlrs+I85FV4GmpGmI3lojO36SwD+Fi2RNHefjKgcWJjcdf1ZJEcKpat9rVNxLqsMhkaka84ZK+gAz8VwcK9bskugbMH8T5PCmxLaNlvCrvo=
Received: from GV2PR05MB10593.eurprd05.prod.outlook.com (2603:10a6:150:d6::7)
 by GVXPR05MB12372.eurprd05.prod.outlook.com (2603:10a6:150:312::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 10:38:11 +0000
Received: from GV2PR05MB10593.eurprd05.prod.outlook.com
 ([fe80::ed4c:d85b:4bc3:fd2c]) by GV2PR05MB10593.eurprd05.prod.outlook.com
 ([fe80::ed4c:d85b:4bc3:fd2c%4]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 10:38:10 +0000
From: Markus Mikonsaari <markus.mikonsaari@gofore.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "valentina.manea.m@gmail.com" <valentina.manea.m@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "i@zenithal.me" <i@zenithal.me>
Subject: Re: [PATCH] usbip: fix number_of_packets corruption for
 non-isochronous transfers
Thread-Topic: [PATCH] usbip: fix number_of_packets corruption for
 non-isochronous transfers
Thread-Index: AQHdQDe6DOTU2D9CoUGg+zPbWBqvNrbGDNKO
Date: Wed, 9 Sep 2026 10:38:09 +0000
Message-ID:
 <GV2PR05MB105932AA67BD25982761D290998B02@GV2PR05MB10593.eurprd05.prod.outlook.com>
References:
 <GV2PR05MB10593A82388157FCA3397879898B02@GV2PR05MB10593.eurprd05.prod.outlook.com>
 <2026090926-blunt-lushness-1012@gregkh>
In-Reply-To: <2026090926-blunt-lushness-1012@gregkh>
Accept-Language: en-US, en-FI
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gofore.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR05MB10593:EE_|GVXPR05MB12372:EE_
x-ms-office365-filtering-correlation-id: 83f51e98-96c0-454a-0741-08df0e5e713f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Bqoh34KNVSgP/pcmtclrAdOGjic/aPXnJGICzJhLZRvThwPzxmOfZ7MYPGh5EDVt6w7YZ/PJB0qzeaiSzlGAaEU4X1KFlXMCbnzn9HXux4XQ45556hti/VVkLxzrKv9Qh9UXUxvQ25vpv6TOEZYcrkADSjh8NPWYHu6kjEgYmRyYrLLVYr3kzU8EhSg8G2Do82v88DbaG58AXAQYKPkC7r31TkqW53ilQ441RIgI+YKilcQXfa57BLRnpNeVLapZCQLQ0tAz4KXLfJ5TUSnGiSQP2BtXurti8AN/Gx2OZSJ+hE3EJTns2zH0eXvERWTAu+g7wUhJVNC35MJaHeqlIcpv79rjGYuby/EQyLOIfY+oZnTQTfXsB8qloQic81NdjvA8UZR5xJdY4bcweIxMx1aRA4RT5KFtG8zcp/gRoXZuC35g82IgplgygsFmHlqY81TEfvS2so54GcSL8ARe9pPw8tg3aNNSAMfSDxKVc0TQqyRUx0WRhmP/u3AwFLe8RyKyTeRvtO4xMI9mvGQmzLjb20oWL8NGVs7jQNE2rFeZCVO1hzWYDM0CbSYeIu1en45ojyFkvVoBm8Sv241cCwv9Bnff9ZgrR1Y8Ye3SdxparnYuUyah3KWBWVp5lH6X9+osFUtt9mc8fDyPNvYAbu14ue1EK17iv5j41YSgRWqesYHWGhsHVPERChTtV9hDW7m3MK8bprQTv4szTk21+QdKaU8g7f+L4ExHA7fW8oA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR05MB10593.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ew7OqbnnY1XIrMEzha+BZnWu+TjgFz+y/24VYYrHBqQPMFrCH8v1gL92jd?=
 =?iso-8859-1?Q?w9kXKK6iK+rxr46NLCOZSgWoszyNRhJO3DOKmg+QLBw67OWxE/2qSVEm9p?=
 =?iso-8859-1?Q?1qrXrAgbRRrVmYdb12XNeSX6nxWYi0ORBEqyi2tnP3rM3wbdbJOH+7JUyJ?=
 =?iso-8859-1?Q?H66ejUgUNNrEQlAWtRl8LudSy7JF1C6fU1g0hdiL2VLpEDhLBZ2t/5wEJf?=
 =?iso-8859-1?Q?LqsNhp+lj/bivlqCKHCjsDY2j3qDIOjNsFF+bo5UDvpkqy/HFS0HOLKioS?=
 =?iso-8859-1?Q?obbDLi0f5N48uZnxX0Yi/2eOdpHO00fkQSPuRjM3K3eOSWo/EMfn253MtZ?=
 =?iso-8859-1?Q?W3jjtQQc6efEiahrqX5BYJoL56em5OQnbSc3gogCEyN37WHyZSNgRr6KOr?=
 =?iso-8859-1?Q?U00aIGyMU7k7M24cr4k3PmClWN5Mkq0jy2Rxp4wBxFf+v+78+CCS2rWjoc?=
 =?iso-8859-1?Q?A1eBqJenXB3L7OPYYKrR51fJhYyMebKPzcDPO/Km6sQffMofy3SEqDH02s?=
 =?iso-8859-1?Q?cUdlVelHTsxo4R5uacGaRot5vIRhbzYIGBXV+mpdMu9/Dk8wzz6VZ8pMTj?=
 =?iso-8859-1?Q?tg7OTVcWJ0OiGUr+GoYeo+3png3VO08GuijMCptLMkcpg5wWZhnNPoYnG9?=
 =?iso-8859-1?Q?y08QkB/mNni7+mPDJ1h+wD6czMYeszyxbQrOBhLEVCoL4BVEA8vvlqLfuv?=
 =?iso-8859-1?Q?g9fYph2mOM1Hj7f+tSWwW//1os7Wgiu1iV5n9o78kd+PezZP9aSu2n4pin?=
 =?iso-8859-1?Q?BWyCdko9Au1D5jGNlRgcaMrFE8xMNFgppAUIi2Ni/wnyZ+C1gciwWk1/Im?=
 =?iso-8859-1?Q?gS2NkXJYfPjElKQxYXY/FhVy8z32q4/sxVvwVD1ahSnx8+YZfbkmpCsJnW?=
 =?iso-8859-1?Q?rS6tpTh7sy69T0SU7C2sdYnJmm9DPnhlZBT1ry7uGxcbbhqtRH96Fx7Sk7?=
 =?iso-8859-1?Q?Ej1lRab7QFRuBUJL6HQhZ7lTT37AAFlQb1FPn0kXp/FFfeCsh7UbvmHQ87?=
 =?iso-8859-1?Q?sbCItj5T5tq1tC9c3Xhhgd6nwnfoC0G6b44XrUECehcLj9bxjnhaE6dTPG?=
 =?iso-8859-1?Q?bPojzy1adzVZzygjiEFSFzz+s0J3NheP5dPWv7usU1NCkDFD+TK0J7Hodg?=
 =?iso-8859-1?Q?T016iYCV3I4bTXZtzemfN+75ojBkjBpq6rhYMguASUuZQEz5XATLxYi24I?=
 =?iso-8859-1?Q?lTBKeL7E6YsJx4Pp3147d09P5nofbgFfd/qf1+xWYA3HHyvnYFaDWh2zkH?=
 =?iso-8859-1?Q?LrvaOwSLam2TEV6GY0cbukg04q8UzaE2BVZ8n7oIAValXPKmVPjcTsjw3y?=
 =?iso-8859-1?Q?N34rX6O4sYLfwJ/k6cE0/A7d1CQUdj1ZPJ8Ne3bY4lWAj2Nc1IB6vMUYr4?=
 =?iso-8859-1?Q?Ywhvm0wIAX+tOhnn0D4vxi/ZmZeC5Or447qIC9hLh/2r/MvPy30LsjGnR0?=
 =?iso-8859-1?Q?ojyq5Wqb7V/yktVub+UCV5oEo3PxkJiQrah4XFDt3b8sHJT3B3qZjJysCr?=
 =?iso-8859-1?Q?B4ncbGZY3+Dc/N2rnq4OQ0jY3wqOS3c9GXommC3mWbBa1jAJOSTz6sdDBm?=
 =?iso-8859-1?Q?WDlMj/bJTMOsuOSQQMmx3fYbsGzP680oYdzhHZZiKDVtpdk+NjcAfWthOq?=
 =?iso-8859-1?Q?loR7eeu1TgmuMzwdXlW4tOkEhufLKkUsQY6EkPQUBh7qSFpW7EYdXosAxK?=
 =?iso-8859-1?Q?I/rajLYRkKKJdm+DJZO7HMwQ9uMuhx7QLs/m9NTGV3Rb4+GS4tGe7xJoF2?=
 =?iso-8859-1?Q?MD3ovszNceGpX4kDUsMvPoqYIgrC7RZYWuAW1ZOd788X2A2MNoyUGaAcDq?=
 =?iso-8859-1?Q?3+OnlciHQQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: gofore.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR05MB10593.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f51e98-96c0-454a-0741-08df0e5e713f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 10:38:09.9369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4b4e036d-f94b-4209-8f07-6860b3641366
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SVuOG62Jwg6F9CAygg0b1CHVOBsnM5YbfsbUZN6jHRZrCIwSN8dzl8gtFEM1Mi/mq9zW1MwcWrtEP9JlXHhNe5RLzNY+tCyidIiZUOXVUlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR05MB12372

Hi,=0A=
=0A=
> What driver does that?=0A=
The DWC-OTG USB host controller is a part of the Raspberry Pi=0A=
fork of the Linux Kernel: https://github.com/nfeske/dwc_otg=0A=
Particularly dwc_otg_hcd_urb_alloc does:=0A=
 size =3D sizeof(*dwc_otg_urb) + =0A=
   iso_desc_count * sizeof(struct dwc_otg_hcd_iso_packet_desc);=0A=
where iso_desc_count is urb->number_of_packets.=0A=
=0A=
> How was this found and tested?=0A=
This issue was found and tested on an industrial box pc based on =0A=
the rpi zero2w, the EDC-IPC1100. Every USB/IP attach resulted in a =0A=
kernel panic on the device.=0A=
=0A=
> And did you forget an Assisted-by: tag?=0A=
The fix itself is not generated by an LLM, but I did use it to aid me in=0A=
setting up the build and tests and commit message tone.=0A=
I will add the tag.=0A=
=0A=
> What comment? That's not the best way to do this...=0A=
Right, sorry about that. I didn't want to pollute the file with explaining =
the same thing=0A=
twice. I will move the comment and the action into it's own fuction.=0A=
=0A=
Thank you for taking the time to help me by reviewing and commenting!=0A=
=0A=
- Markus=
