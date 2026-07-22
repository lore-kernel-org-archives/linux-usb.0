Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6AC440A2B
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 23:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763028; cv=none; b=EZUNCbmnm0i7r2N4KlOJFVlqcs4EvLqiPWJVnCgLUuow0Lr95DiZOOxIoYKf+tTNDXUqx1DUgqP+mWRdMh54b59CHg88w/ytcq+f6eOVjCKSm6Y8y383lRux+t00qRW2dgkwMTRrg1l7NgSnJC2rNk7dfxCkKaWSUFqSLPAcJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763028; c=relaxed/simple;
	bh=WjEK7N0iIMdJmSLmoVAAaJK+b5PSif7Xz8PaRas9blk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8x7jdBKqHn8SXK2WRhvyAa5/+yu+TskY1l2I8p3+0hNAaGmZMVazdXl60z8eomqUlK5/TzyMOObd5y7RDl37Y9jEsbwbhKw6VzPdWkLcJE9sCHT9kBVKRydUMOQEWcfmQY+IiWzU3myT1Hi097k8xfFVFZfP6G0q1UWgdc0U1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=kX6SY8Az; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="kX6SY8Az"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceaf8a1265so551345ad.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 16:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1784763027; x=1785367827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vTy+GucPGR0rHh6U22UYX5WfJS196h/29IEMZ2J7xOU=;
        b=kX6SY8AzjJsIKvolDcQ6V5Y8FwY07/X9prg+SxP8RReAaxhuvEpudVjA1Hub5mSxq0
         yGKUW4kLSCDPMYUoqcVMj0LPiGsC+DbUI0+UCUBamfJFqw5o96ifadlWjdlTQQpK2ovj
         1FXAmumKVw1yIjHY7WSONYb49xLZga6rY8P/Cjtzuf7YiZ30zhnU0BhEfOTaXFnanG9Q
         LN3d64jbT4GvDFskAW+idjoK8ce2UyMyiFNGkU8llE6VIvUxz34AUICAVTaMtjU4dp5I
         Qz+1WBUz67XwkNYameSN3bENvf4OnYEr6GkbSXawyUS38aK+wZj+9HDuI0IX9CI0kuk4
         1lVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763027; x=1785367827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vTy+GucPGR0rHh6U22UYX5WfJS196h/29IEMZ2J7xOU=;
        b=JO/K1OEh7rv5+WJ8KYpCUiZ0pOrG8QdCYicazzPC0O7tF76fWSW8lMBt8jt9oKO+si
         gdsXu8FPzmNB2FwHsQIqcWXKN5iinpr1GAWzHuZbkRaVvz8vH0x88gMsqP/TcCCRHwtf
         Pv9AVB20+LPvsQszgKrqE8MBFQ32bOClf4Q83Y/6evfHyvZ/o8dDTESBSLEUS/4c40TG
         djMZoqlejxgKxfbsphhh3LWai0sbjlVHFQSgXm6r/fDKi6RUhciZSx5gMO0VgGeVBop0
         qy+8jctMovRUnsXzUmHPpJHKbNBwqcwISwkyCk/c2xJLY6ceYldL8MUPsLHaDsJUigB/
         +9+A==
X-Gm-Message-State: AOJu0YzYINUnSNrioKIClyDFr0z7QysFIFBt6S98xRoENVVdW99K5KJh
	emEIVtDbORAZczHdk1NO4zB8TplIaFWs8jU+UJjo7h/tV+X6FfxkEnlnfxdz8j3PYw0=
X-Gm-Gg: AR+sD111AAMq8ZWq2ZrWqsM67tlAj9MNsirWgSPsaUmSwWJunyvWreKcoajmhusrr+M
	dXTgVCH0l0oITT3rlS3LoTF62NyiQJxWHdo9ATNLfcGf/rc1oQIWjmRwWb60Mnep5ZKF8RYXANI
	8oBQZ9HdhmJO2mFMTAIJ0J3kyRwjBh3+VDLZxZkF9UC8vZltqp+H4pexaVvTa+Yv/nE7jDjwb0H
	SFsCWs8yYa/vKKG4ukqxGjuV9GBIwR4fQUkFruCnakdbnK3ck0+uaVCIHIO2cWEIHXAG8u93b+S
	GY1xCnSniSz3LH7qRpvDNBdjRFmxLMb1KD6LBUbD7SyAXyoKbyeY9MitWTUA5tzDIMkr70LyJth
	38Ji9ER0MNQNMuZ7YKZgXPVrWN1eWT8uojnkg+H3lIhhKnlZoZFwfisvVFkEmdjwmNWfE/cwv/B
	pK//U48MJ56KfgLmjVNsP2JSVo87gzg673P6rNcmimg1loAgIAD8UFHdDCEQ==
X-Received: by 2002:a17:902:d48e:b0:2cf:8363:5ab7 with SMTP id d9443c01a7336-2cfa708d160mr10864815ad.26.1784763027220;
        Wed, 22 Jul 2026 16:30:27 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:818f:103b:babf:c4b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa38aasm21929755ad.7.2026.07.22.16.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:30:25 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:30:24 -0700
From: Bart Nagel <bart@tremby.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <amFSPjR397Glqzk7@spiral>
Mail-Followup-To: Michal Pecio <michal.pecio@gmail.com>, 
	linux-usb@vger.kernel.org
References: <al_hchyOdPoPWKEo@spiral>
 <20260723002256.44aa664f.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723002256.44aa664f.michal.pecio@gmail.com>

Addendum to my previous reply:

At 2026-07-23 00:22:56 +0200, Michal Pecio wrote:
> What's the affected xHCI controller? You can find its PCI address with
> cat /sys/bus/usb/devices/usb2/serial
> and then use lspci. Make sure that the camera is stil on bus 2 - these
> numbers sometimes change after reboot.

I just realized I missed the part about "then use lspci".

    00:14.0 USB controller: Intel Corporation 100 Series/C230 Series Chipset Family USB 3.0 xHCI Controller (rev 31)

Thanks.
