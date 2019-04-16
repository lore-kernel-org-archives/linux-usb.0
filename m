Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE007C10F14
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 10:38:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D6BB206BA
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555411123;
	bh=WgE7GxQCPAoAeSfcGJZwt/noavHnmekZn95eyaMWz58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=puPBig5FpmAFLLunsVSugV1pd6Dev48f4QCyd5KOp++u4LoihthuiY3HFFA36d0+h
	 FennuWZMEpeDIwdzz9tsFG1NrdZs6zO7Pv+OYJ8TYz09PCxAyuyobjOgQo5fp7vi6v
	 ewknlq3qeBzeuxCr+ogLGGgA14DK2wGd3GQaWP7Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbfDPKim (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 06:38:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:57288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726682AbfDPKil (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Apr 2019 06:38:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C334206BA;
        Tue, 16 Apr 2019 10:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555411121;
        bh=WgE7GxQCPAoAeSfcGJZwt/noavHnmekZn95eyaMWz58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HQF0uNLvP8yUoepZ/oHJ43oGbCv2dwF97CeGqnsRWGpKaH1wYzE2nn/WXX/66cD+H
         GR8Elzle02US9hrD3D+ASRPfZtxqHIW5oizCjg5G3FN+VF8NMfCovz+If9JPZSfROi
         5yYStVFNSSk/84DUVeWHZZyeIMj3XUBgZ4YnbNGc=
Date:   Tue, 16 Apr 2019 12:03:11 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Ajay Gupta <ajayg@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] usb: typec: displayport: Export probe and remove
 functions
Message-ID: <20190416100311.GF896@kroah.com>
References: <20190415120931.61328-1-heikki.krogerus@linux.intel.com>
 <20190415120931.61328-7-heikki.krogerus@linux.intel.com>
 <BYAPR12MB272732E9F3A72FA0A59588ECDC240@BYAPR12MB2727.namprd12.prod.outlook.com>
 <20190416062703.GA1747@kuha.fi.intel.com>
 <20190416074607.GC1747@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190416074607.GC1747@kuha.fi.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416100311.0sgK4ztF3aWSUSWtpS4TOvvPCVt9DUPOAUZC8__CUIY@z>

On Tue, Apr 16, 2019 at 10:46:07AM +0300, Heikki Krogerus wrote:
> On Tue, Apr 16, 2019 at 09:27:03AM +0300, Heikki Krogerus wrote:
> > On Tue, Apr 16, 2019 at 12:45:12AM +0000, Ajay Gupta wrote:
> > > Hi Heikki,
> > > 
> > > > -----Original Message-----
> > > > From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org> On
> > > > Behalf Of Heikki Krogerus
> > > > Sent: Monday, April 15, 2019 5:10 AM
> > > > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > Cc: Ajay Gupta <ajayg@nvidia.com>; linux-usb@vger.kernel.org
> > > > Subject: [PATCH v2 6/7] usb: typec: displayport: Export probe and remove
> > > > functions
> > > > 
> > > > From: Ajay Gupta <ajayg@nvidia.com>
> > > > 
> > > > VirtualLink standard extends the DisplayPort Alt Mode by utilizing also the USB 2
> > > > pins on the USB Type-C connector.
> > > > It uses the same messages as DisplayPort, but not the DP SVID. At the time of
> > > > writing, USB IF has not assigned a Standard ID (SID) for VirtualLink, so the
> > > > manufacturers of VirtualLink adapters use their Vendor IDs as the SVID.
> > > > 
> > > > Since the SVID specific communication is exactly the same as with DisplayPort
> > > > alternate mode, there is no need to implement separate driver for VirtualLink.
> > > > We'll handle the current VirtualLink adapters with probe drivers, and once there
> > > > is SVID assigned for it, we add it to the displayport alt mode driver.
> > > > 
> > > > To support probing drivers, exporting the probe and remove functions, and also
> > > > changing the DP_HEADER helper macro to use the SVID of the alternate mode
> > > > device instead of the DisplayPort alt mode SVID.
> > > > 
> > > > Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> > > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > ---
> > > >  drivers/usb/typec/altmodes/displayport.c | 12 +++++++-----
> > > >  1 file changed, 7 insertions(+), 5 deletions(-)
> > > Looks like you missed adding displayport.h file. It is available in original patch below,
> > >  https://marc.info/?l=linux-usb&m=155492587224379&w=2 
> > 
> > That's the one I picked, and I did compile the driver as well.. I'm
> > not sure what I've done, but I'll resend the series.
> 
> It looks like I broke the patch after I did a small modification to
> it. I had changed your "From" address so it matches your singed-of-by
> address. My compile test passed because the header was an untracked
> file :-)
> 
> Sorry again. Let's do one more test round, and resend.

Ok, dropping this whole series from my queue now, thanks.

greg k-h
