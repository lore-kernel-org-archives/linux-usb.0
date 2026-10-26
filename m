Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792976984;
	b=iwIIZtUTh4PV0D2UYcdtKui9mJfxh9odyePtFFko1TAluDXyIMiZ8LzQmDrPahTkOp+D
	 3z8qbJ0IqyfOe8ntedJv7Z7soAzY7MytmTLPPp3LXYbB6C/3/cq8wwmM7V6wwSGOcDb5/
	 38vcwkMVvf2jArPO+OQJqAFsHR4rCTbPHnzCFPTgDWawYTtNEdRE9pXxptpeBmZ/e9ftg
	 LpM/IRpwS1bGcSJi+BCknmLbb2IVrSZeOIpmd2ml0mjObVRUtxHZLeYQTXUtHXjdQCF3K
	 2emS5C2iAKVyCnWuaoKqSRD28J1DvotvFnRtOJqrau77aUfny94qY3FdHG2OXUDvowQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792976984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i6evN3+Ke0MX69bWlyygAZJMq2satdlGaiCf2WgHvX8=;
	b=WoikmWcqtthF/xv68HHu6JYE6jgYQIZWfn8AQI/WmTGdjGSEBCdy2e0WaXJw99Sw5mtg
	 3DdM4snLqYE4jwx5IAuBen0my0ZkMsN69GsHtYRrB5K45anKw8+WfKKsoW2t18vQHPoXG
	 hB9f3wU3B746j+2p74FjWKgyhAnnfnjXramv+Ic4zq5r6POgwKhkFN478+0NOQWxnZ6oS
	 w+j8gpSx8NrUy8hstDv+CeE54mx/uQG61Zw4broqg2L6GGmRLILJLKs+BrWWcRQFgoA55
	 mXYGoOvAAsfIvviGuH3elnaBWwatTS/c7vLCaWFa5FIMVf/OC7XkSJ2+UM3ffkNO/MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052A1606A31D
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 01:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 052A1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5363c8de563so25166201cf.0
        for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 18:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792976983; x=1793581783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6evN3+Ke0MX69bWlyygAZJMq2satdlGaiCf2WgHvX8=;
        b=MMk+k0COyYmNm4YdnxYfC2ghljf4SFkUhbA6kOhdeg1cbfitG0EjUsLQQEsUWdh2mT
         DfisF8g8yCg2zHx3IasNOO7RoHrWYOPP6vcdds9StC+lsuj6pEzcWdILCdQbgNGYa2gA
         fiWfgn11b2ceufwdYy2Q/aKNdKRi3guSGdI+5531lVzJQMrxEiYtYM9XzQsCI0sgoBtA
         0SAZzsqwgQu1MOojO7vvZbQg+to6vbuYsUW3/bNiA5a27yiZ3RtFjyuvXX0S+onRwy+n
         DrhHSBrd6oFm3nt3UAb01Ka+25XOFLCV3zQMmrJj3FeDJPFc0wS8cAuNIgLE3yNxipaB
         JAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792976983; x=1793581783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6evN3+Ke0MX69bWlyygAZJMq2satdlGaiCf2WgHvX8=;
        b=WNUXFkvX3+Sif4fJy6JyNCdobAwBgGKkNnLh7HUpKiGbd9Y/aVq0oWgUqbtXz9aqRX
         eKadDKCslXwf6+LaQhCdXfWzPUgAhqCn1x59VzoFByMr6psInuXbUhdNpxvCDaX94gHy
         9ai3vA1uvNnU0ImF/Rndv0s4YB4EeBEVB1kHGF+9oij10N9CfVrobNzrEmOjGYG8wyi3
         zvoh4cD2MnTr+YtjTNKYlH/eF4/0CbTOSv28nB6FDPx8fL7G7D7qOi103NhVN6rJLAxn
         DBmB3kJwS2IOce1YUcSB9Tg+AzPUNJLHioOs+ULO1hhowoPowItKhuNpapXicCheG5fI
         +BsQ==
