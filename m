Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.87.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C3A3F99FE;
	Fri, 24 Jul 2026 22:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.87.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784931912; cv=none; b=jae+MJo8+kZrpriGHYW1TMl1pGBfb5oBrmdBxkchdQV6klsbbiGG9kzJ86Ibi0K0AhDO3LrYzgivac5IAZdTZ5OkuOIfm6AU66FEDwYFrEr6I9pUBtKZQRlQQ8CpHZQarj7ebXKNKGKuzwuRvVOXGFyEt9zex/L8x9gMwqy8UcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784931912; c=relaxed/simple;
	bh=mrNUkd/eA8mizevhIHLZdpRwyfS5IXerRaoBfgOIRdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HEVQlAJsfyYZRAWolwhjchJd9NY1N5WMGguCYXFfG1bh9WsitKEiGS370hx8GoQA88E2YsQZ4WhMguhFZDuPOvK9NPstmxpOhxY+Idxk4Qk8xR8VTBfsfd32K4noUJzPezZXhImigdgD7P6/VL0sPVLtSKclJgWHACu7zdor73s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=h+FwosZX; arc=none smtp.client-ip=207.54.87.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="h+FwosZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1784931911; x=1816467911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T2gLx2ohk6WnxiNb+cXBz9T+jyGCQjytKiGzs3RvuK0=;
  b=h+FwosZXGBZfk4zlspCIhzG/LrH+b5BEN1Di2Nn2Ml/KENoRYtEpukta
   PWxi1g2dihFDjVJmy5DC9GaLELypCB+aUi9tJC5Im/gshQH33gnBgKwjp
   vLQMzT/zFgJjs6kLmwNnszCc+bTbFpUAZi633GdYKo4xWLXMom4gkjFd2
   b4l+BxdH6gGM+OmeLXXoyoNrWGtSP+IGI89ip9bPp6S9rI1aZX56pxL6x
   Os7hCWn2JOgZKfBtNziV+CgOU6yhEANLMm0gg8qDBj2FDJJlrGGd5EsLP
   T2gcWJK2SVec26yNyDiMubSQRs9zJIUpEZWGsmIYS4lO7dHXAPtqaB9W5
   g==;
X-CSE-ConnectionGUID: oAvaq1opRkKpg1mawR1G1w==
X-CSE-MsgGUID: PdUAeRo/SKqgqKGUfyzFxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="120401278"
X-IronPort-AV: E=Sophos;i="6.25,183,1779163200"; 
   d="scan'208";a="120401278"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB09.ad.harman.com) ([199.27.113.4])
  by esa10.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 18:25:08 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB09.ad.harman.com (10.92.6.246) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 25 Jul 2026 03:55:06 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Sat, 25 Jul 2026 03:55:06 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 4E6E17D7ED; Fri, 24 Jul 2026 22:25:06 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: Re: [PATCH v5 2/3] Documentation: ABI: document DEVICE_ENUMERATION_FAILURE uevent
Date: Fri, 24 Jul 2026 22:25:06 +0000
Message-ID: <20260724222506.471475-1-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <2026071745-ambulance-reload-4e29@gregkh>
References: <2026071745-ambulance-reload-4e29@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On Fri, Jul 17, 2026 at 12:37:32PM +0200, Greg KH wrote:
> > Document the DEVICE_ENUMERATION_FAILURE environment variable emitted
> > in KOBJ_CHANGE uevents when device enumeration fails.
> > 
> > Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
> > ---
> >  Documentation/ABI/testing/sysfs-uevent | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/testing/sysfs-uevent
> > index 0b6227706b35e..e362c34aa2ef6 100644
> > --- a/Documentation/ABI/testing/sysfs-uevent
> > +++ b/Documentation/ABI/testing/sysfs-uevent
> > @@ -49,3 +49,28 @@ Description:
> >  
> >  Users:
> >                  udev, userspace tools generating synthetic uevents
> > +
> > +What:          DEVICE_ENUMERATION_FAILURE
> > +Date:          July 2026
> > +KernelVersion: 7.3
> > +Description:
> > +               Some devices may be detected but fail to enumerate
> > +               due to protocol-level errors or invalid responses.
> > +
> > +               A KOBJ_CHANGE uevent includes the following environment
> > +               variable when this occurs:
> > +
> > +                 DEVICE_ENUMERATION_FAILURE=<dev_name>
> > +
> > +               The value is the kernel device name of the device for
> > +               which enumeration failed, as returned by dev_name().
> > +
> > +               Example (USB):
> > +
> > +               ACTION=change
> > +               SUBSYSTEM=usb
> > +               DEVTYPE=usb_interface
> 
> This will be the port device, not the usb interface, right?

No, DEVTYPE=usb_interface is correct, the example was captured on
real hardware. The uevent is not emitted from the port device itself.
usb_port devices have no bus or class, so dev_uevent_filter()
drops any event from them.It is emitted from the port's parent, 
the hub's usb_interface device, while the failing port is identified in the payload instead.

Per your feedback on patch 1/3, In v6, this becomes explicit in the API.
The caller passes the emitting device and the failed identifier as
separate arguments. I will also reword the Description to make clear
that the value is a bus-specific identifier of the port or slot that
failed to enumerate, not the name of the emitting device, so the
example cannot be misread.

> > +               DEVICE_ENUMERATION_FAILURE=usb1-port1
> 
> That looks right.
> 
> > +
> > +Users:
> > +               udev, userspace tools monitoring device enumeration failures
> > \ No newline at end of file
> 
> Didn't checkpatch complain about this?

checkpatch did not flag it. Will fix the missing newline at EOF in v6.

> And is there actually udev code to handle this being proposed anywhere?

We currently consume this uevent via a netlink listener to show 
system popups/notifications when device enumeration fails. Once the kernel 
ABI stabilizes, a default udev rule example will be submitted separately.

Thanks,
Akshay
