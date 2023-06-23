Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22B3C001B1
	for <linux-usb@archiver.kernel.org>; Fri, 23 Jun 2023 22:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbjFWWmp (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 23 Jun 2023 18:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232414AbjFWWmU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jun 2023 18:42:20 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B70DC
        for <linux-usb@vger.kernel.org>; Fri, 23 Jun 2023 15:42:19 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f122ff663eso1588481e87.2
        for <linux-usb@vger.kernel.org>; Fri, 23 Jun 2023 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687560137; x=1690152137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ceYAW1D/l6c2aC4P/IW3chCmC7PvALUSV1nl27dPWYk=;
        b=mgkAs6qZt8kuxOrDzoIZW4QCsDGDfDvOp5K8+jJ4wLDqBhPKx6vxhSTZZV3moO+sHv
         Gpl3LzveWrWexOcqc3yoLXcC/NNwceYa3eFx4LX1qtxsrbz/+ERKLhl1x2jflZYEK/Cu
         eyocr4i0CYgI3vCrc8iLDoZkExslBF20eEhcDAeUhtcsY4I5AD36soe0UWLmrgFnVAj8
         lUOEhKtiLa0CabJfo2tuEZVrViL1AZZ5h+e9A4k49C/0YEHmwSgUdsF7Sk+e+feC1FDI
         D/BeWmsvJSO1IObUhGsELs5V8UknLKu0b68376fK6X0KQwxO4dZWla+vZc7GWHhV/g6d
         Jpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687560137; x=1690152137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ceYAW1D/l6c2aC4P/IW3chCmC7PvALUSV1nl27dPWYk=;
        b=NX6ptzRPVGEL8Uxf+5sUWC7lE9XIlizuwzrTbjFbj4DEYjfvWhuQvtsF2LvOr+Cklq
         FIyQlgtqK099xDCkLjt4NFSXNS0+Kke3VOSAYKis+bjICjDtv1XaPkfyNuS5OJB4Kys+
         cqc+DyJch86WH19ncj/Fk4eEyxPUNR/3SXxFwYx4EKaDTFvx1V0qC1v87Om1koFo1z+i
         wQlzBEpnetltheRi+zTJ52Rl1N4+j4WPB+7mxuaExlGPre6zZCYgJu1A8Y1ihg4cBL6e
         qlSNZh/XcMAs+uhIlnxBbDD6G9Ey/G3xfM4BVMXUxpcdTo8x3Q7js7Wzs6CFT8Jj4Ngx
         vmjQ==
X-Gm-Message-State: AC+VfDzSK2ZoTY3T0x8OaYpDIx6wrqMOAM1iwEvUzIYtqv1oA2WkLey/
        ZDHHVSiAC62aI5keJEOnDmWXVw==
X-Google-Smtp-Source: ACHHUZ4GWtl3oNIy1/jbJrzgy1m8PE7Ek4gU3iSOPeZeCRWVhPUTCk0F6/icRBQLhgZBUNQ0e3Y2OQ==
X-Received: by 2002:a05:6512:556:b0:4f9:5673:f6f4 with SMTP id h22-20020a056512055600b004f95673f6f4mr7400008lfl.59.1687560137537;
        Fri, 23 Jun 2023 15:42:17 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
        by smtp.gmail.com with ESMTPSA id v15-20020ac2592f000000b004ec6252aa37sm54482lfi.116.2023.06.23.15.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 15:42:17 -0700 (PDT)
Message-ID: <144c5bff-6d81-b681-57ac-b1e51993c9b3@linaro.org>
Date:   Sat, 24 Jun 2023 00:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v9 10/10] arm64: dts: qcom: sa8540-ride: Enable first port
 of tertiary usb controller
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
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com, quic_harshq@quicinc.com,
        ahalaney@redhat.com, quic_shazhuss@quicinc.com
References: <20230621043628.21485-1-quic_kriskura@quicinc.com>
 <20230621043628.21485-11-quic_kriskura@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230621043628.21485-11-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.06.2023 06:36, Krishna Kurapati wrote:
> There is now support for the multiport USB controller this uses so
> enable it.
> 
> The board only has a single port hooked up (despite it being wired up to
> the multiport IP on the SoC). There's also a USB 2.0 mux hooked up,
> which by default on boot is selected to mux properly. Grab the gpio
> controlling that and ensure it stays in the right position so USB 2.0
> continues to be routed from the external port to the SoC.
> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> [Krishna: Rebased on top of usb-next]
If that's your only change to this patch, you should have kept the
Author: field unchanged.

> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
Same comments as patch 9

Konrad
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> index 24fa449d48a6..53d47593306e 100644
> --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> @@ -309,6 +309,19 @@ &usb_2_qmpphy0 {
>  	status = "okay";
>  };
>  
> +&usb_2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb2_en_state>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";
> +	phy-names = "usb2-port0", "usb3-port0";
> +	phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
> +};
> +
>  &xo_board_clk {
>  	clock-frequency = <38400000>;
>  };
> @@ -401,4 +414,13 @@ wake-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	usb2_en_state: usb2-en-state {
> +		/* TS3USB221A USB2.0 mux select */
> +		pins = "gpio24";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
>  };
