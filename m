Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912B9438026
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 22:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671827; cv=none; b=aOxR54Is+iJNU6Fk37L5MztJWMLnE/Bv+NlmvoI4TQ8/eEXzMT/02aAWCF+Sl9eaU2y2drx28TJCU/apoX7/Sln7Yt4hphRYVrgwvNTwYlyVe1wcswNFytJ4Vw4hI37F5pgAhxsl4p00WqR6HWOgakOw5uFarIwk/IkXz0YyFAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671827; c=relaxed/simple;
	bh=bfzIW94VGV4aa8VbT63J2yX3En1AiPSPfx//cVs9tec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uVegM8WgEh3Vj3tnZqp10+7UZve6BvCe5vRRL/b4iybdHPdhHpuUbvNT7LhE2cID3PWPy3T76fWkZTjzSJNreBdQb4tV0j1l2n1E0VsfROgFcouebg8DH+EwDW5veKatc/Sq/Cjm+B/FtidgGGBWz9652/tmeyjvtSaM0tO+ZPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=VSAb5JPx; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="VSAb5JPx"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9aea40d799so4175658a12.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 15:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1784671825; x=1785276625; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MVmrHMpMqhlwcI0jqQADf82qCf2cqkqHXevYBahEDk=;
        b=VSAb5JPxYSmHZI+iewGU/y2ouvHYMTMJ6jLGPECOQ2dVy2tvUBDkgddahUzdlMsEo+
         JojzgQ9/C+DJEs/Lzj577ajAc4RWO3nJuvXRuZRVfaPz4+lP5IG9TkB7WTc+IAwFJuau
         jGdZD1lgqP6KKoNYqTyg5k/lZqf3G5kPQyuPlP4ZrCgCR/HgZNXBXY2o+DCSn61DhJSc
         vqkbYM+03Q3eHDi6aXagQqNuTT5HWdWc2t1OM2dtXoh7iGhY2MZkyZVCnjWX09cGOWmP
         QiiBP4pTa8aHdtR02WuFjPRp0kbOViu4iQyw0MJPRmNOjD0xwhSjTjFrWUQ9Mf1UhxN5
         8CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671825; x=1785276625;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MVmrHMpMqhlwcI0jqQADf82qCf2cqkqHXevYBahEDk=;
        b=VY1n70/9Z1aljo4EakS83TDcHUoDIAkFoYn6T046OObiIx+5f8TJ4gRNzrQ9Ss83rp
         rUhYiF1BCyVuRWDmwRmbn63Per7ob+Vnd/K1HCuGrlQZAuFE5nUvjLWrboAuXMm+onmC
         zq5Qji+oLRb7Yg3h9mJrSXurQsg2KfGz4JiLtoGHf7uhadqh1s1vH+ndFdf5wt2VJq/N
         K080z3dxKXxR8eEO6FX9Veob2jhkOEBNEofEQcAHfQfXvVRWwRwblLHkj1zmIu7lrxYC
         PQQt0yM7jRthtumyP5hmU30jipNDZLP9XUWCkzhc0IPcytatYYhLHX8ztPasVxlPPD9M
         P/7w==
X-Gm-Message-State: AOJu0Yy0JWMBKF2iEe/3XRg8oxqphB4eza0QIjHYMJhoaNqVA2rHhUkx
	GCBDLq62LqaprOXUm0eVrXnN29v4pX/Vyx6x9fTlKv+O1STX7hnXE/4bOZOuYrc2qiL3JEE3ou7
	W+6w3jUI=
X-Gm-Gg: AR+sD115a5wWE6x/GyrQEhClEy7EUfRg8FYv3XVWYel1AqHLkAsY2K6eNM+6s8rVKkj
	OrNA88KZ3KtA1SeBdc16MWCViQ2q/eGk6HsM0QgXNcuNyrUG1DOpKdAuqCKmreIEcItThzXQt2i
	3a/Jz8g5gNsUpaevumsezfKxGAZO4KpR6ai7kxJvkryzRR3Bw2pX75EaoNEnzgzF9n+wgZYpP7R
	b9kgeUt4VI94M2iVJ8Xiqpg0pid2KHkc2AqrDdaVBpu8NwVYJP26SqzgCWfMDdKjYQ7W2sjBbKX
	m7ZOKxdBWjmOKL0gbPX116qbLfRKUiVLWbWmbomeFgXrYKuWj0tAphNw3M9sbnsTCDTz++zKcMD
	wysA8NNjdEMBtCmKiMDhvCsQnxnmd32tRfVVd1JBMMzTi8QLZvZ7pdzMfYVthkNMQ9ZKzncf0Ml
	djB9nKnlgqulZ3PTI+g8LKX983zag3CoDmpftHEqN6nt2UcOEwCD/nvC6Xtuc=
