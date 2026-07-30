Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6FF3921D5
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 21:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785448741; cv=none; b=c5LeQdeNLbGAy0IU7HMkjpn+7yyfXwWzyjGe4Veb6XdiVcSBJ/ZldWvJ9XFZ+KAxAatzOSjYp8prjH2FmGQxcfSLm2oC4ACOGLFJvVPHxbq/wrGAl1hz5eZm2HlwPZEgbfU8Td1G5B1eBFlgbAk9HEtl98MAWKRdCd4thgIv3DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785448741; c=relaxed/simple;
	bh=FGXxWVw4SzX08TKroZSL5yJeWhV+nwGiWQVG+GQA1mY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XTpmvyd0BCo1dNjWHFFoE7qNCnFZSZ1AT7C5cILs97tMUu1PUbrfej6uKQlKat4XV4STdh2CXxgjTREAdHAGijNXOpOjHK1avjEB2lIBX6C9VG8rcNlo992n6lKWgxNeFoLTw5EEH8yRIj9u+oNuvEZm7CS5qDL5/6HuQSZEYgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNzuuH+E; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNzuuH+E"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso1048415e9.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 14:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785448738; x=1786053538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVlKEk/Ve9KIOBOOmVgo+QzHu2mFk3fxwP01HaX2UmA=;
        b=BNzuuH+E94PwUIACnuqweS9IGh10r2gRzDrgUyj+Pqnux1K93bO6JOjYYWxU7a4Ad2
         vYhq95D4z04aCg5Q/9BV7CI05vaV2HAuCLNvmIs+oIPmPkTjcrSKsqVVxmclB61sKE64
         LfpAlYE4bgsisErMI1RnpaMYwZMb5OnrYjGBM3JHp88oFQiiGpXDF52Rk++CC24MOOvA
         tiGJ+jil+fKEVOVXKxnz4B02aHK4uksm6JKh3WGWHCKD3+PEk9SHGRTdXg++1okoFFkJ
         S5iFfxX/bXTWsnuNVxchzqiA0CN0MKufzUzRfL8m8HB1DJQxG+2liZCR2cMLQdQbQvrr
         bSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785448738; x=1786053538;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVlKEk/Ve9KIOBOOmVgo+QzHu2mFk3fxwP01HaX2UmA=;
        b=WNoKom+G2VQIGlLFOjRPxe6YWGn7ZUffBFWs5f1iKjRI0zbnuqjjLEa7YET8JDVNt3
         ZQgi95YHPvn8D5pBeWXsCuNiDMyPX5sdyAodCGnLwu0mrp+ZFy2pLvCjXLjWLsU0h4I7
         HymK5Gqkrcdr9CumYwphdvHHQUgNsEdfBGH67H4SFXETAZshijySHxF3onVaA584oPza
         3mUNfyE/uzepXyqicz1oyhDDfyOoxfAJE5YC8d7SU1blYQg5JGipELQZOdzZ3Jt+c/cY
         +hUbb0yVLBkusB5tuuAQV5hWjXTyk1AuZsrTFBZFpd0VkbUJJgSvNbNpynIudVkQght7
         2xNQ==
X-Gm-Message-State: AOJu0YzVAvbQrbXo+gXzFGQ1ofYt4+VG//V39yxpYIUIi4BSUm6KHWhL
	azg5/WL3RvAm4sQyxoFvNssA8KgnNXNtQ9wc4jMZSPrjc6+bDSCbyySA
X-Gm-Gg: AR+sD12VfU4MoJTxna7AYWakWeIDUW2jHavgHI25RLZ2osjzT5TzfeZaScslX0ZQatf
	GTTCyiEij8iNFp3D/0OumaVTKg6GGI5Z9rAdsxAfgFi+BoqxGNN/Nn55WLN5SC6QRNFAzr857oT
	kfHZNKQ/4DU4vp9ey+zgKThujVnrTPHNVgBp4erRNHZFW8q/wizaGLsMEbfPr/0/Gz/oAAHeU8u
	jMd1VOo5elft1yAeYDFB7VssTjLZK/EG1wxKQDgGql2p8vfyj8qHhhv2JZqvqUr5QncEF9s1C5R
	k22c+ITwffIXX319qccHb9w4MTaQYxg7y+Bw645MzeHAF1lwUTUtsFjGMGWblJlrdTSrPg9JBt/
	P71B7/kwhhPPzzmZhva6viPfegR6iVud6qCMPugNuuAl2onOMrMxoRX9tBypi2P+dryNHdSvbkc
	dzIbzMoXJyqMEjnv9SYgZ74uijBCsmOwD5RfnsThIYIZMpTZH2W0MZ0YzAbwAmLLoRSCq4eg==
X-Received: by 2002:a05:600c:628f:b0:496:bbca:c989 with SMTP id 5b1f17b1804b1-49800eb1bd3mr58772515e9.33.1785448738204;
        Thu, 30 Jul 2026 14:58:58 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010aade3sm96906995e9.14.2026.07.30.14.58.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jul 2026 14:58:57 -0700 (PDT)
Date: Thu, 30 Jul 2026 23:59:53 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Bart Nagel <bart@tremby.net>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <20260730235953.2d51e0cc.michal.pecio@gmail.com>
In-Reply-To: <amuTKengDzr0IL6b@spiral>
References: <20260723081440.0228c59e.michal.pecio@gmail.com>
	<20260723081440.0228c59e.michal.pecio@gmail.com>
	<amJ9jAtK8rNWDO7V@spiral>
	<amKUdIRBrsFiDTiV@spiral>
	<20260725115956.321185a1.michal.pecio@gmail.com>
	<ame6T_LjiJBeJ2W3@spiral>
	<20260728003131.085171ee.michal.pecio@gmail.com>
	<ampPGn-3C9PSEZQz@spiral>
	<20260730130814.65f7891c.michal.pecio@gmail.com>
	<amuTKengDzr0IL6b@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jul 2026 11:13:59 -0700, Bart Nagel wrote:
> At 2026-07-30 13:08:14 +0200, Michal Pecio wrote:
> > I'm slightly curious what exactly happens there (probably MSE after
> > Short Packet on a single-TRB TD), and whether Missed Service Error
> > may point at a Link TRB, because the current fix wouldn't handle
> > that and the stream could still hang. So your failure rate may
> > actually be reduced to 1/255 of what it was, but still not zero.
> > 
> > If possible, please boot the patched kernel again and run it for
> > a little longer. If it fails, post dmesg starting from the "Miss
> > service interval error" line which is followed by "All TDs skipped".
> > 
> > And while that is running, also collect another log:
> > 
> > cd /sys/kernel/tracing/
> > echo 1 > events/xhci-hcd/xhci_handle_event/enable
> > echo 1 > tracing_on
> > grep -B5 Missed trace_pipe | tee /tmp/trace
> > 
> > This is supposed to log 6 lines for every Missed Service Error, so
> > it will grow, but not terribly fast.  
> 
> Before I make a bad assumption and collect a useless log, please
> confirm for me exactly which debugging I should enable. Just the two
> you gave above, or also one or both of the ones I was using before:
> 
>     echo "func handle_tx_event +p" >/proc/dynamic_debug/control
>     echo 0xff >/sys/module/uvcvideo/parameters/trace

Yes, please keep handle_tx_event, otherwise xhci_hcd debug messages
won't show up. UVC trace is not that important.
