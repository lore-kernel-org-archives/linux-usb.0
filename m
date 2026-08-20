Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A51C4756C4
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787234928; cv=none; b=VBQE6JqlBMXfg0ZpPaCDltIWeNRAT2TDtXbve4/5XQUkCwm8DG9PXxsNvRh3iLqVddHYFlQiIXcA2uqqzk8mvSZpkQZn8v+yDRrZODT4LxJmw6nKOLARA6ApQgB8pULglSMPCsYqgUxHcMIHeKno2zfHSZFFsi+ZeohH0jmGvak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787234928; c=relaxed/simple;
	bh=vnIM5C5oVv6d96BpEn1Zg12+1o7YhUlUVPJYUvIoR4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyO77vrDXDNDosfctwxCWPUB+vmyS815d1N4UY347XhndMKvllIz3s/Z22GaDHHD863K/FaiQibaB3ebEBLEewLt5rUZymC2UPUV4hxbafBvgsSOZWo7XK2dZt6BLnNbD27B5eLfLwLxTeWiY6B8mVxQH0PaEPjDnvKsVX9yH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sE2Mw08b; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sE2Mw08b"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e5c9211d2so189677485a.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787234926; x=1787839726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BUHQsHuchonrURkQxPgRCit1CwRXgu+2A987yAr3ygo=;
        b=sE2Mw08b73xAEg4/Aektfq55SblLKmeGAjPs2zBsPdYlVMkrhBK6/qlVbomKNmJWpD
         /SPdRUk6PppHfIlqbAMdK2sNnd3Y/pqH/IKhAHt9EjjzzIDeugn/jCxGpFGm/FaEQXhm
         Tyh76yy+AN5pkn7QzMiW5H1VrG8kqqreIF5du6/evN0CZ9cHk2hvxZWAVj1SOlKDjO4J
         6KCR3Ja6Ornb2MVT9t4skVwJxdH9Tz1XjzpeEe7yYWpgkyki4ELusA2Am1qzae3/3Rir
         mcyKvuKYFgNTaa8Pk4oiBKriGNvLlq36/IHz9Gw+4ErznkWAzOVqcNAuC9lW14HopiKA
         9E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234926; x=1787839726;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUHQsHuchonrURkQxPgRCit1CwRXgu+2A987yAr3ygo=;
        b=QfMX6kh3dnxs46pkfimfJeFcayNBffvdkaSx1/Tr9L2EVt9yy0aAGBa8HtFB9NQgYW
         JWsk6ItYGa0KZMM8bNVZanQXsGSRdt6i6+T/MUO9UC3YJpunE/r2NtuB7p8AmYm0R0TT
         G1n0KRIttoTCgkM3druLlMZs27LWcI3cIef7H8nrmz1MV1kacswbc5N+vTtfBIndPTO7
         JfMCIboWxL4Vd457MBKN+QH2O/rQB2JkcBcGIaq1qSKayivoAOjuvAe4qPpaWi04+yGM
         /ElmEgdyxwGkMbJ6L7u7ZMQs0BbhjRYkylDuXokhiAQTx5j9At3e68KVFd6dm5NvANgE
         EnRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrat0Mep1OW+CMFDmwuim2E3C6GlrBSv9pUMrlzEWYYOBV+2o7J2/OqADT5CpIZkX3WcCGv1+AmZTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YysUyvIEbjqHQhoAxoV6Mq427hnfKm6Zyl+GhB8tw6u6IwXYDrp
	3xtzqPnj8ztQfLnaqs9KwxlIYC+ENOwwhbAkJbnJxF9lFZAav/fBqSY+1OXMkeX2ew==
