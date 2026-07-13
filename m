Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BFB41CB39
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953962; cv=none; b=EwoPtIGmlGyvgXOPpW+o8rbXpDFMIyLfGEhiZW1DZXjPn8CTzupXLy6MEQIDKwpBVYzQh/JlovVZn8Rw98oQHPHaiQoI5KVi7zVYqj93a6NXvXD8IWNK/J+SpjOid3HO81jA6IvyglqpHSzxdOuwV21Ix2UyV5d1pJv974rvzTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953962; c=relaxed/simple;
	bh=ExF1b1v/7B4ILStYP+oAvrb+mkSPom3xyqGuy5ikzME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWJpKK9wdYrW5u8SFxTGhi7nxc0ot5kIjl+IXkJpOm3i3QhHtd/UJvuLWIdZRgiL2l5PXhClzyu6503lDtBt6YAt1WyV7f285/Qy99dqyMI9VNBntpiczb2DnWnKGwFSt2ngcguuqrOed4EeE+KwMZNhitltZ7JKGVtgYX8bW5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EaauNBIQ; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EaauNBIQ"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so28006356d6.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783953960; x=1784558760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=geaYlJdetK2R3ggTTqwX7fjJrFf1JtF5SD2DZIVT7s0=;
        b=EaauNBIQ59ixqlmm5QX2LAFBoT+hP6pZcWl5sfi+avWbPKo2Gb2ywtQU2N544UMOUy
         ywB/snZ9MnumL/olsFfpLrAuLmOkjkh9MV2gRco9Lb2bw2NxYtsrXaJvNADnitirvk9s
         FunNlleXMVKsUfGFaAtWOOzZ11k4dbuctooGMkpc9beci1ZtHjSpwEoZ1ECEdd/IiyIA
         aGDz/7K2smd75AjGpFb3JJAP5UO6ooiumoiw5uOPv6nj6lwZ9StwkXMthTMuRlLRBUxP
         qWFJCnrzGWh4fQ65QvScCcj7VffacSUHRZPfcX97p1ZFcALdXbRNmVGSyQ+Id4zvl+EK
         gnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783953960; x=1784558760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geaYlJdetK2R3ggTTqwX7fjJrFf1JtF5SD2DZIVT7s0=;
        b=JIpfPmsP/vVdEsCCR4Zf6LyX513YFOtQl0xWMmbD6wok5Er5cqCC8D78erbPbORqyq
         QRyV0u6zJuMuwtftlmS0fjqP8O4/w21xZEhbg45T7cow0UQkmhvzGi7kLRHK4I5ghnop
         pThjZgajk6gP0fVReSqjYoU+2cH8bhpdcWbqR55/Nr4ZlfaIuUo1KJcYgOhggVkkfAPm
         j0xMeD/1ajAh/zfQL/UsgA9C8+hdJXhuVdUUw6Uxo2jCe5hEKuj63vRelqkdMvwwPuOb
         aZ37fu3nzjswWGwoHw9V0s9I6REsAn1BTf8nhxnhAMg4FSMHrQG+5pMRRxOBvoCq1zVB
         oe7A==
X-Forwarded-Encrypted: i=1; AHgh+RosZ6ue0Xv/D8LuLxQr2MGIy1+1RzkW78tfK129djzIn2fnMopLjWax39rifOG2lt/ltUjtnX/GHK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrMPHNh+Z4Mp0J5n3tq8HY5SjhNpTdoiqKxA6xppjA/iodJGCf
	SwmGz7TSvilIE0ONqH+rOfqaMSWUf+rpdE9tynfMofHkt1gVFhNK9fP/xat+oBTUUG5wBtbp1FJ
	ch0tGhQ==
X-Gm-Gg: AfdE7ckrCmripe/v0aGu7+wOt9sqmwclLK8F95xJUKo0vtDCD2kYyF9rRX4EJLsdI9X
	cQmu8wsbOU3QB250ZS0gXfwSMOgHfgPAdtct9JYvdOuzM1YP0x0wj3IPra74danfUcEexHaSsk0
	6/X04vFkYAPtHHmec0HFWTtdA/26NDyLNHl9iWXwdtM0BoB7RtnQGKK0z+FDuQXgKCNsSLhmZbF
	0W9/FFvv9NyOO5CRYcb7e03JhmhzRr5KrrqH0BTYGgGxOmOVlpIAmxD6zvUHkux2u2/FR3K9/h8
	SUiKKQBXnculgkV4fybpYptRiRNW/A5S0o2HptENTxchR2vEvlhwUQeXa7IKmjGltvltoDwE2Z/
	IRjFAGChfTvx4FnxW2boOOOmHbUHYgi1o3QOv+uQaioZF7AVGO1cPtuT3EbUmZ2jyzL/2neHvQu
	kblS7gWWPK6ibFxRlrz5vEvAvOmansaIQ=
X-Received: by 2002:a05:620a:29ce:b0:915:a762:2735 with SMTP id af79cd13be357-92ef2b8f6b7mr980588685a.37.1783953960187;
        Mon, 13 Jul 2026 07:46:00 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b8ea22sm1066517985a.15.2026.07.13.07.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:45:59 -0700 (PDT)
Date: Mon, 13 Jul 2026 10:45:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Daniel Palmer <daniel@thingy.jp>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] usb: ehci: Add option to override
 ehci_readl()/ehci_writel()
Message-ID: <a4fbe866-397d-4fb4-b4d4-e71e7771931d@rowland.harvard.edu>
References: <20260713122205.1350933-1-daniel@thingy.jp>
 <20260713122205.1350933-2-daniel@thingy.jp>
 <02d6c843-6606-4f67-aef7-3a88846d6388@rowland.harvard.edu>
 <CAFr9PX=0Bx7OBzbUXXZPsXdXyCV0NPqi4YaJ1DCeMXGk9UDQKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PX=0Bx7OBzbUXXZPsXdXyCV0NPqi4YaJ1DCeMXGk9UDQKg@mail.gmail.com>

On Mon, Jul 13, 2026 at 11:37:19PM +0900, Daniel Palmer wrote:
> Hi Alan,
> 
> On Mon, 13 Jul 2026 at 23:21, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > +config HAVE_BROKEN_EHCI_HCD
> > > +     bool
> >
> > That is not a good choice of name; it's far too generic.  EHCI
> > controllers can be broken in so many different ways...
> >
> > How about USB_EHCI_MMIO_OVERRIDES instead?
> 
> Noted. Based on that we'd have a config for each piece that needs to
> be overridden so drivers can pick the ones they need?

Maybe.  What other things will need to be overridden?  It's hard to tell 
what you're planning from just a single sample.

Note that some of the things that are already present in the code can be 
thought of as overrides (although generally not for a broken feature).

Alan Stern
