Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12F64CA776
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093294; cv=none; b=QEFlZf05IgLVhhYZv9tKKD6C/+/eYZ2lzrqm5/eh9rHAurs7Jzuhqn27WeSiTA4E3xxvyQbgVNLVFsWkBmTpb4+Sa8XW3nD0rC2CwmePPHqD5THFS+9vTX2s5DKotfYtelSWRVAUzGGjG1GL1k8uwv+5TfkSTVR5ixFeRvfsU2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093294; c=relaxed/simple;
	bh=bZQs56rDkIWlPjcycHP2pUZxtxjL9ufLKxmX4B1ppDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxgEcTHxS7RE4b8RuCMNJOOoC3EjQv1u04PHnpTA2Urj1XFxeLI3dfCcW31xRYBRkUjt7zAZJ7cXbbOYuYI26NVUxWhrq7uzr31kESOsGfbddeOIVnpuiOI14LbMKW5KB+Gd+UvHj+H2b/JhK88YOjKAMmmsYueYiM7LpvEIndI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sorqVEAJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sorqVEAJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49ff680331aso27846435e9.3
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 12:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792093291; x=1792698091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUm4qss7qtZF/f3JgD710pihw36IfWdD94haCCfcfwY=;
        b=sorqVEAJ7hf4HiY4znjc/6kUVuUVKISL6QqIJWXDzbdiRuZkJnHvk8289kNSPFDLAG
         mZc6XfmNN67ERPUtl8lZmLDjj3xDOr+SN1WqNEO+95PlMIFZAe0M7/ckRJ2vDQpH1Jh0
         aN1GXS6ppIQGtJ8KtoBP69zS++Z1ot/P8qV/Iz4gFLXJjY8wOYs+ramwqlVMVN/y/1K5
         viEQs0Pd9f/hwdonnF4e5ery0m3BywhGgMVbadwCv15yN2znDUzmNQp2jJxO4sV/6ItY
         VF8jZo9mp192tL0fcXk800uNKTvWsYYYRjUGSi/HsMFt3RbPD7rSV4/NnNqFDJshTUph
         79Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093291; x=1792698091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUm4qss7qtZF/f3JgD710pihw36IfWdD94haCCfcfwY=;
        b=sqt+iMbXawbJ6aAfOonGk3j8xn1WVuinvBAaw4STGFdHbaCh4V4MtuIBbHWzt/5sA/
         YmXzR3mIn4YHrT1FmMnBV2I4PxekhErio8QDCrBrqk3+Zu5W2woTh3x58B1N/nmGkUey
         9jyxrFIYSbFhDNUYQmIzxnv9NYS5ThMEabzH2RUmw/e/V3C/gV+cjaxdzKoKZXrPSta5
         FSRD+0uIfqIk6dtQ9MrR4UZa02Hqb0FCIvx4tTb6NBDPvfJze5tFMTipQ2JRI6hhwUu6
         U/eEi21CSRxIdfRKKanJd4UCjLIshmBR1UNupWCGTNVjdIT6YrhGefEhJGW6rVQlQzWU
         9yNQ==
X-Gm-Message-State: AFq9FYKMI58ctPWWXllNZ2G3qj2Jvk911jzbNOL5uRaZmQsftOMfporg
	43wpdRJCR9jrL0IE+I7OP/K138tGEL8gJdUHDWdtz244zTVwNwuOPZ/pcr5D2VKTpJc=
X-Gm-Gg: AYBFou1b97yaWm0/jFKvQs1GRuhOk3hMM34MY6wSg785ein7gLPZn0zSRFQ6FuTWkRX
	iU9rj0+ggtb3EOKkID0Dpic2w3viYUyOnSqjHcPsCqPxEobZnI3XMN6ckJiBuxmOWR216DFBTNp
	NxJ3hD8gSknUFNHVsMa9oghxB1Q+ukL/kgHTvBqwK16WL2MT1rQojz2ZGFr0iwuvQnQWVktk7qT
	SUOOdaLM6cFf46DtODVKmngjhTB1uAJeo6JNHs4N+BHid5Xy9t+FaT5BG01suHcqRH7t/fn2j9p
	KNDQIG4K2GoKoDYrXrbqP6mByC2JRrPphsDFebyyT3bdNWzXwe2KGdr/yeZy3S9WcyuXwCWfkHL
	rmQ42DTDbyygX6qwprOVCkWfOVphIZRPPVCG0JCEUY6OFAj3ziy0JqC/H98JCTc/rUu7WsMsGk9
	0zfwvIzcFkFBE+SNfYdHniJclOAqxsQyFUjmsU7tfRkKsYTvvsY53SmPL7zhJgJWK1H+zg8kI9n
	lOQ
X-Received: by 2002:a05:600c:699b:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a18e4af334mr434073315e9.33.1792093290939;
        Thu, 15 Oct 2026 12:41:30 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c91c68b4sm304475e9.1.2026.10.15.12.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:41:29 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] usb: gadget: u_serial: implement flush_buffer
Date: Thu, 15 Oct 2026 21:41:28 +0200
Message-ID: <20261015194128.2545029-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-173201@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The window is real, but the use-after-free in it is older than this
patch.

I reproduced it on a Verdin AM62 with 6.12.113 and KASAN, with a 3 s
delay added at the top of gs_close() to widen the window. At shutdown
systemd closes ttyGS0 while the configfs teardown unbinds the gadget
and removes the acm function:

  BUG: KASAN: slab-use-after-free in check_tty_count+0x230/0x278
  Workqueue: events do_tty_hangup
   __tty_hangup.part.0
   do_tty_hangup
  Allocated by: gserial_alloc_line_no_console <- acm_alloc_instance
  Freed by: gserial_free_port <- gserial_free_line <- acm_free_instance

In one of the runs the closing task then faulted in release_tty() ->
tty_buffer_cancel_work(). The KASAN report is the same with this patch
not applied.

gserial_free_port() frees the gs_port, and with it the embedded
tty_port, while a tty still refers to it: the tty core keeps using
tty->port until release_tty(), and u_serial has no install/cleanup pair
that holds a reference on the port meanwhile. I will send a v2 as a
series: first keep the gs_port alive through the tty_port reference
count (get in install, put in cleanup, free in the destructor), then
flush_buffer on top of it.

Greg, please drop this version.

Thanks,
Mehmet
