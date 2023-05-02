Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366B2C77B7E
	for <linux-usb@archiver.kernel.org>; Tue,  2 May 2023 11:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbjEBLHF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 2 May 2023 07:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbjEBLHC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 07:07:02 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DF3D2
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 04:07:00 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ec8148f73eso4278389e87.1
        for <linux-usb@vger.kernel.org>; Tue, 02 May 2023 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683025619; x=1685617619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sf80UbBVaV1xqcq5jn3dFOlS0sh8XQ51kwgxGAit90c=;
        b=sXVVjJVfKTHbg0F2b3766LQHbKtN1Au6ylJugtdsuOWZ6+B60l+HXuGMnRDQ1zufRR
         skamJDeweJbUW4tpr2sv5valdNgJDe8khKBO0iRsRf0xbeNLwKp1NFtwb/sAg+UlHjgT
         fTvtvxE+7KLVanHkAcSflUoujfr81NjoH5ttpjvV1hrKlRMaNMPXZH6pnhOciKz9VGx7
         YtpYwTpZ/JYtxeb+kAsTkPNZr2wDK+hqunwUmnJqWeg4YnzfBKzJUm3XgQ4DKL2BOdE7
         7Fr5P+ztBeok5iwLoYv17+GJVs+7fuGyIou4BzMKowJpCujOqI4fKTdB6EtbASpKt5LP
         kvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683025619; x=1685617619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf80UbBVaV1xqcq5jn3dFOlS0sh8XQ51kwgxGAit90c=;
        b=BSjG8ulizNETcGtsAFABNbpfPGrr/wr4+/vsjzBcTD80OGwr2P3+jkCY4+Y63DKLVi
         en50jzAkG6YMJDZmOZiZFbk9ypE5UEbDzttvo6PNsTDu6/tn1YixC2K9zFpe1u7XK2Hv
         cNuril8lLCGKeb6JevV1J+1yuCXbhZUo9uUFv0XxuiS54Zjx5jq7TrfbfdZcUm9mFI5I
         +SoE4IA/YYlX22sAsGJKxYzM+b/OXRARqfLZFKYEpG/an6mRsKu+YWQ6Tl1yVWUe9GzY
         +DbRKAGLjfxiRUk0HRSJPonN/9eeJljvCypEg3KjdB5OeNrjvsGXMrdY9isliSy5guT2
         Rr5w==
X-Gm-Message-State: AC+VfDyjPGZAQdA65lvBZQllsACciAUOsMxVuEEA4yGdNT+xgGcjmVF8
        w6loOXayYd+5OL6Nq2YTjR3SJg==
X-Google-Smtp-Source: ACHHUZ4kZ3JPIJCWykOWKX34CFRBP537jQbGbg4vGYhuylE5N4cB/b04/Nx48My5ou3pgkdynrIZbQ==
X-Received: by 2002:ac2:46fb:0:b0:4e8:4412:1d95 with SMTP id q27-20020ac246fb000000b004e844121d95mr4213948lfo.29.1683025618831;
        Tue, 02 May 2023 04:06:58 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id j22-20020ac24556000000b004edc72be17csm5294762lfm.2.2023.05.02.04.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 04:06:58 -0700 (PDT)
Message-ID: <8c8a7c25-9eae-7ded-61ce-2ce22b7b76dc@linaro.org>
Date:   Tue, 2 May 2023 13:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 8/9] arm64: dts: qcom: sa8295p: Enable tertiary
 controller and its 4 USB ports
Content-Language: en-US
To:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, quic_harshq@quicinc.com,
        ahalaney@redhat.com, quic_shazhuss@quicinc.com
References: <20230501143445.3851-1-quic_kriskura@quicinc.com>
 <20230501143445.3851-9-quic_kriskura@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230501143445.3851-9-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1.05.2023 16:34, Krishna Kurapati wrote:
> Enable tertiary controller for SA8295P (based on SC8280XP).
> Add pinctrl support for usb ports to provide VBUS to connected peripherals.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 47 ++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> index fd253942e5e5..7e6061c43835 100644
> --- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
> @@ -584,6 +584,19 @@ &usb_1_qmpphy {
>  	status = "okay";
>  };
>  
> +&usb_2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb2_en_state>,
> +			<&usb3_en_state>,
> +			<&usb4_en_state>,
> +			<&usb5_en_state>;
This is misaligned. Also, please do property-n before property-names.

> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";
> +};
> +
>  &usb_2_hsphy0 {
>  	vdda-pll-supply = <&vreg_l5a>;
>  	vdda18-supply = <&vreg_l7g>;
> @@ -729,3 +742,37 @@ wake-n-pins {
>  		};
>  	};
>  };
> +
> +&pmm8540c_gpios {
> +	usb2_en_state: usb2-en-state {
> +		pins = "gpio9";
> +		function = "normal";
> +		output-high;
> +		power-source = <0>;
No drive-strength values?

Konrad
> +	};
> +};
> +
> +&pmm8540e_gpios {
> +	usb3_en_state: usb3-en-state {
> +		pins = "gpio5";
> +		function = "normal";
> +		output-high;
> +		power-source = <0>;
> +	};
> +};
> +
> +&pmm8540g_gpios {
> +	usb4_en_state: usb4-en-state {
> +		pins = "gpio5";
> +		function = "normal";
> +		output-high;
> +		power-source = <0>;
> +	};
> +
> +	usb5_en_state: usb5-en-state {
> +		pins = "gpio9";
> +		function = "normal";
> +		output-high;
> +		power-source = <0>;
> +	};
> +};
