Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941424;
	b=4XMcGqkqFnheEVhp8KL2UsKPGfcuzrPj0ENi35coaupXVkjq1YqEdWY6BwmPsvFoxYnl
	 JlUpHfZFYqxfdrkdXodRkzQk1ZNbq2fxaLoDdZOUHnR36J+70gEtwv1PlIGvh8ITDhCx6
	 m1jMCyFUYaVgf+qXM4X9uzMBQbScYJLIqwniJOv7lpHcKZ2t9kedSBnln6z75ZNd34Ca6
	 cVgpw7FxypPdRIz89xtx6vls2Teeteu6BueiIQ+BrPl6TUQy51YA7J/vX5U9JrT6ne15s
	 azMmdJYBIAljjI8uGKTfzSP1OPzSrl38fpicyKGQKkjfncNN0uFdBnnl2NuxmZQBKzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xuT4b3Ogd1sn4kTuluW41732TPOf5pb8loXXUU48qds=;
	b=vMSB7siHAXtWBTxQibqy71TO4NB8IBdauzuGhQfDBQpkjsBs1Y2zHskMx6FVNsiyikS2
	 /u7JkpN517gngvccWaH5vavoMPEp0diETlmJlbsk035QgQi0gmjgxUbrUfpAKDVQ96i2U
	 0HQ1speWdWXAfCBa7PL+/mHeb3vP3v3kUIiaXVR7DHPqZo+q/rSuYE1EvuES8FB9PqRQ1
	 7big1RIO+ybP5eHcHD8XY0Pa6aWCGdEhY2Nky1ksuIAv9GM9ZVVQs9gCgBOPeVOP2KRZ8
	 0uHrZcDgXt/YkSvFRG0UVsOekE3xREGiLwtxyVjLiJM6pDbhGFBu1BPNWOEdwlNV0jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=bkhX3K5F;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3646A606A31B
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 15:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3646A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=bkhX3K5F
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f22a8515eso215440085a.2
        for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 08:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792941423; x=1793546223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xuT4b3Ogd1sn4kTuluW41732TPOf5pb8loXXUU48qds=;
        b=bkhX3K5FjsQrft3v3hXQxqYDsSuQznzyGasYeLiPw0fXaiqj12taMq35qXL7NI3cSN
         hlUm/LZwUyjwX15zW7w1wiPTx/xepHFLqWLtyfKSkFVURXGjuSKFvD+X3/PFa2jDRbDt
         50mBJi6EsGzn1/LladRetekFy9+VqpXAkcM5Qq9jHW/fPD3Q4BP0Gadx/TUvpolO+nKC
         UDAF1qWTxf2i0dAymEkgXv1NCb7sboO4Te4RaWSatHa68p4ishuL2T4OlCQ/1554Tm8P
         zGaFI1XMkYnTGilMixj1aDMxKxUv09uJwzo3/gL3OgH+ZHMU6x5NffvYICXeok2Bqyc3
         vY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792941423; x=1793546223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuT4b3Ogd1sn4kTuluW41732TPOf5pb8loXXUU48qds=;
        b=erBuXd++MjfwRZElkLoeP6s/5HiLUR7HoR1ib02gfmFhz6mqKiyM+REJDAVEBrQqNk
         vvxwG08UhYJ9zRXSIyaCkDp+wWVMkC5mcdEXLdkZUBu6P/JS4LaPNW5hBPuX9Yn08gIs
         47by7ryQm2TIBX0sDrQqkKHcNYCvSAWu3xl0IgS6UXKNybnkKLKey5Mh7MhDBXHwlKFe
         D0x9iFl2y2y998it1S8WcXArofwLXIa3WyO+FmOYHgjj+Fafp8h5EQpSVRxFgOqIA8af
         NSQg85nJG5PCCg/yBBjX9H6r/k69uS+ejnB0UZEjX051FcR9i1Rn59euE1qbBcgP/vnj
         21Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzIkYpQtv32Dyb04gcRnrXSsc+/S1M+Td6vt6IBLU3dlzULq83e6jSwd/hUoT5z8tR7eixT6oSrAQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIjNJWqkbUL1PARfrNGFolhJbAQGJWTB/+6ZsLKokjUJEtdGFi
	c+2sr/TflSoADSB7sTHWWVQCIu8wCtVOYMLWS6R2EnCkREZlI820P0X8S+JchN3cgA==
