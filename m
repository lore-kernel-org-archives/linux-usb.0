Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE21384CDB
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 22:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788302747; cv=none; b=NMVWNr8uUsQpL8hV+qR2ssGLwb+zKAk7t4N0JI5CTLKJwrue5g5OORgYopV20kBo8buX+PtcwlYF3VpqgVn6C29lHeNeKYgTqDwjy26FxonbrcuHxMD1ByF8nDWSAOOnvapHfapxRKeY+IvaM6JUYcHBnHeuGiq6nBqVwcOVq5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788302747; c=relaxed/simple;
	bh=AmMY9+JiOedVBwkxJkvIf9KReIiEj6fvyuFyhDZAsuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UbSP8Ct4NCqpeCHAgan2cjIgf1h1H4veUcEZy/jP6i+Lr1/I/SxU9S3HXz2vwMCwEcV8Eic0uJeeKOgtUc46BjQyZlCytF+ceD+Qc+heOxYWwkaoNMAtfoZGffF3wqKCV6dK3bBNJlbc3nXcM4Tuw6y04RcgsFwQGj+hd0DcZJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oes.ch; spf=pass smtp.mailfrom=oes.ch; dkim=pass (2048-bit key) header.d=oes.ch header.i=@oes.ch header.b=Ow4uhTER; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oes.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oes.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oes.ch header.i=@oes.ch header.b="Ow4uhTER"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d944747d41so4204545ad.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 15:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oes.ch; s=google; t=1788302744; x=1788907544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pbcWidxi+5W3ugdRwHYPgaHhKhKyuwEwYBB8DF4jk68=;
        b=Ow4uhTERmwrAgiEIA6MrgPBZW8OhaSKQmE6yXxYaT8gET8xgR+z486tUSmo+m6jXWg
         93HyJ5r5KZIno8T30gnYDDXpF1rkUVhcMm6jNLIYnYdioHwe60PZcXr6WOYDSBNnI9Sj
         WMSjJ1nqm5eEfe+4rZrMc3swn1DofCvVMEbwvSW5U2RA4KdVQwjHFuzCw6GMDRLfPZHj
         lQMPjknkWENP/JlxAvE5KMIPtZvjFzxM1iinyRa3bNYAclUeZD7ZraMh+Y2wGcjpHHWp
         r/0RRHJ/rajA9dWHa9Y7FfCN6LqFdrALfPllLajN7ccbhvtg5TO6ca7o470ofAx2seqB
         Bh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788302744; x=1788907544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbcWidxi+5W3ugdRwHYPgaHhKhKyuwEwYBB8DF4jk68=;
        b=UujwuysvgA2WaiRIN5kvsL+OfjACD0s3TXcZ/m4NTgwYtxciKcFEmtlnTBFKKTVk0v
         B6Ezlcaw34uf+VABJ+kKNkUmzzmYHLwXkYchtVe4f1lVxWwNAvgt8Xvosr2UHHyhNfoH
         H2cL7JR3s0gozWk//2mn2TGr39CQQvnK+EHEDPw5Z1UMXo8VBHRsWk/fb5MrN/LTqMU/
         VjbFKiQo0uYtWUGiVxkCmTETtQaqYxr54uByjJI5jyoKVDpjsXKzv9BIf2x9My3HbJFY
         txq8oLpiR2LprZPzYalH89CniI5UUlSrUZF11wVArkic8MpCm+CMngHoD8J3UwvGJPtq
         pLUA==
X-Forwarded-Encrypted: i=1; AKwUvByEGTqY6TYsQO0V9rtkIx6/2fQB5tM7KpCqU2yFdrJHv0QJxd/rqK/kOdvKsHaMQPlrx70grM/vO4M=@vger.kernel.org
X-Gm-Message-State: AFuF++nrU+er8UexhzNhAJhnaB3n5ixiNbzgTr10nNrmmeyi9ybBdWDq
	LdUFy7L8kukEK0H5CovSRVKikrVmZgVtls7XdEh0XMpot3+iMRwk+4xw8LGT2bnCIt3HlHNXdfr
	Lg3v7ow6Y
