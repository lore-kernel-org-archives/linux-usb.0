Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172E03AD513
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532193; cv=none; b=G1D9/VXLg10mf8oTKy95TrRsaOAhK12UmMAMIUgtSf119RuU+iUmuJYR3lg1gkvHwg7BI50GIB/w+Zg53eFPsniwy+lBpI5QOUVr7X4gSjRlI6OGQlSytZf4TcMRbKF45ZXx37mSk1FcMN/Zb5XE/3CYo5qUdzc1x0s4qrMLz0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532193; c=relaxed/simple;
	bh=7Z02+fljkLPe3KL3kcGUkTEIsxSUDuJ09GtiEyy2x/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSgJbU38ASzsMJ8NvW0mz7Uo6p/pJ6f6ix17xOSd9hGB3hvID1lgA1UEV3wpNXzDqwdz5AdEizgmAv0+lRfhc6HyUaNTAqgfjAzJhjwVgVRHdNMQNlT3/bC2qdHtxSbieBySk/oZf0BYJIX8r91YVYUT4nfT7F6aXJayL0T3oac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pR0lAuOk; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR0lAuOk"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso995820e87.2
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 03:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786532190; x=1787136990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITtfty8oisAJyNjU306eVUiZ+XmY+gnBC8OefItjx74=;
        b=pR0lAuOk4HTc7cSYev9y1dO6aTataae+d26OecPIC2hZmqr0OWvhzhZ108cDpmT4+d
         H672a/I99MC+mMTtH7HKoZlD8nMegmEdO1CR8DxBPzUfOY8lzLCrvzWTacdEHP/aqNbq
         W7cgSvxQ2+1HKvtAFmkakRZrHdvkcFoSlB8867/flGSQeAz4ZEORDPO5G0O2nx3ImGI9
         3tP/ccDiPAtG+1jHUrDl7SO3FnLXiK0+QKt2uXmkiWjmN0Xdun8riW7U2ix7iXIrd0TT
         Ul7BIZGip2wWunrPX5uORcTTof/mQ+5InZVwSe67cTJAGh9WpHV4JQH086E//7X8FZNo
         44uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532190; x=1787136990;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITtfty8oisAJyNjU306eVUiZ+XmY+gnBC8OefItjx74=;
        b=nRreYT/CfGWWcTNrF13VXrawRLDX2Q9AnT4E3NIqlbvkngwgaFDoe+lN32ktFsY2JD
         WrG8DBPoWyBbaDFmnsTj5w9BDSrEr/PdQSlT8zPeaR8dd4yBPeX3xU2KByJxHrNY0/0y
         DVZm5t6M/x15Z4WP0BdEYnk3E7m85IVCf7/7U79aM4Xp1c7MLvlqFIrp3sQIuC47aLDS
         yabBFjZtRJ8B/BfJLuV5Qj2RcdqES1a0+OUogmuwC37D60Qw7bYHke0OtEX4snyZ6MgU
         2rQCFPBwA4AY/wXcPkmo75FxaPE8ww6nGX17F9oE1dc4tK1ID7r3jDIHyrfKJHPgta46
         NHNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6kLthYVMlKv0Myo4iQQq3dqemyJw9NuKOdgBwdknpO9R3VkIO0lDJK09JOOwWAHlYg4cWLs6sSdc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9yT7u9U4Ss5HFWBXhLqzEOB0JxNQlNs8ND2WptmP4y7Csi484
	xn0lXCx/RpOKyi8Xd7w14OLX7J54x4ZoDLI+y2mjFzm341rvEUX8GhJR
X-Gm-Gg: AR+sD10ApRl0dBWPnaUo/i6ZXwkDFMJ2hCu74GaxTwBNSPmHLLhkZhi6Xo1/igHfHGb
	WPIVZyMWY1RpE2q+5gL0RJ/jfoyKPt/MIZKIT7pE2DLq/m5/IJZSMwnmCGhFQAK0ajGvOdA/JPv
	iD561V0LKhLiAaBEj7ZEwCySXueDxULIUusZ2dAsG3I7qqey+wfEX0TnYorjGlsn2s4aCP760ur
	gXr9ZBSRG1wxYyhbgkfh93bZK4sHb1G1pVdts09glyIuEO6mMYzu/FGKWETDX+8jS34LFFj4+yf
	HSZlBfm0xaD+mcBybaKxdomZWR1TUwOtgy0sPN8nWEYm/hAB861cPTIKCR/gHLyTj60+3Hoklw0
	FduJz0CTqaXgsAcSZM0QTflKwEbYIm+LRlDl6Gt3QAjfe3HRh+OAzr80wAMjf4I2Gs8eQEWZWvK
	9I/rVbnwcHb1j/ptSvw26uBm8/fyfoP36gBV32qHv33gO8W4w2+9mA6YD53dmVZrGtAgztTnEJL
	FdHR2+su0IwbJxk0H4Sa2UnNJumWWYMMJcBIHl++iyzn93ASknwdickLg==
X-Received: by 2002:a05:6512:3b91:b0:5ae:9dcd:d04a with SMTP id 2adb3069b0e04-5b44e2f672cmr625996e87.29.1786532189904;
        Wed, 12 Aug 2026 03:56:29 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:44a5:16e6:5436:f44e:c789:f9e6? ([2a00:1fa0:44a5:16e6:5436:f44e:c789:f9e6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d0478d1sm429376e87.72.2026.08.12.03.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:56:29 -0700 (PDT)
Message-ID: <6b83cdd0-0800-4a2e-af36-e780bed4d127@gmail.com>
Date: Wed, 12 Aug 2026 13:56:26 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] arm64: dts: qcom: ipq5332: Add Super-Speed
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
 <20260812-ipq5018-usb3-v2-10-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-10-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/12/26 12:34 PM, George Moussalem via B4 Relay wrote:

> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add the USB3 UNIPHY node to the USB controller node.

   You're not adding any nodes... Perhaps "refer to the USB3 UNIPHY node"?

> In addition, switch to the pipe clock supplied by the USB3 UNIPHY
> instead of the UTMI clock.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index 664586979ec4..6253443c8d7f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -523,10 +523,8 @@ usb: usb@8a00000 {
>  					<&gcc MASTER_SNOC_USB &gcc SLAVE_SNOC_USB>;
>  			interconnect-names = "usb-ddr", "apps-usb";
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

