Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D3238655E
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121296; cv=none; b=P/5VkaOL39RlyvIXuTN/ZTVjs5ijA67ExZDLqRtbHQ/1vQJen1ChF3AZsKKDMpd6dCIycOenb0HI2MjxZFNVbpxPnD3P2udvAOo+orvFj4BvOJOdiI05juvIRl7rIEbZ4s4diOHEdX3eKVJWhBscD+ooblzU/6seSy7M7w368uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121296; c=relaxed/simple;
	bh=EmxIZs/t4pbaj2KGbevzEc4gNPv/70MPikAqU6Fgino=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lO4/jk9Uor9aRgy2a39Vx0QvxDziJqNyywG6K0gLDrEfKLqWdPKT0xTfUzaNLn/Ifj5gkcFg1jCjPyGF3hYyPkWnsc6T6ruTsYNnIAQHyAvZurCUFhDbj5YhpEyXpnKakA8B0KtE8Gitn8L/vclZ6IqHNqIQqdOGB1fuOUB5YUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=imItjbc0; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="imItjbc0"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e85499ffbso241825285a.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786121293; x=1786726093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjuVYqTcCHqAuGswg5tmGMiBN8OszBc3xUl+fHnlPpk=;
        b=imItjbc0FytTYJlGSX0Y8ahUBcaDd/Ewr4aYW/xsBm0NVsgJxRJ+VWnFekLVDalhLH
         28Xnykm1nOn0pWx4B/+/5pF4bspwj01MvawEjG3TNzM8nP+HUSdlnUTGgH65pbN9YRYo
         2R1FQT/tX885DkfBTLhe7bH9aEgvjvalrEtahSF2Sc0c9JDAguodcpkXcEwIDgGq/dvD
         RittkNXbRDEg+aKcMPp5m+WAkB3aC5PvCRVZ8zmOvpozAzwG2u4ZhTFode+ePa+Nk6Jr
         5FP1BS1DlFEf0PqMItCCsKfl82e5AwDCxoAw4MvaAVgACbEWsfqNclU/rgYsQdXXNrHA
         iQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121293; x=1786726093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjuVYqTcCHqAuGswg5tmGMiBN8OszBc3xUl+fHnlPpk=;
        b=WCel7b7+D91GdS6EV42Q0gAy/u6t8e5Vmh4uruhVdapR+Ca3IaowO3C9gLbkmItDFL
         sQT8QQu+NzZV3IicbqjMebXfSRvfB+usjGlvGyGRFVH90BAA/c5IgJqnavBB7+Bxii1R
         Udk+l4PLwSIF1rS0SeDv3fikIuxD1CeenRy+RAkHwo916d/r7wsTu03adb3p2wSuhUcU
         G+eqvP1RXLpvH9KDDgHPeN+pzMznzD6o+vzo9WtEwTfXwakZBwiM1w+jZ+U5bmhNptyb
         OFLagBk6wQ+2aVjrx6w65TOTtKLiOS/VfRhPSCWPlN0SvUMEI6fS1EOGUY4N6csYfl7w
         bz8g==
X-Forwarded-Encrypted: i=1; AHgh+RqAQU0RIkk5hONHh6nDC7M83SgTvYNIgadydVGCdvV9p7bN4DH6DGk7uXkOBcvP1DnYkUAhJrmGRIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUiCg3R/qdyigEOiwPhCAWURaLfSnlmJqkoqmc7eR/bGVgdzac
	13bD9riTLCSbh2WbJkfesKZ/2/dtJCXz8BMwZrL+rWDg+5eHuSpvjbYOAzercoFLAw==
X-Gm-Gg: AR+sD135328KOGyuoaQdQYc1vK0eSXqwwdDO5iaz2UngGh+dwfD2aeU1iIwSjfEUZ09
	dZxnEq18sdrm0d9OkESjTG0W+npqQZUSM0BfQFJyPDAO20SDbRBBh/P9ek2hE0KMWVHJ4roSMkN
	9fFZtro8/9Y7JbwGW8DcMAxwnZP/SymRrDX1IqUU7l1bTeLLmHuAY+99RVxXRv50486DDQlAcs9
	T8UzRd4Zm4My55xEjuYXd+RFmVJJWPL7QmWWwfrp0AYgSdYnXK7ag9jF6uY14PyuG8hHyo8238X
	TVwxsWKSr8Lt1v/XF3zVICKxspjAIq0y6TVhHZVFTnyYZ110fahhFY6xfK9QFUOmo/c7IT1YNlA
	OofHhw4F8yW5PseoFjcbVbzmyDB94j5/afYIodsDr1KQ7b4P3x2VW84JYkinRTYy59+olB+rHyl
	l8Cg05+Jd8tMt0SZOksX8JqDt8fXG+7bzX0qnOk1hfJquGGz5rgYES31fT1P+Pzw==
X-Received: by 2002:a05:620a:4014:b0:932:ddff:123d with SMTP id af79cd13be357-9366655b12dmr1161383285a.29.1786121292462;
        Fri, 07 Aug 2026 09:48:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e0c17fasm188094485a.21.2026.08.07.09.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:48:11 -0700 (PDT)
