Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD242EC083
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464589; cv=pass; b=ha0HInFdAl6ihDjPs/okuefu9nacgwShmMzYtCpLObN7whl8X0TtJm75Pz0wBSqsnbFXQjBorv2zIVrn8pxaZkWPMuSGDN5/pmA1cl9AKrNZ4LyBSRb4tv73HhE8JHwNap2tnlWN6wzCMexg+tbJd+K+YRzTneYEaax6QLOstxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464589; c=relaxed/simple;
	bh=zbj+RaISY9qEBJ+o2V/HJBoiBS/Q0644xws79i/6cIE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlQN8/fNvP1zYGxy/lHETmzjRvZd3MlcMSoyrVWdQMwXosRdNZFRHn92ilUbuJ6dXeKsrErxaZ0e5hS7DI1dqld6PSkn35vxUiOrYJxPqmkZOwJobu9orWx4LwNNEhaQhulZ/sQolhVpjdg+hzGt97yTr1JFQXUIYknzSF4aE5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvt8c1g3; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvt8c1g3"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398a5aad413so3809318a91.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 06:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791464588; cv=none;
        d=google.com; s=arc-20260327;
        b=OJtkK2LI2ziyIXfIpDwPQYLu0d9b5QLaiQUrK5A5SUXQ/fqHPX3FSbqCT+Uggtsfiq
         42PmBCQu+YqP+18bGgp5VEFdc2dvEjcjs24QYY6NsVBB8x8tspQ/cwyslvnEcnjAnk2H
         tDbDMmeZf7h1bSXN9z1ieFVnjApmCB6fGzHR7ho9NzAfzkwPpe1vljgbWFl9wZdbGa/M
         YPEyP0f+2J5+cIU+3+amjikWA16p8WA9Q0IH2XuPcQtDaCDmW7bJGyMa8ufNkiWtmxY9
         9v6VluJRmvowo0tgjMGNrdGzSmJUXilfUTpxnm2oEahvJ8WnztC1wjoMSXwselM2DYZG
         7lDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=wbMv8ogoXgQX443s40s5hnK9BktjeqTsYVUhK1IFyzQ=;
        fh=d+cf4vuQ0UFfIw3PhSik9NnAP0CuoWVFinmrPDip18w=;
        b=GwVdhMrLDliEZM+wWVEintiuf/v4rqZToSekKD6nQE5uH2oO4h7QAkVf68KKUiF6QE
         4iV5wGdDIzSUzEx5NnTv+gZaOupDlBuTS28bSNl1YCcxQ6dsu8CqkmHUm55pksB06ugK
         jmT/IDWh3XCgJfIe78ikAVC6E4AgYgf04vK8cYwBbUz3avG5uWs5J3FLzsLwAyYnxM0T
         f+oRDf5fV8o0qkflOGhyR306CeOQ7AgOuk0HDSfL72D+uBVhN14yYfgdKlfWTozGv1iN
         jL2gad0/LbDdvCnqBxM0rAaia4ufz/TPQJ9OlnTUCqaowa3wjOx3snXG/CGr11iVNXBW
         SBiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791464588; x=1792069388; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wbMv8ogoXgQX443s40s5hnK9BktjeqTsYVUhK1IFyzQ=;
        b=lvt8c1g33pjWBnAE12BZVw34YLcsRAijClYbu9gZ6Ubr7lKXTFe6fCVPs3STPFew6y
         ADp/gBaYMZH09D6jWr+muxyuoCrhzVY67QUcOwrY9qNFQwGF3F3stoq0SaADWP3NfGM/
         xet9lYE7WJDHuXcOR1XSjleIZeplL1IWo3IHZRNCZ+Pj60jOJg93ulN1pD2KpL+F6K1G
         pIpbLp9BZdfV7ud0SHSOD10EN+CUuJyVExMMdAPJxCgLZWGxRy4hapGsl/SwVTViUE5J
         OZ3vAxADhoFDKYCnhnriBFDpBi+784eyybpC4OuUt8ywlo3uaLlZ42YYrny8Bg0bF9zr
         31tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791464588; x=1792069388;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wbMv8ogoXgQX443s40s5hnK9BktjeqTsYVUhK1IFyzQ=;
        b=TJuc7TPfMH4yV89b5oZm8G1JtXMAQ3u837/9gfGAUjhWnhJoxlyhlAbngGAyUe98yW
         DfB3wIooEpWFxmCn2SLV73rIY/zChbhrIXvUSiyiSMrA1A64lH5YAqyQHmYQmHKO59G/
         Itnp5ujaz3Kmm28hA9k8zD6oazAJkwb48dEZCr2/NeWEUTovAyp6ubKjthkfiPS3z7Wk
         HJ/jfcscMtMY/oR29ajVbZAaWA/W5WkIvsskCFxvbsrxuhpkhKplPMv+2iz3gxshvw9T
         B9Z/y+N3ZFOE662k76zv72njXsY2KW+RW6x0PIQafMbN3B3sxyFg/kTEyiK9mM9nN80S
         Z9Jw==
