Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7C4C43219
	for <linux-usb@archiver.kernel.org>; Mon, 10 Oct 2022 20:26:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbiJJU0e (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 10 Oct 2022 16:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbiJJU0G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Oct 2022 16:26:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12303DBD8;
        Mon, 10 Oct 2022 13:25:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 18CC9B810D5;
        Mon, 10 Oct 2022 20:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FD1C433D6;
        Mon, 10 Oct 2022 20:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1665433489;
        bh=B5W2BanT5TuWfQhX7SY66WzYZbaE+dSb0l4pgMeCTbg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H54aQFEO9ES4giJ9iNmhr0ke/JfY9iJQy4KIBBqOuiwP0/BZJyOBI4g1yff6NiJfm
         9Yvl0wCPQriPSZafWZbaTafm3jE4ayanOAaHd4deq18nF+xQWxsjSBIL4MYPzxoSPI
         1av0bpjGTB9vVEB9eh43dVoUXoDBaBM7VFkZ0RVw=
Date:   Mon, 10 Oct 2022 22:25:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jun.li@nxp.com,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/6] dt-bindings: usb: covert ci-hdrc-usb2/usbmisc-imx to
 yaml
Message-ID: <Y0R/vObDuBJa5fDM@kroah.com>
References: <20221010101816.298334-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010101816.298334-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 10, 2022 at 06:18:10PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> This patchset is to convert ci-hdrc-usb2 and usbmisc-imx to yaml format.
> There are compatible strings not landed in binding doc, but in device tree,
> so run dtbs_check on the single yaml convertion patch will report
> dtbs_check failure. If apply the whole patchset, there will be no failure.
> 
> I put Greg as maintainer of the yaml file, because I not sure who should
> be put there.

Why not you?
