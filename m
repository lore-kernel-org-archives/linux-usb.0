Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88B32C2363
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 22:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784758984; cv=none; b=EUcrHdB3DNfHB3E1x4ABSlLya9IIL4RFckXiwu6aV37YufYqaRbzQwp2xkZ87iT7laQ3WWZ+0fFcBvLhKQBWAtmF/5vKyPZvwUToGgvYr8Dso8kTbGvAIOUDm8LI1P94lNpqy6eRdzgSRiH6ljlYQmAmUwLdfH3FVM6C4i8EaSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784758984; c=relaxed/simple;
	bh=KNos8w3yHHBVFZcnjVqX9Z3MOHfANZ62MklbJ2OMSbk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jDZ2hyZRpvZsaCJIIR2rl0Gc/CCEk2U9fsRCeFbq4qONtLcrQbGs+YG6s/uyoCWJn0N5PV2PdZyra6ILQ7lytD+7UTIGWMWt5F1znDTnJzoQ0bjb8JU7ySK480TcPR0cbm6Lb/NwZfdJ2y6J3w3GSJB21L6Ia4SrDcbgWsbjyrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GG4E2O6X; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GG4E2O6X"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so57435e9.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 15:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784758981; x=1785363781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAs+Qk9u62M+uzqXw8yZBsgtIZ8icVu/Hs2Fs2SLIBQ=;
        b=GG4E2O6X4pu/yO3dWKSqqy73a30jDAcV1+essoerXGoH1pped5hDDIQx2hy1KPFTLf
         0hn4mWRWwOp3dQNXtVitnLegmWFDC6sX07MjVKhK9mgE4r1XeW9VWFyVYvDmdiOmIBPX
         I8gD5cRqhy0L2dE8oDznzgKcXFbTKQ1q7DbVoD7HFnByTnTiY6KXQVmMo/WKDyKCUttP
         ywUGO2kSe3/VSAi2gD3MPFQ0DNA3GEAGOCaLaf2VitU1VGM4gLBYXchSfjWaivdGsXPA
         gZFNyyp+klsEwqFlDis/KxQD1VtlKPlloViDnuFs/XcdtJe7rmlmXLvDmrNUcn4yHqR6
         ewdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784758981; x=1785363781;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAs+Qk9u62M+uzqXw8yZBsgtIZ8icVu/Hs2Fs2SLIBQ=;
        b=S0U7KhV71iEAn09OuZ2domqGBBeh9Bhj2DsYq/7sljmXqKh6TMf2iSC7jv6jRcemZS
         37gN/RIU6IRRxVofUbyGWGoOuJv3AtwHpV320fcwn6BWxCG4JIDK78iy44wFra6Nn4HX
         h1JAJty9J7zUTo6YGRhCc3V+Ya2AEhDQkUWLqG6rjjXLyj494uyeDM1Qy/HqHTg3xfIO
         B8X5pZGBTqtagE1biio3SAFiwr4y7tcC9J9+RwuijAd/FQmXf1tfgoF8SGQE5PyHXThV
         l92234t4aP+4W5W1lJ+udNwrccsQO8wo6xRHDnnI4EcfSqAkLTHtIG+DYK0MD+3qxXGZ
         2e7A==
X-Gm-Message-State: AOJu0Yx325vkeLS3N0SVqEIvX8pkw1Apvm5sQQg+kk5wi47ZUHnmgkl+
	hODsf6N9iv8B8g5Ox+pfuVebrpmLMKRHdIxPXsgp73ZPMvw4prETnOozuG0qnA==
X-Gm-Gg: AR+sD13dcWz6rHUGCwkvMoQG3brivNko/llPPi/nLTOJctMg3ZDvPaqTcStmkZPKdBv
	3Ea0TKMZ5sAfJ/ebBq3HQOnePdUZ90sKB0hRoR0kyjGITfJw6t5xfwHs1fBmIem+0XdmsEarspe
	USoGDrS1rNzR3ku9U1+QJW96hFVsBtb5uwRTT6UtX49Qpsob7xNXJKAVecnCCzOzmKPSapKJxUj
	BbpMhbsqZYUJnQgizNcsLU+9lUGzO88ziTMSycZyJhWs0OdEwRz1Rj8YDvIdW7MqystSXKHnNyF
	QmyDgv5OZ9z/X7AC+VtYfNF4v4rLkfzy4WNFuY/xjZFQgSDt9JYmKd8hf5lLzYciv04Tn+CfRO2
	pmatn4jFfYO1ImjM/qFfXyK2iAIT0R8hRwQeS7xfZKw11AxZn//v8WAq5VXOxKnBKLHmAbw+mnO
	xx9VqgdaCuVhyL2jiUv/Rbkw==
