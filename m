Return-Path: <SRS0=9l+J=37=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A03EC352A3
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 12:25:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2224320842
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581423929;
	bh=SU5nCxK1IPBd0Q7xVoILKdmk99K2hZZdUlstQ0+/0Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=F4Nl0y55j0zJDhikphHhpa9ws0Sm3udLKmaI0FHthEJIFDebRNrW2EGqwaMs+mmNj
	 R3hqkUBWRc2pZGwJbMvk6OC3Bdo6QExDOgRjLsWbTCbTdqVQr+roOMdDzhl9eME6sr
	 33HgUqpA/bHks7z10iIRfvaWTS+W/LRKOn1Zc6G4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbgBKMZ2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 11 Feb 2020 07:25:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:50334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727887AbgBKMZ2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 07:25:28 -0500
Received: from localhost (unknown [209.37.97.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 96FE520714;
        Tue, 11 Feb 2020 12:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581423926;
        bh=SU5nCxK1IPBd0Q7xVoILKdmk99K2hZZdUlstQ0+/0Bk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dtvoAXVzSgPWxDNt5PoWz6nBkRuYkSE44CupGpWZTTdhsV8T+qt5gBOAqBppmG26E
         RlpTdK8aVOXrlzEOSQZaHofD5+wn47uJAw/R9+nQI7D+jBniKPeOuSIyfIK3/EENgX
         /UBdaL7BkuzqONrpdeKWpxrPz86iciWMqVOQLI+E=
Date:   Tue, 11 Feb 2020 04:25:26 -0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/6] typec changes
Message-ID: <20200211122526.GH1856500@kroah.com>
References: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 11, 2020 at 02:25:25PM +0300, Heikki Krogerus wrote:
> Hi Greg,
> 
> Here all the "trivial" changes I have for the USB Type-C class at this
> stage. The first patch I already send before [1]. You told me to leave
> the checks in, so I did. The rest of the patches in that series were
> about USB4, which I'm not including here. I decided to propose them
> separately.
> 
> The third patch in this series make's it possible to swap the power
> role even when USB Power Delivery is not supported since the latest
> specification now allows it. The rest of the patches are cleanups.
> 
> Let me know if you want me to change anything.

Are these fixes for 5.6-rc2 or for new stuff for 5.7-rc1?

thanks,

greg k-h
