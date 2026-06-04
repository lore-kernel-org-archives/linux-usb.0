Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7C3D9045
	for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2026 06:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555904; cv=none; b=Zsj9vhfG2NLOBxh8i7qVa3wUJgskzVTOtmgBmUore/Vt4abMMm+d0TOuNyEUy6Hk/1Io/eHFCgqrWNGix4xhuNpx2SgZrrVsnVdxn3cmVS8kZfB2QjasJBm02OJXNjvTHWDxZF4Tv20WJYCJGIotDnUAa7L22xO/Lsqah/LuCtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555904; c=relaxed/simple;
	bh=QPh7pXnQWAgvBseCTT3sjqUAdqx7C5ZI3IxDiLz3cjg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sgr1uLmkPUqXlBGZYiaaGXXP2jMtJf81o4D8npR9l9KtFTI5WmByuAWcYgqONVvIYcyXosUSmUGdp6k54cLA3zlPLy7ZD44BYWXpo23rOBceR5al+G4sJVLCex+IWzyGM6GrQ0jJ4UVxG0ENSUNUlRQyCZbblIDG4NRqwS/xF1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxqLIn7Q; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxqLIn7Q"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b9318997so2133915e9.2
        for <linux-usb@vger.kernel.org>; Wed, 03 Jun 2026 23:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780555901; x=1781160701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsA0E2zRhI7EC9Ntl7Pf6hMb9UBTbaRJjBOLy9s7eyI=;
        b=SxqLIn7QY1cnFh7YWtCceRefAgMjU92rk/x0zLTJG7/Gyn8lWg/isG0f+9Y9j41uJE
         C6nRt12Md3MI5aSlZP9Kehm0lt1i0cglMSFCIDinoI/n3hRL7Frm4YKZqHdEJSVRMb63
         dH0gFPBgwb5iTuNWM54lzooKyelCWu4PnWDzaxPWOK8uns0T6Mah+f6Obw4SaL6xwPYu
         l1l2GgYfISILDM2Ihi69hTT+kQV/Wq1IvYH6YqKZxhZRa5mvfab9n9pHnRK2V2FgfTVV
         PE21kX8V0a8selErhmz2Ky+VCSK1Jpj7ffkXxx8BBVfk3Kl85+rSCA+SA1HBAu4TwiXo
         /MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555901; x=1781160701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dsA0E2zRhI7EC9Ntl7Pf6hMb9UBTbaRJjBOLy9s7eyI=;
        b=KViqefYBpGyNGDPT7cXP4OcPxXZBZ6y93S9D48VWSQ7w0fk6SJHRJvZbKWuGg17K9X
         pQkyOkWPBi8xgvaNRNT9A1Wdgd9dwTLzbvdr1yDFaeaJzKYnJgYk8A6ojmMmH4ZjBayN
         TpMk/Dwf4OFyDTLmnHNeWIrXiC6t4+yI5184wkFGwKczgJbMVeeWS6WzbcAF5Q6iCFjh
         HxmTmKTKwDrpOAVM9OzYzbfj7zDR+CKIIac66C82zXnKnENYLUiW0GDcbhrx/JAduUpi
         PWUt0JhIBzqG+PHQxKGbmhW+96CIXiSUjMX4wJFZCrzcl+t3eWkHYaOVg9OK5nt1tDks
         WYYw==
X-Forwarded-Encrypted: i=1; AFNElJ8g/XnikN1yF/MkYiOd4FFoCqi6ud9cOVApkJcxxxnN4PztlKpPeP/3bkxrlcPYEU4qs6IdTmWgg9w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28OUQIQhlsWrWqHJmZGrP6c4ytxsKAixqxcNXlSOD7y0QTm9u
	Tym1Wiv2roumR1BXDFEA3BTwfq1rR2kn/PQk1GD1RuU6AkFsjv+P/SGc
X-Gm-Gg: Acq92OETsJbscx6jreRSnmkZAMM7OsdKuaJGif5JXSCrvNy3OwV9S/q4sa/5ePX5KiY
	gP7up52wWujPVMyqYgvob/UDUOPvFt0qEWTWE/ctLRaDkYTV5xGvx6DrULJW9fqI1v60ZCLoPvw
	K//gQqaLWloFIzq6+dqQSce5kUfWMUmdshvj9V6UL1zsomW+s2xE+rGOoB9jDVo8p1PGbQvJwON
	6rGWQ7atbN+qQD2V7KN+g7oeJqukjPwFTgG9sFqi+E0tYtvhPy7tVLPDp962som/hH8egGDTxMV
	0KZKi6xg11oJmPknWso+fQgWaEP+DTAzVrdgzXhiGtSUoH2PmZHdixc8D+B7TR++DrPmmRDBscU
	WS2bQdlfMi9zQYu//+ADZSfQVLxtTypByiXiMMr80YxGBIprBvMyf/Tk8bSuUZv/DVeFchYaGD7
	HJDqTinhWNXva4Ss6s7yb1KNnrL+IMKMLCBhObRqpa6tQ9oQ==
X-Received: by 2002:a05:600c:8b51:b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-490b5ebc449mr104510385e9.15.1780555901284;
        Wed, 03 Jun 2026 23:51:41 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7a7cb85sm133041495e9.1.2026.06.03.23.51.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jun 2026 23:51:40 -0700 (PDT)
Date: Thu, 4 Jun 2026 08:51:36 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: raoxu <raoxu@uniontech.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Zhang Cen
 <rollkingzzc@gmail.com>, Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH] usb: xhci: limit ports on the correct root hub
Message-ID: <20260604085136.6b20d2e8.michal.pecio@gmail.com>
In-Reply-To: <185F99CE35DA6675+20260604034818.2734932-1-raoxu@uniontech.com>
References: <185F99CE35DA6675+20260604034818.2734932-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  4 Jun 2026 11:48:18 +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> xhci_create_rhub_port_array() is used for both USB2 and USB3
> root hubs. The limit path always writes usb3_rhub.num_ports.
> 
> When the helper limits the USB2 root hub, this leaves the passed
> root hub unchanged and modifies the wrong root hub instead.
> 
> Limit the root hub passed to the helper so the cap is applied to
> the root hub currently being initialized.
> 
> Fixes: 9a7ad750a8fb ("usb: xhci: move roothub port limit validation")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Previous patch for the same bug, Cc its author and bad commit author.
https://lore.kernel.org/linux-usb/20260516033443.3646966-1-rollkingzzc@gmail.com/

I'm not sure how people keep discovering this issue - only by review
or are there really xHCI controllers with more than 31 USB 2.0 ports?
Should things be patched to support them properly?

Regards,
Michal
