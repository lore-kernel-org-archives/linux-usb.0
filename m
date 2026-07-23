Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6D6242D7B
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 06:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784787590; cv=none; b=iyMFUA3Eb+GIz5gzi9w2y6uhiUTNQoPI9mholFINOFYKCFwQe4ICWzhfpkQVHvP34ClS1diwpW32N/n+7m7EcdOQZHp7EabB0zznvnqJ7jSxHpwYlLaKLbpA0oeDSR21xOr4sJB1ys7k1Bdg6RL9gSVzlsEGxc4Uja5XV3akMz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784787590; c=relaxed/simple;
	bh=zzIL9nwz9TluLepLdXSrvMoGVqLURvzOz22tICuoWLE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F7vRzc7OYm0qVNEtVji6GUhCSTVOxwOzyTWeyOp6R93NYsaq9G7CYQZoy8aPHFQy/8+VBfgoUHXH5qnHlnRVoD20ye61Cyr8RU4fDntEobq0oDgh+pBiAdwrxJCYzeIFpWU7qBdDHfKqQ3/5rZSCtJSyT7/Il7KhpdMjRdhs2Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avXzs0VJ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avXzs0VJ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f84023916so217666f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 23:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784787586; x=1785392386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9scTKXIk1tqwDPFolVG8zkxGzNGBbgdJW2qohtD6k2c=;
        b=avXzs0VJiRxvwjI5GCvNQPhha2XhiO6VamcfUP+VwPoR8j1lyzgwi5yQWV382IQGzu
         BGQunnQcsp0ZijkI9DnQWX5crGL+CbStAI27VE0t2+PHfvYq/cK6jOFAy9P9+mUhaRVT
         qTI3qHYvbqlLLVRJUeCevX9QvQOxRlBGetIjlYC6CexqIzsn5w2lnELZLedF/tM14u2N
         Mi8KQmnGGjsjIrqB/q3qeb4h164qlL2VrrSjhNDQd/lf97SrqB5lvbDVCohn8qQtL2vT
         dqOjS5+B2UmyuSlwlUhToVpFajrl1XnCp9Dbh1ongi3wt6noTcpoZ4D66AWSY2rv2uJn
         SDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784787586; x=1785392386;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9scTKXIk1tqwDPFolVG8zkxGzNGBbgdJW2qohtD6k2c=;
        b=N89r/q5tGIMUWQ3GdL7mYgFMmXJZNRAe8kICyx/H82NwfSmhlUZc8fQJnajq484++S
         RDsqCXIQlmmCK874ZnjOvR+ZbejbmCkPWj282L0RlHrGWRlrQr3ga7u1b5p/SENcUWv3
         ye9TIcEETBaH4To8kr+sHFJKkdeXpCBgB4KIVzxULGXJ3IboI8IRAHcoeo0/rsxUqi9I
         YBYND7KjJbwVBDjKS7XCE8XpWZpxxqwmRbjMHLQj+/xMGA9BYjWrHd5NnHR4Ki9ENa1c
         AdY5wr4NBI4+XVnladd2BFjKN6/ePkOw83ZqCiFj4wCZVxT8RPLxs6jcj007kK5HJv0r
         nDxA==
X-Gm-Message-State: AOJu0YxqI1tZZ/tzL/mhFk1Kcz6+dh8bPtu0jGgF6Y+DWWOZFwL2bY92
	sI842IiG3m6NT/1nmpQ5zyhBH1FnoXZVVkNYDGhgc7n3UTfcfggB+dWm
