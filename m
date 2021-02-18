Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414C2C433E0
	for <linux-usb@archiver.kernel.org>; Thu, 18 Feb 2021 16:32:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 005B064E33
	for <linux-usb@archiver.kernel.org>; Thu, 18 Feb 2021 16:32:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhBRQcH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 18 Feb 2021 11:32:07 -0500
Received: from verein.lst.de ([213.95.11.211]:48668 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230401AbhBRPJY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Feb 2021 10:09:24 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id D486D68D07; Thu, 18 Feb 2021 16:07:46 +0100 (CET)
Date:   Thu, 18 Feb 2021 16:07:46 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     hch@lst.de, Greg KH <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@redhat.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Regression: 6eb0233ec2d0 ("usb: don't inherity DMA properties
 for USB devices")
Message-ID: <20210218150746.GA18220@lst.de>
References: <ef15869a-fe87-aef2-591d-2ca909a66217@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef15869a-fe87-aef2-591d-2ca909a66217@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 18, 2021 at 03:56:00PM +0100, Thomas Zimmermann wrote:
> I only have udl devices, but I expect that other DRM USB adapters are also 
> affected.

Find where the driver calls dma_map_* itself instead of using the USB
wrappers and fix that..

