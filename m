Return-Path: <SRS0=peg9=SI=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD90C282DA
	for <linux-usb@archiver.kernel.org>; Sat,  6 Apr 2019 06:06:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DCCB21855
	for <linux-usb@archiver.kernel.org>; Sat,  6 Apr 2019 06:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554530789;
	bh=CvZMM9Lg3PqHnayk0tLjKdbFOZ3+GzX8d9wJBMNfnrU=;
	h=Date:From:Subject:References:In-Reply-To:Cc:Cc:To:List-ID:From;
	b=bJYhUBvoSfgFKuh/XXSVWl0xOa4SzgX71tHQpbfrioD6cKjz0vcNvW+cA1lLFzHKF
	 /q6UmNLaAHpmldSQXVTeMs7UKN31OaoAM7ceop5X+zT3CuN5nzLECivXb1sQI4o2mj
	 1ipNek50bf+hulUBpfisHwopR+FS2JGi5cclWwzU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfDFGG2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 6 Apr 2019 02:06:28 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37200 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbfDFGG1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Apr 2019 02:06:27 -0400
Received: by mail-pg1-f196.google.com with SMTP id e6so4201093pgc.4;
        Fri, 05 Apr 2019 23:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=s8wVCbGwXB2mQcIs0fbts1xGiNvvvyK5lG0VCS8kmOo=;
        b=oieb/1DpVvQVlyP97lUcZNb20UwBZLy1nRAzsXaAPO+LbyV622dKB3imDjmMELEyQV
         TaoOQuKSTcxBNlNn7Iviy/ppRpXnyw0ZBWpplxTJLW317v/2ji4Yzy3mhKgE32yFDJl0
         YVRco8D7JKWzLRSvVXdGGPblVx8IZcUvmeSLFuM0Aqq4/5nAQIGEBfppRUKWZAuC3weP
         BiH7WEwt1z5pogA7TgvEoQBykLaFgwK2N0J0fHBp9TBP/dtzKPFrSQjzuojHW0axtACG
         HDOh67iz8P8foMVcLZpydgPUO73VG/vXZcK8e4slpDpz1DhdzzCaJx5MISjp25HE5EjE
         8LkQ==
X-Gm-Message-State: APjAAAWBFbrwOI9ebb5C5uPOcSpTuic8jB5Le5UkNb32h1QCf/16o8iW
        c7zz/GExxMyBHSZHn3TSQg==
X-Google-Smtp-Source: APXvYqwhdbgUy/IrenHHLW9WLnoj/6lg84mi8aoeZ8wLNk2e2AJSL1gqF9TCMU2JqHDyTRNYqICMoA==
X-Received: by 2002:a63:408:: with SMTP id 8mr16094901pge.334.1554530786641;
        Fri, 05 Apr 2019 23:06:26 -0700 (PDT)
Received: from localhost ([210.160.217.71])
        by smtp.gmail.com with ESMTPSA id f63sm32031358pfc.180.2019.04.05.23.06.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2019 23:06:25 -0700 (PDT)
Message-ID: <5ca841e1.1c69fb81.20175.d3d6@mx.google.com>
Date:   Sat, 06 Apr 2019 01:06:23 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 03/12] dt-bindings: usb: ehci-r8a77470 devicetree binding document
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com> <1554123232-58942-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554123232-58942-4-git-send-email-biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das@bp.renesas.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon,  1 Apr 2019 13:53:43 +0100, Biju Das wrote:
> Add device tree binding document for Renesas r8a77470(a.k.a RZ/G1C)
> on-chip EHCI controller driver.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V1-->V2
>   * New patch
> ---
>  .../devicetree/bindings/usb/ehci-r8a77470.txt      | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ehci-r8a77470.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

