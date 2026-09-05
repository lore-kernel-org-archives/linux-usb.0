Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBFF32D0EE
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 03:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577852; cv=none; b=hSxKKndfn2WowcGBKLGEcwDBw/N9buR5LOJ3rAgW8ezBzSlP2ZFHEId64vLyvkuv/UdlSXQp/d5hE0pbv0ecyj/EzMIZ4zi2IoaoKWTE0lv/cWJPErKa7o6yy/XB7tDF8MFE/6lIMpuwtpLqErWaRDilogzCTGDI93+YZgSRtxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577852; c=relaxed/simple;
	bh=vdgR4utXbS4WIf13bFEUhjcSZ8JVbzQkU2HH3yVaBDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cM4EzvInsMW92+6Le7XkGcdC5zSlkYfH54S9N8/F6IkFQn9uAid1CG3X62Qf2+n7thJte1mb9suY/HlMIs9uth7b5fYyETT8+o2nbBLuoaf/ltGf2RHKd4LkswTt/rIabShJWhrnaLgypxozF25CQm03k9G5dm57fl0U0v3s9pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNiGHmGM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNiGHmGM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db217a2b2aso11154705ad.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 20:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788577850; x=1789182650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEDx0u/j8mK8gsN+sx6zWxRhPUDYmCXQuIOCg9q59xM=;
        b=BNiGHmGMgS4UTQ15VvXctH8jPmdLLyzN+SGC2jcf2cETxWfBtAXBBqBGawgUgc2plZ
         2RNfKTobzPCyzl3oj5wX2G4SuPm2hF3f7dkpjOxRBPJMIImLijcJyH7DyR8+qZCLHYJg
         2MIImv8SEfY5yNNs9Rh+lolrlDgoamNcQ5jPzip6cdPSbT0uBRzQNeumbA5v+9TqiVDO
         ykuV3FnLXwtxpGY3euroQiRZ/16O4Cr1PbqLvvTu/BAo4dZDDjcgqxKlK6KfenG/qsgQ
         hX9ySYTVqcmy5uE4dMfVhTtVtlnQFDYszFimpYcH8WCRftFqLyzcdvRSH9uqw8I/Zxiw
         Qjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577850; x=1789182650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEDx0u/j8mK8gsN+sx6zWxRhPUDYmCXQuIOCg9q59xM=;
        b=H/NeWC1TfA7JlQgoC5JuLkxJO3AXHRTEiQ6lePzZXeXUFeTMqe1lmQ1ebAJhfFm+z3
         qEmML1tsPwZrGoekG6gRbmemmZz38xT0nN8l2ZcBH/AW0nB/wJ7ifYG8A+Fl9dGXaPqv
         NEjHxWVF0u7RVxyqDZnD95TaMBvh0z967+lb7rhUv4qSMF+5QjSRdAsq0PrGDLnVWyTF
         GYVSwYVqGafwFuEVYmnCm61MOFvmCNMQih78UqlmHxFoRuD0g/MuCcRvLSRPSjn/7Zjc
         n0y06YQlaP+j+50Z90WajRbv5LHIePcPJAXYAMhcvB9BgOxTE4Kv0zTGqMQgZ6IStZIc
         nIsA==
X-Forwarded-Encrypted: i=1; AKwUvBwb0FWy3HIM/Ezu0jvPfrMq4pg4/zztJH73KU4iyY2hslnLx0lyW2cljTf3XEjWuOUlyPctO6xU58o=@vger.kernel.org
X-Gm-Message-State: AFuF++k6ni/rOjTEzs4gX4B5sw4xoQiV7nyefn5DvvOzeqa5q+eZwwUa
	QXi99gp7OA76SIjiFCcY7kM2HQgkNZuwGeFG+ooAQlixSQHVhKVYtNnz
