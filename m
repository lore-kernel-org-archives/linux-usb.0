Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8241EC433E0
	for <linux-usb@archiver.kernel.org>; Tue, 23 Mar 2021 11:25:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 406D461879
	for <linux-usb@archiver.kernel.org>; Tue, 23 Mar 2021 11:25:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhCWLY4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 23 Mar 2021 07:24:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:48684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229504AbhCWLYT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 07:24:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 147E9600CC;
        Tue, 23 Mar 2021 11:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616498658;
        bh=q0UglmPZ1uPq1Mtqda99ZGLLCqswB8UZpL6+Va5VoF4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LmYjeF8itwtZ+I0QaOoZVPiLrEW2FcODE8kBzT2smCEub6J4c5GQ1pEOTu7BWL6Ce
         VLO5mkzUFOSn7KvLnl9kF6JoRLqWI7ebdik5OE9Qpcdc2zjoeyEcEb8BdfXG9YusaH
         FCK/KtQojxruguv7d2URZjpSRp5iJF7GSS6DobiQ=
Date:   Tue, 23 Mar 2021 12:24:16 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org, John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc2: Add default param to control power
 optimization.
Message-ID: <YFnP4EFrmwuc6Scn@kroah.com>
References: <20210318061247.B2EACA005D@mailhost.synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318061247.B2EACA005D@mailhost.synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 18, 2021 at 10:12:46AM +0400, Artur Petrosyan wrote:
> - Added a default param "power_saving" to enable or
>   disable hibernation or partial power down features.
> 
> - Printed hibernation param in hw_params_show and
>   power_saving param in params_show.

This says what you are doing, but not _why_ you are doing this.  Why is
this needed at all?

Please read the documentation for how to write a good changelog text for
when you resubmit this series.

Also note that the emails were not "threaded", was that on purpose?

thanks,

greg k-h
