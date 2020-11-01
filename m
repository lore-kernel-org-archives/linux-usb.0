Return-Path: <SRS0=Ykby=EH=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7061EC55179
	for <linux-usb@archiver.kernel.org>; Sun,  1 Nov 2020 07:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2913E206D5
	for <linux-usb@archiver.kernel.org>; Sun,  1 Nov 2020 07:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604216234;
	bh=7kH9k97vwXjJhj66GWkc+nIOm3YnIW5a0mWo03WPHH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=yohGD+pTdHcy+9yq06KtcaIVGfO73w5erB89NAsLS4tS4UYsaiLO6BeTeSmWv/NXo
	 RUx1c32iYTQ8P0rizx8sAcdZtO1R2rUFHa8xlDZ38THQiqhkKR37Ns+wVAtJPc5lxc
	 XIqVN7MFfa5m0WoTHWDOBZIWystSqbwfzl7wF/0Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgKAHhL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 1 Nov 2020 02:37:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:60684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbgKAHhK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 1 Nov 2020 02:37:10 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0C142085B;
        Sun,  1 Nov 2020 07:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604216230;
        bh=7kH9k97vwXjJhj66GWkc+nIOm3YnIW5a0mWo03WPHH8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nz76juwz8wVcqFAxSC+W9/DfY+cOHZBChV1+2OJS69bZUMq/z8wJyHimVWha+kKSP
         Z62cmnfrWH+RFRpMT3X4kl9bwVzWLWD9fbdaZtBPSTy8X4aYCwZfPE3qPH2rbPGTEP
         Ckve+pH7A+aIqT0eF+fv9c5506GA/iEBq8PkxGss=
Date:   Sun, 1 Nov 2020 15:37:04 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Li Yang <leoyang.li@nxp.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/29] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
Message-ID: <20201101073703.GD31601@dragon>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-22-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-22-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 20, 2020 at 02:59:51PM +0300, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Applied, thanks.
