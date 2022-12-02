Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777F7C4332F
	for <linux-usb@archiver.kernel.org>; Fri,  2 Dec 2022 18:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234481AbiLBSb3 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 2 Dec 2022 13:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234474AbiLBSbY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Dec 2022 13:31:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEB8E98B2;
        Fri,  2 Dec 2022 10:31:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6A9F6B82233;
        Fri,  2 Dec 2022 18:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEF7C43141;
        Fri,  2 Dec 2022 18:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670005877;
        bh=7zgYaFTeji0CpxCw2lV29TRFJpkeOmmq+FEOk2Nhg2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NGHIiqDZkn6b77RVJ94ooRtHmxeDoZNKChKgs18m5Ec/pjmZ55S9aA/bBYwhfANm0
         94TfAoAsjnvK/iW+Ae/VyFHt2cxGb3hYfBKCPE8KSjVw3QCf8787aLVJyKFqCprjvX
         2tjp7flbzJKmYxfv3t6W4Emwk+9GBQJu9kCoSMcI=
Date:   Fri, 2 Dec 2022 19:31:13 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 6.1-rc8
Message-ID: <Y4pEcSmEuwGWo4TD@kroah.com>
References: <Y4o6ypWhDfI8DPuO@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4o6ypWhDfI8DPuO@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 02, 2022 at 06:50:02PM +0100, Johan Hovold wrote:
> The following changes since commit b7b275e60bcd5f89771e865a8239325f86d9927d:
> 
>   Linux 6.1-rc7 (2022-11-27 13:31:48 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.1-rc8

It's too late for 6.1-final for my tree, so I'll just queue these up for
6.2-rc1 and they can be backported if needed for 6.1.

thanks,

greg k-h
