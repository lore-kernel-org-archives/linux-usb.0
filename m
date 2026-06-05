Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7D44ADDBC
	for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2026 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650011; cv=none; b=CxvrJVChh8TJ//NJNfrAZpF55J9Bizr6J6/iLMzl6FbjHpWS2MoI4i2T9QVno9yvdLt8E5S37E3RSbECY2dIZyB4Qzae5VT/OKNEyJDM7cPtWyoJq7+KvWhebGELBvK6yNXDjvodG5Nj8NHluLG/x04dsTRUQCh5RNHGPdCZvW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650011; c=relaxed/simple;
	bh=SlnRvEHZdTAVUgRbO1O5HB6p/gVWWts1KMn78O2XXwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mANFSsyWjh8mUkACD5WiPEQnDo4s30lJOW2+otj/Y7ZEa8fT0ebGswCT5X8TyCP0zHE7ygIlB9RViOt2HmQxaxK1y8QAMGwqghLI4tLjuWPmE9cnrSMpKXPd0u4BCMah13cBqjF08qr5Dc8AZaLlqBqvgNwOb8xCblDfg8WrZEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWSZ8yTk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWSZ8yTk"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b9318997so12048655e9.2
        for <linux-usb@vger.kernel.org>; Fri, 05 Jun 2026 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780650008; x=1781254808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvYMkemOQwz5yP3RpqOFqAyogviiWEUYAJqUf/vwsyI=;
        b=nWSZ8yTkSNZ+yuFfZ40jIQsgdFS4cmLhAEfu26J5CszS6qAtZ4VzCQRCx90OVHHLKo
         jPwPX6uG89Gw6NqmzonwBteqBPzUB6toApqs1lOeJgR7RUieF1uinXU60txgx5hTgh34
         f+KFgwa3bCgFOPDbP+IFfMC6JhIHEGvP8C027I4CV1+kTsXEVSouliHIeSoRGqyaQWhT
         9tULV12Yqqywu9pBzYtQNiWMpUOUkYeXlaENT+xHwV84NZ5gW95uV8LbpJMHwBr6YsdE
         k9lA11D7bEO/J8zofWlNOmKgfA+RZtWVUUMm9YbTtxiH5pOvZdtbzFwFmJgJDKH4bGBh
         Y6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780650008; x=1781254808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LvYMkemOQwz5yP3RpqOFqAyogviiWEUYAJqUf/vwsyI=;
        b=HejaZX7fEiiw44FbT/1oCLXyN+DSjrC//vYQ01SWeOepM8rnbE+WiqSQa062/HpU4P
         taoHcgBZUsTgBz/RnD+D4Uwa9fRA/YLWQ6DfXpk6s/7q5fF4NNVi8BiY+BLuqNGYEZGU
         g4SXQ2kqsgRzkZ/hlsZ2uRtfrQYNKkqmafz8lCuYl87kbwNux6IdAPJgscA1q9GQ2jn4
         yoGubHjxA64Y+W+EpTP8S9TuB3cnYWhMIAMX8oXVAp9PCVwISEmkB1WJ4iMMUNYfKzRC
         o3C6es9tg66p+jyyoosKrKZT1BTYCQ0ih2yhkQkSAU8b00awJMd17kx+5H4zcxJ0S48z
         iAkA==
X-Forwarded-Encrypted: i=1; AFNElJ94UFbIvvuvv8kDdfm1H+MoZQaR47caSmxyjKyBp6J2lPc0ZJsWfZXTR4YAQRwdThfwqOzQyQ4oKs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLvQVYXmKV0ec+b0JRWHQUn9hggLR/CWsMVbVt9TLnOqoGoRVr
	gI/+uxAk6pebulVv6OKdIUqUP9nRleVrTaCzRRIamyLKfPoxRq8xU4GqCZbvcmoZ
X-Gm-Gg: Acq92OFOVnY1IGcyYyyrj6rexs4BpgJz3jwqaHK/GHLI0ZVIK2tGIl9Q5rgL0tewTe4
	cha9GE0ja7D0iWsOeWKkxda2L6cMd4tFFQapJB5P2Cu8PwXT66dyFzdkTwROzQ8FYwveXrE1nBE
	uNzYwvbKaen/R4nnaxIACd5FtLoTW4IQKjZ4MyXA7FCbcMiJvmEzJGCVahv+CEUJB4P0o6pFi0x
	UkXdp1FpHQpWNRdgbYyGdt+ss5KxuBuXdI7SixPuP08jWXnoZlnMNvm1WspGyj8Y9rQNgY3RVfO
	v3O1P4v2Z8wYHmLe+Y3mxXOHAo/h/z14VY9HWPpNKt46T6b7vVxkA+BAmu/xTmRrAmZb9i0jW8W
	icYCLkDtj+QraToYmc7GHyABDdRnSVNonvjOAr46/fjh79RpS2vjxrdAD2a3CGmd8D9K9SeqCXs
	EPPqzjvwQ3cjRYjZNzxIyTJpEfbEt9k3z1B3rHm1SAqp5dZQ==
X-Received: by 2002:a05:600c:46d2:b0:490:b645:3213 with SMTP id 5b1f17b1804b1-490c25f17ecmr38280535e9.19.1780650007075;
        Fri, 05 Jun 2026 02:00:07 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm130344315e9.5.2026.06.05.02.00.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 05 Jun 2026 02:00:06 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:00:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Orlando Ulises Aguilar Rojas <orlandoulisesit@gmail.com>,
 linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
 benjamin.tissoires@redhat.com
Subject: Re: [REGRESSION] Sino Wealth 258a:002a keyboard enters stuck shift
 state on USB disconnect
Message-ID: <20260605110003.435619d2.michal.pecio@gmail.com>
In-Reply-To: <aiJvV_DEOOFcqTtZ@beelink>
References: <CAE=pYEp=RZCeRbAtweZ0_zkPr7cUZUu=uoDRkqko7xduVUMEKA@mail.gmail.com>
	<aiJvV_DEOOFcqTtZ@beelink>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 5 Jun 2026 09:03:42 +0200, Benjamin Tissoires wrote:
> > Trigger captured via udevadm monitor: when a separate Realtek
> > wireless mouse receiver fires unbind -> remove on the USB bus, the
> > Sino Wealth spurious mouse interface reacts to the hub topology
> > change, emits a short report, and the zero-fill behavior causes the
> > keyboard to output "!@#!@#" (Shift held).  
> 
> That is seriously wrong. It's not uncommon for keyboards to expose a
> mouse node when the support "macros" that you can configure in their
> firmware. That allows them to send button events, or even control the
> mouse.
> 
> That being said, if your keyboard reacts to USB events from other
> devices, then there is something seriously wrong in the firmware.
> 
> In any cases, the fix is not to revert the restored behavior, but to
> fix your bogus device.

It's practically impossible for a USB device to respond to disconnection
of another device, but I recall reports of disconnections apparently
causing corruption of other ongoing transactions. These should complete
with -EPIPE, -EPROTO or similar status then. Possibly the kernel or the
device doesn't handle things rigth.

Perhaps a packet trace from usbmon or Wireshark would help understand
what's going on.

> > Physically unplugging and replugging the
> > keyboard does not clear this state; a system reboot is required to
> > restore normal functionality.

When I disconnect a keyboard while holding the SHIFT key, it turns off.
Is there more to this bug than just failing to ignore bogus reports? 

Regards,
Michal
