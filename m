Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53729C433E0
	for <linux-usb@archiver.kernel.org>; Wed, 10 Feb 2021 11:26:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C3EC64DE0
	for <linux-usb@archiver.kernel.org>; Wed, 10 Feb 2021 11:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbhBJL0D (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 10 Feb 2021 06:26:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:58022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231816AbhBJLXx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Feb 2021 06:23:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA39464E2A;
        Wed, 10 Feb 2021 11:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612956192;
        bh=KOLng0+RLkzD70jXZzLJLg7EJtkySPQSdrqO61gxJ2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VKZLuVuk8xUoHTXlkD/pTDDGFBJDEZv78nDebPBJLvLeUR40OJj5xOVwe0O5rXRtK
         ZIvQUfh6VC9+nnA6HLBzP7QS4VxyUGjx+EpeZlJ9glUTglb8s5QMUOqsdSlJmp0Icy
         Bu/Hl/EmnSxNVPOmfKAblHSc0UzZhNNy3zub2KXc=
Date:   Wed, 10 Feb 2021 12:23:09 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Stefan Ursella <stefan.ursella@wolfvision.net>
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Johan Hovold <johan@kernel.org>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Jonathan Cox <jonathan@jdcox.net>,
        Tomasz =?utf-8?Q?Meresi=C5=84ski?= <tomasz@meresinski.eu>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: quirks: add quirk to start video capture on ELMO
 L-12F document camera reliable
Message-ID: <YCPCHaSMcvqXjr/U@kroah.com>
References: <20210210102821.31779-1-stefan.ursella@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210102821.31779-1-stefan.ursella@wolfvision.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 10, 2021 at 11:28:20AM +0100, Stefan Ursella wrote:
> Without this quirk starting a video capture from the device often fails with
> 
> kernel: uvcvideo: Failed to set UVC probe control : -110 (exp. 34).
> Signed-off-by: Stefan Ursella <stefan.ursella@wolfvision.net>

Please always put an empty line right before your signed-off-by: line.

thanks,

greg k-h