X-Gm-Gg: AYBFou1s4FZ/5bZn4JOAhPne0YDV9uS7IEYXsWuzokXgJmEtPlrx+ga19DEhajMskOK
	yvi4hprPuu0/HQUSZ2q4s7rhlquhZOpnPCo94Z4z8tgewQLOUcs7eqztTZaO93UD+cY6xPLjwve
	KEmzrGlY129+gNjE7cMHg3CcfNQrkh4KOXFyY4a5T0zZuqHJiCiuEuSSFWvptp4fnC3yho28Fgr
	G+FVd860Hp5KkPA7/QyOWqMGq5uvYuoRELgcNACaiVsskVt33k5iL5/AcpkqUwqhqh/CVzlvGOA
	RTorNnfd0OfmeM28Hn1bW2JSH+KTjSn73rjjvFbjrRi/hfy2clwLcYxeKXlTnOUNi65nPGtbSlZ
	qw3NzIHJwGaXzKjUHOLm6xwWrH46J4dSXeFE1WD0XP6ST5D8CEPITFa0gaT6ywGfFTFMDatXAw5
	xP5n6M5I6Vii7lpOt1w7/e2plCGIGwHjTq/0v04D4Vvyro0DIOCiGr0eDT3kBhE3WubgvGhVPH6
	dt1s4/TA8I3ZobH3tU0yEyD35raKEPHhges+l+nFTjEvyJL2TRFgECE
X-Received: by 2002:a05:620a:40d5:b0:93e:fd69:9a93 with SMTP id af79cd13be357-940ef8d837emr663389785a.31.1792941423007;
        Sun, 25 Oct 2026 08:17:03 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47cd9dcesm47203106d6.42.2026.10.25.08.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:17:02 -0700 (PDT)
Date: Sun, 25 Oct 2026 11:16:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: IgorpetinDev <igorpetindev@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <76dfb124-d488-45b1-9525-5369026b529f@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024155614.2732-1-igorpetindev@gmail.com>
 <20261025000643.425c57ca.michal.pecio@gmail.com>
 <CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>
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
In-Reply-To: <CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>

On Sun, Oct 25, 2026 at 10:54:57AM +0300, IgorpetinDev wrote:
> Regarding cancel_work_sync() vs. flush_work() and usb_remove_hcd() vs.
> usb_stop_hcd(): these changes were specifically suggested by Alan Stern
> during the review of v1 and v2, which is why v3 was shaped this way and
> subsequently received his reviewed-by tag.
> 
> I'll defer to Alan and Greg on how they wish to proceed and which
> approach they prefer to take.

I don't much care whether the new calls go in usb_remove_hcd() or 
usb_stop_hcd().  I suppose usb_remove_hcd() would make more sense, since 
no URBs can be sent to the HCD until it is added.

As for cancel_work_sync() vs. flush_work(), it doesn't really matter.  
The situation we're in is that there are no more entries remaining in 
the workqueue and no more will be added, but the final one may still be 
executing.  In this setting, cancel_work_sync() and flush_work() do the 
same thing.  However, the name "flush_work" does a better job of 
expressing what we want to accomplish: wait for the final work item to 
finish, not try to cancel it.

> > > @@ -2787,6 +2789,13 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
> > >       /* In case the HCD restarted the timer, stop it again. */
> > >       clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
> > >       timer_delete_sync(&hcd->rh_timer);
> > > +
> > > +     /*
> > > +      * Even though all URBs have been given back,
> >
> > but does anyone actually believe this here?
> >
> > Hundreds of drivers written over three decades, often
> > without linux-usb review. I don't trust them at all.

If it's not true, there's likely to be trouble when the completion 
handler is called.  We could forcibly remove any remaining URBs from the 
lists before flushing the work item and just leak them (with a warning 
of some sort -- ideally, one that prints out the names of the completion 
handler routines for the leaked URBs, if at all possible).

Alan Stern
