Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F480388E5B
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 17:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786643569; cv=none; b=nDDnrjvC8bapHhR4JTRbPzyb3c3gMoObj/mIGbHJMPz1He9+0hcMLqCcmhLyqN94eLKpvA09EINVntPIEpF4MhB6e9+F++EUtjnMojyfhGQDZBHeC0DPtl/WZvoyM3uvCX8oZuHKCSjgbWvUcIZO0X4s9YstAlZiN83OB9pTo8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786643569; c=relaxed/simple;
	bh=domaIDnKGqJRZJMOqg/gSdAVYiVLhAEa+GgYrii1zjE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6Uq1rHNjwcOLsNyDScba/IlpXzQKJ/wqo7/H4/sWvrq94BA8zwGhrjPhxSYXqKFmUuYqEym7d7azVRFfPixnitwcTnswbgfQrVdc9xMggo4lmKvYU95sTC8hVcKLgOxLKQDZl1TqiE2VB1GhY0UfO2rk01p9R8yDnPXpQiR8N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fS7gM15M; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fS7gM15M"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954dff6536so1739255e9.0
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 10:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786643565; x=1787248365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOW+A4+gqZ8PDgKAjvS0HnAFe0/fB45pzhyMn/HbqkQ=;
        b=fS7gM15MWX2ts3DXuPh2QiQFHiepwxW+hWmyJTKrcDBLb40heAmwTp4tXvG4IWWPt3
         3uyNjCFTfRNDeRRhADDObWuMG1U1ykWkjmq62ZVGUfSV+NsDR8Z+Ayq9jxgSw/+k/xJR
         LzgL8TJDON2QvffYA+VPMU5xPrsSAXvEj72B7frZjx8nmqH1evBR66OkE0nM4aGTXnLW
         wDdWJzzAgEGR8rGBa17iEc+cwZeVWwNb2tWB4YjlJt3qHiiGSLYQewOZ/1snOViX6/YI
         Dn9Jcm2RHmf1RJ4T3BYlarm0KZCx1cPP5I3uwXqRajr3Ah2GIh//ljGUO55AYvBUc6CR
         W1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786643565; x=1787248365;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOW+A4+gqZ8PDgKAjvS0HnAFe0/fB45pzhyMn/HbqkQ=;
        b=fEl1YnE8paBXkEoi76LfkBWLM0ciU3UfHKgweyXCOtYvMzbauYZzisoLkP9y/dhUt3
         kYVTN34W2F9gZmEWHrRQ9ctFuybubb6OfxnXBgiSqFrTuGADwj25QlLQZkt8PgjOCIk6
         NHqBF9lA/8m3uBUHEO/t1XGKa11UTpN599xT3bCIFApyx9ENdvFtMyk96G4m8u6bFu5C
         r9qDUg/jOmUMgUrlEs640KzuXP2fA/meFV0i94LOme+4ZB4/Q1519cVM0slnghIAw7cq
         L1PYLpmJCjxRfjP0/XWiHD5i5ty8ta7eiAUqraexU67unDsWcXYxKDPXK1astu8E4SFM
         SIww==
X-Forwarded-Encrypted: i=1; AHgh+RpM84Wbr2EJWU/QFP1mm8kiwqDlgLX6R/cVCv3VkPIsAKFfKRzTNC5ILwcVtYHSGwrqqop8Kfd8Uqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQydcPpW6EUJu3YNqd82PFi0615I6mIM2kdAdqHo80mKdZjYWM
	jztYUyYQhYXz9QsEfy6Fv7o1UgkP5G6oUKkYLubZb+ho1VCA30cNN2Lf
X-Gm-Gg: AR+sD116vp5OhDoOXX83O8ketalg+Q/Aph4KteLb+hUguKGfL6/w4bMQtJ51PyPdBEy
	cVNhPU3bwgXeLD/EsGev9+YPMmyEF6KSl7N+9FVuGlx81mpDDqtOhIck672racRTgTrbediAhCs
	+a4K3O5CSANVdR63U/snnQz7u4X+K98SF93QBOgruKRBLAlKQVOe7ct2MjcQDbrE36yTF+eERO5
	qiUSazsfHUdbPOWrJv11QhP+OnCiFIHyEYI7IJek0USlaKf5tLVIAeHBA/znORbrTnUzq1b1hxD
	KzovJKeEVlJCfhSNZ3jMt0zTZloqiXVGHn7bWBwQIryYq7jrDuzCYo2iwWj6X2RdkbMY+dSGlt8
	5Z5auDS4OIP3NEoDOr/V+qI2NskdprqYwTtWkildYUt7B88KAyaaaa50ZdLIhjGKWqR2xB0NYPv
	jMjLEqhWiHlp3iX7jPOivY6Z+4bE1qyXBiSs77Du/gsz5SlyQOdbm1wXaXuLzgsr9XphmwhiDcw
	83PRm+FqyP+siyACA==
X-Received: by 2002:a05:600c:1914:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-4998796a1e1mr2402815e9.14.1786643565193;
        Thu, 13 Aug 2026 10:52:45 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499877d20fdsm4493935e9.1.2026.08.13.10.52.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 13 Aug 2026 10:52:44 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:56:56 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: dylan_robinson@motu.com, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, stern@rowland.harvard.edu
