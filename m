Return-Path: <SRS0=WwEB=DG=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D1EC4741F
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 18:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2F96208B8
	for <linux-usb@archiver.kernel.org>; Tue, 29 Sep 2020 18:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601403073;
	bh=z6dyb9w8bdlDCrFjdk1I821QbCywOEM4X4u9UkIExL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dOFklnSMdS5S452I1JU5evRh1gDb44oHZTA5hIMqxAa6hR8BrmxYeaxBb9d8zW0um
	 EFUbpKkloRZHdPQzP7OygYaSLPGf3ZDoHkeN3olR+7ANWqtMR5R9s4bd8i2jItOPbD
	 PUsVG1KjdSGxNeRlZa2g3qdknE2B8PR6JSoX2XHA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgI2SLL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 29 Sep 2020 14:11:11 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36725 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgI2SLL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 14:11:11 -0400
Received: by mail-ot1-f68.google.com with SMTP id 60so5359161otw.3;
        Tue, 29 Sep 2020 11:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kCusAQ6EjVNdN37yHAY4CAb7DwSpW/3N05jRVpI3DYI=;
        b=DoV3Dmf1178rpRVBR29a6ZgOzd2eVNAOJ7xhE61XBVnt8d4lWHVPY77zfJc42Wo+Fz
         W+Dxtch9ypE/guFqH9Mesl0rcuuS6CLE6QMsGN/EAsQpg4bd9w/ykNIhQ9TCUqZm22Ig
         1eilzWzq/y7hRlg/RUluq8kYLt4lLDRTycUwo2WeDVV1o1jhLD4RF1gx7izqV0T8xFdF
         eZm80D1KHlOezUYXir0y2OsoNgSKkHvOxJ20JUrRTx9OU2VUN7BRjcGOssUxo+6WwPwr
         FZL7XQec+TMHFOPQmebYSs45m9FUf4YWN5mHg8xe9nYJ4c0ypEYrI9qcdrAJ6/aTgxbT
         FhQQ==
X-Gm-Message-State: AOAM532NneQ1+ItRdubuVCUV8HLQnCDbPOiWf7AiMZS/qQawffD305O7
        nIeQVExr4HeWqs/RJqXlmg==
X-Google-Smtp-Source: ABdhPJzHh0fnA9BddFNyZ5+d/5WZrO/355zqYOkldVRRHDNxr3gvKTSTU+7a1SPgpBu8IvQt8ya6TQ==
X-Received: by 2002:a9d:7f8c:: with SMTP id t12mr3441485otp.247.1601403070487;
        Tue, 29 Sep 2020 11:11:10 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z10sm3055034ooz.14.2020.09.29.11.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 11:11:09 -0700 (PDT)
Received: (nullmailer pid 887368 invoked by uid 1000);
        Tue, 29 Sep 2020 18:11:08 -0000
Date:   Tue, 29 Sep 2020 13:11:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     shawnguo@kernel.org, balbi@kernel.org, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        Anson.Huang@nxp.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        fugang.duan@nxp.com, qiangqing.zhang@nxp.com, horia.geanta@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/6] dt-bindings: usb: xhci: add property to disable
 xhci 64bit support
Message-ID: <20200929181108.GA885311@bogus>
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
 <1600771612-30727-2-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600771612-30727-2-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 06:46:47PM +0800, Li Jun wrote:
> Add a property "xhci-64bit-support-disable" to disable xhci 64bit address
> dma, some SoC integration may not support 64bit DMA but the AC64 bit
> (bit 0) of HCCPARAMS1 is kept to be 1.

Use 'dma-ranges' for this.

> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 0c5cff8..26446fb 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -28,6 +28,9 @@ Optional properties:
>    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>    - imod-interval-ns: default interrupt moderation interval is 5000ns
>    - phys : see usb-hcd.yaml in the current directory
> +  - xhci-64bit-support-disable: set if the AC64 bit (bit 0) of HCCPARAMS1 is
> +    set to be 1, but the controller actually can't handle 64-bit address
> +    due to SoC integration.
>  
>  additionally the properties from usb-hcd.yaml (in the current directory) are
>  supported.
> -- 
> 2.7.4
> 
