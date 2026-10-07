Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E773BC696
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400669; cv=none; b=HiMyfvxGdm3TCkaQZBe94tHhZ+C1M/gKBwWaUdr1WgKjSr/LmCZP/ypVM7g7v5q7AX23NNXaEVuFaO3P5XSeqXQ2Qagqq+Ko/3babNdvk2LqlVpQL1hIFae5swEFzbiKByWtGXbKK5kfH1790wi67fc6T/S6wiA2ZRaVUo9NWNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400669; c=relaxed/simple;
	bh=QNHqERiJA6h7t45r+pE5d1xtdTk7ObwjjgXwFfcr2HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lVryuH/Q1S7Z8ymtx4pUOdVPODOSVXnmZiJKi0jS/9AthlFGwKf3pXJR47Kjsp3cySYYAPv6cLRtm00J+XwGOXzCQXVcuGnsuoZK6TMy6NzJqufDsiWjj0u+MdTYf8JWmE1n2T0Bkr0WIrC7sYkK7d6WmcRYTQDgOL15kRhyfJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=C3xRf301; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="C3xRf301"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9178aabd30dso22303206d6.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 12:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791400666; x=1792005466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3vx4KWtJbCQ7YluYTEPnOzhsNsEprOEZ5m0BGDaJh/s=;
        b=C3xRf301V0u1xA+oPF0lM7sCiZyRXHQ1d6fsMLT8ZrZ8/6IRldTOW9A4bqZWHw5MG/
         1tLGDDK1PhsN8fIr3K0XiN4pVJ8Gx6GswvBloQlZThGglrPXIbA/6LLUah+7v5DC28/Y
         n59JJ6WVH8x2U0vl2E9CULQBK9AD8db92FMXPg0n5CNnTIGhATGnocKU2AI2ez34RTsA
         7hkcADZf6k2Fw5obieFT+5CVumMNSRu6Opa0JvFIqo5AEJvGylQRBAaynYaApEMx1DKL
         9pGNleMgC2iU7FQCmf8h0210LefbUDNvPJ52ceL+x9Wp5ShgFJayOdQyqtNCxnRHCl9F
         D/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400666; x=1792005466;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vx4KWtJbCQ7YluYTEPnOzhsNsEprOEZ5m0BGDaJh/s=;
        b=Jf/MhKHNtJJuxTrgMM3aV+PnNER7AjmsMT1NJ5FRwyt9jZCaOLNDrF9t7vUUMAevYf
         7Xf/aalnn1OyG3yI64ZS9+PWrtrFFKJdbXJtnzM4xcs9HIof5hZHrb2Hu8CxT25WKyT2
         i0eYXYYq43WTKX4Y+eQkYD2n6F4oohFfvrnUd/lbSWdzGiBbq4uNTnys/x83DS7NrboV
         +8l3IAbpye0N+zqQbvjd9sbUOzsFHgDot0dXelyCjfr55h9X+JSq8ys+nCKFKM8E75Wl
         slS0LH2EzJlKaiSt6MeD0YdLKrGFfCmRuEet3X7N5ka1GsILxi6uKw25Hj3BIXdz/vF4
         BnQA==
X-Gm-Message-State: AFuF++nm1roT6RvVWD8h6ynvwrcBddpZFk1ahWZ0ZwqaDwNwMw0nHTPF
	e5wILNyJYMPl5mtmMU+9aPdx2QEIDitRzg2ikHqcrH1x+hynKqqhwkJQ1y6x+8YHBA==
X-Gm-Gg: AYBFou1ZGYWUNL0ApK20HsVohmmKmG2zGx044xmeAJeXmxzwis/nZNPPv1No9dTUh65
	CJP+gin7c0TtcirSufStf0DjPG+6CL/WGzqW5vfs1EVQhJXvkuOg+z/eytieNiE//AyhqLNz4WH
	Hq1TsJcxOgEU56VrqlGwXS8fP9Rc2aeMzstQz5bIrM5Paxus1y3slcc5S4ueT+5fiJJAtnEtIH3
	dFLc1rMW8fi2ryj15YTW3J6J5hUNyb/OBAYgaNGMSsAzi9lumuga2wpohlOOzF5dQ0+hE5L4Upf
	/tM7Ta1HnpOFHzNVf8Shn0Z65MhIJTJPlt3iE2ygj+a267eerMFTIfXghfNrVOUKhcmqQbCvO5U
	jzTgx5J2YJtKW+z2ef82n/cK0ZhG3ryIxuV8/zT7gh5Z15QOD00L9pqd0EZX3WALJ76uePoVXRP
	NJFhTYMkaVBjS88mdoW3fRYlkn2qqhCt5LTxo59qRsL1uKp9raym+D1VHAyEWUng/WHeDJSPB9a
	wA+RGbrmWf8UVhP6wsHMIvo6C4ey0P70s2b11r1sQ==
X-Received: by 2002:a05:6214:c47:b0:917:8d82:ad9c with SMTP id 6a1803df08f44-9199782ae73mr57573006d6.24.1791400665453;
        Wed, 07 Oct 2026 12:17:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996cb5517sm27824146d6.15.2026.10.07.12.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:17:44 -0700 (PDT)
Date: Wed, 7 Oct 2026 15:17:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Giuseppe Piscitelli <ooonea@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: [RFC PATCH v2] USB: core: emit a device-level modalias
Message-ID: <f1fc602f-0ee8-4e95-b764-ca34280eaa80@rowland.harvard.edu>
References: <afcecb34-0024-460f-bc21-a7f2b1754d23@rowland.harvard.edu>
 <20261007191130.8652-1-ooonea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007191130.8652-1-ooonea@gmail.com>

On Wed, Oct 07, 2026 at 09:11:30PM +0200, Giuseppe Piscitelli wrote:
> On the first insertion of an iPhone (05ac:12a8) after boot, an already
> running usbmuxd can select USB configuration 4 before the charging driver
> apple-mfi-fastcharge loads. usbmuxd is a userspace daemon that uses libusb
> to communicate with Apple devices; apple-mfi-fastcharge is a USB device
> driver that enables their higher charging current.
> 
> USB device uevents have no MODALIAS. The charging module instead loads
> from an interface uevent. Its registration reprobes the device, unbinds
> the generic driver and calls usb_set_configuration(udev, -1), tearing down
> the interfaces and interrupting usbmuxd's transfers.
> 
> Emit a modalias in the USB device uevent, using wildcards for interface
> fields because no particular interface is described by this event. This
> allows udev's kmod builtin to load matching device drivers while handling
> the device add event, before broadcasting that event to libudev listeners.
> libusb's udev hotplug backend listens for this broadcast, so usbmuxd sees
> the arrival after the charging module has finished loading and reprobed
> the device, rather than before a later interface event loads it.
> 
> A slow udev worker delays both module loading and the broadcast; it does
> not reverse this ordering. This addresses hotplug through the udev
> backend, not clients reading raw kernel events or scanning devices before
> udev has finished, and does not synchronize later manual module loading.
> 
> Signed-off-by: Giuseppe Piscitelli <ooonea@gmail.com>
> Assisted-by: OpenAI Codex
> ---
> v2:
> - Explain the iPhone, charging driver and usbmuxd interaction.
> - Describe synchronous module loading before the libudev broadcast,
>   including the ordering when udev runs slowly and its scope limits.
> - No code changes.

Much better, thank you.

Alan Stern
