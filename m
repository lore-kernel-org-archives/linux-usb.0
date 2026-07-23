Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F143DAAA7
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 21:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784840543; cv=none; b=K3bjq0iC3Xrggvj4jxoxMnCuw3KVTZFqgxfQfA7CRSt5HHkKOWlvyR9JlgQPayWxune8SF5ybC8cRX98K1WU7nSCy9+1or0L4BnhDCu80DRzklIf/lGTwtJ0LunCUvqqunJoBedTFXOq3iqQcvva2Zgdir7Z1GBHwJ1LxXmQ7Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784840543; c=relaxed/simple;
	bh=lt0hWCYV8ycs5ZV+xzsIUNDBn9/WaE/zU7uFTpM0Yms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=h+zQw0+wf/H90OuUSGv0SHGdKfE8l1eVl+10ttQTXM+6bAhwpNCCA081VA4bCYIpgyfFmBtoBg2UE43HLu7ayPTiiVx+x1VHsd9ilDchcaUA+rLMW4qkCiF3ZpY76ak/3U8C6rbSsjBTZR/iahkDYd1/2hfuBwUCclODDtkWQls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=xTg25Bvb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="xTg25Bvb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cad8076b01so14581345ad.2
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 14:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1784840539; x=1785445339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E0yWaN6pXER4N08H5GtzM7TTPED9gbPdygYh1rpdKFY=;
        b=xTg25BvbKF5SWuW+al/E6oMHVQXFF1s1AVl9k2tfHZs+K+vjg5+fiUpsA42/Xv0oTr
         XDHL5poInmCSm8OXS4KZlNhxAoSkP/clP8oRE0AVHrKKth7jm0abwT963sXvJWVQP5aL
         t9jfl2yXSe7xpMI0x7AipVkCDbmMHmlGl8KvTQi/VlEZ+RoFvc8h1IpMuIwM/UkCQPdw
         pIkh/zW64qV5k1Ckl2w9TBFbjBSTlD5g/4A9OeVJ0qIfFFx9Yk5S3X1iIy2LeBm7zTwS
         Wrload/wMmr92znJsr2MCqqNNzobolP38C478/e1DSkd3cECUdgbyjgovfTZPL7Ar84r
         NyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784840539; x=1785445339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0yWaN6pXER4N08H5GtzM7TTPED9gbPdygYh1rpdKFY=;
        b=WhCOksPfiH65hnf86gvzxhKL1RafHV5OrRIIQv0w48hEHtYinQsqEtznJyxTJ1pQgf
         y4W6iPBYD5gtPpI0+VZIoWj92u73wsl+tr7Uk5bLWlq5FI+QuIEgF8RYqHe9oEnMzyX+
         Kuov1ULAb9pNC69DnTZaO6ivJEgn2FiejpjIdSPJR/sP3c7VJ6L0opgexim55r2iYhuj
         wp8hWN1y9wxxnGAt4GxVjswce7SpAamtL18WeYFrpT0LIS5l3VFZYjykD3+bgto77IwR
         zlZZMyPpt2KJp9vdnQ7GGBtbDbxkek+n3ilcogIPUx8kcYGWxBOK7uCcDON46FyvWC56
         AZew==
X-Gm-Message-State: AOJu0YwNNcbLXo71AycOUbNqZm4VAKTWWWzmTfklWjUQ79HAld5SsTXb
	AlP//icAU4F3uByct2MrA7TJFs5NH1NqRgm2IB4nHc1ASahypY/syhtU47V7C+WtsvM=
X-Gm-Gg: AR+sD11MEsiebBomsh2ZYlnh0H5GoljSEGMyM2FqMzZ1o9Wqwv2eItkOvAe265R7jgC
	wvXK01a2esSXPPmnw69gDbOwo/vNNe9x1qmIQ6xYxLwObi10+336m6x9WfRaBx8edjOgHLKBnt8
	YhRCIlXQTeqRW2P1rOVW+oYxAVomwdJHzYPXkPjoMioo80WSRJ5GIyj2prtqrjQgT6rsXYRqHMU
	PcNfRCSXp1FSjs8V9/TTJFpe/m7aUtUh2lF/e32ws8qYbXUXeIg3TWPKieYM2iKbDR7h1lx0P5b
	FZekpEpZXRRU9d4PTfMoLxqASfQ7i7SCGPiStRDGh7CKx5WU+iSoHx/CfLb/xhjM+ewF7/9IpE8
	R+9rVLJ+PvJkZ17uGhg6c9W2UYAYDTY3VI+bPEuu0lqcHYk3vrPfGmgemrfx5pUGfLTT6aGX7g7
	+Ye3uGr522x8n9k6Z62Psi8HHEgElT8NRUuEHbO/OU8cJx/F5Fhe+AqMkpAplwkza/wP+NqWo=
