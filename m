Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FDC3191D0
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 05:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785736771; cv=pass; b=P1Vs8fEW8rMGCXb/UGw/ZQNV0a1sz5PgfM5QSeMNOlm274X6ib/GYhv/VG+k32F/Jh0tAatUEANeVcJK1EohQSE1bLJK+RW2PJjzMZ+QCFpHYGNU38CW9kh7KZj1N+K2KauI41/Q8P1KIil3A6KD4wmNXjMnTZucZPtxiGGuWWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785736771; c=relaxed/simple;
	bh=u6bP/qobKEFgmg4MAmuD9F/zCR1J43W5ZKFxpuI6hSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhyVt9CvnTHx1Q2LTssVmz7+jffAs0Uv6Ka2FEEbTOW9OJDH3vUaY6za2mXuPH/EQcLP3ZxrOvOdWtPYOJugY6qclHz5X1iAUralCpfY1Syfpn1enCNVF1xhHeWXbtLIR5Xz1kTOYGbN1Cj54vRd+78P+a31PnN9j8lsTz0Ye4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPLvUGOp; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPLvUGOp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so15491615e9.0
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 22:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785736768; cv=none;
        d=google.com; s=arc-20260327;
        b=gXiPZAJ4M3RIIIxGr+laU3HrhjT4eJbvPzKxpf+yVONU8scPCzuCxlaMr+SNruD+gw
         COikpdtlwccjjFe/G6jZIkb6CgtPK/K4axDHSJHxBoidQnhHl8xs2qXykH8QhKcBhp14
         V0/BWFliKS9YFvTJ2+fKp+655N2sMZQ9GaUT9+HZ8cRIi70m11JfAkoo3acoSzhEkzgF
         4Z945+DioSVhkkBUWuLmxfDg3kiUjGyyDlMwCzZhZUQJNaRrm3Nah99YE9B72ZXUjjTi
         vdvCuhM8Rh8gCAGVMyeYbG4OQ2xbgZe1z0c831pOM5WOP/eqQuUhG5TthB09FOKBB91U
         H2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u6bP/qobKEFgmg4MAmuD9F/zCR1J43W5ZKFxpuI6hSQ=;
        fh=8xwrX8mDijmSIpKbUbNwy5cr0Ehv8XjF2eSDA628KBE=;
        b=CiaI68cU5ycJq9EHNqYM0ottv4StIDfjQGaWXo4LNM6HkuhVd6YtxtS2YNWE8JcsXp
         hTRgwko3MlNHhuVLIYweWgaq9/7tIunIDcTuF4DhrX5sXWRsKtnb5tnYxY6mYyYQHixE
         ZNL3prK6X81DRrihNjJlQz+ujRM5xyDACTgP9PZbM3kW7LA/AyQLUsIBYcWGnn1jSeZD
         fXbjnMKgWr6b98CZ8I7PyKkf4e3175wXApJ29y5XeJUXww+j6N/PDhziimWGz/p9MqHd
         ipnoPm/UgKD5JA2LHNgWY+2PBPaCrvTLeh3NCna4OS4pny5H0e5smq/Q/O7rQZ+xvNL1
         wLqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785736768; x=1786341568; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6bP/qobKEFgmg4MAmuD9F/zCR1J43W5ZKFxpuI6hSQ=;
        b=jPLvUGOp8CRUjYzsDsaoLxW6oFeGJ5HIlEQ1eikWUbfjop7unuFSzLzjZbDGu59FmE
         4meYQ0oNfxiyKaI4zRaycb/dWhxL2Y1gPePnaj1rWNFsx2HkcP/0UGzmnB+6BmpAqQrB
         w+P0Zi/8VdjPPzzdi0hJECkVK8NI9Y+l/huX8Adn6GeSCMxIgg9djc1ewKE1ww9uj8lQ
         F33XeH9dABYDdby2+LAV1ln4kcbR3B5vwwegWeCVq9hIPg7cHwcsAXT3eE6r2PXit2q+
         Q+RLaRnooB7LnxkRQhtSKfaFB8OWt5ywUiyyWKB+Ej7FAuC2Wfm6bMDgIQHnbdQzFVWz
         I+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785736768; x=1786341568;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u6bP/qobKEFgmg4MAmuD9F/zCR1J43W5ZKFxpuI6hSQ=;
        b=JGBszm9mQ4ci4SWLsOLW8iSR21Li/N5jmTCncEYoSA/pZkSFuusmEwSBYXFoof65FB
         xTq+Kh2rJLrmTETw8C/07M2pLjJLUUCpyT2bUL7XFiANuvbuBLjK7Oezx9S5sk1NE2Ap
         iXwljhUAxednCjNh3NDZzBlSY87PTKEdjukyYMfqlYfX2wH+h9IeUq5Mo2ztyPea7Aep
         toRswsSf5hzcb800i+Bm8p0ahZITKwMUB/TqNOjKQ6XBqweQG8M4KbKKGnA6Msn7tdlJ
         EcQobnfV1QU9V619oMhcO2QbpyQ/+ojM48V3MNqzdpTtg0xXA3G4IOGInPegcQn7k+Zl
         Ff/w==
