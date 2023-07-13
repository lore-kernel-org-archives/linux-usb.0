Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D87EB64DD
	for <linux-usb@archiver.kernel.org>; Thu, 13 Jul 2023 13:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbjGMNYO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 13 Jul 2023 09:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232728AbjGMNXg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jul 2023 09:23:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9722735
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 06:22:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F47A60C1F
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 13:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B99C433C8;
        Thu, 13 Jul 2023 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689254561;
        bh=EHNuDJu7ugOvQA00cppp+88nsksXQsJXufKr/3pKTZk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DZLJo4CG6fLYoyqYaDWcDDf+KOvNw9FJlGroCH4eFi2+Vp0YsXgo74xcdel9rhxYM
         0P90H8crRxB1ekK4+0w7OckckhJmCzyjDATkDMkHBrkCB2wLeyhWGaAPet/Mt3/QB7
         xviZ0BQzvI/gg3uK+dV87pvfqkCp/I9ZmW2QaZjs=
Date:   Thu, 13 Jul 2023 15:22:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: question on uapi
Message-ID: <2023071349-lunar-slate-1339@gregkh>
References: <dfb234d2-9ee0-313f-d1a2-16c3767ccab6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfb234d2-9ee0-313f-d1a2-16c3767ccab6@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 13, 2023 at 12:39:09PM +0200, Oliver Neukum wrote:
> Hi,
> 
> what is the policy on uapi. It being for user space means
> that it should be as complete as possible, even if the kernel does not need stuff,
> should it not?

If the kernel does not need it, why add it to a uapi .h file as there is
nothing that userspace could do with it, right?

Or are you talking about USB protocols/structures that userspace can use
by talking to a USB device directly?

Specifics would be great to have, thanks.

greg k-h
