Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794525766;
	b=0Y0cwRSYPbVQtiFoOaC67vTp8BLoEdTJJtQ/+JY1t/AsWUVzcMkKbwQlIIsmbpB9RIIX
	 kjlOi4ZrNy/8L3NY/7u8RZxdgkAyNM+krMkbPtZ6rf+crQWYv9QA3I/HbOL1RbkwvVgJg
	 70+8tnUTVfQpdY1noE1mBKMrv/qukn4dS6/cgggFwyPHLW8r2Dkr+ShQq9ckF4gCLJ2Fw
	 gmf1ogsSuaXTY3h0c6KOBYBsw6cLe4hKjr8C2SNgFhlkdHNWungcT2cKOAUpV+at0gnUa
	 nL/rY3PAX2tLSPRGZ+eFzK0Qi+OlKa9q9gTeiAIOsebnfxxZosUa21CWq601c1+HW1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794525766;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=Yabi90sXOn5M/2jFX1MOF55oAnLsAp4+otqWtjtCm8A=;
	b=JMd0+FnoPMo/H8Vpm8CqL6ZSKdxYND6aw4sVwTgGmHBIqsLmHYc8Dscgjk3T45W/Loj9
	 W6sZ+JtYEvVx+qoXennZ/CjAlcQmhmfhreEVEf/h53x8joIq3D8U45vfLYYu9bSh8Kg8q
	 uC0woT/c7UM4cIMcU0SzI5dtRBomiogKXsAYkcpgbN7fm/Wdx32COcg6r91rBi65ItRaC
	 UK1m0LHwvZLR63+ma2uuU8ZCEkuur4LD6QYMEplWyG9gHHCR2SG908QDWBaGTc5MCSOV7
	 MSfVc6X2EthpKxvXLbYNpU8floL57cedyBHUSg9nfAnxDAv7CbPDzCcPrmG/v468Ayg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bKJ7WR0+;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D52606A321
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 23:22:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D52606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bKJ7WR0+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794525765; x=1826061765;
  h=message-id:date:mime-version:to:cc:from:subject:
   content-transfer-encoding;
  bh=b/4X6Q6kTElgF00Z1iBm4EknWIo7QbRogOqzN9uUFnQ=;
  b=bKJ7WR0+bQ81XymLp3xu2VNlUCKWxjdDXo2JYOjzQZlUxn9Gq33QSwW4
   g1bhlahafSTfqldKXSRArqFpptjnxKpJUGfFor4W9HxGpdUUaK6pkeRFa
   Ha4P3vzo7VlM9C7C2m+5QfKTVGwUzD6lCL+jtgyKMdPZhD9N75vXslXU0
   eq3QpKDXgaHssqZB/lccrWwHty1gh68YlLivIyzbZtlFF9eT0rMh3jGjF
   +zoxkzDjFXrg6SEB1NoVKblH0dGLXmd3OUnngpz3Vy8Ts+WFFl23x57Lz
   S+0wgRUt3pgxXUyU4BuDk+mV3sxNqRERJ+E/WDW0NdNu0zeR78i7uY2zC
   w==;
X-CSE-ConnectionGUID: DvnaKU4sSfClv+AOsJy/lg==
X-CSE-MsgGUID: Kc365y9sRu2cxlQvlnWHcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3407620"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3407620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 15:22:45 -0800
X-CSE-ConnectionGUID: +GcMbUlNSw2uy9tFIepXXw==
X-CSE-MsgGUID: 1MVnRT57Slmon9yBatlIVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8944435"
Received: from rmodi-mobl.amr.corp.intel.com (HELO [10.124.161.66]) ([10.124.161.66])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 15:22:45 -0800
Message-ID: <087d879a-e8fd-402f-b8d2-2531244ff69f@linux.intel.com>
Date: Thu, 12 Nov 2026 15:22:44 -0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com, Frank.li@oss.nxp.com, linux-i3c@lists.infradead.org,
 linux-usb@vger.kernel.org
From: "Pathak, Asutosh" <asutosh.pathak@linux.intel.com>
Subject: [RFC] i3c: USB-I3C (class 0x3C) master + userspace access - which way
 do you want it?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alexandre,

Before I send a real series I want to settle one design question, because the
answer decides whether half of this is even worth submitting.

We have an out-of-tree driver for the USB-I3C device class (USB class 0x3C) - a
USB device that bridges the host to an I3C bus. It's two modules:

 - a controller driver: USB class driver that also calls i3c_master_register()
   and implements the usual master ops (do_daa, send_ccc_cmd, priv xfers, IBI).
   It's a normal I3C master that just happens to talk over USB. I think this
   belongs in drivers/i3c/master/ and goes upstream the usual way.

 - a target driver: binds the I3C devices behind it and hands a char dev +
   ioctls to userspace (OpenIPC and similar tools) so they can drive the bus.

The whole reason this hardware exists is userspace-driven I3C from a host PC.
But as far as I can tell the I3C subsystem has no userspace interface at all -
no i3c-dev, no uapi header - so anything we add there is new ABI you'd have to
live with. Hence the RFC instead of a patch bomb.

So, which of these do you want?

 a) nothing in userspace upstream - we only send the master, keep the ioctls
    out of tree.
 b) a generic i3c-dev (like i2c-dev), proper include/uapi/linux/i3c-dev.h,
    usable by any master. Happy to do it, but I'm not going to design that ABI
    without you on board.
 c) what we already have: the controller stays a pure master with no userspace
    ABI, and the target side is a normal I3C device driver (drivers/i3c/device.c)
    where each bound target exposes its own char dev + ioctl and reaches the bus
    through the standard priv-xfer path. It's the least churn for us and matches
    our architecture doc - so if you're fine with a per-target ioctl node living
    inside the USB-I3C driver (not a generic subsystem ABI), we'll run with it.

I'll build whichever one you pick.

Rough plan either way: master in drivers/i3c/master/ first (useful on its own,
no userspace ABI), then the userspace piece separately, then docs + MAINTAINERS.

Mainly I'd like your call on (a)/(b)/(c), and confirmation that a USB-transport
master is OK in drivers/i3c/master/. For what it's worth (c) is our preference,
since it's already working and keeps the ABI contained. Would rather get this
right now than argue about it at v3.

Thanks,
Asutosh
