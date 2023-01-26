Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B52C54E94
	for <linux-usb@archiver.kernel.org>; Thu, 26 Jan 2023 08:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236311AbjAZIKN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 26 Jan 2023 03:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236310AbjAZIKL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 03:10:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7BE69B10;
        Thu, 26 Jan 2023 00:10:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A8C3FB81CC4;
        Thu, 26 Jan 2023 08:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FD7C433EF;
        Thu, 26 Jan 2023 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674720608;
        bh=8N0004Ksl54/+9j2hPsSyRkAcDEsg7JhyNVs9HdSx/U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Nb1qE0LYFJSdahhI/hjhx4Bn+9N0xfzHaKzF78swyiLpJLX+Ja5NgGpNlqrQjZxE7
         lajWN3P8d3tnkP8Pku3FZZX55RKBdvsgA6OYgr0RnnNntPOd98VD2/AYwgUD2Qkp/Z
         Vd9C13vVHavMCWQWtYJBwPgmKQyawP5YBNTQvgkMkIfBs2Oslzh8n9H9uqQh9pgDGG
         IA/5TLw7ug62ADl9GJ0GPI/y90j0msxPH4yVfmKi2/c5zDAozBGOCfS7A4FSWUZU2N
         Llgp5rveODYs0zWCgaYCamrtbi++OVn16f1MHH3EtHmk9dnGECdk5/FIu10YzSAvVC
         kucg3GPA1sbnw==
Date:   Thu, 26 Jan 2023 09:10:02 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: hisilicon: Fix
 'hisilicon,eye-diagram-param' differing types
Message-ID: <20230126091002.01f58b94@coco.lan>
In-Reply-To: <20230125221444.3058631-1-robh@kernel.org>
References: <20230125221444.3058631-1-robh@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Em Wed, 25 Jan 2023 16:14:43 -0600
Rob Herring <robh@kernel.org> escreveu:

> 'hisilicon,eye-diagram-param' is also defined in
> hisilicon,phy-hi3670-pcie.yaml as a 'uint32-array'. Unify it to use
> 'uint32-array' everywhere.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  .../devicetree/bindings/phy/hisilicon,hi3660-usb3.yaml         | 3 ++-
>  .../devicetree/bindings/phy/hisilicon,hi3670-usb3.yaml         | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/hisilicon,hi3660-usb3.yaml b/Documentation/devicetree/bindings/phy/hisilicon,hi3660-usb3.yaml
> index 20b79e2e8b82..b11d9873854a 100644
> --- a/Documentation/devicetree/bindings/phy/hisilicon,hi3660-usb3.yaml
> +++ b/Documentation/devicetree/bindings/phy/hisilicon,hi3660-usb3.yaml
> @@ -27,7 +27,8 @@ properties:
>      description: phandle of syscon used to control usb tcxo.
>  
>    hisilicon,eye-diagram-param:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 1
>      description: Eye diagram for phy.
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/phy/hisilicon,hi3670-usb3.yaml b/Documentation/devicetree/bindings/phy/hisilicon,hi3670-usb3.yaml
> index 1cb00dbcd4c5..3c69aca6c7eb 100644
> --- a/Documentation/devicetree/bindings/phy/hisilicon,hi3670-usb3.yaml
> +++ b/Documentation/devicetree/bindings/phy/hisilicon,hi3670-usb3.yaml
> @@ -32,7 +32,8 @@ properties:
>      description: phandle of syscon used to control phy deep sleep.
>  
>    hisilicon,eye-diagram-param:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 1
>      description: Eye diagram for phy.
>  
>    hisilicon,tx-vboost-lvl:



Thanks,
Mauro
