Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A96A523787
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864587; cv=none; b=TYStj39GoSUJPR6LKbHM320kf/TWxB6ZY4Udh9Tn73z0XeVwKm7Xn0WL0iF7BLNyd9dea3S/u+rc772AgyIArnfRcZwEwP7p/hd2bh08NHOd/13AMS2I1ZuNtYA8UjFNCkjUzFn+n7kBjl87hXQTNr60gHjTL8KSExKP3OSSm6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864587; c=relaxed/simple;
	bh=+f7lFKo1NHDijB5MYO4zHyRLaJQ5Y+XoWWoWZqH6cCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vD7FYdFDJNZ2CMWwXAyUCuPAOjgLt8x4TlZabIt94nKjWevbJBCfG1vmq5W7AAoYQ1F41AE2gWuBwq5ylrFLuxVM8QACyq04ZOE+tXjULymcxZIODrWROXryRsAa2dvwgc7TdZySWOcbiN2LltNnA7Ex0qe/LFZijGjENsB1CeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmMXsLzK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmMXsLzK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso44035235ad.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 03:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788864581; x=1789469381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFbjLRR+QxNWklfU9Df6zJrHL32Jh7ySvaRZ4XQ0MrI=;
        b=rmMXsLzKxxnVxqDb/avp/t+vPdcNTPGhvrYOwnOUl/qZjQZXFVzErDUaInKiErnBWi
         CWU4QlaicUQkE7eU4iIOwC5TAY3UuoLBwCBJERFidnk5mLFPxAHCKTo+CU/umB/VjaJQ
         Lu2ttyXGWJhkRlT452h4HE24szDZ5G6tKCSplneTKmUhw+LcVtOQsFdAE+/eTPfvEHrM
         KGAsJGkcXZw50sg3Xn4pxz0LcHrqBHP7MrG24PyeWuRqKCqW+CI6N6O/vKBc5FpMvdTq
         yVENZreyqTtdUy2HZ1gtg1QSf6vVgOHDr7Z1q1hZiw/OkBB5aL7dwbgiItsEzK79zPiF
         tK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788864581; x=1789469381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFbjLRR+QxNWklfU9Df6zJrHL32Jh7ySvaRZ4XQ0MrI=;
        b=LSbdaaZOMYa9c/IoWrhHofd2eRIxCBOlkFuUAtzXeOdxsv61Ltl1A/JklgreiXoUyb
         S3qqlGCMEJHN8cyWLV/P8qrtFCN01cOqgCSEdXxoZOZxvD+v6tar2nihDhJBJsZftggD
         oV21nHT8K6U15j6oKrKADkJ0G4jKWY6RBYc3rikyxKEv/DIt3aHGGg2cbJFfTR/fNlL+
         SIfE1XfW5cxRf60OalSJKPIO9pngri3LUf/HBgnvQEjxKRt2jkFMfNqZw+uAxjenvqIU
         dfBeo+7d1ax93xVa23PjLJvlWxjOkpBaC4/e7GXK2qzkR34lrLgFpxSqp7fOkRG3fJ9I
         6L+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwIV+RscOKfrVXksqHvdCxK4U+cllZzGldNKB8/4cfuljpMnc2bScnMCrEvGZd9zgYP5cUHwMxmcM0=@vger.kernel.org
X-Gm-Message-State: AFuF++mJafmkWaRA/hZr8ez5mu0wnuSxQEEFlEi7tfYp+dL593S044V3
	Cvtc9608ko5kfa5hKP1fNB6yRGiIw2DO66jdiLEz4xJBNiLKMYqXCrld
X-Gm-Gg: AYBFou3y2HfWFnP33ilyzpi2CDKi3KtguTgHXejUaqTedfA1PRMKvoLTmAK6ef5Qj91
	tkXG5GnTQmhCU1PBZNN8zxrYqZ+45sVySafoiVmqpvH50ebVG0DDBAKFlIo8WhIBPmblJYT+mLZ
	u8l132Ch/v83t/l0+s0VN1vn7dIKlIrexuYw0L6PEwytqMuBUl9V5SV4iVUMmy8vS/k9WXBkmNL
	lN8aJTOAp1e+r7n0skemoJX64kVhKSR0JtL3JvA8Hqx7F/DVxI5KyMnBFOWUi+gneoXLrfbJ+Ww
	KIkPyjdLoPgeJSAgXmWeDd0qV5K88uBGi4xSJcTfD5UhWzF8ei5nX7DW96FhpDYEId7gH1NCuBA
	Eu4x2LgkWlNC6Fw04jl4nM9RhSQi+/9KeyMkprsmC4x+b8cc8tfcqRsetoGF81ODDoVkv0sZpaR
	M7UBiJQ3bBhaM66teU9m9/SRjfiOqmzLpKf8xaEgGSKHebz26eoyT77C3GXbg7vXkuKigp8UB1I
	riDpZcTjJC/+p30ViUMOpkHWlpeU0DRQRO7IoHmBxEey2VmpAbn73q1o+dBQ1u5hLJxnn1NQC9E
	b9BBbInESix32FHrI6vpYJqU
