Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD6D3451AF
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 15:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524009; cv=none; b=MrIwNeRwS4v9/l81dWXUkyGjsQrSCJeFOptTgg4xrx1S7JeuPrQkYxOX9cQWXtlGsblh47ycdJLzbQ0RMkrl/o5Y6lxkJ2jz4ubprEmBxftnDyEdx4a2XOoOkaM3ClUwHxEuFXC0vyZ/9s6rjmVHFp5/0wJqqW6zg098tPnTPL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524009; c=relaxed/simple;
	bh=rVynhSGJQfBar7kSfKUFXagH6yPn9k2sg2o3J/K/fsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mv8zmyWvmiwkChRIvTWoqV152wYmaPG56kTCUYwNORq1JwsRnBNsB+Lr/Cw/QyfNDdUH6DdE4r7oG8QzLHtf53Jk+ZT4VrywNUXnOXGsYhC67Xt4g51dSW3Hy7XQiDsAKtKeLi4UHG5rppRmQ6cKpKy+N0o3EcZNE7OMKox0LJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oe9B+adj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oe9B+adj"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1276f8414bso97387366b.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783524006; x=1784128806; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mqSnMFPiVuGNOhIZD7zvUQogIz2kUM/yQukQ9r5KdO0=;
        b=oe9B+adjoMC9qjXenAlnRvS+8hwquFqufZPIL+U2C/8R4lW3HoMKUk83wa0K8WhFqH
         8tLWtbUq/6hNexKgWzGHGYlE9VX2IwlwTCgkPgr1N+/s9LxeQ/xXagnmnq6g1gx0LI7d
         Zuo1nmB2TqDgpTuaB1ClP56v7/bf4osLo99+Om//SjyauoIA9Md+Dtarxi6hjkXTnJMt
         dONF0kdQ9aU/VrHdt2qlbPOzLMf5g4MDyJGZ/3aU0U4R+NxlYKAH4MhCh6S0GxGI92UV
         Qt6QkVrnMrUhlmRyYcU2lHWxy8Bq7EERn3ZoqWuR5XX4BD5HSMtyH2s2DZ9m3zzoZsL6
         /zbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524006; x=1784128806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mqSnMFPiVuGNOhIZD7zvUQogIz2kUM/yQukQ9r5KdO0=;
        b=nywE26gHukh3S53m04V/3rO7Nj820LW3jBzLqxIRZH81RFEC/3WTv7rh/iVQu3ruyF
         dKbsi5zHESjlp3588SxPqSn23TqskoLozHMV+k22V3unqAy9VOvIgKCEEt1Mfj8jnz0f
         5gRfPcA199Zos9JtsSOQkl703YPoSFWbvPXZUDyGaggwn9GSXY8TAw6RZp46vKmFZLmQ
         2BdF2zYOVSFLY2gA2lGkb9zmeLapksQjimv5L8kq1nllrAFczbPJjFwiEfZzB0tms6v8
         c2OHbEuRwazzhUCHRR3NUIwOJW01N9ndjFs4Rc/hxzZr+xjhFkxujTn7pyceEkfzx/IB
         IaGg==
X-Gm-Message-State: AOJu0Ywu2stQDyyMU4uEkPpXEh1hXOsv9H3MbP1FxsZG3W09CQ2zyMCk
	wiECTzZRrBUkoY/6NxiLAoeR1eSccxZ9cbAz2aGXrkTwFA4VZPIaxbKR
X-Gm-Gg: AfdE7cnRXLUgI5F8wUsiaT4FdtFKn5Sa2Blf+xBGFqJOoOu2YoPuOMtfBXgGnLWz0LG
	tFOvuuTrcWPgyw/PJy+O7Y+uC1Rn2fGArGIEgpwZ4l8PNyUixqJlUVy25601uPo2kTQIavI9tgt
	Q+FVBjpEwtDUtcRIXR3/UsaWb1oI/J0EMeRvRF24TBGvPIjn93l3FE81dN1X3al2lF7u/RagdfI
	EKDdtsWp8pPhTnysJiFRzS1n3Z4PqpqAl48tHM5MAVmYJp0QviX21MmsmalGmbjCz0EFeVKjXUV
	4lFXPEcon4X5wPU9kqlNk3nRuLrhXrId4AVgePA0Mh+6OhdR5s2EKJO6JKH2UCx8sFiU0ZZ7YtV
	l3QUIAitX4y/k53a7DhUGGxjDJByh5aceBawUOeLo+s0NpSCCDI8rrVqBdtUSgGhABobq//3wQA
	1ozx5PGdJatJu2OW7Br5IJPSTfyjaKobEdCkq31cLBECyiikwUgWgCojH85OryMoLl
X-Received: by 2002:a17:907:c00a:b0:c15:c81c:d6fc with SMTP id a640c23a62f3a-c15ce06f33bmr137514766b.9.1783524006035;
        Wed, 08 Jul 2026 08:20:06 -0700 (PDT)
Received: from fedora ([102.78.12.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d6cbadaasm89066266b.46.2026.07.08.08.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:20:05 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:20:03 +0100
From: Jad Keskes <inasj268@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: cytherm: replace deprecated simple_strtoul
 with kstrtoint
Message-ID: <ak5pje51q2PLEAC-@fedora>
References: <20260622123124.2380612-1-inasj268@gmail.com>
 <2026070803-capable-economic-d54c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026070803-capable-economic-d54c@gregkh>

On 07/08, Greg KH wrote:
> This changes the user/kernel functionality, are you sure it is safe to
> do so?

Nobody writes garbage to these on purpose, and if they do by accident
they should get an error, not 0.  The only way this breaks is if some
tool depends on "echo foo > brightness" silently setting to 0 — which
would be a bug in that tool.

> What is wrong with leaving the current calls?

simple_strtoul is deprecated per deprecated.rst.  It ignores overflows
too — writing -1 wraps to ULONG_MAX then gets clamped to 0xFF instead
of erroring out.  kstrtoint returns -EINVAL for both.