X-Gm-Message-State: AFq9FYLdvopQDHy/Sww8Tu3t5lkOtP/DGRggepIMhOCForDsuudLegdK
	EK2nkKSjiGUrtnnZ10g31KaFil2C0vRDww2qkl+xq02CeaiJUKGZZx9MLBkR0IuncepouEEpiYT
	mYmxBY84qUxgFTnNTQevI80a9dtXk21Y=
X-Gm-Gg: AYBFou2Agzytmc5JCmGe8Cr9iYt7w7OA98VYAVxNjvI9qojeKTKgE/DWQA931RqwlbY
	sVV9G6gzWBxrxBOMl+EoZRFPC0YyErO1tlsCE2x5aGTzg4OBQkQh+coPvAamTdtnACW6rxMZvrs
	/aCJORMkbOG33yAOXOEe1cuXo+IbUXB/vHPDDyV6M/q6CcSId0dqXKKWtDtfWmj92+AVvReU3pb
	ByNblaYOF60KG/rwT3LtIoXOOT+fn0KC2PVv6FfYFNJnCkl0SPPF0xa0FJBdqo0p1pkuFtbMOUC
	Gvx+rFKedU78IK/Z+hkvm8n8+bOf9rle1OKGNJZKVfHpAxtxO1+NskR0tnO41d+v
X-Received: by 2002:a17:90a:da87:b0:3a8:80f4:98a7 with SMTP id
 98e67ed59e1d1-3a8a1bd661fmr4380072a91.24.1791464587670; Thu, 08 Oct 2026
 06:03:07 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 8 Oct 2026 08:03:06 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 8 Oct 2026 08:03:06 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261007224115.755ce40d.michal.pecio@gmail.com>
References: <afcecb34-0024-460f-bc21-a7f2b1754d23@rowland.harvard.edu>
 <20261007191130.8652-1-ooonea@gmail.com> <20261007224115.755ce40d.michal.pecio@gmail.com>
From: Giuseppe Piscitelli <ooonea@gmail.com>
Date: Thu, 8 Oct 2026 08:03:06 -0500
X-Gm-Features: AclHuK8d94ZlAMXeaDvgj2EgcSP4fxLFqo6_9tmG2H2aomtW-IKcOXCsjiFQUrU
Message-ID: <CACmoRBboPM3jNnfnOv5FXAJt1avBGwH2W47Pcq7RaVL+oBFt4A@mail.gmail.com>
Subject: Re: [RFC PATCH v2] USB: core: emit a device-level modalias
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, I switched to that approach: blacklisted the charging driver,
dropped the device-modalias backport, and booted the stock nixpkgs kernel.

I tested an existing libusb utility that does not claim interfaces [1].
Its optional charging request succeeded, and iLoader continued working.
I have not measured the actual charging current. The command remains
manual, rather than running on device arrival.

[1] https://github.com/FD-/usb_charge/blob/e957bcfc47262f8a47d652d7d417723578560b23/usb_charge.c#L42

Assisted-by: OpenAI Codex


On Wed, 07 Oct 2026 22:41:15 +0200, Michal Pecio <michal.pecio@gmail.com> wrote:
> On Wed,  7 Oct 2026 21:11:30 +0200, Giuseppe Piscitelli wrote:
> > On the first insertion of an iPhone (05ac:12a8) after boot, an already
> > running usbmuxd can select USB configuration 4 before the charging driver
> > apple-mfi-fastcharge loads. usbmuxd is a userspace daemon that uses libusb
> > to communicate with Apple devices; apple-mfi-fastcharge is a USB device
> > driver that enables their higher charging current.
> >
> > USB device uevents have no MODALIAS. The charging module instead loads
> > from an interface uevent. Its registration reprobes the device, unbinds
> > the generic driver and calls usb_set_configuration(udev, -1), tearing down
> > the interfaces and interrupting usbmuxd's transfers.
>
> What is actually the appeal of apple-mfi-fastcharge?
>
> It seems to just issues some control requests to the device when
> commanded by userspace. Userspace could do the same with libusb,
> apparently without unbinding drivers, changing configurations or
> even claiming USB interfaces. I just tried a simple program that
> queries GET_CONFIGURATION, with no disruption to kernel drivers
> or other libusb applications using the same device concurrently.
>
> Then simply blacklist the kernel module and all its problems are
> gone forever without one line of kernel code?
>
> Regards,
> Michal
