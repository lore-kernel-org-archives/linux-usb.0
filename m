Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13585C10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 06:27:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD93B2075B
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 06:27:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfDPG1H (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 02:27:07 -0400
Received: from mga05.intel.com ([192.55.52.43]:5304 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726857AbfDPG1G (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Apr 2019 02:27:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Apr 2019 23:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,355,1549958400"; 
   d="scan'208";a="165110935"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 15 Apr 2019 23:27:03 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 16 Apr 2019 09:27:03 +0300
Date:   Tue, 16 Apr 2019 09:27:03 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] usb: typec: displayport: Export probe and remove
 functions
Message-ID: <20190416062703.GA1747@kuha.fi.intel.com>
References: <20190415120931.61328-1-heikki.krogerus@linux.intel.com>
 <20190415120931.61328-7-heikki.krogerus@linux.intel.com>
 <BYAPR12MB272732E9F3A72FA0A59588ECDC240@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <BYAPR12MB272732E9F3A72FA0A59588ECDC240@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190416062703.16N_6WX-biu7REJl_FS5_xxag5tCeTe8FWz4Lqzz1rc@z>

On Tue, Apr 16, 2019 at 12:45:12AM +0000, Ajay Gupta wrote:
> Hi Heikki,
> 
> > -----Original Message-----
> > From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org> On
> > Behalf Of Heikki Krogerus
> > Sent: Monday, April 15, 2019 5:10 AM
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Ajay Gupta <ajayg@nvidia.com>; linux-usb@vger.kernel.org
> > Subject: [PATCH v2 6/7] usb: typec: displayport: Export probe and remove
> > functions
> > 
> > From: Ajay Gupta <ajayg@nvidia.com>
> > 
> > VirtualLink standard extends the DisplayPort Alt Mode by utilizing also the USB 2
> > pins on the USB Type-C connector.
> > It uses the same messages as DisplayPort, but not the DP SVID. At the time of
> > writing, USB IF has not assigned a Standard ID (SID) for VirtualLink, so the
> > manufacturers of VirtualLink adapters use their Vendor IDs as the SVID.
> > 
> > Since the SVID specific communication is exactly the same as with DisplayPort
> > alternate mode, there is no need to implement separate driver for VirtualLink.
> > We'll handle the current VirtualLink adapters with probe drivers, and once there
> > is SVID assigned for it, we add it to the displayport alt mode driver.
> > 
> > To support probing drivers, exporting the probe and remove functions, and also
> > changing the DP_HEADER helper macro to use the SVID of the alternate mode
> > device instead of the DisplayPort alt mode SVID.
> > 
> > Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  drivers/usb/typec/altmodes/displayport.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> Looks like you missed adding displayport.h file. It is available in original patch below,
>  https://marc.info/?l=linux-usb&m=155492587224379&w=2 

That's the one I picked, and I did compile the driver as well.. I'm
not sure what I've done, but I'll resend the series.

Sorry for the hassle.

thanks,

-- 
heikki
