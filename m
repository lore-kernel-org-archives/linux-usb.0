Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAA7361DBF
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 07:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433970; cv=none; b=CvYnZSdrQKkW0HFba3bxRMezoJwHiWSUBHOPSbWe1XnRp+3a1b8CP83juvsJJrk8+iNN4dT4RNvnV+xBpfTMcotgxkTINkXBMxBblkNZenr7C/lM6XU7bFgi5XxKy5CWuL3sc65epXkllCHo6M1VE2XEvVCLLQW3uGm+I4NJUdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433970; c=relaxed/simple;
	bh=LWowjDCZj7IYgSMYnjRbCqgADBUKWv7S06euZG2ccV4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M1zyrzo+i688MsOZFE+Agemxa6S3LRuYnH3btdzHmFVEA7THW3SXZSQs9kdSKp7riq2uMH4bnzvzaJTKF2zN7qqIVLTIZfINlMW+K5zxITel477SqZgu6XCfjR+eH47P7qId/wK4QOHRYywBftZls5EALMU2HKpp+3qbgxxVl0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGu5TVAg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGu5TVAg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4957eefd361so20421145e9.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 00:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786433967; x=1787038767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZDFTa35kL5rIQX8X6nqz+kqySNOyGNQCbwItGgo2efI=;
        b=bGu5TVAgBHwTVtOgLPda+xYbtj06q7QRQaZEI0by0KCKGr8o6I93Kz/wvVVEBRtTE1
         EFQxaaIJVVZ9/GPoampPX4Kg1ZRhan0gYl99RqhoOubKfeUAnUdUD1cgNWQ9Q4oa8Ozz
         /Gjx1LyAzuB6w0jkX5p+W4gItSepl20jWbT2YjnrSYYBeBwjIWwlqCZ0hky+MNFM+ci8
         L0GJT/Io8nGRGFvIt3Dalpegc2Hx14YWE6LPyh05wOe0TT7r4o5Nq6boyzmy42U6Wrsd
         /lOH8Yyp3/ThVBxrwTI58eN1ho0y5fXf1No6MDJ0EZLHdxj7XjokfxvV53iw+hSqGQ2q
         bNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433967; x=1787038767;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDFTa35kL5rIQX8X6nqz+kqySNOyGNQCbwItGgo2efI=;
        b=UkAGvRHtkI5eigO7T5ccThlIf2yCHbz6BnaHJZCPq/Vq5VWOGuISooeqaymyYGGkWj
         ylfMQaMiIiihz3TU+n7v19EoawxRTshy0RZM0q4Tk2BbMnYjCly3eyommpHtmRbAbBdV
         I9yLe3gDTLEcAIVV5y/X+YiJXbl/wEttJvEPoQJl1HUNfqs1aU0U9yFGZtP+WzAdGKHD
         lcBibwEF1JHOxASqWWvl/TuFuzWDWUg3jgp8SCgWDx32EVpjuFEm3CbAc39oF6NhCC/E
         nXO1LJZN5mkcvEZa9/cSuv0sO3t0/bqsp4fXoa3ctHTwIyAUkpMkuCa17xLK8ke+DFpg
         6QFA==
X-Forwarded-Encrypted: i=1; AHgh+RpEUVzmqt86aKjfP/Ht9wPjt3ajlSDuK3rGLsH0521NMMOH7+4x49cMqDomBanGNzrgUKkx25Zjn6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz179KzVTDbj7IHCpnKNwnVqZfjlZwC4u1a1hQ/YASmkqJ1vBEq
	EwUt2GJY7QljmimDXvxeNciVxv/sL7QtcGksRx9wTKHDoLvzcfMa0i4X2fGi1w==
X-Gm-Gg: AR+sD10xGzt3mzuKEcjiAPi1saaPWYf9F6tqHhny9c15PrT+nYIQLX4RT0o+rQn0AAD
	10eWlVyLewnWepyzo3ZwtSyVMLQSBG9z9B+30nE7buU3QjB3lTGggC6flCFXx6m+iHjerHu7WOD
	kCQx9q+dOMvxt1h12F9qWoXwygf8l5UH035yoObZ1QG/mGs/sMCI4xzL/1LqY0kEO/rWfNtXd20
	poVCFu0SRzy9IkPqPiDfuqCTyYdoHHl8w2KcuJDTU8bFMXC6Dz1oti0hL+IC4fHk9mR1OgRqBYv
	SER1fSygkDNrJ4P6oCNZmHrgseSUbFy866o+eoTC6ASHb6t17K8BZS3mEN/qU66voNzuX4blqWO
	doViQ9EbboH0+ZBk/UpjyGCBSIAkxS4R3SDLDTl4H5LjRn6MXbvxWjvk0Bvn7O3LFrkYe4gZJJW
	gUb5ZwIxR+V/6nmCL6w31exc2EiANJXqJmYXEUBLJn4DZk3M4QDJji+WARnQeEdL5Wl+zJ8Yhs
X-Received: by 2002:a05:600c:4f49:b0:499:4892:e84e with SMTP id 5b1f17b1804b1-49978468bcdmr23500315e9.11.1786433967065;
        Tue, 11 Aug 2026 00:39:27 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499788f11b8sm21631425e9.10.2026.08.11.00.39.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 11 Aug 2026 00:39:26 -0700 (PDT)
Date: Tue, 11 Aug 2026 09:39:19 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huang Wei
 <huangwei@kylinos.cn>, Craig Hesling <craig@hesling.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, leStoppe <lestoppe@gmail.com>, Florent
 <florentbr@gmail.com>
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid
 breaking VDS1022
Message-ID: <20260811093919.2e5b50d8.michal.pecio@gmail.com>
In-Reply-To: <2026081002-helium-geologic-bb5a@gregkh>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
	<2026081002-helium-geologic-bb5a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 13:43:33 +0200, Greg Kroah-Hartman wrote:
> On Mon, Aug 10, 2026 at 05:13:22PM +0800, Huang Wei wrote:
> > Commit 4cc01410e1c1 ("USB: serial: simple: add OWON HDS200 series
> > oscilloscope support") added a USB_DEVICE() match on VID:PID
> > 0x5345:0x1234. OWON uses this same VID:PID across multiple device
> > families (HDS, VDS, SDS, PDS), so the overly broad match causes the
> > owon driver to also bind to devices like the VDS1022, which
> > previously worked fine with the generic usbserial driver.

Did they really work with usbserial?

> Where is the "owon driver" located at?  Is it just a userspace program
> or a real kernel driver?

Looks like some people want to support these devices in userspace
with usb-serial-simple and others with libusb, and they are getting
in each other's way.

libusb: https://github.com/florentbr/OWON-VDS1022/issues/109
serial: https://github.com/linux4life798/owon-hds200-capture

Maybe let's ask those people what they think. Not sure how much they
overlap in their scope (heh), but it's possible that patches to remove
and re-add IDs will keep flowing if the kernel keeps applying them
but conflicting userspace tools don't sort it out.

Regards,
Michal
