Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5DD3DD52F
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 10:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284154; cv=none; b=feriL/9fkoL/vdiQFDG5d9mr3b0x2iU8KCNxEGRz/iM07Tcvj8mRRuPtCFDR7Ous1rPrciNwJCg0ZohPOvw95XFzkcA2qXuNlbEjAqrKOnkbJ6ZxQ7YY1SI/Eg+DYhH2RWYKWJA69WNhxrjAjy8mJFwvFVzCpwrvM7D0Qspmwzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284154; c=relaxed/simple;
	bh=nYyVkBCg2CwXLA8eIMxYsFqjNvwtRaOOTx15eoWoIP0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FMiuyOUr1gwNi883hYn2LYRhmDdrrDtDPBLwHoe0wBFxsxSr7/oqy0JHYDQZmgaIE+PNXu59aTMV88hwy0xTP3j2qpID9hUXv0Z/fAsjdKkMqru/XA1zm0ThwrbBbKiFt/y1MhnB13aURW2t5hCw49SbgNUhjmYjm7EntVOR1r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFYkD5Dl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFYkD5Dl"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c14a06c95so418265f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2026 03:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284151; x=1791888951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mNd4IDSXzGuSC+ps0NxiYBeNqXRgn5dUDXtsfXpigLA=;
        b=EFYkD5Dl0RKb8UGPv6PXl2ia1ndpg1Zbmrpu8MKYwii4zvSjnDNfdbRYV8mdzHkKpR
         +gvUlufAhONVTaBw2NJtFuD2TYiUrc8Ecj7MUXOtpwYJHUi9AcGYhEId5+ZTZWOf+pmr
         dZPi/LGt8a/6srfs1XJrM64BttBh48XeKQi44Xg2tSLTtskxVry5IZPZnFhqwLWELgkL
         QrZeoXdoiDTdPXmikwNiKXfq6OLXOXDEy74SusV/1hy09E2cB6kZ+bAg/mLrfWF3er6e
         DF2/77N3d4y1hTSkUfFZ60FX1Nz8v5Dn7Zg/LSPfSeTohs6+unq5ZcUn8MHybdu2CWJa
         yQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284151; x=1791888951;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNd4IDSXzGuSC+ps0NxiYBeNqXRgn5dUDXtsfXpigLA=;
        b=fJbAtSiqbrXmhYP8qT72yeoHBxPb/cn+fBwhmXXysV1htWmq9n+Ri80qpFudiq/hLJ
         N9HKKhjKF2DN7k3skEh8uogFDBk5aHi7BrnO6DYELxvkZkRIqVdhp5ZwPvjhK5j+N9iz
         PQO299BlcP7Q6vquAlIBaq9uunBRQW6rFaP/oyoyMLUITOMHopzpBor1n+diSuin6lrp
         CrBc1WmgkC6ALwxUbD+nrQkNK4SxR5hmYHeaPJn1I1mDAb5sSOVAiVqm6y+wSKWjSAIb
         w/E3qKvwULaoTrA8736U1CcClxHJ57cZlKYwlEAfj3d8Ci4BkhGLYJNQ+8zClemc99xZ
         pw0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxkEj0W8MQXl1V9HEvY6zaToaoAOcCqlRMJ+D4QooELIiOKddbd9yPLSof/kxxTaB49aA1bxv2xbWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNRkuMkAeAVJZHxECyXbs/v4cJ1xw0CSdnot9VMQa3IAP7N18J
	W5ZAZSUQNhDH/I9Ysac8KSdXDFDp6FELiuch3HR1rg4CM+lHMlE7zaKI
X-Gm-Gg: AYBFou1IyjExAR15KkNity5vXRHPZnsqn3a7LhsV/dX258imIVTste8jtM7QsctZq5C
	s2XBd+hEak8zTLYMWyxMxqCzk4ukeP8GYlHsxdMFOA2pui5zrnIi8O7fXhnOg4Qb85gKxYsi1H+
	BtN8LrMVTdtSVovSL2fGP+WB/FkhxvUklPSLysESXoO8vfPcEOiCUkKCCvHZj7ysf73bpzeemOn
	Ds7NY2n7Ey8FtdhUc9rHQzhnOZKjypv0p80EvnbXP3LiYrehISUwY7cLRwGmkARCNi6lFtRWjpS
	iZWHxRkfVrMWmo7B4SVtIIt8YODs3ZqxakrUc3z8GxH+3OzYvCt/L5zA5Tb/eE2suULWZxtUsok
	zhn33O9NlOJ5QQfMjrDQkZr8EUZ8nionUL5SOr5J1w5qQXTvR/KdLq1uE6L/lkykZlARw5ZJHo/
	jcC4SfgCsj7adWYJuZRUxhy3eCLeI7AuyGqyowdUCNfpeY5zMQ7JYNv2yRfzId30y+lk/tAwKlQ
	RmJpqR0sbVFP45iZ+Fy
X-Received: by 2002:a5d:5c05:0:b0:487:21be:dcc6 with SMTP id ffacd0b85a97d-48c6d1b8771mr2274850f8f.21.1791284151274;
        Tue, 06 Oct 2026 03:55:51 -0700 (PDT)
Received: from foxbook (bfj133.neoplus.adsl.tpnet.pl. [83.28.47.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd717f8sm2620092f8f.48.2026.10.06.03.55.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 06 Oct 2026 03:55:50 -0700 (PDT)
Date: Tue, 6 Oct 2026 12:55:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wen Xiong <wenxiong@linux.ibm.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, wenxiong@us.ibm.com, Brian King
 <brking@linux.vnet.ibm.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] xhci: Reset controller on xhci shutdown
Message-ID: <20261006125546.10471489.michal.pecio@gmail.com>
In-Reply-To: <55a53022d1c6f671a3ed549d8cf7cd1a@linux.ibm.com>
References: <20261001222527.11742-1-wenxiong@linux.ibm.com>
	<20261002102931.3cb06009.michal.pecio@gmail.com>
	<561d22493c3d078b26f547dd8f6f6f46@linux.ibm.com>
	<20261002161828.365ff859.michal.pecio@gmail.com>
	<55a53022d1c6f671a3ed549d8cf7cd1a@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 05 Oct 2026 08:01:46 -0500, Wen Xiong wrote:
> When executing "kexec -e", saw the error:
> xhci_hcd 0005:01:00.0: Host halt failed. -110

That's interesting, because we call xhci_halt() in xhci_shutdown().
So the xHC should already be halted before the new kernel boots and
then xhci_halt() should succeed immediately.

It seems unlikely that anything restarts the xHC (or is there a FW
involved?), so either this TI chip reacts badly to trying to halt
it again or the first halt (befor kexec) already fails, or perhaps
something is broken outside xhci_hcd.

Are you able to capture the original kernel's dmesg (through serial,
netconsole, etc) and see if the same "Host halt failed" is there?

And if you enable dynamic debug before kexec,

  echo 'module xhci_hcd +p' >/proc/dynamic_debug/control

what's printed by the debug message at the end of xhci_shutdown()?

Do you also get errors from quirk_usb_handoff_xhci() by any chance?

Regards,
Michal
