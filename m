Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015863;
	b=ZDzl7gdUQJ1pOjUahBWEtQdUoogvJF7Pr2pFub2U8UFyg6V3G+gxgLmX9wmEX1EfFA5T
	 yZagDqRzrmQobKiGbc43yyivXFvRTm6i3USlnqKBlQVtv0aX1fEEXPqB/7Mq7d4jVUm39
	 uRF58+w6rby4D9hgc1HGXsqSzpr9xw//+33sbTXmZgvsIV7YqgYsFjKQOs9Ajek8gmJxD
	 ndg596N931rdpNWmEi/aCatSd/i04KqC8SCgZgCDyCvhudQo13DFPEDBe/l3rkcH6jcFA
	 TUzaTYe/ywlQaVclyw4uxRB5z3O6TQ2LhgmMNdRmwdOMyW0xPdvso14yUfIIEitNPhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015863;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=8yn+f7/xPBR45GbhMRQUjqpcIdGoRih5Xrmg69vMj9I=;
	b=JO1CDzwWlWF+L0QKIP4M7rFXDDt+/2LT09vde/IIz1igVMsrqKcUgRPSAitnAgGlLeNr
	 ryOo+5V3xal06gFv13mMit3ntlcmyoTXRxLBvV2nGgegzQPfcOSV1upOZ0ePmHfsrioor
	 F64nkrLofeLqw7kbKAw7Z5/eGiNJBMIrum1tMzVSmzvRdirtz7HJC6VDSlyzys9St4OzI
	 /h1RW2xBfdgqnYv5w3Vy+J4r7V9eV3z2xI/Yd3z5gq+1hZz4eX0eNglanH3UKYSUpDFIW
	 0CXbyOIPCKiss0qIDx8g6FB25slIVnf0BLR1IR/J8p0LFDjSb5i4QXpHXnx+8ONLCeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dFtkNSjz;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1AF606A31B
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 11:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD1AF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dFtkNSjz
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261026115739epoutp0431f4ddc7d236cc859d4a5cc49c66a3d0~iEmynV_Wa1637916379epoutp04Z
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 11:57:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261026115739epoutp0431f4ddc7d236cc859d4a5cc49c66a3d0~iEmynV_Wa1637916379epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793015859;
	bh=8yn+f7/xPBR45GbhMRQUjqpcIdGoRih5Xrmg69vMj9I=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=dFtkNSjzbIAbdXMTmo3EcYT8iyToFI0EBPZkBeG3uzAx4RsVzmUC9pPsmWingxIQu
	 Ji1FRqAL0f/NPoPuxh2t9CvHIUURD2hkoc0uRwBzg97dnjxJiaJ/rGxej3skOanJFv
	 Y3qVFvWUvTJN5XVh2bquDaDfpzuMUE/sMrRp0mbY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261026115738epcas5p18b2bcee968bbbf08476340af7da6ef1e~iEmxllekR1444514445epcas5p12;
	Mon, 26 Oct 2026 11:57:38 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jCsZ936YGz6B9m9; Mon, 26 Oct
	2026 11:57:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261026115736epcas5p399ee58609e8a2d9584fcd86dc1e5b852~iEmwPv0sJ0063700637epcas5p3T;
	Mon, 26 Oct 2026 11:57:36 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261026115733epsmtip16c43d131d64fca287f1f0c2545ded44a~iEmtNzYCi0993709937epsmtip1t;
	Mon, 26 Oct 2026 11:57:33 +0000 (GMT)
Message-ID: <1acd29ba-c9db-45e3-b7c4-49bf8f8a14b9@samsung.com>
Date: Mon, 26 Oct 2026 17:27:32 +0530
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
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20261026-talented-wolf-of-karma-8abbbd@quoll>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261026115736epcas5p399ee58609e8a2d9584fcd86dc1e5b852
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
	<CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
	<20261023131501.3157463-2-selvarasu.g@samsung.com>
	<20261026-talented-wolf-of-karma-8abbbd@quoll>


On 10/26/2026 3:14 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 23, 2026 at 06:45:00PM +0530, Selvarasu Ganesan wrote:
>> +title: Samsung Exynos8855 DWC3 USB controller
>> +
>> +maintainers:
>> +  - Krzysztof Kozlowski <krzk@kernel.org>
>> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
>> +
>> +description:
>> +  Describes the DWC3 USB controller block implemented on the Samsung
>> +  Exynos8855 SoC.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - samsung,exynos8855-dwc3
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
> interrupts go after clocks, power-domains after interrupts.


Hi Krzysztof,

Thanks for your comments.
My bad, will update in the next version.


>
>> +
>> +  clocks:
>> +    description: |
>> +      Two clocks are used:
>> +       - ref: Reference clock for SOF/ITP generation.
>> +       - bus: Bus (APB) clock for register access.
>> +    minItems: 2
>> +    maxItems: 2
> Instead replace all this with listing items with description. Don't
> repeat constraints in free form text.
>
> items:
>    - description:
>    - description:
Sure, will update the clocks as below in the next version,

     clocks:
       items:
         - description: Reference clock for SOF/ITP generation.
         - description: Bus (APB) clock for register access.

Thanks,
Selva
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ref
>> +      - const: bus
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
> Here you have correct order.
>
> Best regards,
> Krzysztof
