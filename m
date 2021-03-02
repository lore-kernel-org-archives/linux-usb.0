Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CDEC43381
	for <linux-usb@archiver.kernel.org>; Tue,  2 Mar 2021 11:01:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52032601FB
	for <linux-usb@archiver.kernel.org>; Tue,  2 Mar 2021 11:01:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379727AbhCBKt0 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 2 Mar 2021 05:49:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:56060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1381447AbhCBHcz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Mar 2021 02:32:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5183A614A7;
        Tue,  2 Mar 2021 07:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614670324;
        bh=k9ReknhPwleySyBS7v17wqiCtnFH/YoSN1PBSe8n5To=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aQgDaa/qb49F5WfVb6+nAAB/ZUQJBUfqI6mwoudUXRktkWQ1UVXlPRruRYSVKwqAS
         bVv9BuEPsOc2mLgL5WjcL9TjpBXjKz40KgIHV2nEND9xbl16c94jDyv4srtVyX3Yko
         yFE9t+fS246qyx7dSdBuxhvUJgnk1Qe4N615kE6Y=
Date:   Tue, 2 Mar 2021 08:32:02 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 5/6] USB: typec: fusb302: create debugfs subdir for the
 driver
Message-ID: <YD3p8mQHgQyE4B9N@kroah.com>
References: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
 <20210216144645.3813043-5-gregkh@linuxfoundation.org>
 <46f9d74a-85a5-835b-208a-c612e2c56199@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46f9d74a-85a5-835b-208a-c612e2c56199@roeck-us.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 16, 2021 at 07:24:14AM -0800, Guenter Roeck wrote:
> On 2/16/21 6:46 AM, Greg Kroah-Hartman wrote:
> > The single debugfs file for this driver really is a log file, so make a
> > subdir and call it "log" to make it obvious this is what it is for.
> > This makes cleanup simpler as we just remove the whole directory, no
> > need to handle individual files anymore.
> > 
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> I'd probably have explored the possibility to group files like this
> under the newly created tcpm debugfs directory, but that is really
> a nitpick.

Good idea, I'll look into doing that next...

thanks,

greg k-h
