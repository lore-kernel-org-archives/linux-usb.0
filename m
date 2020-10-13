Return-Path: <SRS0=J28a=DU=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F48C433DF
	for <linux-usb@archiver.kernel.org>; Tue, 13 Oct 2020 12:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A14C2245A
	for <linux-usb@archiver.kernel.org>; Tue, 13 Oct 2020 12:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602592748;
	bh=frlaNWJaoXB/Pen44G3nDnsOgQsEAYos0rT4smcYi/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=i5D66bZcg1qefcM/5QJd1CnqCqXA4tfyBqipu59ORLWR7L7eSzIIh7zxohtolGtEN
	 O+3sNR2KVmwGeBWtF6vOXR3nNRdSV2gjd/gjAnHgouZ/w4LAZBvoywq0FwAxhdXIUC
	 WGy0IfGX/tOl+mH6NGNgHkyGKU9N3L58MdarLTN4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgJMMjD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 13 Oct 2020 08:39:03 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40784 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgJMMjD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Oct 2020 08:39:03 -0400
Received: by mail-ot1-f65.google.com with SMTP id l4so18872153ota.7;
        Tue, 13 Oct 2020 05:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6VjdKl317iT5Zg1TyENnjjsaX0N6ri1mllKle5EFEgU=;
        b=oICdWroBV7nykj5GBmSi1zn8I47GLThwNlpoG02kxSraTAaFwfB0B+piOTjJTRZAKN
         PL37+bQzn9Mld/K1BT2uBM8EiJbI8QKVADutBNNhavIDvJ5wdvKZMdNsH9+0XY2YSMg2
         Aytehz8AceUha67m74I1imRzoLtMe37sUm2IiUFDevbokLquMzFxeLyMQYkDxEnycKgo
         ORIOuFQtaCZPiITBsKj4kgUV3o8FJhbc3eoUPgLEiSL3W9krkUfFxxn22DkH49bSygZs
         5TJYxR3aHE3J9G3UULG96Y0Yv65af/LeWPu+YbubaMQvqICmLRydJqoBoMZtg14SCpcc
         WUhQ==
X-Gm-Message-State: AOAM533u/WIqy5MK/CArXKfBOHdoHmbKYyiq5L1XAzVgXmU0e/8iemNu
        ROw7ZKnAVRSnwZVaLSWZkA==
X-Google-Smtp-Source: ABdhPJw/LR0WlluFnNsI3nVPTl/zhtRz16XPBXAFDEXrvfPVEt+NDhPPkdFKLyjjLI6RccT70G+B+Q==
X-Received: by 2002:a9d:2487:: with SMTP id z7mr20713927ota.133.1602592741146;
        Tue, 13 Oct 2020 05:39:01 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j83sm11176124oia.19.2020.10.13.05.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 05:39:00 -0700 (PDT)
Received: (nullmailer pid 3308114 invoked by uid 1000);
        Tue, 13 Oct 2020 12:38:59 -0000
Date:   Tue, 13 Oct 2020 07:38:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/18] dt-bindings: usb: dwc3: Add Frame Length Adj
 restrictions
Message-ID: <20201013123859.GD3269269@bogus>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
 <20201010224121.12672-15-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201010224121.12672-15-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Oct 11, 2020 at 01:41:17AM +0300, Serge Semin wrote:
> In accordance with the IP core databook the
> snps,quirk-frame-length-adjustment property can be set within [0, 0x3F].
> Let's make sure the DT schema applies a correct restriction on the
> property.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 36d4b8060d7c..f1e6c3dab1ff 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -226,6 +226,8 @@ properties:
>        length adjustment when the fladj_30mhz_sdbnd signal is invalid or
>        incorrect.
>      $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 0x3f

It's fine if you add the constraints during the conversion.

>  
>    snps,rx-thr-num-pkt-prd:
>      description: |
> -- 
> 2.27.0
> 
