Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16704C43214
	for <linux-usb@archiver.kernel.org>; Fri, 27 Aug 2021 08:27:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAA1B60FE6
	for <linux-usb@archiver.kernel.org>; Fri, 27 Aug 2021 08:27:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231869AbhH0I2p (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 27 Aug 2021 04:28:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233297AbhH0I2n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Aug 2021 04:28:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9188860F91;
        Fri, 27 Aug 2021 08:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630052875;
        bh=95mqHcGWKg76rqeH0GZ2lfl9xvz/nNicqZbVTZqGbvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RaIAwHb+pSWko6z3tZpd736JtSdRnCcaVMca3wOwV5kSsdSk2Pr3iy/i+16THJhzb
         WBU69/PLl/XKE9GUrb0Dini4TN214dUmr0JIQkhjiGKlhN1vJLPUgEUKaHmdq77Bkg
         O/clLsVFtHtJxZe5zCfRHZAot3vw4nHc4iima8SA=
Date:   Fri, 27 Aug 2021 10:27:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ferry Toth <ftoth@exalondelft.nl>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        Lorenzo Colitti <lorenzo@google.com>,
        Wesley Cheng <wcheng@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Re: [PATCH v2 0/3] Revert "usb: gadget: u_audio: add real feedback
 implementation"
Message-ID: <YSiiAsrCaxOn8myU@kroah.com>
References: <20210826185739.3868-1-ftoth@exalondelft.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826185739.3868-1-ftoth@exalondelft.nl>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 26, 2021 at 08:57:36PM +0200, Ferry Toth wrote:
> Although there is a patch resolving this issue (see 
> https://lore.kernel.org/linux-usb/1jilzsy8g7.fsf@starbuckisacylon.baylibre.com/T/#u)
> it needs a little work and will not be ready for v5.14.0 release. Until then
> revert the series.

revert the series for what?  5.14-final needs these reverts?  Or are
these for 5.15-rc1?

confused,

greg k-h
