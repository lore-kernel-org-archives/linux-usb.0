Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43579308F0A
	for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 23:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785107419; cv=none; b=olIFW8PS1w3OJFpwEB+tU07K1nJHl212bXcThSczXrGU86k9EpL2fgA7XjVTs7R4VUvEqV79QaRVGifAytcHj1it/Zxn7WP58lDEouyrYWoOoC/ioDdf497af75S+91c/4vlMbiV3gTkZvaMCAlNxL0U4FyKDwyI4HahXDJINn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785107419; c=relaxed/simple;
	bh=DMXJSZuEtg4ACzbAivFZkDIQ2gjCzhCHfj1Jmgibd1g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrMGbX+lB4k6bFlGlJ4PUneZJ4tXu6WjeV/zKGGk2H04WxVuqel8CZididjtLDLuowZZyvIpQYz2i1wFQn/jmEGroYZH7A+kWPH5ktUp2XfGZnK8l9einz9PrNrgd1GUb+NgiW1z75iAwo6J7khgaWfX6r3XI6SGIcBw4/MTUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQfjxDoT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQfjxDoT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47de008b020so1137167f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2026 16:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785107416; x=1785712216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I37yr4/rL+j7sQmn04aj7wUtdawO+uvL23O1JK0xkSc=;
        b=SQfjxDoTrotEA8VDS9ByyyzsKahkKiqiGWBWzgERUswKT3wWWCZUxSsFq2FKH8O1eW
         J7ai4vKkJynGyEqOtf2wn/O9A8C49oU2t9J6SHlr9eUIegBgfMcqOA6ji953nIikvLYX
         tgIZcYKPOmJ3b/H5Z9w4WhMNWrGakb+hqXx0ncsbAf1ZoD+9jAQWoIlgFMQ8xjUqXfwv
         CPYnWsIa4GF3IF7oRJAVIKrvqBDlcxQVSsHuRPP5D0kJN9RVBiemVInJ6JjAWz5l9uQp
         6aY4cBYc2CpXzhWTzv0tsCBNdygPOHbVOcl8UjCb0symygPPKTA30quCX8CGfJKOsvlb
         Of9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785107416; x=1785712216;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I37yr4/rL+j7sQmn04aj7wUtdawO+uvL23O1JK0xkSc=;
        b=Ss889YRqWSt2BdFHp6RlZHOVLOGbDqtckH9MIyz3R4VB5C11qPvb42NpnO0ST6YAlA
         Rp09LopEv5pRUZp22IFBcw/LTdbArO22IYHFGdwyW3/Rpsrh3+jRTAVNP9M8D1AEeKrL
         KBILANFXog2d+v5S9AhhD8Jw6SYgGOrjK4P+QEB8Yetuc7gfFSM43ejCObfUP3vDF56F
         D1Kw7UbS9+4oQZjbND++BpsG3wlOOhblvCTqTRXNm/F8uo/AwdHJ3fL/WelWCnEhyEXl
         UIe5bE23+Qw/Gw77lP9jIFd63DMs8sH7NRhl1fnPwA/UnFN4wl1Bff33KbB9qBUC8jUN
         PKgg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6+lxIgCTERsRW8RBVpV3/n5o2UaastzO0xZjOCRFVpbizHZO0cxkp4ZDEhk3wjpOR+xLqiasybP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhai7KtF8n1I1bDW3r8OY3ad8XZo9FNGY6gSgHj16ObFlBdlMN
	AylvsobNJCY/0eGbHwq+HH2X5piF9TBkjmiBYaaoTkrQR7EiVGCXuYhFatN9Mw==
X-Gm-Gg: AR+sD13AZuRKLLt0HUdZzRgqgWY0jfFQOv3wTSaW5p3HYzskYmnMaHT3aAsYb4qjC0q
	et7wHcWMjs0QyC4zHb5uZX5yzkBQFIJmPBnyBn6lZ9Vid02nuHqFrH1rcy2pyGNHGa6Lm0FSLyU
	yfD7hmT4Afvtp8n0zd4u7WViV4zjGF8grRGms/W2Gi5GxLBE/qw0u+nCaDRHUO7F+aH88PkDPus
	kMaDXLtezc2aQwp5h0d+tiPsRU5KxfmpyMGlLef9SqMYFM+l+ECJy7ay7RZQQuE9AeroRMuVFSo
	4cnPTx9kt4JhcvEFcsihOC/aSuzfGS43rwS5Fma4ciZ+K4Rc1JSJWO2l/RDVH6D6RkZKvuocL2x
	v24Clr4DaFFmaSqD9CQkXoXfbD0RNeZULMZITIWQWxwQqZziShilHKHz39K53FwmO71VwvQXHw9
	eg1Y6rOjLP97qY9rgKmcam7g==
X-Received: by 2002:a05:6000:2407:b0:47f:97f7:87dd with SMTP id ffacd0b85a97d-47f9fec2fc3mr8085749f8f.25.1785107416423;
        Sun, 26 Jul 2026 16:10:16 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm45297675f8f.35.2026.07.26.16.10.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 26 Jul 2026 16:10:16 -0700 (PDT)
Date: Mon, 27 Jul 2026 01:14:02 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
 <stern@rowland.harvard.edu>
Subject: Re: [PATCH v5 0/3] driver core: add enumeration failure uevent
 helper
Message-ID: <20260727011402.4b7df490.michal.pecio@gmail.com>
In-Reply-To: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
References: <20260715114028.3627807-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 11:40:25 +0000, Akshay Gujar wrote:
> Hotpluggable buses can detect that a device is physically present, but
> enumeration may still fail early due to protocol-level errors. Today,
> such failures are only reported via kernel log messages, with no
> structured userspace notification.
>  
> This series introduces a small, generic helper in the driver core that
> emits a KOBJ_CHANGE uevent when enumeration fails, and wires it into
> the USB hub enumeration failure path as an initial user.
>  
> The USB change is intentionally minimal and serves as an initial user
> of the generic helper. Other subsystems may use the helper
> independently if needed.

FWIW, the alternative OS from Redmond has a completely different
solution, at least for USB: the device is registered normally and
remains tracked for as long as it is connected, but it's flagged
as not working and cannot be used. You may connect a bare resistor
between VBUS and D+ or D-, and it will show up in Device Manager.

Whether that's better is debatable. I'm sure it would take a few
panics to find all the places that assume certain descriptors or
operations to always be available on every device.

OTOH, devices which fail "late" could store whatever information
had been gathered up to that point. Recently there were a few cases
of devices failing enumeration for various reasons and people had
to use debug patches to even find their VID/PID to apply quirks.
(A patch is now in progress to at least log these IDs earlier).

Regards,
Michal
