Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099268;
	b=EBuGCwDFpY9TIFxcvo13X564rk+AP62hZEdQCAIhG7vnsjqJjsGiJaMM9SlAOV6kY7Q9
	 D4jhpUD2uBNXMJkDdopl9A+g9t3P3Ik9aLigQV+KpQbyPx4M2ruya7BBAdTfwR/oE7iQb
	 cha5wnviQNGty2MMllalK/M4g8OsCK+HgQHtYjgUgoBsCcHpbbY4gLTJ1hcz41JX2QTBH
	 hNDX3v3b1pRUnm/X7aAeJpCHrx7CRbXNj0OZ4qFSJs8pDc8B6Zhii7aL3VdcRHC81zG/Z
	 qpFdbYRAR/wKk8zCeHocqttaFx2CXaN+NeJdAMDRzJ8fj30iKPJkKvLhJKd3UhcjiYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099268;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=Fyeg7YgDyxCOYKOuvywES8/akQxJkCsv67OX1BIB/Yo=;
	b=46T5p0gYpO115/i5K/27IZXCD58300LXwBmUFtnA4uxhFn1bVs1A4DrGeRwOvfEWGmlq
	 3ZGPwmIbO01fHnOmdK11AzfmpWqrqrlHitXDyP5WSmEnnPtmia3XvQXeoqzyJGxQ0uiOk
	 dCyIJWfm/ewP88eFpu5RqZ3ZzzFnDNC9sMMtqswvmTpt0XvVkQJnMLBRMHNl3Xjtd+uyc
	 2677/xTYBEVrzFHEqYjOi41Y9bq0dWmkD+sR4iP2G0Tv1VzsQJyI27cIhpNOemj87lddy
	 cGOc9VhrsNMqZrescGj22+wfuUJMAvNYLNFd0AtV8gvykSsfu0qnbvWg2AhnRfTYmBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b="MOhu/0/v";
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E6A606A324;
	Thu, 19 Nov 2026 14:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7E6A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=MOhu/0/v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795099254;
	bh=Fyeg7YgDyxCOYKOuvywES8/akQxJkCsv67OX1BIB/Yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=MOhu/0/vTNzfjTfaTmGA1qqz3VltHe3gI9r4cp/QsS3fHkeO5fG4NXjWjtHaYXNmg
	 99l4NI9NttEPtI70HpLDtnO2fq3zvFxOKx+Eohf5ZxmsyKc0fBXK34GhZ3ghQNiuzV
	 U28QHO41WAjo7Wz0IBc8+3y+DBOp48q5Y+xu4c5s=
X-QQ-mid: zesmtpgz4t1795099249t82d724de
X-QQ-Originating-IP: AkaFsQhwFR9iPWv73Fx2ZrHRVujqZUtGELymO4dUxpA=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 22:40:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3019706064395514036
EX-QQ-RecipientCnt: 15
Message-ID: <858E773FB36F6B4C+00f181a8-3261-4bb4-be88-e48330500838@linux.spacemit.com>
Date: Thu, 19 Nov 2026 22:40:46 +0800
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
Subject: Re: [PATCH v6 1/5] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
 <20261119-b4-spacemit-k1-usb2-v6-1-4a9add848728@linux.spacemit.com>
 <9db379cc-0b07-4efc-a3eb-ebc07e7952c7@kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <9db379cc-0b07-4efc-a3eb-ebc07e7952c7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NEaes6yu2o+mjTtL1BAGaS2G7p5aJ5AZWfZQs+cqb8L4YtjLtUi3LWdS
	vhO5Cw7/uX+c1Bx4vqwOm4YohUzy8vvsiBEkgxpfkL5F9N0VdBz7B2gZpCCHIObWn63pq/u
	FrTbMKocI75LFgXf6GL5AAvQ94VXztY10Y5LkR9qi1BrXQxqnqmAAPXMe0CHXzlDmK//29q
	yVx84iNKlc6lz36gKRakZqPoOtWe2EbiXeBOWKi1NLzMu4kMl9GElUKTXxLKW8AXjQ9s4r1
	GckHOkLFphFc5o/RhGGErl2TLGDOpfsoqAi8ViWMujvUDrPqgwOtOPpRqvtNa0F0dRb8KIP
	hLUzHkkm1Hyrn620YIzpJLTjw6SQbKqrgYJCvjSRRSXAuuwoH1o+DFCWQNMyYeH+miZmSZw
	FxIVIhMj1Ee+KrpSwUTvzwFDUD2EVgz3+Dfq2ir2TMV1eV3zSFXVfWruLNzXo4Rtzobpb2M
	G9ibpcPd7VvfcNg4jaZOpBMNEhWluevJ9DqOmSQduJhGAk6phg8AAsrkyX17lyVozTtdy7u
	is2B+MBjojR7OS0VkbHXM/VWYXM0UGYZeFsbCukZOCcMyygP/SPd6263UcJMlJvIbEF2ifa
	ZKk59W/KCxOIbJrQm7HfqEv4VgWdnUGQRtd+f/kDTj3q4IDC23PLXxqnJAlk3pbF5l7/7Gm
	Fzj/a1Ra2EyRBY6QGbmEe9OOmCKBu47KXK1AFyjtyEB6NXcmo+a+fVbJuVQD3R2QdrQVp+W
	HLE8rCqmrglVLE9N3MLKpAOXDJSTVEKB0snZg5QxOMx+8REVZ6cM7+wpk7INgt8FFQx+JhT
	WANtUMcqELL4HnHivfNOVE3Tkq2AlrUhMPRb2bdOh2eWOWX+/gum5MpQhXkXohh38j3wAQw
	2DAiqYoJnWXTNloAEiVZz2P1mDJj0IOpjXAeU/0AfJ6ApLSD9QC0DOAtOtprs2SsCr3oKQ7
	bSwEz1vWtD2C8u0CT75/u2LZaXyFIRun0FgyjE60/Hv8SEb1CS9yA4kGc6vYRB3oxwkau4V
	SuBSFs8CPDoRmLK1vkd5QZewy1dCFfFxCUvg/738BPNCBEWmH3c84NVyhl58l0A31DdAXp+
	LTkhuf2GlcFg+TCuZB2LM4=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Hi Krzysztof Kozlowski,

