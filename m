Return-Path: <SRS0=yIgR=TV=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E21C04AAF
	for <linux-usb@archiver.kernel.org>; Tue, 21 May 2019 06:11:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 263F520863
	for <linux-usb@archiver.kernel.org>; Tue, 21 May 2019 06:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="iFIH049I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbfEUGLk (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 21 May 2019 02:11:40 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:13599 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbfEUGLk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 02:11:40 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce396980000>; Mon, 20 May 2019 23:11:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 20 May 2019 23:11:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 20 May 2019 23:11:39 -0700
Received: from [10.19.108.117] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 May
 2019 06:11:36 +0000
Subject: Re: [Patch V3 6/8] arm64: tegra: Enable xudc on Jetson TX1
To:     Nagarjuna Kristam <nkristam@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-7-git-send-email-nkristam@nvidia.com>
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <f9ee9726-3621-83ba-d07f-4592e5d4ad10@nvidia.com>
Date:   Tue, 21 May 2019 14:11:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557988772-15406-7-git-send-email-nkristam@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558419096; bh=V8jtuTDmL5o+6sv9+K24ZKBOp1hdrT/nLOP/Sa/HG6k=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=iFIH049Id9O/SHficoCWT/iTenfIOlED0ecG8/Il7g7RWN4zcOVpSDQK03PMOiaGL
         72Qdw5AOObXu44HKH2QPTLBP39pCBdnirftkkGovCqb5Yt2PZtGcZdixZK4XGBDWWq
         +yrnMN3DoF5uKlo66QXxZz632CYfY235drKob/KpE8HFaQy8IomOE25bh2KAUy93Ce
         H3tnLupzqsESdMgV2rYMni4JPYdnsPR2LKbeyESeY0jB4p3BQP6uNaeSUnXWmTaqsa
         tbJtq0zdYvqsRyG1rGFL+D/8Sg1taLqzwEQR3J8+PgdmVo+FYBOGPM0awImRZoDijV
         Ki6e8lthWaUeg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reviewed-by: JC Kuo <jckuo@nvidia.com>

Thanks,

JC

On 5/16/19 2:39 PM, Nagarjuna Kristam wrote:
> Enable XUSB device mode driver for USB0 slot on Jetson TX1.
>
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> index a7dc319..e0e67cd 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
> @@ -1483,6 +1483,20 @@
>   		vmmc-supply = <&vdd_3v3_sd>;
>   	};
>   
> +	xudc@700d0000 {
> +		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
> +		phy-names = "usb2";
> +		avddio-usb-supply = <&vdd_3v3_sys>;
> +		hvdd-usb-supply = <&vdd_1v8>;
> +		extcon = <&extcon_usb>;
> +		status = "okay";
> +	};
> +
> +	extcon_usb: extcon_vbus {
> +		compatible = "linux,extcon-usb-gpio";
> +		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +	};
> +
>   	regulators {
>   		compatible = "simple-bus";
>   		#address-cells = <1>;
