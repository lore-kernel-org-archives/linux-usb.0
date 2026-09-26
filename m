Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784283DBD5E
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432746; cv=none; b=aYyqwn7K2mE+rZEybL+ZWlaie6xx0dyYx+2Q4IzRkiVsBLYBCmxQlTg1ZEsYCoNZ2PiKZgoTWJUVbksmTFGH3oh1WT/6Ol+/voabN8rh9vjCrfq26SGZpPyy2+ZplHlVv31DWM1bJRTRwNrf31/4uh2N5qFCS2RuLu1PF4Eqf7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432746; c=relaxed/simple;
	bh=sjXsu7Wk9oEJK2CdX+yMd1S1zZaVAPHVkhDsFazZ8Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7Rx2nyErgqOxF2teO8VLSuvhrlGzCborjp64JLmCBYnFvOxn4PDxBwdN6ry5evSue2trb+gRO6E1mI14e4qtKLTME5rMIhz7FV+8bdEyKw1d+apBpqdL5YL6kcdz9mOXdktbXXV7MoVg+q3YR7V9zIfsrzJWCrl/0OopnrcZZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+J2Rni3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+J2Rni3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso958285e9.3
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790432741; x=1791037541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y43NkA24svrY78BBtc2WACNWICreOcqz7QrQruDzQ7g=;
        b=E+J2Rni3FaKWzzynITShS3+ZWZso5J0+VS4o7JSQAuOYIQs77EHACLSHEQ05RLEnr7
         Yhhhq4lsEBbcQuRD6w88Xu4QCBw1W/hAPZ1Op/uiBbcRiZ/NG+Zt88A0YtDFkHYxh+mW
         di6jOPDy690zs2AY0kl+fEIOJ3nxbOmMT7gt6s8NNNC4dfed9w/wwaF29AwtrEWAJouE
         25vyoHv9ErxSEYHPh5ek7dPxd9ZUs6a8xz5vW9TcPdxDZbOS/gI2/uxoa0gVPmf0gjer
         fxLNxHlr3vIH2iD9oCupWmt4j10vgUPxOk0FXwqx7pj0Htm59AV7j35j74i8tBA59uvi
         LhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432741; x=1791037541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y43NkA24svrY78BBtc2WACNWICreOcqz7QrQruDzQ7g=;
        b=TCMHFLzT3VZCgUHk4tywENjHOobC3qktQKZohjvXSdll+Bgrf2MzPgiTH5QIml5nxs
         htV5/tKSoj8s0SoHjivLHXfyK8T1QF3rvgl4LD1+UWVdOwwCN70+ayW5dXqIjlzfqw0M
         J5K7ozUjYqqFqUFBia3aqP+AzM9U+lXE+7OJVztwlayTZEood2x3K+FTvOgXY2G+Cw0/
         /9ojyTP66OiQ+HDsm9xyevZBlr1ME8eyT+8hup81hSl20QKNBFJAR9RlETfEvhFeRz/n
         ay5Vv+YbCrCMWyXC5mixpRvfxzP/xfEwr6mXAYHSyJwItgiP8APl/EnQ9iKFWXaw4K/C
         k4vQ==
X-Forwarded-Encrypted: i=1; AKwUvBywRIDIhNCdMiuXBlZWwNpB0KoTe2Dpl9SD5eLoYs13bBLBCTWoJtJBjOkR7CNyD3ukken3g92ohkw=@vger.kernel.org
X-Gm-Message-State: AFuF++kjOnkvcegWo/A0JU7F21jQEMMafxuBpMzZ5A+nl31IZjMMVgKz
	sw27cSJuD2oVn6fDV02BbdJoCqy7Siu7SdNBrqKu20tQespqVFP78oeWbHI91yJfPLI=
X-Gm-Gg: AYBFou1nr4uxs1qr/rD5POiu5HHMIVvhg3kX7Jb4gPTZDvvNck4sbHuHQxN1+AJVmoj
	MWzNUwFzjZYARpG0cWHkJfPhTWbEdjloWmUrdvoPif/muTSNj4f02CAy62jsVDXtfuDX/GeMbcF
	61i+qR01/kSGzK3NGG2mOS/o7+VGb27Pcy1yvz8OvGSts/xu7o5q40ZCcNg3FK8CmCEyyHxmJxh
	UO8riXIXOTmvgO8+iruEsZyRuwOmfm9bwJdPx5xxlumrBY7FFFwQZX55w/BlbKd6BjS98EaM3Zn
	GGZ0B4ZIrUnJ+/L11DIAYX+7oEHetHN3++Ajt8an62OuOwYnvyhpe+tsEDolQ1XsH1jkbXluoUa
	Xzh+NFN7ZJE58qTS5ybBsoGwgCDyXM8GeU+3xW70SOK+75j+ydDswKKjr5x1oOCNwXEUE9WBxDG
	NunKuyurSHoosVPwt3Dnb9573yKICc2tkrT5UdUlEsAYgtA8BP78gdATS78Q9Rg6rsh/3A81z6t
	qH7JZ2y9mo=
X-Received: by 2002:a05:600c:698d:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-49fff32848dmr11092055e9.16.1790432741347;
        Sat, 26 Sep 2026 07:25:41 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fc189sm101995495e9.3.2026.09.26.07.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:25:40 -0700 (PDT)
Message-ID: <10108920-4109-42ab-960b-85bfb4a49a80@linaro.org>
Date: Sat, 26 Sep 2026 15:25:38 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/12] arm64: dts: qcom: pm660: Add USB Type-C port
 controller node
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-7-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-7-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: Alexey Minnekhanov <alexeymin@minlexx.ru>
> 
> Add the PM660 Type-C port controller and PD PHY device node.
> 
> As on PMI8998, the Type-C CC logic is part of the charger's USBIN
> peripheral at 0x1300, the PD PHY is at 0x1700. The node uses the
> 'type-c-change' interrupt from the USBIN peripheral for CC state
> notifications, plus the 8 PD PHY interrupts, including fr-swap.
> 
> The node is disabled by default; individual boards enable it and provide
> the USB-C connector description with PD capabilities and port graph.
> 
> Assisted-by: LLM
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/pm660.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
> index 156b2ddff0dcb..37965a3607417 100644
> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
> @@ -85,16 +85,43 @@ pm660_charger: charger@1000 {
>   
>   			io-channels = <&pm660_rradc 3>,
>   				      <&pm660_rradc 4>;
>   			io-channel-names = "usbin_i", "usbin_v";
>   
>   			status = "disabled";
>   		};
>   
> +		pm660_typec: typec@1300 {
> +			compatible = "qcom,pm660-typec";
> +			reg = <0x1300>,
> +			      <0x1700>;
> +
> +			interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x2 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x3 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x4 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x5 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x6 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "type-c-change",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +
> +			status = "disabled";
> +		};
> +
>   		pm660_temp: temp-alarm@2400 {
>   			compatible = "qcom,spmi-temp-alarm";
>   			reg = <0x2400>;
>   			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_RISING>;
>   			io-channels = <&pm660_adc ADC5_DIE_TEMP>;
>   			io-channel-names = "thermal";
>   			#thermal-sensor-cells = <0>;
>   		};
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