On 11/19/2026 10:08 PM, Krzysztof Kozlowski wrote:
> On 19/11/2026 14:41, Junzhong Pan wrote:
>> The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
>> has no internal OTG registers, this requires flags which disable
>> related features set in platform data. Add a compatible string to match
>> the platform data.
>>
>> Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
>> work, add constraints for it.
>>
>> Reviewed-by: Yixun Lan <dlan@kernel.org>
> 
> Hm, I could not locate this tag. Where did it happen?
> 

I think b4 collect it from here:

https://lore.kernel.org/all/20260928225821-GKA2079@kernel.org/#t
>> ---
>> Junzhong Pan (8):
>>       dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
>>       usb: chipidea: usb2: use devm_clk_get_optional_enabled()
>>       usb: chipidea: usb2: add optional reset support
>>       usb: chipidea: usb2: add SpacemiT K1 support
>>       riscv: dts: spacemit: add USB2.0 controller nodes for K1
>>       riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
>>       riscv: dts: spacemit: enable USB2.0 controllers on OrangePi RV2
>>       riscv: defconfig: enable ChipIdea USB controller support
>> 
>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 15 ++++++++
>>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
>>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 28 +++++++++++++++
>>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++++++++
>>  arch/riscv/configs/defconfig                       |  4 +++
>>  drivers/usb/chipidea/ci_hdrc_usb2.c                | 35 +++++++++++--------
>>  6 files changed, 123 insertions(+), 15 deletions(-)
>> ---
> The series looks good, so 
>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
>
> -- 
> Yixun Lan (dlan)

It's a R-b to the whole series, so the tag is added to every patch,
please let me know if this collecting is wrong, thank you!

>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> ---
>>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> index 620b564914d4..5c2b7eb1a6ff 100644
>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> @@ -25,6 +25,7 @@ properties:
>>            - nvidia,tegra124-udc
>>            - nxp,s32g2-usb
>>            - qcom,ci-hdrc
>> +          - spacemit,k1-usb2
>>        - items:
>>            - enum:
>>                - nvidia,tegra114-ehci
>> @@ -113,6 +114,20 @@ allOf:
>>            maxItems: 2
>>          clock-names:
>>            maxItems: 2
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: spacemit,k1-usb2
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 1
> 
> Were are the clock-names constraints?
> 
>> +        resets:
>> +          minItems: 1
> 
> This is odd. Why do you need minItems? What are the constraints?
> 
> This looks just wrong...
> 

Sorry for the mistakes and thanks for pointing out, my intent was
that spacemit,k1-usb2 always needs its reset line, but it's already
covered by `required` below. I will fix these In v7:

    then:
      properties:
        clocks:
          maxItems: 1
        clock-names:
          maxItems: 1
      required:
        - clocks
        - resets

Does this look right to you?

> 
>> +      required:
>> +        - clocks
>> +        - resets
>>  
>>  unevaluatedProperties: false
>>  
>>
> 
> 
> Best regards,
> Krzysztof
> 

Best regards,
Junzhong Pan

