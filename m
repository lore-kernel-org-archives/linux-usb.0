Return-Path: <SRS0=p1xS=CC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8CAC433E1
	for <linux-usb@archiver.kernel.org>; Mon, 24 Aug 2020 08:21:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1E5C2074D
	for <linux-usb@archiver.kernel.org>; Mon, 24 Aug 2020 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598257267;
	bh=uegVTyPdmDOaXg3hu8ylF/f6W1qvT/HHlR+Ri/ENx44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=S07OVtd2uzHgSoEdJM6CQTwP3EkVBT1A6O/VzXTIDl/UM1BuE5qXERnigsJbEZbMJ
	 UQgnsBxyeK/bTHgwpdWygJi9gUdvEbcv4QdHdqJvC7FqVJaMGC+UV/O7bJP7IumoTm
	 QaL9U2RvwRUp6IdpieGbOHMp7Pf8OSx1XYAE9tko=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgHXIVF (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 24 Aug 2020 04:21:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:56594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgHXIVE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 04:21:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFFE820738;
        Mon, 24 Aug 2020 08:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598257264;
        bh=uegVTyPdmDOaXg3hu8ylF/f6W1qvT/HHlR+Ri/ENx44=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=spkzDgNbN7eQUmoJoD15yQwlHSxwIAgdk7pVjkjUVhgIa3jWRu0Z22jWzJn6LH7aR
         cjEmlTHaEHVvhjyvKS/MbgrDRsNtFqZL5H2k/CT3NjrSjZhalBuvgyz7xs4lXc4MHG
         2PgYlKoktmzhl+NsVzzMhPnqKrwYHlKlHKSpmGdY=
Date:   Mon, 24 Aug 2020 10:21:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ye Bin <yebin10@huawei.com>
Cc:     leoyang.li@nxp.com, linux-usb@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with
 zero in fsl_udc_probe
Message-ID: <20200824082122.GA336539@kroah.com>
References: <20200824080437.229826-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824080437.229826-1-yebin10@huawei.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 24, 2020 at 04:04:37PM +0800, Ye Bin wrote:
> Signed-off-by: Ye Bin <yebin10@huawei.com>

I can't take patches without any changelog text, sorry.

greg k-h
