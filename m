Return-Path: <SRS0=SoRH=2I=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF22C43603
	for <linux-usb@archiver.kernel.org>; Wed, 18 Dec 2019 01:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA814206D7
	for <linux-usb@archiver.kernel.org>; Wed, 18 Dec 2019 01:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576633148;
	bh=hHQ7woKV0uumHBp/7tzxfRkp1vwoKb0+6y4LLT5kzok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wFp9ay7lGeTU5IvOQ+SPeKGqY0zMiARH5s6w2PsRXE0ZMR8yD6llnLl0i9tQFvZj9
	 EIV30w5SX5cZM8VCnAAQIVelVz6v6prS+iPJriLGze/JYorqyx+SHyzAdZTWMSySqG
	 +2rmx6+RukGH3AWP7ttbKCwb5w77Y+GPHyyVSAfk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfLRBjI (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 17 Dec 2019 20:39:08 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37348 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfLRBjI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Dec 2019 20:39:08 -0500
Received: by mail-oi1-f193.google.com with SMTP id h19so277367oih.4
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2019 17:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fDE5oLQorUiWHo08fFcOyx3XWtSlMwmlj8UIs8onOvI=;
        b=aPFhtT75w9DnVFB47PBvEyWrQ1ANYsXQhbaIczMb6ghbazM2pcYA+f5r+RgjnPaO79
         NERv5KRhOkyFiNAfPCSiiPX5Jsiq4asr2YoPADHyvcPvz+3s6IHG1Q+3gT5lE1gmZmVg
         QErAWe3SE6GpnI7dLIGmrGI2Sv1F4Jt47I4je8jjrOrP7qibfguEPmgR+WmiVmbflqtV
         kbWL9hJeWhVRuT0O6KFwzKaGH/6dqjSTa+Ku244c1kM0meh4uaToiTBKdlVZjuwERjd8
         qQ+fwmiArKNkRWaNRJfxrVJga4CMrPKQQLX6zxYjbGOJcT+DSkllPyuaxzCh0OoVbidD
         Hx5w==
X-Gm-Message-State: APjAAAV4TnUD2Yi4Kkai7gkpesz3UDMRseEr+ARKVbLYwrz/Cb8FPUBF
        TgWSVCDh0kgl8QaMzfZJSQ==
X-Google-Smtp-Source: APXvYqwxzcOHv3IUHgHXN5DwYwMh84wkG0aznk59HmMavhjQVCJWF5p78BNBUlPusKCyG0yZ3hgm7w==
X-Received: by 2002:aca:2118:: with SMTP id 24mr114797oiz.28.1576633147044;
        Tue, 17 Dec 2019 17:39:07 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k17sm207217oic.45.2019.12.17.17.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 17:39:06 -0800 (PST)
Date:   Tue, 17 Dec 2019 19:39:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2] dt-bindings: usb: Convert Allwinner USB PHY
 controller to a schema
Message-ID: <20191218013905.GA25729@bogus>
References: <20191209093340.50552-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209093340.50552-1-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon,  9 Dec 2019 10:33:40 +0100, Maxime Ripard wrote:
> The Allwinner SoCs have a USB PHY controller that is supported in Linux,
> with a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Split the schemas into files of their own to make it more readable
> ---
>  .../phy/allwinner,sun4i-a10-usb-phy.yaml      | 105 ++++++++++++++
>  .../phy/allwinner,sun50i-a64-usb-phy.yaml     | 106 ++++++++++++++
>  .../phy/allwinner,sun50i-h6-usb-phy.yaml      | 105 ++++++++++++++
>  .../phy/allwinner,sun5i-a13-usb-phy.yaml      |  93 ++++++++++++
>  .../phy/allwinner,sun6i-a31-usb-phy.yaml      | 119 +++++++++++++++
>  .../phy/allwinner,sun8i-a23-usb-phy.yaml      | 102 +++++++++++++
>  .../phy/allwinner,sun8i-a83t-usb-phy.yaml     | 122 ++++++++++++++++
>  .../phy/allwinner,sun8i-h3-usb-phy.yaml       | 137 ++++++++++++++++++
>  .../phy/allwinner,sun8i-r40-usb-phy.yaml      | 119 +++++++++++++++
>  .../phy/allwinner,sun8i-v3s-usb-phy.yaml      |  86 +++++++++++
>  .../devicetree/bindings/phy/sun4i-usb-phy.txt |  68 ---------
>  11 files changed, 1094 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun4i-a10-usb-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun50i-h6-usb-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun5i-a13-usb-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-usb-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun8i-a23-usb-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun8i-a83t-usb-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun8i-h3-usb-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun8i-r40-usb-phy.yaml
>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun8i-v3s-usb-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> 

Applied, thanks.

Rob
