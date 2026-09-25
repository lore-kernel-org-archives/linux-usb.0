Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022116.outbound.protection.outlook.com [52.101.53.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F981C69D
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 00:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294553; cv=fail; b=CKDoyrFb03HUZ/27KV3qr5Fu76Z/7/SalOV9Iz+8p8oi8fR0uUdFofxHvHdWq9xiwcZLolwrOvzq+Ue+ykwQEI7UsZ1C/1fGkQBiAU/8GWHZRdSr3DKgkkT3GC3863BIibhTMZlJToo9jf/WJWdpt1eQyQQd9kecFkAqownCqto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294553; c=relaxed/simple;
	bh=UE1wcxgNQ0Eg+Tx6l1Gz23JjeZgWLTltuVRt5W/2YNc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hOglJjWNEhDt7lbgHR9/NZr6zluyIvNCZj9uLZXVaZyhTMKzSY4ODe6ZWYAJIVH+eaR3N/f5qm6SBCHwYz20U1s8EM0GiOCLAnMkvkHbc6ExzfQ092Ah9N59/jzQdQXgKTCItfgZtXs1e4Yuml79dtLd23KN3fHU625QBKuo0Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org; spf=pass smtp.mailfrom=lieber.org; dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b=nRej6kLP; arc=fail smtp.client-ip=52.101.53.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lieber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lieber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lieber.org header.i=@lieber.org header.b="nRej6kLP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsZLqTAriuLy7sXFnutRNsNwTaVa6jKYJzDjUrYszGYX9jO+KlyP9NG7B+Zhpa++SGRgVlF1JlCFhyZNSc3GdrARbdtt1Z8vuVT/c0+CCjYS1+dLNZo0TkFGHcjM/p2MK+hgtnMZxH1WEkJmVsxumLmZlXaD/BRs/96P039cla2laINHr4c+VACPncKIDnBc9vjBFvxJ2uzEDjAeAaTIadNnP2AYWOU0e3ndNickLOBYvc7i5zoGy+dTnWum44+OFn8NHXNdhJXXu6URsC52OGZPsx3KeGIO5MJWgJEQL6yKr1TGVVvVn2o2JTcZIjCcocbenpiJjfVLK0iodd3ahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFqnFLANq3aKXe+y6NaMjn34peMJTWYu4Xlx53LvQCM=;
 b=IQvhfaAi/CLb41pB+QKWw379V1zlFa2dKPpFIOYO+j2KkdBOhImEqIBb4NpiP7qrZyWuEWQNMFxMGIS2ej0s+sejW1m2IQ0Nu5ON0Fgm6uhKl1MvDtvEtnNuC3VT8+lOmxhh5FmzSm4/wDUQuH1AnEdpFMNtzOLOg069tYub/WWwhbqV+fOUU6PFh0DThIU4gUXquywzDTf1xwHln+jqDbUv1tP86E9LaP1Adwj837tGSCzlqj7iXEgTW7vByH3M4g7/hyS+/WFTjTM3+c7EDIUw6szbg5ZrWw9GJAiZWZIg7EfuEX0iL8KQ10dftsoBJ4M7oS/C50ZwVBJDzxWXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lieber.org; dmarc=pass action=none header.from=lieber.org;
 dkim=pass header.d=lieber.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lieber.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFqnFLANq3aKXe+y6NaMjn34peMJTWYu4Xlx53LvQCM=;
 b=nRej6kLP3wPOf3dD6y8G67fv9znvIGyQ4CbXOeGr1kyYSPTkCjbPtVBapEnGexVMiwW6bzd++DgXZlptsKraTysa/OcPr03GL6/yY5qeW06LqIDVgbZZnDIWTsrvW/+3IPTtNb48cQWHANx+9RyJu/wA5Gx/ZGZY/8K1nq0ZfgGGCQEPyXmWdPGpegP8Po+pj054wl0Qc9ypjIyftPOKIvffn3JgfV0VfsDRdjUeFpv1ytTWOTQQYOduyTk69/rJeeRBiZ8qR6wByMjF0kczzOmtXYHA1uz2p5oxcg7r2jig+FzXK+t/q+kAbx1hZ2GnwuLzpETY4N5a+tvwz8fKtw==
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com (2603:10b6:a03:37d::17)
 by SA1PR15MB6787.namprd15.prod.outlook.com (2603:10b6:806:4b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 00:02:28 +0000
Received: from SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61]) by SJ0PR15MB4696.namprd15.prod.outlook.com
 ([fe80::14c7:ac20:ac6e:6f61%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 00:02:28 +0000
From: Kurt Lieber <kurt@lieber.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>, "westeri@kernel.org"
	<westeri@kernel.org>, "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Thread-Topic: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Thread-Index: AQHdTB/xumZMHV37HU+Dgj/1DHc0GbbdsEKAgAAJSrWAABd8gIAAmJVS
Date: Fri, 25 Sep 2026 00:02:28 +0000
Message-ID:
 <SJ0PR15MB4696FC97236D81E59D40E142A3802@SJ0PR15MB4696.namprd15.prod.outlook.com>
References:
 <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924073514.GM106095@black.igk.intel.com>
 <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924101046.GN106095@black.igk.intel.com>
 <SJ0PR15MB46960A6F15BCA58C0726C908A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924125729.GP106095@black.igk.intel.com>
 <SJ0PR15MB469651A447568D8E66757EB1A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924145447.GR106095@black.igk.intel.com>
In-Reply-To: <20260924145447.GR106095@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lieber.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR15MB4696:EE_|SA1PR15MB6787:EE_
x-ms-office365-filtering-correlation-id: 3d362804-f57a-4969-8d2a-08df1a9849c5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|4143699003|10067099003|56012099006|55112099003|22082099003|18002099003|38070700021|7055299009;
x-microsoft-antispam-message-info:
 3NNEW2FrFh2ersVUMRkbhR15hhVBqBjYhMNd0uzI3b1XdD/VqoUHUSGU9eljBeoSksCK5q45TraI8ImELamqJJ3s5CG9E3zgFNAborttXX4zNrolxrIqy+Almi27a/JPR2GA3dKQMuT5cQvo9Ea2pkTObpSpqO6TBZ1VNZGYxVk5W0jAEpOYpfL3jOvDdIPWdJsULm604SK1HSxJa1PbJaUPVj/PX+SFT0hWEWP08NxY+OJr4L8C5TULC+JdeF7dSCBIC80eiMqUl8grRrOhWHivhsDtPafnwGsXJfkDZ9xQE3xSCI1vAqaBINg61xSDi3iYX6qX+C+c/a/aSfvgw/YyZ+XArgeguAJw+Cjw58d5BFc1dYBiTG19Xsa6Zjzd7FSEpKANh/lS7MgIvSRjNK+Bx9apgsY0+C0HDinb59qvhxRCYWVMsWGxWGq1bM4PziWtHd3C/aD7rM8U6R1k3fnZUkQW9P297HhJa38KsxB9YC+H2UrWKQBXbkECaAE74Py7AjLmyr4iT6imZYzrGa1ukGuCzVQ1TEr+Ocr6dG5V62nKePOg8uQYkLIVuey+OAoqrk0qOSV81eEFNZd86psggv9NW6tl3hOGNgQ0BHS0m+AgmLqR98h6t9iIl/Lq4EIkL/ek/1A7LSLzXSqC/40Z9CJUaEDa98aw2Y1kr73it/Hs4BtwChYbsy6WLJEB4MMr59P5iq1k/a4fJj7TubhRH09jk7NGRyfsdaSbPOKp/b8NqIZItLAHA8upnjjE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4696.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(4143699003)(10067099003)(56012099006)(55112099003)(22082099003)(18002099003)(38070700021)(7055299009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lzIXPJVqF9EAr/Fsr87WqsVhMcmP0UF6jiB+XR22M5MTLRjXG9V+375WHn?=
 =?iso-8859-1?Q?ecj0ZCfjdkbEUKLaBZyVbDkR2NyhfU/A3TTV1OFP7pF6U4MJFOpxpfjFsd?=
 =?iso-8859-1?Q?FCGuEhuvqWU8hKbt7y74X3j2ORZBgfGwokrUYJi3ei1il9/XZKDlb6OWqv?=
 =?iso-8859-1?Q?g4Ue8YlvS07Qi9j4q12oYEsBfEDAk+nFsTu1SN1kq3hhw8Ckn6NEqEmqJE?=
 =?iso-8859-1?Q?VnGy2rNNCmw+VC5GlWLB67+4983wqoTYITCuPsDyv/bKDyzMVWo9QQA9qB?=
 =?iso-8859-1?Q?APCJ5+5vEZSfVCoJTzFg0u3sfpqG0ytWj460irSllx6MDK23o02KcIEmRh?=
 =?iso-8859-1?Q?8ht0bJoJyg6alMZ0HaHVYOc4m6/oNQq1oA9BaRs5tNa7tWhnnJ5ue8s2Nc?=
 =?iso-8859-1?Q?NYBMzvvc8xw12vtqN6IRp2HfXHx8kKxRLcxAc4D4Fb9m8DJ3qaBdQmIFF6?=
 =?iso-8859-1?Q?H0E24IO5Dx3dryS1LrBYsesgfn15c2aXGMmpkB8Fg8MRYrmXrQYBHxRhl6?=
 =?iso-8859-1?Q?MdQ/EQhHtKqFwObWLGhFm3M703ZQFWfjHmP+UB+bjBpRnQmqnZYqZWrq87?=
 =?iso-8859-1?Q?ZHo8ZRd19JJTFxFPrUtLlvWlyNaA2j/YAUOsN4EN/AM97TAPnMUUQfpqxH?=
 =?iso-8859-1?Q?w/jAVy6I95+FLthK80gVT+wQMXYC4EG/SgxnnW38FrZgj5RLX2eo+YdfwY?=
 =?iso-8859-1?Q?tavq2Q4dRoPM5o2F3Ppuvq7a8+wCPhTBw4L+tOOd+0/TNcqhk29CaHBgBj?=
 =?iso-8859-1?Q?5F5BPZkjbti01jfVK2FkFM1jQAJC/UpWc+EPZplYDBL3dvLQT8jdQazLeM?=
 =?iso-8859-1?Q?PFZfBzYHjBvWEr70bIXHIQGI0hakfg73ybPwbk5XWC0254Y8FHcrVjmRFH?=
 =?iso-8859-1?Q?d/W5fxrGJ6UQ7x9HK9EsGt0X+5PB/xfrifu/NFq+ulGWy/rKte91PD9FEs?=
 =?iso-8859-1?Q?4wqC276pI8RyiTloNxQuRUsrbkB+Ny12dPdH315J/YteQzyDTxt1k5LJkI?=
 =?iso-8859-1?Q?3qC9wN9oImbx7RKAt+9o3tDq+B5elW423ZzS9062GoXvL+wHOsivZeBm/l?=
 =?iso-8859-1?Q?eXbXiTCUSbv1KRbgR8lbeahY3r+3OjBREhCIClgC6w5iwCu+EJIemLlmHN?=
 =?iso-8859-1?Q?4qJtK3JZEJJKIgf6VnYyi3TTcdvsLG3i614AErDom+TgyiD5Iyln5+1XKr?=
 =?iso-8859-1?Q?QzAw76Iny+8aIC3OZJbZ8uUv0aapGjrOV0kVePqFr6lpFfaxMxq40N+E9L?=
 =?iso-8859-1?Q?gVscLyI4H7dM/xCPeF1yqFZIr11QeF66mOeGuAInxvL2AqzHVdx6of/XKu?=
 =?iso-8859-1?Q?FnOEEfD+yPmrCdHd/82paS/5VEYYiIRZun1WL45VBMgfnYAdiNZ/SCKTJI?=
 =?iso-8859-1?Q?mAOM9X/7hwrJ4dygT3ihFJrCN+RkSCUomqM4j/diSsocE6MQ+anujwcBXv?=
 =?iso-8859-1?Q?zzcNdn6YLWcu0BTT6RbKxZgjESMaGxFCvLQ4EjEuQDZMUCy/pKcLORjHs0?=
 =?iso-8859-1?Q?wjl/emIPclfaQcKOkNcP9yO7jbLuRKYPNJ00wIRe4vjyirPXCo2LKMTjTU?=
 =?iso-8859-1?Q?D8XDHzUf5utl0Ag7rIliy3jhRkaOlugL5XIL/xDuDlWbj7e+YlAu7Wb+ad?=
 =?iso-8859-1?Q?E13JY3EVbSaEoe+XP/pMO2sM5/oMwhZpSX6RwgXEPov05kPF6dI5hwfLRy?=
 =?iso-8859-1?Q?IHf4UQC7uhCi1OKepjgPYA7medSSVIlp8IVS4JSNY+14VJlqvxXZg1x3O0?=
 =?iso-8859-1?Q?zXr5dmOuGlPFLIj6fRkf/ESiMLCQOmoTvhuZr7Xo+NMf/TF5Ah7xHb3LjF?=
 =?iso-8859-1?Q?SXk71aTD9QjNsidaiPVZCum0Wrki1ZyKyyEnUgzl/lljf/E0se1b?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d362804-f57a-4969-8d2a-08df1a9849c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 00:02:28.4619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 213667ce-a7c7-4f7f-ac87-9abccbddaa2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zWS0za/bVOgE6Muetb1DMVJjDCqH1CTSH10mZBex26IQz3nRvWJBkXTyrALtgWEb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR15MB6787

Hi Mika,=0A=
=0A=
On Thu, Sep 24, 2026 at 02:54:56PM +0000, Mika Westerberg wrote:=0A=
> Okay that's recent enough. I do wonder if we try to enable CL2 too. We=0A=
> should only do that for Gen 4 link. Can you still take dynamic debug log=
=0A=
> for me without clx=3D0 so we can see that it tries to enable?=0A=
=0A=
Dynamic debug with thunderbolt.clx left at Y, dock plugged in (route 1,=0A=
DROM 01ea:83b5, NVM 62.2). The same sequence repeats about once a=0A=
second. CL2 does not appear in the trace. What it enables is CL0s/CL1:=0A=
=0A=
  thunderbolt 0000:00:0d.3: 1: current link speed 20.0 Gb/s=0A=
  thunderbolt 0000:00:0d.3: 1: current link width symmetric, single lane=0A=
  thunderbolt 0000:00:0d.3: 1: link width set to symmetric, dual lanes=0A=
  thunderbolt 0000:00:0d.3: 1:1: CLx: CL0s/CL1 supported=0A=
  thunderbolt 0000:00:0d.3: 0:1: CLx: CL0s/CL1 supported=0A=
  thunderbolt 0000:00:0d.3: 1: CLx: CL0s/CL1 enabled=0A=
  thunderbolt 0000:00:0d.3: 1: TMU: mode change off -> uni-directional, Low=
Res requested=0A=
  thunderbolt 0000:00:0d.3: 1: TMU: failed to enable mode uni-directional, =
LowRes: -107=0A=
  thunderbolt 0000:00:0d.3: 1: failed to enable TMU=0A=
  thunderbolt 0000:00:0d.3: 1: USB3 tunnel creation failed=0A=
  thunderbolt 0000:00:0d.3: 1:12: DP tunnel activation failed, aborting=0A=
  thunderbolt 0-1: device disconnected=0A=
=0A=
Kurt=
