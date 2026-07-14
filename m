Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CED328B7F
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 18:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053581; cv=pass; b=k/oUL6BMJfVGatSle+Qr84eBywlEzBv5H22X4echXoC3Q0cTlTYUaeHda3aPjfD8u6OS1qSgO4a93eb7lYfq3foi0NIB6S8PH/5T1+RMed7P6g2D5sBalaRJA50eAS+vm6svSCLTMBYVNsfA/DFDzmEdibGghh1IUC6c5C1BOqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053581; c=relaxed/simple;
	bh=CWq1ibkcj9NeNh3SlSdPZImkJeUrte+X5SZJ2CDVQ0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcufGUaM3NI+tl/CkBiE6f8aanIAOu5h4m13YtNadYPj9QRu+WuZjtkVkwmGfTmErLZJRaq29EeE3QvU7JwGkcLbaB3B2W2Zr+AaasQK1lf979V6DdiS/S36khCsn7L4j6nSJAa6rtxyEGo43vXjIelSoy/4MQCa9HPss6zOVGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQB1NvnQ; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQB1NvnQ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-384c94c9423so449874a91.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 11:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784053578; cv=none;
        d=google.com; s=arc-20260327;
        b=ePnYkyI/zltP0a1fl+L+BazPI6AHxTZ7TAQ/JKgS05lGKapJd1Ih2z+27oAU5+z1fA
         dpXKqwG3bp54Kk1Jlv9SwHL7BkrZbyKEzIBUSLyXkodGGHl2wnHnYJlvLYlKkPwlq9YP
         MSGpSTDJ2XvDb+zTZ80oKD3g20iJvBT1lVZNh+Dw2VsqHjDZz8NuptEghfghCBg67l/a
         FgtGTXsGHRIgbYqmuoGBXjBw2ShNN7a7amK8KAx9D7mkOiGawhDQirc9+1tLl+pyxh0t
         pvs6pUW0pNE2N53ij7EGkdK3jvSD59A84bEjNAES6TLUaKbbfwPEQVy9aT2VB6ickNpO
         YInw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HzKy/eaLdYaHeQ6eLLxXRwAK/vEaoF/CDff/5uZfOBw=;
        fh=TPMmNcgLSn1sssEbBG6F/6UpZmuYGm497due7a/iO3A=;
        b=dkuHnVWzbaHpcGds3wMqOcvL+FoJ3Tf9PVeLZhmb/CnGikFOM3cZI6T2LqyyF6GH4x
         oVmiZnhj3et2ic0dzKoRAeI4to1MNK/fspnn4cF/jYg957529MBE81P8CQUuZoWckQum
         2RZeQ1Ck+Q+wT0pd1lWlobYjtpslN4oYegC5H3lkHtrQQtnopghMf1a6Y3Ip97OrWu2P
         /xuhmcQLaTyZiBnZ2oBfJEEy8AANmVSQnYSexAHJBUTy3Bz2KgNfCmoFknc6XSVEj2OQ
         +8hZ/78DOBB7l2FvKJ1x+PJ9HSHNJf9Ug/ULJOMcT4Ps2dHarvKaYwgt2Ic67TMO2kit
         7xGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784053578; x=1784658378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzKy/eaLdYaHeQ6eLLxXRwAK/vEaoF/CDff/5uZfOBw=;
        b=QQB1NvnQWvdbgi0UvEE7cRhOhcNhdmTpbpPaPej1CMzbRBCApW9+vuZYpTIgnuoLpm
         ZXf68huGVIIlynGNN1f7ddRhhTu2NwH6yvwRbe3EllcBkpFXVGR/QrPj7FhFAg/wHNl0
         /9LGWKzytVSm+6zhnkhldnMNsIW7/LB08YaFA2JrskCgp/ePqVLSq61f4XTpAmlAl1ey
         LPqmBEHSUwpSq/c/H8z1soR/AR0xy+nRkaGxqj23r1CSLQyDI/i3eh/ChGSlrFz88iuT
         XQ6VhVppO3zlMkgRsoT582J28buRblJGemfiCRLRlm5o0gvEKiSYH5w9W16qelSTFCbH
         4hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784053578; x=1784658378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzKy/eaLdYaHeQ6eLLxXRwAK/vEaoF/CDff/5uZfOBw=;
        b=ZwolZKemChVFFGBoJFv57nsdRcI+wRtYFRyQ48p5PB0tiLmVYSlH2M8T41TcAWQbAJ
         160HJHERq47SL5zGpnffhzFtt5+Z38uuV3r0fyFL9MgsOSCDuVAbf3dMpH1Eee6HEGpW
         iiMPjkWl8M5N3pPwecdGf5Qehh+npBP6BtIjwVyTNYu3n+7nkr8QhR6U3vBd+BpkT6bY
         GBXOj4fZZL7PpjHSy/K69a2/Byci0WajLifSSxLzvQQHHJ7/XuwY56so4tiI8zD3q8NQ
         A6+Td4OCLPUEHndkTwXcoL60SBYuBr8ermgJFn5hrMvGDF1/QEEx6nn5inimjWCtkamm
         TOJw==