X-Gm-Gg: AYBFou0Axx8999kV7JgmhAb5efk/CSBM0GBLivYuVecHzdr4XkBd86QilTTGC96TPlp
	TaE1gu4nKlRsLqYU8A2Zmyl9qfSPd3yxnRXSHgExRwH1NHw7rgJLr5L872JwP//PhCDxp3BXJWf
	fCRtNUKGivZxLDDEkzlBpTGncfyykgiW+gqI8PAp8YsdCyDaNyJzMwYt2JGezpYqouY8pew4+B5
	5XEBV8EmAWlEJoTke0+eRDw4Y7RffJ49osW9rKgfmltTAOUmf0H7I6+DksVBHdkTmI+VrYMzgYp
	JUjPGcz3BQAnT+DrHfLyHNYmEClU9y5Bh8lc76q6qvS3NzEsymKunu7N9jSGJ3PmPKhhqzLtx3c
	GfE6pHJAPW7jNNi6n0HjoOumch4MXLYEMMdHucp5fpHn37vnmIazhx98NDb3vunJZE3jqrwpnmX
	Hvkqv1c/60dA/etCDYtU8BlakijhZn+E25uIIWDjkvKNw7fllKNwqzM8Zt7n1R3KMWJfU/w0m4b
	F82qJ7oYDIy2Ezn+z3yQLRcy1rZjEwFs9eH2Bpqn6x29N9hZMNQVejL2gLiAHTR1vv5lK7jqXBk
	EqDZVQ+9jS2Z11ShdZJCkI21
X-Received: by 2002:a17:90a:da8f:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-39b26299957mr14761317a91.25.1788577850435;
        Fri, 04 Sep 2026 20:10:50 -0700 (PDT)
Received: from rikka.tailabced6.ts.net ([240b:10:ff82:b100:8ce2:c181:4224:d11d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc090sm13566328a91.4.2026.09.04.20.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:10:49 -0700 (PDT)
From: wakasio <scarabeeta@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec 0789:0308 during DVD+RW recording
Date: Sat,  5 Sep 2026 12:10:11 +0900
Message-ID: <20260905031011.954183-1-scarabeeta@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904203024.52398f1f.michal.pecio@gmail.com>
References: <20260904203024.52398f1f.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

Thanks for the reply, and sorry about the line wrapping. (I did use an
LLM to help translate my report). I'm not a native English speaker, so
please do tell me if anything I write is unclear.

On the cable suggestion: I should clarify that cable/adapter/connector
orientation substitution was already tested quite extensively before
I sent the report (see the "Controlled-variable test matrix" section,
tests 6-14), the original suspect cable turned out to be fine on
every other controller/port, and a completely different known-good
cable+adapter still fails on this specific ASM4242 port. So at this
point I'm fairly confident it isn't the cable itself, though I can't
rule out something specific to the SuperSpeed lanes on this particular
ASM4242 port's physical connector.

I ran the dynamic debug you suggested and reproduced the failure while
it was active. Result:

There were two separate clusters, and they look qualitatively
different:

Cluster 1, right at the very start of the cdrecord invocation
(before any error is visible to userspace), ~45 seconds before the
actual failure:

  Stalled endpoint for slot 1 ep 2
  Hard-reset ep 2, slot 1

repeated 4 times back to back, all within about 1 second. I suspect
this is benign startup housekeeping (drive power calibration / initial
TEST UNIT READY polling by cdrecord) rather than part of the actual
failure mechanism, since a STALL condition is a normal completion code
that requires a Reset Endpoint per spec anyway. Let me know if you
think this is worth digging into further.

Cluster 2, at the exact moment cdrecord reported the write error
(matches the timestamp of "write track data: error after 103088128
bytes" in cdrecord's own log):

  Transfer error for slot 1 ep 3 on endpoint
  Soft-reset ep 3, slot 1
  Transfer error for slot 1 ep 3 on endpoint
  Soft-reset ep 3, slot 1
  Transfer error for slot 1 ep 3 on endpoint
  Soft-reset ep 3, slot 1
  Transfer error for slot 1 ep 3 on endpoint
  Soft-reset ep 3, slot 1
  Transfer error for slot 1 ep 3 on endpoint
  Hard-reset ep 3, slot 1
  usb 6-1: reset SuperSpeed USB device number 2 using xhci_hcd
  xhci_hcd 0000:77:00.0: Stopped on No-op or Link TRB for slot 1 ep 2

So to answer your question directly: it is not constant background
noise throughout the write. It's a single, tight burst of 5 "Transfer
error" events on the same endpoint within about one second. The first
4 were recovered with a soft-reset and the write continued; the 5th
one failed to recover with a soft-reset and escalated to a hard-reset,
which is what triggers the port-level reset that ultimately kills the
transfer (matches the -EPROTO / resid=23552 I described in the
original usbmon capture, that URB is the one hitting this 5th
error).

If it's useful I can capture the full raw dynamic debug log (this was
just the relevant grep) and/or a fresh usbmon capture with this
tracing enabled at the same time, so you can correlate the URB-level
and TRB-level views of the exact same failure. Just let me know what
would help.

Thanks,
wakasio
