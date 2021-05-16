Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64B7C433B4
	for <linux-usb@archiver.kernel.org>; Sun, 16 May 2021 01:01:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFCA9611BD
	for <linux-usb@archiver.kernel.org>; Sun, 16 May 2021 01:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhEPBDJ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 15 May 2021 21:03:09 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50853 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231608AbhEPBDI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 May 2021 21:03:08 -0400
Received: (qmail 1046484 invoked by uid 1000); 15 May 2021 21:01:54 -0400
Date:   Sat, 15 May 2021 21:01:54 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hritik Vijay <hritikxx8@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Order in which kernel decides binding device driver
Message-ID: <20210516010154.GA1046393@rowland.harvard.edu>
References: <YKA0hphGFeqM+BZG@Journey.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKA0hphGFeqM+BZG@Journey.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 16, 2021 at 02:22:22AM +0530, Hritik Vijay wrote:
> Hello
> 
> I've experimented with two device drivers targeting a single device,
> both hot-pluggable. When the device plugs in, both the modules are loaded.
> This is expected behavior of udev. After being loaded, only one of the
> drivers offered by them is chosen to be bound to the device
> i.e. only one module gets to execute their `probe` function.
> 
> I tried looking through the source to find out which module would get
> the preference but I would really like some clarification on the
> topic. 
> In what order will the kernel decide to give opportunities to device 
> drivers to bind to a device ?

I believe this happens in the order that the drivers are registered.  
For drivers in modules, this will be the order in which the modules are 
loaded.

In practice the loading order usually doesn't matter, because only one 
driver will be able to manage a particular device.  For cases where 
there are two drivers capable of handling the same device, people 
usually have some sort of priority scheme to decide.  For example, many 
USB mass-storage devices can be handled by either the usb-storage or the 
uas driver, but uas has higher priority.

Alan Stern
