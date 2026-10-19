Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426530;
	b=ikcVYfx0leFcsvSudUQeyfEYYxJnT72k9QiQ4rAH3f0y8vcm9ad97DvEiteI1Y2e9Cop
	 4IAczWS2/Mg+ikBdLBdCQSsU6PgWpXHfmG3Uq15mijPQislMKXHg9XK2yQFZ9G205FbvM
	 /usQOQuOiStArRkFf1v9YskutdKUBoXRLyB9VqOJjWUZ+3LiMdg+5PPIuaw0NAMivBXws
	 HjDnqmDadrrdXXv2k4AkEcD+iscOXhuU/vtIN0XjbN1nhxdLG3YCopRgzQw1K6T5uQ1DS
	 TP6dvEzMUhJmbPzpOFgZpSi5glyq0yv3ofDpZDqoNg8b//V/bSVFLCZdvQWtGrc2lQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=sxvLHLonxAtIEKyDCtSl57PaQV0oEQBYciJAjgYjSho=;
	b=VCTsKOyYoDtyo3paJaBCEl414+b2sQXN3XT62lMV8Hv3NhTh6c7PJJS30eonyXuIpIpU
	 y1klezf8AleT0TAg6KdTNZ9ll+Gedu4/Z34Q2QskhWhzWx3zoMrmOJtQof/KeKTOL9RkQ
	 X/DC5KvygJvrLYG6WKetSjg1umPrMGLqKM3OEo8k0xo3+5kV3QxOSvtGedLn95ooncaRx
	 Mu+0exElCaxxAOUoRbD5+seY/tbpU/Vn66zBp0Ah8myNx19ARXWKQMXjqmc/qVjmu3iQg
	 dk9HkBLP5F7DZ2K4yVYmZAfWPWXSYzQSpuxN/AhLZqNiLjj0B5mOegCD4R/qdKj+pmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="TOeFQ6/Q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70E6606A319
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 16:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B70E6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TOeFQ6/Q
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so30274991fa.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 09:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426528; cv=none;
        d=google.com; s=arc-20260327;
        b=Tsmi6LuIUP1h1xC0sxliAsa9YL3VAKm5kdo/ojRXMFm+Q8rJOfhamHfVgZZmss3GzB
         9ru1S+amp0O3+ndW9k0hLz4VluYj2oyHiKDyonebqUEBZyrckyh5r+xfFNOsgmaKmD9l
         FLlJT5JR9O2jTvhTDyZ2ug5o8X1iWGHQE3wxc7nn7/vTmakaCotBk2UybcSYCY9xbdd4
         d1TgUnhz45K2I4ZiM3iKd0+AKxeB6H8/xabubi8GIj0fPR4eCoYWD7FQ939uYq8tbnqR
         BerdKmf2GVXl2QSPqfPamA/rPiYJfSyh0dp5kfotOlS4SwF5GjkztOODKxBNpxlXu5Ml
         Wiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=sxvLHLonxAtIEKyDCtSl57PaQV0oEQBYciJAjgYjSho=;
        fh=PmYiok2k2zig0wAVdfnUgLxmuv9N1bbacEeDXXJ198Y=;
        b=BCItKjKhYl7GNCiUDJ+FT+kxSJAVULAczNYX7P3f+SdDhtZ5BOExnv+Qt9FDOWK895
         Hr0F5B1xaQ4r7eBHyJvW/1j3aiDRcPzRNd8Za9sEpsXxdVxkagWqa8s5cBAnGeNLhoDb
         ALpHuIxE/E/nB4fPvPhjCJHKRvxellF9YUyJJUidRoW/wQEPPtwsNShS06xrsDgcghsL
         ES+7TXf5KqYRzRO19o1hg6NX5RVRiEiSwnAbjhGDzhMP2b0oxiOaYIJVZXuYvkpq8KlF
         6AUOa4lVQBmt457hQR8Qddc1pPqLc/exDqcLq3YOSGeSci8dRxQifojZ9awmJhXEEXRe
         8K6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426528; x=1793031328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxvLHLonxAtIEKyDCtSl57PaQV0oEQBYciJAjgYjSho=;
        b=TOeFQ6/QJpeBWUEPZkRvr+E9VSWcCyKCgCzjIrhc/wilmdHJzIX0lQYKxsDx5aUpEB
         IIKnAnIxxyD5WpzNgM+P5aQO69OEbk/QlYdScieuEgbARzUeAxNY9D87HP8doYoFMIcj
         WZ7GCdAaXOVTnpUv5yJX87AWWXTmNPo2So8avzr3TZRMgby6gWutUKfM9essXp96YDzp
         DQdJDECXXVw9uSArAEEK5SdyEEl9x+Xy4RZpL2LF0nAYcmU39j2KjkMcYU2SvYrfoVeL
         CeCutMLAEGdwk8UFJOMpT3UiXrZpvnB/f5rjaDK0eGUJAPjvEvlP0i/dhnx2R2Pnv0hf
         gUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426528; x=1793031328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sxvLHLonxAtIEKyDCtSl57PaQV0oEQBYciJAjgYjSho=;
        b=jkdZf0IDa78cOi3BUiRcTYA8JyY8ppUoGw+Umk5XoB8eqL6r929Akw81T/kBXpOH8C
         Vdv4HJruBhRkfaKaNh+mAcXVSjsQCpyg8mLQx6iH7rTkVFPssvj3VQYvnWhmFvY+9KPZ
         HLI2n9q9xruMPp1mcmJTB+4DOGXpFiMSJqzgFSW8nLXWUsPvpVrHKUyBCUipjl7UDJl0
         5VVNts5vXREj24VFc1mmJE8Z/K42qjaNsdqHbHO/Jb1UsZCY5KReiqkOZfYi5smjrQ30
         yJbsFmzUGbLQVDYU6s674kSxZLlcu8r3hB2kAcP74CAvz9jUDKhhspA6DioGsTowFlgn
         0Kew==
