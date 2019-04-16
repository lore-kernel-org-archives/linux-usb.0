Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2553BC10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 10:38:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0F6220857
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 10:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555411121;
	bh=KBux5DKcsufNdS6sfDwDPfTXMueXhJ453Z7t5QVa+JA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PrJ8Aj5Fm4LJ4wa0WsifsppfgsO1++t41J22WRi/EkfJVkbDIwNk0xlMf0pCUYJL+
	 YAEQNqN2vpqa+tse9yd5DTZ6HWuEkOnO2eBHxPQKaTpU1x56AV0WHAmQ6ZCbg9GOi8
	 SX58YoWRYihJPX8MTGyeI91BkmKFTLIe0G0p84Gk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbfDPKij (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 06:38:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:57256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726682AbfDPKii (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Apr 2019 06:38:38 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9737206BA;
        Tue, 16 Apr 2019 10:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555411118;
        bh=KBux5DKcsufNdS6sfDwDPfTXMueXhJ453Z7t5QVa+JA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dTRp5qx+ERzPnfaRy407ONB3MpE+RFoWJPBmSCvtoCAjuavA6VFBg3RuLlKoUU+4n
         nCdHfV+bbWe9wDZ3kxub6xIZCtjK5XvYH8VCqVis2LwszIJTwrKK+8elr2hpjLw3IX
         LDus0xSUjNv/aEtxZSXi4ZD+bS7dRcusSl4VYruk=
Date:   Tue, 16 Apr 2019 12:02:08 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 7/7] usb: typec: Add driver for NVIDIA Alt Modes
Message-ID: <20190416100208.GE896@kroah.com>
References: <20190415120931.61328-1-heikki.krogerus@linux.intel.com>
 <20190415120931.61328-8-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190415120931.61328-8-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416100208.7RkDuZcse_RUIespxm3sQsidMcNBYh8hfDg0ZfbYlHk@z>

On Mon, Apr 15, 2019 at 03:09:31PM +0300, Heikki Krogerus wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
> 
> Latest NVIDIA GPUs support VirtualLink device. Since USBIF
> has not assigned a Standard ID (SID) for VirtualLink
> so using NVIDA VID 0x955 as SVID.
> 
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/altmodes/Kconfig  | 10 +++++++
>  drivers/usb/typec/altmodes/Makefile |  2 ++
>  drivers/usb/typec/altmodes/nvidia.c | 44 +++++++++++++++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.c       |  4 ++-
>  include/linux/usb/typec_dp.h        |  5 ++++
>  5 files changed, 64 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/usb/typec/altmodes/nvidia.c

kbuild does not like this, so I'm dropping it from my queue.

thanks,

greg k-h
