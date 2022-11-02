Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFBAC4332F
	for <linux-usb@archiver.kernel.org>; Wed,  2 Nov 2022 07:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiKBHec (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 2 Nov 2022 03:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiKBHe3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Nov 2022 03:34:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A62823BFD
        for <linux-usb@vger.kernel.org>; Wed,  2 Nov 2022 00:34:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DBD5B61847
        for <linux-usb@vger.kernel.org>; Wed,  2 Nov 2022 07:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48975C433D6;
        Wed,  2 Nov 2022 07:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667374467;
        bh=SHIR8BWrL0+E7p4ksL/alrRiUmRdl0samlbAWxNCWaE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nOJ0ndDdJzXM9ThETQ4j0LOQNZ3YPii5G1v0KkKR0HJNNzLY3i0BE42jlTEsUAAJA
         304MNloaNFRTTCsrfIHPJGycDP9uPK3HEFGT2tdqLxam2kCQNxb7ybEs6S37sBDRyl
         J1W9qirMaHx57OwZE90QpJG5rc0sQXW2SpgRwnmINXKEgYRsrsbQjks/hoAsk9LnQu
         VsmAt0Y+3rGH+tMCLHX8S6Cee/kQB4CpLB5bWoSO/ehCcIrGxqe4r1YlRgpE5GJrH3
         AnYJ9GL28C5XCqa8blmqCwGv7ard+9n9fd33f8QRPFemXYf8WYwCrQ0FcSs7E/Y34F
         9ddE9laqce1bQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oq8GJ-00025U-Ci; Wed, 02 Nov 2022 08:34:11 +0100
Date:   Wed, 2 Nov 2022 08:34:11 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <Y2Idc8/LHKnprII1@hovoldconsulting.com>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-4-pali@kernel.org>
 <Yy7gKiMOtYYiW/oe@kroah.com>
 <20221009121707.4o3fjxnec3u4mktz@pali>
 <20221101225057.2i2rsh5latrvn4au@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101225057.2i2rsh5latrvn4au@pali>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 01, 2022 at 11:50:57PM +0100, Pali Rohár wrote:
> On Sunday 09 October 2022 14:17:07 Pali Rohár wrote:
> > On Saturday 24 September 2022 12:47:06 Greg Kroah-Hartman wrote:
> > > On Sat, Sep 24, 2022 at 12:27:14PM +0200, Pali Rohár wrote:
> > > > In preparation for following changes,
> > > 
> > > What do you mean by "following changes"?  That doesn't work well when
> > > looking in a changelog series.  Spell out what you are going to do in a
> > > future change, as to why this is necessary.
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > Ok. Anything else is needed to address?
> 
> Ping?

I'll try to look at this again next week. I did notice that your SoB
chains are wrong as Marek did not submit these changes and it's not
clear whether he's an author at all.

Johan
