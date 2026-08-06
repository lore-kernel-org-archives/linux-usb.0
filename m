Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C432C21D9
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017541; cv=none; b=AWOSixUd9WvYBK9yvYFGQCRh3h9qFrBadenwhAgQ7mEfqK6DVArLBn+rn0hKPPufb1uDyp4R1rZtquu8rlt2iFrQeG11lHAf33SqAonkdksA6a4l1FFCz18cJzE5ECo6oMGPTvEucpvQhQX5IZOFmRiyR24MGqQJTRi3FmNEzYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017541; c=relaxed/simple;
	bh=Z+ld2b+Dr2CpKS/OJt9qPu+I37sDQbK906lwsDw4S28=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hu9mxf46kxmvuVG4+WnSV37Y7Q/KUJ1M19I928Xz5CLygbwGNbaMFXzXRGOLbmCZ0pcqvg/fhJonEtaNQRbXo+GHzKEJc4QCpullPpydIHO/RkaBls9Fa1BWvJeQ29eBFG6wGzToOZ7USyDdq60PZhj5B7MIwAKw51qbiv4bBC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4Pwt5Nf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4Pwt5Nf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49800c6a846so17451145e9.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 04:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786017539; x=1786622339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ptXhLWfvMsp8AZZpS/ZrK5hgkb0/ICL9kLS+no1X3Uo=;
        b=j4Pwt5NfW2pBk+LBv8sFE1sLmNySUgO++vuEqkL25SPs7b3R3+pEVAApmDETzur3KA
         u9D4PJ1SVZV3EboGbIFfPA9ZHezIqEQvfGeKBaPXke5mzHmnk5kvScKmAmHi3+ztgqLc
         D2Lvn7nq5qnTUX9VzqT3Hhh2mc2JHsBgbBug1EcC3KamCmzuIAZ4tAvDvkV8Lbcc6WP7
         w4KscwgdVtN8fzBsGEMDa9z+NpjdWyJlzSKNisPznwaFQ2YzXz8N3WAcJMV9/CzbR5La
         NVeyx7wt+Tsmc2wsauaHbkzPdfLSk9SAWnmBwg9Z6uHelbh2rTmeO47+pbrlffzMxVNv
         S7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786017539; x=1786622339;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptXhLWfvMsp8AZZpS/ZrK5hgkb0/ICL9kLS+no1X3Uo=;
        b=Gs40xStZUddMpH7SlWxSsFV1goMvGG9pc+aZgrov06rv/3S3Z2JwEDTxUsDGBI3pTb
         RC4k+JA6BkYjo/NU5vaKDbiq+NtFS5GfuTmC4NBZvO7GdZf+YQf9DAS63JhxJ+/0KJ2E
         T7ALHb/M54QFpzVn+n668zghr0dcP4TfqMWnOX8j2Y4sKAfozfqo62lPF9i8z15IVoyn
         ozsMpULvNtFkH3lE54lX/Wq5IzRJ1VWL5rP9B4m1EnNODZQyTJEvVoLqZQ7OaKTrPwdq
         7JFeZPiFtfCWD4oswXENKlHwS6AxRam0icr5NV2imw3I/xQK0LzEtgIMhMnXCBbZRUeq
         A5qA==
X-Forwarded-Encrypted: i=1; AHgh+RpzOtVjZqFgoWgjryYCdE1Fur7zfO9hazigx5j2H+uWzh352uCmHaPsZxZDuzY/1TNghptywR85zd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Q/S8P6jxc0MOvrY5xMA4izq95dM7ivlDSSiELfJSmIJBET1G
	PtAV+yBQgVa4YWTAY8tes78d9301fSCPKW26Ng8XwPk3UIflPAi1ZCHy