X-Gm-Gg: AR+sD12KY5gOp0WyziWI8moxUC16ScO+ZDbMyGFwanu8fLSiakYSEnCUR/GO3RoK2hy
	2CVsGPVjc4a/yKQiaEjbG6LCb4RRYnkXycq6jXNS1yuAH6M/3OTudsh+/lcp/lwAIi2F6cr4wdx
	UHODJf6uaUL9vFxYzmGHw2F1LAvNnRaWa565Hs1LJbVmL9uzic0lWhlmoiGgbUWKQIqDOFTy/P1
	qni1RiNRuK516sxS2ZiLy6pEy7LYtEwCFueksB87ahLC8wE7JkOAYi50YeuVeZ5og+lg0fp9BEF
	gvx+8x4bL6Yv1vLcg0jASHpy26d/cRmiuzFge0tZqZKLvD0whLnsR3e17BEAefrVG/56hX8qd8i
	as3/v+uIsifLiUEBIKBDSbeId6VKknInD5Uf/R3PVKN7cAImqL5agk5VX9vheVUfXA5weGa6M+c
	wwJ5KYATeQSnFX3y5OX6iCEwPcl1ezf0lZP1yc35Du2yp7hQIwJO0HhVbsMiwXgRjPCl645iW5h
	t0YqZoWROUy
X-Received: by 2002:a05:620a:460d:b0:936:7a55:f3ea with SMTP id af79cd13be357-9371e1de2b1mr1107961185a.8.1787234925972;
        Thu, 20 Aug 2026 07:08:45 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937204aa8a6sm374906685a.11.2026.08.20.07.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:08:45 -0700 (PDT)
Date: Thu, 20 Aug 2026 10:08:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
References: <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
 <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
 <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
 <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
 <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com>
 <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
 <15185c2d-4544-42cc-ba0a-79dd36e82a21@rowland.harvard.edu>
 <CAFmvuTU=t5TiZSpHmF1MXpVs+3K7G1VOTDeeazwGru4+1eozBg@mail.gmail.com>
 <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
 <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>

On Thu, Aug 20, 2026 at 06:40:19PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you for the revised patch and for your kind words about the testing.
> I applied it as posted to upstream v7.2-rc1, commit
> dc59e4fea9d83f03bad6bddf3fa2e52491777482.
> 
> I did not reproduce the previously reported ep_unlink_worker() UAF with
> this revision in the same directed cross-CPU diagnostic. I also reran the
> original null-ptr-deref and UAF reproducers and the reproducers for the
> earlier candidate-patch regressions, and did not observe their
> corresponding KASAN signatures.

Excellent!

> > Nor any of the old lockdep violations, I trust.
> 
> In the matched runs, I did not observe any of the previously reported
> LOCKDEP violations or any new violation attributable to this revision.
> The only LOCKDEP warning I observed was a ctx_lock IRQ-state warning that
> was also reproduced in matched runs on the unpatched kernel.

What was the cause of this warning?  If it is sufficiently 
straightforward, maybe I can fix it as well.

> > What happens if the aio is cancelled exactly between ep_aio()'s calls
> > to kiocb_set_cancel_fn() and usb_ep_queue()?
> 
> I exercised this exact interval by pausing the submitting thread in a
> return probe for kiocb_set_cancel_fn(), before control resumed in ep_aio()
> and before usb_ep_queue() was called. I released the submit path either
> when the return probe for ep_aio_cancel() ran or, separately, when the
> return probe for __x64_sys_io_cancel() ran. Both release points produced
> the same results described below.
> 
> When I allowed the queue operation to succeed, io_cancel() returned
> -EINPROGRESS in both the PWRITE and PREAD cases. ep_aio() then replayed
> the cancellation after the queue succeeded, and exactly one completion
> event reported res=-ECONNRESET.
> 
> When I forced the queue operation to return -EINVAL, io_cancel() again
> returned -EINPROGRESS in both cases, and exactly one completion event
> reported res=-EINVAL.
> 
> I also tested a 64-byte PWRITE for which dummy_hcd completed the request
> inside its queue callback. io_cancel() returned -EINPROGRESS, and exactly
> one completion event reported res=64.

Good, that's exactly what the results should be.

> None of these tested orderings produced an additional completion event,
> a KASAN report, or an Oops. In these tested orderings, the AIO_SUBMITTING
> handling produced exactly one completion in each case: an early
> cancellation was replayed after a pending queue succeeded, a failed queue
> produced one completion with its error, and an immediate completion did
> not produce a second completion.
> 
> I hope this answers the remaining question.

Yes, it all sounds good.  This patch is just about ready for submission.

Alan Stern
