Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1E02737E3
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 22:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784846731; cv=none; b=rHDf6MNta/CJirSXOyw3YbziveX5APSzBXk52Ka1UnIv0F3XyO9/BXzLrTqd3flzgPSwZ4XPNr53W2xSGClGaSo1ZkLwRQH0E5+IUp6LBZm/1LtQHr0GAQOp6zuE03oLNCwoOiD4daVt9NaiYHrY6DwrVFC7hWzv9ITLnlZbuQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784846731; c=relaxed/simple;
	bh=tWmMDKJhoMjgu/8ackuapPwnmWbrt9DBRbP4IU4CN70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqqszBGsZt8Qy/FpXXY4bLesUeR9sx0G8UaxgU5q9fEpkvVGmywLVyupDukPYT9+4u2AyiAxumyECrx53BAJliDXMotGBKfxc8+4CvcLP/lObCtFkjygWZwPHYSROHDL0QL5bO5QVJ/SXr/fjus2PnDjimtzvXd2WHR72JHE/XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=zNfA90Tc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="zNfA90Tc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce98cb8165so11240695ad.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 15:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1784846729; x=1785451529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wu/+dds1M0H0szpdM0oL2Xh7RLAnmyE8vKjUep0gVR8=;
        b=zNfA90Tc8lwJ7cVEj1HjHurZ1rBKrltHbOikA5EZyx7ZQm2+0Pn6Wrh5RGNlsFDyi8
         Z9rU+uKRxSV/34o/e2SvUR7J997bJo4SFETGCjI0RWiDq7eJO6Q6DzmgQEYLcAbNAwcR
         iziLMbMIJS8oNc61SUK+3lY8gyeRrNpajLfVqAeUyrxr0G6uIHufTQsanpDkt3YNq7sR
         q/f8TqLI7LewL0jOk8X3nCWrLgJdXAUqcOtKQM+De3tpZxu/NFrrqFXrBQXFj7AE+ufN
         cZwna/LFH3akxr1pmmly1tVh2u9ZiwLu7UGycxC+g+CriLfj5EfOIN5dZztB5xzWoWcv
         VmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784846729; x=1785451529;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wu/+dds1M0H0szpdM0oL2Xh7RLAnmyE8vKjUep0gVR8=;
        b=aCUHlscvrG18Tqds/TdFFjL8ECZlMga7ZS4XRZyOa2wzZV0bvgnwfU5Ekq8DQIqcPw
         BHybSu2emNCPPQbi74R9NSsJCI3c+HZdJ91gV6W7QTMF3eM+whSZHazGjz+Eh6J9dCnd
         ZNLl8EWaRMWwIo1aO0d5JhJHw73xT/0BMYo35kqcGZ+NHgKpFsuao/bO+Lz76tI3AVnL
         PdZBcjUgT2C0dpQ64nUZLBMiPYXLOe9KoyvG4/qENUZONs6aYZemEydn/zgl7D1/mOnZ
         mVIUR+9RY7fIFA7kKqG8QxJgl8+2Xn+6eEKaW0L2cH/TyBn0bhGgjIFe46BQMveD3upy
         Qkhw==
X-Gm-Message-State: AOJu0Yyjz2qCzE35WWeN+e+/EEjtuy9ZwAJ4QurJ+cTrRKtj5IorJ03K
	vzH4IoRv6hPx1H3IolQ3IvSNls0zH+C3rNZdkmCfQVPoiMzThwG/YIPCwpKefoSfQw8=
X-Gm-Gg: AR+sD13cjzkkoe7BCcQqQDYhMxqmsZEhw0lJXlvcpPsS//0XuYIBynved6+wlmGjOIo
	BCQEIQJeY3bMP3KEnstKcFGduqhynXYryLqtVYVoux2/ZlbLSnSKyoRBEUcMDfPlS52/5AGib6w
	0CCiFgxxwtERIdR0F3vAhHZNd/3l6bHFeQK8VTlF0v3/+Lc0F03Q02VauUe+0umFupbpdL5Zeng
	drXfc/ApGV66+pk9okRrBpG/EtQHhVB4fr6B+PteQEY21nc0sv4mDm3Q3Sl+PoLYfI9enDlnECs
	MCJso/95s7y8UiEq7Ly0vjgv//1HxVNXFFIw2wci1UUcYm65q5bwI1I+HlPCg7AZjMk1L3N46Hm
	nkb6Z7k1zA/02JmQgDrirlAd9nvdgby5bIeeiwdxVgRyGnyKPWvb4xQRY0g04Z29Eyb1hQcyVne
	FizZpRDgfP9fVSdAXmH8XFun/wmX2ZMV37N8Z2nUn6OWnjSTKLwEoIpyO1Okv2TJg0ZIbG8A==