X-Gm-Gg: AR+sD12xcJJanmrJO7HDb5PHmAnSFqmDQn8LPKQH29StUWRvqaSG2DDv/fC6u6TOKgM
	ZWfNryZCEoeVXlsv+GPD9B3J2fGBTNRAa7CSI0esIq5apFswmVTLATItkjoUxAfpIy6ZpKftUYZ
	8i0RIjY+eHybVAExW1SAoV3cERUnxFPiICPrxIFTd0DyRv8j23x65MRHBcT5E8dqhHucKptF7A6
	q2gUnN/P7mO+tbjtvy7JaFikXlOH4Hg8YRWjuWCOA3P5vQVV5xCI045OcwvEV+LTPz2eYsqgFtg
	8JjdtGoqu//QiM9ku/O1co8gNkiCdB8wKqZ3/UxwX1rKl29o0olDypbwYBLOIuNFPpvUKcJvI1M
	Aa49nZzECVc7ZxeEKVCtsW0BNRdttueAVCoe3wkXp0teZP5kJyrmm6Gn7J08qU0apg5mndyquay
	zFSYFuKYcC0FTn09J4aaR0gA8kW+1bXNBVjuCJAfzJiFB1sJfFCsG3gS4aHGfMol16XNhrk8+n1
	Dmt/6VVz/A=
X-Received: by 2002:a05:600c:190a:b0:495:7a04:b006 with SMTP id 5b1f17b1804b1-49959e0e2fdmr13559875e9.8.1786017538563;
        Thu, 06 Aug 2026 04:58:58 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995422b6f4sm100837835e9.13.2026.08.06.04.58.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 06 Aug 2026 04:58:58 -0700 (PDT)
Date: Thu, 6 Aug 2026 13:58:54 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: xhci: Simplify moving HW Dequeue Pointer
 past cancelled TDs
Message-ID: <20260806135854.2441ac51.michal.pecio@gmail.com>
In-Reply-To: <fd8ed109-2183-4160-af9e-4a74bda8c020@linux.intel.com>
References: <20250225125750.1b345e2c@foxbook>
	<20250225125939.7a248e38@foxbook>
	<b82f9543-2730-48af-81e8-1612b0d30ed9@linux.intel.com>
	<20260529125318.611b2625.michal.pecio@gmail.com>
	<fd8ed109-2183-4160-af9e-4a74bda8c020@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Jun 2026 13:45:37 +0300, Mathias Nyman wrote:
> On 5/29/26 13:53, Michal Pecio wrote:
> > And one more problem: unconditionally advancing enqueue past a link
> > TRB creates risk that enqueue will enter deq_seg if the queued
> > command fails, which breaks ring expansion later. If we care...  
> 
> Enqueue is only advanced past link TRB if ring is empty, and both are
> then set to the beginning of the next segment. Ring expansion isn't
> an issue here. This is done to avoid moving dequeue to a link TRB.

This is the code:

+       if (list_empty(&ring->td_list)) {
+               if (trb_is_link(ring->enqueue))
+                       inc_enq_past_link(xhci, ring, 0);
+               ep->queued_deq_seg = ring->enq_seg;
+               ep->queued_deq_ptr = ring->enqueue;

This checks for empty td_list, but not for dequeue position,
so it can move enqueue to the beginning of ep_ring->deq_seg.
New URBs may be submitted before the command completes and
ep_ring->dequeue is updated, so ring expansion check may run
under abnormal conditions.

Now, I looked at xhci_ring_expansion_needed() and I think it
would consider the whole ring empty, but somebody could submit
a patch to optimize this function (use segment numbers and
TRB offsets to quickly calculate enq-deq distance) and nobody
will expect that this patch may cause ring expansions when
Set TR Dequeue is pending on a ring with no TDs.

And if the command fails, the xHC would progress to the newly
linked segment. Though to be honest, Set Deq failure is always
a complete disaster anyway, so I don't know if it's a big deal.

But any potential issues can be trivially prevented:

+               if (trb_is_link(ring->enqueue) && ring->enq_seg->next != ring->deq_seg)
+                       inc_enq_past_link(xhci, ring, 0);

Regards,
Michal
