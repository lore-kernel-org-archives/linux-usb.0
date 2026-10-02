Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D9E471269
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933420; cv=none; b=iIGMxH7plEJavVbkjaOYcQumfjJ2PqGrbnKzLj+dYRQUWpJCjKHJ8HheZx74p3zAWh8/JduzYvJKJCaYqsI5dxPZJJQM4Qh0njB1ofQ6YQ7DfLiZrmSxHoQ127N3O/snvWFSXzljCG5auMbV2H9/o8JDemG9y84F//zTW9g6ElQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933420; c=relaxed/simple;
	bh=dgcsTwka8BliMXt8QjhEWDceIhcFTvj7lkYYyUBbabs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b24fhzd24RDNgdJzYS3Vg5i0oCeKCP7giCogVBBA+53a9fs2SXNWXz4xo+jVpFzUEMbWTRw/iabizlq6PU/xqSHGBt/Q+P3ODaHo7xgTYlmg8SUDDaIYdRFSVAxjXDHSpK1FQ9fB2aBU/+/WYruUIVTLPkiXsCbq9p4GoHXYX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/mYhSQc; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/mYhSQc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so56461355e9.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 02:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790933417; x=1791538217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZcmf8/EjHaul17NoBG4f4kr8vVtiUmbla+svBmGuAs=;
        b=i/mYhSQc/OinEb66fprC7gqqvVwjfZESWiRlg7GOkK0+4CXe0fDadmV5nvEGGawIxp
         o1d0+s6MgPu0psnaw2ntXyza+8k+eikp/h+h651VzswdAObWHRS/j7ZXIBxMLPCI9EHq
         oB4AyyPAGDTbKhs0jc2kGZv+qTKQp4fnqtx5huLmSFt3zjuAxURIvuLb0csQks/cpPML
         01Sv5O/XVKYgDgKU1Z3v0mqUVv5IGN573VKbrgyc6o5dSsEseod4B123an87mglWJUwV
         en4toKvE2FoODMfMf9CQ2Z+u/JaxpXTjeVqQ1iGRQbrxUhaDEMTNKc4SSoR03oFnmifT
         aaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933417; x=1791538217;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZcmf8/EjHaul17NoBG4f4kr8vVtiUmbla+svBmGuAs=;
        b=q4oz7Rv3GFiJnZI5E5PNJVWUpHVTzvDm4WetvmZfcLhIXCZu/iC4d+Hk5hLJDV0eDt
         Tb7JEf1ZlDHehZKwphKRJHXkHKIW5sDpFoxjnFyHLwkHYXALNoMcUXZQ3ARwK/sXMYs8
         I42Q+miDKqQQ2jRAETMAISGZJws0+LebMuLu+6snPX7x+X7wDvSAzjgnu6V6IWPJ+Cwy
         ac3hLhUi0IFB0ra43PlYzXcbvySWBpcrDC4Yrxuj9ay7n4LWgIbZp+fF6Ghix305oKIU
         +qm4cZvfJUMfrmwbU5b+V33tC7mxSZAT/Uw75HkW7E9L3BnfAgpXqz3JV0fiXB5l0v0/
         iM3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmfmJk1hRcT24ON2e/wpK+KYvTQJfwIoBa55BqBCWP6e5QmaAlcirus66JwHvyTHKJHIqIHlKA6Go=@vger.kernel.org
X-Gm-Message-State: AFuF++lzNWbz3D0ibZMY2l1hkt/OrTBiaAH5jIDC4nK0wFcdR/6or9wk
	898H33dkc9fonHqvUDg0OSBLwxZSKd7YGm7ZUcfM6+anEuw6xeGgwdYJftUWWQ==
