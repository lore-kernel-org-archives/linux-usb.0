Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9744A2F0C7E
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789353; cv=pass; b=T11KZd1Ss1T0UMe7GIW9irZZ6T1JgZ2dN+bgay4OIsXRW9+OJpx+xhufIeEf1MF9fYZMfm3LlM66EZuwQruDUcwVbJ7XY+xwMN9fV3eXPwcJw1MwNCBVF1HO0SGO++5ZlKDshKvCBArZZMcQfsb15OrP9rhCSn4bH2lNEMLhikc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789353; c=relaxed/simple;
	bh=DbKQmwxWj3HYUGEKUY649zewLbaI7f+NSVds+GO5w84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGVlo5fa5lHG1n9qjsLnrqujxTCkVSBOV9p0t3+WVKGAv61ETyzctY/9pHCaD9M/3bDPQO5s3almwcfy3oUkEmANvGCHZv4T0vAQ2A4ZAI60oWhJzSnAWPkA6y7axpwQ1pZMBWUxR2Llr5ap19ly6Z5FH6Tgr21Bbbq3fyHl6ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TU+vemB9; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU+vemB9"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8000e21f014so6691697b3.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 06:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781789352; cv=none;
        d=google.com; s=arc-20240605;
        b=kf8lY/szD4aVNO6d2Bso/Xw04RMO7plBqU4zPO317mqdKIUmWFKRFzhdXsdhRxGDY9
         x5lR6pm420sqiVg+1+mbgLEXi7U25VXtq5u7OK/Lk26uVO4zlXFe46OJ/dWDep5rp6AK
         JamtlXoEY6mMjQWXatoKjXkD5Uqt8oXVISiIp+vDhvF/ucMdHeKe6u77BEzVej6u6rz8
         7hAXHFoCyhtNcov8wn0g93CWKTd7h3cNj+oSne3pRwfWJJ++iydSe/a6+yAt6FW9OhrH
         yCw+GYESy4Pedl/wm0fyBmaus9WLCSIAJDlg/nfQZCwDy1dM2BJJNQl1YS7LUWO2nyJN
         nfmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K4lP2NEu0RECE6nohWfZX8N8vwcbzTmSMEDw0/6zupg=;
        fh=MN8aXh7vZDeclZG5waJhZBGdXgu9mxq4pChPeZ4WIH4=;
        b=k0Hkk8lBWu60/DeA68CCaNcTB9f2pHOlhDq4NlGoIj9LDYOAFylJAvGcfwG5QJLnHy
         UnzhcVGEe5GbaHDwqUBtu6AaPpPrvvNloqbrUy2DKEBK6Lfg+zfcMWm0DF9RzQivDChH
         txhfnM3HMBm3ad/xYP8VbGxHrGt0bWl3cdaRJ4ACqkV8Y1wxu6yLMhnDpMVabft2GqCF
         Hura9n2SJvZwURJpaCeNbtrKHHs5BKnKVSfLO0FArg1wcDzNcvopj7UXRHChpk3t7j0o
         iAv+pCqZxwv++aEGl6XTCpZq8T3uRUjJGSuTrteaU2PUeiKdpb2BcKfiSXgPbdJpXLxi
         fWzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781789352; x=1782394152; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K4lP2NEu0RECE6nohWfZX8N8vwcbzTmSMEDw0/6zupg=;
        b=TU+vemB9x0aD7OIntiwRSFt30+QhVVYGhW5YLiZnSJgzYStNffcYCTXzlRjOaUXZUa
         LeIICsH501SuUkGvMqdUwcubyCPU0qAhKj7aNtIT0zQPSroCppD6Npjsux9AcQBOiLxU
         3HRz4yCbgh8S06/oX/JAvqOcaYhLdWJu0FoFfHVDyVLRnBYpYsrUrRsH2BXPLzKKPWBt
         TY9B3hgJhIFV1P5LGiYD2il0dstBSlj1iSa0chls89QJLBd9tbHdJTqE+kJs+N2nL+TZ
         uvC/2yXxcmDJpZWWpz4NU2nPcIAhmyit7UTIvjv9fX6RNPtE0p2NFwnGYTF6KwMozetp
         WYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789352; x=1782394152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4lP2NEu0RECE6nohWfZX8N8vwcbzTmSMEDw0/6zupg=;
        b=KCkFjd0dEPPUiTN1QnxG+xFChqDamysWsI9ONVqGTkA6sGCzRYc+SPCdQXx7I7HK5K
         8XKIIpQ3HnKVfo9XF2WhslUaMh7jIFy+wqgqxS2eQmABmMQrVgJOj+KrSTMmT3uinn/H
         Ax1aUAkrEqQjYFwhErL2C1lnVqTSJSmDkeHbFCCB8nZMyft3bHcLOx5TOACK1e4TKij3
         NeaikE8MH88pD8hiemefjj2gEFF6PKMS+6r5FSdT70wF3eREFgtkud51FtTK25PKQitM
         qAPvVDed4eE40KnT51cOhofb6X6WFJUeFktWWxflVpGUXon5Ppeo5I8xnPLHD9WodHXH
         5nhg==