X-Received: by 2002:a17:903:11d1:b0:2cf:70d2:da7c with SMTP id d9443c01a7336-2cfa94554e8mr52416845ad.12.1784846728576;
        Thu, 23 Jul 2026 15:45:28 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:6b84:a6f9:5a58:5c29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd8a91sm40636265ad.27.2026.07.23.15.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:45:27 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:45:25 -0700
From: Bart Nagel <bart@tremby.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <amKUdIRBrsFiDTiV@spiral>
Mail-Followup-To: Michal Pecio <michal.pecio@gmail.com>, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com
References: <20260723081440.0228c59e.michal.pecio@gmail.com>
 <20260723081440.0228c59e.michal.pecio@gmail.com>
 <amJ9jAtK8rNWDO7V@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amJ9jAtK8rNWDO7V@spiral>

At 2026-07-23 14:02:16 -0700, Bart Nagel wrote:
> At 2026-07-23 08:14:40 +0200, Michal Pecio wrote:
> > Maybe don't bother with newer kernels for now, but simply checkout
> > d0b619599e52 and also add this patch. Recompilation should be fast.
> > Then run it to failure and post the log. You may want to run
> > 'dmesg -W | tee logfile.txt' just in case, because the resulting flood
> > may overwrite initial messages in the kernel log buffer and I'm not
> > sure how much extra buffering journald maintains.
> 
> OK. Checked out that commit, applied the patch, and it's compiling.
> 
...
> 
> I'll report back with logs when the time comes.

And here I am.

I found that I can reproduce the freeze much, much faster if I run
`stress --cpu $(nproc)` at the same time. Not sure why I didn't think
of this earlier, given that I knew it happened quicker when running a
game.

This time it froze within seconds.

Here's an abridged version of the log, with some extra annotation
which I hope isn't entirely useless. It is of course possible that I
have not picked up on some important details. So the full log is at
https://termbin.com/ro416 to which I've added just one annotation to
show what was visible in the last-captured frame before the camera
froze.

Nothing is output until I start OBS, and then it begins like this:

    [  169.257158] usb 2-6.1: uvc_v4l2_open
    [  169.407072] usb 2-6.1: Trying format 0x56595559 (YUYV): 1920x1080
    [  169.407078] usb 2-6.1: Using default frame interval 16666.6 us (60.0 fps)
    [  169.407675] usb 2-6.1: Trying format 0x56595559 (YUYV): 1920x1080
    [  169.407678] usb 2-6.1: Using default frame interval 16666.6 us (60.0 fps)
    [  169.409320] usb 2-6.1: uvc_v4l2_mmap
    [  169.409496] usb 2-6.1: uvc_v4l2_mmap
    [  169.409661] usb 2-6.1: uvc_v4l2_mmap
    [  169.409825] usb 2-6.1: uvc_v4l2_mmap
    [  169.660301] usb 2-6.1: uvc_v4l2_poll
    [  169.744695] usb 2-6.1: uvc_v4l2_poll
    [  169.744787] usb 2-6.1: uvc_v4l2_poll
    [  169.760428] usb 2-6.1: Frame complete (EOF found)
    [  169.761246] usb 2-6.1: uvc_v4l2_poll
    [  169.763493] usb 2-6.1: uvc_v4l2_poll
    [  169.776344] usb 2-6.1: Frame complete (EOF found)
    [  169.780296] usb 2-6.1: uvc_v4l2_poll
    [  169.782560] usb 2-6.1: uvc_v4l2_poll
    [  169.812347] usb 2-6.1: Frame complete (EOF found)
    [  169.813304] usb 2-6.1: uvc_v4l2_poll
    [  169.813631] usb 2-6.1: uvc_v4l2_poll
    [  169.828357] usb 2-6.1: Frame complete (EOF found)
    [  169.828469] usb 2-6.1: uvc_v4l2_poll
    [  169.828825] usb 2-6.1: uvc_v4l2_poll

