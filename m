Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9DEC77B75
	for <linux-usb@archiver.kernel.org>; Fri, 12 May 2023 15:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241994AbjELPoD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 12 May 2023 11:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241173AbjELPoC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 May 2023 11:44:02 -0400
X-Greylist: delayed 23449 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 12 May 2023 08:44:00 PDT
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D264239;
        Fri, 12 May 2023 08:44:00 -0700 (PDT)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        by mail11.truemail.it (Postfix) with ESMTPA id BB83E206F4;
        Fri, 12 May 2023 17:43:58 +0200 (CEST)
Date:   Fri, 12 May 2023 17:43:57 +0200
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     Francesco Dolcini <francesco@dolcini.it>,
        Stephan Gerhold <stephan@gerhold.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, stable@vger.kernel.org,
        francesco.dolcini@toradex.com, liu.ming50@gmail.com,
        Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: USB gadget regression on v6.4-rc1 and v6.1.28
Message-ID: <ZF5evXbOXhWFoaus@francesco-nb.int.toradex.com>
References: <ZF4BvgsOyoKxdPFF@francesco-nb.int.toradex.com>
 <ZF4bMptC3Lf2Hnee@gerhold.net>
 <13285014.O9o76ZdvQC@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13285014.O9o76ZdvQC@z3ntu.xyz>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 12, 2023 at 05:42:03PM +0200, Luca Weiss wrote:
> to confirm I'm seeing the same issue on Qualcomm MSM8974 and MSM8226 boards. 
> Reverting the patches Stephan mentioned makes it work again on v6.4-rc1.

https://lore.kernel.org/all/20230512131435.205464-1-francesco@dolcini.it/

