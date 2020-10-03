Return-Path: <SRS0=HmPd=DK=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E282C4727D
	for <linux-usb@archiver.kernel.org>; Sat,  3 Oct 2020 11:01:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F092E20679
	for <linux-usb@archiver.kernel.org>; Sat,  3 Oct 2020 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601722891;
	bh=ZObuPz8gWZV8JdXdRGYgciBaPFBidwNGcMFQd0Ihzbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=He+ylOUlVXRDN+l/7yCJWk8I5FWf+HE4SLUeJc3epLZ9txaoTXSjK4Wkn3CxvT2rY
	 jDaeByk4eHICXtILR/oedFHOCoslCmW8xLHpUq/0/+qWKVCUK01LlP3QnfscGLlnJl
	 qYKcG2xumoT5Ua3tYxN8Pwm2vCBv+/3eqQcic7EE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgJCLBa (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 3 Oct 2020 07:01:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbgJCLB3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 3 Oct 2020 07:01:29 -0400
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B7BE2067D;
        Sat,  3 Oct 2020 11:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601722889;
        bh=ZObuPz8gWZV8JdXdRGYgciBaPFBidwNGcMFQd0Ihzbo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=i3Eh1pZY2Llveozu+Y2byymOEDSLZUJXKEExYqPUks5Y1vck7T1qtKXYKJ9RZDmZK
         qtENvYjZRiiSfl0EVwZcyRhS3q60pajnwZFKvdmoip/tI8nqg6tj4iLnkdy93xwVta
         uMMQz6ROT64eRajeEZmEvXS4NOITYCsCOfdlI3bQ=
Received: by mail-ed1-f43.google.com with SMTP id b12so4513419edz.11;
        Sat, 03 Oct 2020 04:01:29 -0700 (PDT)
X-Gm-Message-State: AOAM530wtHvSxnpYMs+ZIK9V8MeGqZzaNxn0LZ8rIBxNQcU7yMk0l2Iu
        sL0S16QFWh9nhS/JXN6yBQDPpxhVq+Sp1bxE7lk=
X-Google-Smtp-Source: ABdhPJz8lyxfV5U0HJ1BKy14r/kgmlPnT/rgmi+PcP6bgzD0MGdSpCN38lGNA+EMcXyfL5maM6ghYvrSLe7EDe2/kw8=
X-Received: by 2002:a05:6402:22b7:: with SMTP id cx23mr8140916edb.246.1601722887711;
 Sat, 03 Oct 2020 04:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <1601656238-22232-1-git-send-email-jun.li@nxp.com> <1601656238-22232-4-git-send-email-jun.li@nxp.com>
In-Reply-To: <1601656238-22232-4-git-send-email-jun.li@nxp.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Sat, 3 Oct 2020 13:01:16 +0200
X-Gmail-Original-Message-ID: <CAJKOXPezJN5qybqDrxUwtj0Zf3yR+FQwYnxF93w5L+JsZ2-Syw@mail.gmail.com>
Message-ID: <CAJKOXPezJN5qybqDrxUwtj0Zf3yR+FQwYnxF93w5L+JsZ2-Syw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dtsi: imx8mp: add usb nodes
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, shawnguo@kernel.org, balbi@kernel.org,
        mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, Anson.Huang@nxp.com, aisheng.dong@nxp.com,
        peng.fan@nxp.com, fugang.duan@nxp.com, horia.geanta@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2 Oct 2020 at 18:36, Li Jun <jun.li@nxp.com> wrote:
>
> imx8mp integrates 2 identical dwc3 based USB3 controllers and
> Synopsys phys, each instance has additional wakeup logic to
> support low power mode, so the glue layer need a node with dwc3
> core sub node.
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 82 +++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