X-Forwarded-Encrypted: i=1; AKwUvBznt2p8gIUrRd56WeHWytek0py5nSGkNisSMhs2o4lyjZP6gRRDd9kvXzpcVuiuRkTMOiTzNKDqass=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzZtxfV5SUz/TnA1MwpVq820bsgiIPA7WywWiinFLHls1ujW9M
	lixY2yzXykjMZ1BnM5kyRfP6gHHtg7+HXB1jUvW0Tvlc8/SMU44YajSqbL1kNgb+0g==
X-Gm-Gg: AYBFou20nbN0IIpuu5Z3wz8Qyk94Qpg61yECN2QW3KnZ6G1qtrFgh0ZQgiunopB1LTy
	J5C0/scBy8ND34HgELsDj38OvqbaUa93OE8bVZD71jN8Vorfhv+RzN0bUBIsNmbWkXX/59PGBIK
	eBZTERTs4ZBhtQmx7HPXcRgHXn7nmIw8phZyi744gr2I98UfO++LZT+ainPJU1XWvrv6ChkacKl
	JEwWG/DJFnMnyzX2WRBsf0FkJlyYz2lsPVaGSZaFWIfJqji2Zdujs1s15jfu2SSh/cU+u0VdRjS
	vJ7zHbzf7e49ywx/b6kgD5j5cSCO+KpimZeHegSIALaP1scqglZi22cs79oTXt2Wsm8U16jz7Rz
	elrX1qSdiEDqOt2ZIDjxrkmrV2aDtU1VOnAzOcX9BwnWlTFJ3TLMGwx1OU3jag/mG8RdTvkrBXk
	oJiAZ6sBdfiBouU6G4JONkLw1YymgPQXhLSwgKvNvSot7huz0285y12c9pMN4tFMw0M60+8YHve
	BzLR9ZtazcXLr/XpCr3u2/UvjYbSQM197zyh0DxTC9czBrDsmrYKCOP
X-Received: by 2002:ac8:5f10:0:b0:536:8843:c2bf with SMTP id d75a77b69052e-5383b5f25d9mr84356811cf.67.1792976982790;
        Sun, 25 Oct 2026 18:09:42 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53839739ad5sm43892661cf.23.2026.10.25.18.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:09:41 -0700 (PDT)
Date: Sun, 25 Oct 2026 21:09:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: IgorpetinDev <igorpetindev@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <4f60a287-f914-4b81-9dbb-d93528312356@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024155614.2732-1-igorpetindev@gmail.com>
 <20261025000643.425c57ca.michal.pecio@gmail.com>
 <CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>
 <76dfb124-d488-45b1-9525-5369026b529f@rowland.harvard.edu>
 <20261025171019.49c9a66f.michal.pecio@gmail.com>
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
In-Reply-To: <20261025171019.49c9a66f.michal.pecio@gmail.com>

On Sun, Oct 25, 2026 at 05:10:19PM +0100, Michal Pecio wrote:
> On Sun, 25 Oct 2026 11:16:59 -0400, Alan Stern wrote:
> > > > > +      * Even though all URBs have been given back,  
> > > >
> > > > but does anyone actually believe this here?
> > > >
> > > > Hundreds of drivers written over three decades, often
> > > > without linux-usb review. I don't trust them at all.  
> > 
> > If it's not true, there's likely to be trouble when the completion 
> > handler is called.  We could forcibly remove any remaining URBs from
> > the lists before flushing the work item and just leak them (with a
> > warning of some sort -- ideally, one that prints out the names of the
> > completion handler routines for the leaked URBs, if at all possible).
> 
> But you are now talking about developing a whole new feature of
> unclear usefulness (will anyone pay attention to those logs?),

Actually I mentioned two new features: forcibly removing any remaining 
URBs, and printing a warning about them.  I guess you're saying that the 
warning would be of unclear usefulness.  That may be true; I was just 
thinking that if anybody was interesting in chasing down the cause of 
such errors, knowing which driver was involved would be useful.

> while my suggestion is merely a small tweak which costs nothing
> and makes no functional difference under normal circumstances,
> but reduces severity of hypothetical failures.

What suggestion was that?  Using cancel_work_sync() instead of 
flush_work()?  Doesn't that amount to the same thing as forcibly 
removing remaining URBs from the giveback lists?

I still think if you're going to deliberately leak some memory because 
of a misbehaving driver, there ought to be some mention of it in the 
kernel log.  Otherwise, how would anybody ever know?

Alan Stern
