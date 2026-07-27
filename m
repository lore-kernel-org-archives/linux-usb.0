Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.87.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A933341A569;
	Mon, 27 Jul 2026 13:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.87.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785159166; cv=none; b=NV9jGqRrhmR7kxyGq5g3Lz+c7tHgJabJATa2l0Z72xH9agJ5We5g2xOgYeNA4fZCqTQkyYWWHyiV0JeihBMgSNWnbC5mwWXL9KGMVPBRwK1sFStjv9U7jQsbmg/PbZcC/uOEVaH9QDh6XB1L1X3VUoiglRPoTx9QW+rhi+OAhFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785159166; c=relaxed/simple;
	bh=lvjFxcdcPlxe5y3oQfMMGbt+KFUWox48zQVzoOwO47Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ps+Wxnqmhuo8CRAydSpTlPrK0XagMO5NPPFy7L/VWkDvk3DI7xLdkAPHEOkSPNKPE3fpQjG2NUCtIvchAnYlZJ9wJgyr6yQEDc0SiDRiN27j6s3SOEjf7S90wp7ClOeASjoZzcHx9joqsaFfAiS7FytiY17D2L0JDzLxnqt7vWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=ee7pGBlZ; arc=none smtp.client-ip=207.54.87.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="ee7pGBlZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1785159164; x=1816695164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AX4cyBfkVmtItWN66pXo1qA418loJXkfALdGa3eCdFc=;
  b=ee7pGBlZiEQmXXPQkSaHG2ucdW2jIKtbVqpXwPWqBMKn1wxcUxHR4NWv
   As/3dHMWuv0QUW2yI2yIOdVAgve64FtqT4Kv4lnEUQdmm3HcIOPjhToYW
   dqCWRKhyx5qS/kfHAIInLP+UHqOTIVyLYjRYmDqSRGNWXQyu/o69iA50B
   6GyUCKpbqoxUk7i2ppuTfPe5thrfk7FLff5V5r4KfFn8NeSXxTvszHA7v
   2UrtpR8+8kq/pWIfASrIXuAP3OjiNYBM7cQ63/K0e6PTPzE2sp4V+/sDv
   NIbelgj5GdbZAX9p6DXj89oVz80Wq4FkloVpj4SCwbAFhBq1eAMN4yrMU
   Q==;
X-CSE-ConnectionGUID: 5uIQVk6ZSlatejKiGQf4tg==
X-CSE-MsgGUID: UkFPcrSoTRmr+v5dsLoiEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="119158545"
X-IronPort-AV: E=Sophos;i="6.25,188,1779163200"; 
   d="scan'208";a="119158545"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB09.ad.harman.com) ([199.27.113.4])
  by esa11.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 09:32:35 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB09.ad.harman.com (10.92.6.246) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 19:02:33 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 19:02:33 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 421A68AEE1; Mon, 27 Jul 2026 13:32:32 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: Re: [PATCH v5 2/3] Documentation: ABI: document DEVICE_ENUMERATION_FAILURE uevent
Date: Mon, 27 Jul 2026 13:32:32 +0000
Message-ID: <20260727133232.556324-1-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <2026072515-pueblo-appealing-e245@gregkh>
References: <2026072515-pueblo-appealing-e245@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On Sat, Jul 25, 2026 at 07:21:30AM +0200, Greg KH wrote:
> > > > +What:          DEVICE_ENUMERATION_FAILURE
> > > > +Date:          July 2026
> > > > +KernelVersion: 7.3
> > > > +Description:
> > > > +               Some devices may be detected but fail to enumerate
> > > > +               due to protocol-level errors or invalid responses.
> > > > +
> > > > +               A KOBJ_CHANGE uevent includes the following environment
> > > > +               variable when this occurs:
> > > > +
> > > > +                 DEVICE_ENUMERATION_FAILURE=<dev_name>
> > > > +
> > > > +               The value is the kernel device name of the device for
> > > > +               which enumeration failed, as returned by dev_name().
> > > > +
> > > > +               Example (USB):
> > > > +
> > > > +               ACTION=change
> > > > +               SUBSYSTEM=usb
> > > > +               DEVTYPE=usb_interface
> > > 
> > > This will be the port device, not the usb interface, right?
> > 
> > No, DEVTYPE=usb_interface is correct, the example was captured on
> > real hardware. The uevent is not emitted from the port device itself.
> > usb_port devices have no bus or class, so dev_uevent_filter()
> > drops any event from them.It is emitted from the port's parent, 
> > the hub's usb_interface device, while the failing port is identified in the payload instead.

> So shouldn't we fix the fact that usb_ports are not on the bus and add
> them to one?  Would that make things more obvious here as to what port
> the issue is happening on, and potentially allow userspace to actually
> figure out which physical port the problem is?

Adding usb_port devices to usb_bus_type does not fit. usb_device_match()
only handles usb_device and usb_interface, so ports would fall through
unmatched, and bus-managed binding would conflict with the existing
usb_port_driver assignment.

Userspace can already resolve the physical port directly from the
event today:

  DEVPATH=/devices/.../usb1/1-0:1.0
  DEVICE_ENUMERATION_FAILURE=usb1-port1

which corresponds to:
  -> /sys/devices/.../usb1/1-0:1.0/usb1-port1

Appending the payload name to DEVPATH gives the exact sysfs path to
the failing port on the hub.

I dropped the DEVPATH line from the documentation example by mistake.
Will restore it in v6 so the emitter/payload relationship is clear.

Thanks,
Akshay
