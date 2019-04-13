Return-Path: <SRS0=jcui=SP=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B922BC10F0E
	for <linux-usb@archiver.kernel.org>; Sat, 13 Apr 2019 00:00:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 808DC218AF
	for <linux-usb@archiver.kernel.org>; Sat, 13 Apr 2019 00:00:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Hj2rdsYG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfDMAAC (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 20:00:02 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44200 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfDMAAB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 20:00:01 -0400
Received: by mail-pl1-f196.google.com with SMTP id g12so5829489pll.11
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 17:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bbs5HfQR8f9fFhny2Ldk4rVmZ4ck6fsnGnctynUeJJI=;
        b=Hj2rdsYGirEF7MWoO943LuyCyLbVApQG3+8mJE4FSamer4QZsl74O1Y7uCADeWXRGh
         mhQnjHa0nBVOFVAaXrTb+uimDfXoia+qCrUMyteltw4onb6WToGEWYck7B9pBnTbKXgp
         h43XFw3CjDawZy4CLT6zQfnxvAkQSkJk2cH8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bbs5HfQR8f9fFhny2Ldk4rVmZ4ck6fsnGnctynUeJJI=;
        b=iNnrCyt8BppWGFLEWO3YBSMcdq6YVeZzhnIIX1brdutPm/G3DYhfQxFgsUrdqElNpp
         ybFnFFpcVeEY34pHpSlZGdL1byt5iZKxH7tUWAJybeAitwXY3mDSJjCiIpGcv5hXFJeM
         nLd6hBHBo8j7K0G3Div1miiqT1dSIfucr3gRs4Rrr2CAweQGQ5IuwSHyIpvUPfNpzATL
         L3KhlxowE/evBsxcC8VO0ChbpI+ArbGDARYKPotLZcN3NW+7PBUcdcG43vorgTabfhha
         gSuP0VlkQlohsTwxfTFwyspQD5wop/DZ8uusqyHphSR/EHlKvsEKZ2bfGmefkBXP+ZX5
         y30A==
X-Gm-Message-State: APjAAAXHaKCD6VCYrFfCsMx5J3GmzqKPMwz35d8UQpeDFI9lpAoXQ2Ns
        KI9Rshtoi2DSYZxzvJqUWJp9PA==
X-Google-Smtp-Source: APXvYqxAK/W0boE3DYtmzFZCw7qH3Q53NJtfyhzCZQvQVzXa2qcfypGjOXHMbqIP1lyiF9xRexKdfw==
X-Received: by 2002:a17:902:d211:: with SMTP id t17mr58439284ply.214.1555113601260;
        Fri, 12 Apr 2019 17:00:01 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id m16sm104908447pfi.29.2019.04.12.17.00.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Apr 2019 17:00:00 -0700 (PDT)
Date:   Fri, 12 Apr 2019 17:00:00 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        amstan@chromium.org, linux-rockchip@lists.infradead.org,
        linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>,
        ryandcase@chromium.org, jwerner@chromium.org,
        Elaine Zhang <zhangqing@rock-chips.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] ARM: dts: rockchip: Hook resets up to USB PHYs on
 rk3288.
Message-ID: <20190413000000.GA112750@google.com>
References: <20190412224149.106971-1-dianders@chromium.org>
 <20190412224149.106971-4-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190412224149.106971-4-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190413000000.KqQi2FskkD4NxcGvfKpsP14XiIjBfU4abnQmgAQz5eQ@z>

On Fri, Apr 12, 2019 at 03:41:48PM -0700, Douglas Anderson wrote:
> Let's hook up the resets to the three USB PHYs on rk3288 as per the
> bindings.  This is in preparation for a future patch that will set the
> "snps,reset-phy-on-wake" on the host port.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  arch/arm/boot/dts/rk3288.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 2e604f0afa98..92e0600595f8 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -905,6 +905,8 @@
>  				clocks = <&cru SCLK_OTGPHY0>;
>  				clock-names = "phyclk";
>  				#clock-cells = <0>;
> +				resets = <&cru SRST_USBOTG_PHY>;
> +				reset-names = "phy-reset";
>  			};
>  
>  			usbphy1: usb-phy@334 {
> @@ -913,6 +915,8 @@
>  				clocks = <&cru SCLK_OTGPHY1>;
>  				clock-names = "phyclk";
>  				#clock-cells = <0>;
> +				resets = <&cru SRST_USBHOST0_PHY>;
> +				reset-names = "phy-reset";
>  			};
>  
>  			usbphy2: usb-phy@348 {
> @@ -921,6 +925,8 @@
>  				clocks = <&cru SCLK_OTGPHY2>;
>  				clock-names = "phyclk";
>  				#clock-cells = <0>;
> +				resets = <&cru SRST_USBHOST1_PHY>;
> +				reset-names = "phy-reset";
>  			};
>  		};
>  	};

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
