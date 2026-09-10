Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD9048424A
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042605; cv=none; b=nMhDzBAqbLucjxLHtL7VmoTI6QjxROnkFb5Fugcn0J7IYSoA8eu1drFd3g0wcje40tWa5s3HHpUhIl2PVadSs5eeSI6vSKYZMk30VYFEg9a4W8rGVZ0LPT8Fx/L7gtzjPdnwnLSZfeYu9Uh83Octx/CboFczbzEKRI4zasaxdnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042605; c=relaxed/simple;
	bh=CevN/11JmE3S5Nn4qvD3m1ShEYQamBFxxPY2BUHTmyw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eM0j7EelaHUoqTN9l1gAQxm+dUqHsqSwFYZBXcVLZpaT46E54wD/9CaUN7o/C0PIWvUmBTMuGG4I0KOMPbBFttXpID8uvBtss+WHm4CxQJALtvgIeNxMzqXDDSPlVnqiATSeflRErbCz5UtopgQV5atBBWGNQ8CVKR+3OeNnZro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmj8Cn6+; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmj8Cn6+"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so11499344a12.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 05:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789042598; x=1789647398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CevN/11JmE3S5Nn4qvD3m1ShEYQamBFxxPY2BUHTmyw=;
        b=lmj8Cn6+3evjhClcqkNCEVRAb3N6bS4XHs2Jef2cWA/O4DjHX+dLvrlsWSlWu9E9vB
         jpf80o/TpsXgqWmtZUm3LigmsAMBd/eQVJRkpDKr2i0yK2//FnZGpp7lGfRWKvX1Rtkn
         efeofQD6LgVqzsZ31Ial9zf4Rv1ycLpGbS0Spy7ne0Lwch12fw9T+4XGcVmKLdCUYa+1
         /IxF+sd/CGhmhKQixDtGUwy3C8ixUGtJn1fV8vsx9jtOxkq6u6SaFqCI50PUWcovfsyn
         Xhg4Lb8JSHtkUnE5EXMpq9XH8ap6To95TieRbvuWN3E1aVai31cMUZMxtElrKTO9qYHl
         SU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789042598; x=1789647398;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CevN/11JmE3S5Nn4qvD3m1ShEYQamBFxxPY2BUHTmyw=;
        b=NAfXCqLde31CO6yEV+UA+dnbbXmHbysvK/F3fmS8J4hNpuKGsmJMdrd7Txg1DXZNyP
         PiFANP5T0ykKwWFnnfQyrGePLXgdIIk1FD2MkDzP8mcFGZZy8USqw1MM0+nsG+/vifaH
         l0/1XA2zXVyX3Pjp/RTN+SnMz1BdmGjNbB70TLqQ7XBxYaNpc8Q4hKi6FdNMu7bAUiYP
         KRxRyB8TcEQnShEI5Tp+hNeY5B51XOckfouoeeLFxsRP8WNlVC0ce1oC8uV8MJnmup8h
         vVVxqQo76ZlfiQz+Qz0z3GDonx/pMHgk2NtoKcKrTauTcwx/U8hO8tJZzCzP0qlJXlRe
         w2rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXoA8QLepu1ghc/exSbSLeiB3Z3sZHC3vC0f2X3n4mOqXnX7BswtytpLSv9B7ZFBQz/wgxx4FiaZE=@vger.kernel.org
X-Gm-Message-State: AFuF++mDn+Dj/w/LmEk5pvzZyeVaQB//uCjuy72cPuclCfaLVqMjTaoO
	ys2bXzjjjYFU2XIawmZFlzug64TCTjloAt7yNvgOLx2YxKrMWdoyrQ9d
X-Gm-Gg: AYBFou1pwwOP6HddFMh9haMsZLB2l1wm4iE9gLbpjwvdILjD3Y87OTmqmTRHUvsQ33j
	7mSiQpy01D5zhOfOGv0aql4BzAwwARQVPmRWJNmJFeMdjzNO08aWnT7PYBdIY/cZTaK5CBIRmq2
	pGJM8kDSVg/sAp2HuhrvTdN/bcW0LbG/1h+fXCPH6c1wjMv0AUt4BHLYXiD8FaUZf5ZK3MD3mHe
	dbW60Q1w5T4f7h5OVYaiTsAwORn+TpsIfpWj9d4pAvzQB62UAgisk1gc2GnXEY6GbJhYgdMfgXU
	SWL/3XtP9lnQwv5YdvJvgcuwpw+gIbJPp+QEw/OTwcpqceQJqPfPde8HunkP2KwkZ8G9Yd7AOlN
	d5gTPkVfBIzC0bybyVJsjnYmLZM89e/QysH0nEAMF1abfnLKYkra0PnDbUeTur+1qV66AYYjqQJ
	Vs2dmp0U7ZpV61mVgh56x+82WkiskZyatoHLqGjwNya585T22zl829vguADpawehrdBvNi6XILP
	TTUbuZV
X-Received: by 2002:a17:906:7308:b0:c16:66dc:3ab7 with SMTP id a640c23a62f3a-c260c8e038dmr1925211466b.10.1789042598373;
        Thu, 10 Sep 2026 05:16:38 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2945d5ea60sm113447666b.29.2026.09.10.05.16.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 10 Sep 2026 05:16:36 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:16:33 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: wakasio <scarabeeta@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec
 0789:0308 during DVD+RW recording
Message-ID: <20260910141633.00892cf8.michal.pecio@gmail.com>
In-Reply-To: <20260910113946.1546390-1-scarabeeta@gmail.com>
References: <20260910133204.3157f83b.michal.pecio@gmail.com>
	<20260910113946.1546390-1-scarabeeta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 20:38:43 +0900, wakasio wrote:
> Sorry, I do not know why the attachment did not go through. Pasting
> the full log below instead.

Thanks. Here's the repeating error event:

TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c

In three runs so far, it always shows 23KB remaining out of 32KB and
that's the only consistent pattern. It happened quite far from any
segment boundary this time, practically in the middle of a segment.

My patch logged TRB addresses wrong and added a zero in the middle:

fffbf08b0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
fffbf08c0: Buffer 00000000ff620000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
fffbf08d0: Buffer 00000000fffbd000 length 31 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C
fffbf08e0: Buffer 00000000ff628000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:C

Nothing special is happening here, it's just a single 32KB buffer,
aligned to 32KB, not crossing any 64KB boundary. TD size is 0 as it
should be for the last (and only) TRB of a TD, chain bit is clear,
only IOC and cycle are set. Next TRB's cycle still isn't set:

fffbf08f0: Buffer 00000000ff670000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:i:e:c

So I don't know what's wrong with it, I think it's a HW bug happening
for no obvious reason. Retries aren't helping for 100ms, so the HW
seems to be stuck for good in some invalid state.

And it only happens with one combination of host and device, so we
can't even be sure which side is wrong. Maybe the most sensible
solution is to simply stop using this device with this host and keep
watching for firmware upgrades.

Regards,
Michal
