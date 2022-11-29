Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B961DC4332F
	for <linux-usb@archiver.kernel.org>; Tue, 29 Nov 2022 07:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiK2H51 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 29 Nov 2022 02:57:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiK2H50 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 02:57:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663415216D
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 23:57:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AA67BB810AD
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 07:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B20C433C1;
        Tue, 29 Nov 2022 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669708641;
        bh=7AbtWrQlp9k8KrQa4srgg7iZ5jQvg6rumAPM9dssCt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vTCyIskEq823x7c0vN32SRGKw7/eEgt1jeKd+3Zn0KIV1XCw5335MwKsSQb3PgD7q
         oa6VSlxG6gN8wFh6oXzM9rPbILDjZOzJKQAWhb1eed1s+loHt1RaSazTVfgpsqUAxg
         sBTDDdUoAaKDCutsS0Cx3QWYIDer7R672QXLkR10=
Date:   Tue, 29 Nov 2022 08:57:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 2/23]
 drivers/usb/gadget/function/uvc_v4l2.c:266:3: warning: unannotated
 fall-through between switch labels
Message-ID: <Y4W7Xw6OA9GLzXmH@kroah.com>
References: <202211290734.P9mHcjpl-lkp@intel.com>
 <Y4W6/0Ql3dI+ePXF@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4W6/0Ql3dI+ePXF@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 29, 2022 at 08:55:43AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Nov 29, 2022 at 07:22:43AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > head:   465d4dd073f72a6348577ed0f7aa4aa00c9264bc
> > commit: a6f523ee41bfe7ef71110d4ae556339d0520efdd [2/23] usb: gadget: uvc: add validate and fix function for uvc response
> 
> Michael, I'll drop this commit from my tree now, please fix up and
> resend.

Nevermind, I fixed it up myself, it was trivial.

greg k-h
