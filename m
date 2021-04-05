Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EEFC433B4
	for <linux-usb@archiver.kernel.org>; Mon,  5 Apr 2021 07:09:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CC5661398
	for <linux-usb@archiver.kernel.org>; Mon,  5 Apr 2021 07:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhDEHJL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 5 Apr 2021 03:09:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:42440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229717AbhDEHJJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Apr 2021 03:09:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D7596128D;
        Mon,  5 Apr 2021 07:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617606543;
        bh=0vOsiS2+FvDB4jwvzUEAMlbD9TogvJQMNXK2vrcBsuo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qQZUbNBBBa0c02FCP+V7GwjUCXsKE5kdooD/VPgUNPGlOofPjVvq64nsRATmRpmNi
         TWlkXiqabLWjspV+ggFjHUcTcqBI2xwK5IKKYLN/GK/SgqvvVsM1RXSlotWgUU8JEj
         h9ERttW364BeKdyynA7LwQHy+tNcMG6vyXV9QO/0=
Date:   Mon, 5 Apr 2021 09:09:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] usb: typec: Port mapping utility
Message-ID: <YGq3jBGj3Yv3/ZiB@kroah.com>
References: <20210401105847.13026-1-heikki.krogerus@linux.intel.com>
 <20210401105847.13026-4-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401105847.13026-4-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 01, 2021 at 01:58:44PM +0300, Heikki Krogerus wrote:
> Adding functions that can be used to link/unlink ports -
> USB ports, TBT3/USB4 ports, DisplayPorts and so on - to
> the USB Type-C connectors they are attached to inside a
> system. The symlink that is created for the port device is
> named "connector".
> 
> Initially only ACPI is supported. ACPI port object shares
> the _PLD (Physical Location of Device) with the USB Type-C
> connector that it's attached to.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/Makefile      |   2 +-
>  drivers/usb/typec/class.c       |   7 +-
>  drivers/usb/typec/class.h       |   9 ++
>  drivers/usb/typec/port-mapper.c | 219 ++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h       |  13 ++
>  5 files changed, 248 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/usb/typec/port-mapper.c

This patch failed to apply to my usb-next branch, so I stopped applying
the patches here.  Can you rebase the rest when you resend?

thanks,

greg k-h
