Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719B3577E33
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 20:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985653; cv=none; b=rY/TvXomvMi8Ct1kpzQIbLZwQjR8qdcMWj+kzZY1oPo1WCz2GP1NMDUVEJQzMY9oGw1s8e/XoitJpkLHxEygEFsX+1ziBEjPSazYGkQCDcfzBGuG6Q7vQlI5Iy0qhgh7UbrY3EXVJdt4WzmYoMHmldW5wcGax+abUvRQ6oicJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985653; c=relaxed/simple;
	bh=QwhogU0EtLUZ6ngOGdOZVnFb3o8VkGZfi9CXG4Khs/c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RZCdMaClIqcYNXbZ5TE5xWEX3ng6BUsPJb9T4Uhe4KqG/kPednmNCI9Yh77b6Wn672hcQfIyykiSQl7Ul0y347QQCljUX5ZOP44y47tusXgiVEmjD2MWJrygjhFsTTi9Mf0umEFr/SPCXj0J0WX72Yg6p2ZkkUPUUSUV/8G8/J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/j00O8M; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/j00O8M"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso62111315e9.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 13:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985648; x=1789590448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2NRvs41+5uPFlOeoWPYyoihSNfHIDwMg8K54gWzgpRo=;
        b=Q/j00O8MYPiim6h9ESKjmpBRcrr9UWgDUIlo/sb4mo8bv/zek0bBWQAf7VmVZh19iN
         sSpxx/MDJBb/y0Tuh28DRdTtTqgvJLkLPlqwFLIBouCT79sDMsdJb75Y1xbhNvbA3s5O
         XRXdhKJs/iUNWtw1h3aT8G+XoxCWiZphaYxDiK2KwIY5LQn22fwnZoSseDE15JFpIlEq
         dp8igHbohlHSUhiuHhkBFI4fCkE9vb5OymFaDATCW1XrkPE8x/6M7cxqb3+MfvXdVZ9d
         H2vgNTgAeFnsAaZLjorjixrKLqpfAg6HYpudb0jEtdcrGpXKWELVY2WwdoXoxxHiezy/
         hLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985648; x=1789590448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2NRvs41+5uPFlOeoWPYyoihSNfHIDwMg8K54gWzgpRo=;
        b=LGj2g1uLoI7a9Ox7SBx07T7E6uDPmh5SA5dm0ekWQdMH8AiNvgWLSCwLVvb/AyF8hF
         rT2cCTgv0vrVjt8ViYzhJ+0Wm7EL6d5TXoOreUQlaV8gGt6rjxJ1MeBkalOkaMrmRAN6
         3RMWJET+jiIgHC24scKB7ShQ641VLyOJCDh/cFOHZKrOdALAFnPPVSvOrivjABgTeHcX
         l3TKb5+AOX9NkGVrE7HD/1U7BTUQHqkfMrprA2kHCNk1bL37tJl10QJ7cV1KUgLh1Bj4
         DLTbpIymNXLANmI9uUrpxJfior1/OBMKijcXw+JssSNb5MUmOrsRz/K9SX1EWAnEsCOa
         wN3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzdg3PT/HDag5ZJgU/qbXdw6XkcA3/xcP29xmtiN74ywWFBVvt5sWFGr5Gow7h3xGAVsxKsXlkvTsM=@vger.kernel.org
X-Gm-Message-State: AFuF++kqXNiccQ1lnW1gEDJ8Wgzs/uoW5pNk2RSJPMIpsR4aauF6rZyk
	Qgz7AgLoxL/rarLED+jI8Revci/OuwarO6iX51oPGQq9ab1kiSxnKaLk
X-Gm-Gg: AYBFou1aMxaGExuGQVotRp7nGirpCDq8GDkvEqWwp6S7IDk+kNguAtDsjL0tZTcu9U5
	HRpLhV0GLZLVq35c0+2fyXQfPA0RK4YrZpAvCXvMHVaXow6vt6MPU92ceObnf5RNc2ToEnY+0/q
	XgmVD1t9Cq+Uyb1fimM8+Gb3G16BpLICFdTUCL265V9AKcQ26A/Wrh46qOko6xNEKCCXabPRy0V
	RwKi9TteJGadZHGJJQYhI+H4nOo+Nd/MzHgxuwriapImsPPaKsTjW23LbbVQ74gCwMOC4rCwWbl
	G7xnY/9ajX/0tAaFkVuP0h8hX7LrfMheXLHqygUyk6WOvhNidPlFt3WfbMTWAISeO13IZ6SVVVq
	Yo5S+PsfJPdL1wRfkcBf2y4sFBSJv6j30pqyG5HVWH7GvywECodf7tn7G6S7HEhgWtOYD0GMnTL
	j0UbMmCrH80WvnSsRNkK82AequR79DT33h4TKatmLJyU/ueaBjl0BEOsjVRXi/4GMyb15KFSmol
	eN1F1y2
X-Received: by 2002:a05:600c:4e45:b0:49c:f504:2af5 with SMTP id 5b1f17b1804b1-49cf81dc3ecmr412646735e9.1.1788985647953;
        Wed, 09 Sep 2026 13:27:27 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm172698495e9.4.2026.09.09.13.27.27
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 09 Sep 2026 13:27:27 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:27:24 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Quinn Schive <quinnschive@hotmail.com>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] HID: logitech-hidpp: G502 LIGHTSPEED loses hi-res scroll
 state after S3 resume
Message-ID: <20260909222724.30fc8f52.michal.pecio@gmail.com>
In-Reply-To: <CY8PR14MB59809F95431FC6FFB0D0A56DA0B02@CY8PR14MB5980.namprd14.prod.outlook.com>
References: <CY8PR14MB59809F95431FC6FFB0D0A56DA0B02@CY8PR14MB5980.namprd14.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 09:58:28 -0600, Quinn Schive wrote: 
> After some S3 resumes, mouse wheel scrolling becomes approximately 8 
> times slower.
> 
> Turning the G502 off and back on immediately restores normal
> scrolling.
> 
> I captured the failure before power-cycling the mouse.
> 
> During the resume that triggered the problem, both PROM21 xHCI 
> controllers reported:
> 
> xhci-pci-prom21 0000:11:00.0: xHC error in resume, USBSTS 0x401, Reinit
> usb usb10: root hub lost power or was reset
> usb usb11: root hub lost power or was reset

Hi,

You could try if this problem is fixed by the following patch:
https://lore.kernel.org/linux-usb/178832755831.50581.1058201741431375556@gmail.com/

That being said,

> My interpretation, with the caveat that I am not familiar with the
> HID++ driver internals, is:
> 
> 1. Before suspend, the G502 is configured for high-resolution
> scrolling and hid-logitech-hidpp stores wheel_multiplier=8.
> 
> 2. During S3 resume, the PROM21 xHCI controller fails normal resume
> and is reinitialized.
> 
> 3. The LIGHTSPEED receiver gets a USB reset while USB persistence
> keeps the logical receiver/HID device present.
> 
> 4. The G502 appears to lose its high-resolution wheel reporting 
> configuration. In the affected state, one physical detent generates
> only one raw increment.
> 
> 5. hid-logitech-hidpp retains wheel_multiplier=8 and apparently does
> not re-run the necessary high-resolution configuration on this
> recovery path.

this still looks like missing functionality in the driver.
Needs to handle reset_resume() perhaps?

Regards,
Michal