X-Received: by 2002:a05:600c:46ca:b0:493:e97c:216e with SMTP id 5b1f17b1804b1-49573d26d00mr3771245e9.39.1784758980917;
        Wed, 22 Jul 2026 15:23:00 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a634cf9sm109148075e9.9.2026.07.22.15.22.59
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jul 2026 15:23:00 -0700 (PDT)
Date: Thu, 23 Jul 2026 00:22:56 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Bart Nagel <bart@tremby.net>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <20260723002256.44aa664f.michal.pecio@gmail.com>
In-Reply-To: <al_hchyOdPoPWKEo@spiral>
References: <al_hchyOdPoPWKEo@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Jul 2026 15:10:22 -0700, Bart Nagel wrote:
> I regularly capture from screen and webcam while gaming. Usually it is
> rock solid, and can capture for hours and hours with no problems, and
> have done for hundreds of hours in total.
> 
> After a kernel update from 6.12.83 to 6.18.28 I started getting webcam
> freezes. The symptom is that the picture from the camera suddenly
> stops changing and will stay as a freeze frame. The camera still
> claims to be active, and the capture software (tried with OBS and
> ffplay) seems to have no idea anything is wrong.
> 
> I have found no reliable way to reproduce the problem other than
> running the system at high load (in particular running a game;
> problem occurs across multiple games) while capturing from webcam. In
> my tests so far it has taken anywhere between 8 minutes and a couple
> of hours to fail in these conditions. Freezes seem to be less common
> when the system is under less load -- for example I have tried
> leaving it running overnight when the system is under low load and
> seen no freeze, then I have started a game and seen a freeze within
> the next hour. I have no way of knowing whether no freeze is a pass
> or it's just that a failure didn't quite happen yet so I have been
> testing for many hours while bisecting, often over the course of a
> whole week or more.
> 
> My bisection took me to a USB branch leading up to the release of
> 6.15. Specifically:
> 
> ddd0172f182e pass (branch point of USB branch, "Merge tag 'tty-6.15-rc1'
>              of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty")
> a1b5bd45d4ee fail (merge of USB branch, "Merge tag 'usb-6.15-rc1' of
>              git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb")
> 
> Digging deeper in that branch, these are my results during bisecting
> (sorted into graph order):
> 
> 6623c40bed7a pass (usb: storage: datafab: Use const for constant arrays)
> bfa845994282 pass (usb: xhci: Complete 'error mid TD' transfers when
>              handling Missed Service)
> 906dec15b9b3 pass* (usb: xhci: Fix isochronous Ring Underrun/Overrun event
>              handling)
> d0b619599e52 fail (usb: xhci: Expedite skipping missed isoch TDs on modern
>              HCs)
> fe1ccba52a8d fail (usb: xhci: Skip only one TD on Ring Underrun/Overrun)
> d71cb7d6e1a2 fail (usb: xhci: refactor trb_in_td() to be static)
> 525b139fb403 fail (Merge v6.14-rc6 into usb-next)
> 
> The asterisk with 906dec15b9b3 is because it has survived 12+ hours of
> recording while gaming so far but I did see the webcam freeze once at
> the precise moment I made some changes in OBS. After resetting it I
> recorded for another 6+ hours with no issues. The other failures have
> been much faster and occurred at seemingly random times, so I'm not
> 100% sure here.

It might be that you have two different problems. Another user of Razer
Kiyo Pro reported that tweaking camera settings causes some failures,
so this may be unrelated to your main issue.

> If I take that one as a pass, the bisection points to commit
> d0b619599e52fe3e1454f7d151dedf2b194f61d8 as the first failing: "usb: xhci:
> Expedite skipping missed isoch TDs on modern HCs"

That's what it seems and it's weird.

> At the moment of failure I have seen a huge flood of duplicates of this
> message in dmesg:
> 
>     uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)
> 
> This happened during some bisection steps but not all. Regrettably I did
> not record which steps produced the error and which did not. In fact, I
> think during the weeks of bisecting I remember at same point following
> some advice from an LLM, and it could be that in those cases where I saw
> those messages I'd enabled some extra debugging of some kind, possibly via
> `echo 0xff > sys/module/uvcvideo/parameters/trace`.

Yes, these are debug messages from uvcvideo. They indicate that isoc
transfers completed with -EXDEV status, which is due to Missed Service
Error events from the HW or due to being "skipped".

I don't see any way xhci-hcd could end up skipping forever and never
clearing the skip flag. And it's equally unclear why the HW would begin
generating MSEs forever because we handle them faster than in the past.

What's the affected xHCI controller? You can find its PCI address with
cat /sys/bus/usb/devices/usb2/serial
and then use lspci. Make sure that the camera is stil on bus 2 - these
numbers sometimes change after reboot.


I wonder what happens when you enable some xhci-hcd debugging too?

echo 'func handle_tx_event +p' >/proc/dynamic_debug/control

You will probably see Missed Service Errors being logged occasionally,
likely both on "good" and "bad" kernels. And it seems that good ones
will recover every time, but not sure about bad ones. Does the first
MSE break things forever? Or does it take a few? Could you post a log
when it breaks? Caution: you may see thousands of lines per second.

> The most recent kernel I have tested on is 6.18.28, and the failure
> happens there too.

Some recent 7.x may be worth trying too, if possible, though I won't be
surprised if it's the same as 6.18.

Regards,
Michal
