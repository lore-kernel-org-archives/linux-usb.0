Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1660AC433FE
	for <linux-usb@archiver.kernel.org>; Fri, 14 Oct 2022 21:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbiJNV3v (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 14 Oct 2022 17:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiJNV3t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 17:29:49 -0400
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E17DF75;
        Fri, 14 Oct 2022 14:29:46 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id a16-20020a056830101000b006619dba7fd4so2590822otp.12;
        Fri, 14 Oct 2022 14:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it/v6Q48BFqFvUb27aAmyLiIEAa7O0dVxl1WVQKZjXw=;
        b=0aRuTK8m4ockVitejRkIbDobkdwZcQQ6kRveRiseWGFESzkn6PS0iG9glzMcpgq5T+
         GfPdVfEDdIgcEWRIWgGlBdHQaU/jYuYgrbZAjJ8o6voTjp67tIH78k4RJXipmMxjsZ6S
         pm52sVPcAB6SErLtVg3wXb9zp2cIhj6bsfBoiC6S4wKU2ui7NNxzpHJwbeXqOMFjAaXS
         Y+OXfZ46OFQVd8AM9+HS/q2/QzncKeJxVH1xo9wuFLSJV70WYD4a2lgpqe6gfXl97Cp1
         Eu9hhyyb8Ax4lyLbwJX8Fz1+dyyFRMB20o2JoAJ/XBXiMUxPc4mQUvsvnPR9TBXZxcU+
         Texw==
X-Gm-Message-State: ACrzQf2KOXnoOlwHqE/9kgBndaWTCBhDLNA/POvpdl71XwgCA/dtDJQc
        CPOwH21uOD0XTqMMMgCvLQ==
X-Google-Smtp-Source: AMsMyM78PbiGa0u7gqIj61pOgy+TfHkKKJxjGDzXeHa8cGjrneIroJ5TT2iysRl6qeKY+AbXAK3J6Q==
X-Received: by 2002:a9d:38e:0:b0:661:aa1d:4393 with SMTP id f14-20020a9d038e000000b00661aa1d4393mr3371658otf.220.1665782985418;
        Fri, 14 Oct 2022 14:29:45 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z18-20020a4a3052000000b00425806a20f5sm1212109ooz.3.2022.10.14.14.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 14:29:45 -0700 (PDT)
Received: (nullmailer pid 2934159 invoked by uid 1000);
        Fri, 14 Oct 2022 21:29:45 -0000
Date:   Fri, 14 Oct 2022 16:29:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     linux-imx@nxp.com, Peng Fan <peng.fan@nxp.com>, xu.yang_2@nxp.com,
        robh+dt@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de,
        krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
        s.hauer@pengutronix.de, jun.li@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, festevam@gmail.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH V2 3/6] dt-bindings: usb: usbmisc-imx: add more i.MX
 compatible
Message-ID: <166578298526.2934120.15652513373933697556.robh@kernel.org>
References: <20221014095148.2063669-1-peng.fan@oss.nxp.com>
 <20221014095148.2063669-4-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014095148.2063669-4-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 14 Oct 2022 17:51:45 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add more i.MX chips support
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/usb/fsl,usbmisc.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