X-Received: by 2002:a05:6a00:1bcb:b0:842:747f:c043 with SMTP id d2e1a72fcca58-84c29229dcemr18902133b3a.1.1784671824759;
        Tue, 21 Jul 2026 15:10:24 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:39ac:1c76:5270:b727])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17602046sm300234b3a.59.2026.07.21.15.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:10:24 -0700 (PDT)
Date: Tue, 21 Jul 2026 15:10:22 -0700
From: Bart Nagel <bart@tremby.net>
To: linux-usb@vger.kernel.org
Cc: mathias.nyman@intel.com, michal.pecio@gmail.com
Subject: Regression: webcam freezing since Linux 6.15
Message-ID: <al_hchyOdPoPWKEo@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I regularly capture from screen and webcam while gaming. Usually it is
rock solid, and can capture for hours and hours with no problems, and have
done for hundreds of hours in total.

After a kernel update from 6.12.83 to 6.18.28 I started getting webcam
freezes. The symptom is that the picture from the camera suddenly stops
changing and will stay as a freeze frame. The camera still claims to be
active, and the capture software (tried with OBS and ffplay) seems to have
no idea anything is wrong.

I have found no reliable way to reproduce the problem other than running
the system at high load (in particular running a game; problem occurs
across multiple games) while capturing from webcam. In my tests so far it
has taken anywhere between 8 minutes and a couple of hours to fail in
these conditions. Freezes seem to be less common when the system is under
less load -- for example I have tried leaving it running overnight when
the system is under low load and seen no freeze, then I have started a
game and seen a freeze within the next hour. I have no way of knowing
whether no freeze is a pass or it's just that a failure didn't quite
happen yet so I have been testing for many hours while bisecting, often
over the course of a whole week or more.

My bisection took me to a USB branch leading up to the release of
6.15. Specifically:

ddd0172f182e pass (branch point of USB branch, "Merge tag 'tty-6.15-rc1'
             of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty")
a1b5bd45d4ee fail (merge of USB branch, "Merge tag 'usb-6.15-rc1' of
             git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb")

Digging deeper in that branch, these are my results during bisecting
(sorted into graph order):

6623c40bed7a pass (usb: storage: datafab: Use const for constant arrays)
bfa845994282 pass (usb: xhci: Complete 'error mid TD' transfers when
             handling Missed Service)
906dec15b9b3 pass* (usb: xhci: Fix isochronous Ring Underrun/Overrun event
             handling)
d0b619599e52 fail (usb: xhci: Expedite skipping missed isoch TDs on modern
             HCs)
fe1ccba52a8d fail (usb: xhci: Skip only one TD on Ring Underrun/Overrun)
d71cb7d6e1a2 fail (usb: xhci: refactor trb_in_td() to be static)
525b139fb403 fail (Merge v6.14-rc6 into usb-next)

The asterisk with 906dec15b9b3 is because it has survived 12+ hours of
recording while gaming so far but I did see the webcam freeze once at the
precise moment I made some changes in OBS. After resetting it I recorded
for another 6+ hours with no issues. The other failures have been much
faster and occurred at seemingly random times, so I'm not 100% sure here.

If I take that one as a pass, the bisection points to commit
d0b619599e52fe3e1454f7d151dedf2b194f61d8 as the first failing: "usb: xhci:
Expedite skipping missed isoch TDs on modern HCs"

At the moment of failure I have seen a huge flood of duplicates of this
message in dmesg:

    uvcvideo 2-6.1:1.0: USB isochronous frame lost (-18)

This happened during some bisection steps but not all. Regrettably I did
not record which steps produced the error and which did not. In fact, I
think during the weeks of bisecting I remember at same point following
some advice from an LLM, and it could be that in those cases where I saw
those messages I'd enabled some extra debugging of some kind, possibly via
`echo 0xff > sys/module/uvcvideo/parameters/trace`. Or perhaps those
messages were introduced at some point in the kernel changes. What I do
have recorded is seeing a steady stream of "Frame complete (EOF found)"
messages during normal operation (possibly with extra debug logging
enabled) which would suddenly cut at failure time and be replaced with
those "frame lost" messages. There was no disconnect event at or after
failure; the camera's runtime_status still shows "active" after the
failure.

If it would be useful, I could go back to failing versions and try again,
but for me it is a painfully slow process to build the kernels (I am on
NixOS and I have not yet figured out how to get ccache working so it is
building everything from scratch each time), so I'll only do this if
directed to.

The affected webcam is a Razer Kiyo Pro (1532:0e05). It is connected to a
USB 3 port and is the only device on that host controller (bus 002,
xhci_hcd, 5000M).

The most recent kernel I have tested on is 6.18.28, and the failure
happens there too.

Please let me know anything I can do to provide useful information, or if
there's anything I can try which might prevent the freezes on current
kernels.

Thanks.
