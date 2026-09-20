Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5AD394496
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939297; cv=none; b=lj2NG2e2/O1BKgkwsJuvj40DgztTQOCZk24cn7m3X1ITkImdH9ZdL0hDw9oLtyCj1DHXBERrP24wnUR10+5/I2T8HVUmWD0VnZWBnqa2VmyIyq+RQzfYhsA2k7shi4eJ+Q9uss+8MEfUlgLp7v7CcVBS/zqwcnWcFV6JPUfuczQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939297; c=relaxed/simple;
	bh=qoKr8F73jXZwuLTCYhGa0Hp+b6lJiLywfTbygYS4GYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmPUUD0xALB8zIAOrRAxrg2UZRixfoPtNY+IE5PQtas27FtZQZoHqUaOSQDwZo1/6oyL9oDUaeo48JoFIVGQUptB7yykXsNECIPrPIVe1SAR5fEu2DlvAyrwJJKAuNqSGVi5o1BvAyZRQhyhxHoi6jIMhQ/7fyiz2PzRVXPCze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9wPDC94; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9wPDC94"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so3524897a12.3
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789939294; x=1790544094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bHL0bqzjiVcWZ4wR3C4oOtKMYoG1Qe+r8qIwvuj52cY=;
        b=u9wPDC94k93C89cV8kHPTS7s6kfPnF6GFUD++1XUV8QXjWXUty5xJ1Bp3DsznbitbU
         JLZPyogRvCqN9XhnZGHiFWveOHMQd3MIl0eMFIAcTw61QdZEKL1Cyf8+9OKGY5frrbwo
         8Ht5qjvtf7vvmB9Y7Pq9dd/57B3Pn4rg61n5oZgHiLcheEvuXforkZNbyeTmwK8OR2rU
         aLNDpgcokBV2tJwhM0YjD8gwnvLiNdWDGTj8EI6rcwL2vgjqnWy7SpdaNGcHi4zW6WAy
         A+09nEqJaJnyuUyitvs2VX0YWufWSQblrEMVQP8Sdev6JxkTXAw9LNFGT9avVJtkhAzo
         /2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789939294; x=1790544094;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHL0bqzjiVcWZ4wR3C4oOtKMYoG1Qe+r8qIwvuj52cY=;
        b=xBFoxp6wULaDayNBXRTMFRGilXM42Os3vt4KOY3C14z3XgcXcrWb0lFYu8Zf6V0kew
         x51ixtZjfzZ4zCkqbetsEvDIFncwsyHGFMxOv5GB19eK50vMlFRJ5O/Evy5XB+F7rIky
         cGUsG1JmxgK1ukBQS7Fd+rom09qqBsvcmy80fU97a9Gm1VVxfsdJOP1ozY6SLO2i/QA2
         UvoJDRWdabRH09FievIidNFLVZOjzk3Y0uE6dgjEe3pWCl77o6BbSoHXlB271t/hNQbB
         HvjL1ABlvJ1r/LSahp+1No4sCgcUYou73DoQZh5yz1Fb5OujdIx9ft3bTumRMbsfj/9f
         twCA==
X-Forwarded-Encrypted: i=1; AKwUvBxRB+h0iyAS27cV3fEXiiJi3uuc2VC0HkHgUCwngDTVIkSFw5pHjKakKUFMejA3/b+egexpWRCt0e4=@vger.kernel.org
X-Gm-Message-State: AFuF++ljPyzlWmqJfdfUpJf3JA8QZMruktZxh220IrcD9uPZnpmMZYjT
	aeE6FXuVjos/sxq7t2lczj163BLwNEv6+YTVwwpZ5VELo9EmLV+MIEu32naLQzj5fao=
X-Gm-Gg: AYBFou2ZNb809QEGHoXmnVTQ3pBzo3o0Vh7FZ3NazgFEGxsWaOX6MNhr9RnwCGl9T17
	atO8E6C/jaxT3Ws0WMv9Boz7nvXsL1+PbzFmgfOXo5Nuu71A9eY4vDRf7Re8WqXl0Ql1L4egWel
	e8Wq8lAsa5I8phpWZK7IEazGbhIN6zyVhangFNA7llKRyIlooH2h4IA6CScFlGvPThW15hPLQHI
	1fskJPVxxkEO++a8o1kpeV7/hQB/hZwdb3dRpm3ADLffFAGFLmgmE7BERyVV73l9O2QcOb+C9CC
	8YUp+ixZP5/ierb+ECPlxzynExH84R8KSvphmspgTGt9tTF+EOIN/5was8USnG4n+XZJ2Jg7RlI
	pE+4+Mk6A3syH2i4vcL6IWxXkbRkpc7CKxq8RS/YwiuSV91NDPtReGk7pb9K//C5lDMFlFqbtQU
	B2xl3iR79P92zkK76CodyN4DuGnW4AeMHO3+hAQH0+yBNfffP5q5RDNBaMSZxNcmB1C9oyV90E4
	Rpt/YRnR08=
X-Received: by 2002:a05:6402:23d2:b0:6a9:f874:6de8 with SMTP id 4fb4d7f45d1cf-6aa559cd4dcmr5546423a12.0.1789939293867;
        Sun, 20 Sep 2026 14:21:33 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.73.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dd0000sm3062351a12.17.2026.09.20.14.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:21:32 -0700 (PDT)
Message-ID: <95cc550d-8eac-4d1e-a61e-60595afa9ce8@linaro.org>
Date: Sun, 20 Sep 2026 22:21:29 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: usb: qcom,pmic-types: make example use
 generic VBUS property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
 <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260920-fix-tcpm-vbus-bis-v1-2-cc9347bbe81a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2026 15:37, Dmitry Baryshkov wrote:
> The commit fe2195b019f6 ("dt-bindings: usb: qcom,pmic-typec: deprecate
> device-specific VBUS") switched the schema to use generic vbus-supply
> property, however the example continued to use the old, deprecated one.
> Update example to use the expected style of specifying the VBUS.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> index db487562cec4..dd56dc8afe03 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -176,7 +176,6 @@ examples:
>                                 "msg-rx-discarded",
>                                 "fr-swap";
>   
> -            vdd-vbus-supply = <&pm8150b_vbus>;
>               vdd-pdphy-supply = <&vreg_l2a_3p1>;
>   
>               connector {
> @@ -186,6 +185,8 @@ examples:
>                   data-role = "dual";
>                   self-powered;
>   
> +                vbus-supply = <&pm8150b_vbus>;
> +
>                   source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_DUAL_ROLE |
>                                  PDO_FIXED_USB_COMM | PDO_FIXED_DATA_SWAP)>;
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
