Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794872100;
	b=p/2KRA4Rj4i7BAoqUlRI60G3fg8IFPbp+xCZzS9b7K9cqJ/IthIpE6aqfSxTxs30R8AA
	 MQkq0gezk53NOTSMPExLblArPOyzTy/HJdyXJpzeA7++KERrN4hUHeAsHBtEZt2pAtyVr
	 0aZ4O3BAM/kv4VOH3Vy3OYoWqewaiBddn1zEqmokYVaTPZHrHWdGhibaKKd5GiMOO3Lk3
	 WBZrI2qKOCYPB2Q6377ZcPlrirVGcrNlR6ROcT3sVLLjGlzJg3zS2tLCwHApFXGu/txAw
	 Pgbt3WCGyuvOM5IckXbwPKvOP7GqOTXLTtfjS/olwdxSBc3JI3WZG975zC3nDouyxwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794872100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Af1reff1Z1EffjIkRxjPvN5B/PFFTOsk4MNCtyRPsM4=;
	b=xiWQNpZezE1S8s5DO5KnALn6lUVcxRvkeZCgXEhc+HgQfimtv0MaOBaelnd2zV19PFGn
	 0SIntreJrw1A82h+q30OrzF0IBiD52ZCFlJ8y05BKQmvYMYQoAIalMl9AOqjS3xn/abRe
	 DLTChP2TgkXo5lAzSp5jAe6M4rb0ObVxKglElXABl1gwcc+YzuSiOo1sIUzvom/PQq5Ix
	 iIrVfiY+sdLgZNRvB+Sg/nDCB3OaYUznlEFzkYcAnGKfapfXDeR6NceQwfR5iE5+ewSp7
	 OQERpm5fjlKet5ENuTFjnTwsynDrXV3BUCqQOX1Xt/1ND/8NUnaNfPhvhSUoVRBiRMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cRQy3Vq3;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C6A606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 23:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C6A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cRQy3Vq3
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so3659013a91.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794872100; x=1795476900; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Af1reff1Z1EffjIkRxjPvN5B/PFFTOsk4MNCtyRPsM4=;
        b=cRQy3Vq3OMHU9OwTKTCh9lffRzgluUfegDZwWUYI0urJ9QJfPJ3mWWRyllJIQDU0Uk
         pOo/9ZnKyAqrsmxAqCKUquZT3fQn2Yf2NhhpJLAS4+mrg8edGkbl3UZ/NS0XepXIIk8m
         MFwkb225BNfp15ktiVfULrnMonmVqbu71GhTqNaVsin3AyloVqeAF0vCqIi4Xu2CfApW
         nbmGXSiG0gtxnOkKtKp4Y5d61tC8KsxS/BCu2JFZm1E+zC5T/eHqmKfaejtGnAYgvD7L
         RRK634vuPE/1HD+1eL9lN2yIudw/EZHM0GOGbww4tsSW/r/uYYxKJmWvljTcWqu4W/Mt
         JXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794872100; x=1795476900;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Af1reff1Z1EffjIkRxjPvN5B/PFFTOsk4MNCtyRPsM4=;
        b=C6r7rKJKvIiupQ2lBMNUTOFCJs29pVbFiFcjBp5DWos6ObhRMIH7fJz0jsO91f2qXC
         mOYpugUwKmOSghFiGA0YAHFRV4hcHtwhN/9YZ2Q+4o+xE2cj9FQ3qRjQH/DVQQCYCz9D
         womO0JU5+yT+qxHS0nfD4JauMz1uTJlVuSl6NVeZZjnvOAexubcDWQy4b9unfKapksIo
         8Dq3xBhk02/WF3UXfw0/UG9H8NkNzeMHAaXnUq4Qo0f5bQkuxRdW6UNMTJL2UC84Kh6d
         cKqrXuGTNVh78nBSAs4UwcPbUKGgFu6RZsH919r3tc+slgOuvkzaE3zB0RwkxUgDsafV
         1C1Q==
X-Forwarded-Encrypted: i=1; AL+hErFpzqRwtN3hHvcBovMnrZXH4kpu/XnHU+IshJEvBLGtf7srhGWaDNbolNuNXXemajWiV9Y5MmnrfF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G5U6QDI74D1Kwp3f40JOPDFoy3XCKf9VAZRst/mdEXzGOCU8c
	Ck534Im/FVY9eqdYHAOAjIu35gD8bL9gpaypGtTJEXToesJkoqNERYbPy79Ub7N04FAoPHbfhTg
	oT+ESS/h6nw==
X-Received: from pghi2.prod.google.com ([2002:a63:e902:0:b0:cdc:b85b:3d46])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b8c:b0:3ac:af8d:c839
 with SMTP id 98e67ed59e1d1-3b1b0a48e43mr12339856a91.35.1794872099477; Mon, 16
 Nov 2026 15:34:59 -0800 (PST)
Date: Mon, 16 Nov 2026 23:34:56 +0000
In-Reply-To: <20261109103714.4000-1-ingo.rohloff@lauterbach.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109103714.4000-1-ingo.rohloff@lauterbach.com>
X-Mailer: b4 0.17-dev
Message-ID: <179487209634.2938203.11644350063446655443.b4-review@b4>
Subject: Re: [PATCH] usb: gadget: f_fs: Fix mmgrab()/mmdrop() balance.
From: Neill Kapron <nkapron@google.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, nkapron@google.com, 
	me@samcday.com, michael.bommarito@gmail.com, linux-usb@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, 09 Nov 2026 11:37:14 +0100, Ingo Rohloff <ingo.rohloff@lauterbach.com> wrote:
> This fixes commit 5eb5c72c72fe ("USB: gadget: ffs: fix mm lifetime
> handling").  The problem is that the previous patch calls mmgrab() for
> reads and writes, but it only calls mmdrop() for reads.  So with each
> completed async IO write (via an USB IN endpoint) the number of mm_count
> increases.
> 
> 
> [...]

Acked-by: Neill Kapron <nkapron@google.com>

-- 
Neill Kapron <nkapron@google.com>
