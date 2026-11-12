Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794526525;
	b=BRtczdytjqYfEO1FVGi9a/uguw6lMH25g1freGe5Lm0W7v+Uz3swRoqPE3J9OWiZKj1P
	 Gzet9Hkt6oafFql6OCXpcJDWxduMvKFSjJk7XLDTa5d7CGfC3JxueffsF8Djjaa6ac9Xx
	 Z3fQnFJgfYAxHxwJN0VHOSEz+oIC+BiD/7BtDd8F6rh+Ciuhy7IhFH3AEZ+ALLg5igFgE
	 /vMjs1EF6/yuDcAfrkoJNoxvb+1zINGl/Z8REzZHX9SVLQO93KCs85lW8CRkwggKB9fWR
	 wH4j1CPJ4UR4WmCE6sxyVAZdVgtsU6AguATmxhUO3weOPVRczBrdp8aiWwtTRozglUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794526525;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=VXZSMq9bS+pv1r23/W5YZTxBrtghVTtZRlA85g7hY0A=;
	b=14E9p8KByofbfMlKRhMNhs3TqHCpHS2Jrl1RXdJTuOx111DcrvDQPcoueQbYAieXIIJB
	 sMBzdL5GguXHzWLX4QHeTXfb1qd29U1XoXiXJb1FdKqzXKcu46xxE9vcuq9IJYQqZjg3U
	 PAqRMSMtCw3HaE1bE7yLiQsAChxfwE7DN/slxCeBZG8z4ZE/MHtYInXyDCDSifJXJpAUH
	 fYjleseWXMp8sQdZYAqox6L/mKs559Ldcn+zoQLAJYW38lYFy3DHXGDVpCgQZVYHLohUA
	 tteb8rEd7nnszYzAYgQCMEzUyyzCHaJMyWwEh7icEjNKORZdBIJbncnGibA3e5jC9Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WAqvoOxH;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBDA606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 23:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EBDA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WAqvoOxH
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C406A1A1639;
	Thu, 12 Nov 2026 23:35:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 910F2601AD;
	Thu, 12 Nov 2026 23:35:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC67011BC138E;
	Fri, 13 Nov 2026 00:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794526517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=VXZSMq9bS+pv1r23/W5YZTxBrtghVTtZRlA85g7hY0A=;
	b=WAqvoOxH6uPg5TMia1mxs+Fnv6flJYlFSJ0zdTdafZ3tkxLdMgAWulcXPLKEaXQ5eh4OWe
	iT64iWd6CjqhHKKWTX18tQKVKws+JtCig4gwZ5mV/HvqG64ER7x5EGMjbmCdppY8TVzhzt
	H6PDjLrfek3i4AnFfOeBkjQH6s21ZqcDrSuxX/Y7bPCY/eeO1Rkj37nvDBCcTkjk3CJH87
	gEix9EfZvefjo2XEmKxYaOOF7Vd5PVMmgoduchUv651ItfwITitDoCed7NOtU9lrP0xhaK
	Pah42EaFaanWo6bsEi2YnHlk7IlVbtzB+ZWPjZgCwtyj6W+LxKNs1UB3Dgcnlw==
Date: Fri, 13 Nov 2026 00:35:13 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Pathak, Asutosh" <asutosh.pathak@linux.intel.com>
Cc: Frank.Li@nxp.com, Frank.li@oss.nxp.com, linux-i3c@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [RFC] i3c: USB-I3C (class 0x3C) master + userspace access -
 which way do you want it?
Message-ID: <202611122335131c454ddf@mail.local>
References: <087d879a-e8fd-402f-b8d2-2531244ff69f@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <087d879a-e8fd-402f-b8d2-2531244ff69f@linux.intel.com>
X-Last-TLS-Session-Version: TLSv1.3

On 12/11/2026 15:22:44-0800, Pathak, Asutosh wrote:
> Hi Alexandre,
> 
> Before I send a real series I want to settle one design question, because the
> answer decides whether half of this is even worth submitting.
> 
> We have an out-of-tree driver for the USB-I3C device class (USB class 0x3C) - a
> USB device that bridges the host to an I3C bus. It's two modules:
> 
>  - a controller driver: USB class driver that also calls i3c_master_register()
>    and implements the usual master ops (do_daa, send_ccc_cmd, priv xfers, IBI).
>    It's a normal I3C master that just happens to talk over USB. I think this
>    belongs in drivers/i3c/master/ and goes upstream the usual way.
> 
>  - a target driver: binds the I3C devices behind it and hands a char dev +
>    ioctls to userspace (OpenIPC and similar tools) so they can drive the bus.
> 
> The whole reason this hardware exists is userspace-driven I3C from a host PC.
> But as far as I can tell the I3C subsystem has no userspace interface at all -
> no i3c-dev, no uapi header - so anything we add there is new ABI you'd have to
> live with. Hence the RFC instead of a patch bomb.
> 
> So, which of these do you want?
> 
>  a) nothing in userspace upstream - we only send the master, keep the ioctls
>     out of tree.
>  b) a generic i3c-dev (like i2c-dev), proper include/uapi/linux/i3c-dev.h,
>     usable by any master. Happy to do it, but I'm not going to design that ABI
>     without you on board.
>  c) what we already have: the controller stays a pure master with no userspace
>     ABI, and the target side is a normal I3C device driver (drivers/i3c/device.c)
>     where each bound target exposes its own char dev + ioctl and reaches the bus
>     through the standard priv-xfer path. It's the least churn for us and matches
>     our architecture doc - so if you're fine with a per-target ioctl node living
>     inside the USB-I3C driver (not a generic subsystem ABI), we'll run with it.
> 
> I'll build whichever one you pick.
> 
> Rough plan either way: master in drivers/i3c/master/ first (useful on its own,
> no userspace ABI), then the userspace piece separately, then docs + MAINTAINERS.
> 
> Mainly I'd like your call on (a)/(b)/(c), and confirmation that a USB-transport
> master is OK in drivers/i3c/master/. For what it's worth (c) is our preference,
> since it's already working and keeps the ABI contained. Would rather get this
> right now than argue about it at v3.
> 

USB-transport master is not an issue and you can submit it. For the
i3c-dev related question, you should probably have a look at the current
threads so you can add your use case:

https://lore.kernel.org/linux-i3c/ati3c2JBNLGRnPen@ashevche-desk.local/T/#mb42d9b2785f8508d39eaf782b3d29189226b8029

https://lore.kernel.org/linux-i3c/20260911210935.1353126-1-meaganlloyd@linux.microsoft.com/

Regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