Date: Fri, 7 Aug 2026 12:48:08 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, dylan_robinson@motu.com,
	linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for
 isoc URBs
Message-ID: <7d514c0c-cb24-4d3f-a9a6-8107cc605bad@rowland.harvard.edu>
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
 <20260521152715.288995-1-mathias.nyman@linux.intel.com>
 <20260806101706.72a8de47.michal.pecio@gmail.com>
 <0e2f28f5-aa38-4401-8287-b55aab577243@linux.intel.com>
 <20260807000155.2960c741.michal.pecio@gmail.com>
 <e3c66325-0291-40f9-a87e-1bb337ce4427@linux.intel.com>
 <20260807102604.5f649db2.michal.pecio@gmail.com>
 <310ccfe5-0212-4c8b-9213-891a7340e2f4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <310ccfe5-0212-4c8b-9213-891a7340e2f4@linux.intel.com>

On Fri, Aug 07, 2026 at 02:10:35PM +0300, Mathias Nyman wrote:
> On 8/7/26 11:26, Michal Pecio wrote:
> > This was discussed all the way back in Bugzilla - usb_submit_urb()
> > kerneldoc spells out what we want and Alan was clear that it reflects
> > what HCDs have been doing for 20 years:
> > 
> 
> I'm doing exactly what kerneldoc and comments in bugzilla state.
> If queue empties out we schedule the next TD based on URB_ISO_ASAP flag.
> 
> The logic is from Alan's bugzilla comment. I'll quote the beginning here:
> 
> "When the queue underruns is exactly when URB_ISO_ASAP is supposed to matter.
>  If the flag is set in the new URB then that URB should be scheduled for the
>  first slot in the future, leaving a logical gap in the queue.
>  If the flag is clear then the new URB is supposed to be scheduled for the slot
>  that follows the preceding URB, which means that some of its packets will
>  never be sent because their slots have already expired.
>  This will still leave a physical gap in the queue, of course -- no way to
>  avoid that -- but it will maintain the logical alignment of URBs and frames.
> 
>  Thus by submitting all URBs with URB_ISO_ASAP clear, drivers can help ensure
>  that the queue remains synchronized to within the limits imposed by the host
>  controller driver.
>  If xhci-hcd doesn't behave this way then it should be changed."

This quote needs some context; it applies when the new URB is submitted 
while the queue is still active, for example, by a completion handler.

> So I changed it to behave this way.
> 
> >   * If the driver is unable to keep up and the queue empties out, the
> >   * behavior for new submissions is governed by the URB_ISO_ASAP flag.
> >   * If the flag is set, or if the queue is idle, then the URB is always
> >   * assigned to the first available (and not yet expired) slot in the
> >   * endpoint's schedule.
> 
> > 
> > "If the queue is idle" means all completions have already returned.
> 
> That's an odd interpretation of "queue is idle"

Michal is correct; that's what it's supposed to mean.

> This would mean that an URB queued after "queue runs out" (underrun)
> should always be treated as USB_ISO_ASAP case, making the flag useless.

... useless in that situation.  That's right.  The flag is used only 
while the queue is still active.

> Isn't it more likely that 'queue is idle' means 'not yet started' than
> 'class driver intentionally left it to dry out and underrun in order
> to later restart it, assuming it will restart ASAP on next URB enqueue
> without setting URB_ISO_ASAP flag?'

I don't know about likelihood, but the fact is that "queue is idle" does 
mean all completion handlers have returned.  Of course, this includes 
the "not yet started" case, but it includes other cases as well.

Do any existing class drivers actually rely on documented behavior of 
isochronous queues?  I have no idea.  In fact, I would expect that if a 
class driver wanted to stop a queue and restart it later, it would 
switch to altsetting 0 in the meantime, which would eliminate all 
ambiguities.

The point under discussion is really about what happens when an underrun 
occurs by accident -- for example, if the system is temporarily 
overloaded.  In this situation there are two logical choices of action 
if the class driver wants to keep the queue running: Keep the alignment 
of iso_packet_descriptors and (micro)frames as it was, which means 
assigning some new packets to times in the past, or forget about the old 
alignment and start fresh, which means assigning the next packet to the 
next available future time slot.  The URB_ISO_ASAP flag is how the 
driver communicates its choice to the HCD.

On the other hand, if the class driver doesn't respond right away and 
lets the queue dry out totally, the first choice becomes invalid.  After 
all, if the driver cared about keeping the slots aligned, it wouldn't 
have waited so long that the queue became idle.  And besides, there's 
no time limit on how a queue can remain idle before the driver decides 
to start using it again; we can't expect an HCD to keep track of the 
queue's state indefinitely while it's not being used.

For these reasons the URB_ISO_ASAP flag is ignored if the queue is idle 
-- meaning that all completion handlers have returned (because 
submission of new URBs in an iso stream typically occurs within a 
completion handler).

Alan Stern
