Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792806787;
	b=4P5G1uhQMqJ1B9ocuZ/T8asxWiSm31OTKs1xmUmDHSea9a1wYfyrSuiq5w56HCukZTRt
	 9TwSQAj1xq8NPjANXVgYLt4yrrT8uxEVD0cByqLi25kQca2xe3nEepqD8+eqnvy8vG3ka
	 ekdIRWI80saXmX7j9/9AtHBuwhYWO687m/awl5qDxNurnyUEjAn6CZNoJF0Q3l8VHr7tF
	 ovh1VPRUruwSaXcJIYq5n7hJsv5JrJxPcD5bpgNnPzVgs7PXi9Vs7xH5EVQcDbSKMLZWS
	 +5qkQp3/mImkbXXAiJCKFeHQdtbEVgfjUlDx8EU3It5kWlPNVMsd+1pXzD8fpgNlMpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792806787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PwIJbRJBmxhNvtVEYVBcszZ+9KTP/NlP4a7yp3L2Bd0=;
	b=oZdDXRXV5JaIbqR/bBF1uqDhWmBsww3v/8PyISNYi4gRRN5ZyZ4tiQAt5C+3kDwqWQFc
	 3uXvvvYKvAR4l/8eWo5tygHIssUBDlbycxBkcgfxvsyJcd2ii3CawvBv7l2TvV48R4h8r
	 qxG8jFJGdllsuip8Z9SfW7BTsSBNeeCvlfgiV35GgokM/QVZl3Get9HwGj284e5enfGck
	 QGys5pohlFZCVT0RULl+zkM+9iMQEFvQ/fkPfoXktkfdmuEPm2Qx9pr6QV7OTwKQ44RU5
	 HNBLE0Vw08cZg1lKb8ilXPfunIUX5TNVqmtcylWN0eFIFNjjimJ+XAY05V0c1BtygNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=qJuEGuii;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBE7606A31D
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 01:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBE7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=qJuEGuii
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93f36c18b75so74406785a.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 18:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792806786; x=1793411586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PwIJbRJBmxhNvtVEYVBcszZ+9KTP/NlP4a7yp3L2Bd0=;
        b=qJuEGuiiTo4qSSJz7+E1oluEgXCF5Q7bIkPpU+mVQJxKqdJQl0qn99fQARIHEz0SLf
         7Zq/R5fGJcEoYsDfI4rKiSj6X2gKELccAr9cvephMMb6R69nQL5BERqC1sdoe72MomTI
         nfJ1+BFPu8ya8iOaDBmS1HPMjKmwWP2cYv7U3FUlsTJBHFsyo/cnHwyxD57v1QJAf1uF
         EL9xd+P4nRtom4L07elrIoZWOPmB5+/hTi9vtr8wIVbw5rafwGWXAek60zJP3O4vNzkR
         w+j52awfLN3pFwyE80YIl7wuJOP4FQqA6jyPp/b4f+bgLReMowERYR/DpctJgX5Jj/lp
         Vi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792806786; x=1793411586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwIJbRJBmxhNvtVEYVBcszZ+9KTP/NlP4a7yp3L2Bd0=;
        b=sVlSsnc1W3GBtE3xqLw7OV3AvsTNouk4B819QLLDnSekI4b5vXb7Wvlu8eAn+9Qs7T
         Ps+fA6et7lMZTzDbUtgxshOhn3MLeat/CTCUPWWOJRUtnPuoH8twvQLLeMlYgQSEMzoQ
         VgaYqz3JGly3zk6cg5UBgR9nSeiZdLcIElwRtZyssSJU4Vl7n/yoV5xNL3v7BnZZ5RxK
         A4SkKwYGxbwrwAO7YtdkfEV/Alf+Sw9IkeWSkT993Qnsm5Y/Tt1bNh+Mvi5h3IThtNn6
         bkSRGSU+LPb3mMk6hClf7pUAjZL5gedTvfDn1DyD9RDIV++jzFfQJ2DFX2JwLK/o/xt+
         t7vg==
