Return-Path: <SRS0=9l+J=37=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92AEC352A3
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 12:30:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C946320842
	for <linux-usb@archiver.kernel.org>; Tue, 11 Feb 2020 12:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbgBKMaV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 11 Feb 2020 07:30:21 -0500
Received: from mga01.intel.com ([192.55.52.88]:31388 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728352AbgBKMaV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 07:30:21 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2020 04:30:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="347272217"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 11 Feb 2020 04:30:15 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 11 Feb 2020 14:30:14 +0200
Date:   Tue, 11 Feb 2020 14:30:14 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/6] typec changes
Message-ID: <20200211123014.GA1498@kuha.fi.intel.com>
References: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
 <20200211122526.GH1856500@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211122526.GH1856500@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 11, 2020 at 04:25:26AM -0800, Greg Kroah-Hartman wrote:
> On Tue, Feb 11, 2020 at 02:25:25PM +0300, Heikki Krogerus wrote:
> > Hi Greg,
> > 
> > Here all the "trivial" changes I have for the USB Type-C class at this
> > stage. The first patch I already send before [1]. You told me to leave
> > the checks in, so I did. The rest of the patches in that series were
> > about USB4, which I'm not including here. I decided to propose them
> > separately.
> > 
> > The third patch in this series make's it possible to swap the power
> > role even when USB Power Delivery is not supported since the latest
> > specification now allows it. The rest of the patches are cleanups.
> > 
> > Let me know if you want me to change anything.
> 
> Are these fixes for 5.6-rc2 or for new stuff for 5.7-rc1?

For 5.7-rc1. Sorry.

thanks,

-- 
heikki
