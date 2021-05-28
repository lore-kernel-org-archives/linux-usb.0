Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F4AC4708C
	for <linux-usb@archiver.kernel.org>; Fri, 28 May 2021 08:54:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B5F3613DA
	for <linux-usb@archiver.kernel.org>; Fri, 28 May 2021 08:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235684AbhE1I4A (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 28 May 2021 04:56:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:54858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235578AbhE1Iz6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 May 2021 04:55:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 687E9613DA;
        Fri, 28 May 2021 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622192062;
        bh=jHWwT7oZ3rz2eME/MWt/zoJrV735QwXmhZcPJR8CDAQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bd526gY5osN1DTVL8huv2+7ruY+J/aNcy4TjYtWIeGeye5rTGa844YoGcapItstUo
         GUOjY8Cev/kGn5iHW+6PkyaqRK/3WztcfcU3RP3E0XQ/cM/mej2VWJeix0TPT7I+E8
         dSSo5OWHmEZGxirQSecIeEs8GM/CtG14c9QTmf78=
Date:   Fri, 28 May 2021 10:54:19 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Phil Elwell <phil@raspberrypi.com>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Sasha Levin <sashal@kernel.org>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: Fix build in periphal-only mode
Message-ID: <YLCvuz1Ce6mHt+wZ@kroah.com>
References: <20210528081818.2601382-1-phil@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528081818.2601382-1-phil@raspberrypi.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 28, 2021 at 09:18:18AM +0100, Phil Elwell wrote:
> The bus_suspended member of struct dwc2_hsotg is only present in builds
> that support host-mode.
> 
> Fixes: 62bb46f51f91 ("usb: dwc2: Fix hibernation between host and device modes.")

That commit id is not in Linus's tree :(

Please fix it with the real commit id and resend.

thanks,

greg k-h
