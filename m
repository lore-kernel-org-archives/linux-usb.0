Return-Path: <SRS0=WwEB=DG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1266C4727C
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 17:23:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A0BC208B8
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 17:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601400220;
	bh=/rCFG2YCbVEtlengM0CTMMyOfyFPLz+v65W1vQiKwoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=B9sOvsY20xzkn/Nqa5YBqEYi9ikRAUuuzUV5weBAijWOwZ2BJP5jwrBV5JqwsMKvz
	 VY01513GlY2H6joM0eC7Ov9dBw7wM+EsK8ND+Sj2Z6hTG5NMCoeXaVXF823QcZR3Ry
	 fuI3Dv7HVWCtswp5itMJma2zfOLRT3jO34avpS3Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgI2RXh (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 29 Sep 2020 13:23:37 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43321 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728459AbgI2RXg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 13:23:36 -0400
Received: by mail-oi1-f193.google.com with SMTP id i17so6284264oig.10;
        Tue, 29 Sep 2020 10:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6pizakLc17yzkgx68uXJkRvEy7t99Oc2Nx6DxepZaYU=;
        b=jbn+CaB74hw0JAFzwr8y2/G5IahlobXAmWP20d4Ex6QjAyGq0QxLNUJdfhAXo3B1m9
         rQxRQ+PIUyL8Vjd0GQb7k2oQSXxC9cPviiN0LO7+FXR3MDKxvnbvPue1PVVPuhFeyvDa
         eCDYrzXRK0zF8mPDRJIViqUDnxC+rYQB8+Ytcp88bAGdHNev7hz1ru9BZMiT91NRQDEQ
         nBtaD15xp+zH6hHUTEUmTWgjc7yiA7CHIUbLWfyJ4BE29Con13ljknezsfTzaHQLFs45
         MzeZv4iIyqBLFGlQOzMOhgZe2HmcRn2ZSpIQqYXNON6lMkBwijOtigQcDtZZPtX2GRMS
         Yrmw==
X-Gm-Message-State: AOAM530OdKYIHXQYBJFfJWAk5LOZ/Px830KuAui61O6R3/x99QSWLKfR
        nH1wyFZxWtkxStoi5jYSig==
X-Google-Smtp-Source: ABdhPJy6ZCmnwJ17NtcBnFZ55+qshShpfv1j7J+iO/HYytDKmivmIKAnHhn5fWiKrJLfcxbhgjsoTw==
X-Received: by 2002:aca:446:: with SMTP id 67mr3365853oie.171.1601400214366;
        Tue, 29 Sep 2020 10:23:34 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g3sm1134234otp.14.2020.09.29.10.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:23:33 -0700 (PDT)
Received: (nullmailer pid 811296 invoked by uid 1000);
        Tue, 29 Sep 2020 17:23:32 -0000
Date:   Tue, 29 Sep 2020 12:23:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
Cc:     lakshmi.bai.raja.subramanian@intel.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mgross@linux.intel.com, balbi@kernel.org, kishon@ti.com,
        linux-usb@vger.kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: Add Intel Keem Bay USB PHY bindings
Message-ID: <20200929172332.GA811234@bogus>
References: <20200921024459.20899-1-wan.ahmad.zainie.wan.mohamad@intel.com>
 <20200921024459.20899-2-wan.ahmad.zainie.wan.mohamad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921024459.20899-2-wan.ahmad.zainie.wan.mohamad@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 21 Sep 2020 10:44:56 +0800, Wan Ahmad Zainie wrote:
> Binding description for Intel Keem Bay USB PHY.
> 
> Signed-off-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
> ---
>  .../bindings/phy/intel,phy-keembay-usb.yaml   | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/intel,phy-keembay-usb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