X-Forwarded-Encrypted: i=1; AFNElJ9dhIugsQJUCPx9s5cuaUZ5k3MTvuMLbTiKkGhkUSz3GLORhJiS8pE5XdPWfT8uuloMM21+C0FAeUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUqe9w8NW9U/S4i5/whQpPOXgkLlbc3vs7eob8hxt7FN8lMR6A
	Q5C0UXDTDrbUyN5TCiRc/LQnMTjoGO6bjZTsODKK081oWVzCEPKx0y5aLGzb9HRm32OqkSBI/Rj
	fMURlw4kqNXevDRs4h5XJhaRgDbcG1BQ=
X-Gm-Gg: AfdE7cm8ZWGzxrhbHX/Lujj3I9t+BEQ/tmWt7iDied/71nVL+YxFQsR0HohqdjTt4UE
	crYUOSOTdw04L2qF1aGyKsmC82ABUeUgD334mMNQpaKbYkv8znEOFX8Jjwl+6YwjnXMMMFAXIx5
	hyEfCdfBG3Z8Xw/ict2nYLviyUa7XgDUax8E5Yxpvwa14qaX5oI9RS8zBF5/kXo7MU+noZOiZIr
	Hjh/0xuOBWc4+6Xwhn0pYP9fOIuQMA31DLbp/l6hlk9trfe3A3hLipZVUkkB0/6u9iYsoEcV8w=
X-Received: by 2002:a05:690c:6e0f:b0:7fd:5297:28da with SMTP id
 00721157ae682-7ffc7ea1a72mr35917867b3.49.1781789351627; Thu, 18 Jun 2026
 06:29:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618104126.3392136-1-zzzccc427@gmail.com> <ajPwkpRByTav6VOp@hovoldconsulting.com>
In-Reply-To: <ajPwkpRByTav6VOp@hovoldconsulting.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 18 Jun 2026 21:29:00 +0800
X-Gm-Features: AVVi8Cf6K2Jao_vgjOxrQ-tBsgtEZjSFUVk5xkqK4sc-NyUA5B_fgsaPCY0vxoA
Message-ID: <CAFRLqsWY=1H7KLDzkhqjoS5Aa35tLO3-qz5pwj1dh4wt9-bFew@mail.gmail.com>
Subject: Re: [PATCH] USB: iowarrior: kill async writes before freeing on disconnect
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi

> I believe I fixed this here:
>
>         https://lore.kernel.org/lkml/20260523170523.1074563-1-johan@kernel.org/
>
> but there may have been some confusion about who was going to apply it
> so the fix is not yet in Greg's tree.
>

Thanks, I missed your earlier patch.  I will test and verify it on my
side if needed.

Best regards,
Cen Zhang
