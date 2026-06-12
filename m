Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F093D813F
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781263672; cv=none; b=P+jYkHEkXaIwbFYGiP8gop5vtDDEk9k3axGCAn9x6l1NxVM3L12TGVBSEsQYR/EgJZjV4HBvbSVB6y5qs7R6SGdfK/JEfj/AnNUfMKof9xXNOykqX4vFA+zzZCapRT1GvonXcd32dnZmlOitt2L34dQamMhr83eSRMyIrxEMCCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781263672; c=relaxed/simple;
	bh=YSPwyTnUHlbBU4nIknlCXyeL5oVNr1kmvcE0o8FztQI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QcbfyjnlvIKQ1KeRXTdYUv+D8zpE/B6l3X3PhraLyuiI5WERBEJnqOZ9RhkdFtmkL+9IZayiMRc01YqGE7OTpFV1qFZ//jc1JZv58GIDFUAe8hM0e2I0KgLzZMIOoB2AlzhpWuqwzfEnZOoxglTupixLhFSffJVZO4DGsCi6Hgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuHTP0tE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuHTP0tE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so10062695e9.0
        for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781263665; x=1781868465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSPwyTnUHlbBU4nIknlCXyeL5oVNr1kmvcE0o8FztQI=;
        b=MuHTP0tElwW16sIOPS5xyATAkfobvcLywVsJblZ918ywgjD/Za+3zSfiy8HnQPeaQg
         KK5LWP8EE2CcxhV05VV956WBc3/bwaXQofeZyvm5lNYNRJrvwY1K+TLoyLw7Y80zpYEY
         sViiPHT1tkirCaAkt1O6Ld9dfrufpESDoJdcgzH39GjSJvI8X4jnw+8wpVQCqb5lMOku
         vYKKwSVnmVLgpX7JH60rL+FFDjj2qe62HwtkszxaZmPovJEMpBOQfYcCObGAX2fGsLTh
         NY5+Rku6mqBoGCCGsptr4VFRfa76sMRmXEPDP0eNN7lYArmLZ0Dj0xyrNBllH58iDt2N
         qErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781263665; x=1781868465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YSPwyTnUHlbBU4nIknlCXyeL5oVNr1kmvcE0o8FztQI=;
        b=F8kuUc/ebi+HwWdXWImYXHcdO58zA6IMQv0tbIywAwxdgqfaCpHLCm+bMGJ4j6j4Xj
         Hhpe7DTevXvYUnGUPCpkn7aUETWCCRcJuY1N/Jt+YsIEyFbET8ebjTRdiMXdL9j4Iy3Y
         Pwga7hGAfm9ck/oWs8jsJDKgf3FNF553tzpOeNmwib+G7nVPX9WEn28Pkh0mnWU0kpvH
         2NYhVeBiuXAIDcjilInlQz1Lf5IlTdTf87Y6B5NoZfXgHVGwDnIh7RPgrtRuo/tamAa6
         tVSZP0dDQjHVY7QUN+YWf2zi3FIq+58L8Qlo4ZpY+AvghVh5S1sSeIlhoBkmi4E84v5w
         XhUw==
X-Forwarded-Encrypted: i=1; AFNElJ81WaAk6VLnbroK5kdrRnY5LzN+bq8yzeGzW92mAsQQ6J5tdww1Y+JAxISRv4h+6SyMIkMelX4UWGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznRpreLMtIBuK3uoIxOH5EKGCtS2tfWcQa86ny6fhGc9FPoKU5
	dPi6RVQXFu2fiHlUobpr8UvRDDuCcJkosjDDQDXaW7cceYvUo8borPjZC/Rz2Hlq
X-Gm-Gg: Acq92OEZRiH8136AdSikdhHJNvw3in8Hl2m2HVhhQJOkM/7RsNFWUmPjINJ3jcXC2zp
	HoeX3UiRWAf+mfOWSv+94y+QwD0ldBPZLyRtChOXnFoFsYTEhKguGp1DC1zKX8MZfFkgJzMA545
	azkGsvv1LphdA6hR6UwLyJlBeGWH93LGUZN/fGc5aW3YH/UUEGqVMsW8yLdIuaFRh57oAUdVN4O
	qpf728AOa8wK/VuVhzAM2AeeUUy37wSvJ9g4MtmqeDQBR8lxn5CQSffge0WxUfntjmWuwUGp/nd
	T4mKL7hOiNjz3cHASW44fDjfLj7Oc85YEMrgrEWao3Kk1tpTc0K3OYUK+lKz2UsGG9FKyJdg3IL
	tcDYkRggoHoX0RW7B0rZb3BiJUk3T9P09ug/0iEO/OFEwgjkeBhpT0c43S9TF4aY5AjQ18h5sU7
	c26XuzLrHb+F7IXunEfF69l3cS4lvZT80T
X-Received: by 2002:a05:600c:3105:b0:490:e60b:6860 with SMTP id 5b1f17b1804b1-490ec4b5a3cmr33426235e9.7.1781263664732;
        Fri, 12 Jun 2026 04:27:44 -0700 (PDT)
Received: from foxbook (bey14.neoplus.adsl.tpnet.pl. [83.28.36.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm5205124f8f.1.2026.06.12.04.27.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jun 2026 04:27:44 -0700 (PDT)
Date: Fri, 12 Jun 2026 13:27:40 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Oliver Neukum <oneukum@suse.com>, Alan
 Stern <stern@rowland.harvard.edu>
Subject: Freeing bulk streams concurretnly with URB execution
Message-ID: <20260612132740.00afd726.michal.pecio@gmail.com>
In-Reply-To: <10322326-6b5a-4f6e-8c8b-e915363137ee@linux.intel.com>
References: <TYUPR06MB6217153FC7FC9757871D501ED21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260611094526.2f5ddbba.michal.pecio@gmail.com>
	<TYUPR06MB62176F41E25F9A5C5FA5AD52D21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<10322326-6b5a-4f6e-8c8b-e915363137ee@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Jun 2026 20:53:40 +0300, Mathias Nyman wrote:
> On 6/11/26 11:33, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> > If we free stream_info first (outside the lock), then acquire the
> > lock to clear the pointer, there is a window where the interrupt
> > handler can still see the old (dangling) pointer and dereference
> > freed memory. So we need to clear the reference under the lock
> > first, then free the memory outside.
>=20
> Good point, but the need for this reveals another bug.
>=20
> This means xhci_free_streams() can queue a configure endpoint command
> to remove streams, and xhci_irq() can ring the doorbell of a stream
> at the same time xHC controller is processing the command to remove
> the stream

Yes, nothing seems to prevent that if there are URBs on the endpoint.
Without URBs the doorbell won't be rung, though UAF would still occur
with my proposal in absence of improved guards against it.

8df75f42f8e6 added the GETTING_(NO)_STREAMS flags to block new URBs
on transitioning endpoints and prevented enabling streams if URBs are
already pending, but not disabling streams.

So question is, can usbcore / uas actually try to disable streams with
pending URBs, or submit new URBs concurrently?

If so then we probably need to fail the attempt or flush the URBs, and
I suspect that storage (Cc) may not like the former option.

Otherwise, the URBs not only get in the way of cleaning things up, but
it's not even clear how they would complete. The HW won't execute them
anymore, probably someone will have to unlink, relying on the hack for
removing URBs from nonexistent rings and logging a dev_err().

On the upside, the above suggests that it's not a common occurrence if
nobody complained in 15 years...

> So I think this is a good targeted patch for this specific issue.
> We should start fixing the other issues and hopefully end up where
> Michal suggested.

Indeed, I see no way to simplify this patch without much work.

Regards,
Michal