That pattern of "poll" and "frame complete" continues until:

    [  174.692343] usb 2-6.1: Frame complete (EOF found)
    [  174.692469] usb 2-6.1: uvc_v4l2_poll
    [  174.692814] usb 2-6.1: uvc_v4l2_poll
    [  174.709692] xhci_hcd 0000:00:14.0: Transfer error for slot 6 ep 2 on endpoint
    [  174.709815] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709818] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709820] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709822] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709823] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709825] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709827] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709828] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709830] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709832] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709833] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709835] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709837] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709838] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709840] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709842] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709843] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709845] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709846] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709848] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709850] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709851] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709853] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709855] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709856] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709858] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709860] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709861] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.709863] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  174.710069] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 6 ep 2.
    [  174.710086] usb 2-6.1: USB isochronous frame lost (-71)
    [  174.710088] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710089] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710091] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710092] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710093] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710095] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710096] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710097] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710099] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710100] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710101] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710103] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710104] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710105] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710107] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710108] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.710109] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712405] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712409] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712410] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712411] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712413] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712414] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712415] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712417] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712418] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712420] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712421] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.712422] usb 2-6.1: USB isochronous frame lost (-18)
    [  174.716415] usb 2-6.1: Frame complete (EOF found)
    [  174.728415] usb 2-6.1: uvc_v4l2_poll
    [  174.728438] usb 2-6.1: uvc_v4l2_poll

But at this point I think OBS is still in the process of starting up,
and the picture is still fine.

It then settles, though there are still some shorter bursts of "miss
service interval" and "clear skip flag" and "isochronous frame lost"
here and there.

The last captured frame has nothing interesting visible, just more
"frame complete" and "uvc_v4l2_poll".

After the freeze there are a few more "frame complete" messages, then

    [  180.701300] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 10a63e920, set skip flag
    [  180.701315] xhci_hcd 0000:00:14.0: All TDs skipped for slot 6 ep 2. Clear skip flag.
    [  180.701326] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701328] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701330] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701331] usb 2-6.1: USB isochronous frame lost (-18)

And that frame lost message is repeated many many times. In the
middle:

    [  180.701418] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701419] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701420] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701423] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  180.701424] xhci_hcd 0000:00:14.0: Miss service interval error for slot 6 ep 2 ep_trb_dma 0, set skip flag
    [  180.701428] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701429] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701429] usb 2-6.1: USB isochronous frame lost (-18)

And then:

    [  180.701552] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701553] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701684] xhci_hcd 0000:00:14.0: All TDs skipped for slot 6 ep 2. Clear skip flag.
    [  180.701688] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701690] usb 2-6.1: USB isochronous frame lost (-18)

And:

    [  180.701794] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701795] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701797] xhci_hcd 0000:00:14.0: Overrun event on slot 6 ep 2
    [  180.701801] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701803] usb 2-6.1: USB isochronous frame lost (-18)

Finally, the "frame lost" messages come to an end:

    [  180.701916] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701917] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701919] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701920] xhci_hcd 0000:00:14.0: Overrun event on slot 6 ep 2
    [  180.701924] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701925] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701927] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701928] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.701929] usb 2-6.1: USB isochronous frame lost (-18)
    [  180.702046] xhci_hcd 0000:00:14.0: Overrun event on slot 6 ep 2
    [  180.780616] usb 2-6.1: uvc_v4l2_poll
    [  180.780690] usb 2-6.1: uvc_v4l2_poll

And then it's just a lot of poll messages.

I hope this is useful.

I found that nixos-unstable is still on 6.x but that I am able to
quite easily move to the cachyos kernel which is labelled
7.1.4-cachyos. Before compiling d0b619599e52 with your patch and
capturing the log above I did test on 7.1.4-cachyos and it did freeze
there too. The log in that case looks very similar, except that there
are additionally a *ton* of "xhci_hcd 0000:00:14.0: Spurious event dma
0x0000000492b26580, comp_code 13 after 13" messages, with different
dma numbers on each. I don't know if this is a clue.

Thanks again.