X-Forwarded-Encrypted: i=1; AHgh+RpwswnUNEAhDCTZSuCKIMwZTq1r+9OsY1g0llJagfK/CX7aEOwPts1ZWCfb/JVbqOC8sVGQ8uxXl3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLAiKJzbx/rGhYpEpf0CKQ2BJUDRAI1WEk+XZHkVNfmCVjdw0T
	i5EKFOs73UQZQAaaSuFaE0xRZ7UqlIOc4yWN+btZ1pWvVm/ulEZfZS//OIh8owKag6fSzpMOwjp
	FoOeRKqu6Fvy8IMNj+0AYtxCVOAZ0U1E=
X-Gm-Gg: AfdE7cnZn7ejNaMmjBb16gy+s0QX5BKd3E3F1lwpClxlVOgBkgcKhNJZ2bJnAdG0QpQ
	gdeGeOn8OjHi0SC9ddY60w2vpmigMDmzNEQxgvCIVWPwwcA7ODLnCLJyTz/bb1u9BZyGrTYs1rF
	uFBHiwRXO/NPWAYHi5ny/TvdNAKQPp/XE50bhYK8GKSYA7vF7p/r5KmM4PfmCYJ65AAoLwJgvwB
	IU/0/1OajrdXxucPtBn3kJhs26Cz+jnAFRjqiOSC79QQlpwh8+jRtdEUs5MedaVq+JBsVLuqYaH
	4l6WJJo8w3gxMGy5n/cipe5LNuP/Y3LBho9Mn9iwMUQHeipvhhRanBn3YxwX2SmCgNhB6g+s5Fg
	e9t5hvQFYuFGc
X-Received: by 2002:a17:90a:d408:b0:381:2d9a:447b with SMTP id
 98e67ed59e1d1-38dc7b31c40mr11110380a91.4.1784053577592; Tue, 14 Jul 2026
 11:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com> <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
 <alVEUR0JrF1ga3S8@pendragon> <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com> <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
In-Reply-To: <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 20:26:03 +0200
X-Gm-Features: AUfX_mz_aRz7cY4MbeNoQZxVf8UF06_0oMEjEGVSK_wjJBa5PsYJvfIZ139w0Fw
Message-ID: <CANiq72khD4Uj69eVd2eGUYnhdEVyka6g7kQgv7-CfMTyv4a9DQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint abstractions
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Danilo Krummrich <dakr@kernel.org>, Oliver Neukum <oneukum@suse.com>, 
	Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org, 
	Colin Braun <colin.braun.cl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 6:26=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> I'm aware that Rust has separate types for pointers that may be NULL and
> pointers that cannot be NULL.  Putting that into the language helps
> prevent a lot of bugs.  How would making the language be aware of
> whether a device is bound to a driver be similarly useful?

Generally speaking, different types can implement different methods,
which allows one to restrict what functions can be called in certain
cases, which prevents bugs.

Similarly, having different types allow one to put different
invariants on them, like the non-NULL you mention [*]. In turn, that
allows one to design APIs that require callers to pass the proof they
have the right type.

That is, even if something may be exactly the same underlying data
structure, the types being different allows to disambiguate this.

Otherwise, you may need to check or assume those facts, without
compiler support. In some cases, if those facts could lead to UB, then
it means one's API may need to be `unsafe` instead of a safe
abstraction, which make them more cumbersome and "dangerous" to use
for callers.

So, for instance,

  https://rust.docs.kernel.org/kernel/device/struct.Bound.html

says

  Some APIs, such as `dma::Coherent` or `Devres` rely on the `Device`
to be bound, which can be proven with the `Bound` device context.

And indeed there are methods that require such a `&Device<Bound>` like:

  https://rust.docs.kernel.org/kernel/devres/struct.Devres.html#method.new

Then the person implementing a safe abstraction can actually rely on
the fact that it knows those facts to argue certain things -- the
compiler will check it. For instance, that a call to the C side will
not introduce UB. But you can use this to argue for other things,
unrelated to UB, like making correctness arguments.

I hope that clarifies a bit and serves as context for the rest of the
discussion.

[*] By the way, Rust's references guarantee way more than just not
being NULL! Not being NULL is just the "easy case" which ones can
dynamically check in other languages anyway.

Cheers,
Miguel