X-Gm-Gg: AR+sD12DuD0WS1RubZU7GakscdZHKp4y5asQYbPraaSq+x26xE7UcCcWlO7vX5pWrvl
	7xJU0lzFirPVq0Dam48AjJfAz/8/WJeIfI6K1Oe1SYkQWatLGgVSvJATwthR86XwwAsyBaA44kx
	2MWmH2WViVPMxxPwZQhWb70LSMgV/2px4xD82RN1l8pL4i1HCOvKQg7er0qF49fLzmKFp8ydfJ9
	PsX3vteUn4t3Yhy6l8UApoGHF1JxFo0zjwAIFUXNWlfLZZHK7+ZYJTAif0/wHqFIUeCSvGFpUZA
	9wXzeaqloYU/GSGyo4OwLzUkg6Om4ONsUnEfrBlAWrzFUHQQAxPXK4e/l300M58nMz3Cr5uF9hd
	BOWzUZZa6kPA/MKd+uUe5OEOwTrZYL7qx7epQxv6KFjEbOi2x76x/Q5+0QQa2Cu2kLDS6CvVQv1
	D37rd2asno0rg=
X-Received: by 2002:a05:6000:2011:b0:47f:8487:a699 with SMTP id ffacd0b85a97d-47f8d72a78dmr2018794f8f.24.1784787586105;
        Wed, 22 Jul 2026 23:19:46 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6d277sm12721704f8f.32.2026.07.22.23.19.45
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jul 2026 23:19:45 -0700 (PDT)
Date: Thu, 23 Jul 2026 08:19:42 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Bart Nagel <bart@tremby.net>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <20260723081440.0228c59e.michal.pecio@gmail.com>
In-Reply-To: <amFNBLzwUdZhqpup@spiral>
References: <al_hchyOdPoPWKEo@spiral>
	<20260723002256.44aa664f.michal.pecio@gmail.com>
	<amFNBLzwUdZhqpup@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID: <20260723061942.9y5HEf20Busv5mYB67eZq44GgayApARH6yYnOAXuVRQ@z>

Please use "Reply to all" and be careful to preserve Cc's, particularly
maintainers of the affected driver. Re-adding Mathias Nyman.

On Wed, 22 Jul 2026 16:23:28 -0700, Bart Nagel wrote:
> > You will probably see Missed Service Errors being logged
> > occasionally, likely both on "good" and "bad" kernels. And it seems
> > that good ones will recover every time, but not sure about bad
> > ones. Does the first MSE break things forever? Or does it take a
> > few? Could you post a log when it breaks? Caution: you may see
> > thousands of lines per second.  
> 
> I'm still on the asterisked kernel from the list above at the moment
> (appears to be "good"). I tried enabling this and I do indeed get a
> few of those errors and they seem to recover. This is what I have so
> far after having set it about 5 minutes ago:
> 
>     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
>     Jul 22 16:14:52 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
>     Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
>     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
>     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.

Please use 'journalctl -o short-precise' or simply 'dmesg' next time.

It seems these errors are happening in bursts, sporadically, but much
more often than your failure rate, so 'bad' kernels handle most of them
fine and only occasionally something goes wrong.

Per your other email, affected hardware is Intel 100 series chipset
(8086:a12f ?) USB 3.0 controller. If you run 'dmesg | grep hci.version'
I suppose you will see version 0x100, so it's somewhat old HW.

Maybe don't bother with newer kernels for now, but simply checkout
d0b619599e52 and also add this patch. Recompilation should be fast.
Then run it to failure and post the log. You may want to run
'dmesg -W | tee logfile.txt' just in case, because the resulting flood
may overwrite initial messages in the kernel log buffer and I'm not
sure how much extra buffering journald maintains.

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 24fde00fbb3f..57b326d9c99c 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2779,8 +2786,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 */
 		ep->skip = true;
 		xhci_dbg(xhci,
-			 "Miss service interval error for slot %u ep %u, set skip flag%s\n",
-			 slot_id, ep_index, ep_trb_dma ? ", skip now" : "");
+			 "Miss service interval error for slot %u ep %u ep_trb_dma %llx, set skip flag\n",
+			 slot_id, ep_index, ep_trb_dma);
 		break;
 	case COMP_NO_PING_RESPONSE_ERROR:
 		ep->skip = true;
