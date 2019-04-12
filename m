Return-Path: <SRS0=sojL=SO=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA22C10F0E
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 23:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E21A218A3
	for <linux-usb@archiver.kernel.org>; Fri, 12 Apr 2019 23:57:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YTq0B8qi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfDLX5l (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 Apr 2019 19:57:41 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40354 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbfDLX5k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Apr 2019 19:57:40 -0400
Received: by mail-pg1-f193.google.com with SMTP id d31so5900314pgl.7
        for <linux-usb@vger.kernel.org>; Fri, 12 Apr 2019 16:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O98HxbwnFGA0LXpH3QHuvwoi0B/dgwdToX20ealb2dY=;
        b=YTq0B8qijrPebHnCd4esDmzBOJEDTqyqaqypQbC5wBl37OQe34tN/PZmn1/7t9TcW+
         vFflXNLqTMS/vu4kEgY5paZLkDGFgh9HTp81bhVVE2cn5DZCF5hcwmQ2Yq0cq35WKiYb
         xA5xOL+smZFBw4SCZK5GDl7zPQ/u8anQ02fwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O98HxbwnFGA0LXpH3QHuvwoi0B/dgwdToX20ealb2dY=;
        b=f/IfJbkR7Y+Axc8aXWn3cYn7G6Xqvb2Lj/SvwyKqYP40VQHfxSEWQ9y3UbvYVht75M
         gf/QqNL1yBDWKGoxNxm8DEUCGYQUZhcw4vqVb17uO9pxcGBtMQLB28TdYyYm9pD9KsmR
         nwQqWmcEPgUShkJapq9WpUdhwVtkWdk7DIp5Gc1d8vobVD7zy9Ck9NyewY4fvCVIilHx
         iIh9IAfGF2jSDhqI9XhCDMfH1m8RBDTqBlf8SK7FBPLuhId6Cd+KrO68/hJu2znPM9fh
         LJP1oZiFNnkkFqUgCU7zNKi8CNDf4qNFaWVQIDgwpKNXObMConf+jsZL9roaRO4X+H9t
         QLkg==
X-Gm-Message-State: APjAAAX3zFpJ2djYxt4+YUc6E25i8e/ZLsADiIfdWJqG+pYrODUd6v+I
        sDBb/tdnhYcoJ0CGc2Tb7paUGg==
X-Google-Smtp-Source: APXvYqzph+0g724uTsm+XhqVf4TsTSk511KELjHMdXoMLMZDwkNI9+b73KtXmP/CrmE8SkH8PoSCTA==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr55889651pgb.117.1555113459734;
        Fri, 12 Apr 2019 16:57:39 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id e4sm59968821pgd.32.2019.04.12.16.57.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Apr 2019 16:57:39 -0700 (PDT)
Date:   Fri, 12 Apr 2019 16:57:38 -0700
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
Subject: Re: [PATCH 4/4] ARM: dts: rockchip: Add quirk for resetting rk3288's
 dwc2 host on wakeup
Message-ID: <20190412235738.GZ112750@google.com>
References: <20190412224149.106971-1-dianders@chromium.org>
 <20190412224149.106971-5-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190412224149.106971-5-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190412235738.BDh0Nb2BcZwMTaBXWHuvuc_CcOZby2cRqxI0XqWYgrI@z>

On Fri, Apr 12, 2019 at 03:41:49PM -0700, Douglas Anderson wrote:
> The "host" USB port on rk3288 has a hardware errata where we've got to
> assert a PHY reset whenever we see a remote wakeup.  Add that quirk
> property to the device tree.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  arch/arm/boot/dts/rk3288.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 92e0600595f8..6367c1b50fd7 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -617,6 +617,7 @@
>  		dr_mode = "host";
>  		phys = <&usbphy2>;
>  		phy-names = "usb2-phy";
> +		snps,reset-phy-on-wake;
>  		status = "disabled";
>  	};
>  

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