X-Forwarded-Encrypted: i=1; AKwUvByoe5sRz4SB7muoIs2wxBbT65oRjm0eseDLBbwBD8IOer+os+dSZlNnrhQkZt5CdQ0qcz94XtRRauU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLioHnEWINpK/LZk7TdlMkgN6DEw/j5Iv6u3Fs59KTY1VzueKQv
	d5KHjoxGzsHgS1K6nzrFfbwm0rguL3MfUTuec5HBBXiHzAux+ykihMnqEGWKZFN2ag==
X-Gm-Gg: AYBFou1mZsNIrXgBX0Q9ZZaYrN6wMp6waPjBmiLRgPFdgZMUcuLt7tHQy7lo9WNGT47
	xJ0Yq+5Uw/CeMBSmMfmJhVXunCmYxUF/iG4VkILrLpAkUtr0vwJsO/LQ6yrqDBr0coOoTF6bH/Y
	KtJgcxJ5BmDS7gNKv89xL9KWy/zLbFs5X2WxKtRb3EPk0X2Go6psha1leNqoK6B8xeZLeQVQvvu
	G038oREmmKE8AtnW8T1YQKDB1dVqUf7z15xW1biN+ZvfworQtXVJCehOFQXpO+ivv2fOnofrIY+
	fvmLOCPShGWs4AVY7+eCR/8jYZAzw/NBsabBPVcUs5B8xZuVmufV3D27AeSu8QS+hOvfVEzv4Kk
	M2Siwcd/NJuCJDGCYEk55ix7CzD+kcAOsyCCyY7C9P7+UqVy6xOPWckWIU4oVH+6EfGPxYPsFB1
	FKH26oCjCZChQovJXeblTQc1jy7NaLVAJIJHiWzfpHRfjLEAMPzLBomAU1aF0HIHaY3VuO8rTlQ
	P2tHvrSNNIzalh2un7fM/CvaZh6BWpNmdKX6IVw/2yHrQ733zXQ3tg58F3GAryDqO4dnJnz4LtZ
	OQ==
X-Received: by 2002:a05:620a:271d:b0:93e:ad16:9590 with SMTP id af79cd13be357-940ef94e80fmr107135785a.36.1792806786139;
        Fri, 23 Oct 2026 18:53:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f06672d6sm62365285a.12.2026.10.23.18.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 18:53:05 -0700 (PDT)
Date: Fri, 23 Oct 2026 21:53:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: IgorpetinDev <igorpetindev@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: core: hcd: cancel giveback work synchronously on
 stop
Message-ID: <d95ba108-30f2-4c86-a47a-2b842b8cb25a@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <e16930d5-375d-4d61-9e37-94dc9a83ba64@rowland.harvard.edu>
 <CAG21Q80vg9LdTRmFMC4aq7j=uEPWpEFNr3+1MLLUw_UU_cjd1Q@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG21Q80vg9LdTRmFMC4aq7j=uEPWpEFNr3+1MLLUw_UU_cjd1Q@mail.gmail.com>

On Fri, Oct 23, 2026 at 10:31:27PM +0300, IgorpetinDev wrote:
> Hi Alan,
> 
> Thanks for looking at the patch.
> 
> I think the bot caused some confusion by talking about stranded URBs.
> There are actually no pending URBs left on the list at all. The driver
> properly killed all of them.
> The issue is a race inside usb_giveback_urb_bh itself. The function
> usb_kill_urb() unblocks as soon as __usb_hcd_giveback_urb() drops
> use_count and wakes the waitqueue. The caller immediately wakes up,
> finishes removal, and frees struct usb_hcd via usb_put_hcd().
> 
> Meanwhile, the worker thread on the other CPU is still running the
> tail of usb_giveback_urb_bh(). Right after __usb_hcd_giveback_urb()
> returns, it tries to access bh->completing_ep, bh->lock, and
> bh->running. Because bh is embedded directly inside struct usb_hcd,
> this access hits already freed memory.

Okay, now I understand your concern.

> So all URBs are already completed and bh->head is empty, but the
> teardown path still needs to wait for the worker thread to fully exit
> before the HCD structure gets freed.
> Would calling flush_work() on both BH work items be the better way to
> synchronize this without the concern raised by the bot?

Yes, I think it would.  After all, it's just good form to flush or 
cancel a work item before deallocating it, if you can't prove that it 
must already be idle.

Alan Stern
