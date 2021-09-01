Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F02C432BE
	for <linux-usb@archiver.kernel.org>; Wed,  1 Sep 2021 18:12:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D503610A4
	for <linux-usb@archiver.kernel.org>; Wed,  1 Sep 2021 18:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbhIASNs (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 1 Sep 2021 14:13:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:51168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229617AbhIASNs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 14:13:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C885610A1;
        Wed,  1 Sep 2021 18:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630519971;
        bh=PDc9ADPKjagCelgUd/yc4RuTpHpi6uylq87+Av2GXPQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e/Ono2+6ra7q7rX54MWLZlBlo8IYav2Zy/brtRnYRuCFG19TIXHlf3mzzxii/iupn
         u0LVpuBSm3huEg1kDs8K2dbXakpMEtj0Ho94bEmv5S+2dbbR5xzZFksTdwwOISI363
         tWf8EJadr4ZMwsl54xE+R49aiOIKGwCsOP4ViHIE=
Date:   Wed, 1 Sep 2021 20:12:38 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fix for 5.15-rc1
Message-ID: <YS/ClhRzByctA6nT@kroah.com>
References: <YS3/OWl4ZlpRs1Eb@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS3/OWl4ZlpRs1Eb@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 31, 2021 at 12:06:49PM +0200, Johan Hovold wrote:
> The following changes since commit df7b16d1c00ecb3da3a30c999cdb39f273c99a2f:
> 
>   Revert "USB: serial: ch341: fix character loss at high transfer rates" (2021-08-25 09:13:33 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.15-rc1

Pulled and pushed out, thanks.

greg k-h
