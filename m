Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F85EB64DA
	for <linux-usb@archiver.kernel.org>; Mon, 19 Jun 2023 22:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjFSWdt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 19 Jun 2023 18:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjFSWds (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jun 2023 18:33:48 -0400
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E83E53;
        Mon, 19 Jun 2023 15:33:47 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3427426f2ddso6834545ab.3;
        Mon, 19 Jun 2023 15:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687214026; x=1689806026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHIUlRfkQF4MrOkbDohxiMjKEeqR0IrsvdE7LEZAk6E=;
        b=MW6SIMDZmCLp8jpAx49A3Iw+T+MVU8EDe+x9m+kopNWEcNa4Y5nx+mM8Nrn8kMig26
         1ZfqE6RBl3JrO0m9L24sJFY1HRZC641I+FGQVYAFvE85vmfspvxSNVMogP4FkcfsnYJ5
         3hWYjIFkofpPJu03DkuSIIWaS5Zga+kDZ58tCGfBO9Or2FizCSXPWTnqKscrUOi9nDyH
         L/pM0x20Uf9L6SKPp32YxpNbFGF3FhxCByzDH3Nml19Ur8cWGtVjRA6uaP4c3tDXp25S
         pL2ytVC2LO7nGdUVJtCfUclxcnLMfwnZtOMwM4oyKmrbALb0h093ANILjAN72ulwXIMs
         9oWQ==
X-Gm-Message-State: AC+VfDw53fTCfHtoBY/c68sy1yMtaZpn6x5teynW/YjYCk0bEsNQ2vu7
        /6twNLFcXmF/mquVM2GjYA==
X-Google-Smtp-Source: ACHHUZ7mzynTL8o5IwCZeywI+S0P/T3Md2K8mFSdxl/MNWTSsYd+RwoVRrPwOXjir3u5kvRncMblaw==
X-Received: by 2002:a92:ce92:0:b0:33d:8b4e:6613 with SMTP id r18-20020a92ce92000000b0033d8b4e6613mr7352185ilo.15.1687214026381;
        Mon, 19 Jun 2023 15:33:46 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id p24-20020a02c818000000b0042672a015f0sm265010jao.25.2023.06.19.15.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 15:33:45 -0700 (PDT)
Received: (nullmailer pid 1648271 invoked by uid 1000);
        Mon, 19 Jun 2023 22:33:43 -0000
Date:   Mon, 19 Jun 2023 16:33:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Piyush Mehta <piyush.mehta@amd.com>
Cc:     gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        git@amd.com, balbi@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        michal.simek@amd.com
Subject: Re: [PATCH V4] dt-bindings: usb: dwc3: Add interrupt-names property
 support for wakeup interrupt
Message-ID: <168721402338.1648213.9342325663890021008.robh@kernel.org>
References: <20230619105032.2888128-1-piyush.mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619105032.2888128-1-piyush.mehta@amd.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Mon, 19 Jun 2023 16:20:32 +0530, Piyush Mehta wrote:
> The hibernation feature enabled for Xilinx Versal NET SoC in DWC3 IP.
> As the DWC3 IP supports the hibernation feature, to handle the wakeup
> or hibernation interrupt, add host mode "wakeup" interrupt-names
> optional property in the binding schema to capture remote-wakeup and
> connect/ disconnect event in the hibernation state and increased maxItems
> to 4 for the interrupts and interrupt-names property.
> 
> We have a dedicated IRQ line specifically for the hibernation feature.
> When the "wakeup" IRQ line is triggered, it initiates a hibernation
> interrupt, causing the system to wake up from the hibernation state.
> 
> Signed-off-by: Piyush Mehta <piyush.mehta@amd.com>
> ---
> Change in V2:
> - Addressed ROB review comments
>  - Updated name of interrupt-names property with "wakeup"
>  - Move interrupt-names property from dwc3-xilinx core to dwc3 core.
> 
> Link: https://lore.kernel.org/all/CAL_JsqK6_7XD7+w+EQvPPmbmSOpfo3JDb0xDN4StuHUm1kgchw@mail.gmail.com/
> 
> Change in V3:
> -  Addressed Krzysztof Kozlowski comments
>  - Update binding schema enum.
>  - Upadet commit message.
> 
> Link: https://lore.kernel.org/all/76dfbf27-8ad2-6e09-5354-b006b9e81af1@linaro.org/
> 
> Change in V4:
> - Addressed ROB review comments:
>  - Fixed dt_check warnings
> 
> Link: https://lore.kernel.org/lkml/168448091422.2968830.10066003697035225886.robh@kernel.org/
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