X-Gm-Message-State: AOJu0YyNORXlZmHCdvEYq9lu6q2aNBVdgLkQY9iGzfFa+56qOgNpjoqz
	Qt9zhT/OT4Gig1XhY0E0AeZpBRdFGtO1yP0FYIRPSzNVhPXZukN0QAQOm/BvSA3kW42wqw/9PSD
	gVEMuWJ0T9YBQ61Wn/T6cc0s81x+flzg=
X-Gm-Gg: AR+sD11MFV1vXyzPJeO4o743x0uU19hV7ncHgNTfaazRtnlHgtuHeo6WoQ7F42m5Iv/
	SU4dL3++FdUyvPm0DFLyNVsAfLCkXkIakG5IKiX2G440TJij1jLT14ZKQD7gP4kIHRqgphhGkVW
	JcBH7by49KwjPYIgAMXP83Aiojh4Cbms80am8t1kiYuNR1mkxWL7oQ5ODxN61OO+sD5nF/Wn05X
	RTDv89XPzxzmnpgov/QNy/uxsbDLYcU1+UCyLrjv9IUZ8mmIdFkyLsv2Z7r9MaFqX1NtAJ9DSt5
	hE4oOC5YGctfm8HStD1snjekiJg2wpQBzI8KunoKS8m+K48ZSNZNg74faxL4U8Fv6e0uXQtLR5Z
	eM1+Y/4h2P83zCmkbo95IBLNdF3YdcCI4B73BDC8mUxqqDEJO9i6eDRQ2HXLWCCJZfk66EPTjU2
	GJm6lWuHl/YyUKe9jjTC4TWWd94AgEKQqahfGc3Mu2G4nwf+hRiQn21mjYWuFeZbGoBZl+tNBcS
	KLTxh9wJbYxmJ5ElORmjrEO6OATFPbIXbm0cZ8=
X-Received: by 2002:a05:600c:33a5:b0:496:c1f3:e8f8 with SMTP id
 5b1f17b1804b1-4980c66d95bmr127096415e9.7.1785736767790; Sun, 02 Aug 2026
 22:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730135811.1498-1-joshua.crofts1@gmail.com>
In-Reply-To: <20260730135811.1498-1-joshua.crofts1@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 3 Aug 2026 07:59:17 +0200
X-Gm-Features: AUfX_mwngWZS0ENLACe0n5Md1emZnsHLeqqNDxr9A158H0w0RAP4p88ETr9aR-A
Message-ID: <CALoEA-yuzdD9=gBy0s0VFc2yD5Kwga57LjECUWTTXdF2SHed8g@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: midi2: remove default configfs groups on teardown
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, syzbot+eaa106d192c9daf37f95@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jul 2026 at 15:58, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> f_midi2_alloc_inst() creates default configfs child groups for the
> default endpoint and default block using configfs_add_default_group(),
> setting their internal refcount to 1.
>
> However, during function teardown in f_midi2_free_inst() or EP cleanup
> in f_midi2_ep_opts_release(), configfs_remove_default_groups() is
> never called, therefore never dropping the refcount and leaking struct
> f_midi2_ep_opts and f_midi2_block_opts.
>
> Add the missing configfs_remove_default_groups() in the afformentioned
> functions to free the structs properly.
>
> Fixes: 8b645922b223 ("usb: gadget: Add support for USB MIDI 2.0 function driver")
> Cc: <stable@vger.kernel.org>
> Reported-by: syzbot+eaa106d192c9daf37f95@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=eaa106d192c9daf37f95
> Tested-by: syzbot+eaa106d192c9daf37f95@syzkaller.appspotmail.com
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
> Aside from testing the fix locally with QEMU and the reproducer,
> syzbot also reports no issues after running `syz test`.
> ---

Hi Greg,

Gentle ping on this patch.

Kind regards,
Joshua Crofts
