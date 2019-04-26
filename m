Return-Path: <SRS0=7cGN=S4=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8CCC4321A
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 18:14:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 337A2208CA
	for <linux-usb@archiver.kernel.org>; Fri, 26 Apr 2019 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556302449;
	bh=OtrnvbpdQWt45+NmXvQTL+PalSePttTQBFOnzAYV62Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Ai+jN/sMo+KLFPOKVc4Tg3Ah5O+Fp9LG+O2dMO4Mf86LufJnEcUhHYnW5tQ6v7/vu
	 iNWzQH4tIBTyhajOwDGQ5ZodNOTnf5JaIi+Y2arvi9dsHWHMBdMjVY2MpQNqw8V8bH
	 IVWkBod7av7dXg4Gew36cgkrzFHCHyLOWrdohxgk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfDZSOH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 26 Apr 2019 14:14:07 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37910 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfDZSOH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Apr 2019 14:14:07 -0400
Received: by mail-oi1-f196.google.com with SMTP id a6so3664662oie.5;
        Fri, 26 Apr 2019 11:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l4fal+8ScWj1Z30fuoMdFGsjd+aE8RMmHMHUL3XwDpo=;
        b=H8OZG3I1KtvEnp9R7DWumogD763wbDf+xUQWmAXum8jNQ5efodBvVOKnBU2MptdEVn
         knPHqjzb1h4twtty4eua2sfBhFyHENAOR8sCY80jpBlad9rlaI/C0uBvu9gq4ZhrUiRi
         RnQW6P8gzMvK054kIMcys5K+0PPYACtHxoA50n0KHAxpOmH2ByM2sYa8MR/UjExiYG5q
         hrI1nNMeFPaUsPj6/qTideLJzDh/jjjeaJ6f9YHC2cmABXGMl08p1YGKt06rb2vRPz4o
         ufcVUtYth3SuGwlce5bA4nJE/33i8ZpLR/5eeOSBylplVhE/0jKzZI2Tu4uAVB8oe94w
         2V7w==
X-Gm-Message-State: APjAAAVGdGgJUY7GSFHxh0PUs2B9jQa+l31V0uADrGiVjeufK21mW/DI
        6kDUo4qPK4MKnOT3ux+8UQQ4Ox4=
X-Google-Smtp-Source: APXvYqyO1D5kevIr0rRBHC3xR/akDQ1wNpTh3d89O46lZII2LoewgBly0zs/M6/Y5J+dUoARUI7Dpg==
X-Received: by 2002:aca:8d3:: with SMTP id 202mr8006064oii.76.1556302446605;
        Fri, 26 Apr 2019 11:14:06 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 88sm12185945otj.3.2019.04.26.11.14.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2019 11:14:05 -0700 (PDT)
Date:   Fri, 26 Apr 2019 13:14:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH V5 4/9] dt-bindings: usb: renesas_usb3: Add
 renesas,usb-role-switch property
Message-ID: <20190426181405.GA1881@bogus>
References: <1556097743-12717-1-git-send-email-biju.das@bp.renesas.com>
 <1556097743-12717-5-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <1556097743-12717-5-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190426181405.-2pyuYKrSVmSk-yuAoQgDxqjEBEcIfJ4ecznxDGQLyE@z>

On Wed, Apr 24, 2019 at 10:22:18AM +0100, Biju Das wrote:
> Add an optional property renesas,usb-role-switch to support
> dual role switch for USB Type-C DRP port controller devices
> using USB role switch class framework.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V4-->V5
>   * No Change
>  V3-->V4
>   * No Change
>  V2-->V3
>   * Added optional renesas,usb-role-switch property.
>  V1-->V2
>   * Added usb-role-switch-property
>   * Updated the example with usb-role-switch property.
> ---
>  .../devicetree/bindings/usb/renesas_usb3.txt       | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> index 35039e7..f1cb06a 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> @@ -22,6 +22,7 @@ Required properties:
>  Optional properties:
>    - phys: phandle + phy specifier pair
>    - phy-names: must be "usb"
> +  - renesas,usb-role-switch: use USB role switch to handle role switch events

Mediatek and HiSilicon both have same or similar properties in patches 
under review. Please coordinate and document a common property.

Really, I'm wondering why this is needed. Can't you walk the graph to 
the connector and determine if dual role is supported by the connector 
type?

Rob
