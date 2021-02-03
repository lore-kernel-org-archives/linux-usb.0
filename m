Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8BFC433E6
	for <linux-usb@archiver.kernel.org>; Wed,  3 Feb 2021 13:10:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBA1A64F95
	for <linux-usb@archiver.kernel.org>; Wed,  3 Feb 2021 13:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhBCNKY (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 3 Feb 2021 08:10:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:53926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229567AbhBCNKX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Feb 2021 08:10:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1BB064E38;
        Wed,  3 Feb 2021 13:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612357782;
        bh=EmMMU+EKU1dTVh1vPxCUCP3cDZBD/5AIRQpfOH9+AlE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WtRjjRUFlq4pUY6kQFMgTcpkmPwPbtwgeNoLMgVN1epQtYS2KXPb2eV7HVLB2XaIw
         SZYV/8g8efo6szkapCFVZagXE6WzfIS7/ZwIZhYlqVp3PrC/DBr4sGBxy1T7jZRAYf
         taH8KwP0nwERsYpZl9H3oWRwTHb1rtzVE4B3YPVA=
Date:   Wed, 3 Feb 2021 14:09:39 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Kyle Tso <kyletso@google.com>, linux@roeck-us.net,
        hdegoede@redhat.com, robh+dt@kernel.org, badhri@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/8] usb: pd: Update VDO definitions
Message-ID: <YBqgkz38iBXIYw9b@kroah.com>
References: <20210202161733.932215-1-kyletso@google.com>
 <20210202161733.932215-3-kyletso@google.com>
 <20210203124836.GE1687065@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203124836.GE1687065@kuha.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 03, 2021 at 02:48:36PM +0200, Heikki Krogerus wrote:
> On Wed, Feb 03, 2021 at 12:17:27AM +0800, Kyle Tso wrote:
> > "PD Spec Revision 3.0 Version 2.0 + ECNs 2020-12-10" introduces several
> > changes regarding the ID Header VDO and the Product Type VDOs.
> > 
> > Signed-off-by: Kyle Tso <kyletso@google.com>
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks, I'll queue this up now to reduce the number of patches in Kyle's
patchset when he respins it :)

greg k-h
