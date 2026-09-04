Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF951FCC0
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 20:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552616; cv=none; b=XtR1BKjADm6n92EoOf8pMuFRUijQG2XK84GhOc+hNztQ26J9NKCXhFyu2g6N08ISNIa7/v8aORl6GQtvmdzEpYNEzBexip5yiTZxJab9PIUHIMpcShfmkL4ZbaYDlbn8lSGwMjgpHMdmnSIaqZIie7TLTW5YbG7BRFtNnJA/2mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552616; c=relaxed/simple;
	bh=LbnGFeWWs+TsgLAYv87ny3UAH2zYj9/qtZT4Ag6c/lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMARlDlHE9710aLY41MWFAQnNkdlxBrIUHtP6a72/ToiTqgOEm9RZ8Pch7KrTuDDtWsyNiDXbtsID/QVt47012+m19uATqJJkbkCLo8Dm4oMmx7il5DiEDYJ+ED4E+1FjWDrNUSTVK5mmrq/rcb7hT5SlBKD/RscvQxaFn4ETG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BmSSq44n; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BmSSq44n"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93900ed2925so121631385a.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 13:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788552601; x=1789157401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T9CNgWjbt7ef+8FMX6LnCv6P10Cc+jpnjwbdViiMfNc=;
        b=BmSSq44nAl++oWp4sUWZxHzEp/uKTuW8/7gSg9qmgSZHdvkKzo72v+wwewXGznI+NC
         6gnCvI/Ik9aIrfYXW49qcB4MEYGu+VqHX1AFTKNFyPO8fLmtMeVo8X00cx17+qfBm9oz
         p/mxMGLiLb5fjDWKiBH+KvcdCqlI0nzA1/fVEWoqAywqltHEre7r0MuUGfq609qn7Eqb
         7WmLKDYdACREP2Xf+YRjEhvvLdgaWIqtDj7VQ43adNbO+D9pKjedYGNzkTY9+H7D9Q6S
         nZsCNYi7mo9K8qS7ivgKbmPIFZ0f+KUswBlEUF963OePpaC14/3hGtbvq67H1Vy59Bi8
         MSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788552601; x=1789157401;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9CNgWjbt7ef+8FMX6LnCv6P10Cc+jpnjwbdViiMfNc=;
        b=p78Ully8vEJmNtvk+1oQ5A/rtBNWmNx6WNdbdZkpRiONWjQGUvZRJKYi56+myDOEau
         qurZ39R4x9RR+3SrEfBheAxYQrHA8ebUYqfjO84rTS0nYtNfEdlF2R1CYhRMmYvewFHC
         d8zSwxExWiphV4Y0vUtjm8nDrZATsV3YcosivOuygiG2+CVuRHYB9h+Che9Od2Z2g49T
         qCorICx75QirrmxlhM1qzwXiEMyB0gm7fFcc80RNuYxDKd0CnkJN5x95YCoL0VObaL6/
         tIF4m1FN0kb6a8TnUfpk+D2vst84As6n7W2ZmYXx3JOqdJqBe5qRAu0SN9/ZgagiVSDc
         H3UA==
X-Forwarded-Encrypted: i=1; AKwUvBxNkFG/8HtqSqgHisprtTDe9pxMTDW81FPFsFQT754xWYJTNDV4PdQbPkOMWGqed14zDocuiyIANM8=@vger.kernel.org
X-Gm-Message-State: AFuF++ll+m5uWI4KhOmW/zc5yF2DIHZhwOtXnx1fX1tnnepqPH4H9I5W
	hNjZu38UxzTM7zeglX9ltv69hsnz4x2rUE7jMcefTcvbERGfFr8+GKQtHJ5pYaCdSQ==
X-Gm-Gg: AYBFou376m9SP+tAJugIE0Jqwx74gt8ffD5Vz6zAdxlLmQ73VpyCyqFioxRCeENIKKg
	tzx5vhHNPaMNWKXkthPRWyaYEOJpnrRVmX5U9AgbDbvfqEckJycLcCNt3hW+pXwfxnPiN8Wx2Nx
	T6QCAljRXeoTtD6YeUhcJeSQFQq2DKYwutaYJWxz0wvKD5Ixdo+MLd4NKF9b0csZHtaKbeMwCRH
	jBCBY7LwtHQcbyxkcZZRHs5oFvjV5CwVQ6kDmVQUutmjOaZEJE3yRtXlIdc6nymKdrzQcXFonnh
	nbr0WyBkbask+nHDTYeF7i9GZuk/PcIUZCb4Uj/wjF+mbyl4EO2TFTWzVXVOyXsiTcDEVXKIRWQ
	rb0WUny/1TKyIxlLVyAT7A68fyNWL/zICgPmcwWZfFgS0vJc9Q01nH7YMyvTU0DZBwZCSmtOlox
	iB3xx+Ozv/rG4bPRO2pE/BMpEUg6L8eoIlue+fdCKuMYkAM/JfNMfIqhRNw6h2Mg==
