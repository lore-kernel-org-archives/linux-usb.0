Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B44B376A01;
	Fri, 21 Aug 2026 03:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787282973; cv=none; b=py5DOG16Ffo3I6x5Td6vKUQyGYupSHjp52QL42Bet1I7xt3k8zrwolNwZWpaxzaIZWGqcEMv+58qfZYQRdYjMZN4/ly+CHLRDEA8ENHiG/roqtv57mroKU7fBKvcfJYJPcK537ID812sC1C/Urg4y66DSXxE47Br+elcA59+wII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787282973; c=relaxed/simple;
	bh=U/cGNHox8hNLjM/kKyuRE3aeBcDnK0CplWtNnSP3hfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJZVUKJ7+KcJnI7SmUBo6LU7RCEF0FtPW44Th+hrpgbQuD65b3IL6laaaxJZ/XjrkZm9FzTTQrzKP29hX5unNjg83jhlDF19Vk15vG67fONkkKXL8mjLivYiWKJG6j+KKc3YmTy0BRkbsYrBx6w7qpkozVzObpwz5EBRLVTCTm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=gyrV8u71; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="gyrV8u71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787282910;
	bh=MqvDMYNRoQ9Kvbf05t/LQl0jO/ECi4yY7MVQ0wbLx6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=gyrV8u71pw7wClzmaAsML0U2GUs10wncYh0xJ4ybmFkXx4MiPw17lfoM2TBMTBaWQ
	 NNUD1C+IVBtD/whRrlrqXhJloEGuob6PnEMsTgn1/L4eQ4/yfSOOXCFLGQOH4hsjvr
	 IxVyiiRWEHMlEGrSeGk7kxe/ThbA7MTmEcjM5wCw=
X-QQ-mid: esmtpgz12t1787282903tf28c3db0
X-QQ-Originating-IP: NlXF3mMygcC+J74M1XWNyNNgFr5bOU6a3BbADdOj6j4=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 21 Aug 2026 11:28:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16746857706120519191
EX-QQ-RecipientCnt: 21
Message-ID: <A048E078785BB086+381938ba-e0ab-4764-a5c4-9d2434d0abe3@linux.spacemit.com>
Date: Fri, 21 Aug 2026 11:28:18 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Add SpacemiT K1 USB2.0 controllers support
To: Ze Huang <huang.ze@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <DKU91NS0JNRS.SLSXQO6JHRLM@linux.dev>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <DKU91NS0JNRS.SLSXQO6JHRLM@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MDErF8Q7k85n440dv14bzAy9yyaNt8kV2QcY4DevVACjFCN7EU1lX9Sg
	RSFMiePZ5iOZRq2rxJrXi7w85bwXsCpOeqn7Fekgjpf/3iHhU14Ve2CWnk5F79/uZ2xMFpt
	qKS7lNcl/2ouYZhOyp9/jFpvTIyyDtxEm3BzhxIxr6XmIbIzodPEA05h/MZJddmd4YCTLpT
	blFb8XtxNQ/iYjCq/x4ehM6izc4beFihbi2jd/wt8yaeJnml4wUhF0mHpaWNyVFYwDzBlMN
	3GJBp3zWZ2esQa01PKYAAs2J3drVRJGWh6ZENui6AAebIefBoUdB4+OtW0HTacSn2Jr00vt
	ld1HR2zE7SktUxnq4MI02jLY8xvTxDlaukmS7roRQEsZHLg8gqjudkAapeIKReziiq8gytu
	Co9ONMIeoi+DOtkobeE6brUyiI54vnavKsu64Q9lc48kyxmqhgYH+9jIDwz5snKdEesJw4M
	sB0TUjSiPPIY4efafzWANbRCUM3W0DAOGBDVHLMURYfd33jEAPKuWdTXzWXz/7T+NaslX2a
	p6zFk6dseDmpQRcbVoUCLZN9c68JMqYWC+kkM9/5kGjcGD9tMIvSii4GHgQ6R9MJHjeO7ik
	3FqLbNcimS2QCGVPFRjRlf+sURMoNzrhlqmIZj5xKiMXnsAvErltP08xo90qONPEZGRudyX
	n2hLQooON9nHWz0Bz0JM5nfRHWtXafjU5N8xJR1Pp48/hQt19EmPb7Sd4LBb6rtNXN/M3bq
	v5tJTtv4hi5ZsqjlN0mXcP0ZoErIx4Cklt+HAG1Nllis/BgXetKxcuLKY0LWkqU7j+VDduA
	65uw0MwRDM09ZP8xk39DREJaHKwOgxKSLqJKlBYT8iMdbR9xGT/e581QZRCW01UBQq5u2pI
	nXOWloN2uIZxIkt5iHqRtHxwIzlOnywafNTwXqJ9nn/8+i1CWYolg8+bWK6uq/V3br6M5hh
	h5PGyi2srUql2XxM2j/nCrdTaSk9eRvNzEletzEQDFcdyJx7ovGamWLU3nT67d6EgBPTWQa
	ViL9Iy0amwCTvG2z2FdI1NlWHEZGPrO222DZTH7xzbLXZdWoi5l7hxLiYPtbp3Hv3npn1c1
	mgWgRJJdIpc954nPSg07Wo=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On 8/21/2026 10:00 AM, Ze Huang wrote:
> On Wed Aug 12, 2026 at 5:26 PM CST, Junzhong Pan wrote:
>> The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
>> support, but the hardware has no internal OTG registers, the other is
>> Host only. These controllers are compatible with Chipidea USB2 driver
>> with some flags set and reset control support.
>>
>> This series is based on 7.2-rc1 and has been tested on Banana Pi F3
>> development board.
>>
>> A self-powered USB device/hub is needed to test the host function of the
>> dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
>> cellular module e.g.) is needed to test the host only controller.
>>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> 
> Tested on OrangePi RV2.
> 
> To use USB2.0 Type-A port as host on this board, usb2_0 needs:
>   - dr_mode = "host"
>   - a vbus-supply regulator driving gpio126
> 
> Tested-by: Ze Huang <huang.ze@linux.dev>
> 

Thanks, then I'll add rv2 dts node in the next version. Can you
test again later ?

Thanks

>> ---
>> Junzhong Pan (6):
>>       dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
>>       usb: chipidea: usb2: add optional reset support
>>       usb: chipidea: usb2: add SpacemiT K1 support
>>       riscv: dts: spacemit: add USB2.0 controller nodes for K1
>>       riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
>>       riscv: defconfig: enable ChipIdea USB controller support
>>
>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      |  1 +
>>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
>>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++++++++
>>  arch/riscv/configs/defconfig                       |  4 +++
>>  drivers/usb/chipidea/ci_hdrc_usb2.c                | 16 +++++++++
>>  5 files changed, 77 insertions(+)
>> ---
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
>> change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58
>>
>> Best regards,
> 
> 
> 
Best regards
