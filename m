Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6E151AEEB
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 21:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790112751; cv=none; b=TuBl3h+gjSV44twpG7lErIpSkTmF34DU3SLOg0qwbX5s2jTq974JoVNCmH6sOOxRMRWwdg0wWjUrPx8qPutGRrWIa2jQhbEDyeyPE//eW4bmhCYIRiWdvEbvQZgvvOBjPrp7P59APEzwLmrJbhREJ6r0pSynlYQ5z5DRrHzaPgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790112751; c=relaxed/simple;
	bh=2WvlPAIbOGzbHSxW451eh2EWgHCeMfyZm2VVp4rH9Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTSx0jCcr4uT7bs6kzCG2LLnKALAQpXeGfMIxjxgneBhBZQoJVBwU3Gl6z3zTd9Pfs0zJAezYZgg9GfbeoAGhtDyEepf84sYNhpHqmY+3uZrGPU+rPmCTsA4n5w0agEetIZUgClyKBRlwqglpNJ2ux6OWyRDrBkO81XoJ9jWM9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/VYMqbZ; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/VYMqbZ"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0d298caso321062a34.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 14:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790112739; x=1790717539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDHhaSJenqoO/XxOlzKnAhXngtK3EcH5UtYe0wHr2pQ=;
        b=O/VYMqbZaieVBBW2hYUtA9maSTNTZCqIsRdEiVvUQmhD0AS+RjN+57nDZMC5fnmVXX
         xn4LOMA0GHSCNJGm+4ayNdAQwGNzaPEwiQI1MhT1Lm7fl5RW1UJKFtVPz4SAY/Fa7sTv
         ydTssnVoyQFgGglKGG6gey4motxa/zNudQPmeUIj0faS4218VF5a2qF6ZphyEo0RRt27
         pV0uMgfiUsjZ+GccbAtKgk+b+9DgB89BKTiAQQTHKeLZ+gz+2ql+mL2DyFTprX73utnE
         nwH7CsUR2CPNFAUAX+pzj617+vtjKDMfxLEzu5IGJ2MAW3UNl4A2cjtQnYlguLhK731N
         1XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790112739; x=1790717539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDHhaSJenqoO/XxOlzKnAhXngtK3EcH5UtYe0wHr2pQ=;
        b=GSIZamSnMuuO5ofPDftLeqF3Rqhk8xQhfOB4HXM/rwfpkzgk2iXH2kR3PNjOa0rSqr
         glu7auKE+HWuI6R4E6UjRCawwocsWkwEWBxwslH5Uk6seB3NyCKeTw2tw3bJj89/ngFD
         tM5h9oKSxuMZO0SHieA8f22u/gomtyf2PEYt7va+8kET4P29zhBPI4wCfLSFYrvZWgqj
         vXDJoN7Ide/AD2wtyZsAYHdXqUc6u+ZXhqeZy46DXU2dQXVdD+kYJccFyug0IS82OoFz
         /jFATH0llG58en6gkdwND/9S/+sXiqftfOQxdGVXz6Icvwh6hKG+eYjYw6PCkhMaWrKY
         Kd9g==
X-Gm-Message-State: AFuF++kSreQIlDKngYZwSEEGsbGx9OhflOir7okO5jW61u1/+chThmrg
	pVsEFYO4EUBSpAfDlcUqlz9a5JSUa4hz14TWYbXfeMgo+aCP4EzmNR3XBYiD0qT+3vY=
X-Gm-Gg: AYBFou2NanqZcaGjV43rRO+8v7CB6+Ub2lbNVdg6uojgitAHzHoJ3vJJSCtDbjOQ0Q0
	5QpJAwfc56bbOZSNcx9qxE3f6IN47fDkvd5RN21u+iSjGjXVrPeAFEa91u8394ul8aWtWWZ/J5+
	gcyxl194W85UbnMVUcsJqRIeboE3Jmj87IzNWGRVjLiL+RqJaydj1+kGb34ivt66tyvjMjrT+/y
	HBbHNIZFWncoIG5iFR1mdcChal52QVvCAQS9zHpDWsb1u7BOurPMe0gKamZifacmcIg9JAIzYcI
	auM10prMvSUwZbBSpsK7CNTpAHJWYJ04FlfNEt4LB26hUrPwKPXvE29X5MhfKfSiUQHQKVXXKc3
	2jST/GcRA0KqBRJR7eebxZgh0LVMLx5weKsfFtjCs9KRZ9I70f2nKG0sJxxMLKw3cQRXuPEyLON
	5+8+Pvm7qkSLU2OGp2zj45vJlEMXPaTdYezwnmIt+NAltTWBAunYp/LQtTbXluvAEIEdn9FOtzD
	FVUJCe8Z0qYfSBv
X-Received: by 2002:a05:6830:2b2b:b0:801:6bec:ff18 with SMTP id 46e09a7af769-815f007097emr1057735a34.2.1790112739471;
        Tue, 22 Sep 2026 14:32:19 -0700 (PDT)
Received: from localhost ([35.11.35.209])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-816044c858bsm947461a34.19.2026.09.22.14.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:32:19 -0700 (PDT)
From: sjunhyuk1@gmail.com
To: linux-usb@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [BUG] HP OMEN Transcend 14 (board 8E41): GPU power ceiling on 65W USB-C charger is non-deterministic across sessions (25W vs ~65W)
Date: Tue, 22 Sep 2026 17:32:18 -0400
Message-ID: <20260922213218.5334-1-sjunhyuk1@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922192312.40607-1-sjunhyuk1@gmail.com>
References: <20260922192312.40607-1-sjunhyuk1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Important correction to my earlier report: I ran the same charger
through HP's OMEN Gaming Hub on Windows (same laptop, dual-boot) and
found this is very likely *intended* HP behavior, not a bug:

  "Performance settings are overridden by system defaults while using
  battery or a low-power AC adapter. Connect a compatible AC adapter
  to restore normal system performance."

HP's own first-party software explicitly classifies the 65W charger
as a "low-power AC adapter" and documents that it intentionally
overrides performance down. So the 25W ceiling itself is apparently
by design, not a fault.

More importantly: **it also reproduces on Windows.** Same laptop,
same 65W charger, Windows test session: 25W ceiling from cold boot,
OMEN Gaming Hub's presence/absence made no difference, and the full
poweroff+physical-unplug/replug workaround that reliably restored
65W on Linux did *not* recover it on Windows in this test (stayed at
25W for a 60-second FurMark run, 60/60 samples). So my claim that "I
don't see this at all under Windows" was wrong - apologies for the
bad data point.

What's still odd, and still possibly Linux/kernel-relevant: on Linux,
the same 65W charger sometimes lands on ~65W instead of the
(apparently intended) 25W, non-deterministically across boots/
reconnects, and stays fixed at whichever value for the rest of that
session. If 25W is the intended default for this adapter class, the
~65W outcome looks like an unintended bypass of HP's low-power-
adapter policy rather than a "fix" - I just don't yet know whether
that bypass happens on Windows too (only tested one Windows boot
session so far, which stayed at 25W throughout).

So the interesting question is probably no longer "why is this
laptop sometimes clamped to 25W" (looks intended) but "what makes
the negotiated result non-deterministic instead of consistently
matching HP's stated policy" - which could still be something in the
UCSI/PD negotiation path. Sorry for the noise, and thanks for reading
this far.