X-Received: by 2002:a05:620a:f04:b0:939:57ca:7e07 with SMTP id af79cd13be357-939802f3248mr852703585a.10.1788552601085;
        Fri, 04 Sep 2026 13:10:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fba21d6sm283222885a.37.2026.09.04.13.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 13:10:00 -0700 (PDT)
Date: Fri, 4 Sep 2026 16:09:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <f928b74b-ce57-4454-bdd4-511b823bf742@rowland.harvard.edu>
References: <cd57f283-71e6-4531-a311-1180ccc22ab8@rowland.harvard.edu>
 <CAFmvuTVH=mVMZNoYnU07_WA+cBc4m+UG2BBTLwF5KWhcj-z-KA@mail.gmail.com>
 <908a5b29-e6d8-4595-b451-6c328e25c60e@rowland.harvard.edu>
 <CAFmvuTU5HnBKbve=v_C7Mhw2586rR_8qsRNua2XPokgKy_o31w@mail.gmail.com>
 <0305182d-5914-4022-a0a6-1ab4221b0a6c@rowland.harvard.edu>
 <CAFmvuTULxq6O0t7FyhEwnGVdMMpbj1yZrPN6mVRDWTgF0ODJxg@mail.gmail.com>
 <1b92cd86-fe64-43eb-9539-53a559cd14e3@rowland.harvard.edu>
 <CAFmvuTWw90k+Fvs5Ve=1nxCDSQrzH7rytY-3vjGwv=edQOCBPw@mail.gmail.com>
 <fb56064c-6481-44b3-88e5-8e5ff7b85703@rowland.harvard.edu>
 <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTXWxQJUZfAAC=vs5QM=myDLE-o0jZZ8OXdqiGioPkRwfA@mail.gmail.com>

On Fri, Sep 04, 2026 at 11:00:23PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you for the updated patch.
> 
> > If you trim your patch down to the parts that only target the AIO races,
> > do you get anything significantly different from my version?
> 
> I compared your current patch with my AIO-only version and found no
> significant difference in the AIO cancellation state machine or IRQ-state
> handling.
> 
> Both versions snapshot epdata and ep alongside req before
> usb_ep_dequeue(). In the directed cross-CPU test, a control based on your
> current patch but without the local snapshots of epdata and ep reproduced
> the earlier ep_unlink_worker() UAF; I did not reproduce it with your
> current patch.
> 
> The only substantive implementation difference I found in the AIO-only
> comparison was the criterion used alongside the req->actual check to
> decide whether to queue copy work. My version used
> iov_iter_count(&priv->to), whereas your current patch uses the explicit
> is_read flag. I agree that is_read makes this decision more explicit and
> avoids requiring the reader to infer it from how priv->to is initialized.
> 
> With your current patch, native PREAD and one- and two-segment PREADV
> copied their payloads correctly. PWRITE, PWRITEV, and zero-length PREAD
> and PWRITE completed without invoking ep_user_copy_worker().
> 
> I also reran the original null-ptr-deref and UAF reproducers, the exact
> pre-queue cancellation matrix, and the reproducers for the earlier
> candidate-patch regressions. I separately tested deferred giveback,
> forced dequeue failure, and the earlier NULL-endpoint case. All of these
> tests produced the expected results, and none of the corresponding
> earlier failure signatures recurred.
> 
> One small point in the ep_aio_cancel() comment: as I understand it, the
> completion function pointer in struct kiocb is named ki_complete, which
> is also the name I used in my previous message. I wondered whether
> iocb->kio_complete() was intended to be iocb->ki_complete().

Yes, that was simply a typo.  Thanks for spotting it.

> Thank you again for updating the patch.

You're welcome.  And now it's time to submit this patch.  Is it okay
to add your Tested-by: tag?

Alan Stern
