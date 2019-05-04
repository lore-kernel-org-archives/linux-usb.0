Return-Path: <SRS0=ruMo=TE=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AC7C43219
	for <linux-usb@archiver.kernel.org>; Sat,  4 May 2019 06:33:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7050D206DF
	for <linux-usb@archiver.kernel.org>; Sat,  4 May 2019 06:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556951625;
	bh=84mKmofQ1I0p0ojHmcWzw7M3BuEpFKyAKsoEA/IlW5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=iL+qZ4JTPhC144O5tYZQB2NZik1dKJwU1ZGGcxVicoLwpUpH2w3Vr83eBX2fk/h/U
	 U4y/roaNnrDbYddItz2WSg2yDgXw99jrDi51sb3QFiEvuoddQQ18GEZBZXETVAqPOM
	 xSwMQ6wCUuv4V22rqzJ11EK3fKeMyR6Yde8pHMz4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbfEDGdo (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 4 May 2019 02:33:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:45238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725808AbfEDGdo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 May 2019 02:33:44 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D23CB206DF;
        Sat,  4 May 2019 06:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556951623;
        bh=84mKmofQ1I0p0ojHmcWzw7M3BuEpFKyAKsoEA/IlW5g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BXJGMfyllchGZ/ImhgWiTIVtvq8a84Rs+uoCs5UAPoes8jbBZ4efgHSvmI5lkzQCq
         GzfxzuURe4t1gtaNj41Tx0+cJCJQTmY+EeQpZLe/DdWaknhPFwqefc+PLrUEyEuYAq
         iRAoEJcz2gGYVQf7yO20V01JF66M23pztyCk2O54=
Date:   Sat, 4 May 2019 08:33:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: xhci_debugfs: Fix a null pointer dereference
 in xhci_debugfs_create_endpoint()
Message-ID: <20190504063340.GA26311@kroah.com>
References: <20190504033748.17964-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190504033748.17964-1-baijiaju1990@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190504063340.2wA4Ai418-1kq_8C0g2CaExZ1cy_qzP5u1pNumxXdvI@z>

On Sat, May 04, 2019 at 11:37:48AM +0800, Jia-Ju Bai wrote:
> In xhci_debugfs_create_slot(), kzalloc() can fail and
> dev->debugfs_private will be NULL.
> In xhci_debugfs_create_endpoint(), dev->debugfs_private is used without
> any null-pointer check, and can cause a null pointer dereference.
> 
> To fix this bug, a null-pointer check is added in
> xhci_debugfs_create_endpoint().
> 
> This bug is found by a runtime fuzzing tool named FIZZER written by us.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>

Very rare case, but nice fix.  You should put "potential" in your
subject line as this is something that no one should ever hit :)

Anyway:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
