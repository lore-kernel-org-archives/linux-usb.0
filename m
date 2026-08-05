Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5167E39DBE5
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 19:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956812; cv=none; b=p0mGEE9m2dN7WbjJnCY/Tw80kOG8tuAm7P0eyQPyz9+cyFEN7kQAvPGz2KnymmPa80RX0e53N+yYAcXtQO24G1o07IN4HXOkIghaiypiLDYt0MXADlArqnWf5ugzgCUsXiI9cCKD2Yqpwc2EPJ09Fcc2+YpMqgrETpn3G0WEXK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956812; c=relaxed/simple;
	bh=aw8VZaop+7eDmkpzrry1JkGX900SN1reNWqyG1/NTPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JqA/ij8o573In2T5TtNriqVG5gkkYwgEVn2lQwRRteFaGA4g1G1mFR2h3uP46Z3eo2uzbx3Klc73Q6BbiAaJMmyllq5Vnge2eZVodGzrufQc7pekh1KWXuxYkVsrCH3sNzVocTCAEw5A6vB9BW+n4jBW8cXIkU3ryYKpzD/WWd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=n/6ruHcu; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="n/6ruHcu"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1093127a12.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 12:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1785956811; x=1786561611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aw8VZaop+7eDmkpzrry1JkGX900SN1reNWqyG1/NTPg=;
        b=n/6ruHcuBD9VSpLo7CPpsz+ixG5By7mB/328r5UlqppBAQBWrvqABrJJGubNGs6i2P
         fdjHdqK2LrNNz4p16r+9W2vA9ThkJZSUxfjmq3zEdwj214e6C/RWmLuiF1B3xaO642bC
         xuRrY0RGggwYPop7aCx+JLpNahUkyOk865hXsvHkRnc3aPXDTtKPNQHeyMGGywr65wYj
         zwnH+1Qv+Qk3ICYNBHLDNo058GiUDopsNNfu/sFW4fmwO91A8b2GiHwgMSZRpx7eqYVG
         3CbhDDHmJhSahaokQRz43otzLG1qNjEDS57DECuZNoO4y/ER10D4fupE0rWMdcspx/Zc
         QY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956811; x=1786561611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aw8VZaop+7eDmkpzrry1JkGX900SN1reNWqyG1/NTPg=;
        b=m8VqiZ1Ysh9nPB1xK13qHHqGxpgIMXYJ95m255KpVefD2yIhW5nedcovmEMX9Ujipm
         2gXDWt1j5oYk3Z9yBo5wb4iGKhMgEgnRRcVTZXzk4gJWwka/qEwDjp+9QaMtHHZQMVDd
         FhbnAxfu+pNiV0XcZJNLiY0zcMWit7VGVItTtiFkxRAhQISjvOly6n2WXev9F88qO9Zr
         phbQdkVxV4duF8mWnJk/Rxlzkc7euu3VsJhh49BJhBs0JRw7bittUw1TpYRp9+SmKOks
         JsOGqTH4PFvjSYaeLhasoTTQwsUI+XBJgaW7zSAQpJpygu+4cNtw6k0P1sTNkyFTuBnh
         ifQw==
X-Forwarded-Encrypted: i=1; AHgh+RqVxZ/OP1I0eR80+KZcDsTyFPq+bRcNy/1zBIMIklYVyTdTA77Dd+F6ZRtsgCxajMMmNIAWAcVV9ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/GjCbU6uyBEjVuwN1EySzKsbBHH9aakcGF9nBg8Bo/2qwo0r
	iZTUIigtBb1osL5rQJyVENAVHWdp0RMW5EkHQudA2f76YDduzFGyecOeEqw0w11mx54=
X-Gm-Gg: AR+sD11Jlz4DdoTbDOhj56MPWYKKl748vgOatxuHwv6EmzsOtFeKO6cH+jtNOBVqOfd
	MtzISVrmG3CTsryCEYUX/QFMMJ6PezO+h9Ah4Y9hM5tK8DW6LKw866PmUFdxYihbQ9lG+Yr4ifM
	NqA/hz4wLMAt4FpCcz7Tak2i9nzYQ/gYsKpHHcaBMHKbybLJH6C/xHkK21rTk9Gu1OfWTK7C0Dl
	JSmSlgyKMKN+MEmbMhJ1tvCWflDxKFROmdy7GFBlclLcTlz0FrZSPYA/Kw6sl96jRF622wAhT/M
	NuPO8YKTMftCd1J1dQsjTId5t9a1GBfeV+U08GCvuQglGYye9n5cc2oAmoACJETPZE7RxtukiVf
	5g+uSveMcJn0WPExmsQsTlnC0LuQR+gYBD9rTmYKA6QxAtWp7/Q8SAxiaCMd0vkp+0Cq8XqmlKD
	88bxnBNniE0RzEZ4mQHFnub1DWOO/FX9aC1N1WPovDqMavyiLa4t3EBYVwPL5OtLlyT8y0fSOPS
	Hc6095Nda/s4J6lQsmCmmMWZDdSF8/m9PmzT/bP5q/WN0E=
X-Received: by 2002:a05:6a21:6b01:b0:3b2:924c:566e with SMTP id adf61e73a8af0-3cb860767eemr11388012637.36.1785956810574;
        Wed, 05 Aug 2026 12:06:50 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:6387:b412:85a5:8bb7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe708e7860sm2129613a12.22.2026.08.05.12.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:06:50 -0700 (PDT)
Date: Wed, 5 Aug 2026 12:06:48 -0700
From: Bart Nagel <bart@tremby.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] xhci: Sort out the TD skipping business
Message-ID: <anOIxkp6qT3Qu3A2@spiral>
Mail-Followup-To: Michal Pecio <michal.pecio@gmail.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804120110.01bda0e2.michal.pecio@gmail.com>

At 2026-08-04 12:01:10 +0200, Michal Pecio wrote:
...
> Additional testing of patch 1 in isolation would be appreciated from
> the reporter of the regression (Cc). That patch would go to v6.18.

That's me! I'm new here so please forgive me if I'm asking stupid
questions:

I found the patch applies cleanly to the linux-6.18.y branch in the
stable repo; am I in the right place?

And then am I looking for anything in particular in the logs while
running it, or do you simply want an observation on whether I can
reproduce the bug or not?

Thanks.