X-Gm-Gg: AYBFou3giLo2+sDbmNUuun7qFMOUfJ0DJFwFCdZconY8hUpEQ9i3L5d4xiY/021GN8B
	6Wn1QIg8bEeN4LeEYmSFy+ghQqQBIm/Q26MpMAgdM89vcaSYUF0aceOK+h2wOwKLLk0v4oFBjNH
	BmEzOtRobbjhgLg1QrsVx/IgkiwM8LMgoMjNJUabaM44Sfmvnn0uWyneeOvAwtoZaXtEiAK/lkv
	heVIyiped6UjC32CXA8V6ZkUDleNhw73/WAVbAddqw+xvdi/qBwbmOy0Ekf7iWQxhVCI6hsJt9F
	s6Ahh2rxA+H8ra9xT2NvH9I9XIYzVYdHAvNWBwMT27oxowUMUJVmpaIOt+4ie+HtKNUOgrqdcEN
	+TVnqKd1CP9J6j/bvI5A0vA4RrBTcCPqLnipERX82gPNHdRx9GQ2li3P8nzgiHYKZ+gf0ESjMyG
	oYVSmiUNZ6iXo6e6QIk1i7hHdOMwKoUoaAhABi2kbNMSac9lLBS2+gLjL4EU5dZTABrKJoV4ySm
	ktiWhzv8iVa36yO4rSNrhQuVELHCyqrA0wsaxYA54aX/y6LyQeeLmfjXJvgd0hwR0rVivBVkFOo
	jW5sEhNYyef8
X-Received: by 2002:a17:903:2c0d:b0:2d6:f988:398f with SMTP id d9443c01a7336-2daec6b1e12mr6735075ad.12.1788302744259;
        Tue, 01 Sep 2026 15:45:44 -0700 (PDT)
Received: from cosinus.tail5d817.ts.net ([118.148.155.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd48865csm3829475ad.54.2026.09.01.15.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 15:45:43 -0700 (PDT)
From: Julian Oes <julian@oes.ch>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	oneukum@suse.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Julian Oes <julian@oes.ch>
Subject: Re: [PATCH v2] USB: serial: generic: recover from a stalled bulk-in endpoint
Date: Wed,  2 Sep 2026 10:44:44 +1200
Message-ID: <20260901224447.50777-1-julian@oes.ch>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026090142-walrus-zipfile-70d1@gregkh>
References: <2026090142-walrus-zipfile-70d1@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Sep 01, 2026 at 06:33:15AM +0200, Greg Kroah-Hartman wrote:
> This sounds like a broken hub, why not just replace that?  It shouldn't
> be causing transactions on a different port to stop.

I agree that ideally my hub would not do that. However, my assumption is
that it's not my specific hub that is broken, but that this hub (or
other hubs on the same chip) have that sort of issue, and I was hoping
to be able to fix it for me and others in software, rather than brush it
off as a hardware issue.

From what I understand an endpoint halt is spec-defined as
host-recoverable. In the current state (without the patch) the read
never returns data again and the user doesn't know that it needs
restarting.

My patch is meant to do the same pattern that cdc-acm already does:
EVENT_RX_STALL → kill → usb_clear_halt → resubmit.

> > +#define USB_SERIAL_STALL_COOLDOWN    msecs_to_jiffies(10)
>
> control or bulk?  This comment does not make much sense.

Sorry, it's not clear. Both: the halted endpoint is the bulk-in one,
but the CLEAR_FEATURE that clears it goes to the control pipe, so one
recovery attempt is a control transfer plus a bulk resubmit.

Without the delay I saw six stalls in six milliseconds. The clear-halt
succeeds every time, but the hub re-stalls the endpoint as soon as a
read is queued, until the transient is over.

The delay is there to stop that becoming a tight loop.

I can reword it for v3, depending on whether you agree that a stall
needs clearing at all.

For a bit of context: in the past 14 years, I have been working with
various FTDI and similar USB devices, and it's possible that I have seen
this issue every so often. Usually, I would just re-open screen, try a
different USB port or hub, restart the hub, etc. It's only this time
that I stumbled on a reproducible case, and had the capacity to dig
deeper using an LLM.

I have been using the v1 patch that I submitted in May ever since and
have not noticed such issues anymore.

Thanks,
Julian
