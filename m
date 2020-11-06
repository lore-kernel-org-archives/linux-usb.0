Return-Path: <SRS0=WR2x=EM=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD17C2D0A3
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 16:17:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 162D722243
	for <linux-usb@archiver.kernel.org>; Fri,  6 Nov 2020 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604679436;
	bh=mFvfLVgjYOVfPdT3RK/ROvn4MwcF3/s0DqTGilNu0UY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GxCDZmltj99jmO6iT0/WNXj2As/MApZQcWaw5DXXasHsGF0Km19xtAB1/5AIJO7el
	 fivzq8oW+EnAKTe3Mtg2WcvB98T3Kv0wvFH7uBhmVQv3mSUIFT2FEIM8v+0/y5ukXg
	 DuvABHFvfiF/Wic43hfdcmgmPdKne7fzpOSWma8U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgKFQRM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 6 Nov 2020 11:17:12 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44653 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgKFQRM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Nov 2020 11:17:12 -0500
Received: by mail-ot1-f65.google.com with SMTP id f16so1692665otl.11;
        Fri, 06 Nov 2020 08:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PHA0EidL03UfC8An9Xo/HRrV3J9easCIHZo3/RUQUy8=;
        b=egqZg7iG01UaJgLSyAG3QFBmoGgdDPAeTbl35OBqRaoe+qFo+9sdcDT1wpZOaCAVH+
         ZSBDgb5wmfVEwb8YuMmdUExI0zexWED7TMRptTHGRpJdNbVbu/6uMaitrD+WQE9QQMWV
         NI6067UBcAQy5NEqSarO75FLjryvAaWvmObvUOtVDRBMxevNzt4vIL/xISIK9rooeQs+
         FllaTksglZuI4cqU6sYakFnIRKFG/fIO02uep6Ti/xqtoojFSoLErDomRAshLt8/GEZ4
         H5cpljj+xk5s1ZUTn//OKEBEtook77mQd0t2bB9Z+f+MQlRmvebyCFaoBAFm9LjSRX4v
         haqA==
X-Gm-Message-State: AOAM533GNTYFYxVhBuX29o666uxVPIPLQZwjpAVjd51m0SnQtXuefNBN
        gDfIKLp63/veQf3K4wCr1g==
X-Google-Smtp-Source: ABdhPJyUM2g1joTzdNeL4HLOcHzKbVxE71kOK6QziFU/66zPxzdPYxK0fs86RuyZf2tu+DP2kWBsow==
X-Received: by 2002:a05:6830:c4:: with SMTP id x4mr1618752oto.183.1604679431223;
        Fri, 06 Nov 2020 08:17:11 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n128sm353087oif.4.2020.11.06.08.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 08:17:10 -0800 (PST)
Received: (nullmailer pid 3298198 invoked by uid 1000);
        Fri, 06 Nov 2020 16:17:09 -0000
Date:   Fri, 6 Nov 2020 10:17:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Russell King <linux@armlinux.org.uk>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: usb: Add DT bindings for STUSB160x
 Type-C controller
Message-ID: <20201106161709.GA3297832@bogus>
References: <20201106091854.14958-1-amelie.delaunay@st.com>
 <20201106091854.14958-3-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106091854.14958-3-amelie.delaunay@st.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 06 Nov 2020 10:18:51 +0100, Amelie Delaunay wrote:
> Add binding documentation for the STMicroelectronics STUSB160x Type-C port
> controller.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  .../devicetree/bindings/usb/st,stusb160x.yaml | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st,stusb160x.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/st,stusb160x.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/st,stusb160x.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/st,stusb160x.yaml


See https://patchwork.ozlabs.org/patch/1395559

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