X-Received: by 2002:a17:90a:d644:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39b26245cfcmr44518484a91.20.1788864581354;
        Tue, 08 Sep 2026 03:49:41 -0700 (PDT)
Received: from rikka.tailabced6.ts.net ([240b:10:ff82:b100:8ce2:c181:4224:d11d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm26456207a91.2.2026.09.08.03.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:49:40 -0700 (PDT)
From: wakasio <scarabeeta@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec 0789:0308 during DVD+RW recording
Date: Tue,  8 Sep 2026 19:49:35 +0900
Message-ID: <20260908104935.13248-1-scarabeeta@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906122750.1c71f176.michal.pecio@gmail.com>
References: <20260906122750.1c71f176.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

Thanks for the link. Bug 220936 looks like the same issue, same board
family (MSI X870E), same controller, same suspend timeout messages.

To answer your question: no device was connected to bus 5 or bus 6 at
any point before it happened. Full sequence from that boot:

  10:59:35.014709 xhci_hcd 0000:77:00.0: xHCI Host Controller
  10:59:35.014756 new USB bus registered, assigned bus number 5
  10:59:35.014848 xhci_hcd 0000:77:00.0: xHCI Host Controller
  10:59:35.014893 new USB bus registered, assigned bus number 6
  10:59:35.014938 Host supports USB 3.2 Enhanced SuperSpeed
  10:59:35.015160 usb usb5: SerialNumber: 0000:77:00.0
  10:59:35.015534 usb usb6: SerialNumber: 0000:77:00.0
  11:00:48.349628 Clearing Run/Stop bit failed -110
  11:00:48.349744 PM: suspend_common(): xhci_pci_suspend returns -110
  11:00:48.349812 can't suspend (hcd_pci_runtime_suspend returned -110)

Nothing else touches bus 5 or bus 6 in between. This was autosuspend
on an idle, empty controller, about 73 seconds after boot.

After that I tried unbind and bind on the PCI device by hand, that
did not recover it either:

  11:03:30.975422 xhci_hcd 0000:77:00.0: remove, state 4
  11:03:30.975812 USB bus 6 deregistered
  11:03:30.976136 Host halt failed, -110
  11:03:30.976262 Host controller not halted, aborting reset.
  11:03:30.976325 USB bus 5 deregistered
  11:03:33.058079 can't setup: -110
  11:03:33.058350 init 0000:77:00.0 fail, -110
  11:03:33.058416 probe with driver xhci_hcd failed with error -110

Only a full reboot brought it back. On the next boot I set
/sys/bus/pci/devices/0000:77:00.0/power/control to "on" before
plugging anything in, and did not see the problem again during that
session. I have not tried leaving it on "auto" again to see if it
happens on its own without that workaround.

Separately, I applied the TRB dump patch on top of the previous two
and reproduced the write failure again. Same pattern as the last two
times: 11 soft-resets then a hard-reset, all 12 Transfer error events
at the same TRB address (this run: ffffd140425178e0) with the same
resid (23552).

The dump itself printed fine, event ring and endpoint ring, about
1061 lines total. I could not tell which dumped entry corresponds to
the failing TRB though. The "Transfer error ... at %px" address is a
kernel virtual address, but dump_ring() prints each TRB using
(u64)seg->dma + offset, which is the DMA address. I do not have a way
to convert between the two from here, so I do not want to guess which
line in the dump is the one that failed.

I have the full dump saved. It is about 1061 lines, too long to paste
directly into this mail. Let me know if you want it pasted anyway, or
sent some other way, or if there is a specific part of it you want
first.

Thanks,
wakasio
