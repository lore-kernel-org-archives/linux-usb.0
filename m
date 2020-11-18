Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C30C6379F
	for <linux-usb@archiver.kernel.org>; Wed, 18 Nov 2020 15:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03A3B247B8
	for <linux-usb@archiver.kernel.org>; Wed, 18 Nov 2020 15:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TPbO6LTV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgKRP4b (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 18 Nov 2020 10:56:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:51564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726238AbgKRP4b (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Nov 2020 10:56:31 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64AB7247B8;
        Wed, 18 Nov 2020 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1605714989;
        bh=S6MkxhTMTtg3RRpljnV7gAI8VRb1Mas9LfZSsWtf1q8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TPbO6LTVo4eR63FB3qXCO1/jF2mvJDzj7/plUpU4pkP7K6W5KkTtFtExf4HnXhtO3
         lW0QM67odvRAs5cZeamKXN/f6T8vKu9rpabgx523gTOCM6C+j6mNvfH9Yo61a5cTKm
         Cw2hQg5+ZyfudOKQsJI0Jt4AYKzkJJuzjHqmwfqs=
Date:   Wed, 18 Nov 2020 16:57:15 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] usb: typec: Add product_type sysfs attribute
 file for partners and cables
Message-ID: <X7VEW9X8lYR7cosA@kroah.com>
References: <20201118150059.3419-1-heikki.krogerus@linux.intel.com>
 <20201118150059.3419-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118150059.3419-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 18, 2020 at 06:00:58PM +0300, Heikki Krogerus wrote:
> USB Power Delivery Specification defines a set of product
> types for partners and cables. The product type is defined
> in the ID Header VDO, which is the first object in the
> response to the Discover Identity command.
> 
> This sysfs attribute file is only created for the partners
> and cables if the product type is really known in the
> driver. Some interfaces do not give access to the Discover
> Identity response from the partner or cable, but they may
> still supply the product type separately in some cases.
> 
> When the product type of the partner or cable is detected,
> uevent is also raised with PRODUCT_TYPE set to show the
> actual product type (for example PRODUCT_TYPE=host).
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  Documentation/ABI/testing/sysfs-class-typec |  55 ++++++++
>  drivers/usb/typec/class.c                   | 132 ++++++++++++++++++--
>  2 files changed, 180 insertions(+), 7 deletions(-)

Seems semi-sane, nice work :)

greg k-h
