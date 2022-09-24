Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AF6C07E9D
	for <linux-usb@archiver.kernel.org>; Sat, 24 Sep 2022 10:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiIXKrM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 24 Sep 2022 06:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiIXKrL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 06:47:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA4B49B77
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 03:47:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D14A60AF6
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 10:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46AC1C433C1;
        Sat, 24 Sep 2022 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664016429;
        bh=HiC/gs/c23WoW9BLm35SljJ7cakZw09Bn1chm6BHrNI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ONfGIXzke0KVtnhZnT/wDP62c0DYV4H+7Z8IWfe37EjdIpIad+4CRn8tWk6+I/msm
         hXnccI0SjjDpdJwtIiL39sEg2cP+fm4R7WTMQfhQk5EWd12/bRRnrSs16DtUoPeejZ
         Q6RMAHH3s0s6QMF6TBaf9+NbjNm+f2MfjEbsWFcs=
Date:   Sat, 24 Sep 2022 12:47:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <Yy7gKiMOtYYiW/oe@kroah.com>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-4-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220924102718.2984-4-pali@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 24, 2022 at 12:27:14PM +0200, Pali Rohár wrote:
> In preparation for following changes,

What do you mean by "following changes"?  That doesn't work well when
looking in a changelog series.  Spell out what you are going to do in a
future change, as to why this is necessary.

thanks,

greg k-h