X-Gm-Gg: AYBFou26AQEKOTW/fL2HxytJOfuWAiuVbsZYlm4/Z/ZPOLQhS1B8HhXMldfN5gZg2/L
	0PEP8iZm8DNeK4iCbfBi5rYBWHyVk8fWodu25gjhfDaKhf2BpAdDsKZWyVflq0nNsoep4d1pe3n
	6F7e67RxP+uN49HPOamvYh68C6tWp7D+JRAKz5/LITeFKXA9Hkvj5u+EJqnmhk1i7AMpQFK0e78
	xh2bDNi45usI+kebnznoWV5uGpYqihStTnz+VtpeOFE5IAKi/V8FLhhxbtX9ri1BoKIYntZvPws
	HIq0eSkVkPFSyHZ0+z96TUoYQr14QS+BAfuOHtd0S6YCSELhq8jXIcvymgCPQFwaHP3R6zqaILq
	G8DCdreIXlopL+jPFJedq8RoVOgv9gRft7zgFTV+oG5AMOUE0BhODkx08vQAwPpW69hIuuXK5L2
	FvZ0RD2+yR2ea3U+xEFCrNMlBqrGAVsrvipj/syxWUnOJqZXeF7AavFl2Df+FablMnCVRT7WxV3
	bVUO9t1z/hJV5iezIu4
X-Received: by 2002:a05:600c:19c8:b0:4a0:2540:b46 with SMTP id 5b1f17b1804b1-4a027559795mr45453355e9.12.1790933416689;
        Fri, 02 Oct 2026 02:30:16 -0700 (PDT)
Received: from foxbook (bfj133.neoplus.adsl.tpnet.pl. [83.28.47.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff106d8sm41771235e9.3.2026.10.02.02.30.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 02 Oct 2026 02:30:16 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:30:12 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Tseng <henrytseng@qnap.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: handshake timeout overrun and configure
 endpoint hang on device disconnect
Message-ID: <20261002113012.271ceead.michal.pecio@gmail.com>
In-Reply-To: <20260930101752.15794-1-henrytseng@qnap.com>
References: <20260930101752.15794-1-henrytseng@qnap.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 18:17:50 +0800, Henry Tseng wrote:
> This series addresses two problems found while debugging an AMD Raven
> USB 3.1 xHCI (1022:15e0) that gets declared dead when a USB storage
> enclosure is unplugged. During teardown a command fails to complete,
> aborting the command ring also fails, and the whole host is declared
> dead, taking unrelated devices on other root ports down with it:
> 
>   xhci_hcd 0000:0c:00.3: Command timeout, USBSTS: 0x00000010 PCD
>   xhci_hcd 0000:0c:00.3: Abort command ring
>   xhci_hcd 0000:0c:00.3: Abort failed to stop command ring: -110
>   xhci_hcd 0000:0c:00.3: xHCI host controller not responding, assume dead

Sounds like UAS, because I doubt that similar problems with ordinary
bulk endpoints could remain unknown for long.

I wonder if the kernel may be doing something crazy or out of spec
to deserve "undefined xHC behavior". See notes in xHCI 4.6.6, similar
requirements are also spelled in 4.6.4.

Is this easily reproducible? Could you send debugfs of this failure,
preferably before the "assume dead" message? See also my patch below.

zip -r debugfs.zip /sys/kernel/debug/usb/xhci/0000:0c:00.3/

> Reproduced on mainline v7.3-rc5:

Any other known affected or unaffected releases?

> Patch 2 fixes the host death on disconnect. The command that never
> completed is a configure endpoint command issued during teardown of a
> device behind the disconnected root port, right before disable slot for
> the same slot. Skip it when the roothub port is gone, as
> xhci_check_bandwidth() already does when the host is being removed.

That's not exactly the same, becasue with the xHC gone, we need not
worry what happens later. You found that Disable Slot works, so that's
OK, at least with this HC. Not sure about Reset Device, in case it's
not a disconnection but SS.Inactive due to link error.

> Patch 1 is an independent handshake overrun noticed during the same
> debugging, and does not fix the disconnect hang on its own. The
> command abort handshake has a 5 s timeout but took 15.8 s with
> interrupts disabled.

This patch should fix the "interrupts disabled" part:
https://lore.kernel.org/linux-usb/20260824095944.1c8335fa.michal.pecio@gmail.com/

And yes, the timeout is actually longer than intended. Interesting that
this is apparently a regression due to core changes, not an xhci-hcd
bug. It's possible that other drivers were similarly affected.

Regards,
Michal
