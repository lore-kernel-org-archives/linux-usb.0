Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68F342F716
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532254; cv=none; b=izwa/qeLnWcnKFnxN+P3vc9a2ANAipsG6UdHB+bVEt3r8JT/ICwuDmhORf0Q4Opc32J/JjcV9vdts5WBGB20/sTB0f/pyvBHny09KPlSJzEdGvZJzDUfpPRleylpOzpvPZC0DPq1V93OTb1pUGVEoxWDnJOh4md7L6F+E+H1i3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532254; c=relaxed/simple;
	bh=RahR/DWbXbEDZjb/EF3wkzI9ZKLvvHstrh5HvDvR3co=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ImQEGBXFEtVhpn/clMMWr3JfxZE9R72dzNXN2TiA76RiqjmIut8W3YqviioCzk/SBNEL2r3fKpYnmU35m6X8TLn8Ro6sugjK5kkzbUniik9oZiJJg7cD0KJFyNeOYfuU6Fj7tn0a/vI7afE/M9A+p+/qF2ieoeoEgcYccuEusrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RG86GqL+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RG86GqL+"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c7fd45465so5897111fa.1
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 03:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786532251; x=1787137051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBYVZeR2IXepxnBLAPHf56zO0KNstp6BUxcLKtblei4=;
        b=RG86GqL++veO+yPKzFi4VcTH5WfkbUNxE2Vs9+BQ/K9s0SHe+Vim/2bKolIPFF9LOS
         rQmzUp9RChORZ0asPHFH9Mx5JM5itZJNM21V4zbsGONW7dPkCY/1DKqDPGZdcPs2FHP7
         yK0ySvWBaC1rB4gQSiQJrSzfywZe5TtHwq/FA58r1Gd7p2gbIyX2Jza5BUTfUGjLCkiK
         mamQUkOF0ueITKzBe2SQazodXrrzOWvVpB84TdYTnPf2k5gIqx2t4qUKqkFSX//wpS/q
         pskomiG/cyI6QhjfXaisaIkAwvB42M/Z1FyAAqP5LeCzqHbvikDSHt2fxgYIHakMQndU
         1L3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532251; x=1787137051;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBYVZeR2IXepxnBLAPHf56zO0KNstp6BUxcLKtblei4=;
        b=aG+eBZOkpBDuuX1U7DrU0OHhZAoynyyb1k64Fe/pEk9Khey7lXoVdQLfm8mIDOcTco
         U6NaOp+5BL4IqoF5x4Xs9zKwxmwgFENnWKXpI9ax7JKILAJ0IyspHEKmpfsc5uYRRYZB
         KJJwoNMsw5C3VCwuC4+d5ZjVTTOCOxL/vFmKEQ79zNstUVutq+Wuen80wNZ3Kd6Hmx1y
         XGxIOZ6gvriBDy9+02FLTYeur3cWmGwHN7mp/Ad/TNR4M9+CiKYIzQvYXK33bjsZmSo9
         72n5QZ4JEe2LUvOmsT2g9598RmzqDhhMJFjdS7r+s5KMOrUVb/Jm/evGMtal2Q8wf3G8
         FELA==
X-Forwarded-Encrypted: i=1; AHgh+RoHJeGjTUgOCOpZ/KbUfMBiFd5yWPlnulwXS7PWg9QSv1y3EyGDa8JKQofWbEGYUEE9MZKmTkgyQAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx2dbS9rTI6oh0iNsJKTv/hlznPZG6FY/3ymjtN2Tt9CnMVDD/
	ksFgt0mMqxATJS/OlWYA7h9zIYbnHIoOo5sV4HDEqdSmaZi8jTgVAq/1
X-Gm-Gg: AR+sD12w+dwcIekAVPMH1F2ZX1lQuzyeNCc7c0Fejcru+35d8Kwc50bl6m3y4bjGYbE
	rKKaQOpaPCi4j6ptJ/8wpQpaMcCZ0C4DqkQnAa2xRwOUZn7puHsEyoP1MWPHyS5fv6EHSAsfDQc
	Br8kKPh2t8gac+wGgh8OxlHN+s1TLPr5hsEgvw723rQ4432tbao9+bj9LjfGL5uJE1QGTPmiwSE
	x7VM3A0zisSIwMvTs9D3DvlOnZ/Z8oAU131zXhqKgmWdHYtkISk+C2dtfsV7KK3RnPCR3nuewdh
	gJJaCRBXMQZ2gQxUiZwDu3GymRfRxR30HSjjg0/CptwBVPE4H55djmau2/2QvLIrgMq1PneI6Qk
	kLSU1KUEVxMH+0qwjA6TrkL0bKiU79oB639JBZg2uet1eJfg7Imu6rCZ0gnUI2xhzqMrakoYf/+
	eNnEYlTCuqSeziftqEbQu74+60ydW+pU0Vl2yUbiKgQKZQLs60Su2wsAlUE/FoIJnZVX3jBcb06
	etZJpQ4/oOw2QhadHLeB73qVL+IBXT1Qgostw83QqsGuU4=
X-Received: by 2002:a2e:b8cb:0:b0:3a1:6b7:c4ac with SMTP id 38308e7fff4ca-3a10d5e6119mr3978821fa.27.1786532250594;
        Wed, 12 Aug 2026 03:57:30 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:44a5:16e6:5436:f44e:c789:f9e6? ([2a00:1fa0:44a5:16e6:5436:f44e:c789:f9e6])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1084e60bbsm4012811fa.42.2026.08.12.03.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:57:30 -0700 (PDT)
Message-ID: <c6451b0a-8558-4a70-9b68-a486da65b913@gmail.com>
Date: Wed, 12 Aug 2026 13:57:27 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] arm64: dts: qcom: ipq5018: Add Super-Speed
 UNIPHY to USB node
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Praveenkumar I <quic_ipkumar@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-11-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-11-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/12/26 12:34 PM, George Moussalem via B4 Relay wrote:

> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the USB3 UNIPHY node to the USB controller node.

   The same comment here...

> In addition, switch to the pipe clock supplied by the USB3 UNIPHY
> instead of the UTMI clock.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index c98889a7c26c..01b8181ffa40 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -631,10 +631,8 @@ usb: usb@8a00000 {
>  
>  			resets = <&gcc GCC_USB0_BCR>;
>  
> -			phys = <&usbphy0>;
> -			phy-names = "usb2-phy";
> -
> -			qcom,select-utmi-as-pipe-clk;
> +			phys = <&usbphy0>, <&usbphy1>;
> +			phy-names = "usb2-phy", "usb3-phy";
>  
>  			tx-fifo-resize;
>  			snps,is-utmi-l1-suspend;
> 

MBR, Sergey