Subject: Re: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for
 isoc URBs
Message-ID: <20260813195656.132ba1c9.michal.pecio@gmail.com>
In-Reply-To: <27c1fc3a-6122-4658-b5df-567eeb66284f@linux.intel.com>
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
	<20260521152715.288995-1-mathias.nyman@linux.intel.com>
	<20260806101706.72a8de47.michal.pecio@gmail.com>
	<0e2f28f5-aa38-4401-8287-b55aab577243@linux.intel.com>
	<20260807000155.2960c741.michal.pecio@gmail.com>
	<e3c66325-0291-40f9-a87e-1bb337ce4427@linux.intel.com>
	<20260807102604.5f649db2.michal.pecio@gmail.com>
	<310ccfe5-0212-4c8b-9213-891a7340e2f4@linux.intel.com>
	<20260813005635.34750f8c.michal.pecio@gmail.com>
	<27c1fc3a-6122-4658-b5df-567eeb66284f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Aug 2026 16:19:13 +0300, Mathias Nyman wrote:
> On 8/13/26 01:56, Michal Pecio wrote:
> > This does make a difference with snd-usb-audio. If I run
> > 
> > jackd -d alsa -d hw:... -p 24 -n 2
> > 
> > Ring Underrun and Missed Service are reported every now and then,
> > sometimes repeatedly, and it doesn't take long to enter this loop:
> > 
> > 1. playback Ring Underrun (xHCI EP state is Running)
> > 2. capture URB unlink (xHCI EP state is Stopped)
> > 3. multiple capture URBs scheduled to the same start_frame before
> >     EP state becomes Running  
> 
> agree, and this needs to be fixed with something like:
> 
> -       if (GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
> +       if (list_empty(&ep_ring->td_list) &&
> +           GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)

Sure, it fixes 3, but not the "4, 5, goto 1" sequence below.

> > 4. new playback URB is scheduled into a distant past due Running EP
> > 5. 2 uframes later OUT endpoint reports Missed Service for all
> >    those misscheduled TDs
> > 6. goto 1

Example:

AFAICT, notify_xrun means userspace didn't submit new playback
samples before the last OUT URB completed. No OUT URBs are left,
endpoint state is Running-Idle, the driver only unlinks IN URBs.

[300299.231743] usb 10-1: notify_xrun 01 from 577
[300299.231749] usb 10-1: Stopping data EP 0x81 (running 1)
[300299.231815] usb 10-1: 2:2 Stop Capture PCM
[300299.231817] usb 10-1: Stopping data EP 0x1 (running 1)
[300299.231819] usb 10-1: 1:3 Stop Playback PCM

Some time later, IN is restarted and scheduled 0x11 uframes ahead.
On second submission we see the "ep state not yet running" race.

[300299.233588] usb 10-1: Starting data EP 0x81 (running 0)
[300299.233616] xhci_hcd 0000:08:00.0: xdebug ep 81 uframe 0f47: scheduling new stream for 0f58
[300299.233628] xhci_hcd 0000:08:00.0: xdebug ep 81 uframe 0f47: pending URBs but not running
[300299.233705] usb 10-1: 12 URBs submitted for EP 0x81
[300299.233710] usb 10-1: 2:2 Start Capture PCM

Then OUT is restarted and mis-scheduled to a random uframe 1018,
far away from IN URBs, because xHCI endpoint state is Running.

[300299.233713] usb 10-1: Starting data EP 0x1 (running 0)
[300299.233722] xhci_hcd 0000:08:00.0: xdebug ep 01 uframe 0f48: running without pending URBs
[300299.233726] xhci_hcd 0000:08:00.0: xdebug ep 01 uframe 0f48: mis-scheduling new stream for 1018
[300299.233739] usb 10-1: 2 URBs submitted for EP 0x1
[300299.233741] usb 10-1: 1:3 Start Playback PCM

And this smells like regression, because the original condition was:

if (list_empty || EP_STATE != RUNNING)
	start new stream

so the driver would never *fail* to start a new stream when no URBs
are pending at all, it could only attempt to start a new stream while
URBs are pending, due to the pointless EP_STATE test or BH giveback.

> > Changing the condition from "running endpoint" back to "empty list"
> > breaks this pathological cycle. Experimental patch below.
> >   
> 
> But this is different from incorrectly assuming a new stream started
> mid stream just because list_empty(&ring->td_list) is true and the
> urb completion workqueue isn't at this instance processing a work
> item belonging to this endpoint.

Yes, this behavior is inconsistent with documentiation and disliked
by one out-of-tree driver developer (probably rightly so), but it's
been this way for over a decade, both in xhci-hcd and ehci-hcd.

And it doesn't affect drivers that resubmit from completion, which is
apparently good enough that people stopped complaining when Alan added
the "or completion is running now on this CPU" hack.

If somebody is very bothered by this, it seems it could be fixed, for
example by counting submitted URBs and having the BH worker decrement
the count after each finished completion.

In fact, I wrote a hack which does this for xhci-hcd (by replacing
the complete callback with a wrapper that performs counting). So
far I found no case where this check makes a difference, but finding
one could become an argument for fixing this in core for real.

Regards,
Michal
