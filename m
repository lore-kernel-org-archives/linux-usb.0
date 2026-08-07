Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94C244692
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091172; cv=none; b=UtYGqXJ1rncrwHe0cK95fyg2Za/NqSpF9XZkU403flbrv3rgPBTrdW49BsGucKB4UydtVhcHADM5Ykrez/wWFoDkSRPlXfPl8kbpPbf8PJOB5A3wX8juqaJvH7LKi2SanUU0Ote8TgDzvZSWAmfpB3ZYTasmsjwuKxHUI3VR5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091172; c=relaxed/simple;
	bh=Z7vDthipa6Ylvo7VqYBL9GO5DRB7L3Et6PgqOQDYTVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YUM/la3f4BQcVrjsZ8ysgVKoyva8p0O1ZpV/NLhw5yE1ZRvx3pGm7qgTSsXXoUNaCPSb/vGQm8Q7EBbiB3s7tz3w1MklVCqbTZHQCUw6PQC4rsm1BzG3ynoZKDcwI1HIRdakH+0+p7ZWuXPVqFGuzWlVkqI3Vi4YunZmjFG/98I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWAFwyFf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWAFwyFf"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2896763f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 01:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786091169; x=1786695969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2pX7LC2Dv4nC0eZp1PkLy/g4rGM6l4VE7o6yP4uQeAg=;
        b=AWAFwyFfWFixmVM8cu9CTMxRTJCxVMazaEfsnbCy5XINzC++ka3JccxJHm5h+o7MI1
         DCAtPSLJhUTpSFnL8aTnBv/uEB9s9Cy2fz6WFyacKx9BozFPPH/aidB3dqeM19n3GA8G
         kcYx9F2/CwPeWSlSRfT+clCWbMQr24hS7i/71y1xUniWdHXI2bwfsT7ggKdYqQp3j+14
         XVnajhgNaTsXjBloFZjUju0Ro+5fFo4N/kNWsOoD852G97kTkPI5+v0M7+JfE3ru+25h
         veEdf01DtKBGhvojp+CEMcN2krVGRNZF+r+mR730utVltBN22uxNo6dO9hAvrxHy9NAE
         gdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091169; x=1786695969;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pX7LC2Dv4nC0eZp1PkLy/g4rGM6l4VE7o6yP4uQeAg=;
        b=maMFcvyvTlBGqehrKS9PemD0hbLjjlI0QFsp7pgumS+vhBNa8MTe4IMV/j/fya1gDJ
         zuNxdhuF1GxwdRvAqAmKEDV6dpXIq4rfcf76YgQiy7x0GLUpFZYCGpP4WXBvRmQpSmd3
         jBXhRO9XSswEjAJdXu3UoRv27d20K38ItIYzEKq/SXEr9fFKwaSv+/RNRhEsvEswrZV1
         sECJDJSFqnj0oydej9kbfB/awiQsdatu5/e8FaZZwV7zW0rtaSFFUZuMxe8UAvkckvPw
         +8sKRidcPD9DeDMK7rR5P3P/qhr69i2eBLYJjpFFbR6Pyho2lDy3Vsdo0B2Sw+8r0DOW
         2c6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrDz09rzMvuAHJyJ0uU5xR2TmYMhBYzHnn/G+bUwV3v2H13SHAuU2u7UgGgbXpp8y6AXsJfBzCtVGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUT7Tncd8TscoNEw4fj/3osmA/k0mrQ34Vp0neidTwupOGpEED
	62WtN4yOGPcytjONDsaje2Zoq6C9iAEhsARKZyNV6o19mK7rj5B5SxF2hY6aZA==
X-Gm-Gg: AR+sD114rSv2hhPs+qbKEk6o9jf+ZkaCepltWnTWYJY2ylY3LDYWNXKDXr53LUfTwd9
	hiqv8GZZp+wSSPMGJEVOAkIoyn5h+wMzlXP59jdO7+ODP0dvzjT+AMXAHVAygkIavx5+/yNNfhO
	/PMbOpa91IUGefpLMMSu3GVv8BiMAplvHdPN/Vdlwy7K6QnA9H0qA2dT9BEja+9fFL+6KUCxNM3
	csTLCIyTV063P2y5S/4e2ssXeB4TY8S69+rnPxeab/UzgGkyFWbcDXJ+Ox2a+ercv9THhoL9fUo
	96yDClkF93relsaFv2lTk1Ij4v7zGFtKYb/LCFTAel7RUb3EdlJYdaA/oU4z17BYLcm+u9FVA5O
	JNqILnm+97ZIDl9xt4Q7mu6NQ+maMtXIhRz8KBxn1tyDd8fW/LTdE4QpBXiVd4/P6NZULlFZUQb
	Hj6MxCZpqR5Vhx4DtCl707EjuVpcHOtWcpygz6G/dLMJQMZnBZb5D4t9RHcuZBHIs6QhCVigCA