X-Forwarded-Encrypted: i=1; AKwUvBz2W+3kbrggs1yuIMu1v4X/XIXUo/L6HuH4zBW8G5Enj4eUpHEAxf/Y0NqsEUOihL+FPEfGnjMCVGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIS7iD/tyzkMDiNxTqjjdI5b1n8C7tBMa+8nk2rsPKXZzTt839f
	kLkvJn/KKou7EisEDwWsZ+Uwxig1OGQF9NtYqsnZpEMVm3rrwd2AZ7O/ywvC3rcv+vJIdDVUn37
	5yvtk77ZhNVl9XzAj07nOk8Ovl4ZA5nk=
X-Gm-Gg: AYBFou0EZx9z65xy9U5u4Hf3cJ1JLP0PbuH82TKPCBRZFZHq2N0Tb+FoNNfR/hyuCcE
	82Z8GyIgvA4k5dAAosoyu2DbI09miSVJObvnalXgVXgRwbIqmZzKYNqjPdZNfmBSYK9BUYjrmM0
	E71+dIGCEHd7j+s0IarBSHtMtQnH7pbq91cSbdvn6Bx/NaJr8whQIWG7hPApI7DBcrMtFoA7450
	0ki3KN35b7VVJm7M4mCtUgd3tYwM8uo+2nQtzBRtcBB6jrPap5nyeDwf1aUcaN5Npy3V1OLv/Is
	3FTYgVt78q1v10VbuIykTbf6QndSihsX9JEKXmLDrqUW6tuNaDFLky4=
X-Received: by 2002:a05:651c:893:b0:3a9:a197:c0c5 with SMTP id
 38308e7fff4ca-3ab147a7077mr23817611fa.11.1792426527597; Mon, 19 Oct 2026
 09:15:27 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Date: Mon, 19 Oct 2026 19:45:15 +0330
X-Gm-Features: AclHuK8NnwqmOakfIFnKy2pOOIHSjjLi5HhfMn_ExQtdiOinQoY-F4nrBSahe6k
Message-ID: <CAB_t1-ACDiUrXneHbqVy6GWcuCJqnQNdM0poRyrdv_y7G6TKzg@mail.gmail.com>
Subject: Re: [PATCH v4] usb: ohci-omap: implement overcurrent handling for
 GPIO-based power control
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[resending to the full list as requested]

Dear Mr. Kroah-Hartman,

You are right, I apologize. I should have replied to your v3 review
before sending v4. I was not familiar with the mailing list workflow
and will make sure to reply to review comments before sending new
versions in the future.

To address your v3 review points:

1. Lock: You were right that the spinlock was unnecessary. It was
   actually harmful =E2=80=94 gpiod_set_value_cansleep() sleeps during the
   I2C transfer to the TPS65010, so calling it under
   spin_lock_irqsave() was a bug. v4 removes the lock entirely and
   uses READ_ONCE/WRITE_ONCE instead.

2. Naming: Renamed overcurrent_status to overcurrent_active and
   overcurrent_changed to overcurrent_change_pending.

3. Include order: Fixed to be alphabetical.

4. Regarding the code origin: I did use an AI assistant to help me
   understand some of the kernel APIs (especially the OHCI hub status
   register layout and the gpiod subsystem) and to review my earlier
   versions for bugs. The code is mine, but I want to be transparent
   about the assistance.

I do not have the hardware to test this patch, so I cannot verify it
at runtime. Given that this is a legacy driver, I am happy to drop
this patch and work on something else if you think that would be
better. Otherwise, I can send a v5 addressing the Sashiko bot findings
(the IRQ handler ordering and the probe falling-edge race).

Please let me know how you would like to proceed.

Best regards,
Muhammad Mahdi Amirpour
