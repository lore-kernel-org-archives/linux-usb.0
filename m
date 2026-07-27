Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826203CF1ED
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 19:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179904; cv=none; b=KRjhPSbmOVFu3b4D17hnrFCkK0xaiiPTF7rYe5TohYBjASmz5dOyTBI5rwcrD3Z8V9ls/UXsgI1uCFM2GZD9FCPIs+VqDpVRAdvo085eJuxN+k1qW5N1zd03TDwznL4AhzSkiQLMIaL9dOTb1c50nT3klr1HGVjp6WfEysEqLuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179904; c=relaxed/simple;
	bh=Un6siYnM+ZFWlTw3zCz0AopGBG7MRAKNI5gG2PmKCGg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VvVDANJWTnOIoiVGUVzFssX6lDnaUjUg/NdLObo+Zngc8tWXHLnTkHi5Hb/ZIQdsGbgAV1f7cDBaW7JtOUQdJnroHkkz/iJnGxHLxckSs7DY5P7VklLtDrtZr1WTorsT5KXt8Ha5DlxoMVtABWgM5c2qj/dRMBgvaPcMKMCsGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8X1akrS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8X1akrS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4956869750eso23183115e9.2
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 12:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785179902; x=1785784702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mwsGW+Hk5uHQBqnL2Eo2zXFB4YSPa29o9sOJAIzMO74=;
        b=H8X1akrSC5bXF5sqIQcvtnldVKDHo8GqQ+s+25pMzInhmKNaU7WEA4rrLtcoIeBK6v
         /RQnSOPs/flzqFf4i8UcU94hv6AeJY3UQTIB/PpHXGoYTdspakUjDnXhv0N1IvccTFWV
         zGMr80L+XS4gf7elK5isMWQeLCB1FCkMrbBdsI4HNSxs44H8Z74qYpToCzSx0Hleo9Rt
         t614F0LiEeMmJmpzvqW3Mu4gdPTz0HSUDT30kb0PHFCCkC86SMESfLbZKN0CpVEzpZ8r
         Ytbblk9IAYJak1EWgvWgSjQpGhq8OS/+lOQVe+jVWVEJWsscbNXoAX5zRFjVv1lH/UFM
         1wVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785179902; x=1785784702;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwsGW+Hk5uHQBqnL2Eo2zXFB4YSPa29o9sOJAIzMO74=;
        b=g3ZZNPSf6cTj2WuKPYVAYvFEEMjc4HOslEF5i5ovGgMhZfagITGXCGhX9UsNWUPzGN
         iNfrenmqGkQQsmVpv95VzBoJ4XjPSWfOcxHjo0zWOIK+leiuoRu9FY2DksuNwj0jcPlW
         YEevIiiD0BKvn0MvOTqd+xaUmq9lma3gcwlzNi6gJ6zT3DvT1rWDmmKKfnY/R7dPmEcE
         SbNLGwgKNaDBf8jeUCEQhHKyWPKzjKd04C+6gLmaafUdxGvCCydrNrWH9CLp1XOvDMM4
         cJp4vA6HriPaD5m/+DGC0OcW2EfFPbqvvd86/omifLlW1nZ5XcNdQx6JYdQ7mKhxNvlt
         JZWA==
X-Gm-Message-State: AOJu0YwWgCgVaYY2l8agaZ2rpauXIzqYMMU1/wZEbZQtlFlGnFyeWsZh
	77fNHnqntHSRPeKh95yib3HWt737XjZX7Dy2CrrWQXZ077OaNjx2cLKX
X-Gm-Gg: AR+sD10u/ZmWJ9PG14YOpOyrtoyoMaUMfIhdBsBN/f6Nuu4KUdkUziRT86S8sxH+fop
	Kby2sTw9i+yNv1Z6ByY2+o5Dktikddx+Dfi8Z1wP4bKlsGT1llcY0jSnsP2CepHXOgMQu6YxgY0
	vnwj9cwq98pb+oo5ELuokIX78+D8WFA8YuRvEY5Yw0Q/b0dp8vl02w44ObAQ44sqZKekeAIeVLZ
	hBssJKqRSVLslMoZCyGmYu3da18fi0x7qMxfGyIuLqFqF1RjCi/vgKQefNCe5usXH3xTd/BUELR
	o3I7dVAm9D+icO2+cbqUpg27r/PpNPPVx+4opyKXESsWXp5Z0X6Umg3VLMJOa+DY7oQW5HT6xZM
	lcKrstS5ncpa7gx/OQ8GH22RPb6arVOLjFkDW2AqfSKbv4wLDborNRn7ErZxu6Cy45T14CsKqZM
	nUff7SPtDU5Tl1QcNkiKxmaA==
X-Received: by 2002:a05:600c:4444:b0:495:6022:5a14 with SMTP id 5b1f17b1804b1-496c4fe08f5mr4096005e9.34.1785179901692;
        Mon, 27 Jul 2026 12:18:21 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6dc25sm50020765f8f.33.2026.07.27.12.18.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jul 2026 12:18:21 -0700 (PDT)
Date: Mon, 27 Jul 2026 21:21:30 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usbcore: Add quirk for 255-bytes initial config
 read
Message-ID: <20260727212130.4a6bb49f.michal.pecio@gmail.com>
In-Reply-To: <CAFgddh+1Bk=CFkKYNzB=L++UejkhCEcTHp4A2JL2v+P6uBuF2w@mail.gmail.com>
References: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
	<20260717195336.98500-2-nikhilsolanke5@gmail.com>
	<20260726182946.79a4ef98.michal.pecio@gmail.com>
	<CAFgddh+1Bk=CFkKYNzB=L++UejkhCEcTHp4A2JL2v+P6uBuF2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Jul 2026 20:55:27 +0530, Nikhil Solanke wrote:
> Regarding the "stall" wording, I was referring to the condition where
> they fail with -EPIPE error when these devices are connected through
> external usb hubs. The directly connected devices I've tested
> typically fail with -EPROTO instead.  I'm happy to reword the comment
> if you think that would make it clearer.

Understood.

The reason you see -EPIPE is due to the marvel of technology which is
"transaction translators" in USB 2.0 hubs. They report low/full-speed
protocol errors with STALL handshake on the high-speed bus, even though
a new ERR handshake is also defined and used for similar errors on
interrupt endpoints only.

So your device doesn't stall, it just disconnects as usual. And with
a USB 1.0 hub you would see -EPROTO too, but these are rare today.


My habit is to make code comments generic - I don't know what devices
will use this quirk in the future, so just write something that likely
applies to all of them - "break", "malfunction", "fail to respond".
But I also describe precisely what problem the quirk was meant to solve
in the commit, so the information can be found with "git blame".

Regards,
Michal