X-Received: by 2002:a17:903:1b2b:b0:2c2:7baf:139f with SMTP id d9443c01a7336-2cfa74e3c48mr57512895ad.30.1784840539228;
        Thu, 23 Jul 2026 14:02:19 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:40f5:b8ba:5f3c:c670])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2eb72csm39889695ad.46.2026.07.23.14.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:02:18 -0700 (PDT)
Date: Thu, 23 Jul 2026 14:02:16 -0700
From: Bart Nagel <bart@tremby.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <amJ9jAtK8rNWDO7V@spiral>
Mail-Followup-To: Michal Pecio <michal.pecio@gmail.com>, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723081440.0228c59e.michal.pecio@gmail.com>
 <20260723081440.0228c59e.michal.pecio@gmail.com>

At 2026-07-23 08:14:40 +0200, Michal Pecio wrote:
> On Wed, 22 Jul 2026 16:23:28 -0700, Bart Nagel wrote:
> > > You will probably see Missed Service Errors being logged
> > > occasionally, likely both on "good" and "bad" kernels. And it seems
> > > that good ones will recover every time, but not sure about bad
> > > ones. Does the first MSE break things forever? Or does it take a
> > > few? Could you post a log when it breaks? Caution: you may see
> > > thousands of lines per second.  
> > 
> > I'm still on the asterisked kernel from the list above at the moment
> > (appears to be "good"). I tried enabling this and I do indeed get a
> > few of those errors and they seem to recover. This is what I have so
> > far after having set it about 5 minutes ago:
> > 
> >     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
> >     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
> >     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
> >     Jul 22 16:14:07 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
> >     Jul 22 16:14:52 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
> >     Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
> >     Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
> >     Jul 22 16:14:53 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
> >     Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
> >     Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
> >     Jul 22 16:16:06 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
> >     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
> >     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
> >     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Miss service interval error for slot 18 ep 2, set skip flag
> >     Jul 22 16:17:33 spiral kernel: xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 18 ep 2.
> 
> Please use 'journalctl -o short-precise' or simply 'dmesg' next time.

Will do.

> It seems these errors are happening in bursts, sporadically, but much
> more often than your failure rate, so 'bad' kernels handle most of them
> fine and only occasionally something goes wrong.
> 
> Per your other email, affected hardware is Intel 100 series chipset
> (8086:a12f ?) USB 3.0 controller. If you run 'dmesg | grep hci.version'
> I suppose you will see version 0x100, so it's somewhat old HW.

It is indeed old hardware, but still capable enough for my needs.
I get this:

    [    0.391721] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000001109810
    [    0.455073] xhci_hcd 0000:05:00.0: hcc params 0x0200eec0 hci version 0x110 quirks 0x0000000000800010

I suppose the other is another controller.

> Maybe don't bother with newer kernels for now, but simply checkout
> d0b619599e52 and also add this patch. Recompilation should be fast.
> Then run it to failure and post the log. You may want to run
> 'dmesg -W | tee logfile.txt' just in case, because the resulting flood
> may overwrite initial messages in the kernel log buffer and I'm not
> sure how much extra buffering journald maintains.

OK. Checked out that commit, applied the patch, and it's compiling.

(I haven't been able to figure out how to compile in-tree and then
have Nixos accept and install its outputs, so I've been compiling via
Nix's toolchain, since it just works and I can point it to a commit
ref on my clone of the repo, but it builds from scratch each time. I'm
sure it's possible to get it faster, just haven't figured it out. Last
time I tried, I spent longer tinkering than a full compilation cycle
would take before giving up.)

I'll report back with logs when the time comes.

At 2026-07-23 08:19:42 +0200, Michal Pecio wrote:
> Please use "Reply to all" and be careful to preserve Cc's, particularly
> maintainers of the affected driver. Re-adding Mathias Nyman.

Oh, sorry! I actually did that intentionally, since it was you
replying and not Mathias, in an attempt to not bother an extra person.
I see now that was a misstep. I'm new to the kernel mailing list ways.

Thanks again.
