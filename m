Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F0B46D555
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797262; cv=none; b=HjNAEyFVjXNSpZu3jdmzMeVkkTGZ8W72ACPeP3XH8/NNma1dE4rUthNUb6RkoZNTA1uJxbBw++3XFmH0OiKK1gM+ykGqZ6nlLngU6CxwRoqAslEgo+W/tb77c9rZdkLb9+OTt84pCvrNnWdjK3Q3OzPvaZJIryjrRF85RHizZKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797262; c=relaxed/simple;
	bh=7yg7WgszV0u6qvYQzsbMXRSi0jgQj/GC+iPyvh5zAqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPPC8k9/xqNKC42Z70yD9NETRrZn+JBJdXp6yXYqLuvs8LMIlNPRjt9M3TmpUzoKn+ZcqGyE8AFZ8CVG0csTqn/Mt/usJbxijxYs2jCHFr/sTBIODoclJ3MnmSgb5S5bxUaVsedQ1VRIxeTW7gtEBccx7sS6+OeiK+jbDMu+xas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JeWX2P4S; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JeWX2P4S"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so562039a12.1
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791797260; x=1792402060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDXr90I4Mp/V2LyY9TJ2U43WGzZOgE+mNjJL1cCHqJA=;
        b=JeWX2P4SpS/G56Z4uyD2AsiLCkPOJtOgnX0d8onqJCsmTATcpng6vmg2ByaCbjoMgb
         DLn4QBrr7u62FM8zgoYL23dsxqowUhGKp/hQX+u8EEfphqxKOBAfEJyAzvj1NFomnHJG
         nN1t8ufbbLSOlRGalcSHtJ6RsCkItOcsQT+TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797260; x=1792402060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDXr90I4Mp/V2LyY9TJ2U43WGzZOgE+mNjJL1cCHqJA=;
        b=EDoXDNfsZWoyizJ7feQm8sC/5BJox6yHYB2zjrG39xQ9rvyRaqnzEciGoY2m0tsdHG
         5Ejm3sF8l5xKix/8ih/sL+MZwc2NdlMtzzvTdXCsYQUQXOzDUYt4VR5+OLyixlmZFEnn
         IdyY7afl+uC82rDwGWfSvUlzAG+jVQk/9UTToLFhkjeEwRB0r7ZAg4pGDTgGsk1I36vN
         6CfClIR6mmq4Ddhc3oOEnIJMzPr21Or3HZ30slV+yfw+/hwGm5lreD2i67fTnJBXzYk7
         pIKiks73T0uZjl6hn2eGZAMueTSv55/l9kb5e3uZDtCb8iNW6gccLkVgUedsry1q+gHw
         AkmQ==
X-Forwarded-Encrypted: i=1; AKwUvByuRJZ+BsR+thZcZ+Gm+jRioaD5pdQw0VKVWezEs5KGFVXMy+/Rn8ufqke3gwQ4TtyEpT2Ywh18nlU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4S0g5Ng4cxfKrr3XiVZtPQLOIQ6WAvoRBLbUvACAWU6OdJ0wM
	PfHjE8lL2EPwHFdGResNbMdU4ZtfrpBPwe/IX28W8EcyM94eRKH6HxWAHSYW5Gnw3A==
X-Gm-Gg: AYBFou01g0meU/z0druTX7/SMWVXC1eWP9EWpFNBDZ2ns8Rm7ipEZeex66eM0vBBJZW
	FEyYCApbFML0uXMnmDqcCzIL/CpgKYmpiMCBPT8kmp1kLWkJPnwos+PfcLZ3C0eIEziTL1w8Edk
	gLbCtOm5aJqlZ9Z/KetS4DaOq4k1/laKrqAIdACqsVQ5A9bn28z/Q+TudCs+2KlcNo1qiQJBr8C
	cPSTIRjtPgHfKrR5WmwNic6DkBhDSM/IcDvSk3cQ8gJn85zeqa9scSvZSMV9+0WQFh4ft57Jh73
	stn9uWtBe/MDPMw8Zboc+SFF8yXCuZzLk6SgCxB0JsMfalXe6azMNZCBmyCHuCBcy3MRvMHKpny
	q4hMCSAigr7C4nL5zWIg67Nclw/54rh78ecP1+xRgqmOPLBg//9WhEMy3+KwEznODB6JiPoUrKl
	x6Pl8ETPL/vCR429lY+wIzWpz9NEtmvdV+fDoAoItnKbL4pryjvINdd1D+2TS8afc1YT72O8cC4
	qh2wSiAMdS+un2c9m8XG5FCJO1r1DBfMcCmFT3TopJTdw4j/6tFmRA=
X-Received: by 2002:a05:6a21:3418:b0:3de:583e:97ad with SMTP id adf61e73a8af0-3e16bf04c22mr6687300637.62.1791797259847;
        Mon, 12 Oct 2026 02:27:39 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:faa:a1f:d46f:934f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e53f8bsm4117869a12.24.2026.10.12.02.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:27:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v4] usb: hub: Set proper message when usb_hub_create_port_device() fails
Date: Mon, 12 Oct 2026 17:27:24 +0800
Message-ID: <20261012092725.575885-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now when usb_hub_create_port_device() fails, it prints a separate
error message to say which port failed, but otherwise leaves |message|
set to the default "out of memory", which is somewhat misleading.

Set |message| to an error message that is more specific to this error
path instead of using the default "out of memory" message.

Assisted-by: LLM # local reviews
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Print custom error message directly and use generic error message for
  later, instead of using more stack space

Changes since v2:
- Simplify to just using a small buffer on the stack (Alan)

Changes since v1:
- Explicitly track and free the allocated custom error message instead
  of using devm_kasprintf()
- Link to v1:
  https://lore.kernel.org/all/20260728100005.413868-1-wenst@chromium.org/

Sorry Andy, I ended up not using your __free(kfree_const) patch. My LLM
was telling me that it won't work correctly if CONFIG_USB=m.
---
 drivers/usb/core/hub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0e929a4c9fa1..4c85fdf7a233 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1758,6 +1758,7 @@ static int hub_configure(struct usb_hub *hub,
 		if (ret < 0) {
 			dev_err(hub->intfdev,
 				"couldn't create port%d device.\n", i + 1);
+			message = "couldn't create port device";
 			break;
 		}
 	}
-- 
2.56.0.385.gd3acb90ef8-goog

