Return-Path: <SRS0=N1Cw=C3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9B9C43464
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 17:30:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3C7E21707
	for <linux-usb@archiver.kernel.org>; Fri, 18 Sep 2020 17:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600450239;
	bh=GoZBhXLK1lIpAVdRSt2YYE2bd3HaMZt38g88b0xGA1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hNJozETJPyS7bv5r9yFtFTXaesL5N0U16N+IWSDcUhZ+P1Stc3zj95RYVRkdkmA5G
	 OMv7ug2uH8+VdM4dmTKqs9xLNYfDt0fUWbVtujXTqQ1iwLKwnVyaF9/QeORRNsKpj3
	 YoAFobYcCNm+H/tsF/v8vAjTPR7wHitKKeBP7i+A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgIRRag (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 18 Sep 2020 13:30:36 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:35283 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgIRRag (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Sep 2020 13:30:36 -0400
Received: by mail-il1-f193.google.com with SMTP id y9so7012924ilq.2;
        Fri, 18 Sep 2020 10:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VhAGYSOvoK5K9rAxnKh2g63kaJVroDo5qvMN7ESCmPQ=;
        b=slrTe2kY6OVC827xzUzjhtm2uvRfpEzvMoiiQ13RSkv3U29MLLwNqnKExVetjLNkLZ
         PJb4jrds5BLkm4SttMRsjAKdsJXB5gksTLQjHEgleQY1MvAxamJc2t3LT0nIbnK+xxqT
         Ex1R8uvGQiScp1wUDJ2CUREjSO1WfnS++VySlVPnE/jPV9M8nncclpDYFwe4FDCSEzJ8
         3bFt9t4VUFKP7wVreIrFB2OlVEbgE1z2aT6T+Zg26+0X3FLffeaUZIEw/UFCH1/tis6K
         +sTyRiKHTenrcHjyhiupWgf7W/6J8aaGBwpj94JMR9V4DXsk+EuhCPYnpG0rubK6lPMx
         JcFQ==
X-Gm-Message-State: AOAM53020JeRldieq6We3kVDxcXXDsUAh1AgxgXhbgW0s7zayuhZ29N6
        PDKE8h8gdd1NAyBAAiKu1A==
X-Google-Smtp-Source: ABdhPJxBDT4yrRL1yHVysTYtIS90VnoewmrF8Vqt13khljDvrV2YfkQs2d7tJ+Wtkf3mo7mdj3vpWw==
X-Received: by 2002:a92:c00b:: with SMTP id q11mr24862382ild.181.1600450235240;
        Fri, 18 Sep 2020 10:30:35 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id p86sm2043626ilb.5.2020.09.18.10.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 10:30:34 -0700 (PDT)
Received: (nullmailer pid 3829306 invoked by uid 1000);
        Fri, 18 Sep 2020 17:30:31 -0000
Date:   Fri, 18 Sep 2020 11:30:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Peter Chen <peter.chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        linux-kernel@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add binding for onboard USB hubs
Message-ID: <20200918173031.GA3828850@bogus>
References: <20200917114600.v2.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917114600.v2.1.I248292623d3d0f6a4f0c5bc58478ca3c0062b49a@changeid>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 17 Sep 2020 11:46:21 -0700, Matthias Kaehlcke wrote:
> Onboard USB hubs need to be powered and may require initiaization of
> other resources (like GPIOs or clocks) to work properly. This adds
> a device tree binding for these hubs.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> 
> Changes in v2:
> - removed 'wakeup-source' and 'power-off-in-suspend' properties
> - consistently use spaces for indentation in example
> 
>  .../bindings/usb/onboard_usb_hub.yaml         | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/onboard_usb_hub.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/usb/onboard_usb_hub.example.dts:24.9-20 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/usb/onboard_usb_hub.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1366361

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

