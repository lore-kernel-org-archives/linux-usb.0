Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D744A41D23B
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792236976; cv=none; b=G4qhQJ+f7xwvuXUnORGX7KExvBv6ebXiLmW0GbNHIP+kRWk24VAtEHtGGOf/mH9nuqX1Hh2s6tggBlL4KuJp1DvOwBUF35hdiW0oBu9tPVTwWuE0B8m1N6xrlVTW40DL41nTWjSDz0/yHks49E+PELhtIbveuKSPJTdiJ9cqr9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792236976; c=relaxed/simple;
	bh=yNAJuYmjmAjUWtFgm4yj7+VgRbs02dwrTOWE3O4Hxz0=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dlB3ReyXGNvCUQVXTsuDA3oZ/7AqJf3WRMkCDdJ+Suy2SMRz6Grvcqi0FHKZYMzA4DN/NmPQ5i7vfj0W5HB7ZD/Hod8Lvc1/4bzq3yTe/iwUkToHIk3DG+BnJq6uYxbW0w0LPROrMqNZvLbknBfU4CEyh0zzTfVeKcDut0oJOAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4aiWZ16; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4aiWZ16"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a4c78ee4d6so129199a91.1
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 04:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236974; x=1792841774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5lPor2Y39zEYus8yegDwQOLxe73Q923XLq/QXzQIhA=;
        b=P4aiWZ16cOwnP7tqUyRFrFV3f/GKp6M0UkToAch4MO1/NVa01HhsmyQrgOrbQB+bNe
         cS1RJLyi33Lwwz3+mDiofapf3Qe6Uwv5ooduXhh3rwnv7Mv3s62sMY07J8zAzaDf7tVk
         d+cSOv+ywyGvajfKfPiO6mfAdbqxtAh+9M3VWrrt7Jp1t0Q8Ud/xH/TaXWrQgceT6s/j
         zqWZZ9g3l0bcSTH2LUVpG/6D9hMWtB1ev+NFckNbPHyaBnEjiiiqJughOCx24XvDgyZ2
         ThDCl5BzPrOpBRYp6iyxW53YOcZMxwi80m/tXSp0hoCFjoV0xQaY/GO42GFZpvl3LjIv
         x3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236974; x=1792841774;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5lPor2Y39zEYus8yegDwQOLxe73Q923XLq/QXzQIhA=;
        b=TOm/bRDY4wAKT2HJG+VATsmUgvhabhpRKRwLJZCzfxN5CuL32ECMyUYLmwo1JgMxoI
         seQBGuyumRZbin8OeF/lJTSWIm0Ay8JHDnlNTGm7X7FWSnVDiSLebF/2Oiqqr7mWJjNw
         94fhpMxXGffWHy/+hTzFHjCNJkvf0SHY/ts11UgS+koIVllXJ0yWOU2mIdrod7iefFjN
         gFFhOTmAz0m2G4RH4CpzhaZe7ek3CgVae96D2YCcaVK/YTtMmrASeO2eCDhQyhRVv3HZ
         9zwMXuUnQpp6H6vmhVJbir7w08Bccwu6KXyWUJERE9RaDF2l626ckp40hE7crrXCDQ32
         sk0g==
X-Forwarded-Encrypted: i=1; AKwUvBw2icIcDHFYvc4ISmhKv0U7IOdv6ZicTCx17FVUs5CuFBS/ApO1Th/b7V7h4GsTD9ATp03rdQYQcnU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmuk70sGEn+nVXWTe/G8/nWDzdjgX1WtJIvplIFam+gtJS/v8W
	sulLyHAdzsoEigdnbxpc69L8eaznoDJ4EPtAYdl+B/DgfciKvrowbtn5
X-Gm-Gg: AYBFou07kGB5BMTGJemCsPZCGIvG/cx6DADmZhsGnQ+O6lpl8kMHTGHw84/A6IUBlLD
	l6ics6ygo5o4LnKjcMQGXFFiyzLR3E/PDg+ty8lp0Jeani6yiTaqw1tsKGdhSJ4ir+e1r8S3L/G
	JIjWe3IapRC1AKTc5AZ4ciUTbxsP1K5b6/k8h3pOduiPcOa7BOH6YY9JSWwfuh86c15dVArQfgE
	lY+sabmfgp9VwISqjFK+XX+cu8+aVfYNtB6e/xKYdT2T6ZF4F7uUDNRn8yoLs+4C7VwNnmsjYY1
	plrwFNK0MW7e3aoWl51n4uJzCngDKc4UP0bKb47XxGfLK+8qu+16I5ffxbKmu97Hq2KXRTUnYyn
	YfC1+Veb61+Q8tRDRb8GtPWLfDjEZ3yUbT7OkOZzIi26PR16xatlx06kv4X4hcWh6OApJyxiK8v
	XPmwmepFRCUh+SH47qK96oZIsvndjnCm30QJwmmJQLs6OQfix29EVfIPE49YWC/1R2kSsJd1Tda
	N/VZWk+iwezHmJKEaBzzg==
X-Received: by 2002:a17:90b:164b:b0:3aa:ff60:9bb8 with SMTP id 98e67ed59e1d1-3acef167affmr3313208a91.3.1792236973898;
        Sat, 17 Oct 2026 04:36:13 -0700 (PDT)
Received: from [10.64.8.87] ([61.171.228.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm12999321a91.14.2026.10.17.04.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:36:13 -0700 (PDT)
Message-ID: <6ad35dad.70c60f76.2e7ac9.12a4@mx.google.com>
Date: Sat, 17 Oct 2026 04:36:13 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Rao <raoxu@uniontech.com>
Subject:
 Re: [PATCH] usb: xhci: fix EP0 context leak on virt device allocation failure
In-Reply-To: <sashiko-outbox-175494@kernel.org>
References: <20261017111114.1135-1-anferneemelokc5@gmail.com>
 <sashiko-outbox-175494@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

> Does jumping to disable_slot here actually disable the newly enabled
> slot_id?

Yes, you're right, and thanks for catching it.  The disable_slot label
should pass the local slot_id.

This is a pre-existing bug, separate from the EP0 context accounting
leak fixed by this patch, and it has already been submitted:

  [PATCH] usb: xhci: disable the correct slot on alloc_dev failure
  https://patchew.org/linux/6C94F1F35FF16E76+20260806084909.2959131-1-raoxu@u=
niontech.com/
  Fixes: 3ffbba9511b4 ("USB: xhci: Allocate and address USB devices")

I deliberately kept this patch independent of that one.  The decrement
added here releases the endpoint context reservation made by this
invocation, regardless of which slot the current error path ends up
disabling.  Once Xu Rao's fix lands, the error path will disable the
correct slot and the two fixes compose cleanly.

If the maintainers prefer, I can resend this rebased on top of that fix
once it is applied, or send both as a series.
