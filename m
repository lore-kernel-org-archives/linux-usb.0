Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996027;
	b=tyHlclRmZ2gP4qVPhch3UDA0R/h2i0oRbivwsVh8xp+HFCCqYzOLLUTOC8p/6GrBlqeO
	 WomhmUI5EO/8stqpAymINW+A0OPaEQaSycxEvwKQZyWgHFA4Kr2VnlxmmtCosBy4OBcCF
	 PDB4S7N8i1OX/Lykv3zut7bo2AKOgMmJ+bTM8HLKOHpTq/RGN4UzmKvMNrL/quM8MsfOL
	 vmUgEsMznAQv7s2lg+rUDNPRcjRiZ/mmWBzW9M0Mt98XX+/8HrZOP4Xm1uBP9mKjvdBSX
	 ODgDNO4qMLd2lC/tFh7zFsJgM2m9gwyjjFJw+ZuTgHLbl1a2n4kclZxCC4t0ld0b76w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996027;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=gE+8GEkhiQjCVNt58Aswex/BStQyLxbPhNALcBXdKZU=;
	b=JGTIJA0Xqa5q4ujNr9k5bFux92Y2hEght664tykey6OP3fL8NimgmKQUK+QEJDRZ70t2
	 v9HQfMoUgIRI/9Yw+HupFNoxnDKE30iXRJA48IF2PTWmfE5OV4YWPJYgVtjC4XgeNTDiF
	 4cfA1KyyisB0UDUIVsOAge4TAISaTnpq2RtOZpbvxz/LFv6HHCZJFbC8nwYT+7ySCcq6z
	 rKdaUGfuXFoJW5fUda37LBeAYH7xgytJNDtaXTjIlAK1KYAdgkKhDQVK1AuA3l/bxLDri
	 vE65FezQtXDiYW7LzYDQezKsf4MBILSBr5BLLdAruXKcJ8Ql10jQxUx/fWDN8pv2IsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=so8kePXX;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF53F606A32C;
	Wed, 18 Nov 2026 10:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF53F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=so8kePXX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794995962;
	bh=gE+8GEkhiQjCVNt58Aswex/BStQyLxbPhNALcBXdKZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=so8kePXXHRypKZVceMcjV/jbHYViLPMhOi8gOs8BP86Dvle/bVthdnNPQYDQvWCgJ
	 yVCwbiag3L9tLWVH3QBiL2dEfUL124spgbA7QWl0DJpa517ZbsaDpDHOJyGk8r8V4d
	 dMOCVHUchYnzRtk3IF3mrtJ99MQabf32zqclAi8s=
X-QQ-mid: esmtpgz13t1794995955t2c2fa096
X-QQ-Originating-IP: kXND7tW+yULMcxeWAiHy4oMknukShfEgdiMgPHresxI=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 17:59:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5513837278433707905
EX-QQ-RecipientCnt: 20
Message-ID: <361218E417AE4AE5+e47a92b4-850d-4a36-9e4b-6f5f62c8b379@linux.spacemit.com>
Date: Wed, 18 Nov 2026 17:59:12 +0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
 <20261117-b4-spacemit-k1-usb2-v5-7-52c3829cca69@linux.spacemit.com>
 <18756bf6-3eef-4de8-a091-c5218458fd99@kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <18756bf6-3eef-4de8-a091-c5218458fd99@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NcfXIs+Ms1qH7EEllHGrSeSohN7d2J/lmg6HBn1lBNC5NV7ipzSmg3GQ
	y0Gsm0/8d/cddtTuzcQzDeXwy6pAc5wBVP0xMX4gsRaI3twHCCKu96QeudpRjGfQXOTFQlb
	tQIeObuo8zWsNB5OJq49Wu4At06FsGUCLdKHaepuSwjDiez6GNBrTL6KdupU4WcgBGizYIc
	8pp8DhKTc6llXfr/LZTxf0y0CxM1+v+ARQyKaZJqd+NsDJgoewjAgeEylj/Z3sMw0jb81Ez
	YW1/Db8heU5HW7MzWhr7a+aea9Pr4Bqx6P7d5NJowTDPv011zN84Lw/HVrGrF7mOh925WZp
	nuCjUA1RKpNSsVyvyhsBsHunp142JJ5QcnxZo64m3e30SNoWAFun1zW5wUdZgqUJ+Fg37QT
	Yu2IjOTiryeXYmyJN536MALpzW8eS6EwB7Vnfqbcu/Ssjhtcc6TcuRh0c7VYob9oZyyTfKT
	9K2kvDTR7gZ/8CKU3xLw+OqZGuVihuKSgEQcUzjKEUmzNcP/bCHOKNnOabrb7XmV8uuEk6D
	9vwfluEtPc7grLOxuyBAY0YmWDcme8mW9XZQzYxz8DijuVV5fWJct5XIwjmruFYu7qISFSP
	zj/V5dGdqHsiz50PHKHyKW3UsrsjElvZ8xr4D2oZnO1t4tc53nxTQJl5gP/FekVDLqn6uTc
	J6EaXUKrRD8om+pWeRkW8L55JcE6OvU93isRBMDHuEezBiS2UpGDUAO0ahZOTIYqk408wjS
	h81AHht1sOlB+dGKH3AyR6tezvlANIamR9pEdXEoNIPkYzSoI33Tk5yO3gPMuzmAoQ2IvKp
	O0N5Vz8PT8EwCbCuCYKk5sghnKZjc20TDfYJ0kM77lRECdke3z0rfZIFWluVYz1OZWFUByo
	Lut+tQz/i7chQxEh2iPRC+eaS2Y4fOgvLRFnkTJtIS1zgQ4NXuSytO0AOGhQvcjzWQ19FHA
	xmctMS2bozsmRoO0A1D1pEFJnhtyUF5ibfIatgN3bRZjQBTg7lwQrIOLgiNQNgb6PDsn38J
	TFbyNbhvaPAxQ+UPeUXo/tg3olhGsKCK7uuhEBJ/NLtaiHEU+ah3eG9eHFdgE=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On 11/18/2026 4:18 PM, Krzysztof Kozlowski wrote:
> On 17/11/2026 13:38, Junzhong Pan wrote:
>> On BananaPi F3, usb2_0 is connected to a Type-C connector at device
>> mode by default. This port have no VBUS supply capability, thus host
>> mode only works with self-powered device or hub. User could switch the
>> role in sysfs.
>>
>> And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
>> support cellular modules.
>>
>> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> Reviewed-by: Yixun Lan <dlan@kernel.org>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> 
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
> 

Thanks for pointing this out! I'll split them in the next revision.

> 
> Best regards,
> Krzysztof
> 

Best regards,
Junzhong Pan