X-Received: by 2002:a05:6000:288d:b0:47f:7154:9dfc with SMTP id ffacd0b85a97d-47ffd240157mr11788485f8f.9.1786091168989;
        Fri, 07 Aug 2026 01:26:08 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm3163535f8f.26.2026.08.07.01.26.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 07 Aug 2026 01:26:08 -0700 (PDT)
Date: Fri, 7 Aug 2026 10:26:04 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: dylan_robinson@motu.com, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, stern@rowland.harvard.edu
Subject: Re: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for
 isoc URBs
Message-ID: <20260807102604.5f649db2.michal.pecio@gmail.com>
In-Reply-To: <e3c66325-0291-40f9-a87e-1bb337ce4427@linux.intel.com>
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
	<20260521152715.288995-1-mathias.nyman@linux.intel.com>
	<20260806101706.72a8de47.michal.pecio@gmail.com>
	<0e2f28f5-aa38-4401-8287-b55aab577243@linux.intel.com>
	<20260807000155.2960c741.michal.pecio@gmail.com>
	<e3c66325-0291-40f9-a87e-1bb337ce4427@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Aug 2026 03:07:08 +0300, Mathias Nyman wrote:
> On 8/7/26 01:01, Michal Pecio wrote:
> > On Thu, 6 Aug 2026 16:25:15 +0300, Mathias Nyman wrote:  
> >> On 8/6/26 11:17, Michal Pecio wrote:  
> >>> Besides initialization, it's made -1 if and only if xHCI endpoint
> >>> state isn't Running at the time of submission. This effectively
> >>> means that to start a new "isoch data flow" aka "stream", class
> >>> driver must unlink the last remaining URB of the previous flow. If
> >>> the driver doesn't unlink (or tries too late), the endpoint goes
> >>> Running-Idle.  
> >>
> >> If class driver doesn't unlink remaining urbs then list won't be
> >> empty and you have the exact same situation.  
> > 
> > Obviously not, it can simply stop resubmitting and wait. Or there
> > may be no URBs left to unlink at all, when recovering from ring
> > underrun.
> > 
> > Then HW endpoint state will still be Running, not Stopped, and new
> > URBs will be scheduled into the past, doomed to complete with
> > -EXDEV. 
> 
> Isn't this exactly what we want?

This was discussed all the way back in Bugzilla - usb_submit_urb()
kerneldoc spells out what we want and Alan was clear that it reflects
what HCDs have been doing for 20 years:

 * If the driver is unable to keep up and the queue empties out, the
 * behavior for new submissions is governed by the URB_ISO_ASAP flag.
 * If the flag is set, or if the queue is idle, then the URB is always
 * assigned to the first available (and not yet expired) slot in the
 * endpoint's schedule.

"If the queue is idle" means all completions have already returned.
Class driver is aware of this and expected to consider the submission
a new stream. If it wishes to continue the stream that underrun, its
last chance is to submit from completion, when the queue is "active":

 * If the flag is not set and the queue is active then the URB is
 * always assigned to the next slot in the schedule following the end
 * of the endpoint's previous URB, even if that slot is in the past.

These rules were straightforward with synchronous giveback in IRQ.
To deal with BH, the following was done for ehci-hcd:

c7ccde6eac6d USB: see if URB comes from a completion handler
46c73d1d3ebc USB: EHCI: handle isochronous underruns with tasklets

Dylan Robinson correctly noted that this doesn't cover submissions
from other code while the completion is still waiting in the BH queue.
But that's a USB subsystem bug affecting ehci-hcd too, and IDK if any
in-tree driver cares. (It might be that no one knows that they care).

> Lets take the underrun case. Audio playback as an relatable example.

It was my impression while testing this that snd-usb-audio handles
playback underrun during synchronized duplex operation without cycling
through altsetting zero or unlinking playback URBs (none are left), so
it could possibly be affected.

It's also possible that the only effect would be wasting a few ms
to resubmit URBs until it catches up with MFINDEX. But then, another
concern of users was to recover from glitches as fast as possible.

Regards,
Michal
